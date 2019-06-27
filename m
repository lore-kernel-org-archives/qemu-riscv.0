Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWHW-00039D-0O
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60983)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWGz-00023L-Ud
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWGn-0007qR-C7
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:12 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34151)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWGm-0006gL-0z
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:05 -0400
Received: by mail-pl1-f195.google.com with SMTP id i2so1492525plt.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=88zslYUcPLzZ8t2plNr1KKUO0CCDFAsO4z2B6UJDjVI=;
 b=P4eTOCqrvpbCKfOtIjg5P30EziwfLi+kXtgaUIzTSnE62U+sau7SJEn7pbmf1/kxSm
 siFazXh36NgB6yDg1p3ocouOLCFl0UmC97oE60ZoTbUomgDFzdRRns71aKahaXWCEzUL
 ewQfVt60InkvALq7A6f5REVdy7Wr++nF0Ytzwmp4Us7tkS2c4yn3nDWN2BGYm8F2rsSG
 TEChD/Kv1bcpwe0vtumlXC5Wx/kkljRF2pGBpz7ZGVyhdJICDPqm+AlQ9itgd7e1CKdN
 6FD9QK3Py98AVMVs2ZEcVCBbCwiZARFtkNbSdIcPKTSLX1mcJo4Qucey5cR7i1j7Gh3j
 vOEw==
X-Gm-Message-State: APjAAAUazg0deIK2IoS0R1961VGPb42jIOtGL+wWNOuZD5Q8ai2+AeDH
 B+uK6C/3BRxmICKEqUF7xkWrNQuFg5I6ng==
X-Google-Smtp-Source: APXvYqzfYJMkURulSsXl5tjWUD75OA2vhPy3ZvA/dEdMimihJ4Cy0ZlHAntJAM8QtQyj57rBifNmUQ==
X-Received: by 2002:a17:902:2a27:: with SMTP id
 i36mr5241418plb.161.1561649019753; 
 Thu, 27 Jun 2019 08:23:39 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id q126sm5110291pfq.123.2019.06.27.08.23.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:23:39 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:44 -0700
Message-Id: <20190627152011.18686-8-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.195
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
X-List-Received-Date: Thu, 27 Jun 2019 15:25:31 -0000

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


