Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscj-0006M8-3b
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfu-0006Gl-5T
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:38 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfs-00072h-Da
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:37 -0400
Received: by mail-pl1-x62a.google.com with SMTP id o1so2112361plk.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2uZxSX0yugJ56To//f9uzg722mU0IxfrMBvHl7YudFQ=;
 b=OJ5hX14RM02YcDLJynuJ4Wt5mq4G5IN+NfPMIQu0R/PpGhkK6nkiCTSnln67+ictq/
 H0E5DLzI7tcQdQ1xSX1yrd8hPxnLxkGGuIw7PqOw03rb9fA3Fo0BvOP6ZVw4IXbKt91b
 2dONZPm91/60cXWhG8m4hIubCjL7pZpxWeLfdXPfmS8lnKKJaaUlsWsnn0PcaEhelKHo
 8eeUc8mXxpbrE3zvcMelG5xI3H6s5Zko/dpE4BC5jsAtNIvaWPPPUCN5AgpquNe2/egY
 f5Ds3NnM1SmIipgNFXAAtIbEb3RjvlenfnTLQTeuVjtq9l1iWXewj0po0E6rL34Luve4
 0zpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2uZxSX0yugJ56To//f9uzg722mU0IxfrMBvHl7YudFQ=;
 b=c5h5Nq0qABePZCO43YbA42WaLztu/cTDcBF3JV5UcHXHrwdrZQ/4XfbX7/aDnJOpEv
 3z3QMgToV1H7uZ7p7hCd0lcX8Zq18E51QoqBH4wd4nEO0yIwwlJGDWBt0K9G0ezhc3gg
 jnHNHy2IAIvh8luVlbtxREyy6kmNFJVZ/nYFK7xX/NPhUlJ03X+xTkKLOjhYxOa0GY5K
 ce3UQxcxbUF686E8y5pvQIE9Q0lL4lpPsd3blZscxv9PNFJcpYshUY7PjXJPk0VDomn9
 TVfueHKEzYIyXnU/Jx8Y5B5BV4btzRj5jgkvkAtN/ZOt6eZd4K21V3wGyZT2t6Hk+yA+
 Ip1A==
X-Gm-Message-State: AOAM532/a/kfkb1pUv1uQumB4UihyuJlfiyPzbH6DXvfyEmUjtThI9W+
 T8c1T9tXWrCrtu0TjkpWgaTbMQ==
X-Google-Smtp-Source: ABdhPJzvMvQYaK9x04qpanvfN4K9OWj9aPedyoA7XbJOfYvtEMYXNmfBr1zJFze6q/0i2I7KO49NwA==
X-Received: by 2002:a17:902:7008:: with SMTP id
 y8mr25926148plk.85.1594378475277; 
 Fri, 10 Jul 2020 03:54:35 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:54:34 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC 60/65] softfloat: add fp16 and uint8/int8 interconvert functions
Date: Fri, 10 Jul 2020 18:49:14 +0800
Message-Id: <20200710104920.13550-61-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 10:54:38 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 fpu/softfloat.c         | 34 ++++++++++++++++++++++++++++++++++
 include/fpu/softfloat.h |  8 ++++++++
 2 files changed, 42 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 79be4f5840..fa1c99c03e 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2109,6 +2109,13 @@ static int64_t round_to_int_and_pack(FloatParts in, FloatRoundMode rmode,
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
@@ -2172,6 +2179,11 @@ int64_t float64_to_int64_scalbn(float64 a, FloatRoundMode rmode, int scale,
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
@@ -2322,6 +2334,13 @@ static uint64_t round_to_uint_and_pack(FloatParts in, FloatRoundMode rmode,
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
@@ -2385,6 +2404,11 @@ uint64_t float64_to_uint64_scalbn(float64 a, FloatRoundMode rmode, int scale,
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
@@ -2539,6 +2563,11 @@ float16 int16_to_float16(int16_t a, float_status *status)
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
@@ -2664,6 +2693,11 @@ float16 uint16_to_float16(uint16_t a, float_status *status)
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
index ff4e2605b1..b0ae8f6295 100644
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


