Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiapT-0005jE-Cx
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51218)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapQ-0005Zx-3d
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapO-0006VB-Ol
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:24 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35049)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapO-0006SB-FK
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:22 -0400
Received: by mail-lf1-f66.google.com with SMTP id p197so1171717lfa.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=88zslYUcPLzZ8t2plNr1KKUO0CCDFAsO4z2B6UJDjVI=;
 b=riIVnE9DXNjEnOinW9FTJT7btDmO02MnJFz1SaB+EiOJ7JhtP6pJmy4ogabdZVFis5
 YVOlEeShOr31GZNeQr4W9KCBbGoLk4P1gcRSEde77IiQ5J76NQMuQLT/J3d9PZmkuPEV
 VtsTSgi0DN2j5CIxBKcYqeV4wEa94eyscZycVWko4krTOCHHdPQaTJhc0ZPadUMcu7fF
 t4baKMzjxdnCROwFbi5NM/qfeiVzYQK0ustsrAUE/6Rm1/YUWx5VhaUgIFezl1hyD3Vb
 v5AXF/YZ6rdBX7Tn3LoRz/jqNgLuviNJIVo6UbtiIJS5BiSTtkEapCinCtEU2z9VzyrR
 hubw==
X-Gm-Message-State: APjAAAVmyKwjjrXvMuQatCIXvIsjE1oojq86KlWjhR3YMAoElGA32xTO
 9cUm+SjQwiXqyz3CdfWgID3yRg==
X-Google-Smtp-Source: APXvYqziUEKcQArGEciHLZgK7Z2l0Cnkn+34g1Wi/ZNvxZtCTpeZLjiRJ3rYhJzIhZ3ixX7XCUUzvA==
X-Received: by 2002:ac2:598d:: with SMTP id w13mr5414777lfn.165.1562143281036; 
 Wed, 03 Jul 2019 01:41:21 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id n187sm293969lfa.30.2019.07.03.01.41.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:20 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:23 -0700
Message-Id: <20190703084048.6980-8-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
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
X-Received-From: 209.85.167.66
Subject: [Qemu-riscv] [PULL 07/32] RISC-V: Check for the effective memory
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
X-List-Received-Date: Wed, 03 Jul 2019 08:41:25 -0000

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


