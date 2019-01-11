Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gi1Cj-0008SC-O2
	for mharc-qemu-riscv@gnu.org; Fri, 11 Jan 2019 13:06:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gi1Cg-0008QC-AP
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 13:06:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gi1Ce-0002dz-Ct
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 13:06:46 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:41334)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gi1Ce-0002bX-5v
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 13:06:44 -0500
Received: by mail-pg1-x533.google.com with SMTP id m1so6619910pgq.8
	for <qemu-riscv@nongnu.org>; Fri, 11 Jan 2019 10:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=25DrlostMl53bKZZKWDtpDrtjnQ/9J8kol06XrENVUA=;
	b=hXusvXtq8eI5cLoqHOUwSfozR4P6qIcz6uMqf6r9w+1/+LGKHqVv5llfg+64KVE9Nf
	sIr7kjnsW7Pqm9TiecMDYNZ1Y+gUnBNLqjWqESjyx+w5PCgmlgGrHsfJwlohgOlyJFPE
	miibHtotlH/rElZ/Pm+Dngoh2Qu90fApwbEkc1kZ/YlxW3Btz6blL6fHYBAJMicqPaPK
	7EfURZ7Bi3wAOyRA8cwf51QjcVBct3PFNApb00DIINm4osfmsZWGBi4ymqRa0EUAQ5cq
	u+XElfRsOjlSuQCQDDm7aZ5GDa1G4RC03Ac16aNjvgmwuCjXO1buAyjg7szHXmLzDqeO
	OfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=25DrlostMl53bKZZKWDtpDrtjnQ/9J8kol06XrENVUA=;
	b=UATsFul+17y+4PYL5QzmXfgsZQKfSLLJd4etQXyWmVvndYPCaSW7Lf/yl5XGsYVw4H
	moKseSJmIR6C1QhYkrKU9e2igHqvvLSQXZXf0TQA5HLWdL5TzzDlAVK4DXw3ECXNghGY
	g36LZkwWeOZeobUVK6LX6UBSLZhHP6PQcS+x4+nfRohr35QjXkxU7rVHBmdqn8JMd809
	RdthKWGk4gQ8Q7FiEWZ/f0fvFGWrtWEcOYJ8gzyAVWmxrF73Tgwf2EYWozfKT5mPOlnc
	FQ2Nb98VZeFM4ovXopIqulbOiwBZ4MNj7OqeIZDfc0mK6dCNP5sdKgw3vAqXBUF20aVw
	ky6g==
X-Gm-Message-State: AJcUukdrBoAnYnyTqNDCCQBqM1QTFycFXk7v8KmNYz2CTpt0KbwFIksq
	UwUBoD6ESDn2+0AlkJB2Z7mzBTIZ61k=
X-Google-Smtp-Source: ALg8bN75vci3as4IuxqnjJgLyDZRUp02hgZpsy48cu5q3EL7XXIw8KEhodCBfQAQyXecpG5EiEzfwQ==
X-Received: by 2002:a63:c0f:: with SMTP id b15mr14397689pgl.314.1547230000969; 
	Fri, 11 Jan 2019 10:06:40 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	t67sm155709907pfd.90.2019.01.11.10.06.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 10:06:39 -0800 (PST)
Date: Fri, 11 Jan 2019 10:06:28 -0800
Message-Id: <20190111180630.6433-3-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190111180630.6433-1-palmer@sifive.com>
References: <20190111180630.6433-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::533
Subject: [Qemu-riscv] [PULL 2/4] RISC-V: Implement atomic mip/sip CSR updates
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
X-List-Received-Date: Fri, 11 Jan 2019 18:06:48 -0000

From: Michael Clark <mjc@sifive.com>

Use the new CSR read/modify/write interface to implement
atomic updates to mip/sip.

Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/csr.c | 56 +++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b61b0ef37971..44ea8b7cb6e8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -487,25 +487,31 @@ static int write_mbadaddr(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
-static int read_mip(CPURISCVState *env, int csrno, target_ulong *val)
-{
-    *val = atomic_read(&env->mip);
-    return 0;
-}
-
-static int write_mip(CPURISCVState *env, int csrno, target_ulong val)
+static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                   target_ulong new_value, target_ulong write_mask)
 {
     RISCVCPU *cpu = riscv_env_get_cpu(env);
+    target_ulong mask = write_mask & delegable_ints;
+    uint32_t old_mip;
+
+    /* We can't allow the supervisor to control SEIP as this would allow the
+     * supervisor to clear a pending external interrupt which will result in
+     * lost a interrupt in the case a PLIC is attached. The SEIP bit must be
+     * hardware controlled when a PLIC is attached. This should be an option
+     * for CPUs with software-delegated Supervisor External Interrupts. */
+    mask &= ~MIP_SEIP;
+
+    if (mask) {
+        qemu_mutex_lock_iothread();
+        old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
+        qemu_mutex_unlock_iothread();
+    } else {
+        old_mip = atomic_read(&env->mip);
+    }
 
-    /*
-     * csrs, csrc on mip.SEIP is not decomposable into separate read and
-     * write steps, so a different implementation is needed
-     */
-
-    qemu_mutex_lock_iothread();
-    riscv_cpu_update_mip(cpu, MIP_SSIP | MIP_STIP,
-                         (val & (MIP_SSIP | MIP_STIP)));
-    qemu_mutex_unlock_iothread();
+    if (ret_value) {
+        *ret_value = old_mip;
+    }
 
     return 0;
 }
@@ -623,17 +629,11 @@ static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
-static int read_sip(CPURISCVState *env, int csrno, target_ulong *val)
-{
-    *val = atomic_read(&env->mip) & env->mideleg;
-    return 0;
-}
-
-static int write_sip(CPURISCVState *env, int csrno, target_ulong val)
+static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                   target_ulong new_value, target_ulong write_mask)
 {
-    target_ulong newval = (atomic_read(&env->mip) & ~env->mideleg)
-                          | (val & env->mideleg);
-    return write_mip(env, CSR_MIP, newval);
+    return rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
+                   write_mask & env->mideleg);
 }
 
 /* Supervisor Protection and Translation */
@@ -812,7 +812,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MEPC] =                { read_mepc,        write_mepc        },
     [CSR_MCAUSE] =              { read_mcause,      write_mcause      },
     [CSR_MBADADDR] =            { read_mbadaddr,    write_mbadaddr    },
-    [CSR_MIP] =                 { read_mip,         write_mip         },
+    [CSR_MIP] =                 { NULL,     NULL,     rmw_mip         },
 
     /* Supervisor Trap Setup */
     [CSR_SSTATUS] =             { read_sstatus,     write_sstatus     },
@@ -825,7 +825,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_SEPC] =                { read_sepc,        write_sepc        },
     [CSR_SCAUSE] =              { read_scause,      write_scause      },
     [CSR_SBADADDR] =            { read_sbadaddr,    write_sbadaddr    },
-    [CSR_SIP] =                 { read_sip,         write_sip         },
+    [CSR_SIP] =                 { NULL,     NULL,     rmw_sip         },
 
     /* Supervisor Protection and Translation */
     [CSR_SATP] =                { read_satp,        write_satp        },
-- 
2.18.1


