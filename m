Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AABC77B73
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 13:24:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Wff-0006pe-B2; Tue, 06 Jun 2023 09:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiao.w.wang@intel.com>)
 id 1q6S4u-0002sK-6v; Tue, 06 Jun 2023 04:30:11 -0400
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiao.w.wang@intel.com>)
 id 1q6S4s-0004bT-4Z; Tue, 06 Jun 2023 04:30:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686040206; x=1717576206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vfaNM3WPPpfwWaktnttUfBaKD1yrXfp/225p2wQUanY=;
 b=QwAee7G7IAVbTbqDVf1+PX6OUWiBab4H8p1Gy2VU+jybxGtMqsz1ogKS
 iGULv3/b7UNGBhJhyx8y19nk0qC+yL3Da3sDRdnqEA4h6I7dcWbKKB4zj
 pdd5GUtjdyynj+3a/O0qXagju+fawkpoMANpjcS3iqsCopR6nbMEGIWLG
 jZqAzYd0kyE7xTYy5jZaMpbLvcbTn39fiIit77o47PXJjODnmJW2RQh5X
 LcNqZqQJXfwFXYVpJi8eUmaGO2HX+FTj9yJaGS9ZWkHgxmWzHbK9+vTsF
 nJkzBtxkv1d9i7lQ5uugOEL41LDzo0AoAnLcS9zDK1rHPM8ah9MVGEYS9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336230476"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="336230476"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 01:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="955667564"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="955667564"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
 by fmsmga006.fm.intel.com with ESMTP; 06 Jun 2023 01:29:57 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: qemu-devel@nongnu.org
Cc: Xiao Wang <xiao.w.wang@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH] target/riscv/vector_helper.c: Remove the check for extra tail
 elements
Date: Tue,  6 Jun 2023 16:34:08 +0800
Message-Id: <20230606083408.3972300-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiao.w.wang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Jun 2023 09:24:22 -0400
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
 target/riscv/vector_helper.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f4d0438988..56a79bb5fa 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -264,26 +264,17 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
 GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
 GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
 
-static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
-                                   void *vd, uint32_t desc, uint32_t nf,
+static void vext_set_tail_elems_1s(target_ulong vl, void *vd,
+                                   uint32_t desc, uint32_t nf,
                                    uint32_t esz, uint32_t max_elems)
 {
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
     uint32_t vta = vext_vta(desc);
-    uint32_t registers_used;
     int k;
 
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
@@ -319,7 +310,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     }
     env->vstart = 0;
 
-    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
+    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
@@ -378,7 +369,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     }
     env->vstart = 0;
 
-    vext_set_tail_elems_1s(env, evl, vd, desc, nf, esz, max_elems);
+    vext_set_tail_elems_1s(evl, vd, desc, nf, esz, max_elems);
 }
 
 /*
@@ -499,7 +490,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     }
     env->vstart = 0;
 
-    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
+    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
@@ -629,7 +620,7 @@ ProbeSuccess:
     }
     env->vstart = 0;
 
-    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
+    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
-- 
2.25.1


