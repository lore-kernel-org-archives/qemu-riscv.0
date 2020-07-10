Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscr-0006kS-F7
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqg2-0006Jh-99
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:46 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfz-00073d-O2
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:46 -0400
Received: by mail-pl1-x635.google.com with SMTP id x9so2108964plr.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dzueMtfSoUxoNXtog0oLoApUQLNpkmASka89C67kCXk=;
 b=MTY70OgSRr940IwbKL588JtbnzCDe2h5Fn99+eu3iJE9kd5+7zHs5JXgZpGNR9fY9Z
 P3fsk2Vd/hyqQJGYXvSOA/yYgtFHsVVeL6SywSiN0hNc8irmMzNbR1tdBkY+OVYoYpqI
 Nxrqj6enwaWyRrJpikruGyexWlcQRaf8oOwFSl+PNnPadiPbbMXCY4HxulBNPUsXXT3g
 i07HhRnnc6fVhPVO8Ed+GZi+JriCm9epfilSFrE9Fb7JgZUTXgTNt5EkQ5WuXSNF7V/r
 rEf0vT3rRv91kYOfy7pSksVvTmkkk3esGDwIgUihGDuBBf4/I0oU0Mfk/z1kIb+DsK5x
 IzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dzueMtfSoUxoNXtog0oLoApUQLNpkmASka89C67kCXk=;
 b=l3UJoxigY5uRnl7awmKjuZYYReMLnrWPknWHijNkNy/z3oI9mM00GLpqb/IeF8zC6m
 UWhaYHWYtALJ7gh4ijmxs8mE/BqCa6IOB1Eu4JDWAmePC8KNXiCug8xsUK/EfkJKBLXf
 yJHhUB8XdKtobncj5J36DwrKZZPV5Ykt2bqmaXzPqsyr/vzXYwuZ1XskxI+cDCQKf64l
 YoW9qLhm4E/g2pQcVy7NRuMa5XBc6/IAR5343rViph3aXrQCJpZfy222GeLROEVCTkvW
 xl84U+4etCKd+DdFjiDUev7JJQflp55syb75X5KyMhAB81lcEguLmKl8T+OEFPUhJeol
 LOXw==
X-Gm-Message-State: AOAM532lJMxL/q7gEeIjKA+vW3WZUbAjw1Zy358gRd2sJ35v72iIO7EE
 wAm2vYSKqxuiAsDpAwj4GQ67GQ==
X-Google-Smtp-Source: ABdhPJzCPhX2gxu6VpHm4J288zp+VDKNRJKoDyV/vj+v18DoXpk15oGDuzgvdAe3DdAjx4jr7biVaA==
X-Received: by 2002:a17:90b:3684:: with SMTP id
 mj4mr5255245pjb.66.1594378482386; 
 Fri, 10 Jul 2020 03:54:42 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:54:42 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC 62/65] fpu: add api to handle alternative sNaN propagation
Date: Fri, 10 Jul 2020 18:49:16 +0800
Message-Id: <20200710104920.13550-63-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 10:54:46 -0000

From: Chih-Min Chao <chihmin.chao@sifive.com>

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 fpu/softfloat.c         | 68 +++++++++++++++++++++++++----------------
 include/fpu/softfloat.h |  6 ++++
 2 files changed, 48 insertions(+), 26 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index fa1c99c03e..028b857167 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2777,23 +2777,32 @@ float64 uint16_to_float64(uint16_t a, float_status *status)
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
+                    pick_nan(a, b, s);
+                } else {
+                    return pick_nan(a, b, s);
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
@@ -2847,37 +2856,44 @@ static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
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
+MINMAX(16, min, true, false, false, false)
+MINMAX(16, minnum, true, true, false, false)
+MINMAX(16, minnum_noprop, true, true, false, true)
+MINMAX(16, minnummag, true, true, true, false)
+MINMAX(16, max, false, false, false, false)
+MINMAX(16, maxnum, false, true, false, false)
+MINMAX(16, maxnum_noprop, false, true, false, true)
+MINMAX(16, maxnummag, false, true, true, false)
+
+MINMAX(32, min, true, false, false, false)
+MINMAX(32, minnum, true, true, false, false)
+MINMAX(32, minnum_noprop, true, true, false, true)
+MINMAX(32, minnummag, true, true, true, false)
+MINMAX(32, max, false, false, false, false)
+MINMAX(32, maxnum, false, true, false, false)
+MINMAX(32, maxnum_noprop, false, true, false, true)
+MINMAX(32, maxnummag, false, true, true, false)
+
+MINMAX(64, min, true, false, false, false)
+MINMAX(64, minnum, true, true, false, false)
+MINMAX(64, minnum_noprop, true, true, false, true)
+MINMAX(64, minnummag, true, true, true, false)
+MINMAX(64, max, false, false, false, false)
+MINMAX(64, maxnum, false, true, false, false)
+MINMAX(64, maxnum_noprop, false, true, false, true)
+MINMAX(64, maxnummag, false, true, true, false)
 
 #undef MINMAX
 
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index b0ae8f6295..075c680456 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -239,6 +239,8 @@ float16 float16_minnum(float16, float16, float_status *status);
 float16 float16_maxnum(float16, float16, float_status *status);
 float16 float16_minnummag(float16, float16, float_status *status);
 float16 float16_maxnummag(float16, float16, float_status *status);
+float16 float16_minnum_noprop(float16, float16, float_status *status);
+float16 float16_maxnum_noprop(float16, float16, float_status *status);
 float16 float16_sqrt(float16, float_status *status);
 FloatRelation float16_compare(float16, float16, float_status *status);
 FloatRelation float16_compare_quiet(float16, float16, float_status *status);
@@ -359,6 +361,8 @@ float32 float32_minnum(float32, float32, float_status *status);
 float32 float32_maxnum(float32, float32, float_status *status);
 float32 float32_minnummag(float32, float32, float_status *status);
 float32 float32_maxnummag(float32, float32, float_status *status);
+float32 float32_minnum_noprop(float32, float32, float_status *status);
+float32 float32_maxnum_noprop(float32, float32, float_status *status);
 bool float32_is_quiet_nan(float32, float_status *status);
 bool float32_is_signaling_nan(float32, float_status *status);
 float32 float32_silence_nan(float32, float_status *status);
@@ -548,6 +552,8 @@ float64 float64_minnum(float64, float64, float_status *status);
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


