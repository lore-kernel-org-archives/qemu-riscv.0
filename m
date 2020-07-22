Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAwC-000580-Jv
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwB-00055o-O1
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:19 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:38150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAw9-00061r-PN
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:19 -0400
Received: by mail-pf1-x432.google.com with SMTP id j20so869579pfe.5
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rgRsumD+WyP+g+9ywiEhwYNS2OqBdlvEKjanU4B1RZU=;
 b=LtE6qf826ci3D7L3stHnLZ4IxQdcpNzXYKRjHxlMvlmy0w/BWZKmndqxLcrbOn5HVq
 z6e0pZnvfB2ErKm2AYLU/1yv3EBGifBf8MOBWYK0lwrZ7afkb1hCui08Mp4nloXrPknf
 tsf31SZjQDjYVaJtez8q+OoLMBBHrlkE+I+eU+pH3YnSeRACpkmtakgpoD0QrkMjn1UN
 GNGGyrKUIFz9l3MTabNXCwd6P3nU8N9/sBTs/fqCOqFJwUsDOjJUm2ZPPUQEfu0JItCA
 A6ojSUd8cjYOhQTOVoDuE74vY4SJquFecQWrmzdM9LSBSbccBj6E/6lchEHNz3oANly0
 l4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rgRsumD+WyP+g+9ywiEhwYNS2OqBdlvEKjanU4B1RZU=;
 b=LeJidYyvkUWGfPLkgnEWEEY4e15EZkFMs+w697m1MdtowTJE5RJa0SGaa3q9PBeZoe
 fTQ6dzjt7npOlSVrLCJAEDRWpul5ZgnP52WA0CBP/q3pKF4lCeTWPGi+Q6oeSgrrysaZ
 5CbvirKg86+MZLqq9b2YTnKA7mq5pSep2zN9vaRyz6Dow/4judkA+TXnJNmehasGXSu+
 o0S2teW+p18/FtsLY+iLVjm2+qx24NhOHDCDc+JC5EQ/M6H/juJJcX6DNbRCtNFP2G1X
 jwYOKNzsSeLmvxiqIMA20RiyOlMXuIbralZ+aTx+P4/xX3YlWVpa189AinlOb1KSy/6K
 FELw==
X-Gm-Message-State: AOAM531g2H8g0kkcT72Ac3TXkXDFs5BlGFxeYGwG0AWfSuo4RrCXSB1m
 UCg1/666TLEpGS/sV1jFqKI1PQ==
X-Google-Smtp-Source: ABdhPJzJAg1FBZ5yz5oMup7bXnqJFltT2P+fmSTrDrZimyZiFP4rPJJmx+/D7S2I3Q6KZ1MpVr91eg==
X-Received: by 2002:a62:1ad6:: with SMTP id
 a205mr27235306pfa.109.1595409676608; 
 Wed, 22 Jul 2020 02:21:16 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:21:16 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v2 52/76] fpu: implement full set compare for fp16
Date: Wed, 22 Jul 2020 17:16:15 +0800
Message-Id: <20200722091641.8834-53-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:21:20 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 fpu/softfloat.c         | 28 ++++++++++++++++++++++++++++
 include/fpu/softfloat.h | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 79be4f5840..9c6640862e 100644
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
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index ff4e2605b1..267519cd65 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -285,6 +285,47 @@ static inline float16 float16_set_sign(float16 a, int sign)
     return make_float16((float16_val(a) & 0x7fff) | (sign << 15));
 }
 
+static inline bool float16_eq(float16 a, float16 b, float_status *s)
+{
+    return float16_compare(a, b, s) == float_relation_equal;
+}
+
+static inline bool float16_le(float16 a, float16 b, float_status *s)
+{
+    return float16_compare(a, b, s) <= float_relation_equal;
+}
+
+static inline bool float16_lt(float16 a, float16 b, float_status *s)
+{
+    return float16_compare(a, b, s) < float_relation_equal;
+}
+
+static inline bool float16_unordered(float16 a, float16 b, float_status *s)
+{
+    return float16_compare(a, b, s) == float_relation_unordered;
+}
+
+static inline bool float16_eq_quiet(float16 a, float16 b, float_status *s)
+{
+    return float16_compare_quiet(a, b, s) == float_relation_equal;
+}
+
+static inline bool float16_le_quiet(float16 a, float16 b, float_status *s)
+{
+    return float16_compare_quiet(a, b, s) <= float_relation_equal;
+}
+
+static inline bool float16_lt_quiet(float16 a, float16 b, float_status *s)
+{
+    return float16_compare_quiet(a, b, s) < float_relation_equal;
+}
+
+static inline bool float16_unordered_quiet(float16 a, float16 b,
+                                           float_status *s)
+{
+    return float16_compare_quiet(a, b, s) == float_relation_unordered;
+}
+
 #define float16_zero make_float16(0)
 #define float16_half make_float16(0x3800)
 #define float16_one make_float16(0x3c00)
-- 
2.17.1


