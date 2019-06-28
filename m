Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgul3-00008D-GB
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54679)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgukd-0008JM-6K
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgukW-0000GP-CR
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:30 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42919)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgukW-0008S9-5i
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:24 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so3320087pff.9
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=88zslYUcPLzZ8t2plNr1KKUO0CCDFAsO4z2B6UJDjVI=;
 b=OJA7RrLNDM3PTZq1J66nmCpe+xJTj5heii5MU/4okzZZsbiwJPhm5rjvtq+/D+dBpv
 oyOLWDXXUc2frBDODA/EFDUX8C6WWh6x06uXSaS6x1OvDdKMig1T+5p6uEoVSj3BQ2QL
 rUqsLlKO5rut8XfBbcUFBHJaU7PwDZJ6LY4hap971dnXbvQqOJRJjngDNhjEckX4cOJP
 S4aJLb7y/GTKSTUoMo4zs9lFg4K9cSf0eAiaFVDObiTyEngFEUb8X7Vj8o4fSp5FgZdz
 IS+G4arf3fZlyBSqORdopz9hCveNxuQkLTxPs5ryM/oYRqCfdPcV9+VLoD2qbiZ+XQPo
 j24A==
X-Gm-Message-State: APjAAAXlja4Kpr0Uv/MNrP4Bk6w5Uk04QVCC46GgaOU22ujcu73EO44d
 7KtDivM7U//8cLd1S4yKlmZOSg==
X-Google-Smtp-Source: APXvYqxePc/p0yrWABkWC4QdEEqcbwU7m4RiwKsHFOYAiP1bEqNVxjDnp9F/HPt4HpKP9jZNfRDNVQ==
X-Received: by 2002:a17:90a:270f:: with SMTP id
 o15mr14523677pje.56.1561743180223; 
 Fri, 28 Jun 2019 10:33:00 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id o26sm2148781pgv.47.2019.06.28.10.32.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:32:59 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:00 -0700
Message-Id: <20190628173227.31925-8-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.193
Subject: [Qemu-riscv] [PULL 07/34] RISC-V: Check for the effective memory
 privilege mode during PMP checks
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:36 -0000

From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>

The current PMP check function checks for env->priv which is not the effective
memory privilege mode.

For example, mstatus.MPRV could be set while executing in M-Mode, and in that
case the privilege mode for the PMP check should be S-Mode rather than M-Mode
(in env->priv) if mstatus.MPP == PRV_S.

This patch passes the effective memory privilege mode to the PMP check.
Functions that call the PMP check should pass the correct memory privilege mode
after reading mstatus' MPRV/MPP or hstatus.SPRV (if Hypervisor mode exists).

Suggested-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_helper.c | 10 +++++++++-
 target/riscv/pmp.c        |  6 +++---
 target/riscv/pmp.h        |  2 +-
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ffbfaf433268..71b8123b1019 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -427,19 +427,27 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     int prot;
     bool pmp_violation = false;
     int ret = TRANSLATE_FAIL;
+    int mode = mmu_idx;
 
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
 
     ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx);
 
+    if (mode == PRV_M && access_type != MMU_INST_FETCH) {
+        if (get_field(env->mstatus, MSTATUS_MPRV)) {
+            mode = get_field(env->mstatus, MSTATUS_MPP);
+        }
+    }
+
     qemu_log_mask(CPU_LOG_MMU,
                   "%s address=%" VADDR_PRIx " ret %d physical " TARGET_FMT_plx
                   " prot %d\n", __func__, address, ret, pa, prot);
 
     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
         (ret == TRANSLATE_SUCCESS) &&
-        !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type)) {
+        !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type,
+        mode)) {
         pmp_violation = true;
         ret = TRANSLATE_FAIL;
     }
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index e0fe2064074a..5944f4cb6607 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -228,7 +228,7 @@ static int pmp_is_in_range(CPURISCVState *env, int pmp_index, target_ulong addr)
  * Check if the address has required RWX privs to complete desired operation
  */
 bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
-    target_ulong size, pmp_priv_t privs)
+    target_ulong size, pmp_priv_t privs, target_ulong mode)
 {
     int i = 0;
     int ret = -1;
@@ -264,7 +264,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
             }
 
             allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
-            if ((env->priv != PRV_M) || pmp_is_locked(env, i)) {
+            if ((mode != PRV_M) || pmp_is_locked(env, i)) {
                 allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
             }
 
@@ -280,7 +280,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
 
     /* No rule matched */
     if (ret == -1) {
-        if (env->priv == PRV_M) {
+        if (mode == PRV_M) {
             ret = 1; /* Privileged spec v1.10 states if no PMP entry matches an
                       * M-Mode access, the access succeeds */
         } else {
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index 66790950eb75..8e19793132db 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -59,6 +59,6 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     target_ulong val);
 target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
 bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
-    target_ulong size, pmp_priv_t priv);
+    target_ulong size, pmp_priv_t priv, target_ulong mode);
 
 #endif
-- 
2.21.0


