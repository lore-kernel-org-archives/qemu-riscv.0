Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWEY-0001dg-1a
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDR-0003lj-SE
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:26 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDL-000351-9G
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:24 -0500
Received: by mail-pg1-x52f.google.com with SMTP id h31so2839166pgl.6
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q9wHXNcMEZUrRMgfAcdIxce5Bu1q4nxsaHlTAC4B1OY=;
 b=EhKJbBxkfjnURvGUl7bln4dtRg6tbtk5xv5/Z+hnTzLmpDyM3dZUfAVkOpmmlWsIk5
 3wkM81bfPh1Y5TSFfPOl1ru8B6wmlZLTD8UteIEq1vsKh2FsjnxdzQ3JToDngA3DctyD
 YcYgigHR9515FJNTFJh8XNU8PIR+WmQBZcwX962JIZu0sj9S3wiPXmEKi1X/yuA8MxW9
 1A1x2IJ2C6FceHX1vvKKdWvee/ImK9vTFhkKVYJQ7+yyw5HQn1unWQh4e3VcWBmsaw87
 iR2+mWIWxG0dZd4o9YY2rWlG6Ljt5x8Jva43Pwlwsam9LRZvsEHqZfXrhh7UXllctzU3
 OtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q9wHXNcMEZUrRMgfAcdIxce5Bu1q4nxsaHlTAC4B1OY=;
 b=XCIjW3rwwbCH5D7epE2SluVH53Qh9tG3DHeGhPzAuStyL/nQcaZ/BWor8EmkF/OIpm
 3af3qcoZtULjAiZNwnSD8PQDNA+ZrsardnBV1yruWtBi0WpitS/FN5QhIABqey2jTeKU
 BHJXkoYtXG6XNBejDH5tx+x7+eHFO6ptSjwu69Wgb3uNo0i0PYg1ZK191TJejExrMuah
 Cip7YLbu4L8NCXk3YcRgrLL9JLk/Gjmf7rrc2vG6GZktMVMC8cVQRsFB9kEx4H48tm2Z
 q4QWF38AHXS0I/ur1sG5jAHfEPNSvNjhZdudBoXCig52EIKlm0ChEXu8PP7z9I2/sWo5
 uBWw==
X-Gm-Message-State: AO0yUKUYiqiwg/mcfSCmysxEYFDiqFGSmzKOQwQfwft+FAHDcEOYoSzr
 oMf6Gmz6p7Zc7Xh2o/NUssLuVA==
X-Google-Smtp-Source: AK7set84qnXwIRwJ+L/A1THi+y4q3XgHWiGWt3Mlyz//rLtjOUG+biaztaKcATRui/flw+bdOL/9Tg==
X-Received: by 2002:a05:6a00:2195:b0:5a8:445d:d352 with SMTP id
 h21-20020a056a00219500b005a8445dd352mr8665480pfi.11.1677476296853; 
 Sun, 26 Feb 2023 21:38:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 26/31] target/mips: Don't use tcg_temp_local_new
Date: Sun, 26 Feb 2023 19:36:56 -1000
Message-Id: <20230227053701.368744-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:38:28 -0000

Since tcg_temp_new is now identical, use that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c              | 57 ++++++------------------
 target/mips/tcg/nanomips_translate.c.inc |  4 +-
 2 files changed, 16 insertions(+), 45 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index bd70fcad25..8cad3d15a0 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -2400,7 +2400,7 @@ static void gen_arith_imm(DisasContext *ctx, uint32_t opc,
     switch (opc) {
     case OPC_ADDI:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2434,7 +2434,7 @@ static void gen_arith_imm(DisasContext *ctx, uint32_t opc,
 #if defined(TARGET_MIPS64)
     case OPC_DADDI:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2630,7 +2630,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
     switch (opc) {
     case OPC_ADD:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2666,7 +2666,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_SUB:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2707,7 +2707,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
 #if defined(TARGET_MIPS64)
     case OPC_DADD:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2741,7 +2741,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_DSUB:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -3759,26 +3759,8 @@ static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
         return;
     }
 
-    switch (opc) {
-    case OPC_MULT_G_2E:
-    case OPC_MULT_G_2F:
-    case OPC_MULTU_G_2E:
-    case OPC_MULTU_G_2F:
-#if defined(TARGET_MIPS64)
-    case OPC_DMULT_G_2E:
-    case OPC_DMULT_G_2F:
-    case OPC_DMULTU_G_2E:
-    case OPC_DMULTU_G_2F:
-#endif
-        t0 = tcg_temp_new();
-        t1 = tcg_temp_new();
-        break;
-    default:
-        t0 = tcg_temp_local_new();
-        t1 = tcg_temp_local_new();
-        break;
-    }
-
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
     gen_load_gpr(t0, rs);
     gen_load_gpr(t1, rt);
 
@@ -3955,21 +3937,10 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
     TCGCond cond;
 
     opc = MASK_LMMI(ctx->opcode);
-    switch (opc) {
-    case OPC_ADD_CP2:
-    case OPC_SUB_CP2:
-    case OPC_DADD_CP2:
-    case OPC_DSUB_CP2:
-        t0 = tcg_temp_local_new_i64();
-        t1 = tcg_temp_local_new_i64();
-        break;
-    default:
-        t0 = tcg_temp_new_i64();
-        t1 = tcg_temp_new_i64();
-        break;
-    }
-
     check_cp1_enabled(ctx);
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
     gen_load_fpr64(ctx, t0, rs);
     gen_load_fpr64(ctx, t1, rt);
 
@@ -8650,7 +8621,7 @@ static void gen_mftr(CPUMIPSState *env, DisasContext *ctx, int rt, int rd,
                      int u, int sel, int h)
 {
     int other_tc = env->CP0_VPEControl & (0xff << CP0VPECo_TargTC);
-    TCGv t0 = tcg_temp_local_new();
+    TCGv t0 = tcg_temp_new();
 
     if ((env->CP0_VPEConf0 & (1 << CP0VPEC0_MVP)) == 0 &&
         ((env->tcs[other_tc].CP0_TCBind & (0xf << CP0TCBd_CurVPE)) !=
@@ -8878,7 +8849,7 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
                      int u, int sel, int h)
 {
     int other_tc = env->CP0_VPEControl & (0xff << CP0VPECo_TargTC);
-    TCGv t0 = tcg_temp_local_new();
+    TCGv t0 = tcg_temp_new();
 
     gen_load_gpr(t0, rt);
     if ((env->CP0_VPEConf0 & (1 << CP0VPEC0_MVP)) == 0 &&
@@ -11409,7 +11380,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
     case OPC_ALNV_PS:
         check_ps(ctx);
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv_i32 fp = tcg_temp_new_i32();
             TCGv_i32 fph = tcg_temp_new_i32();
             TCGLabel *l1 = gen_new_label();
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 812c111e3c..faf6d679bd 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -1017,8 +1017,8 @@ static void gen_llwp(DisasContext *ctx, uint32_t base, int16_t offset,
 static void gen_scwp(DisasContext *ctx, uint32_t base, int16_t offset,
                     uint32_t reg1, uint32_t reg2, bool eva)
 {
-    TCGv taddr = tcg_temp_local_new();
-    TCGv lladdr = tcg_temp_local_new();
+    TCGv taddr = tcg_temp_new();
+    TCGv lladdr = tcg_temp_new();
     TCGv_i64 tval = tcg_temp_new_i64();
     TCGv_i64 llval = tcg_temp_new_i64();
     TCGv_i64 val = tcg_temp_new_i64();
-- 
2.34.1


