Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA43C3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 16:26:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPPmM-0005o5-QI; Mon, 15 Jan 2024 11:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rPPmI-0005mh-OU
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 11:25:34 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rPPmF-000517-Kd
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 11:25:34 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e76109cdeso13916365e9.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 08:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705335930; x=1705940730;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pe4WTlbA+w/w320h1lZbso82Ro9E7uK8lDq42mAnp/Y=;
 b=GpvEgoWTio8AfX/RsdJi/cw0aj2DCuF08elkASguSzGxRoYYaCY7E/3X58ZOAGXOf2
 1Zkz88lITGbg07cTHS6kZ2ifNzqU1y4d5PKHnsbsK6NdzB5dmCBC5gzeRFPvAEfmBRZ8
 kwgwE4uuLt4jeDrmuIbwrElPr0fzrXiOvW9330PcoPL4TZUs54agAVMWlViWO6vogrsc
 zeFGu43UtflyMWstcE+/WEyWsKr9WviEnGxe7zYZ70v17WW2j4yA4gTS9ADZJwGgMrMf
 Op5evIA5ANLYwwGP8N86AdAe+ld00WvnAHnejI3X5Gy4WQvmv70BoBt8/hDgIRPASCpb
 XoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705335930; x=1705940730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pe4WTlbA+w/w320h1lZbso82Ro9E7uK8lDq42mAnp/Y=;
 b=Z9m5bBh+hPCLYeVISggjMLLAKaTRWfzrIGoB/+4EHK/3wuy6NIkyRGvjg2w6Nv2avP
 z0etk0mHorEHOkNrZSD4KQP4xPDFXSD8rDj5h1AtgpOYbH78vewP1LvdqrdFTVb5AKGK
 R+2urqRgOxP1ojCnkpFjj7Bb8xymGvaGZC2lsK2pNZipKRSi7dwQbJ2EHcukJEsJs4s/
 l35+Zxvdc2M+XBwWcddGF07QZM4IONOD3MqJTveFETdr4V5a2R0LH7D2sH/7g+YKvkMA
 VyxallxhmLfg29swwLrEfTIjJjsnsIyzhyrLewCRXk9JzmQj+oudQ8RgkAsU3vj87lDm
 Pxkw==
X-Gm-Message-State: AOJu0YyyNwt7ebHK99xqlLyrxyyFOa0rSGXBwWBh5nBonNd/Mtt7nsgg
 +qDIB/WfBBpF/GW1dK2Pp+E0lwxI8W5I1Q==
X-Google-Smtp-Source: AGHT+IGfhqkfikoMHHt/tuDPrNFi7LLDmZUMGDkTnuUmyuuR5iucRo2Pr9OzkJ3ezgeAo4AkhFkfMw==
X-Received: by 2002:a7b:c455:0:b0:40e:4af9:6a19 with SMTP id
 l21-20020a7bc455000000b0040e4af96a19mr2859702wmi.155.1705335930274; 
 Mon, 15 Jan 2024 08:25:30 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c4f9000b0040d62f97e3csm20274444wmq.10.2024.01.15.08.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 08:25:29 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH 2/2] target/riscv: Check 'A' and split extensions for atomic
 instructions
Date: Mon, 15 Jan 2024 16:25:25 +0000
Message-ID: <20240115162525.63535-3-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115162525.63535-1-rbradford@rivosinc.com>
References: <20240115162525.63535-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Following the pattern for 'M' and Zmmul check if either the 'A'
extension is enabled or the appropriate split extension for the
instruction.

Also remove the assumption that only checking for 64-bit systems is
required for the double word variants.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/insn_trans/trans_rva.c.inc | 56 +++++++++++++++----------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index f0368de3e4..267930e5bc 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -18,6 +18,18 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#define REQUIRE_A_OR_ZAAMO(ctx) do {                      \
+    if (!ctx->cfg_ptr->ext_zaamo && !has_ext(ctx, RVA)) { \
+        return false;                                     \
+    }                                                     \
+} while (0)
+
+#define REQUIRE_A_OR_ZALRSC(ctx) do {                      \
+    if (!ctx->cfg_ptr->ext_zalrsc && !has_ext(ctx, RVA)) { \
+        return false;                                     \
+    }                                                     \
+} while (0)
+
 static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
     TCGv src1;
@@ -96,143 +108,143 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
 
 static bool trans_lr_w(DisasContext *ctx, arg_lr_w *a)
 {
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZALRSC(ctx);
     return gen_lr(ctx, a, (MO_ALIGN | MO_TESL));
 }
 
 static bool trans_sc_w(DisasContext *ctx, arg_sc_w *a)
 {
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZALRSC(ctx);
     return gen_sc(ctx, a, (MO_ALIGN | MO_TESL));
 }
 
 static bool trans_amoswap_w(DisasContext *ctx, arg_amoswap_w *a)
 {
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TESL));
 }
 
 static bool trans_amoadd_w(DisasContext *ctx, arg_amoadd_w *a)
 {
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_TESL));
 }
 
 static bool trans_amoxor_w(DisasContext *ctx, arg_amoxor_w *a)
 {
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_TESL));
 }
 
 static bool trans_amoand_w(DisasContext *ctx, arg_amoand_w *a)
 {
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_TESL));
 }
 
 static bool trans_amoor_w(DisasContext *ctx, arg_amoor_w *a)
 {
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_TESL));
 }
 
 static bool trans_amomin_w(DisasContext *ctx, arg_amomin_w *a)
 {
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO_TESL));
 }
 
 static bool trans_amomax_w(DisasContext *ctx, arg_amomax_w *a)
 {
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO_TESL));
 }
 
 static bool trans_amominu_w(DisasContext *ctx, arg_amominu_w *a)
 {
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO_TESL));
 }
 
 static bool trans_amomaxu_w(DisasContext *ctx, arg_amomaxu_w *a)
 {
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO_TESL));
 }
 
 static bool trans_lr_d(DisasContext *ctx, arg_lr_d *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZALRSC(ctx);
     return gen_lr(ctx, a, MO_ALIGN | MO_TEUQ);
 }
 
 static bool trans_sc_d(DisasContext *ctx, arg_sc_d *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZALRSC(ctx);
     return gen_sc(ctx, a, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amoadd_d(DisasContext *ctx, arg_amoadd_d *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amoxor_d(DisasContext *ctx, arg_amoxor_d *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amoand_d(DisasContext *ctx, arg_amoand_d *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amoor_d(DisasContext *ctx, arg_amoor_d *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amomin_d(DisasContext *ctx, arg_amomin_d *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amomax_d(DisasContext *ctx, arg_amomax_d *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amominu_d(DisasContext *ctx, arg_amominu_d *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amomaxu_d(DisasContext *ctx, arg_amomaxu_d *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVA);
+    REQUIRE_A_OR_ZAAMO(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO_TEUQ));
 }
-- 
2.43.0


