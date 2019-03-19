Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6EU8-0007kD-IC
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:08:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EU6-0006q1-QG
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:08:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGT-000569-Rn
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:46 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46312)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGT-00052B-L7
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:45 -0400
Received: by mail-pf1-x42c.google.com with SMTP id s23so13603720pfe.13
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=ktAf58N8r7P+0jH0YNQ8MB1Y2sxNcEFpO/9V6VhkFxA=;
	b=UgRc+4ld/uBvlqJXt7SovMLvEUXEdy4+fn73BiyTR58gcFbgsieKZgcEbtxeFMEe7e
	AaxW1dcH6Px2oIOoRH9jd1xd0+QWDOFrmUzyKrvBC01Tv0kMbCRDWnDptZj8GhPQ7BPN
	Qx2tJvApMDM0Jfb1xLUJ6zeaTXNYDb/5PeJu6c96wHbkdW4+05J1ykTJhTb8CxvhcF0S
	f2A08TeGoL5n4LQxdyl8MEjAIHxnnLv6qTolz4WW1ZpdmrRKWpGrxTbdrV6v0ZTmJVI8
	5BHCyf64YKYF6p2cf3Vijo3xB/nI0Ux2NsUGkqHcqEG2KFQAm+oJpRCZZe8i4N1cf9IM
	cOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=ktAf58N8r7P+0jH0YNQ8MB1Y2sxNcEFpO/9V6VhkFxA=;
	b=stnuc5ZFcoSs5ccfdUayTJaCEq6TN4bWn9sflCqfnqvm5dp3ub7V01vXNnLftFEt7S
	h7q10Ryx7r8lpASgKZVX4HFuHVYlhZE+QEYvTnV97kgpFrceRne+JBZelqYCTvByoWZa
	hFSBRUMtpCxO/JqQtsbKMj/SOKcM+v/Yb0Ccut4fYrN8DWPnT8PQdojFvwEIj2Q7Ozgk
	siIOesFG1wIQ/oDY0eM/ZHKh/sw0JTmxmvPjifIioeCGxfbmWIo2L8BlgilqYv70nGGv
	2jn+0JlVUNoRBRe8BeKTu8Rix8PNkHDF89MMK0AT/wnmVkWCaAheWxh73blbBl8gZ47k
	CWJA==
X-Gm-Message-State: APjAAAVZG6UOr4Nkf3zfFLRoAGvwuzxad2Gppah4vL7FCmqJLBRyJDLb
	piK3vqNnpAw3cU1B3be/c5KzGPF5QWsqaSjl
X-Google-Smtp-Source: APXvYqyaOE19iOlj2RWSF51uaGC6yQbhRAFsqKD9oiT4fI+d0FcyDFXovrzcAAF0Rt7JE98jV2C4GQ==
X-Received: by 2002:a17:902:b217:: with SMTP id
	t23mr1967594plr.184.1553000084436; 
	Tue, 19 Mar 2019 05:54:44 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	y20sm12488179pfn.3.2019.03.19.05.54.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:43 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:47:55 -0700
Message-Id: <20190319124803.13826-12-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Kito Cheng <kito.cheng@gmail.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	Michael Clark <mjc@sifive.com>, Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42c
Subject: [Qemu-riscv] [PULL 11/19] RISC-V: linux-user support for RVE ABI
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
X-List-Received-Date: Tue, 19 Mar 2019 13:08:51 -0000

From: Kito Cheng <kito.cheng@gmail.com>

This change checks elf_flags for EF_RISCV_RVE and if
present uses the RVE linux syscall ABI which uses t0
for the syscall number instead of a7.

Warn and exit if a non-RVE ABI binary is run on a
cpu with the RVE extension as it is incompatible.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Co-authored-by: Kito Cheng <kito.cheng@gmail.com>
Co-authored-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 linux-user/riscv/cpu_loop.c | 15 ++++++++++++++-
 target/riscv/cpu.h          |  4 ++++
 target/riscv/cpu_user.h     |  3 ++-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 4cf3e9463240..a9bac4ca79d8 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -18,8 +18,10 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "elf.h"
 
 void cpu_loop(CPURISCVState *env)
 {
@@ -53,7 +55,8 @@ void cpu_loop(CPURISCVState *env)
                 ret = 0;
             } else {
                 ret = do_syscall(env,
-                                 env->gpr[xA7],
+                                 env->gpr[(env->elf_flags & EF_RISCV_RVE)
+                                    ? xT0 : xA7],
                                  env->gpr[xA0],
                                  env->gpr[xA1],
                                  env->gpr[xA2],
@@ -113,6 +116,16 @@ void cpu_loop(CPURISCVState *env)
 
 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
+    CPUState *cpu = ENV_GET_CPU(env);
+    TaskState *ts = cpu->opaque;
+    struct image_info *info = ts->info;
+
     env->pc = regs->sepc;
     env->gpr[xSP] = regs->sp;
+    env->elf_flags = info->elf_flags;
+
+    if ((env->misa & RVE) && !(env->elf_flags & EF_RISCV_RVE)) {
+        error_report("Incompatible ELF: RVE cpu requires RVE ABI binary");
+        exit(EXIT_FAILURE);
+    }
 }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index df43a0898d65..20bce8742ee9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -123,6 +123,10 @@ struct CPURISCVState {
 
     uint32_t features;
 
+#ifdef CONFIG_USER_ONLY
+    uint32_t elf_flags;
+#endif
+
 #ifndef CONFIG_USER_ONLY
     target_ulong priv;
     target_ulong resetvec;
diff --git a/target/riscv/cpu_user.h b/target/riscv/cpu_user.h
index c2199610abff..52d380aa98c2 100644
--- a/target/riscv/cpu_user.h
+++ b/target/riscv/cpu_user.h
@@ -10,4 +10,5 @@
 #define xA4 14
 #define xA5 15
 #define xA6 16
-#define xA7 17  /* syscall number goes here */
+#define xA7 17  /* syscall number for RVI ABI */
+#define xT0 5   /* syscall number for RVE ABI */
-- 
2.19.2


