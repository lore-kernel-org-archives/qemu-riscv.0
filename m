Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61715CCA476
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 15:52:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7FPE-0004Bc-7x; Fri, 10 Oct 2025 11:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FPB-0004B8-Bq
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:51:41 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FP2-0002YT-Ua
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:51:41 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4256866958bso1262859f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 08:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760111487; x=1760716287; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d8LJg+M831/BvkdpBsCwSrsSEz+7v6DyZplBFdI7dFw=;
 b=WR4Om0v7Chn5UTGzTLEOZ7Cyor2hSN+Bun+ytNi3RNQR42FsJSQlywUnF8LLtJYJsZ
 2EBdnGpivi0V9njr85lALWG/VTHUzU8oGlEHz5EWxo4+UiWB8AjY5HE/GlrIb8gTVs77
 fps7SiG5WhYwj1OdA5rHMjgiH3+YE3S3ga6HpMftWofDUN3Xg4PngtiCOM5EYCKfhKWN
 ZYjgSIU0evwq2hIH6PtaKaxkaEn/97wG58zRc7dN9H+lZuaWkWsPL1aa9S5wEtBYD1ad
 D/aCeCGlD8TpHS/Fg/e+d1InngPmalJVYdSxKPxyrHxH9Hv4m1SaNBSt+xaPftSZQp2U
 Cu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760111487; x=1760716287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d8LJg+M831/BvkdpBsCwSrsSEz+7v6DyZplBFdI7dFw=;
 b=baasH6trv7q7Z0028JD8PsUG9gMtJ9SP/DKJtWolwXsgz5QipqWJj4M5nvGTOSf5TA
 vkNlQ+EdfDVdnhmZ0uj13F9Yfwi91eOb7zajuJ8BAwIoWrrheaAQunPdWHHbwbhof5/Z
 y5tKXI+E+xiWeUJKYYzrg4GL/QQa0CNPJngzjzd6oNyUAksoz858st9toGeuNs6lXO44
 Kvg9TGeeH2BSJmOC+OySUbU8Mfo90CdKow00RUTX/FpQRsHtfo9BHdrSY1wHAheU7pyl
 U3J0slQMGNOIe+ke5qa15MOEjJhSzg2sD62sj7Jjn44swItZ3xxLC2UO2iXvjm5uiwmE
 zMrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtqD36qPeFCU/UvZo2yz2uSCmZCKJOSNhBm4FtB+aQNApQSdOTjVTa8kEWdWjvx9xpImdhFg+cM7H2@nongnu.org
X-Gm-Message-State: AOJu0Yz1jKjd5FjzZHOBNOqPIqbBWZVjDqFGMaTSdnguTecdevRc0oaZ
 8Ztac7cb/psqTw6m9A8nkXWZfCTY5dQegSvRLmsXQdPR89qqLNvqz2NTtQwgXKUUiuk=
X-Gm-Gg: ASbGncubw3aeWG8FEQXROzZNGzD8H7IuLNBd0SxkOcb733KZroJ+51E8rGKUV5+HkFq
 jMtHrt4jHSeiZCSrFQXDW2iyJmGUO/5oQdFmhXiMKK/OcWp+uOaWGn2UsuxopLM0KD7M7dOJjxD
 zcw99Fe06JC/9fyLaU1+fnytc3+Tihxucoa2iXyEMoThctGWIA9R4BukpX9WbRz1iQsLskxNdlJ
 CMoxdQzFzs+FQUM/bxwcF/HLEt2fme5Xf4OhonCuoL1npCy6FXCqL9BCteZHpVH/EaOw4DOM6+7
 LB1py0P0Lhp9Tmp471dxiX9Vf21PnBjV+kOz7pOqj/ysjQvYDWtPGbvvyVMRir2ipakEKsEvdde
 LRhvva3V+SM0mpgXdJ1BI47TWbvEhqLYTHZtionObiI0pPrU2GB0RshTIPXibfbLn7FEWhi+2pa
 madOtm5cdrE2y+kGNuDrY=
X-Google-Smtp-Source: AGHT+IHyTyj4ZzN7MRqopW4KkDUz0H34e7o9fMfwaEQd4rnJNxZHM+WLp5bDwYyODO2Iu75UC2kdew==
X-Received: by 2002:a05:6000:230e:b0:3ee:15c6:9a6b with SMTP id
 ffacd0b85a97d-4266e8db295mr7424995f8f.48.1760111487394; 
 Fri, 10 Oct 2025 08:51:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57cd11sm4925450f8f.5.2025.10.10.08.51.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 08:51:26 -0700 (PDT)
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
Subject: [PATCH 08/13] target/riscv: Conceal MO_TE within gen_storepair_tl()
Date: Fri, 10 Oct 2025 17:50:39 +0200
Message-ID: <20251010155045.78220-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010155045.78220-1-philmd@linaro.org>
References: <20251010155045.78220-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

All callers of gen_storepair_tl() set the MO_TE flag. Set it once in
the callee.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/insn_trans/trans_xthead.c.inc | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 859cbc26cb2..2f31842791e 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -926,6 +926,7 @@ static bool gen_loadpair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
     addr1 = get_address(ctx, a->rs, imm);
     addr2 = get_address(ctx, a->rs, memop_size(memop) + imm);
 
+    memop |= MO_TE;
     tcg_gen_qemu_ld_tl(t1, addr1, ctx->mem_idx, memop);
     tcg_gen_qemu_ld_tl(t2, addr2, ctx->mem_idx, memop);
     gen_set_gpr(ctx, a->rd1, t1);
@@ -937,19 +938,19 @@ static bool trans_th_ldd(DisasContext *ctx, arg_th_pair *a)
 {
     REQUIRE_XTHEADMEMPAIR(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_loadpair_tl(ctx, a, MO_TE | MO_SQ, 4);
+    return gen_loadpair_tl(ctx, a, MO_SQ, 4);
 }
 
 static bool trans_th_lwd(DisasContext *ctx, arg_th_pair *a)
 {
     REQUIRE_XTHEADMEMPAIR(ctx);
-    return gen_loadpair_tl(ctx, a, MO_TE | MO_SL, 3);
+    return gen_loadpair_tl(ctx, a, MO_SL, 3);
 }
 
 static bool trans_th_lwud(DisasContext *ctx, arg_th_pair *a)
 {
     REQUIRE_XTHEADMEMPAIR(ctx);
-    return gen_loadpair_tl(ctx, a, MO_TE | MO_UL, 3);
+    return gen_loadpair_tl(ctx, a, MO_UL, 3);
 }
 
 static bool gen_storepair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
@@ -964,6 +965,7 @@ static bool gen_storepair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
     addr1 = get_address(ctx, a->rs, imm);
     addr2 = get_address(ctx, a->rs, memop_size(memop) + imm);
 
+    memop |= MO_TE;
     tcg_gen_qemu_st_tl(data1, addr1, ctx->mem_idx, memop);
     tcg_gen_qemu_st_tl(data2, addr2, ctx->mem_idx, memop);
     return true;
@@ -973,13 +975,13 @@ static bool trans_th_sdd(DisasContext *ctx, arg_th_pair *a)
 {
     REQUIRE_XTHEADMEMPAIR(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_storepair_tl(ctx, a, MO_TE | MO_SQ, 4);
+    return gen_storepair_tl(ctx, a, MO_SQ, 4);
 }
 
 static bool trans_th_swd(DisasContext *ctx, arg_th_pair *a)
 {
     REQUIRE_XTHEADMEMPAIR(ctx);
-    return gen_storepair_tl(ctx, a, MO_TE | MO_SL, 3);
+    return gen_storepair_tl(ctx, a, MO_SL, 3);
 }
 
 /* XTheadSync */
-- 
2.51.0


