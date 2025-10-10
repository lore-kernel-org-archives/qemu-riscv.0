Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91C7CCD185
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 15:52:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7FOs-00040h-Sl; Fri, 10 Oct 2025 11:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FOl-0003xj-FJ
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:51:15 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FOg-0002Nf-QN
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:51:13 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so12454905e9.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 08:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760111468; x=1760716268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v/RFRwN2hdZobqlvf83sC1ELRwPbHpkuSmCBnMOOgns=;
 b=WeFLzOdeSpsQAt3GW56usJgvv/rKe/KIeoSvripw0ycHCPIcIonkPu/HbQbkkVXCPP
 zE1vUJTxSvcZDFjV2dAr7MwnIlQRtCAgHl7Hq+VIfL5WBCF6e7F754qPzUPzwTQOtjW9
 DSvxVuaxOtpC0CddRB9+bMpp67GC6hTx7x2rnFMogEqeD0XpUVG8rlcspNWe5pnTUygr
 aLMgxCZb6rdu4PFBx4kZ1IHRXuoFNuDBDR2a+BMCykIZFVOT8MztGk6oLHq4P6aNRzlm
 dnVHIbYA4YYQhJ1/cOj+cRy4aSN+Yv+uLMp+R1pmBMmlEKFRh+RmJmoW5N2LBwcH/PIV
 xXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760111468; x=1760716268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v/RFRwN2hdZobqlvf83sC1ELRwPbHpkuSmCBnMOOgns=;
 b=bQP5q3VXcJRM1n2yLXNbm6460jJTJCa/ZYHzcsX6E7EBvkDfyYlIhjJL2ykvQfqBZ7
 ZPfdVV0U66eSjcgDNRYSSgAkIEcpUKbrEFLYIcKMwuV5pnzAVmrg0OhT0Z+l0QiO7qsT
 fxWFdNApfR7nfgF9UQc7u55v4NfAWKZBvEiHWfrCD0VEq6IyCo3xsi5IHeSpJCWLF8+0
 pQo3UJJQ2VKm24Tpa+9T2wI+hiEbhBUpq+LcQ/sbnvF8rwywPOyul2psXr0xSq4Brjwb
 uJPSGAlULISFPvBf94w4kKOSL7lMGwfxW0r+8Ybkx1iQGVnpnWfKU/puntlhC3H+Gegp
 Qd4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6qyu+CQzJyCqNRYupsxbdo0m/k1afzERA4StNUwsFLZW/zBuS+Qh4k4vRCPuuxwbgTLDZKwoAzf18@nongnu.org
X-Gm-Message-State: AOJu0YxdrW3PGxpPxae4Feoe08fAimKMgApzOwaU67lc2LVrBr6Cjt+N
 wV9GR3ACgvyxqfrXDHktDkASsklClP81gDHAgvAkQnYn/lZSgMwDMtUPnt3J+XlA7F1QYurhHkd
 y813pRZgmJw==
X-Gm-Gg: ASbGncuXVIfgBRfuJSXnWdWk+duLOwDClnfSejScDUs7EfnG4ay1QFCeBFFxyulx2lV
 t8sBd6mvvMpy7jvnqN6VSGwpFjCHBEV3Moo2qjqM/lKOPOLqLoWT0RPY3Q5vIrWX4a3bnKTAmxH
 HE44WLiTOMj6wN7AYRvkv7mkwluGu3V+kXo+I+SCUvIWXr465InUFLDw36ueT65NXi+tp/qGlv7
 UAjuQn+1ylDgP4eU8SSk3+FN5Qy30uOTbO+HzQq8LPBMvr0uezwvettmSIolxj70lxSL8EZkfnS
 wXJ5D6sQXqyoX0prEqXFblQZVMvGnlI6my/ouT+sTqnVydgkwtSCi9xOISmtnn+In98Plf7XFtl
 FnhyFi+66cjQCc2tzyXLzkbM6x3jLKxBzIMVWaFDZelJsUPtUlds0LWhmO5mMdRf0MyDpxhEstV
 xAOOUwmDgaczF7IFpDc21Vobf515La7w==
X-Google-Smtp-Source: AGHT+IEYz7cZOengOKvsj4+eOJUWxwoA6xblKbazhY/mTyx+AiEbVYFJqX2fJp12/XPhzsx/o45jxw==
X-Received: by 2002:a05:600c:c4a8:b0:46e:4921:9443 with SMTP id
 5b1f17b1804b1-46fa9b1b277mr84754725e9.37.1760111467641; 
 Fri, 10 Oct 2025 08:51:07 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb49bd977sm51923805e9.11.2025.10.10.08.51.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 08:51:07 -0700 (PDT)
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
Subject: [PATCH 04/13] target/riscv: Conceal MO_TE within gen_inc()
Date: Fri, 10 Oct 2025 17:50:35 +0200
Message-ID: <20251010155045.78220-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010155045.78220-1-philmd@linaro.org>
References: <20251010155045.78220-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

All callers of gen_inc() set the MO_TE flag. Set it once in
the callee.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/insn_trans/trans_xthead.c.inc | 34 ++++++++++++----------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 754cb80e221..7e69906e5bf 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -568,6 +568,7 @@ static bool gen_load_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memop,
     TCGv rd = dest_gpr(ctx, a->rd);
     TCGv rs1 = get_gpr(ctx, a->rs1, EXT_NONE);
 
+    memop |= MO_TE;
     tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
     tcg_gen_addi_tl(rs1, rs1, imm);
     gen_set_gpr(ctx, a->rd, rd);
@@ -588,6 +589,7 @@ static bool gen_store_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memop,
     TCGv data = get_gpr(ctx, a->rd, EXT_NONE);
     TCGv rs1 = get_gpr(ctx, a->rs1, EXT_NONE);
 
+    memop |= MO_TE;
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
     tcg_gen_addi_tl(rs1, rs1, imm);
     gen_set_gpr(ctx, a->rs1, rs1);
@@ -598,64 +600,64 @@ static bool trans_th_ldia(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_load_inc(ctx, a, MO_TE | MO_SQ, false);
+    return gen_load_inc(ctx, a, MO_SQ, false);
 }
 
 static bool trans_th_ldib(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_load_inc(ctx, a, MO_TE | MO_SQ, true);
+    return gen_load_inc(ctx, a, MO_SQ, true);
 }
 
 static bool trans_th_lwia(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_load_inc(ctx, a, MO_TE | MO_SL, false);
+    return gen_load_inc(ctx, a, MO_SL, false);
 }
 
 static bool trans_th_lwib(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_load_inc(ctx, a, MO_TE | MO_SL, true);
+    return gen_load_inc(ctx, a, MO_SL, true);
 }
 
 static bool trans_th_lwuia(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_load_inc(ctx, a, MO_TE | MO_UL, false);
+    return gen_load_inc(ctx, a, MO_UL, false);
 }
 
 static bool trans_th_lwuib(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_load_inc(ctx, a, MO_TE | MO_UL, true);
+    return gen_load_inc(ctx, a, MO_UL, true);
 }
 
 static bool trans_th_lhia(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_load_inc(ctx, a, MO_TE | MO_SW, false);
+    return gen_load_inc(ctx, a, MO_SW, false);
 }
 
 static bool trans_th_lhib(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_load_inc(ctx, a, MO_TE | MO_SW, true);
+    return gen_load_inc(ctx, a, MO_SW, true);
 }
 
 static bool trans_th_lhuia(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_load_inc(ctx, a, MO_TE | MO_UW, false);
+    return gen_load_inc(ctx, a, MO_UW, false);
 }
 
 static bool trans_th_lhuib(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_load_inc(ctx, a, MO_TE | MO_UW, true);
+    return gen_load_inc(ctx, a, MO_UW, true);
 }
 
 static bool trans_th_lbia(DisasContext *ctx, arg_th_meminc *a)
@@ -686,38 +688,38 @@ static bool trans_th_sdia(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_store_inc(ctx, a, MO_TE | MO_SQ, false);
+    return gen_store_inc(ctx, a, MO_SQ, false);
 }
 
 static bool trans_th_sdib(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_store_inc(ctx, a, MO_TE | MO_SQ, true);
+    return gen_store_inc(ctx, a, MO_SQ, true);
 }
 
 static bool trans_th_swia(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_store_inc(ctx, a, MO_TE | MO_SL, false);
+    return gen_store_inc(ctx, a, MO_SL, false);
 }
 
 static bool trans_th_swib(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_store_inc(ctx, a, MO_TE | MO_SL, true);
+    return gen_store_inc(ctx, a, MO_SL, true);
 }
 
 static bool trans_th_shia(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_store_inc(ctx, a, MO_TE | MO_SW, false);
+    return gen_store_inc(ctx, a, MO_SW, false);
 }
 
 static bool trans_th_shib(DisasContext *ctx, arg_th_meminc *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_store_inc(ctx, a, MO_TE | MO_SW, true);
+    return gen_store_inc(ctx, a, MO_SW, true);
 }
 
 static bool trans_th_sbia(DisasContext *ctx, arg_th_meminc *a)
-- 
2.51.0


