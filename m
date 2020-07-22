Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAxP-0007eN-TI
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxN-0007bh-30
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:33 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxL-0006Ec-1z
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:32 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q17so650363pls.9
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O3tJNy/mx1SX7dN5+KyOXPJCc/LvDChTHRqMQLei8AM=;
 b=WRoQ2ibAqobzDm8yOt/UqdokkPfCrAEZ9qULnkjMSpLZGq3/8oyYX3xqvdqP8SmSJp
 S+ZP0A5r+VTpbEpeb6ktHBAH95GITgqlGaOHsJ/lS84/TM1LhiloXLbNPQ8uPh/zz/Fp
 w8DjqqFaeAQyMKoIGPxnA5sC7Dw0Um2unCXrt59GdvXJLoR2CE+p8vzfgGTZ8KFtqirI
 mYCJfl31UhNgR+TVscohR6RsbbnefJmS5eWaXLs6zD1IBHJB4p2QBE/PqTUDvAGUESvk
 znvlD0zFJoW1PIEFveqdOFYnlw3Tq9suArHCpvSc5Ywfh4ER3WN+RKLzm0GfzyjGM63+
 YCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O3tJNy/mx1SX7dN5+KyOXPJCc/LvDChTHRqMQLei8AM=;
 b=dvMul0R+npq8NsTVA0PedHUNmDouU7yt1bS1K5/ae66SzvF1wfm+xj5uV4LQIIwoQ6
 SJOHpgZgiJ8Y29hB5crbZrhu+6Zk5y42hKk/poghvDzrqkWutrq9aqID9cnVCRL0aNfN
 jA0QpdYJRxaOXvfhFjr67stCgMcNPv1BwJYvvGkKjIBH3336jdWcovvftPjHKZgfYD+5
 9QxydA3/tFhtCEAmooe2RWdshi8K8EL6l6IvTEldj8RDSkTa6VUVJAUjMZWPGwdKri9x
 j539S7HS8Ykxg7fD9lOO6S5xRPuOikXl9OLMva4pHzmD6/6I/+AVU5Kyrj1XIli/RRbV
 jAQA==
X-Gm-Message-State: AOAM533OyYxZVgzJax+vLlUxe2z3Cmsb7xAiDdD16bwEYkgF8S/XtuTS
 W9sg9jPYUbFLEvp9Wo07y/4rVg==
X-Google-Smtp-Source: ABdhPJyjNAis+n0uSfZEcOr9YsbAZYC9Kh0vD5Q9aAohh0dOZb4EEx/3IlLA7UpCaEd0UBLHjmOGGw==
X-Received: by 2002:a17:90a:d583:: with SMTP id
 v3mr8549065pju.33.1595409749906; 
 Wed, 22 Jul 2020 02:22:29 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:22:29 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v2 70/76] softfloat: add fp16 and uint8/int8 interconvert
 functions
Date: Wed, 22 Jul 2020 17:16:33 +0800
Message-Id: <20200722091641.8834-71-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Jul 2020 09:22:34 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat.c         | 34 ++++++++++++++++++++++++++++++++++
 include/fpu/softfloat.h |  8 ++++++++
 2 files changed, 42 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index e1661f22a5..89634267db 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2142,6 +2142,13 @@ static int64_t round_to_int_and_pack(FloatParts in, FloatRoundMode rmode,
     }
 }
 
+int8_t float16_to_int8_scalbn(float16 a, FloatRoundMode rmode, int scale,
+                              float_status *s)
+{
+    return round_to_int_and_pack(float16_unpack_canonical(a, s),
+                                 rmode, scale, INT8_MIN, INT8_MAX, s);
+}
+
 int16_t float16_to_int16_scalbn(float16 a, FloatRoundMode rmode, int scale,
                                 float_status *s)
 {
@@ -2205,6 +2212,11 @@ int64_t float64_to_int64_scalbn(float64 a, FloatRoundMode rmode, int scale,
                                  rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
+int8_t float16_to_int8(float16 a, float_status *s)
+{
+    return float16_to_int8_scalbn(a, s->float_rounding_mode, 0, s);
+}
+
 int16_t float16_to_int16(float16 a, float_status *s)
 {
     return float16_to_int16_scalbn(a, s->float_rounding_mode, 0, s);
@@ -2355,6 +2367,13 @@ static uint64_t round_to_uint_and_pack(FloatParts in, FloatRoundMode rmode,
     }
 }
 
+uint8_t float16_to_uint8_scalbn(float16 a, FloatRoundMode rmode, int scale,
+                                float_status *s)
+{
+    return round_to_uint_and_pack(float16_unpack_canonical(a, s),
+                                  rmode, scale, UINT8_MAX, s);
+}
+
 uint16_t float16_to_uint16_scalbn(float16 a, FloatRoundMode rmode, int scale,
                                   float_status *s)
 {
@@ -2418,6 +2437,11 @@ uint64_t float64_to_uint64_scalbn(float64 a, FloatRoundMode rmode, int scale,
                                   rmode, scale, UINT64_MAX, s);
 }
 
+uint8_t float16_to_uint8(float16 a, float_status *s)
+{
+    return float16_to_uint8_scalbn(a, s->float_rounding_mode, 0, s);
+}
+
 uint16_t float16_to_uint16(float16 a, float_status *s)
 {
     return float16_to_uint16_scalbn(a, s->float_rounding_mode, 0, s);
@@ -2572,6 +2596,11 @@ float16 int16_to_float16(int16_t a, float_status *status)
     return int64_to_float16_scalbn(a, 0, status);
 }
 
+float16 int8_to_float16(int8_t a, float_status *status)
+{
+    return int64_to_float16_scalbn(a, 0, status);
+}
+
 float32 int64_to_float32_scalbn(int64_t a, int scale, float_status *status)
 {
     FloatParts pa = int_to_float(a, scale, status);
@@ -2697,6 +2726,11 @@ float16 uint16_to_float16(uint16_t a, float_status *status)
     return uint64_to_float16_scalbn(a, 0, status);
 }
 
+float16 uint8_to_float16(uint8_t a, float_status *status)
+{
+    return uint64_to_float16_scalbn(a, 0, status);
+}
+
 float32 uint64_to_float32_scalbn(uint64_t a, int scale, float_status *status)
 {
     FloatParts pa = uint_to_float(a, scale, status);
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 078cad8ad9..5700d2024b 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -136,9 +136,11 @@ float16 uint16_to_float16_scalbn(uint16_t a, int, float_status *status);
 float16 uint32_to_float16_scalbn(uint32_t a, int, float_status *status);
 float16 uint64_to_float16_scalbn(uint64_t a, int, float_status *status);
 
+float16 int8_to_float16(int8_t a, float_status *status);
 float16 int16_to_float16(int16_t a, float_status *status);
 float16 int32_to_float16(int32_t a, float_status *status);
 float16 int64_to_float16(int64_t a, float_status *status);
+float16 uint8_to_float16(uint8_t a, float_status *status);
 float16 uint16_to_float16(uint16_t a, float_status *status);
 float16 uint32_to_float16(uint32_t a, float_status *status);
 float16 uint64_to_float16(uint64_t a, float_status *status);
@@ -187,10 +189,13 @@ float32 float16_to_float32(float16, bool ieee, float_status *status);
 float16 float64_to_float16(float64 a, bool ieee, float_status *status);
 float64 float16_to_float64(float16 a, bool ieee, float_status *status);
 
+int8_t  float16_to_int8_scalbn(float16, FloatRoundMode, int,
+                               float_status *status);
 int16_t float16_to_int16_scalbn(float16, FloatRoundMode, int, float_status *);
 int32_t float16_to_int32_scalbn(float16, FloatRoundMode, int, float_status *);
 int64_t float16_to_int64_scalbn(float16, FloatRoundMode, int, float_status *);
 
+int8_t  float16_to_int8(float16, float_status *status);
 int16_t float16_to_int16(float16, float_status *status);
 int32_t float16_to_int32(float16, float_status *status);
 int64_t float16_to_int64(float16, float_status *status);
@@ -199,6 +204,8 @@ int16_t float16_to_int16_round_to_zero(float16, float_status *status);
 int32_t float16_to_int32_round_to_zero(float16, float_status *status);
 int64_t float16_to_int64_round_to_zero(float16, float_status *status);
 
+uint8_t float16_to_uint8_scalbn(float16 a, FloatRoundMode,
+                                int, float_status *status);
 uint16_t float16_to_uint16_scalbn(float16 a, FloatRoundMode,
                                   int, float_status *status);
 uint32_t float16_to_uint32_scalbn(float16 a, FloatRoundMode,
@@ -206,6 +213,7 @@ uint32_t float16_to_uint32_scalbn(float16 a, FloatRoundMode,
 uint64_t float16_to_uint64_scalbn(float16 a, FloatRoundMode,
                                   int, float_status *status);
 
+uint8_t  float16_to_uint8(float16 a, float_status *status);
 uint16_t float16_to_uint16(float16 a, float_status *status);
 uint32_t float16_to_uint32(float16 a, float_status *status);
 uint64_t float16_to_uint64(float16 a, float_status *status);
-- 
2.17.1


