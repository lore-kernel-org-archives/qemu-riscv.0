Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAxH-0007Sw-NY
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxG-0007Oi-6d
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:26 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxD-0006Bh-UO
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:25 -0400
Received: by mail-pl1-x630.google.com with SMTP id k4so643881pld.12
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=a5PwNJt6p7A34P7KMk3YOv09AaOqqY2gRl2sf9hwDV0=;
 b=kdiu9QpZ4fWCX1c8J6rwYH7Q/bj9mv2WU02czASlWe/NJ8hKM0UkvlGzjhlzA9KTLY
 dFDr8ZxONp5o2ehkZspRmUubYSKIhWG3cIAd0+LbJkLa3WFbvDu1v8p17K+T9ljMuU5Q
 f2PyLXM70IuaQ8QZePwKDnU6FUmFKvynWCoL8NaVEI+ekGEc32ir0C25P3Mwj2WZLH8R
 7ZPzhNSBdPSO8CwSOaE9duN5qhYanbYdcsVmG9oVvmdwBYJKHO7P29rtyjlUeNcEne2O
 mTs0YRrn80w9vvRpZNxoJVxuau2T2CdKQyHQ+j0C0IAJtfg+fBHc7qS8xH5acBASO1sp
 VhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=a5PwNJt6p7A34P7KMk3YOv09AaOqqY2gRl2sf9hwDV0=;
 b=DV6NMd/k1cil1VvDb60rnoqj5EKEbV8FPzqIyPQtxneOHpvaXWscof6KfZNU4WGV9Z
 J05ED+tjcbkQu5CD7kvIgPJ8WXBwMAXdEr5f/E90kV/ZmyZSbgqKgIdz4lAZNwK7iAaK
 Hj48FA3C6dNo2UgcVnFgA8inRgJuek3EfYIro3x5EbpdbgZ9aYZNX2idTqFm9kLGXknP
 eeQZilX/sNrwyt0+k3IP2oikyKU1DO4TNywkF1Q8PAtvIRb22teImz0UhEp13zD1hFlu
 Ew2neIZIvhNMyJ7vHnjDca2lYfioDJLuvF6AKhEyEhm0dGkGfRxoXXuUWspUCwGrTp0z
 kqMw==
X-Gm-Message-State: AOAM5302X+4m1JF8ZlThVXoQTstTuJGKTGxjtQFqYUjO3QYoGKxU7Oxn
 a0lb6aNVmsTMNp/115Mn4qg9kw==
X-Google-Smtp-Source: ABdhPJw2CSLWoC9PjSxG9fuLrsKd2mr1M0ArsExA+bdUUFyCFOGvmKuXWP+RojYJng5P4OhOU16bvw==
X-Received: by 2002:a17:90a:6946:: with SMTP id
 j6mr8004497pjm.223.1595409742653; 
 Wed, 22 Jul 2020 02:22:22 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:22:21 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v2 68/76] fpu: add api to handle alternative sNaN propagation
Date: Wed, 22 Jul 2020 17:16:31 +0800
Message-Id: <20200722091641.8834-69-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:22:26 -0000

From: Chih-Min Chao <chihmin.chao@sifive.com>

For "fmax/fmin ft0, ft1, ft2" and if one of the inputs is sNaN,
  The original logic
    return NaN and set invalid flag if ft1 == sNaN || ft2 == sNan

  The alternative path
    set invalid flag if ft1 == sNaN || ft2 == sNaN
    return NaN if ft1 == sNaN && ft2 == sNaN

   The ieee754 spec allows both implementation and some architecture such
   as riscv choose differenct defintion in two spec versions.
   (riscv-spec-v2.2 use original one, riscv-spec-20191213 changes to
    alternative one)

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 fpu/softfloat.c         | 75 ++++++++++++++++++++++++++---------------
 include/fpu/softfloat.h |  6 ++++
 2 files changed, 54 insertions(+), 27 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 9c6640862e..e1661f22a5 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -898,11 +898,16 @@ static FloatParts return_nan(FloatParts a, float_status *s)
     return a;
 }
 
-static FloatParts pick_nan(FloatParts a, FloatParts b, float_status *s)
+static void set_snan_flag(FloatParts a, FloatParts b, float_status *s)
 {
     if (is_snan(a.cls) || is_snan(b.cls)) {
         s->float_exception_flags |= float_flag_invalid;
     }
+}
+
+static FloatParts pick_nan(FloatParts a, FloatParts b, float_status *s)
+{
+    set_snan_flag(a, b, s);
 
     if (s->default_nan_mode) {
         return parts_default_nan(s);
@@ -2771,23 +2776,32 @@ float64 uint16_to_float64(uint16_t a, float_status *status)
  * and minNumMag() from the IEEE-754 2008.
  */
 static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
-                                bool ieee, bool ismag, float_status *s)
+                                bool ieee, bool ismag, bool issnan_prop,
+                                float_status *s)
 {
     if (unlikely(is_nan(a.cls) || is_nan(b.cls))) {
         if (ieee) {
             /* Takes two floating-point values `a' and `b', one of
              * which is a NaN, and returns the appropriate NaN
              * result. If either `a' or `b' is a signaling NaN,
-             * the invalid exception is raised.
+             * the invalid exception is raised but the NaN
+             * propagation is 'shall'.
              */
             if (is_snan(a.cls) || is_snan(b.cls)) {
-                return pick_nan(a, b, s);
-            } else if (is_nan(a.cls) && !is_nan(b.cls)) {
+                if (issnan_prop) {
+                    return pick_nan(a, b, s);
+                } else {
+                    set_snan_flag(a, b, s);
+                }
+            }
+
+            if (is_nan(a.cls) && !is_nan(b.cls)) {
                 return b;
             } else if (is_nan(b.cls) && !is_nan(a.cls)) {
                 return a;
             }
         }
+
         return pick_nan(a, b, s);
     } else {
         int a_exp, b_exp;
@@ -2841,37 +2855,44 @@ static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
     }
 }
 
-#define MINMAX(sz, name, ismin, isiee, ismag)                           \
+#define MINMAX(sz, name, ismin, isiee, ismag, issnan_prop)              \
 float ## sz float ## sz ## _ ## name(float ## sz a, float ## sz b,      \
                                      float_status *s)                   \
 {                                                                       \
     FloatParts pa = float ## sz ## _unpack_canonical(a, s);             \
     FloatParts pb = float ## sz ## _unpack_canonical(b, s);             \
-    FloatParts pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);      \
+    FloatParts pr = minmax_floats(pa, pb, ismin, isiee, ismag,          \
+                                  issnan_prop, s);                      \
                                                                         \
     return float ## sz ## _round_pack_canonical(pr, s);                 \
 }
 
-MINMAX(16, min, true, false, false)
-MINMAX(16, minnum, true, true, false)
-MINMAX(16, minnummag, true, true, true)
-MINMAX(16, max, false, false, false)
-MINMAX(16, maxnum, false, true, false)
-MINMAX(16, maxnummag, false, true, true)
-
-MINMAX(32, min, true, false, false)
-MINMAX(32, minnum, true, true, false)
-MINMAX(32, minnummag, true, true, true)
-MINMAX(32, max, false, false, false)
-MINMAX(32, maxnum, false, true, false)
-MINMAX(32, maxnummag, false, true, true)
-
-MINMAX(64, min, true, false, false)
-MINMAX(64, minnum, true, true, false)
-MINMAX(64, minnummag, true, true, true)
-MINMAX(64, max, false, false, false)
-MINMAX(64, maxnum, false, true, false)
-MINMAX(64, maxnummag, false, true, true)
+MINMAX(16, min, true, false, false, true)
+MINMAX(16, minnum, true, true, false, true)
+MINMAX(16, minnum_noprop, true, true, false, false)
+MINMAX(16, minnummag, true, true, true, true)
+MINMAX(16, max, false, false, false, true)
+MINMAX(16, maxnum, false, true, false, true)
+MINMAX(16, maxnum_noprop, false, true, false, false)
+MINMAX(16, maxnummag, false, true, true, true)
+
+MINMAX(32, min, true, false, false, true)
+MINMAX(32, minnum, true, true, false, true)
+MINMAX(32, minnum_noprop, true, true, false, false)
+MINMAX(32, minnummag, true, true, true, true)
+MINMAX(32, max, false, false, false, true)
+MINMAX(32, maxnum, false, true, false, true)
+MINMAX(32, maxnum_noprop, false, true, false, false)
+MINMAX(32, maxnummag, false, true, true, true)
+
+MINMAX(64, min, true, false, false, true)
+MINMAX(64, minnum, true, true, false, true)
+MINMAX(64, minnum_noprop, true, true, false, false)
+MINMAX(64, minnummag, true, true, true, true)
+MINMAX(64, max, false, false, false, true)
+MINMAX(64, maxnum, false, true, false, true)
+MINMAX(64, maxnum_noprop, false, true, false, false)
+MINMAX(64, maxnummag, false, true, true, true)
 
 #undef MINMAX
 
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 267519cd65..078cad8ad9 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -231,6 +231,8 @@ float16 float16_minnum(float16, float16, float_status *status);
 float16 float16_maxnum(float16, float16, float_status *status);
 float16 float16_minnummag(float16, float16, float_status *status);
 float16 float16_maxnummag(float16, float16, float_status *status);
+float16 float16_minnum_noprop(float16, float16, float_status *status);
+float16 float16_maxnum_noprop(float16, float16, float_status *status);
 float16 float16_sqrt(float16, float_status *status);
 FloatRelation float16_compare(float16, float16, float_status *status);
 FloatRelation float16_compare_quiet(float16, float16, float_status *status);
@@ -392,6 +394,8 @@ float32 float32_minnum(float32, float32, float_status *status);
 float32 float32_maxnum(float32, float32, float_status *status);
 float32 float32_minnummag(float32, float32, float_status *status);
 float32 float32_maxnummag(float32, float32, float_status *status);
+float32 float32_minnum_noprop(float32, float32, float_status *status);
+float32 float32_maxnum_noprop(float32, float32, float_status *status);
 bool float32_is_quiet_nan(float32, float_status *status);
 bool float32_is_signaling_nan(float32, float_status *status);
 float32 float32_silence_nan(float32, float_status *status);
@@ -581,6 +585,8 @@ float64 float64_minnum(float64, float64, float_status *status);
 float64 float64_maxnum(float64, float64, float_status *status);
 float64 float64_minnummag(float64, float64, float_status *status);
 float64 float64_maxnummag(float64, float64, float_status *status);
+float64 float64_minnum_noprop(float64, float64, float_status *status);
+float64 float64_maxnum_noprop(float64, float64, float_status *status);
 bool float64_is_quiet_nan(float64 a, float_status *status);
 bool float64_is_signaling_nan(float64, float_status *status);
 float64 float64_silence_nan(float64, float_status *status);
-- 
2.17.1


