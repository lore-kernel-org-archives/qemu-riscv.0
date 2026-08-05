Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F207C55ABA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 16:45:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wreis-0008Jf-50; Wed, 05 Aug 2026 12:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wreir-0008JP-5R
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 12:44:05 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wreip-0001xu-LL
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 12:44:04 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c9fe3c9bd5fso51594a12.0
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1785948242; x=1786553042; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l24jeh6mL402UPS1PQ1PqKY5L+GWjbvAW1P9ttSr/yU=;
 b=iws64pnaAVNrGkNF8T9kUiQnzyT62oVma39VGLsZLtLO9YJrRp0tjC6ANBemLKtRPg
 D7+I6bx2+3bYLuycmLy4TECUg94AbbR0MoMjlKGTTMxLP1k47ujxSrk6B0v4/qIah3O4
 x0+dx0yvbuOuvZ/Q2l/CXD0i6ENOQIudUfn4Dbf91QwOlow+Ne9V3ibFUG4WmbE8ZzN3
 hZCmHIN5EArr/2nD18bLSdnlhWf381xgiQkLmmD2mgeiyvbCu0ZjY5jY6oqG6TX9/qA6
 UnTN2OstSY4UYQUOXwUBAfN+irWM7FezQkp6qZl+EzTa5EA7ImNB7Y84oUVZRvlUs4pe
 CMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785948242; x=1786553042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=l24jeh6mL402UPS1PQ1PqKY5L+GWjbvAW1P9ttSr/yU=;
 b=diOJzgsulAYR4qNAeYiewl81tILWr4J1c5LDxYByzCYrdmcSKRel9AdvD3PFvsZtxg
 IZfXJaFM2nSeIY4b7EsICXR9ROv9xB4wOymvx+v0OTN7tm1Xd8qWZpC4pCoWCUpidoly
 RPonHepkPVAFtDwhe+ZBvZm6ViOy79djXPmRPF2F1SmQ7yF4Xqy/KdFDbkdlIvgelf2n
 9kc2hfPHr3GFKwTFJckf8D6qB7AltVnOJ/+UnRcD0RhqiMUZgOUZ+SEUciA42EsszlJs
 j3IUAQn9ZFuZmbkEjoD4kByz5vV4aLxMRP+11FZIAxWrKxkOScdqb1YG/FPxHuMJe4DC
 cUKA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr5yDY/XjhBZT7zLmpstsaWFfK1wmrpIGn8/H+PhB6/+51SebsIoWIuG0DgYh9EhQ4LYPo8q725quhY@nongnu.org
X-Gm-Message-State: AOJu0YxY7vFSkp3OYTDCXcchzGNV8B1QCeWNVKl6pjPLiDWHRxA9X3Pz
 usz1Qpa14lpVOoSmVsRcrfA6OTmyBiTXNX0M56BH0hV/Vq7uO/GlquNlrE9MEjyvQvA=
X-Gm-Gg: AR+sD117d38PbIAovu/BCeeByEcmA4Cb8TtETRghGS8gsMD0ooLyO/nw6A8pBbr1xUq
 ncE1WSxreFaEroGVBtBqBex8mv5NfEQGO2v2zJaziepyjD1KND/J+OUA5sfL+PUJpTLwJWcXLu1
 4ejL+ZovF3P3FyFkgGVkym8PAehH6Gdw+sxYtSeC2fSgMrJrbt3YxL6tBB1JX4xGZ7WWF8cyOgt
 81KQ4wgjmgXKgdYhExdEdlh8wFnZ6WPdqjSI5MrtVtxe3LrQqTwgeXmdBlvNmuzSmq1rDPozZ++
 aqV90OAcczK4k48aAES7+AdYaa5zxQaP+FIyoBGyrIwnSOO4i/fufigiGdeAAi36ib5K1Z/FdzG
 uM4SMct5wnY+yLizsBnCpZnuZGizrrrQ+yPI0v74EOGXmk3I5mXYhgmSX+ZtUuIxPQBaPVbuzv2
 DT1RxxODNH0A0j26bZb6aeLOkItFP8tFaEhO6f6EoajLMNP/WnS6dQKV52dVr9tHLyiO0gHBeek
 HPc5FdZDLomD/A=
X-Received: by 2002:a05:6a21:6e97:b0:3b4:6af4:bdd5 with SMTP id
 adf61e73a8af0-3cb9c2374dfmr509366637.15.1785948242361; 
 Wed, 05 Aug 2026 09:44:02 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3158644a195sm16719065eec.13.2026.08.05.09.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 09:44:01 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 4/8] target/riscv: Support raising misaligned exceptions
 for scalar loads/stores
Date: Thu,  6 Aug 2026 00:43:41 +0800
Message-ID: <20260805164345.698208-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805164345.698208-1-frank.chang@sifive.com>
References: <20260805164345.698208-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
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

From: Frank Chang <frank.chang@sifive.com>

When the Zicclsm extension is not enabled, raise misaligned load/store
exceptions for misaligned accesses from scalar load/store instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/tcg/insn_trans/trans_rvi.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/tcg/insn_trans/trans_rvi.c.inc b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
index e47b16a7fa2..cc1b5dbbadc 100644
--- a/target/riscv/tcg/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
@@ -413,6 +413,9 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
     if (ctx->cfg_ptr->ext_zama16b) {
         memop |= MO_ATOM_WITHIN16;
     }
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
     decode_save_opc(ctx, 0);
     if (get_xl(ctx) == MXL_RV128) {
         out = gen_load_i128(ctx, a, memop);
@@ -524,6 +527,9 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
     if (ctx->cfg_ptr->ext_zama16b) {
         memop |= MO_ATOM_WITHIN16;
     }
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
     decode_save_opc(ctx, 0);
     if (get_xl(ctx) == MXL_RV128) {
         return gen_store_i128(ctx, a, memop);
-- 
2.43.0


