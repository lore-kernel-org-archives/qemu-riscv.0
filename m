Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3270E7718C
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 16:49:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tOgBM-0004jW-S6; Fri, 20 Dec 2024 11:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZT-0004jF-V0
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:48 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZS-0004a9-8w
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KPP2Ag0j0lIBnUOdH5xALipOWwfEPBLQrlbu0Bq/g/I=; b=JqiyKw3V+CyeRnvtwBTm71OQ74
 5psYPVVtXjC723xn1HeZ6OMwr3DaIlX973KwFX//xz64zkKlbV/q8oeMKUoqG4/ag4r+D1cc8OSKb
 amEeJzu2kgauG+R5xGkV6M1c3IQIy6PksRn3DMyfmXbKX2cr3O+eXIlTX8ZXTenWGxRvBC+Gv+gra
 jiCax9QiiE3Lc6yIYmI6727QvciS9uRJpcpRTkp1IU+okzlJVJeNS+rRHQB8+8B3E2j+GzIcH/9QT
 pc0s0BbNrZP7HxgOIE/BPcrqKGCmMFH0/k2k+Xqxtd4KpWToa+wcsP8p2iWhNSARhkvNWkTUGnag5
 s1f2TSgw==;
Received: from [167.98.27.226] (helo=codethink.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1tOfD6-00ACav-1Q; Fri, 20 Dec 2024 15:46:40 +0000
From: Roan Richmond <roan.richmond@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: lawrence.hunter@codethink.co.uk, ben.dooks@codethink.co.uk,
 felix.chong@codethink.co.uk, sagark@eecs.berkeley.edu, palmer@dabbet.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Roan Richmond <roan.richmond@codethink.co.uk>
Subject: [RFC PATCH 6/7] taregt/riscv: Add big endian checks for pagetable
Date: Fri, 20 Dec 2024 15:45:34 +0000
Message-ID: <20241220154616.283933-7-roan.richmond@codethink.co.uk>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220154616.283933-1-roan.richmond@codethink.co.uk>
References: <20241220154616.283933-1-roan.richmond@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=roan.richmond@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 20 Dec 2024 11:48:54 -0500
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

From: Ben Dooks <ben.dooks@codethink.co.uk>

Adds checks to handle big or little endian page tables.

Authored-by: Ben Dooks <ben.dooks@codethink.co.uk>
Co-authored-by: Roan Richmond <roan.richmond@codethink.co.uk>
Co-authored-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
---
 target/riscv/cpu_helper.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 6271c9b887..b41641ab4b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -923,6 +923,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
     hwaddr base;
     int levels, ptidxbits, ptesize, vm, widened;
+    bool is_be = env->mstatus & MSTATUS_SBE;
 
     if (first_stage == true) {
         if (use_background) {
@@ -1006,7 +1007,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     int ptshift = (levels - 1) * ptidxbits;
-    target_ulong pte;
+    target_ulong lpte, pte;
     hwaddr pte_addr;
     int i;
 
@@ -1056,9 +1057,15 @@ restart:
         }
 
         if (riscv_cpu_mxl(env) == MXL_RV32) {
-            pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
+            pte = lpte = address_space_ldl(cs->as, pte_addr, attrs, &res);
+            if (is_be) {
+                pte = be32_to_cpu(lpte);
+            }
         } else {
-            pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
+            pte = lpte = address_space_ldq(cs->as, pte_addr, attrs, &res);
+            if (is_be) {
+                pte = be64_to_cpu(lpte);
+            }
         }
 
         if (res != MEMTX_OK) {
@@ -1227,6 +1234,16 @@ restart:
          */
         MemoryRegion *mr;
         hwaddr l = sxlen_bytes, addr1;
+        target_ulong store_pte = updated_pte;
+
+        if (is_be) {
+            if (riscv_cpu_sxl(env) == MXL_RV32) {
+                store_pte = cpu_to_be32(updated_pte);
+            } else {
+                store_pte = cpu_to_be64(updated_pte);
+            }
+        }
+
         mr = address_space_translate(cs->as, pte_addr, &addr1, &l,
                                      false, MEMTXATTRS_UNSPECIFIED);
         if (memory_region_is_ram(mr)) {
@@ -1236,15 +1253,17 @@ restart:
              * MTTCG is not enabled on oversized TCG guests so
              * page table updates do not need to be atomic
              */
-            *pte_pa = pte = updated_pte;
+            pte = updated_pte;
+            *pte_pa = store_pte;
 #else
             target_ulong old_pte;
+
             if (riscv_cpu_sxl(env) == MXL_RV32) {
-                old_pte = qatomic_cmpxchg((uint32_t *)pte_pa, pte, updated_pte);
+                old_pte = qatomic_cmpxchg((uint32_t *)pte_pa, lpte, store_pte);
             } else {
-                old_pte = qatomic_cmpxchg(pte_pa, pte, updated_pte);
+                old_pte = qatomic_cmpxchg(pte_pa, lpte, store_pte);
             }
-            if (old_pte != pte) {
+            if (old_pte != lpte) {
                 goto restart;
             }
             pte = updated_pte;
-- 
2.43.0


