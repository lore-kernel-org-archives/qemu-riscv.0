Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELa9-0005vZ-GL
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELa6-0005qT-TW
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:42 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZG-0004ii-Qb
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:40 -0500
Received: by mail-pl1-x635.google.com with SMTP id c6so5884877pls.4
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zggxelJn7xEGVyzBGDuJjR27fAkYzw0xoPZGZDzp+DI=;
 b=VisuC+Ip5u7W5Df4yZw2ra/bK4L+aaxmLjRiPI0JTwtLDfluPWINCP4LBcndxPi7aW
 g3l8Hvf/4Fc8vOu3ONeRS12Ag3XhLAccELa3JXAN1GI92t/2FhNwuGmcZQRSjJ3ubK8X
 QN0s53nX6mP04kyq4PstivRBZ03LkKLtt4QDMvtZ2EE1Gom4p0LQaNDNHtKNhUlZuT7m
 z83oXwE/9eSLowL66/9lKab+3F6sQwdN1nXUrYNjsUxc3YI9xz+X3VI8WshxBu4OslHo
 ZNbR4ECkZAX2ND4cR9fFlZqwCsDDq898uVJjsroJf3srf7PlsPFgn9ZGmN5NQnFfa9ts
 5tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zggxelJn7xEGVyzBGDuJjR27fAkYzw0xoPZGZDzp+DI=;
 b=p55K/HmDn67DYlXhcbhCkKVOFN9eAy76cTtWA/IUosobQSMdkUZ1N/uHp3X4aJm/Qw
 91chyGEF4hJv0g5PENm8xwb10l/ifZ/YYD0aJ1bWIwfh+KmoUV+I47+02NX/xWQFSuLx
 s2UkKVv/tIIMKers3YsyXHYkKaaOYeHSGxCQddtYl0XGe5VNQLOCHHxiqF0+9pNpaf/c
 hKvv5pqy1KPlNjSnNDzKNa/yEzEsf0M1366Gfp96u57jkgcZd/7upzEZLTBXcQDpMq8P
 BubfrqkERL4wRivpljQuKelVwPKTod9Qc2+RvrB0u6aZGs+cEuHbx9DlkewsB9NbmqNW
 gUFA==
X-Gm-Message-State: AFqh2koIASRobe4MccBSr25f+uWpXMjF/lQHKprZzNTS0ay62JTjpGjX
 SPhG+Pr3LVEhThsLS/IxAV7CZA==
X-Google-Smtp-Source: AMrXdXucn3ETdl9rH82UdLM0w5gSwaHo27rHzBCQcprS+ZvTq7UDKV9muRNeEMHkyIPJuU+ritQEGg==
X-Received: by 2002:a17:902:d491:b0:192:b40b:e41 with SMTP id
 c17-20020a170902d49100b00192b40b0e41mr46754706plg.61.1673145468501; 
 Sat, 07 Jan 2023 18:37:48 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 25/36] target/s390x: Use a single return for
 helper_divs64/u64
Date: Sat,  7 Jan 2023 18:37:08 -0800
Message-Id: <20230108023719.2466341-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:38:43 -0000

Pack the quotient and remainder into a single Int128.
Use the divu128 primitive to remove the cpu_abort on
32-bit hosts.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Extended div test case to cover these insns.
---
 target/s390x/helper.h         |  4 ++--
 target/s390x/tcg/int_helper.c | 38 +++++++++--------------------------
 target/s390x/tcg/translate.c  | 14 +++++++++----
 tests/tcg/s390x/div.c         | 35 ++++++++++++++++++++++++++++++++
 4 files changed, 56 insertions(+), 35 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index bc828d976b..593f3c8bee 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -12,8 +12,8 @@ DEF_HELPER_3(clcl, i32, env, i32, i32)
 DEF_HELPER_FLAGS_4(clm, TCG_CALL_NO_WG, i32, env, i32, i32, i64)
 DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, i64, env, s64, s64)
 DEF_HELPER_FLAGS_3(divu32, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, s64, env, s64, s64)
-DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, i128, env, s64, s64)
+DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i128, env, i64, i64, i64)
 DEF_HELPER_3(srst, void, env, i32, i32)
 DEF_HELPER_3(srstu, void, env, i32, i32)
 DEF_HELPER_4(clst, i64, env, i64, i64, i64)
diff --git a/target/s390x/tcg/int_helper.c b/target/s390x/tcg/int_helper.c
index 7260583cf2..eb8e6dd1b5 100644
--- a/target/s390x/tcg/int_helper.c
+++ b/target/s390x/tcg/int_helper.c
@@ -76,46 +76,26 @@ uint64_t HELPER(divu32)(CPUS390XState *env, uint64_t a, uint64_t b64)
 }
 
 /* 64/64 -> 64 signed division */
-int64_t HELPER(divs64)(CPUS390XState *env, int64_t a, int64_t b)
+Int128 HELPER(divs64)(CPUS390XState *env, int64_t a, int64_t b)
 {
     /* Catch divide by zero, and non-representable quotient (MIN / -1).  */
     if (b == 0 || (b == -1 && a == (1ll << 63))) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
-    env->retxl = a % b;
-    return a / b;
+    return int128_make128(a / b, a % b);
 }
 
 /* 128 -> 64/64 unsigned division */
-uint64_t HELPER(divu64)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                        uint64_t b)
+Int128 HELPER(divu64)(CPUS390XState *env, uint64_t ah, uint64_t al, uint64_t b)
 {
-    uint64_t ret;
-    /* Signal divide by zero.  */
-    if (b == 0) {
-        tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
-    }
-    if (ah == 0) {
-        /* 64 -> 64/64 case */
-        env->retxl = al % b;
-        ret = al / b;
-    } else {
-        /* ??? Move i386 idivq helper to host-utils.  */
-#ifdef CONFIG_INT128
-        __uint128_t a = ((__uint128_t)ah << 64) | al;
-        __uint128_t q = a / b;
-        env->retxl = a % b;
-        ret = q;
-        if (ret != q) {
-            tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
+    if (b != 0) {
+        uint64_t r = divu128(&al, &ah, b);
+        if (ah == 0) {
+            return int128_make128(al, r);
         }
-#else
-        /* 32-bit hosts would need special wrapper functionality - just abort if
-           we encounter such a case; it's very unlikely anyways. */
-        cpu_abort(env_cpu(env), "128 -> 64/64 division not implemented\n");
-#endif
     }
-    return ret;
+    /* divide by zero or overflow */
+    tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
 }
 
 uint64_t HELPER(cvd)(int32_t reg)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 169f7ee1b2..6953b81de7 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2409,15 +2409,21 @@ static DisasJumpType op_divu32(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_divs64(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divs64(o->out2, cpu_env, o->in1, o->in2);
-    return_low128(o->out);
+    TCGv_i128 t = tcg_temp_new_i128();
+
+    gen_helper_divs64(t, cpu_env, o->in1, o->in2);
+    tcg_gen_extr_i128_i64(o->out2, o->out, t);
+    tcg_temp_free_i128(t);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_divu64(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divu64(o->out2, cpu_env, o->out, o->out2, o->in2);
-    return_low128(o->out);
+    TCGv_i128 t = tcg_temp_new_i128();
+
+    gen_helper_divu64(t, cpu_env, o->out, o->out2, o->in2);
+    tcg_gen_extr_i128_i64(o->out2, o->out, t);
+    tcg_temp_free_i128(t);
     return DISAS_NEXT;
 }
 
diff --git a/tests/tcg/s390x/div.c b/tests/tcg/s390x/div.c
index 5807295614..6ad9900e08 100644
--- a/tests/tcg/s390x/div.c
+++ b/tests/tcg/s390x/div.c
@@ -33,8 +33,43 @@ static void test_dlr(void)
     assert(r == 1);
 }
 
+static void test_dsgr(void)
+{
+    register int64_t r0 asm("r0") = -1;
+    register int64_t r1 asm("r1") = -4241;
+    int64_t b = 101, q, r;
+
+    asm("dsgr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == -41);
+    assert(r == -100);
+}
+
+static void test_dlgr(void)
+{
+    register uint64_t r0 asm("r0") = 0;
+    register uint64_t r1 asm("r1") = 4243;
+    uint64_t b = 101, q, r;
+
+    asm("dlgr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == 42);
+    assert(r == 1);
+}
+
 int main(void)
 {
     test_dr();
     test_dlr();
+    test_dsgr();
+    test_dlgr();
+    return 0;
 }
-- 
2.34.1


