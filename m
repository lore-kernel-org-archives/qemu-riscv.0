Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A079C4707B
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 22:27:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPVPK-0000qe-G2; Mon, 15 Jan 2024 17:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPVPJ-0000q2-Cd
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:26:13 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPVPH-00068G-SP
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:26:13 -0500
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3bd763524e0so795555b6e.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 14:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705357570; x=1705962370; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G3zwnL2bepqEdgfhLqXrSi6UxcmFJJl1qTGSWX8FZUg=;
 b=KIQo/qqvwsoT3h8GBiUZv/IMcygDTapZbsbnhDIzBHP7KXWL0N7c/4kKHLrNabRKhJ
 HLw4u163Ms4bnw68n9/LpbmLYnHZn68oLE7Y0QY+3jQMzJVdKxHh7d4V4QwXpuzviuT7
 GUyEhWCURmO2O6FogS43qlO5LuYifoilmKx+TXu2t3m3KG+XZsB4FAhr72KUSxsR2Nxd
 W32nvs2gmsk8VLJfhrLe8/5mm+RwjI8TLOS0OfDmbwWAtlY68YOziXAZYUh+r6OGCyk6
 yQC13tgZDVAHMuv+yffujySDh5bJl4QQKvYmxg3BVhLiPW17csNrE/+T/l5icwsJgsph
 SSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705357570; x=1705962370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G3zwnL2bepqEdgfhLqXrSi6UxcmFJJl1qTGSWX8FZUg=;
 b=Ci3CEH5CPPY1QPR+OfSrJHUScVxuW8od7Pm+O8e6GA2lF9Sj0DZB3S2rVM9SO2X8ku
 xaNelWDd5Fqx3vvYFfTX9pUJk5c0WBF9rd3uXjdTPSb7lrwUh4oWE+yERp4PCMaFDP3V
 HORdPU7hluuNw475lnzytRH7OU3AnC52IinXuwEl1LM0vz/KF0GZNS66GQDMv3uxHuX8
 mad1PwU9GYWVjzGC2zAbfbE85D0/GbfHFxuKkL/TqUGyQFHI5TLnTUW8WZLboXMzfOaB
 zZmQc9WD84JdAKtWn3x929JXRudRj5T9wMlyX1Q8M7oTsOCCTg4qB9CyEWUMEVqnDUYB
 xt5w==
X-Gm-Message-State: AOJu0YzyvB3DlezwoDwToMZd1yGGLMOxbixYf1q1S2U9Im7rwyJ798Vx
 DrGy6VsLESi1CnMEyDCxJjU4gOUtmt8gxg==
X-Google-Smtp-Source: AGHT+IFuSZSVNc2r+5PefA423niwJsKXk+7c9yBTIF0X6Zk7/9Xzc9vuk10x5kN1Mws+QT8GsPRm1g==
X-Received: by 2002:a05:6808:1306:b0:3bd:3a29:63e9 with SMTP id
 y6-20020a056808130600b003bd3a2963e9mr8293781oiv.27.1705357570733; 
 Mon, 15 Jan 2024 14:26:10 -0800 (PST)
Received: from grind.. ([152.234.123.64]) by smtp.gmail.com with ESMTPSA id
 ks19-20020a056a004b9300b006d977f70cd5sm8125940pfb.23.2024.01.15.14.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 14:26:10 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 11/12] trans_rvv.c.inc: use 'vlenb' to calc vlmax in
 trans_vrgather_v*()
Date: Mon, 15 Jan 2024 19:25:27 -0300
Message-ID: <20240115222528.257342-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115222528.257342-1-dbarboza@ventanamicro.com>
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
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

Use the same vext_get_vlmax() logic to retrieve 'vlmax' in
trans_vrgather_vi() and trans_vrgather_vx().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index b4663b6e1f..05c243186d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3535,8 +3535,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
     }
 
     if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
-        int scale = s->lmul - (s->sew + 3);
-        int vlmax = s->cfg_ptr->vlen >> -scale;
+        int vlmax = s->cfg_ptr->vlenb >> (s->sew - s->lmul);
         TCGv_i64 dest = tcg_temp_new_i64();
 
         if (a->rs1 == 0) {
@@ -3566,8 +3565,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
     }
 
     if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
-        int scale = s->lmul - (s->sew + 3);
-        int vlmax = s->cfg_ptr->vlen >> -scale;
+        int vlmax = s->cfg_ptr->vlenb >> (s->sew - s->lmul);
         if (a->rs1 >= vlmax) {
             tcg_gen_gvec_dup_imm(MO_64, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), 0);
-- 
2.43.0


