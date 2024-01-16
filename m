Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF87C47077
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 20:59:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPqW9-0004c5-S7; Tue, 16 Jan 2024 15:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqW8-0004bg-0j
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:58:40 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqW6-0007b8-AM
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:58:39 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d54b765414so70404245ad.0
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 12:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705438717; x=1706043517; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mqYdrvBHfNvDL7QQKTXH50VH69mfmJxorO62IA/mls=;
 b=kO5qtMx1RJA2x0G8miywvcMIaGluTxwnMEYJ/lR4W2hvyUIX6k/7biHR9kQC9+dSa4
 J6DRVDUYRT0AYJ2BZ5XweLVYVeZKx107/mbdb0GAPAQL1kbtpEu34X/peaV0kGlnUMlN
 3bkcSPI081MidrD204KwmKIZtRAqLrSYoAyDcqTU2xZpEi7g6WyRC2xDBjfyCigaD0lu
 c5qxtQ9hldi/Oa4qLazk3TZcvyEWPyP7BkQD61CDo0SrErsY/rw77M/LExPTREnFMdVZ
 dz3nzpl0AuSLT0xht92mCj1dmJXQZ+XvRaQVlNdi/y5nG0y72t4bFG4T7xLgKakRwcGb
 /+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705438717; x=1706043517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/mqYdrvBHfNvDL7QQKTXH50VH69mfmJxorO62IA/mls=;
 b=TCl3md5rLriGW/EUTJEw6M2FKAtPthUWbl2V6jVsrGIV5DBcvrnYh2CxyMLpZHyswD
 6GINjQgXrF4HvPY3+ybHdhn1TRYlxDFEpezF7lX0PBrbY+fa5P4LZ/yYiPdk9/lTGEIA
 NvcdbpaNpPFyeu5W2gk7kLT58fohEwhVbTxSuVWRHniw66GwpN86e6FFA3gxZUQxf+iM
 PlS73VjwbL9ZER3li22gomk2zXwaRyMMULvjm9i7d8PWnyGUjjgKRr20aWTLUmF8DSc5
 xyzkK98cPyeOeUyDX750A3ayAQ/n7p11XLXxhPIw+nxAxNcRXO2Zca9rsHTO/CuIMZPP
 QK5w==
X-Gm-Message-State: AOJu0Yw0ge35kBciNdb7kvE1GEfMdn1saiYSO9NC93REOSvRB2fnPFfg
 lr5Rt3zO8s4IYMecIx5cnRLflnue6gmNoA==
X-Google-Smtp-Source: AGHT+IFDTbXlE+DWfrI3rxq8Wuc6wjz/ANNQl0UEic9uw9mxsrXaMe7soHDECwNBKFLwJQkOyT9rOg==
X-Received: by 2002:a17:90b:24e:b0:28e:82df:5559 with SMTP id
 fz14-20020a17090b024e00b0028e82df5559mr969931pjb.23.1705438717059; 
 Tue, 16 Jan 2024 12:58:37 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 sh2-20020a17090b524200b0028df5c748e4sm11326949pjb.44.2024.01.16.12.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 12:58:36 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 04/13] target/riscv/insn_trans/trans_rvbf16.c.inc: use
 cpu->cfg.vlenb
Date: Tue, 16 Jan 2024 17:58:08 -0300
Message-ID: <20240116205817.344178-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116205817.344178-1-dbarboza@ventanamicro.com>
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Use ctx->cfg_ptr->vlenb instead of ctx->cfg_ptr->vlen / 8.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvbf16.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvbf16.c.inc b/target/riscv/insn_trans/trans_rvbf16.c.inc
index 4e39c00884..8ee99df3f3 100644
--- a/target/riscv/insn_trans/trans_rvbf16.c.inc
+++ b/target/riscv/insn_trans/trans_rvbf16.c.inc
@@ -83,8 +83,8 @@ static bool trans_vfncvtbf16_f_f_w(DisasContext *ctx, arg_vfncvtbf16_f_f_w *a)
         data = FIELD_DP32(data, VDATA, VMA, ctx->vma);
         tcg_gen_gvec_3_ptr(vreg_ofs(ctx, a->rd), vreg_ofs(ctx, 0),
                            vreg_ofs(ctx, a->rs2), tcg_env,
-                           ctx->cfg_ptr->vlen / 8,
-                           ctx->cfg_ptr->vlen / 8, data,
+                           ctx->cfg_ptr->vlenb,
+                           ctx->cfg_ptr->vlenb, data,
                            gen_helper_vfncvtbf16_f_f_w);
         mark_vs_dirty(ctx);
         gen_set_label(over);
@@ -112,8 +112,8 @@ static bool trans_vfwcvtbf16_f_f_v(DisasContext *ctx, arg_vfwcvtbf16_f_f_v *a)
         data = FIELD_DP32(data, VDATA, VMA, ctx->vma);
         tcg_gen_gvec_3_ptr(vreg_ofs(ctx, a->rd), vreg_ofs(ctx, 0),
                            vreg_ofs(ctx, a->rs2), tcg_env,
-                           ctx->cfg_ptr->vlen / 8,
-                           ctx->cfg_ptr->vlen / 8, data,
+                           ctx->cfg_ptr->vlenb,
+                           ctx->cfg_ptr->vlenb, data,
                            gen_helper_vfwcvtbf16_f_f_v);
         mark_vs_dirty(ctx);
         gen_set_label(over);
@@ -143,8 +143,8 @@ static bool trans_vfwmaccbf16_vv(DisasContext *ctx, arg_vfwmaccbf16_vv *a)
         tcg_gen_gvec_4_ptr(vreg_ofs(ctx, a->rd), vreg_ofs(ctx, 0),
                            vreg_ofs(ctx, a->rs1),
                            vreg_ofs(ctx, a->rs2), tcg_env,
-                           ctx->cfg_ptr->vlen / 8,
-                           ctx->cfg_ptr->vlen / 8, data,
+                           ctx->cfg_ptr->vlenb,
+                           ctx->cfg_ptr->vlenb, data,
                            gen_helper_vfwmaccbf16_vv);
         mark_vs_dirty(ctx);
         gen_set_label(over);
-- 
2.43.0


