Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05119C55ABA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 16:45:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wreiv-0008LC-Du; Wed, 05 Aug 2026 12:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wreiu-0008KF-3e
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 12:44:08 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wreis-0001yL-GH
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 12:44:07 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c9cf07d2df6so921498a12.2
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1785948245; x=1786553045; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fQC/YI21g4WDDTrfzNXtxzDhPQ+c5T/h+/PxMuIADQc=;
 b=ObVOttRDi/4Ld/op2t7A+i4jl5ozG4L42VT0vGt0luomG3iojiDreoHNqAQFcIgHfu
 7qjdlB9nbS8pLyFf+cFo+ebZdZUWgXTIXYKLrN/2DalNveNlhDHvivniq6p7lwDObwTh
 EiPIFmhukLlqEBlvM6iGIUWKmXaH2dcpd6aS1zsroc7MnXBSIF83S0AUhh14UulgeiRz
 bHCkz3GUFkcHKrKc68QqxMHSXlFJxQgydhb7Ccc9nImAoII75n1n7k7M5gb2iIESb2f1
 u0+coC4xNvVt/OgK54Nxv+kdvVpZJ5cMmqS/yPorHhqPhtmuNL1aMcAcWMnVDy2LrWgR
 aPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785948245; x=1786553045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fQC/YI21g4WDDTrfzNXtxzDhPQ+c5T/h+/PxMuIADQc=;
 b=NoeWBRWbgh1VnoJO61G/8ArZ+ngN7sJqKtdj3N37P1xQtVdMeeeFj74D3BjPyu1mDu
 LJFEDGTCvkpIXme9VO4P6WVq18KvnSsjFMecVfWKsSphRFc7ViQ/0xN71dfiMAc4hncx
 bc2tuItaiU0u7HH48ybOxUYKRZOHgrvt/2E0hXjL/57XiRrXiypMGyikF4WJ+vRVI320
 PBbGoj//tCUuQxuyU9scNgJNcS+sHd1HViU9V262rCw78YlT7T9Ab3vwfmY/tEJLiJTL
 oQsFNNTH1NlKrnFkikGHArAsR4JXvtG8C5KM7BGZtmAgVF+SqlHJvPS7aEuR9QTN4Fi7
 mE4A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrrm9+8mbwOkK4S7cY7/OSAElLVto7qemUQ3Cy5xsZENj4TftQDIrCY/v4tX3MjvPxHXtcVehKBMxpg@nongnu.org
X-Gm-Message-State: AOJu0YzD9F5D95u8BzdFX2ueBE5eY9XhmqkFnifNdl+jPX97BK+Ti+0x
 LxsKjxgifb0l9PUnLXH45HrfOPiGdZ6pMfPQAQ4iNl6H5xTEDDM0aGSzJQTSkaJnIsqjUIylc0W
 Y4n1F4/Nekw==
X-Gm-Gg: AR+sD12of38kiwrwAXR0j9sWUEvREcuXh9/chTm7qlekTUhEBJ/WlIA0aa8azdyjkqG
 aKAzsfzUzxQx5VTtK+zX8aFkSQ+EG3o9nfaOHF7hG0VePDFl3HKKYcT6z+HKBn3Wv8YyPVO/hMh
 0zUi26wok+ZaM+tVr0k4XTv0fHfrHsy70Rsq+NuW78/rOQoWUBhjQ8nH3p5WwjrSLeHuD+YhIsB
 LkND4QTkX8xMqhF+RQJVmLB4LVHSInfRTAPsFQLR+bh+TSjD354jVZ2QEH4gJutR5iPphpkZnRd
 3dxrjevOiAF+HKm9V7IZ3XOVXCm81Vy6klu1kGCvRkAq7a629stzZ8NKzEv7Rajrzqi6foatPBB
 4VwrkpTtnybgUOEHgVwbUSCjtooFj7yxiy9JQEajx/UsVjm+YcjJAg5vnXXQo9vvsgdTNsgjvFG
 +GdCvj41+Yu9ckP7z4LHGAGyzmJ+vBH1KxFJDYxyvJ4l2I2uPPrxsET35YjYyU9IW9fqNpuJ2nf
 NI9EF4BRDIWrpGA
X-Received: by 2002:a05:6a20:e347:b0:3bd:3800:7538 with SMTP id
 adf61e73a8af0-3cb85ffdacamr9379164637.33.1785948245005; 
 Wed, 05 Aug 2026 09:44:05 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3158644a195sm16719065eec.13.2026.08.05.09.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 09:44:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 5/8] target/riscv: Support raising misaligned exceptions
 for floating-point loads/stores
Date: Thu,  6 Aug 2026 00:43:42 +0800
Message-ID: <20260805164345.698208-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805164345.698208-1-frank.chang@sifive.com>
References: <20260805164345.698208-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

When the Zicclsm extension is not enabled, raise misaligned load/store
exceptions for misaligned accesses from floating-point load/store
instructions (RVF, RVD, Zfh).

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/tcg/insn_trans/trans_rvd.c.inc   | 6 ++++++
 target/riscv/tcg/insn_trans/trans_rvf.c.inc   | 6 ++++++
 target/riscv/tcg/insn_trans/trans_rvzfh.c.inc | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/target/riscv/tcg/insn_trans/trans_rvd.c.inc b/target/riscv/tcg/insn_trans/trans_rvd.c.inc
index 3b9a745520a..1be2bee9465 100644
--- a/target/riscv/tcg/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvd.c.inc
@@ -61,6 +61,9 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
         memop |= MO_ATOM_IFALIGN;
     }
     memop |= ctx->mo_endianness;
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
 
     decode_save_opc(ctx, 0);
     addr = get_address(ctx, a->rs1, a->imm);
@@ -86,6 +89,9 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
         memop |= MO_ATOM_IFALIGN;
     }
     memop |= ctx->mo_endianness;
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
 
     decode_save_opc(ctx, 0);
     addr = get_address(ctx, a->rs1, a->imm);
diff --git a/target/riscv/tcg/insn_trans/trans_rvf.c.inc b/target/riscv/tcg/insn_trans/trans_rvf.c.inc
index e935523c93c..481f7282da7 100644
--- a/target/riscv/tcg/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvf.c.inc
@@ -52,6 +52,9 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
     if (ctx->cfg_ptr->ext_zama16b) {
         memop |= MO_ATOM_WITHIN16;
     }
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
 
     decode_save_opc(ctx, 0);
     addr = get_address(ctx, a->rs1, a->imm);
@@ -75,6 +78,9 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     if (ctx->cfg_ptr->ext_zama16b) {
         memop |= MO_ATOM_WITHIN16;
     }
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
 
     decode_save_opc(ctx, 0);
     addr = get_address(ctx, a->rs1, a->imm);
diff --git a/target/riscv/tcg/insn_trans/trans_rvzfh.c.inc b/target/riscv/tcg/insn_trans/trans_rvzfh.c.inc
index f36b46c2118..88711fb0769 100644
--- a/target/riscv/tcg/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvzfh.c.inc
@@ -50,6 +50,9 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
     REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
 
     memop |= ctx->mo_endianness;
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
     decode_save_opc(ctx, 0);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
@@ -75,6 +78,9 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
     REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
 
     memop |= ctx->mo_endianness;
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
     decode_save_opc(ctx, 0);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
-- 
2.43.0


