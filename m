Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k8f2H-0007CC-Ry
	for mharc-qemu-riscv@gnu.org; Thu, 20 Aug 2020 03:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k8f2G-0007BM-19
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2020 03:30:56 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k8f2C-0005mQ-W8
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2020 03:30:55 -0400
Received: by mail-pl1-x634.google.com with SMTP id r4so648133pls.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2020 00:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=1NmJoi+qqIfXrOoepDAaLjrD1ikERAOmDGxOO08bd3M=;
 b=M8z7+eJlvLjJMp0gzUEIdEQ4IIfW1t3Io/eiy/O/EKtGnyRW6A8q1doEOwrurMMKvM
 f5gNlxB9c49TLGP8UU5nY6quyKHklVzHjiX1mOIe8fnV8FPEdwQhc5xul2DbpykYfKIs
 rf1Ex+n6Yh0FMPsvmPir8BXeRaCyyMNJi7J7lbWs4gw/BayhXiieMxOEdGLRUXo5Iya6
 1VdIojm0epG/xMG6oPaelJWg5Ij4P3dR9OCRSFoEMJcwZgh/+eT2jUgAkrJDyXmKSoeZ
 6eExwo2sBMv2EVMp85IwN/3x/mmgcRz+DyjrjSXTzItCO5QPcvX4Bs85CmCl4dixsp3V
 JxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1NmJoi+qqIfXrOoepDAaLjrD1ikERAOmDGxOO08bd3M=;
 b=ZOvwOIN5q6PGzSA/CT0PuDONz2eTbXTubvvJah5Xd4gQOTP1N716HrS3JKQ8EYa7Np
 M7saXMddKubwwt9GR+LwPnGZ8bGg+czhdJWN6DEq+eRD/qLxXE3rh6LchxMMsbnGUDSg
 pZxrA9XDxg9qpNIWNneZ97NU85oOpX41OyAFDX6poWGTroMxvehLGbZVD1z+X0JrQnz1
 VdBEauSJEqYM0DGqKf0S1fLZqZytE8nI28kq/+m47bSkDIOOjQFB0QAgO935vEOwwSNm
 DPxmC7rvvYe1RTmdZdZD+WTfkdAKTIM6kCsn+ml27/WwQ0/if4z14GIsXH9LZsgiucYs
 gwCg==
X-Gm-Message-State: AOAM532r/Z5Q8/+1QAhlCx9XRLT1ZBX1TJZNl5p1OGaRQi7eqs4u5IEL
 T0B+VAKT7+XpwVt9RQN7kwclZA==
X-Google-Smtp-Source: ABdhPJxSFeruhMBW8AnG5GgXLPa/OAyvOP2RSHJrco/16rYUCBeLEXHn1waQfFHNebnJWjLyAUQCsA==
X-Received: by 2002:a17:902:a50e:: with SMTP id
 s14mr1581080plq.164.1597908648122; 
 Thu, 20 Aug 2020 00:30:48 -0700 (PDT)
Received: from gamma11.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id 205sm1721766pfy.9.2020.08.20.00.30.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Aug 2020 00:30:47 -0700 (PDT)
From: Chih-Min Chao <chihmin.chao@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2] softfloat: add alternative sNaN propagation for fmax/fmin
Date: Thu, 20 Aug 2020 00:30:40 -0700
Message-Id: <1597908641-6293-1-git-send-email-chihmin.chao@sifive.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=chihmin.chao@sifive.com; helo=mail-pl1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 20 Aug 2020 07:30:56 -0000

For "fmax/fmin ft0, ft1, ft2" and if one of the inputs is sNaN,
  The original logic
    return NaN and set invalid flag if ft1 == sNaN || ft2 == sNan

  The alternative path
    set invalid flag and return the non-NaN value if ft1 == sNaN || ft2 == sNaN
    return NaN if ft1 == sNaN && ft2 == sNaN

   The ieee754 spec allows both implementation and some architecture such
   as riscv choose differenct defintion in two spec versions.
   (riscv-spec-v2.2 use original version, riscv-spec-20191213 changes to
    alternative)

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
---
 fpu/softfloat.c         | 75 +++++++++++++++++++++++++++++++------------------
 include/fpu/softfloat.h |  6 ++++
 2 files changed, 54 insertions(+), 27 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 79be4f5..4466ece 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -870,11 +870,16 @@ static FloatParts return_nan(FloatParts a, float_status *s)
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
@@ -2743,23 +2748,32 @@ float64 uint16_to_float64(uint16_t a, float_status *status)
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
@@ -2813,37 +2827,44 @@ static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
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
index 659218b..0883510 100644
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
@@ -351,6 +353,8 @@ float32 float32_minnum(float32, float32, float_status *status);
 float32 float32_maxnum(float32, float32, float_status *status);
 float32 float32_minnummag(float32, float32, float_status *status);
 float32 float32_maxnummag(float32, float32, float_status *status);
+float32 float32_minnum_noprop(float32, float32, float_status *status);
+float32 float32_maxnum_noprop(float32, float32, float_status *status);
 bool float32_is_quiet_nan(float32, float_status *status);
 bool float32_is_signaling_nan(float32, float_status *status);
 float32 float32_silence_nan(float32, float_status *status);
@@ -540,6 +544,8 @@ float64 float64_minnum(float64, float64, float_status *status);
 float64 float64_maxnum(float64, float64, float_status *status);
 float64 float64_minnummag(float64, float64, float_status *status);
 float64 float64_maxnummag(float64, float64, float_status *status);
+float64 float64_minnum_noprop(float64, float64, float_status *status);
+float64 float64_maxnum_noprop(float64, float64, float_status *status);
 bool float64_is_quiet_nan(float64 a, float_status *status);
 bool float64_is_signaling_nan(float64, float_status *status);
 float64 float64_silence_nan(float64, float_status *status);
-- 
2.7.4


