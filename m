Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42889C77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 09:13:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6pDm-00084r-Cb; Wed, 07 Jun 2023 05:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiao.w.wang@intel.com>)
 id 1q6pDk-00084E-Oa; Wed, 07 Jun 2023 05:12:48 -0400
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiao.w.wang@intel.com>)
 id 1q6pDi-0001Tm-UV; Wed, 07 Jun 2023 05:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686129166; x=1717665166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AHNI1/RpJ6AS+SCdzUR89xL6O4y2FGQ892g2z6y0DNw=;
 b=TR5YcChzsZVV7LVs0c1N2H2w2rBWYSM5/eouZ9mtVtnbFoDmL7btwCNV
 Gd1mpzZMEFf+i09NHu68sV5J34FrBndc3tFCn7k4qLDoQjXAltGfLtQ0c
 Nt5tYmIkAapWJQr93TlSL4JFZQq+8pSjCfb7kTtrhvgKdXDVp4iqOa2Ss
 tiZrywYh12ozf18XaWMMrxzFE+IaK95BH2K+2FAxI4+9sEvNqezk73PBz
 Q9jTL66RrzTyjK1JWjDmwlZHTtPJ0SqZNCiKRDFDWg+iGjpyiZbT+O1AT
 bY9C6O8tNXQZZVUM3Wtsp4XUV2UjDNoQ24RDfA32llg58ETtYvPPCzVdS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="359403253"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="359403253"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 02:12:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="774439958"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="774439958"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
 by fmsmga008.fm.intel.com with ESMTP; 07 Jun 2023 02:12:33 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: qemu-devel@nongnu.org
Cc: Xiao Wang <xiao.w.wang@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v2] target/riscv/vector_helper.c: Remove the check for extra
 tail elements
Date: Wed,  7 Jun 2023 17:16:46 +0800
Message-Id: <20230607091646.4049428-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=xiao.w.wang@intel.com; helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Commit 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector
load / store instructions") added an extra check for LMUL fragmentation,
intended for setting the "rest tail elements" in the last register for a
segment load insn.

Actually, the max_elements derived in vext_ld*() won't be a fraction of
vector register size, since the lmul encoded in desc is emul, which has
already been adjusted to 1 for LMUL fragmentation case by vext_get_emul()
in trans_rvv.c.inc, for ld_stride(), ld_us(), ld_index() and ldff().

Besides, vext_get_emul() has also taken EEW/SEW into consideration, so no
need to call vext_get_total_elems() which would base on the emul to derive
another emul, the second emul would be incorrect when esz differs from sew.

Thus this patch removes the check for extra tail elements.

Fixes: 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector load / store instructions")

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
v2:
* Rebased on top of Alistair's riscv-to-apply.next branch.
---
 target/riscv/vector_helper.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7505f9470a..f261e726c2 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -264,11 +264,10 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
 GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
 GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
 
-static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
-                                   void *vd, uint32_t desc, uint32_t nf,
+static void vext_set_tail_elems_1s(target_ulong vl, void *vd,
+                                   uint32_t desc, uint32_t nf,
                                    uint32_t esz, uint32_t max_elems)
 {
-    uint32_t total_elems, vlenb, registers_used;
     uint32_t vta = vext_vta(desc);
     int k;
 
@@ -276,19 +275,10 @@ static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
         return;
     }
 
-    total_elems = vext_get_total_elems(env, desc, esz);
-    vlenb = riscv_cpu_cfg(env)->vlen >> 3;
-
     for (k = 0; k < nf; ++k) {
         vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
                           (k * max_elems + max_elems) * esz);
     }
-
-    if (nf * max_elems % total_elems != 0) {
-        registers_used = ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
-        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
-                          registers_used * vlenb);
-    }
 }
 
 /*
@@ -324,7 +314,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     }
     env->vstart = 0;
 
-    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
+    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
@@ -383,7 +373,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     }
     env->vstart = 0;
 
-    vext_set_tail_elems_1s(env, evl, vd, desc, nf, esz, max_elems);
+    vext_set_tail_elems_1s(evl, vd, desc, nf, esz, max_elems);
 }
 
 /*
@@ -504,7 +494,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     }
     env->vstart = 0;
 
-    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
+    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
@@ -634,7 +624,7 @@ ProbeSuccess:
     }
     env->vstart = 0;
 
-    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
+    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
-- 
2.25.1


