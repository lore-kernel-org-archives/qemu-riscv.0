Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8338C4167B
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 11:55:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r927B-0000Ue-6X; Fri, 01 Dec 2023 06:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irina.ryapolova@syntacore.com>)
 id 1r9279-0000SW-9g; Fri, 01 Dec 2023 06:55:23 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irina.ryapolova@syntacore.com>)
 id 1r9277-00054b-63; Fri, 01 Dec 2023 06:55:23 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 6C729C0008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1701431714;
 bh=/2bAKF4rsJdemQQcA1B/mOvRW0QR/N7koGtQ3g12eRs=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=MSPFCBXKEwxutjMY0Uhln9NZTZ2laiIb2DQFZwkKQNKkOpqdDgpbl3rZUIFIC0F31
 GYvrJhyeDi6hZj2HHkTT2nMlcQAkMQUDKdG7lrl2iwfYxhK/6177lzl7wtXxWkPNC0
 NRydpXo4kxzLOA600sbrYttRyj9iwIxuMbjI9jctshPCzMRg1uI7YxPfOd0vz2Wg1V
 ZPT/2flnj6a6SrsAeUNlrPYAoVv/Fq/Cc6P4iuXsLFd6V0HDtt4tZF9/RQqRcBZC/x
 qMfr4MHwLXudSBRcJyam9KCG8G0lPnu/gAWtrjD6fj1rhArt47ij7s75U6p+BZM6F2
 6H6CZH04ajj6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1701431714;
 bh=/2bAKF4rsJdemQQcA1B/mOvRW0QR/N7koGtQ3g12eRs=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=tKH3v/l+XadSnckGu1JQta6f4VsRTXO3Zuzh0Q31GshTSTqN4kTTxxQejJpRKzIms
 TmLs+hUWEfxQSVFenx8bPeJycEn78Z2499NBgBScrYfJJ3HdavnUhDGLWCZHUTBHQY
 Lufr6h2yOFyC9DgdHhpCumdQ98/foulea2U1MUz7feMyzeRhMZNugaBZpvx5FN/AXu
 jMTfmUEVvLW9s4XB4TKsU1sw9eTay9LKH0YPy6qcZlEshCSX81Zuj3JOEB5tN3UJ4U
 7QRV0xj0/AYfZN5sjPrvU3U/Bjig6YfVuHqXp1ipBDwPNcEnWP+JA6NA12cLZiQMLV
 oESj4GVPNXs3w==
From: Irina Ryapolova <irina.ryapolova@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <palmer@dabbelt.com>, <alistair.francis@wdc.com>, 
 <bin.meng@windriver.com>, <liwei1518@gmail.com>,
 <dbarboza@ventanamicro.com>, 
 <zhiwei_liu@linux.alibaba.com>, Irina Ryapolova
 <irina.ryapolova@syntacore.com>
Subject: [PATCH 2/2] target/riscv: UPDATE xATP write CSR
Date: Fri, 1 Dec 2023 14:53:39 +0300
Message-ID: <20231201115339.18353-2-irina.ryapolova@syntacore.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201115339.18353-1-irina.ryapolova@syntacore.com>
References: <20231201115339.18353-1-irina.ryapolova@syntacore.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-07.corp.yadro.com (172.17.11.57) To
 S-Exch-02.corp.yadro.com (10.78.5.239)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=irina.ryapolova@syntacore.com; helo=mta-04.yadro.com
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

Added xATP_MODE validation for vsatp/hgatp CSRs.
The xATP register is an SXLEN-bit read/write WARL register, so
the legal value must be returned (See riscv-privileged-20211203, SATP/VSATP/HGATP CSRs).

Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>
---
 target/riscv/csr.c | 52 ++++++++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6f244815b7..d9e181daa2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1282,6 +1282,32 @@ static bool validate_vm(CPURISCVState *env, target_ulong vm)
     return get_field(mode_supported, (1 << vm));
 }
 
+static target_ulong legalize_xatp(CPURISCVState *env, target_ulong old_xatp,
+                                  target_ulong val)
+{
+    target_ulong mask;
+    bool vm;
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        vm = validate_vm(env, get_field(val, SATP32_MODE));
+        mask = (val ^ old_xatp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN);
+    } else {
+        vm = validate_vm(env, get_field(val, SATP64_MODE));
+        mask = (val ^ old_xatp) & (SATP64_MODE | SATP64_ASID | SATP64_PPN);
+    }
+
+    if (vm && mask) {
+        /*
+         * The ISA defines SATP.MODE=Bare as "no translation", but we still
+         * pass these through QEMU's TLB emulation as it improves
+         * performance.  Flushing the TLB on SATP writes with paging
+         * enabled avoids leaking those invalid cached mappings.
+         */
+        tlb_flush(env_cpu(env));
+        return val;
+    }
+    return old_xatp;
+}
+
 static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mpp,
                                  target_ulong val)
 {
@@ -2997,31 +3023,11 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
 static RISCVException write_satp(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    target_ulong mask;
-    bool vm;
-
     if (!riscv_cpu_cfg(env)->mmu) {
         return RISCV_EXCP_NONE;
     }
 
-    if (riscv_cpu_mxl(env) == MXL_RV32) {
-        vm = validate_vm(env, get_field(val, SATP32_MODE));
-        mask = (val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN);
-    } else {
-        vm = validate_vm(env, get_field(val, SATP64_MODE));
-        mask = (val ^ env->satp) & (SATP64_MODE | SATP64_ASID | SATP64_PPN);
-    }
-
-    if (vm && mask) {
-        /*
-         * The ISA defines SATP.MODE=Bare as "no translation", but we still
-         * pass these through QEMU's TLB emulation as it improves
-         * performance.  Flushing the TLB on SATP writes with paging
-         * enabled avoids leaking those invalid cached mappings.
-         */
-        tlb_flush(env_cpu(env));
-        env->satp = val;
-    }
+    env->satp = legalize_xatp(env, env->satp, val);
     return RISCV_EXCP_NONE;
 }
 
@@ -3506,7 +3512,7 @@ static RISCVException read_hgatp(CPURISCVState *env, int csrno,
 static RISCVException write_hgatp(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
-    env->hgatp = val;
+    env->hgatp = legalize_xatp(env, env->hgatp, val);
     return RISCV_EXCP_NONE;
 }
 
@@ -3772,7 +3778,7 @@ static RISCVException read_vsatp(CPURISCVState *env, int csrno,
 static RISCVException write_vsatp(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
-    env->vsatp = val;
+    env->vsatp = legalize_xatp(env, env->vsatp, val);
     return RISCV_EXCP_NONE;
 }
 
-- 
2.25.1


