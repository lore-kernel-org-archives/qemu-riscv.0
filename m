Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jylZY-0000WB-MK
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jul 2020 20:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZU-0000Le-Sc
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:20 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZT-0008G9-AC
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:20 -0400
Received: by mail-pf1-x42d.google.com with SMTP id t11so4050655pfq.11
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2020 17:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jQCpNdFJsrF3Bpi0rRRCXqsUrN96754LDnpff+tQIzo=;
 b=FScUEfH+7aJujA9JSdolRAFuUDhHsshCEERdH9W9YZSRKL/KK/ZQsHZL+zn+iNOTsk
 FJAmFC0hc3hPsj3xkJEUkQpUG+TS1RPZDrhIKySvy2ApU0W9w1NYKkALTK+ONPCTrpws
 J5WH6aOhDU6jrfUwYLZzk61TkcUHDnAIydTHzdvoZZrhHZWiVNAiQSmrVqUttLZRRhAl
 ClcKyQDVEaI+Wd5IGe+Iw5wV86HJ93TnaHhInjRwCOprPbSMmozOxl6ya3bfaiKuhYWa
 HHVGd4ETYkVEfcJ0DoY5nr2ydDGeVVDSvZrfda7/wc32U8Znms5Kzw9GBjsb8Eb7q8fQ
 b5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jQCpNdFJsrF3Bpi0rRRCXqsUrN96754LDnpff+tQIzo=;
 b=nxm9XjNixLi9OAYizthD/CaP4kFC0ok8fdC+HnpB37gOBcxKU9AsnIKUMfm2xooXbh
 saRjBmBuL59TxlaVLI6+g+0kUYZZXe4J+cwCr9tYbCtSR77VEEcvQnoVzPMwsRGtdLi6
 mN+hHSRORJ3vgB/lA+y3KLRGPfzr3cTIA7ni0rVG9xTjz/Zc7rxF3tEUbRLaz3tmZdjj
 bJAxqmmlDjBaF93f8b6vWB6cRW2yu01v1sg0GtA1ZTt3tx16dSdJxhsduJceKRgMsXP1
 B8/LgR3QNzbAT2zyhYqO+XqHZJ7UnKFboOiGGISvl+7CF9qmmO1lcrwtsdb4P2mtNfXr
 1q2g==
X-Gm-Message-State: AOAM53331q77ELNBnT0m/MaLWJLctmjXuwcIGihn9Fhv03nCOLddY+6b
 XtO4ispNrgLx785y8djr8FYArQ==
X-Google-Smtp-Source: ABdhPJwJpM0IToCX7H1EapTXmYY8AmBjtWlS0t+IfEhdMMHDFQjM4DNvrOefl4ODTNMaCzGEDy0FNA==
X-Received: by 2002:a65:6416:: with SMTP id a22mr6212003pgv.392.1595550497983; 
 Thu, 23 Jul 2020 17:28:17 -0700 (PDT)
Received: from localhost.localdomain (216-160-65-90.tukw.qwest.net.
 [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id q20sm4224635pfn.111.2020.07.23.17.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 17:28:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com, qemu-riscv@nongnu.org, alistair23@gmail.com,
 zhiwei_liu@c-sky.com
Subject: [PATCH v2 7/7] target/riscv: check before allocating TCG temps
Date: Thu, 23 Jul 2020 17:28:07 -0700
Message-Id: <20200724002807.441147-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724002807.441147-1-richard.henderson@linaro.org>
References: <20200724002807.441147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jul 2020 00:28:21 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-Id: <20200626205917.4545-5-zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvd.inc.c | 8 ++++----
 target/riscv/insn_trans/trans_rvf.inc.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.inc.c b/target/riscv/insn_trans/trans_rvd.inc.c
index ea1044f13b..4f832637fa 100644
--- a/target/riscv/insn_trans/trans_rvd.inc.c
+++ b/target/riscv/insn_trans/trans_rvd.inc.c
@@ -20,10 +20,10 @@
 
 static bool trans_fld(DisasContext *ctx, arg_fld *a)
 {
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
 
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
@@ -35,10 +35,10 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
 
 static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 {
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
index 0d04677a02..16df9c5ee2 100644
--- a/target/riscv/insn_trans/trans_rvf.inc.c
+++ b/target/riscv/insn_trans/trans_rvf.inc.c
@@ -25,10 +25,10 @@
 
 static bool trans_flw(DisasContext *ctx, arg_flw *a)
 {
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
 
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
@@ -41,11 +41,11 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
 
 static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
 {
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
     TCGv t0 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
 
-    REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
     tcg_gen_addi_tl(t0, t0, a->imm);
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
-- 
2.25.1


