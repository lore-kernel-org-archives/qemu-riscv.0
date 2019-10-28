Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP7Pt-0005qM-D7
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 11:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34905)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7Pp-0005gv-2d
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7Pm-00040X-SY
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:44 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34400)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7Pm-0003zw-Me
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:42 -0400
Received: by mail-pg1-x532.google.com with SMTP id e4so2866976pgs.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=EXsNj6jZsB30XB6MiD6tWhEVGfazwqhX650sA5CbspM=;
 b=kTSzec3deeQ+znpySCdUaFjHmsOHPTciHd1teZLlHzVc0RozDMsU1KvyDLogXAhVul
 nes7HT6YBwbhI2lt4a35dy4ETyW4uIjW9CdXAvFKQjEABXJxJr3s7DPgF9vzO9C+s/Ps
 /3gFFGxi4KED3+/K85slC3BJOWjU38A+qCTyUoNyWDQVZJNsdZNnij1IK9AiRK7TO3FD
 FuePB4DBrce9I8cG5EzG0PXEogjL4rbTWIJOm4NedNDHLX0mjiNtGh19Q6l31A5ZRrqr
 qqkhV7cAPYVl4vDZI3HWDtBMY/mLszVWbRbTdYHX0VVjiaRtuGWE5zXjI7hC6BbH6fX/
 /WeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=EXsNj6jZsB30XB6MiD6tWhEVGfazwqhX650sA5CbspM=;
 b=J28O9pvoq+ejRK2E8Tiqyae0+Dz1qtUhrp3Xn+bTya9mKJfCKqHN5nBGgZiNRnDLq8
 WM6hfOecDyZZPTbrQ6wj7PJEOnmumkVwVW1To18KgwJlLLGxjM+MesdpYlOriO9hmVgQ
 S7xIMargHs/r1guQNAZKlKNQnRFv6nosFweFHLSFBqDpk+pCPrTLgozVWsRdMqWKpJNE
 VlvFccq0RM9jx3ymn8q0SsbKhWnQPFQSWYUnTTDw5vunYKgyZHA/umQuRtlnxJSZkxNq
 aXe9zZIt3gFJAG2KFjMkqqZW7LwHwkl1GNW+kwtXQ6qJjfAVmtxd7A7MV53XOQhYaKwo
 9K/A==
X-Gm-Message-State: APjAAAW+VdMLYB1l+f1PEZiNuUedMCNSiCsUUpNohj7E86qtJ+JAtaa4
 6eorH6lYyA/rn5OVckvMN9oEDQ==
X-Google-Smtp-Source: APXvYqxu1f0nOZ+sv2iQGasuO3QyMFl7q1T1dUZSah6XNLCC+tIOTc18nNq/Z7oNB9nfta3k5P2yJA==
X-Received: by 2002:a17:90a:854c:: with SMTP id a12mr17883pjw.2.1572278321633; 
 Mon, 28 Oct 2019 08:58:41 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r81sm12836029pgr.17.2019.10.28.08.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:40 -0700 (PDT)
Subject: [PULL 14/18] target/riscv: Tell gdbstub the correct number of CSRs
Date: Mon, 28 Oct 2019 08:48:58 -0700
Message-Id: <20191028154902.32491-15-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
References: <20191028154902.32491-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Jonathan Behrens <jonathan@fintelia.io>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::532
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Oct 2019 15:58:47 -0000

From: Jonathan Behrens <jonathan@fintelia.io>

If the number of registers reported to the gdbstub code does not match the
number in the associated XML file, then the register numbers used by the stub
may get out of sync with a remote GDB instance.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index ded140e8d8..cb5bfd3d50 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -384,7 +384,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     }
 
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             4096, "riscv-32bit-csr.xml", 0);
+                             240, "riscv-32bit-csr.xml", 0);
 #elif defined(TARGET_RISCV64)
     if (env->misa & RVF) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
@@ -392,6 +392,6 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     }
 
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             4096, "riscv-64bit-csr.xml", 0);
+                             240, "riscv-64bit-csr.xml", 0);
 #endif
 }
-- 
2.21.0


