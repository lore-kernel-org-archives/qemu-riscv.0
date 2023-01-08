Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELaA-00062X-Br
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELa6-0005qP-Rp
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:42 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZE-0004i2-L9
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:38 -0500
Received: by mail-pl1-x632.google.com with SMTP id jl4so5864085plb.8
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0m37yJViirw0Wc/T2o6kI/jHDeYjleRW0O5TzNJ6/Gw=;
 b=h4+cxeTYl00k+rgoM0vv41/Usl7td91koPjOdPmbIrk9Ea10TDSD1uGzQBwgxvqv48
 OsoS1rK0TA8yfiadWo4InJ+9YJ3xPMKYi5rxK0YG4SyEJK9yPu8ZtnmSo6J79MaJbzBc
 wjQvhWqFw4mTmUFfLQc6eZbWD7QbT/ByITs7ttr6HJ7GThC0EbQkEq+kVYiawTXFKTV+
 h1jSXt5sM3RMsEhpU8r1OB7CiJiAtFwROctYRt3qP1RmJjmvP5/wYUKqt4En2ocWs4UK
 c1Qvt/KAy8hd2ecxd8W+Swd/WGhGKr7RonpbqmsH6mI/EPiHlxD+KurTJIjmsCoDd3Ct
 hU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0m37yJViirw0Wc/T2o6kI/jHDeYjleRW0O5TzNJ6/Gw=;
 b=DITFXC5O8yGA649CyRi5Vc41frsS3F6GjNs4XsoFTKS2u8Z+Gekkda4WZR3gY45LaE
 JUb6kk3crI4vIFiyF45z++a3ayzgoYqEEbsNGMUBfBUcafHDQvxadO0RzaY1mU8Z9L0k
 TwuqnRy40qqZJi+CnV/tHBfQM0k4AaTDlZp/oRIlc2rbvG9mIitgGGf4UsjYksIWVSna
 5QaT2T/Z7LGBFHcfvOynGmKqy/JjhU8qWhhksQi4WZi3C+/VNx9Igc1SUpCzFR5/JuY5
 BUxOFpHwwWDQn5enfU3IIzi/tfc9CRK2b3IHnTnWtsIxVmLmvMh/5YB4x895fsRjv04x
 k0Kg==
X-Gm-Message-State: AFqh2kqTlKGwgPf1nYXLTjuF4lTSDJOFOThP1N/rbJt8NOQ4CVxHm6I0
 n4zg5k0OTczKLVitxYVbwuXTAA==
X-Google-Smtp-Source: AMrXdXuWbDFrK2c7CNgFID6FzP7cLwTU9VSqrQ7/GmJ/yBTUQ1xfxnwlqiQisWjVWs96GZGs2VCj1Q==
X-Received: by 2002:a17:903:40c4:b0:193:197e:494f with SMTP id
 t4-20020a17090340c400b00193197e494fmr5227036pld.27.1673145467340; 
 Sat, 07 Jan 2023 18:37:47 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 24/36] target/s390x: Use a single return for
 helper_divs32/u32
Date: Sat,  7 Jan 2023 18:37:07 -0800
Message-Id: <20230108023719.2466341-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Pack the quotient and remainder into a single uint64_t.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix operand ordering; use tcg_extr32_i64.
---
 target/s390x/helper.h         |  2 +-
 target/s390x/tcg/int_helper.c | 26 +++++++++++++-------------
 target/s390x/tcg/translate.c  |  8 ++++----
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 93923ca153..bc828d976b 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -10,7 +10,7 @@ DEF_HELPER_FLAGS_4(clc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
 DEF_HELPER_3(mvcl, i32, env, i32, i32)
 DEF_HELPER_3(clcl, i32, env, i32, i32)
 DEF_HELPER_FLAGS_4(clm, TCG_CALL_NO_WG, i32, env, i32, i32, i64)
-DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, s64, env, s64, s64)
+DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, i64, env, s64, s64)
 DEF_HELPER_FLAGS_3(divu32, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, s64, env, s64, s64)
 DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
diff --git a/target/s390x/tcg/int_helper.c b/target/s390x/tcg/int_helper.c
index 954542388a..7260583cf2 100644
--- a/target/s390x/tcg/int_helper.c
+++ b/target/s390x/tcg/int_helper.c
@@ -34,45 +34,45 @@
 #endif
 
 /* 64/32 -> 32 signed division */
-int64_t HELPER(divs32)(CPUS390XState *env, int64_t a, int64_t b64)
+uint64_t HELPER(divs32)(CPUS390XState *env, int64_t a, int64_t b64)
 {
-    int32_t ret, b = b64;
-    int64_t q;
+    int32_t b = b64;
+    int64_t q, r;
 
     if (b == 0) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    ret = q = a / b;
-    env->retxl = a % b;
+    q = a / b;
+    r = a % b;
 
     /* Catch non-representable quotient.  */
-    if (ret != q) {
+    if (q != (int32_t)q) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    return ret;
+    return deposit64(q, 32, 32, r);
 }
 
 /* 64/32 -> 32 unsigned division */
 uint64_t HELPER(divu32)(CPUS390XState *env, uint64_t a, uint64_t b64)
 {
-    uint32_t ret, b = b64;
-    uint64_t q;
+    uint32_t b = b64;
+    uint64_t q, r;
 
     if (b == 0) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    ret = q = a / b;
-    env->retxl = a % b;
+    q = a / b;
+    r = a % b;
 
     /* Catch non-representable quotient.  */
-    if (ret != q) {
+    if (q != (uint32_t)q) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    return ret;
+    return deposit64(q, 32, 32, r);
 }
 
 /* 64/64 -> 64 signed division */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a339b277e9..169f7ee1b2 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2395,15 +2395,15 @@ static DisasJumpType op_diag(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_divs32(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divs32(o->out2, cpu_env, o->in1, o->in2);
-    return_low128(o->out);
+    gen_helper_divs32(o->out, cpu_env, o->in1, o->in2);
+    tcg_gen_extr32_i64(o->out2, o->out, o->out);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_divu32(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divu32(o->out2, cpu_env, o->in1, o->in2);
-    return_low128(o->out);
+    gen_helper_divu32(o->out, cpu_env, o->in1, o->in2);
+    tcg_gen_extr32_i64(o->out2, o->out, o->out);
     return DISAS_NEXT;
 }
 
-- 
2.34.1


