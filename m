Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5A1C7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 05:31:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q78Et-00081D-Hn; Thu, 08 Jun 2023 01:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiao.w.wang@intel.com>)
 id 1q78Es-00080u-5U; Thu, 08 Jun 2023 01:31:14 -0400
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiao.w.wang@intel.com>)
 id 1q78En-0005Qt-2E; Thu, 08 Jun 2023 01:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686202269; x=1717738269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ls6HGJEC/YwQ+q0Iy0QbKV2NNDA7/Qe8ipIqo3T8hBE=;
 b=UH2yShfYhQDCsBRVQoAf7P39JIpDvtb8NPC3evTRoGq2O3YrzncxeWAr
 Xqmymb5Rgc9uo0j2bPqW4FFOLTezd7V7+4/OzZaaoUaMwgHz/spXsQyyx
 K4qu6aiuMxBUu7DfckxzSNCdJVnF7UF3lIjXbc/7L6ik0UcZjICu3RtrS
 /0XEkobEy4C4jmImEsdr0pdK+6dkJvEx2z63Lp2a2YQO2g+4aWWsdszwG
 z1DeeqdEiDjFCM+JyHD4aaSYkLTl/SduBsIonmUY+QvT86CAI4ErCu+r3
 cgvvSgXZcPnS9fjqOh/CsdGg+lcSsRPReyOcC0RV/ZOW2lNFAtYxgiZuG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360543211"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="360543211"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739560351"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="739560351"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
 by orsmga008.jf.intel.com with ESMTP; 07 Jun 2023 22:30:59 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: qemu-devel@nongnu.org
Cc: Xiao Wang <xiao.w.wang@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH] target/riscv/vector_helper.c: clean up reference of MTYPE
Date: Thu,  8 Jun 2023 13:35:17 +0800
Message-Id: <20230608053517.4102648-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=xiao.w.wang@intel.com; helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

There's no code using MTYPE, which was a concept used in older vector
implementation.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 target/riscv/vector_helper.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f261e726c2..1e06e7447c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -378,7 +378,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 
 /*
  * masked unit-stride load and store operation will be a special case of
- * stride, stride = NF * sizeof (MTYPE)
+ * stride, stride = NF * sizeof (ETYPE)
  */
 
 #define GEN_VEXT_LD_US(NAME, ETYPE, LOAD_FN)                            \
@@ -650,10 +650,6 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
 #define DO_MAX(N, M)  ((N) >= (M) ? (N) : (M))
 #define DO_MIN(N, M)  ((N) >= (M) ? (M) : (N))
 
-/* Unsigned min/max */
-#define DO_MAXU(N, M) DO_MAX((UMTYPE)N, (UMTYPE)M)
-#define DO_MINU(N, M) DO_MIN((UMTYPE)N, (UMTYPE)M)
-
 /*
  * load and store whole register instructions
  */
-- 
2.25.1


