Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqdm-0004bB-0L
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:14:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdh-0004Qw-G4
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:14:45 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdf-0001QZ-Rj
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:14:45 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so1593522pjp.2
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1VaFmmXL1EVKNQ+ZqOqeimp8aObM/yTnVcjTeVASrNc=;
 b=O2Ks1fP8RrZpJ4YMbHwrjF8IIGei6KqfL6/eoU9se98zJxmlLoYwIzEQboEWYbTfG1
 ABYQF/N92zzAFypSjFUCkwaa3cIUIJDxFOZ+I9y+G/MLIrKTa8xA8FyK1XWnTv7BhoaK
 ykuQvwbt9i4nOU+GZijv8SmRYDJihTRKNLvfar166PfqL4cGAPxy705Dv7v30c5alqId
 ltVLOkm3uYj1XDJxxE3KWOGSy11HGVBc1WKpRWGWLy0xmpCn+6Ag43tmEu/oqQAYkNu5
 sw1b6gHVBO7H3IvK6MPaga6YiWoeGvnaKKEVpkvDRQuoIgHkIlsjLqQSm0YUtYwtYPho
 nSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1VaFmmXL1EVKNQ+ZqOqeimp8aObM/yTnVcjTeVASrNc=;
 b=d/rnh81iIr9YEwZG+SBono5Bo6VjQej+ww4Gux7H6M/TNIdXPIsmexWVhaSrDsysKX
 2h/qVjSJ/MUDerUN0qYmOaCF4Cdffd0RPnsFKvHUB7Npbzrlg4AnURkTOm6ZUIX2KgRj
 y5I3gOcIUuz7wgmzdsCeMYcj5fo9w4ob81/A87GIJg2WfRmovvZ2LDAmXd7GP75JMI/H
 +w6N5LFXaXbxym5EhsSmtwwd3OTw8X2LuSucMOs8c8n2Bgn14AB+af3LGQqNJSk6zYnD
 TXFya5g+i3pCnQrZWgkFYinZAzu8Mg2xpJAjh10JHKdxWo40xKg9OsgjO6mUnpzOZ1zH
 GeYw==
X-Gm-Message-State: AO0yUKWSN9qtU9/Qy42U7uvBZp3gC3Yw0sKLjL6ci84UdM5SlxbiGp1o
 ZxPELR5WZB4bpxjLWHydlw6Kqw==
X-Google-Smtp-Source: AK7set9VB7NLoNxNjpZU28FAV3cYVR373PgoyQjF6RvtsNUY0wWDidE3jg/CCHqT/OGBraAoHXl8dw==
X-Received: by 2002:a17:903:28ce:b0:19c:f1bd:e91b with SMTP id
 kv14-20020a17090328ce00b0019cf1bde91bmr705168plb.36.1677316482606; 
 Sat, 25 Feb 2023 01:14:42 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:14:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 04/76] target/arm: Remove arm_free_cc, a64_free_cc
Date: Fri, 24 Feb 2023 23:13:15 -1000
Message-Id: <20230225091427.1817156-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:14:45 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     |  1 -
 target/arm/translate-a64.c | 17 ++++-------------
 target/arm/translate.c     |  9 ---------
 3 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 3717824b75..7f52f08c5e 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -304,7 +304,6 @@ static inline void gen_a64_update_pc(DisasContext *s, target_long diff)
 #endif
 
 void arm_test_cc(DisasCompare *cmp, int cc);
-void arm_free_cc(DisasCompare *cmp);
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
 MemOp pow2_align(unsigned i);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 98537bc2ef..2a0bba3815 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -319,18 +319,13 @@ static void a64_test_cc(DisasCompare64 *c64, int cc)
 
     arm_test_cc(&c32, cc);
 
-    /* Sign-extend the 32-bit value so that the GE/LT comparisons work
-       * properly.  The NE/EQ comparisons are also fine with this choice.  */
+    /*
+     * Sign-extend the 32-bit value so that the GE/LT comparisons work
+     * properly.  The NE/EQ comparisons are also fine with this choice.
+      */
     c64->cond = c32.cond;
     c64->value = tcg_temp_new_i64();
     tcg_gen_ext_i32_i64(c64->value, c32.value);
-
-    arm_free_cc(&c32);
-}
-
-static void a64_free_cc(DisasCompare64 *c64)
-{
-    tcg_temp_free_i64(c64->value);
 }
 
 static void gen_rebuild_hflags(DisasContext *s)
@@ -5315,7 +5310,6 @@ static void disas_cc(DisasContext *s, uint32_t insn)
     tcg_t0 = tcg_temp_new_i32();
     arm_test_cc(&c, cond);
     tcg_gen_setcondi_i32(tcg_invert_cond(c.cond), tcg_t0, c.value, 0);
-    arm_free_cc(&c);
 
     /* Load the arguments for the new comparison.  */
     if (is_imm) {
@@ -5435,8 +5429,6 @@ static void disas_cond_select(DisasContext *s, uint32_t insn)
         tcg_gen_movcond_i64(c.cond, tcg_rd, c.value, zero, t_true, t_false);
     }
 
-    a64_free_cc(&c);
-
     if (!sf) {
         tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
     }
@@ -6256,7 +6248,6 @@ static void disas_fp_csel(DisasContext *s, uint32_t insn)
     tcg_gen_movcond_i64(c.cond, t_true, c.value, tcg_constant_i64(0),
                         t_true, t_false);
     tcg_temp_free_i64(t_false);
-    a64_free_cc(&c);
 
     /* Note that sregs & hregs write back zeros to the high bits,
        and we've already done the zero-extension.  */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 614c438786..a0a298f8f7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -754,13 +754,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
     cmp->value_global = global;
 }
 
-void arm_free_cc(DisasCompare *cmp)
-{
-    if (!cmp->value_global) {
-        tcg_temp_free_i32(cmp->value);
-    }
-}
-
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label)
 {
     tcg_gen_brcondi_i32(cmp->cond, cmp->value, 0, label);
@@ -771,7 +764,6 @@ void arm_gen_test_cc(int cc, TCGLabel *label)
     DisasCompare cmp;
     arm_test_cc(&cmp, cc);
     arm_jump_cc(&cmp, label);
-    arm_free_cc(&cmp);
 }
 
 void gen_set_condexec(DisasContext *s)
@@ -9125,7 +9117,6 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
 
     arm_test_cc(&c, a->fcond);
     tcg_gen_movcond_i32(c.cond, rn, c.value, zero, rn, rm);
-    arm_free_cc(&c);
 
     store_reg(s, a->rd, rn);
     tcg_temp_free_i32(rm);
-- 
2.34.1


