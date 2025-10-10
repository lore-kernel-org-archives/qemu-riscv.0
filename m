Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619C8CCD185
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 15:53:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7FPP-0004FA-W7; Fri, 10 Oct 2025 11:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FPN-0004EK-56
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:51:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FPH-0002dD-2x
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:51:52 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e29d65728so13547205e9.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 08:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760111497; x=1760716297; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+LjuonxLSezOOPsBu7D5T1RerWloURfdVhjBPrGFuk=;
 b=WrekRuatZl2G9Dh2xDpXtZXTjUU+M91xXAPTf9J+fMPMYQuKPL8zhFwQqVkm+U7U7V
 RbUabaR3ps54rw6T5FMd5uymjE48ug3J2W2zy23qZcdCIb8jlVRe+uZmiatYsGIppOE+
 O52JL2NFsC20rA2J9HR2p7/Cg/vs54e5A8BU0iWGoHqxbAvIACq5BUmFqlKPgu95pLeK
 cbAQgRD5U9h121CpguZsdSEnxG6nMzFcI26JncIzuH3Jo+M2/HTpngiqfkXtCr8UM3lu
 pUVeK/cEcqWYl6JtA7lIKrd5IHroaWu+9+lv3UT8n+Cp7H1mH+jTAKS3qga6vZJHARZa
 uf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760111497; x=1760716297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+LjuonxLSezOOPsBu7D5T1RerWloURfdVhjBPrGFuk=;
 b=YEE2ojpjYUhNaWdz8yT/oxY6S1vJY9qqLdL24x+WpE4r0d3Ev2vCAVvL3FyQpO4trR
 c8vO/mHbgCz94CMbRHC3rBi9HfObI9Y5tgv99RDHfFoIZtjs5S/DFkYaFYr/3rJS0Uih
 Mz0+zHVigrFfFpjNdjSODIYVsdD/HNOa4sM/pkpfqlPo6c7qJqVgu7y68aJmojM1XOkX
 2SfwiuOIS98fTZM0hJxlsWkT8oh8cTRSjtnQcXBWTXds0+2yAjxtQn3bTNi9t7W1tYVH
 7TypncENs9az8Mf4U2W6qgja0ADkQtaP8uLUxx4D8NHUBX+NdbvyTtB3E+Zd7nIkCEIz
 mtLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfuMXCSE1lCktQGXPRNeOJ+fqZ3GNoJ2bVjvum3tbm6if9WqyJd6cYemU0GTsF841IcRKLLRHc5aym@nongnu.org
X-Gm-Message-State: AOJu0Yz18b7pU2kBMVd00hbbj1HA9q5T5GlvjMLB5NYwy6Gvgao1SYNP
 bjMhJR4ggXvZTRPO8QMDlEqx+e6JHX9F4NAaV01N1BveSjBM/afPYT9Ln66y1EDjJKY=
X-Gm-Gg: ASbGncuK2w6U+6yP+Hhn3kQOwzkMDv+9IfC/Lihf08H4h/SFETRy4r+VG3iMYpR0kTb
 ppz1pmAhRwMlYX55wXT61mK4R1i/2U5nnT8aXz+zTBW5dC1P/9thhnO8B6b6ipmMljiJxrkGtZi
 oIy9mqrQELIxoCL+kxMc/8tj/wJKU0JNXVF0g/oYad9EDXpnrjS4EJS1H13Ry1EpajC4Ch0vGxw
 GEqTy907WgcuoHjOczuPpP0t/epBcr3584jQKdPZPdZmXFgMAb6WKUDMyeIbTFe4n05T5ltB8AQ
 sNtLwr5a4cRgOpIoldeX6uQfsqtTxb9mkoO7p4KK+bnp7bVMiWlKCnCZWrsaTSljxTMoU6o/zKK
 DEiUOamnArXxG2HWuqgHyjfYga7fRHVTJ3jrPvuUJ+oxFoxI+R6dD199qw51oJBGc1htowQe0H+
 ICpHNP8eYI2UZATAkypK8=
X-Google-Smtp-Source: AGHT+IGAXKnmbDWYJ4lSDPR4gGHrMkjucpbFpZnBTc5qFM13srq+3OoKLZe/YMsIZktvo3fvmNxKrw==
X-Received: by 2002:a05:600c:3f0c:b0:45b:9912:9f30 with SMTP id
 5b1f17b1804b1-46fa9a86314mr85706785e9.6.1760111497248; 
 Fri, 10 Oct 2025 08:51:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab524f92sm61068925e9.7.2025.10.10.08.51.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 08:51:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/13] target/riscv: Conceal MO_TE|MO_ALIGN within gen_lr() /
 gen_sc()
Date: Fri, 10 Oct 2025 17:50:41 +0200
Message-ID: <20251010155045.78220-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010155045.78220-1-philmd@linaro.org>
References: <20251010155045.78220-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

All callers of gen_lr() / gen_sc() set the MO_TE and MO_ALIGN flags.
Set them once in the callees.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/insn_trans/trans_rva.c.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index e0fbfafdde4..8737e8d60d1 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -34,6 +34,9 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
     TCGv src1;
 
+    mop |= MO_ALIGN;
+    mop |= MO_TE;
+
     decode_save_opc(ctx, 0);
     src1 = get_address(ctx, a->rs1, 0);
     if (a->rl) {
@@ -61,6 +64,9 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
 
+    mop |= MO_ALIGN;
+    mop |= MO_TE;
+
     decode_save_opc(ctx, 0);
     src1 = get_address(ctx, a->rs1, 0);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
@@ -99,13 +105,13 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
 static bool trans_lr_w(DisasContext *ctx, arg_lr_w *a)
 {
     REQUIRE_A_OR_ZALRSC(ctx);
-    return gen_lr(ctx, a, (MO_ALIGN | MO_TE | MO_SL));
+    return gen_lr(ctx, a, MO_SL);
 }
 
 static bool trans_sc_w(DisasContext *ctx, arg_sc_w *a)
 {
     REQUIRE_A_OR_ZALRSC(ctx);
-    return gen_sc(ctx, a, (MO_ALIGN | MO_TE | MO_SL));
+    return gen_sc(ctx, a, MO_SL);
 }
 
 static bool trans_amoswap_w(DisasContext *ctx, arg_amoswap_w *a)
@@ -166,14 +172,14 @@ static bool trans_lr_d(DisasContext *ctx, arg_lr_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_A_OR_ZALRSC(ctx);
-    return gen_lr(ctx, a, MO_ALIGN | MO_TE | MO_UQ);
+    return gen_lr(ctx, a, MO_UQ);
 }
 
 static bool trans_sc_d(DisasContext *ctx, arg_sc_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_A_OR_ZALRSC(ctx);
-    return gen_sc(ctx, a, (MO_ALIGN | MO_TE | MO_UQ));
+    return gen_sc(ctx, a, MO_UQ);
 }
 
 static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
-- 
2.51.0


