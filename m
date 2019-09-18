Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbs0-0006Qg-LD
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49047)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrv-0006Jg-0d
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrt-0006R9-Al
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:46 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38490)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbrt-0006Qa-55
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:45 -0400
Received: by mail-pl1-f193.google.com with SMTP id w10so118221plq.5
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=VVLPooXrObjSXN8iGYUKJfx4X6XcaPyBT78UkS+kalU=;
 b=IYHerjLUuvvq7abkv6zjnRFNPpJl+WVJT2FtORQoIZo62UVlw5seql/7Tz8Z4EE21u
 pWyoMVHXN1yp/eY6oIdJu4wGbt98OeV7f++r7RVLkWW9e520Qy4vYKXAKVM/8WCt/zTR
 eGQovo8g/WoIDctBmxzHFhW2XQStk5rENXSBcR2NlvpYHtRaCbuXP37Ez43UjNXGI9PO
 hqbTWb03PWeuFI8Tx6IVZOyNh3zsdhizST8F5hygEdKzuOxZMgeeHi5NZxupIAjbWA2c
 8ZRNDkIRG3i/3bFtnsBOBJnsJBmoh8Ta0BWTmy4a9HNc5++YOoXixvrQpnOwCOJHqaoP
 Xz9g==
X-Gm-Message-State: APjAAAUarqVxnQ+ghKlVUKnLEvKDrJToc3h8g/NopNTMRW494251FAjs
 tqdSCpQxhHoQkLGYJ3iKmSm6Y0a0xDg=
X-Google-Smtp-Source: APXvYqy6PkOxvhDwNA3xxLsTYajXy0Aq+4qjgEpPuuVXWdLmpOQV4X2gitlBK9bs8ECjkC34DjTMWw==
X-Received: by 2002:a17:902:14b:: with SMTP id
 69mr4764566plb.286.1568820463602; 
 Wed, 18 Sep 2019 08:27:43 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 196sm11116534pfz.99.2019.09.18.08.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:27:43 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:55:59 -0700
Message-Id: <20190918145640.17349-8-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, 
 Christophe de Dinechin <dinechin@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.193
Subject: [Qemu-riscv] [PULL 07/48] target/riscv: Create function to test if
 FP is enabled
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
X-List-Received-Date: Wed, 18 Sep 2019 15:27:50 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Let's create a function that tests if floating point support is
enabled. We can then protect all floating point operations based on if
they are enabled.

This patch so far doesn't change anything, it's just preparing for the
Hypervisor support for floating point operations.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.h        |  6 +++++-
 target/riscv/cpu_helper.c | 10 ++++++++++
 target/riscv/csr.c        | 20 +++++++++++---------
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 18d91d0920..16efe8c860 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -255,6 +255,7 @@ void riscv_cpu_do_interrupt(CPUState *cpu);
 int riscv_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
+bool riscv_cpu_fp_enabled(CPURISCVState *env);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
@@ -298,7 +299,10 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 #ifdef CONFIG_USER_ONLY
     *flags = TB_FLAGS_MSTATUS_FS;
 #else
-    *flags = cpu_mmu_index(env, 0) | (env->mstatus & MSTATUS_FS);
+    *flags = cpu_mmu_index(env, 0);
+    if (riscv_cpu_fp_enabled(env)) {
+        *flags |= env->mstatus & MSTATUS_FS;
+    }
 #endif
 }
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e32b6126af..96373b67d8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -71,6 +71,16 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 #if !defined(CONFIG_USER_ONLY)
 
+/* Return true is floating point support is currently enabled */
+bool riscv_cpu_fp_enabled(CPURISCVState *env)
+{
+    if (env->mstatus & MSTATUS_FS) {
+        return true;
+    }
+
+    return false;
+}
+
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
 {
     CPURISCVState *env = &cpu->env;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e0d4586760..2789215b5e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -46,7 +46,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 static int fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -1;
     }
 #endif
@@ -108,7 +108,7 @@ static int pmp(CPURISCVState *env, int csrno)
 static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -1;
     }
 #endif
@@ -119,7 +119,7 @@ static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -1;
     }
     env->mstatus |= MSTATUS_FS;
@@ -131,7 +131,7 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
 static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -1;
     }
 #endif
@@ -142,7 +142,7 @@ static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -1;
     }
     env->mstatus |= MSTATUS_FS;
@@ -154,7 +154,7 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
 static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -1;
     }
 #endif
@@ -166,7 +166,7 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -1;
     }
     env->mstatus |= MSTATUS_FS;
@@ -307,6 +307,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
 {
     target_ulong mstatus = env->mstatus;
     target_ulong mask = 0;
+    int dirty;
 
     /* flush tlb on mstatus fields that affect VM */
     if (env->priv_ver <= PRIV_VERSION_1_09_1) {
@@ -340,8 +341,9 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
-    int dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
-                ((mstatus & MSTATUS_XS) == MSTATUS_XS);
+    dirty = (riscv_cpu_fp_enabled(env) &&
+             ((mstatus & MSTATUS_FS) == MSTATUS_FS)) |
+            ((mstatus & MSTATUS_XS) == MSTATUS_XS);
     mstatus = set_field(mstatus, MSTATUS_SD, dirty);
     env->mstatus = mstatus;
 
-- 
2.21.0


