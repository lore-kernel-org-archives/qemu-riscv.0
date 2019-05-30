Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hWRfZ-0003is-Ui
	for mharc-qemu-riscv@gnu.org; Thu, 30 May 2019 16:29:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel@sing.id.au>) id 1hWOjt-00051s-Vx
	for qemu-riscv@nongnu.org; Thu, 30 May 2019 13:21:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel@sing.id.au>) id 1hWOjs-00022U-Em
	for qemu-riscv@nongnu.org; Thu, 30 May 2019 13:21:17 -0400
Received: from stingray.exigere.com.au ([162.217.113.74]:39369)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <joel@sing.id.au>) id 1hWOjs-0008WB-7a
	for qemu-riscv@nongnu.org; Thu, 30 May 2019 13:21:16 -0400
Received: from hippo.sing.id.au (exi2311632.lnk.telstra.net [144.139.233.124])
	by stingray.exigere.com.au (OpenSMTPD) with ESMTPSA id 2eb34dec
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
	for <qemu-riscv@nongnu.org>; Fri, 31 May 2019 03:37:26 +1000 (AEST)
Received: from localhost (hippo.sing.id.au [local])
	by hippo.sing.id.au (OpenSMTPD) with ESMTPA id 8a9b0002
	for <qemu-riscv@nongnu.org>; Fri, 31 May 2019 03:20:04 +1000 (AEST)
Date: Fri, 31 May 2019 03:20:04 +1000
From: Joel Sing <joel@sing.id.au>
To: qemu-riscv@nongnu.org
Message-ID: <20190530172003.GY61734@hippo.sing.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 162.217.113.74
X-Mailman-Approved-At: Thu, 30 May 2019 16:29:00 -0400
Subject: [Qemu-riscv] atomic failures on qemu-system-riscv64
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2019 17:21:19 -0000

While working on a Go (www.golang.org) port for riscv, I've run
into issues with atomics (namely LR/SC) on qemu-system-riscv64.
There are several reproducers for this problem including (using
gcc builtin atomics):

  https://gist.github.com/4a6f656c/8433032a3f70893a278259f8108aad90

And a version using inline assembly:

  https://gist.github.com/4a6f656c/d883091f5ca811822720213be343a75a

Depending on the qemu configuration the number of threads may
need increasing (to force context switching) and/or run in a
loop. Go's sync/atomic tests also fail regularly.

Having dug into the qemu code, what I believe is happening is
along the lines of the following:

1. Thread 1 runs and executes an LR - this assigns an address
   to load_res and a value to load_val (say 1).

2. A context switch occurs and thread 2 is now run - it runs
   an LR and SC on the same address modifying the stored value.
   Another LR is executed loading load_val with the current
   value (say 3).

3. A context switch occurs and thread 1 is now run again, it
   continues on its LR/SC sequence and now runs the SC instruction.
   This is based on the assumption that it had a reservation
   and the SC will fail if the memory has changed. The underlying
   implementation of SC is a cmpxchg with the value in load_val
   - this no longer has the original value and hence successfully
   compares (as does the tcg_gen_setcond_tl() between the returned
   value and load_val) thus the SC succeeds when it should not.

The diff below clears load_res when the mode changes - with this
applied the reproducers work correctly, as do Go's atomic tests.
I'm not sure this "fix" is 100% correct, but it certainly verifies
where the problem lies. It does also fall inline with the RISCV
spec:

"The SC must fail if there is an observable memory access from
another hart to the address, or if there is an intervening context
switch on this hart, or if in the meantime the hart executed a
privileged exception-return instruction."

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b17f169681..9875b8e5d3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -113,6 +113,8 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
     }
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv = newpriv;
+
+    env->load_res = 0;
 }
 
 /* get_physical_address - get the physical address for this virtual address

