Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWO6-0006gs-UA
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWN1-0003F1-Lz
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:19 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMw-0007C1-Fl
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:19 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so5090939pjz.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gLmyB+iwGargxrSLV7jFqWBr2B0CWbel1NbBx9Fai2E=;
 b=Htt+FENPAIEPutTk3/7rQbR9HLFuc3kprQqUj20LXRwpU0b8D+PzdEGz5oAhPRsDji
 fOSwLXEroDBUMF8HTT/kIseH0DCiij5CwEtKJSUPr3dLFSpN5kh5sbE0LxLuhSxkycT6
 INwzNRurA7KAvfKeGXqUheQw80i3y6ITp1+nY6SDiFdT5FMRmbBkTsdf3LHQdgjEuGrh
 d4AJbiXPyxAz0yhKZ539BkEG7yi/WqYm8or3pwT4AtviHZ27c+BBZoNyzdloGcWBJYMG
 i+5GhqkGYxGtMSzQXcqbt5rYSZCTMquABVA8cSn7rJKmHf3evqcZB+CEhX/ge5PjZDwR
 kpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gLmyB+iwGargxrSLV7jFqWBr2B0CWbel1NbBx9Fai2E=;
 b=VBzNb1SA7aHhQd7uw8WRJP59AtdDc1a4+ne+3zFs3DeSJ/OBjTCDfEbJzSBV9w/+nB
 RwYbZAhBdSzADimowHylPLXmTldpO6GDypS8K6+0xjGiKfgzq38ycG+3irwzZ9nHnxNX
 at7A0Imj8aMu62VktVNbWqHBHtapGtlAlhNnHAuXEvqom0KcKkTGLqGwNyqYiU7+vLQh
 4BDdjqjW7ePqMaoGZSEmryqvgjx2w4iN6vCEeXren3kSC/GyQ16hQqq5fA9485d/tD/d
 CkOURDd5f6UNLX90U4F1rTMJjhfbJsRzreHban29v96Boo/fNLthG0QTOYQ0M5H8jfRA
 4EZQ==
X-Gm-Message-State: AO0yUKXgzrIAsRCkGt/Emyh6/5EF0eHBVtniHoGD6qUXkvUgPgz93seV
 iu6SzFKmaXqGjLZl1VrERZZ/cA==
X-Google-Smtp-Source: AK7set9t4kMxfpb5aXnXraD0UosA4p7zKwEhKUwrqyffjpnwGrxdzQNKt4vyrwrHG1p0VkfZznWqiw==
X-Received: by 2002:a17:902:ec92:b0:19a:9864:2887 with SMTP id
 x18-20020a170902ec9200b0019a98642887mr8073949plg.7.1677476893125; 
 Sun, 26 Feb 2023 21:48:13 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 56/70] target/tricore: Split t_n as constant from temp as
 variable
Date: Sun, 26 Feb 2023 19:42:19 -1000
Message-Id: <20230227054233.390271-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:48:20 -0000

As required, allocate temp separately.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 268 +++++++++++++++++++------------------
 1 file changed, 140 insertions(+), 128 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 127f9a989a..194bef27a6 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -595,21 +595,22 @@ static inline void
 gen_madd_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
            TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -621,21 +622,22 @@ static inline void
 gen_maddsu_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
              TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -647,22 +649,22 @@ static inline void
 gen_maddsum_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
               TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
     TCGv_i64 temp64_3 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_concat_i32_i64(temp64_3, r1_low, r1_high);
@@ -682,23 +684,24 @@ static inline void
 gen_madds_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
            TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv temp3 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
 
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -718,23 +721,24 @@ static inline void
 gen_maddsus_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
               TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv temp3 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
 
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -752,22 +756,22 @@ static inline void
 gen_maddsums_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
                TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
 
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_sari_i64(temp64_2, temp64, 32); /* high */
@@ -785,22 +789,22 @@ static inline void
 gen_maddm_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
            TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
     TCGv_i64 temp64_3 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mulm_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_concat_i32_i64(temp64_2, r1_low, r1_high);
@@ -813,21 +817,21 @@ static inline void
 gen_maddms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
            TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mulm_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_concat_i32_i64(temp64_2, r1_low, r1_high);
@@ -839,20 +843,20 @@ static inline void
 gen_maddr64_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3, uint32_t n,
               uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     gen_helper_addr_h(ret, cpu_env, temp64, r1_low, r1_high);
@@ -872,21 +876,22 @@ gen_maddr32_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 static inline void
 gen_maddsur32_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
@@ -899,20 +904,20 @@ static inline void
 gen_maddr64s_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3,
                uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     gen_helper_addr_h_ssov(ret, cpu_env, temp64, r1_low, r1_high);
@@ -932,21 +937,22 @@ gen_maddr32s_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 static inline void
 gen_maddsur32s_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
@@ -957,15 +963,15 @@ gen_maddsur32s_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 static inline void
 gen_maddr_q(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n)
 {
-    TCGv temp = tcg_const_i32(n);
-    gen_helper_maddr_q(ret, cpu_env, r1, r2, r3, temp);
+    TCGv t_n = tcg_constant_i32(n);
+    gen_helper_maddr_q(ret, cpu_env, r1, r2, r3, t_n);
 }
 
 static inline void
 gen_maddrs_q(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n)
 {
-    TCGv temp = tcg_const_i32(n);
-    gen_helper_maddr_q_ssov(ret, cpu_env, r1, r2, r3, temp);
+    TCGv t_n = tcg_constant_i32(n);
+    gen_helper_maddr_q_ssov(ret, cpu_env, r1, r2, r3, t_n);
 }
 
 static inline void
@@ -1176,10 +1182,10 @@ gen_madds64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
              TCGv arg3, uint32_t n)
 {
     TCGv_i64 r1 = tcg_temp_new_i64();
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
 
     tcg_gen_concat_i32_i64(r1, arg1_low, arg1_high);
-    gen_helper_madd64_q_ssov(r1, cpu_env, r1, arg2, arg3, temp);
+    gen_helper_madd64_q_ssov(r1, cpu_env, r1, arg2, arg3, t_n);
     tcg_gen_extr_i64_i32(rl, rh, r1);
 }
 
@@ -1516,21 +1522,22 @@ static inline void
 gen_msub_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
            TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -1542,23 +1549,24 @@ static inline void
 gen_msubs_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
             TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv temp3 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
 
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -1576,22 +1584,22 @@ static inline void
 gen_msubm_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
             TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
     TCGv_i64 temp64_3 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mulm_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_concat_i32_i64(temp64_2, r1_low, r1_high);
@@ -1604,21 +1612,21 @@ static inline void
 gen_msubms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
              TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mulm_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mulm_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mulm_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_concat_i32_i64(temp64_2, r1_low, r1_high);
@@ -1630,20 +1638,20 @@ static inline void
 gen_msubr64_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3, uint32_t n,
               uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     gen_helper_subr_h(ret, cpu_env, temp64, r1_low, r1_high);
@@ -1664,20 +1672,20 @@ static inline void
 gen_msubr64s_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3,
                uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     gen_helper_subr_h_ssov(ret, cpu_env, temp64, r1_low, r1_high);
@@ -1912,10 +1920,10 @@ gen_msubs64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
              TCGv arg3, uint32_t n)
 {
     TCGv_i64 r1 = tcg_temp_new_i64();
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
 
     tcg_gen_concat_i32_i64(r1, arg1_low, arg1_high);
-    gen_helper_msub64_q_ssov(r1, cpu_env, r1, arg2, arg3, temp);
+    gen_helper_msub64_q_ssov(r1, cpu_env, r1, arg2, arg3, t_n);
     tcg_gen_extr_i64_i32(rl, rh, r1);
 }
 
@@ -1923,21 +1931,22 @@ static inline void
 gen_msubad_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
              TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -1949,22 +1958,22 @@ static inline void
 gen_msubadm_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
               TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
     TCGv_i64 temp64_3 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_concat_i32_i64(temp64_3, r1_low, r1_high);
@@ -1981,21 +1990,22 @@ gen_msubadm_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
 static inline void
 gen_msubadr32_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
@@ -2007,23 +2017,24 @@ static inline void
 gen_msubads_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
               TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv temp3 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
 
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_extr_i64_i32(temp, temp2, temp64);
@@ -2041,22 +2052,22 @@ static inline void
 gen_msubadms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
                TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
     TCGv_i64 temp64 = tcg_temp_new_i64();
     TCGv_i64 temp64_2 = tcg_temp_new_i64();
 
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_sari_i64(temp64_2, temp64, 32); /* high */
@@ -2072,21 +2083,22 @@ gen_msubadms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
 static inline void
 gen_msubadr32s_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv t_n = tcg_constant_i32(n);
+    TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
     TCGv_i64 temp64 = tcg_temp_new_i64();
     switch (mode) {
     case MODE_LL:
-        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_LU:
-        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UL:
-        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
         break;
     case MODE_UU:
-        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
+        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
         break;
     }
     tcg_gen_andi_tl(temp2, r1, 0xffff0000);
-- 
2.34.1


