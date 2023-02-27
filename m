Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWJN-0007E2-V0
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJH-0006wk-LU
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:27 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJ6-0005Ul-Ta
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:27 -0500
Received: by mail-pl1-x631.google.com with SMTP id i3so5562318plg.6
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yrg+WFYxJya6wAchTB9F/B6YD3KKU7NwvfedNNECx5Y=;
 b=ETg8EjBcG8VzUHqiTwkZGxarGGVloeac7FWVACvw69W4/8bs/PsrRm+tbNqeZXrbXs
 h7PW/O+BmkmFlITBvhH6bs9HstcXNd6A7JdI8tNBp8eGUxv7BW59b3OAFpj2L0VYm3My
 1zYTyROwqWZ9S0OrlGEZo9YGvgQRRl2iD/cDGCFQu7x2IVW5ONtyCAfS89hq5OU09a02
 aX4lCbcE9amiKE2kxrY9yNpunb9Dl2mGuxCavzyT8FXcQSEYtdoPpS06q6qE5wK/jqWb
 kQrlHHqGdfEaLZfC+/BUKJwbMVKWOl67j0ps4Ohfmxjw2E7GInIqK77hAfY6+SVLUlZF
 0PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yrg+WFYxJya6wAchTB9F/B6YD3KKU7NwvfedNNECx5Y=;
 b=4TVl+LZ9spinX5iAjg4q5Q6ZOBxI/eGMeOzWFPjWD1Y8L3zuIlFWdubUzfk5Ihdz1b
 tGQgVFs6iQvjE84DqQPx82OBxnpVTDzkmzFI8iv7eUYNc0Tt7yfD1fmDVqkfJ39xlPWH
 ajEgVkF5XLX96ZZiTgNhbHfucRcehGmCHPf/BqEMAyKn3gwfOtmcDlPPkfBAT3rco9X5
 vxMh9uXqemN/GhmdaK78nOOChR9iVVngrW+IKuuJKNXgmj6tooDNhV1tKXJXjqqes0TU
 erVo3ZInIA8C6O6szKMIFObBQ0PlqIayRh7pC9kUYpqGHoawuFnUJ2KO9lmtYwuiKlrJ
 RdHg==
X-Gm-Message-State: AO0yUKVTCEyd+UXOSG1ok5yO48HdX/1lnz+LA5OE6y4fPAnqJPlYRH44
 4AjXYWP+M5KZuYtfqQWoA9LL+Q==
X-Google-Smtp-Source: AK7set94ke7JDJqChhw0fULVV4Tzf83upqFUrxTt4GUCeJbsj8g5cG+a9YN/xR32T8GiZWt77C0Vxw==
X-Received: by 2002:a05:6a20:3b17:b0:cd:1e80:5840 with SMTP id
 c23-20020a056a203b1700b000cd1e805840mr3500794pzh.34.1677476653804; 
 Sun, 26 Feb 2023 21:44:13 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:44:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 34/70] target/ppc: Split out gen_vx_vmul10
Date: Sun, 26 Feb 2023 19:41:57 -1000
Message-Id: <20230227054233.390271-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Mon, 27 Feb 2023 05:44:28 -0000

Move the body out of this large macro.
Use tcg_constant_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vmx-impl.c.inc | 95 +++++++++++++++--------------
 1 file changed, 49 insertions(+), 46 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 05ba9c9492..ee656d6a44 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -171,53 +171,56 @@ static void gen_mtvscr(DisasContext *ctx)
     gen_helper_mtvscr(cpu_env, val);
 }
 
+static void gen_vx_vmul10(DisasContext *ctx, bool add_cin, bool ret_carry)
+{
+    TCGv_i64 t0;
+    TCGv_i64 t1;
+    TCGv_i64 t2;
+    TCGv_i64 avr;
+    TCGv_i64 ten, z;
+
+    if (unlikely(!ctx->altivec_enabled)) {
+        gen_exception(ctx, POWERPC_EXCP_VPU);
+        return;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    avr = tcg_temp_new_i64();
+    ten = tcg_constant_i64(10);
+    z = tcg_constant_i64(0);
+
+    if (add_cin) {
+        get_avr64(avr, rA(ctx->opcode), false);
+        tcg_gen_mulu2_i64(t0, t1, avr, ten);
+        get_avr64(avr, rB(ctx->opcode), false);
+        tcg_gen_andi_i64(t2, avr, 0xF);
+        tcg_gen_add2_i64(avr, t2, t0, t1, t2, z);
+        set_avr64(rD(ctx->opcode), avr, false);
+    } else {
+        get_avr64(avr, rA(ctx->opcode), false);
+        tcg_gen_mulu2_i64(avr, t2, avr, ten);
+        set_avr64(rD(ctx->opcode), avr, false);
+    }
+
+    if (ret_carry) {
+        get_avr64(avr, rA(ctx->opcode), true);
+        tcg_gen_mulu2_i64(t0, t1, avr, ten);
+        tcg_gen_add2_i64(t0, avr, t0, t1, t2, z);
+        set_avr64(rD(ctx->opcode), avr, false);
+        set_avr64(rD(ctx->opcode), z, true);
+    } else {
+        get_avr64(avr, rA(ctx->opcode), true);
+        tcg_gen_mul_i64(t0, avr, ten);
+        tcg_gen_add_i64(avr, t0, t2);
+        set_avr64(rD(ctx->opcode), avr, true);
+    }
+}
+
 #define GEN_VX_VMUL10(name, add_cin, ret_carry)                         \
-static void glue(gen_, name)(DisasContext *ctx)                         \
-{                                                                       \
-    TCGv_i64 t0;                                                        \
-    TCGv_i64 t1;                                                        \
-    TCGv_i64 t2;                                                        \
-    TCGv_i64 avr;                                                       \
-    TCGv_i64 ten, z;                                                    \
-                                                                        \
-    if (unlikely(!ctx->altivec_enabled)) {                              \
-        gen_exception(ctx, POWERPC_EXCP_VPU);                           \
-        return;                                                         \
-    }                                                                   \
-                                                                        \
-    t0 = tcg_temp_new_i64();                                            \
-    t1 = tcg_temp_new_i64();                                            \
-    t2 = tcg_temp_new_i64();                                            \
-    avr = tcg_temp_new_i64();                                           \
-    ten = tcg_const_i64(10);                                            \
-    z = tcg_const_i64(0);                                               \
-                                                                        \
-    if (add_cin) {                                                      \
-        get_avr64(avr, rA(ctx->opcode), false);                         \
-        tcg_gen_mulu2_i64(t0, t1, avr, ten);                            \
-        get_avr64(avr, rB(ctx->opcode), false);                         \
-        tcg_gen_andi_i64(t2, avr, 0xF);                                 \
-        tcg_gen_add2_i64(avr, t2, t0, t1, t2, z);                       \
-        set_avr64(rD(ctx->opcode), avr, false);                         \
-    } else {                                                            \
-        get_avr64(avr, rA(ctx->opcode), false);                         \
-        tcg_gen_mulu2_i64(avr, t2, avr, ten);                           \
-        set_avr64(rD(ctx->opcode), avr, false);                         \
-    }                                                                   \
-                                                                        \
-    if (ret_carry) {                                                    \
-        get_avr64(avr, rA(ctx->opcode), true);                          \
-        tcg_gen_mulu2_i64(t0, t1, avr, ten);                            \
-        tcg_gen_add2_i64(t0, avr, t0, t1, t2, z);                       \
-        set_avr64(rD(ctx->opcode), avr, false);                         \
-        set_avr64(rD(ctx->opcode), z, true);                            \
-    } else {                                                            \
-        get_avr64(avr, rA(ctx->opcode), true);                          \
-        tcg_gen_mul_i64(t0, avr, ten);                                  \
-        tcg_gen_add_i64(avr, t0, t2);                                   \
-        set_avr64(rD(ctx->opcode), avr, true);                          \
-    }                                                                   \
-}                                                                       \
+    static void glue(gen_, name)(DisasContext *ctx)                     \
+    { gen_vx_vmul10(ctx, add_cin, ret_carry); }
 
 GEN_VX_VMUL10(vmul10uq, 0, 0);
 GEN_VX_VMUL10(vmul10euq, 1, 0);
-- 
2.34.1


