Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZh-0005GL-2T
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZc-0005Ax-HD
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:13 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZ2-0004bO-Lq
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:12 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so5819153pjj.4
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aqGBKhQ5AgkdFtp5J1OJW+jsP9G85axr6xXMVQ+qicY=;
 b=QefVl/VVnrGkxsT2QTgsW/LhAU89JsLZVSkjOSX/LreGzAMlXna4UQ6vk0EaHAX77q
 Ut637GZHonFO+qNseAieDkWh4xlO0pB4JW1VFT7ibxuJmB/bqZr2mbUAXbFzZv6CM0XF
 dddeCmSO8a/pZK4mKlyxODOK0EdO6X7X+Q+M5Yq/WOp/DzJ2bu7pO+cXBxrmXfZhCh5S
 nW2q2lYPj/x6q+RFePUII07bjK3nwkU+2YkoHbAN3CkoYCHf0NMLV5DoFAfLeJAAEQbe
 FgkHrJ5Dm4+UZjS+3jkKp2bc28ab2lvB8spjJQgkjcV7WwPmv1RXVDf7sWzN6z4LKPlM
 NRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aqGBKhQ5AgkdFtp5J1OJW+jsP9G85axr6xXMVQ+qicY=;
 b=7g27wJdnGD81XXeNIlHs9541JU07SXvZwIuWrWgcA5KJizxHzIzR5dtwDUgCvDA1SU
 uu4fBB84NTWBayG9+KbCOKZFniAfqwKj6eYH4l9O25TdCtgds6LPK7Xr+uuk6H3CXEnp
 lrxfUdHsuKtnM/rB71Wl6D1DRtj2+jOr92J0fSbg5IovuOUXpG5xhitGqHdcwk5pxSLi
 sMU0PY3xF7AhjaZqKEF+VqVrvXoOZ2OF80q1loHLJ/GEQsDNA8n11sfL/0evBrgV67zH
 sqnhgNfvMhJo1t3jCXTyk38xX2M8EDOhOJfB/C3TzJm3tZD4giyRMdQPPHAZ9FiI5jmy
 k/sQ==
X-Gm-Message-State: AFqh2kqI7sf1DeEpuuOfXlTEfs6KWOhNoZwq1qXYodKqCica07PgWAu5
 CX6mjIcoB0Mk9keTHhUoKo8IfdeZemcW82l7
X-Google-Smtp-Source: AMrXdXvPx5V0nWs3XUZjBLeT0ki8TLbXHr+9q7xtTCl3hU+bSDtNoW+bFe6bjMROFXzto5wOqbxdSQ==
X-Received: by 2002:a17:902:a510:b0:192:48d1:f06c with SMTP id
 s16-20020a170902a51000b0019248d1f06cmr55734540plq.35.1673145455267; 
 Sat, 07 Jan 2023 18:37:35 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 13/36] tcg: Add temp allocation for TCGv_i128
Date: Sat,  7 Jan 2023 18:36:56 -0800
Message-Id: <20230108023719.2466341-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:38:13 -0000

This enables allocation of i128.  The type is not yet
usable, as we have not yet added data movement ops.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 32 +++++++++++++++++++++++++
 tcg/tcg.c         | 60 +++++++++++++++++++++++++++++++++--------------
 2 files changed, 74 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 7d346192ca..a996da60b5 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -697,6 +697,11 @@ static inline TCGTemp *tcgv_i64_temp(TCGv_i64 v)
     return tcgv_i32_temp((TCGv_i32)v);
 }
 
+static inline TCGTemp *tcgv_i128_temp(TCGv_i128 v)
+{
+    return tcgv_i32_temp((TCGv_i32)v);
+}
+
 static inline TCGTemp *tcgv_ptr_temp(TCGv_ptr v)
 {
     return tcgv_i32_temp((TCGv_i32)v);
@@ -717,6 +722,11 @@ static inline TCGArg tcgv_i64_arg(TCGv_i64 v)
     return temp_arg(tcgv_i64_temp(v));
 }
 
+static inline TCGArg tcgv_i128_arg(TCGv_i128 v)
+{
+    return temp_arg(tcgv_i128_temp(v));
+}
+
 static inline TCGArg tcgv_ptr_arg(TCGv_ptr v)
 {
     return temp_arg(tcgv_ptr_temp(v));
@@ -738,6 +748,11 @@ static inline TCGv_i64 temp_tcgv_i64(TCGTemp *t)
     return (TCGv_i64)temp_tcgv_i32(t);
 }
 
+static inline TCGv_i128 temp_tcgv_i128(TCGTemp *t)
+{
+    return (TCGv_i128)temp_tcgv_i32(t);
+}
+
 static inline TCGv_ptr temp_tcgv_ptr(TCGTemp *t)
 {
     return (TCGv_ptr)temp_tcgv_i32(t);
@@ -860,6 +875,11 @@ static inline void tcg_temp_free_i64(TCGv_i64 arg)
     tcg_temp_free_internal(tcgv_i64_temp(arg));
 }
 
+static inline void tcg_temp_free_i128(TCGv_i128 arg)
+{
+    tcg_temp_free_internal(tcgv_i128_temp(arg));
+}
+
 static inline void tcg_temp_free_ptr(TCGv_ptr arg)
 {
     tcg_temp_free_internal(tcgv_ptr_temp(arg));
@@ -908,6 +928,18 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
+static inline TCGv_i128 tcg_temp_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, false);
+    return temp_tcgv_i128(t);
+}
+
+static inline TCGv_i128 tcg_temp_local_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, true);
+    return temp_tcgv_i128(t);
+}
+
 static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index e9bb1f329f..2ab012a095 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1251,26 +1251,45 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
         tcg_debug_assert(ts->base_type == type);
         tcg_debug_assert(ts->kind == kind);
     } else {
+        int i, n;
+
+        switch (type) {
+        case TCG_TYPE_I32:
+        case TCG_TYPE_V64:
+        case TCG_TYPE_V128:
+        case TCG_TYPE_V256:
+            n = 1;
+            break;
+        case TCG_TYPE_I64:
+            n = 64 / TCG_TARGET_REG_BITS;
+            break;
+        case TCG_TYPE_I128:
+            n = 128 / TCG_TARGET_REG_BITS;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
         ts = tcg_temp_alloc(s);
-        if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
-            TCGTemp *ts2 = tcg_temp_alloc(s);
+        ts->base_type = type;
+        ts->temp_allocated = 1;
+        ts->kind = kind;
 
-            ts->base_type = type;
-            ts->type = TCG_TYPE_I32;
-            ts->temp_allocated = 1;
-            ts->kind = kind;
-
-            tcg_debug_assert(ts2 == ts + 1);
-            ts2->base_type = TCG_TYPE_I64;
-            ts2->type = TCG_TYPE_I32;
-            ts2->temp_allocated = 1;
-            ts2->temp_subindex = 1;
-            ts2->kind = kind;
-        } else {
-            ts->base_type = type;
+        if (n == 1) {
             ts->type = type;
-            ts->temp_allocated = 1;
-            ts->kind = kind;
+        } else {
+            ts->type = TCG_TYPE_REG;
+
+            for (i = 1; i < n; ++i) {
+                TCGTemp *ts2 = tcg_temp_alloc(s);
+
+                tcg_debug_assert(ts2 == ts + i);
+                ts2->base_type = type;
+                ts2->type = TCG_TYPE_REG;
+                ts2->temp_allocated = 1;
+                ts2->temp_subindex = i;
+                ts2->kind = kind;
+            }
         }
     }
 
@@ -3359,9 +3378,14 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
     case TCG_TYPE_V64:
         align = 8;
         break;
+    case TCG_TYPE_I128:
     case TCG_TYPE_V128:
     case TCG_TYPE_V256:
-        /* Note that we do not require aligned storage for V256. */
+        /*
+         * Note that we do not require aligned storage for V256,
+         * and that we provide alignment for I128 to match V128,
+         * even if that's above what the host ABI requires.
+         */
         align = 16;
         break;
     default:
-- 
2.34.1


