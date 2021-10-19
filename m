Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcqz6-0005PF-3H
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 11:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqz1-0005Am-TS
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:55 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyu-0007Zd-2q
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:55 -0400
Received: by mail-pl1-x631.google.com with SMTP id g5so13920845plg.1
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=70ix3AhGljp8w7VYIEJb5B8tKM59m/WakgkEPwbsgro=;
 b=UiZazeEmfmFIwl/fnVf2oVa9qmGGbUcPmAvLbJ8aFZ8HnmGHVEmelARF5uE6yMS3U/
 VCcHh9zUoRDXDCWwVV6kX+gBg/a+7iX9k5/GLzuSJX/fesMbxgN3bTmLbzdezLRXWqNI
 8QQfHq7ra/I0Y+z3Sci/Esdnlei4aLkeX5Q3/vAMFMfjQeeLSj9sM4Z9XK6kVu3wPIX7
 5x9BKfG6942D/krghcWaUT4oM5d6yITyTyQXSjFCcSdlv2x8AXwQ9kikaCruILe0sF6Q
 +SO8FZX5NKAtA/TTR2iJvnomv5lcl5vOh5weJLDsE1C9yMFkVlmUNsHUffOLKp9bo5yr
 ZbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=70ix3AhGljp8w7VYIEJb5B8tKM59m/WakgkEPwbsgro=;
 b=oyI+25lEfcFTsNlEJaWRshj/zTP3aDyj+WzVWmJUIX/AYfGdG3704g9NpJ4Io0Kyg9
 zoSXj8KWVA0JG4WCJqUh2XDsSixSm5jqG6456UGDK0UbaZ1viEKpGvI08fxkQIkRDWu/
 VVxZjs5r7eGG5oAc0ZEH6N8ToZvRrTJ7GwaXGvGdaM2iehPN07n0DCtEAxQS24LOefOs
 s6PrBbIzCj8YeLeQKi6QUbh/Q6QJLWp48ZM4ipDVXEPZzV5EcnYEwA3UOtEdDb7xoaQo
 RxnC0ytzvVwVbY4fy6zHA//9aStKJy83ftIF9+PL40UJ1Giul5cL0vU8jMNsNs7WaEpP
 0Eug==
X-Gm-Message-State: AOAM531mSkRO2VFVHMahSD3wfHTOxHaIJaM8RngN9mOCTPp3qEaVlRFU
 8GE8wE+Lr+Ewltj4h3yGHVASwg==
X-Google-Smtp-Source: ABdhPJwFcM15n2Q3dZIiaBRsgLfF828KElAA22XixQ1dNDvD/fu56fuU/x+Yg4j0GE8okRZOrOQ2Ww==
X-Received: by 2002:a17:902:ed94:b0:138:ca3a:425d with SMTP id
 e20-20020a170902ed9400b00138ca3a425dmr34238412plj.78.1634657086679; 
 Tue, 19 Oct 2021 08:24:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v5 10/16] target/riscv: Use gen_arith_per_ol for RVM
Date: Tue, 19 Oct 2021 08:24:32 -0700
Message-Id: <20211019152438.269077-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 15:24:56 -0000

The multiply high-part instructions require a separate
implementation for RV32 when TARGET_LONG_BITS == 64.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 16 +++++++++++++++
 target/riscv/insn_trans/trans_rvm.c.inc | 26 ++++++++++++++++++++++---
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6ed925c003..5d54570cc9 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -403,6 +403,22 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
     return true;
 }
 
+static bool gen_arith_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                             void (*f_tl)(TCGv, TCGv, TCGv),
+                             void (*f_32)(TCGv, TCGv, TCGv))
+{
+    int olen = get_olen(ctx);
+
+    if (olen != TARGET_LONG_BITS) {
+        if (olen == 32) {
+            f_tl = f_32;
+        } else {
+            g_assert_not_reached();
+        }
+    }
+    return gen_arith(ctx, a, ext, f_tl);
+}
+
 static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, target_long))
 {
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 9a1fe3c799..2af0e5c139 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -33,10 +33,16 @@ static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
     tcg_temp_free(discard);
 }
 
+static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
+{
+    tcg_gen_mul_tl(ret, s1, s2);
+    tcg_gen_sari_tl(ret, ret, 32);
+}
+
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
+    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w);
 }
 
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
@@ -54,10 +60,23 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(rh);
 }
 
+static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+
+    tcg_gen_ext32s_tl(t1, arg1);
+    tcg_gen_ext32u_tl(t2, arg2);
+    tcg_gen_mul_tl(ret, t1, t2);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_gen_sari_tl(ret, ret, 32);
+}
+
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
+    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w);
 }
 
 static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
@@ -71,7 +90,8 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
+    /* gen_mulh_w works for either sign as input. */
+    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w);
 }
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
-- 
2.25.1


