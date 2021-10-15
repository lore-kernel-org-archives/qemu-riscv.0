Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbH7l-0006P1-1y
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 02:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbH7d-0006Na-Qu
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 02:55:18 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:42605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbH7X-0000LU-UJ
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 02:55:15 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 66so7742466pgc.9
 for <qemu-riscv@nongnu.org>; Thu, 14 Oct 2021 23:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1dzdQt6RGRlpojPozE1ubvGZgEhFPMxtksE+j35cvI=;
 b=cbvseZBmrxpnYcbX9J6iM+2PnRe8FyBvQhGZoandgW5f6vCqPjDIu5MEMLLqo8/SbL
 v7kxzJ5FsYoJ+3z8Qheq5RO26hbCHl7obJ4apuQzAXpPZ6kwRHmjQBApxUbP1+EswNnl
 usJKqebAm/2+vtvlI8MKISNNmEib5PHvyz5DrYkjWLHAK3EhZDb+cTj3jXlJBlbw0ZlG
 YDDfA4Yncuyn1UH0i8761SBxu7LwHlDPQxI++qV0nQRd+ephUzufTXcoMdVzsUGyi2mU
 qgGj2nQ7L4MuOmVtraDvd/9cPqsMT4/58+Um2TXIKzX80ausGhfQ7yLl9Ax0K9CFvAi4
 hzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v1dzdQt6RGRlpojPozE1ubvGZgEhFPMxtksE+j35cvI=;
 b=RdWPxUeQpFzgZccWRHd0qqTbWKj2rl/C5C2XtwCF6fbnK7uAHDyxUT4Nv3Q1xbmhub
 U2UbFWuG0qjJS+Wc0R0xapvAOH3Q5T3zk0qLOA2SGO4F0qsW7TNgYyg4Oun1qNHUQr1L
 lmlyAwL9w5L/mCic0K97DncpEf8Sb7oDZnxYIXpeqYHy+VC3gn0o7slulifdEl6RJ+0f
 yb7IGUuT8hv9oOPnqE/CQlT4nJHj7REXKFdCAX6h3J3gVZGgtooaargdxfR71Fe1tVqJ
 A2DBuPkd99JGXJUYRF/RXQ82shiQRr2he7OJE/DDtJ2HBenu+RYt/Ri/PPX+a+cNPyf7
 hm2A==
X-Gm-Message-State: AOAM531zQ29nx7YBpHjfOksdbyEdzA7fv5yLjNfeO3kLu2ZTscELe2/9
 H+I//xQygMrzL7uyg/nBiA8XNQ==
X-Google-Smtp-Source: ABdhPJwE/NjaKq7MtJhe/jfui8ONnzbs95etATKZkyD6AOhFp2OUxh6SaIcwCAzBzdq91R2v+t+DcA==
X-Received: by 2002:aa7:9ede:0:b0:44d:13c7:14a7 with SMTP id
 r30-20020aa79ede000000b0044d13c714a7mr9991621pfq.18.1634280909908; 
 Thu, 14 Oct 2021 23:55:09 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id d6sm4105059pfa.39.2021.10.14.23.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 23:55:09 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 1/2] softfloat: add APIs to handle alternative sNaN
 propagation for fmax/fmin
Date: Fri, 15 Oct 2021 14:54:56 +0800
Message-Id: <20211015065500.3850513-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015065500.3850513-1-frank.chang@sifive.com>
References: <20211015065500.3850513-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 06:55:19 -0000

From: Chih-Min Chao <chihmin.chao@sifive.com>

For "fmax/fmin ft0, ft1, ft2" and if one of the inputs is sNaN,

  The original logic:
    Return NaN and set invalid flag if ft1 == sNaN || ft2 == sNan.

  The alternative path:
    Set invalid flag if ft1 == sNaN || ft2 == sNaN.
    Return NaN only if ft1 == NaN && ft2 == NaN.

The IEEE 754 spec allows both implementation and some architecture such
as riscv choose different defintions in two spec versions.
(riscv-spec-v2.2 use original version, riscv-spec-20191213 changes to
 alternative)

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 fpu/softfloat-parts.c.inc | 19 +++++++++++++++++++
 fpu/softfloat.c           | 18 +++++++++++++-----
 include/fpu/softfloat.h   | 10 ++++++++++
 3 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index dddee92d6ee..a8d74624f5a 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1227,6 +1227,25 @@ static FloatPartsN *partsN(minmax)(FloatPartsN *a, FloatPartsN *b,
             && (ab_mask & ~float_cmask_qnan)) {
             return is_nan(a->cls) ? b : a;
         }
+
+        /*
+         * In IEEE 754-2019, minNum, maxNum, minNumMag and maxNumMag
+         * are removed and replaced with minimum, minimumNumber, maximum
+         * and maximumNumber.
+         * minimumNumber/maximumNumber behavior for SNaN is changed to:
+         *   If both operands are NaNs, a QNaN is returned.
+         *   If either operand is a SNaN,
+         *   an invalid operation exception is signaled,
+         *   but unless both operands are NaNs,
+         *   the SNaN is otherwise ignored and not converted to a QNaN.
+         */
+        if (!(~flags & (minmax_isnum | minmax_snan_noprop))
+            && (ab_mask & float_cmask_snan)
+            && (ab_mask & ~float_cmask_anynan)) {
+            float_raise(float_flag_invalid, s);
+            return is_nan(a->cls) ? b : a;
+        }
+
         return parts_pick_nan(a, b, s);
     }
 
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6e769f990c2..eee65e9934c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -436,6 +436,11 @@ enum {
     minmax_isnum = 2,
     /* Set for the IEEE 754-2008 minNumMag() and minNumMag() operations. */
     minmax_ismag = 4,
+    /*
+     * Set for the IEEE 754-2019 minimumNumber() maximumNumber() operations,
+     * without sNaN propagation.
+     */
+    minmax_snan_noprop = 8,
 };
 
 /* Simple helpers for checking if, or what kind of, NaN we have */
@@ -3927,11 +3932,14 @@ static float128 float128_minmax(float128 a, float128 b,
     { return type##_minmax(a, b, s, flags); }
 
 #define MINMAX_2(type) \
-    MINMAX_1(type, max, 0)                                      \
-    MINMAX_1(type, maxnum, minmax_isnum)                        \
-    MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)      \
-    MINMAX_1(type, min, minmax_ismin)                           \
-    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)         \
+    MINMAX_1(type, max, 0)                                           \
+    MINMAX_1(type, maxnum, minmax_isnum)                             \
+    MINMAX_1(type, maxnum_noprop, minmax_isnum | minmax_snan_noprop) \
+    MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)           \
+    MINMAX_1(type, min, minmax_ismin)                                \
+    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)              \
+    MINMAX_1(type, minnum_noprop, minmax_ismin | minmax_isnum |      \
+                                  minmax_snan_noprop)                \
     MINMAX_1(type, minnummag, minmax_ismin | minmax_isnum | minmax_ismag)
 
 MINMAX_2(float16)
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index ec7dca09606..b77917ea661 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -241,6 +241,8 @@ float16 float16_min(float16, float16, float_status *status);
 float16 float16_max(float16, float16, float_status *status);
 float16 float16_minnum(float16, float16, float_status *status);
 float16 float16_maxnum(float16, float16, float_status *status);
+float16 float16_minnum_noprop(float16, float16, float_status *status);
+float16 float16_maxnum_noprop(float16, float16, float_status *status);
 float16 float16_minnummag(float16, float16, float_status *status);
 float16 float16_maxnummag(float16, float16, float_status *status);
 float16 float16_sqrt(float16, float_status *status);
@@ -420,6 +422,8 @@ bfloat16 bfloat16_min(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_max(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_minnum(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_maxnum(bfloat16, bfloat16, float_status *status);
+bfloat16 bfloat16_minnum_noprop(bfloat16, bfloat16, float_status *status);
+bfloat16 bfloat16_maxnum_noprop(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_minnummag(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_maxnummag(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_sqrt(bfloat16, float_status *status);
@@ -587,6 +591,8 @@ float32 float32_min(float32, float32, float_status *status);
 float32 float32_max(float32, float32, float_status *status);
 float32 float32_minnum(float32, float32, float_status *status);
 float32 float32_maxnum(float32, float32, float_status *status);
+float32 float32_minnum_noprop(float32, float32, float_status *status);
+float32 float32_maxnum_noprop(float32, float32, float_status *status);
 float32 float32_minnummag(float32, float32, float_status *status);
 float32 float32_maxnummag(float32, float32, float_status *status);
 bool float32_is_quiet_nan(float32, float_status *status);
@@ -776,6 +782,8 @@ float64 float64_min(float64, float64, float_status *status);
 float64 float64_max(float64, float64, float_status *status);
 float64 float64_minnum(float64, float64, float_status *status);
 float64 float64_maxnum(float64, float64, float_status *status);
+float64 float64_minnum_noprop(float64, float64, float_status *status);
+float64 float64_maxnum_noprop(float64, float64, float_status *status);
 float64 float64_minnummag(float64, float64, float_status *status);
 float64 float64_maxnummag(float64, float64, float_status *status);
 bool float64_is_quiet_nan(float64 a, float_status *status);
@@ -1208,6 +1216,8 @@ float128 float128_min(float128, float128, float_status *status);
 float128 float128_max(float128, float128, float_status *status);
 float128 float128_minnum(float128, float128, float_status *status);
 float128 float128_maxnum(float128, float128, float_status *status);
+float128 float128_minnum_noprop(float128, float128, float_status *status);
+float128 float128_maxnum_noprop(float128, float128, float_status *status);
 float128 float128_minnummag(float128, float128, float_status *status);
 float128 float128_maxnummag(float128, float128, float_status *status);
 bool float128_is_quiet_nan(float128, float_status *status);
-- 
2.25.1


