Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E98CCA476
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 15:52:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7FP9-0004AK-9Y; Fri, 10 Oct 2025 11:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FP6-0004A2-Pu
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:51:36 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FOw-0002W6-Td
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:51:36 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so1350788f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760111482; x=1760716282; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=caCZcdTZcK2izzqG8Sgv3bdl6ME2ZyIpYJtnkxpQrBs=;
 b=bFHEKYtrwJY8BLfd/MJO56JpHTg3U/0ow0wGmqQ6O20Cyj2/E3EXBtKR34PPZnTwkc
 80vOR9VPootNn2fPAGYLGNAjcyU2S10vxRj86hVVe3MsjqsdBqnE0DWd5hkit76s3+Dk
 CdUZlZxis1eGVhqOCyOH+ZNf85BkP6tIMDNt01lGp5CcgmN43nmEMs3Yc/YGN29W0OfM
 ApEuv16Te3gUeWAlK3dROfSZhAIQoGwajYcv3BKsulrjeKhZ2OR6FhhTZd7R9zhzV05v
 m2N9Y/mXR1ZcltPe9joXYuwiV8jPhFMO3oiO8yaB/yb1HaF68lPzzHPbbMHXR6tLRuPs
 cgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760111482; x=1760716282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=caCZcdTZcK2izzqG8Sgv3bdl6ME2ZyIpYJtnkxpQrBs=;
 b=Kj8qljOvQ6g4ZUx9dcHkCulBTYr1y4C8Jp0Tss8vyUfnxteoWr9EmmGeypU5zHbxhb
 DpSn+wYoOgdlZbdZHbdUFi5nJenGCq8Vz5jpU99drsbE1pRIBndzB6ey+OaV26mXmf9J
 YOZpZUhmaVEvD/FbsiLfTQSV4buaGq82xuthCjXml5ylMWelXTrcVRhgDsyNf/DFLH+8
 5+cPAaMg1oQNnO7LGsIn1Bg+vAfgjbtpuNU1oNt2SOoYFlfuvdDgw1RzUUcNfgeYMChZ
 v2C9vHaUKFohxtZPzuCbgVcrU5SQOUvGBbeSiY0JeSp2bQz0/ndpMwWq2cPw1keKwx0V
 y7WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdOXQZc/etCArflMaeyaDe9Y7xKgvahSEbJOWOCE1EcA1jlb1mc6ce5nvSVGmSKVNlXfXlX5CGBDf+@nongnu.org
X-Gm-Message-State: AOJu0YzZFy0HsJ5nNWy4N2oknNJVD/HkHki/Ti1BjpkcdIWQAQz8dazh
 rtr02/GT0biaBjfVPH2jdu2y/u4mAfTpU2YvxqNDqLzsY04qhByuZwRpW5meU4qJ8G8=
X-Gm-Gg: ASbGncuMvjY0/avKRDgs7p0iR0wYTY8/AADd0jNqpnik5ff3JkIsbtQ1j7JHqtZSz/u
 H/FBYQYC1nuTMndW/D0YLDqLWSWgJuJm7HuHKWf9Db/nkB9Lux4k4NOrXLH7n9wdg2y8rH1oLG7
 B9BuHHqatZFLS84IGHXNSHWFwnmTn88Eaz60rhbr6dXZLqDs+1kJc5kz+arH7HInQb+BWuak1R0
 oFG+ZHhxqRnARBbz5NPDdm8idC93MFZChk+3NBq5TWNmR4WE38YgAstGlI3sD1pkiwRMJ0xf6YY
 /88Pw0Q5W3VqJgbuh1Bcb/SFyHC/cNFPETPah89M6huFB6xTLhYEGQfABquXmWQoPqxaPck/Shr
 YJpUM/NMueO8PPTtwC6h7kqs/3e0QteHr1SwCVSAlUQHLT/40EnLLJqCpbWyUgLLPYKhfH6sJGV
 u+ec65nG3SLE8GuAwXHJA=
X-Google-Smtp-Source: AGHT+IGF7GmDeGBEtquYI6CzkkaQKIuOdBtgkItLXocniOCzY4QqLiy5I42+Z8c9SucK6vOSORVbEw==
X-Received: by 2002:a05:6000:2483:b0:3eb:4e88:55e with SMTP id
 ffacd0b85a97d-4266e7dfaa1mr7815794f8f.41.1760111482482; 
 Fri, 10 Oct 2025 08:51:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e8207sm4622865f8f.47.2025.10.10.08.51.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 08:51:22 -0700 (PDT)
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
Subject: [PATCH 07/13] target/riscv: Conceal MO_TE within gen_fload_idx() /
 gen_fstore_idx()
Date: Fri, 10 Oct 2025 17:50:38 +0200
Message-ID: <20251010155045.78220-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010155045.78220-1-philmd@linaro.org>
References: <20251010155045.78220-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

All callers of gen_fload_idx() / gen_fstore_idx() set the MO_TE flag.
Set it once in the callees.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/insn_trans/trans_xthead.c.inc | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 70c563664ab..859cbc26cb2 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -349,6 +349,7 @@ static bool gen_fload_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memop,
     TCGv_i64 rd = cpu_fpr[a->rd];
     TCGv addr = get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, zext_offs);
 
+    memop |= MO_TE;
     tcg_gen_qemu_ld_i64(rd, addr, ctx->mem_idx, memop);
     if ((memop & MO_SIZE) == MO_32) {
         gen_nanbox_s(rd, rd);
@@ -369,6 +370,7 @@ static bool gen_fstore_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memop,
     TCGv_i64 rd = cpu_fpr[a->rd];
     TCGv addr = get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, zext_offs);
 
+    memop |= MO_TE;
     tcg_gen_qemu_st_i64(rd, addr, ctx->mem_idx, memop);
 
     return true;
@@ -379,7 +381,7 @@ static bool trans_th_flrd(DisasContext *ctx, arg_th_memidx *a)
     REQUIRE_XTHEADFMEMIDX(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    return gen_fload_idx(ctx, a, MO_TE | MO_UQ, false);
+    return gen_fload_idx(ctx, a, MO_UQ, false);
 }
 
 static bool trans_th_flrw(DisasContext *ctx, arg_th_memidx *a)
@@ -387,7 +389,7 @@ static bool trans_th_flrw(DisasContext *ctx, arg_th_memidx *a)
     REQUIRE_XTHEADFMEMIDX(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    return gen_fload_idx(ctx, a, MO_TE | MO_UL, false);
+    return gen_fload_idx(ctx, a, MO_UL, false);
 }
 
 static bool trans_th_flurd(DisasContext *ctx, arg_th_memidx *a)
@@ -395,7 +397,7 @@ static bool trans_th_flurd(DisasContext *ctx, arg_th_memidx *a)
     REQUIRE_XTHEADFMEMIDX(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    return gen_fload_idx(ctx, a, MO_TE | MO_UQ, true);
+    return gen_fload_idx(ctx, a, MO_UQ, true);
 }
 
 static bool trans_th_flurw(DisasContext *ctx, arg_th_memidx *a)
@@ -403,7 +405,7 @@ static bool trans_th_flurw(DisasContext *ctx, arg_th_memidx *a)
     REQUIRE_XTHEADFMEMIDX(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    return gen_fload_idx(ctx, a, MO_TE | MO_UL, true);
+    return gen_fload_idx(ctx, a, MO_UL, true);
 }
 
 static bool trans_th_fsrd(DisasContext *ctx, arg_th_memidx *a)
@@ -411,7 +413,7 @@ static bool trans_th_fsrd(DisasContext *ctx, arg_th_memidx *a)
     REQUIRE_XTHEADFMEMIDX(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    return gen_fstore_idx(ctx, a, MO_TE | MO_UQ, false);
+    return gen_fstore_idx(ctx, a, MO_UQ, false);
 }
 
 static bool trans_th_fsrw(DisasContext *ctx, arg_th_memidx *a)
@@ -419,7 +421,7 @@ static bool trans_th_fsrw(DisasContext *ctx, arg_th_memidx *a)
     REQUIRE_XTHEADFMEMIDX(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    return gen_fstore_idx(ctx, a, MO_TE | MO_UL, false);
+    return gen_fstore_idx(ctx, a, MO_UL, false);
 }
 
 static bool trans_th_fsurd(DisasContext *ctx, arg_th_memidx *a)
@@ -427,7 +429,7 @@ static bool trans_th_fsurd(DisasContext *ctx, arg_th_memidx *a)
     REQUIRE_XTHEADFMEMIDX(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    return gen_fstore_idx(ctx, a, MO_TE | MO_UQ, true);
+    return gen_fstore_idx(ctx, a, MO_UQ, true);
 }
 
 static bool trans_th_fsurw(DisasContext *ctx, arg_th_memidx *a)
@@ -435,7 +437,7 @@ static bool trans_th_fsurw(DisasContext *ctx, arg_th_memidx *a)
     REQUIRE_XTHEADFMEMIDX(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    return gen_fstore_idx(ctx, a, MO_TE | MO_UL, true);
+    return gen_fstore_idx(ctx, a, MO_UL, true);
 }
 
 /* XTheadFmv */
-- 
2.51.0


