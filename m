Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769C3C5AD4C
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 09:12:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r65lB-000600-BB; Thu, 23 Nov 2023 04:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1r65l8-0005zL-NV; Thu, 23 Nov 2023 04:12:31 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1r65l6-0000FN-Mo; Thu, 23 Nov 2023 04:12:30 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com E5E77C0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1700730742;
 bh=fqEB+XnNjzwadFp8pdCn5WUq1BZ6k0jmhu3L43yvSic=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=etyAY4R+iwNm3UWn3j24y7hpeE96602E45SAlSwl7CEMlCM+HKTvFu0QlMhEo9eAm
 bJvi5Ht+HeKYNibMreLNfENG22Etv3zQVmYcgSGzEY5STe180OqQrKlSU551lh+BUm
 qo3+mPQnAavuvU/eKoFgKm39zXT9cGWCPl65yDx577rS+ktn7BPtcxIZr9z0HXvNa0
 EFXMnq+LqkIaUVDIY2GFyc5ak7rMis8gijgNe79KeqBOVCMULoCQr8W/kVoGSWKFIF
 4PqRgOtmyYyZ9CyB2mvkCxgr+h4lJsO47QKv1VW4+p24TwnoBoPFdtsXyvymY+XNvF
 2Fg8j0tB11cvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1700730742;
 bh=fqEB+XnNjzwadFp8pdCn5WUq1BZ6k0jmhu3L43yvSic=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=evxafABYS3lPm4QePdidDwPAbjP2pE0PieXUuYN67/TmH1oZyMGsu6dQ5OjJlvZ2F
 zoYbGflkjbGPpjrdvCHI8V/H94m8a6dYQVZCFEzCKl1FS9JbsQ6XWf0grEeKtz8Z7a
 p4QPsCfuJ0xSNlMbD9UELN++GGAp4y2vgV2JeSVHrJETE52XNkRzVu3dpmIBWQP3Ig
 Ubrdes36OWdETcokWXZI/6DuK2vbE0CTcf8mABSlid5YquJrjJhdVqJoNnvGDArGnr
 6HJnmW23yPRBMBGUwy8yKJPZxj7nIWJZe3hXNE7vMaeV4VZBh+lvsRLkN6zNQ2eaXI
 REF2opX/IW7zA==
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <palmer@dabbelt.com>, <alistair.francis@wdc.com>, 
 <bin.meng@windriver.com>, <liwei1518@gmail.com>,
 <dbarboza@ventanamicro.com>, 
 <zhiwei_liu@linux.alibaba.com>, Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH 1/1] target/riscv/pmp: Use hwaddr instead of target_ulong for
 RV32
Date: Thu, 23 Nov 2023 12:12:14 +0300
Message-ID: <20231123091214.20312-1-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-06.corp.yadro.com (172.17.10.110) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=ivan.klokov@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The Sv32 page-based virtual-memory scheme described in RISCV privileged
spec Section 5.3 supports 34-bit physical addresses for RV32, so the
PMP scheme must support addresses wider than XLEN for RV32. However,
PMP address register format is still 32 bit wide.

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
---
 target/riscv/pmp.c | 26 ++++++++++++--------------
 target/riscv/pmp.h |  8 ++++----
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 162e88a90a..dff9512c3f 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -150,8 +150,7 @@ void pmp_unlock_entries(CPURISCVState *env)
     }
 }
 
-static void pmp_decode_napot(target_ulong a, target_ulong *sa,
-                             target_ulong *ea)
+static void pmp_decode_napot(hwaddr a, hwaddr *sa, hwaddr *ea)
 {
     /*
      * aaaa...aaa0   8-byte NAPOT range
@@ -173,8 +172,8 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index)
     uint8_t this_cfg = env->pmp_state.pmp[pmp_index].cfg_reg;
     target_ulong this_addr = env->pmp_state.pmp[pmp_index].addr_reg;
     target_ulong prev_addr = 0u;
-    target_ulong sa = 0u;
-    target_ulong ea = 0u;
+    hwaddr sa = 0u;
+    hwaddr ea = 0u;
 
     if (pmp_index >= 1u) {
         prev_addr = env->pmp_state.pmp[pmp_index - 1].addr_reg;
@@ -227,8 +226,7 @@ void pmp_update_rule_nums(CPURISCVState *env)
     }
 }
 
-static int pmp_is_in_range(CPURISCVState *env, int pmp_index,
-                           target_ulong addr)
+static int pmp_is_in_range(CPURISCVState *env, int pmp_index, hwaddr addr)
 {
     int result = 0;
 
@@ -305,14 +303,14 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, pmp_priv_t privs,
  * Return true if a pmp rule match or default match
  * Return false if no match
  */
-bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
+bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
                         target_ulong size, pmp_priv_t privs,
                         pmp_priv_t *allowed_privs, target_ulong mode)
 {
     int i = 0;
     int pmp_size = 0;
-    target_ulong s = 0;
-    target_ulong e = 0;
+    hwaddr s = 0;
+    hwaddr e = 0;
 
     /* Short cut if no rules */
     if (0 == pmp_get_num_rules(env)) {
@@ -624,12 +622,12 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
  * To avoid this we return a size of 1 (which means no caching) if the PMP
  * region only covers partial of the TLB page.
  */
-target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr)
+target_ulong pmp_get_tlb_size(CPURISCVState *env, hwaddr addr)
 {
-    target_ulong pmp_sa;
-    target_ulong pmp_ea;
-    target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
-    target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
+    hwaddr pmp_sa;
+    hwaddr pmp_ea;
+    hwaddr tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
+    hwaddr tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
     int i;
 
     /*
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index 9af8614cd4..f5c10ce85c 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -53,8 +53,8 @@ typedef struct {
 } pmp_entry_t;
 
 typedef struct {
-    target_ulong sa;
-    target_ulong ea;
+    hwaddr sa;
+    hwaddr ea;
 } pmp_addr_t;
 
 typedef struct {
@@ -73,11 +73,11 @@ target_ulong mseccfg_csr_read(CPURISCVState *env);
 void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
                        target_ulong val);
 target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
-bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
+bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
                         target_ulong size, pmp_priv_t privs,
                         pmp_priv_t *allowed_privs,
                         target_ulong mode);
-target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr);
+target_ulong pmp_get_tlb_size(CPURISCVState *env, hwaddr addr);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
 void pmp_update_rule_nums(CPURISCVState *env);
 uint32_t pmp_get_num_rules(CPURISCVState *env);
-- 
2.34.1


