Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579FBC47DB7
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:22:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQmwP-0004ni-DP; Fri, 19 Jan 2024 06:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rQmwM-0004mG-2k
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:21:38 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rQmwJ-0008U4-Bn
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:21:37 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40ea01d55c2so2139515e9.2
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705663293; x=1706268093;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ecnCqjTLfYnZuQfJNBUJ4tk5GBJDgWj5pyxdn7gFen4=;
 b=UxeQGcbjzj5FLtLwrelS1SSmovk5ZLs1w4isJ+Uknzj/3TMsCB6pqkMYY7Bx/Osq9t
 AusdYejR+cjQ355SQ5kTaWDeiXFbjiZclClMqwJCqRDjL98RyiGpKY6UrA0xmIWpXLYK
 KWFzYv06cXjLAMNDR3ph/gwOjGGImWWexl6rZ6CZJ7eWuDe1Q80qumTXQXqwe7EKuA4w
 qC3mFffvp7V7uGWnuvkX/9go2VDBxjTMGbme1Emg+IL8CMXsJJnBHSGyTomtAXfkV60V
 5QZsLBUNEsK5RtXnCPhChSxsF0/54GOSWtHd0XD3iaaj8xKSmkCV5iK/JMSQ8qqXYdlK
 VNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705663293; x=1706268093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ecnCqjTLfYnZuQfJNBUJ4tk5GBJDgWj5pyxdn7gFen4=;
 b=NvBrZumlSWPPQ58SIOlML9TYAUkt4pwssGx0dgR0YuBr7YsHYw+UbXznOqqvXcKu3R
 pAIMhE/kT5T56ubGuYSu8Ja3hsUOAt5evQd/NGX/LXQMHHj4zYVwdKViIXz4t/w8nv7+
 4T4LHnKjuADX9fTWrdt9PcOGn+c5goX4Vga0bM//8m/Mx97UQoup3qS2Tib6FwfeYXVj
 KTUlmpOeGie1hCb/gMAwisDTjDw2+JbxOMlr/JVphdht+FfVCsDUZ1WnVdxS3k4WbS6a
 DvNtUL3fgN+8J4H8v6RdGxZQHbzDt93h5rUI/6hyk7+sNWbU/ko/gUyOSnO9pz05ZNWZ
 PFdw==
X-Gm-Message-State: AOJu0YxbSVRVmn0+yjh4Th2dwbunTSScwT7FMnru9t5LxdgtiurxybYh
 9hb3SUH5/MtRBmtQyk0wogxPrv5yXujtqRYfgE6DJ16V+/vMK0+IZrZjTXpSQek=
X-Google-Smtp-Source: AGHT+IGbIvz5kS7ftbWa8lu77KmhkR/TqKQUHjGLyXt5RHDnByU4GEIXQCvXpGiXHilbIQFCsapaqg==
X-Received: by 2002:a05:600c:84cf:b0:40e:7110:b3a0 with SMTP id
 er15-20020a05600c84cf00b0040e7110b3a0mr1300038wmb.149.1705663293433; 
 Fri, 19 Jan 2024 03:21:33 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c4f1600b0040d6b91efd9sm32428067wmq.44.2024.01.19.03.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 03:21:33 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v2 2/2] target/riscv: Check 'A' and split extensions for
 atomic instructions
Date: Fri, 19 Jan 2024 11:21:29 +0000
Message-ID: <20240119112129.20067-3-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119112129.20067-1-rbradford@rivosinc.com>
References: <20240119112129.20067-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x332.google.com
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


