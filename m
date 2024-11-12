Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF32D41D71
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 09:14:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tAmwn-0007g7-TN; Tue, 12 Nov 2024 04:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tAmwa-0007XW-85
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2024 04:12:19 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tAmwX-0007lP-Uj
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2024 04:12:15 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2e2ad9825a7so4088646a91.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Nov 2024 01:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1731402732; x=1732007532; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Or39Asyq2WcOevg1FvpeaHy7EaesyoBx5lPamPpthoM=;
 b=CPfyhJK6ofAAR1o31+4oZOqisS5kf53URtbiWxpOUX558Ea723Fht+p9c7JdwGFzZN
 Rr60Wm7bIrBW9/r41xGyoyv0AI2JXpQr3+5OUr1k/ZEwzmWQPvDCSsnzA7ETBYJwPlr8
 nQkBSn8s346aKzSBhuSnj5LVIFgLZlU5V3s3hy1iGbopuDwqm40hoEOb1aRvWzOqwg/J
 z4EmYetLAbdimB5otmTx3/ajk5e8hpE9rG+9cwok5XsRqlpgqsC9hrmgN/EcFPyT43gc
 GpwMuPY/u+CAV8IEe25eFEwbQ1rppHJyt0dcXOAwk/N3xK4K9OiYEtRNLwCOezyDRpk8
 Qbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731402732; x=1732007532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Or39Asyq2WcOevg1FvpeaHy7EaesyoBx5lPamPpthoM=;
 b=fK4b47g/L0XsKZ8n71C3yxJo4P3e8zLcnLts/MJUutgjOR/9krUkh8ggHNd6kzTUeu
 C2mH/goy2jtnNi76n/6vpurKPWyQd29YnyZfkm6IyFd8wml6QtgODcaXsd8WYrhHB4Tg
 36HUk8urh2A8F0Y9ZX27ol5zmUZeX4W81oCbSGJxaOg90uqm9xmNUciF7qEZo27qO48t
 Tq5nLeAT1mkvXJEZAluOHWmCD1NOaT35zmLL/Wa4epdZACgkwFA82610TV47H3zaohrO
 1SxJ0ARJFHyTKb1LYcJUZG3Y6+lHSb5PhvU/csq1ImimSCnaiRGfVu70iurvPqX6pDz+
 +uow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWFm56XmD9+ckVvbD+94IfhaGtEucarg91wqqQV/Wh7XurO6GoweVkp1Gl7/URoqD5KUxVjWEjQDCN@nongnu.org
X-Gm-Message-State: AOJu0Yz6qp26aaByI/WDsIVOn21vZgeLEbXwiKtDXn515fJXL/yNDZzM
 3Oepgy4ppHvvczCJ+s9+IvYiQ06Y0mkD9NJE8rRJ9WczAoQtqSEn+u7FzOrNEZk=
X-Google-Smtp-Source: AGHT+IGhp/SBPIH6KNAvbjUW72Fx7Irq+8fYAD7u9t9cbEn+/GAom3C0zk+Ta/aXIRkIQvUeLdXeLQ==
X-Received: by 2002:a17:90b:3811:b0:2e2:bf7f:3369 with SMTP id
 98e67ed59e1d1-2e9b16eb57bmr21010199a91.5.1731402732509; 
 Tue, 12 Nov 2024 01:12:12 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e99a4f6c96sm13495347a91.2.2024.11.12.01.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 01:12:11 -0800 (PST)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 4/5] target/riscv: Check memory access to meet svukte rule
Date: Tue, 12 Nov 2024 17:14:22 +0800
Message-Id: <20241112091423.2529583-5-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112091423.2529583-1-fea.wang@sifive.com>
References: <20241112091423.2529583-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=fea.wang@sifive.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Follow the Svukte spec, do the memory access address checking

1. Include instruction fetches or explicit memory accesses
2. System run in effective privilege U or VU
3. Check senvcfg[UKTE] being set, or hstatus[HUKTE] being set if
instruction is HLV, HLVX, HSV and execute from U mode to VU mode
4. Depend on Sv39 and check virtual addresses bit[SXLEN-1]
5. Raises a page-fault exception corresponding to the original access
type.

Ref: https://github.com/riscv/riscv-isa-manual/pull/1564/files

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu_helper.c | 61 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0a3ead69ea..5b29344c4f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -857,6 +857,61 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot, hwaddr addr,
     return TRANSLATE_SUCCESS;
 }
 
+/* Returns 'true' if a svukte address check is needed */
+static bool do_svukte_check(CPURISCVState *env, bool first_stage,
+                             int mode, bool virt)
+{
+    bool ukte;
+
+    /* Svukte extension depends on Sv39. */
+    if (!(env_archcpu(env)->cfg.ext_svukte ||
+        !first_stage ||
+        VM_1_10_SV39 != get_field(env->satp, SATP64_MODE))) {
+        return false;
+    }
+
+    /*
+     * Check hstatus.HUKTE if the effective mode is switched to VU-mode by
+     * executing HLV/HLVX/HSV in U-mode.
+     * For other cases, check senvcfg.UKTE.
+     */
+    if (env->priv == PRV_U && !env->virt_enabled && virt) {
+        ukte = !!(env->hstatus & HSTATUS_HUKTE);
+    } else {
+        ukte = !!(env->senvcfg & SENVCFG_UKTE);
+    }
+
+    if (!ukte) {
+        return false;
+    }
+
+    /*
+     * Svukte extension is qualified only in U or VU-mode.
+     *
+     * Effective mode can be switched to U or VU-mode by:
+     *   - M-mode + mstatus.MPRV=1 + mstatus.MPP=U-mode.
+     *   - Execute HLV/HLVX/HSV from HS-mode + hstatus.SPVP=0.
+     *   - U-mode.
+     *   - VU-mode.
+     *   - Execute HLV/HLVX/HSV from U-mode + hstatus.HU=1.
+     */
+    if (mode != PRV_U) {
+        return false;
+    }
+
+    return true;
+}
+
+static bool check_svukte_addr(CPURISCVState *env, vaddr addr)
+{
+    uint32_t sxl = riscv_cpu_sxl(env);
+    sxl = (sxl == 0) ? MXL_RV32 : sxl;
+    uint32_t sxlen = 32 * sxl;
+    uint64_t high_bit = addr & (1UL << (sxlen - 1));
+
+    return !high_bit;
+}
+
 /*
  * get_physical_address - get the physical address for this virtual address
  *
@@ -894,6 +949,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     MemTxResult res;
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     int mode = mmuidx_priv(mmu_idx);
+    bool virt = mmuidx_2stage(mmu_idx);
     bool use_background = false;
     hwaddr ppn;
     int napot_bits = 0;
@@ -901,6 +957,11 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     bool is_sstack_idx = ((mmu_idx & MMU_IDX_SS_WRITE) == MMU_IDX_SS_WRITE);
     bool sstack_page = false;
 
+    if (do_svukte_check(env, first_stage, mode, virt) &&
+        !check_svukte_addr(env, addr)) {
+        return TRANSLATE_FAIL;
+    }
+
     /*
      * Check if we should use the background registers for the two
      * stage translation. We don't need to check if we actually need
-- 
2.34.1


