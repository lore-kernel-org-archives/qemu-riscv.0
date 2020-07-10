Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscj-0006Mn-9Q
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqg5-0006Km-C3
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:49 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqg3-000744-80
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:49 -0400
Received: by mail-pf1-x429.google.com with SMTP id a14so2398818pfi.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p0+5sllnaV2tm87OEkeWNPkIZ/rbPv0yLmAGeCI7suI=;
 b=ZQmF/pVKTChxEFbi0wTDQERnb3/xD4+NjlJdj2p8h4IcFUXB4flyDNsoENq2VWAqMz
 +fnwVbQC8fXgU9Be9wuCnNMvNCtBVrImCTsD+DTy70OEQ4osnfwYDorKDn6cERqlLznO
 JuTqS75OvD3BWOsGyiv6aG0GtSnXmYY/f6LPArIviofoKWW6Ak4gmxeilVMwnXLrJKyF
 0Xwe9hMHTpLhit0IWKo09yor6IIyV9W0MbnaChAGAzI+39W93w6eHpCOEWSQ3zPH3FBg
 33Y+yjqmkMyI2psqFVp7NEZdi5n5af59P0cK80TGN6BZYNmg1lRTccis6diGFxHZI/jI
 R8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p0+5sllnaV2tm87OEkeWNPkIZ/rbPv0yLmAGeCI7suI=;
 b=r+xjRbgn99SBaCyaZ0wEi/q+Rqal8+VIteRl3ru88ihKE1xjenPu4OOhBmlu5REAj6
 v35almh5p5zln5KqS1vN+nCzaj4czO92+iFZfsec7/sI4KgErwxAX2tj0DqloOAR4JCa
 xAjy/zn9cSJ2LOdNIx47SEUXLJy+HmdbWtyiSHe4ctPBzqeT8wuKQW9jxGhWkz8i8ZOD
 y1BL+xPZJs51y8DW9Q4rKW2NWP7c3v6povq7NcjeHuWk5wlWnn6cfWp4VM1NJRWQprQd
 /bGpfWHAxh91q1pLyA0B0gISUqSPusm5JZpEQkg0/imtlRpQB7niaG75p6CNOrMn8WA0
 6Frw==
X-Gm-Message-State: AOAM532A6/Ovl7jb501iK+EVx49y2Csn6TIwqv7gUwozm77Vj5sfTw1x
 qRzE6Y5fm2yYxcnfb8c8E50U0w==
X-Google-Smtp-Source: ABdhPJzkDAAjPBqznzJ+F9HN993gaixcaYDTnhqjdNQxUjX0aAksifB/O9NyYshOYEnnzHNBzcb/4w==
X-Received: by 2002:a05:6a00:2257:: with SMTP id
 i23mr54770187pfu.25.1594378485889; 
 Fri, 10 Jul 2020 03:54:45 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:54:45 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC 63/65] fpu: implement full set compare for fp16
Date: Fri, 10 Jul 2020 18:49:17 +0800
Message-Id: <20200710104920.13550-64-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:54:49 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 fpu/softfloat.c         | 240 ++++++++++++++++++++++++++++++++++++++++
 include/fpu/softfloat.h |   8 ++
 2 files changed, 248 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 028b857167..8bebea1142 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -401,6 +401,34 @@ float64_gen2(float64 xa, float64 xb, float_status *s,
     return soft(ua.s, ub.s, s);
 }
 
+/*----------------------------------------------------------------------------
+| Returns the fraction bits of the half-precision floating-point value `a'.
+*----------------------------------------------------------------------------*/
+
+static inline uint32_t extractFloat16Frac(float16 a)
+{
+    return float16_val(a) & 0x3ff;
+}
+
+/*----------------------------------------------------------------------------
+| Returns the exponent bits of the half-precision floating-point value `a'.
+*----------------------------------------------------------------------------*/
+
+static inline int extractFloat16Exp(float16 a)
+{
+    return (float16_val(a) >> 10) & 0x1f;
+}
+
+/*----------------------------------------------------------------------------
+| Returns the sign bit of the half-precision floating-point value `a'.
+*----------------------------------------------------------------------------*/
+
+static inline bool extractFloat16Sign(float16 a)
+{
+    return float16_val(a) >> 15;
+}
+
+
 /*----------------------------------------------------------------------------
 | Returns the fraction bits of the single-precision floating-point value `a'.
 *----------------------------------------------------------------------------*/
@@ -5006,6 +5034,218 @@ float64 float64_log2(float64 a, float_status *status)
     return normalizeRoundAndPackFloat64(zSign, 0x408, zSig, status);
 }
 
+/*----------------------------------------------------------------------------
+| Returns 1 if the half-precision floating-point value `a' is equal to
+| the corresponding value `b', and 0 otherwise.  The invalid exception is
+| raised if either operand is a NaN.  Otherwise, the comparison is performed
+| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
+*----------------------------------------------------------------------------*/
+
+int float16_eq(float16 a, float16 b, float_status *status)
+{
+    uint16_t av, bv;
+    a = float16_squash_input_denormal(a, status);
+    b = float16_squash_input_denormal(b, status);
+
+    if (((extractFloat16Exp(a) == 0x1F) && extractFloat16Frac(a))
+        || ((extractFloat16Exp(b) == 0x1F) && extractFloat16Frac(b))) {
+        float_raise(float_flag_invalid, status);
+        return 0;
+    }
+    av = float16_val(a);
+    bv = float16_val(b);
+    return (av == bv) || ((uint16_t) ((av | bv) << 1) == 0);
+}
+
+/*----------------------------------------------------------------------------
+| Returns 1 if the half-precision floating-point value `a' is less than
+| or equal to the corresponding value `b', and 0 otherwise.  The invalid
+| exception is raised if either operand is a NaN.  The comparison is performed
+| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
+*----------------------------------------------------------------------------*/
+
+int float16_le(float16 a, float16 b, float_status *status)
+{
+    bool aSign, bSign;
+    uint16_t av, bv;
+    a = float16_squash_input_denormal(a, status);
+    b = float16_squash_input_denormal(b, status);
+
+    if (((extractFloat16Exp(a) == 0x1F) && extractFloat16Frac(a))
+        || ((extractFloat16Exp(b) == 0x1F) && extractFloat16Frac(b))) {
+        float_raise(float_flag_invalid, status);
+        return 0;
+    }
+    aSign = extractFloat16Sign(a);
+    bSign = extractFloat16Sign(b);
+    av = float16_val(a);
+    bv = float16_val(b);
+    if (aSign != bSign) {
+        return aSign || ((uint16_t) ((av | bv) << 1) == 0);
+    }
+    return (av == bv) || (aSign ^ (av < bv));
+}
+
+/*----------------------------------------------------------------------------
+| Returns 1 if the half-precision floating-point value `a' is less than
+| the corresponding value `b', and 0 otherwise.  The invalid exception is
+| raised if either operand is a NaN.  The comparison is performed according
+| to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
+*----------------------------------------------------------------------------*/
+
+int float16_lt(float16 a, float16 b, float_status *status)
+{
+    bool aSign, bSign;
+    uint16_t av, bv;
+    a = float16_squash_input_denormal(a, status);
+    b = float16_squash_input_denormal(b, status);
+
+    if (((extractFloat16Exp(a) == 0x1F) && extractFloat16Frac(a))
+        || ((extractFloat16Exp(b) == 0x1F) && extractFloat16Frac(b))) {
+        float_raise(float_flag_invalid, status);
+        return 0;
+    }
+    aSign = extractFloat16Sign(a);
+    bSign = extractFloat16Sign(b);
+    av = float16_val(a);
+    bv = float16_val(b);
+    if (aSign != bSign) {
+        return aSign && ((uint16_t) ((av | bv) << 1) != 0);
+    }
+    return (av != bv) && (aSign ^ (av < bv));
+}
+
+/*----------------------------------------------------------------------------
+| Returns 1 if the half-precision floating-point values `a' and `b' cannot
+| be compared, and 0 otherwise.  The invalid exception is raised if either
+| operand is a NaN.  The comparison is performed according to the IEC/IEEE
+| Standard for Binary Floating-Point Arithmetic.
+*----------------------------------------------------------------------------*/
+
+int float16_unordered(float16 a, float16 b, float_status *status)
+{
+    a = float16_squash_input_denormal(a, status);
+    b = float16_squash_input_denormal(b, status);
+
+    if (((extractFloat16Exp(a) == 0x1F) && extractFloat16Frac(a))
+        || ((extractFloat16Exp(b) == 0x1F) && extractFloat16Frac(b))) {
+        float_raise(float_flag_invalid, status);
+        return 1;
+    }
+    return 0;
+}
+
+/*----------------------------------------------------------------------------
+| Returns 1 if the half-precision floating-point value `a' is equal to
+| the corresponding value `b', and 0 otherwise.  Quiet NaNs do not cause an
+| exception.  The comparison is performed according to the IEC/IEEE Standard
+| for Binary Floating-Point Arithmetic.
+*----------------------------------------------------------------------------*/
+
+int float16_eq_quiet(float16 a, float16 b, float_status *status)
+{
+    a = float16_squash_input_denormal(a, status);
+    b = float16_squash_input_denormal(b, status);
+
+    if (((extractFloat16Exp(a) == 0x1F) && extractFloat16Frac(a))
+        || ((extractFloat16Exp(b) == 0x1F) && extractFloat16Frac(b))) {
+        if (float16_is_signaling_nan(a, status)
+        || float16_is_signaling_nan(b, status)) {
+            float_raise(float_flag_invalid, status);
+        }
+        return 0;
+    }
+    return (float16_val(a) == float16_val(b)) ||
+            ((uint16_t) ((float16_val(a) | float16_val(b)) << 1) == 0);
+}
+
+/*----------------------------------------------------------------------------
+| Returns 1 if the half-precision floating-point value `a' is less than or
+| equal to the corresponding value `b', and 0 otherwise.  Quiet NaNs do not
+| cause an exception.  Otherwise, the comparison is performed according to the
+| IEC/IEEE Standard for Binary Floating-Point Arithmetic.
+*----------------------------------------------------------------------------*/
+
+int float16_le_quiet(float16 a, float16 b, float_status *status)
+{
+    bool aSign, bSign;
+    uint16_t av, bv;
+    a = float16_squash_input_denormal(a, status);
+    b = float16_squash_input_denormal(b, status);
+
+    if (((extractFloat16Exp(a) == 0x1F) && extractFloat16Frac(a))
+        || ((extractFloat16Exp(b) == 0x1F) && extractFloat16Frac(b))) {
+        if (float16_is_signaling_nan(a, status)
+        || float16_is_signaling_nan(b, status)) {
+            float_raise(float_flag_invalid, status);
+        }
+        return 0;
+    }
+    aSign = extractFloat16Sign(a);
+    bSign = extractFloat16Sign(b);
+    av = float16_val(a);
+    bv = float16_val(b);
+    if (aSign != bSign) {
+        return aSign || ((uint16_t) ((av | bv) << 1) == 0);
+    }
+    return (av == bv) || (aSign ^ (av < bv));
+}
+
+/*----------------------------------------------------------------------------
+| Returns 1 if the half-precision floating-point value `a' is less than
+| the corresponding value `b', and 0 otherwise.  Quiet NaNs do not cause an
+| exception.  Otherwise, the comparison is performed according to the IEC/IEEE
+| Standard for Binary Floating-Point Arithmetic.
+*----------------------------------------------------------------------------*/
+
+int float16_lt_quiet(float16 a, float16 b, float_status *status)
+{
+    bool aSign, bSign;
+    uint16_t av, bv;
+    a = float16_squash_input_denormal(a, status);
+    b = float16_squash_input_denormal(b, status);
+
+    if (((extractFloat16Exp(a) == 0x1F) && extractFloat16Frac(a))
+        || ((extractFloat16Exp(b) == 0x1F) && extractFloat16Frac(b))) {
+        if (float16_is_signaling_nan(a, status)
+        || float16_is_signaling_nan(b, status)) {
+            float_raise(float_flag_invalid, status);
+        }
+        return 0;
+    }
+    aSign = extractFloat16Sign(a);
+    bSign = extractFloat16Sign(b);
+    av = float16_val(a);
+    bv = float16_val(b);
+    if (aSign != bSign) {
+        return aSign && ((uint16_t) ((av | bv) << 1) != 0);
+    }
+    return (av != bv) && (aSign ^ (av < bv));
+}
+
+/*----------------------------------------------------------------------------
+| Returns 1 if the half-precision floating-point values `a' and `b' cannot
+| be compared, and 0 otherwise.  Quiet NaNs do not cause an exception.  The
+| comparison is performed according to the IEC/IEEE Standard for Binary
+| Floating-Point Arithmetic.
+*----------------------------------------------------------------------------*/
+
+int float16_unordered_quiet(float16 a, float16 b, float_status *status)
+{
+    a = float16_squash_input_denormal(a, status);
+    b = float16_squash_input_denormal(b, status);
+
+    if (((extractFloat16Exp(a) == 0x1F) && extractFloat16Frac(a))
+        || ((extractFloat16Exp(b) == 0x1F) && extractFloat16Frac(b))) {
+        if (float16_is_signaling_nan(a, status)
+        || float16_is_signaling_nan(b, status)) {
+            float_raise(float_flag_invalid, status);
+        }
+        return 1;
+    }
+    return 0;
+}
+
 /*----------------------------------------------------------------------------
 | Returns the result of converting the extended double-precision floating-
 | point value `a' to the 32-bit two's complement integer format.  The
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 075c680456..d36a54be3e 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -244,6 +244,14 @@ float16 float16_maxnum_noprop(float16, float16, float_status *status);
 float16 float16_sqrt(float16, float_status *status);
 FloatRelation float16_compare(float16, float16, float_status *status);
 FloatRelation float16_compare_quiet(float16, float16, float_status *status);
+int float16_eq(float16, float16, float_status *status);
+int float16_le(float16, float16, float_status *status);
+int float16_lt(float16, float16, float_status *status);
+int float16_unordered(float16, float16, float_status *status);
+int float16_eq_quiet(float16, float16, float_status *status);
+int float16_le_quiet(float16, float16, float_status *status);
+int float16_lt_quiet(float16, float16, float_status *status);
+int float16_unordered_quiet(float16, float16, float_status *status);
 
 bool float16_is_quiet_nan(float16, float_status *status);
 bool float16_is_signaling_nan(float16, float_status *status);
-- 
2.17.1


