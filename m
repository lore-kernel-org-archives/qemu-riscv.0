Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611BDCCA476
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 13:45:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7DQF-0002rA-B9; Fri, 10 Oct 2025 09:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DQ1-0002gE-Oz
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:44:27 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DP6-0008Dh-J0
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:44:24 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e3cdc1a6aso16177115e9.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 06:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103803; x=1760708603; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZ70FBKY4+s0L/x7oUlvTRh2QaFbRkjPAeRTOspddlc=;
 b=MS0HcVCtPODZgk337AWLHzk+9tcLjl+KnG5zzpslXMkV6aIMxmSEZMT9/iW4YwspBG
 HlLcpItix+lOoZf74/AtFf77wPegmiLiTjRvWF9MZfXrHksJEidGnlKLxin6xGYhliPr
 SGUnm7RMwQBwOA0lWHZcFag9fMFJoxDshqzFIlfliOMrO+MhiHdvbYkrKq5DFSdUgE6T
 6RNZe3Y0G3KU+kKHlriYaFbTsSpixmrhYaXaLGPq0xsdum2DUTu1ui0vtj+NIMRe4WW2
 LvhzTZlw9ryDM6C3GGSJSJ+kyAtQUuRr5UOQ8pGxM7vPO4p5lzz73IR63YrBBA+DiR/L
 jguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103803; x=1760708603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fZ70FBKY4+s0L/x7oUlvTRh2QaFbRkjPAeRTOspddlc=;
 b=TXupXWQzhuxNBUwbdVuMjUIwcS2/TulY2wwR8Ez4FEUJuW/dUWKfYH95uEhJimE/W6
 QHl00w4ezL/6P1HsTn9MFvjC376cQgBURy3iouC9fPIxcWJdA+42hZxaf0witnNgQ2we
 RAHNtYzOr/UU8Qv83ElICu4FwcuK2ZVcGObEIdt/tArRwRC7wDPchJOphV0QQvUzpBim
 s3RE2iUqDFcYEKjW7ZIyyEX7WkwGpt19np1YOiuRnvRkhn6MBiqieFN/5MlYYUqUCjxl
 H/n2kww4MZwjxJ1saAZe/JL9kBo8itw8hmFrrIwiIxaw9/1N/kfUDZuuAg3lawwxC6f6
 16WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOUas/fmLmbv42Ccj2YMve5xV8+rbsOoGUmvznBMtG6Fx2Mb92rF4yX2SGavkwPOrDRSJaB+Kw7qqo@nongnu.org
X-Gm-Message-State: AOJu0YwWElQQx7OtiVduG1Byei66337Qnlfzq7g1cFRND6Hu443L3MG0
 jwCcbzwtLuTdzhDvybp49OlkvxTpPLJrM6GefpSrx2F59zo0qhOAsXI0mqIbPAgpsro=
X-Gm-Gg: ASbGnctvLfEhBENntWDHThabYrjKCsHVFBjUil/Jo+e1J8VEIPCke7THfZEQNqBCkPN
 1DWsTBruNJW9sDtkvQhFYTYeqnjT6prc6BavNF44lQZNAEc22OaWFvG43opgfRFTRpVdeK9ncvh
 KCQPqeaPvDox3J5j1TxcXdbif4D5M/p0gnUwcdYjia1P+ISzU/j9vO8M0A6J1kDk0/eo9URMxo4
 gTOcO7WXaXw5Ks8yIOUpmhMubtCQS/SU8vMQCL+jDj6UDvpdkCnWv9n84zK69JMPBmTAibDpEvF
 CXbRX2V4xqND6GuevAK2tJ9b89YU+miRNL7D4KzQqHVA23iqvrbMkSqTLD6XaZgAH8PveKmskc9
 VDPkUTlG7v7m2p+u8WbNawi1uOdtUygLk9UYQDpOfg7AJ/l3/tnMYwmrIVQi67Wa9lXj08Ip3Y2
 oi4K1P/2eMpUIGIEo0rBI=
X-Google-Smtp-Source: AGHT+IHXkvIW8LcdXop7DKGm566+eNPdoRKudLm9xlk71CiBM0ihcQ2zOWB9SdW91GD7n6+nMLU6dw==
X-Received: by 2002:a05:600c:1d9e:b0:46e:2815:8568 with SMTP id
 5b1f17b1804b1-46fa9ebe0dfmr75001985e9.10.1760103803215; 
 Fri, 10 Oct 2025 06:43:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb484c71csm49859345e9.8.2025.10.10.06.43.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:43:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 10/16] target/arm: Replace HOST_BIG_ENDIAN #ifdef with runtime
 if() check
Date: Fri, 10 Oct 2025 15:42:19 +0200
Message-ID: <20251010134226.72221-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Replace compile-time #ifdef with a runtime check to ensure all code
paths are built and tested. This reduces build-time configuration
complexity and improves maintainability.

No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h               |  8 ++++----
 target/arm/tcg/translate-a64.h |  5 ++---
 target/arm/tcg/sve_helper.c    | 10 ++--------
 target/arm/tcg/translate-sve.c | 22 +++++++++++-----------
 target/arm/tcg/translate-vfp.c |  8 +-------
 target/arm/tcg/translate.c     |  6 +++---
 6 files changed, 23 insertions(+), 36 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 41414ac22b8..3f0a578a72a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1249,17 +1249,17 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask);
  */
 static inline uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
 {
-#if HOST_BIG_ENDIAN
     int i;
 
+    if (!HOST_BIG_ENDIAN) {
+        return src;
+    }
+
     for (i = 0; i < nr; ++i) {
         dst[i] = bswap64(src[i]);
     }
 
     return dst;
-#else
-    return src;
-#endif
 }
 
 void aarch64_sync_32_to_64(CPUARMState *env);
diff --git a/target/arm/tcg/translate-a64.h b/target/arm/tcg/translate-a64.h
index 9c45f89305b..ce8303286ef 100644
--- a/target/arm/tcg/translate-a64.h
+++ b/target/arm/tcg/translate-a64.h
@@ -82,7 +82,7 @@ static inline int vec_reg_offset(DisasContext *s, int regno,
 {
     int element_size = 1 << size;
     int offs = element * element_size;
-#if HOST_BIG_ENDIAN
+
     /* This is complicated slightly because vfp.zregs[n].d[0] is
      * still the lowest and vfp.zregs[n].d[15] the highest of the
      * 256 byte vector, even on big endian systems.
@@ -97,10 +97,9 @@ static inline int vec_reg_offset(DisasContext *s, int regno,
      * operations will have to special case loading and storing from
      * the zregs array.
      */
-    if (element_size < 8) {
+    if (HOST_BIG_ENDIAN && element_size < 8) {
         offs ^= 8 - element_size;
     }
-#endif
     offs += offsetof(CPUARMState, vfp.zregs[regno]);
     assert_fp_access_checked(s);
     return offs;
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index c442fcb540d..dd829666cc2 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -2861,12 +2861,9 @@ static void swap_memmove(void *vd, void *vs, size_t n)
 {
     uintptr_t d = (uintptr_t)vd;
     uintptr_t s = (uintptr_t)vs;
-    uintptr_t o = (d | s | n) & 7;
+    uintptr_t o = HOST_BIG_ENDIAN ? (d | s | n) & 7 : 0;
     size_t i;
 
-#if !HOST_BIG_ENDIAN
-    o = 0;
-#endif
     switch (o) {
     case 0:
         memmove(vd, vs, n);
@@ -2918,7 +2915,7 @@ static void swap_memmove(void *vd, void *vs, size_t n)
 static void swap_memzero(void *vd, size_t n)
 {
     uintptr_t d = (uintptr_t)vd;
-    uintptr_t o = (d | n) & 7;
+    uintptr_t o = HOST_BIG_ENDIAN ? (d | n) & 7 : 0;
     size_t i;
 
     /* Usually, the first bit of a predicate is set, so N is 0.  */
@@ -2926,9 +2923,6 @@ static void swap_memzero(void *vd, size_t n)
         return;
     }
 
-#if !HOST_BIG_ENDIAN
-    o = 0;
-#endif
     switch (o) {
     case 0:
         memset(vd, 0, n);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 07b827fa8e8..60a99fbe15e 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -2770,12 +2770,12 @@ static TCGv_i64 load_last_active(DisasContext *s, TCGv_i32 last,
      * The final adjustment for the vector register base
      * is added via constant offset to the load.
      */
-#if HOST_BIG_ENDIAN
-    /* Adjust for element ordering.  See vec_reg_offset.  */
-    if (esz < 3) {
-        tcg_gen_xori_i32(last, last, 8 - (1 << esz));
+    if (HOST_BIG_ENDIAN) {
+        /* Adjust for element ordering.  See vec_reg_offset.  */
+        if (esz < 3) {
+            tcg_gen_xori_i32(last, last, 8 - (1 << esz));
+        }
     }
-#endif
     tcg_gen_ext_i32_ptr(p, last);
     tcg_gen_add_ptr(p, p, tcg_env);
 
@@ -5394,9 +5394,9 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
          * for this load operation.
          */
         TCGv_i64 tmp = tcg_temp_new_i64();
-#if HOST_BIG_ENDIAN
-        poff += 6;
-#endif
+        if (HOST_BIG_ENDIAN) {
+            poff += 6;
+        }
         tcg_gen_ld16u_i64(tmp, tcg_env, poff);
 
         poff = offsetof(CPUARMState, vfp.preg_tmp);
@@ -5478,9 +5478,9 @@ static void do_ldro(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
          * for this load operation.
          */
         TCGv_i64 tmp = tcg_temp_new_i64();
-#if HOST_BIG_ENDIAN
-        poff += 4;
-#endif
+        if (HOST_BIG_ENDIAN) {
+            poff += 4;
+        }
         tcg_gen_ld32u_i64(tmp, tcg_env, poff);
 
         poff = offsetof(CPUARMState, vfp.preg_tmp);
diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index 8d9d1ab877a..cf3ca4b33c4 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -95,15 +95,9 @@ uint64_t vfp_expand_imm(int size, uint8_t imm8)
 static inline long vfp_f16_offset(unsigned reg, bool top)
 {
     long offs = vfp_reg_offset(false, reg);
-#if HOST_BIG_ENDIAN
-    if (!top) {
+    if (top ^ HOST_BIG_ENDIAN) {
         offs += 2;
     }
-#else
-    if (top) {
-        offs += 2;
-    }
-#endif
     return offs;
 }
 
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 51654b0b91d..8ba0622489c 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -1148,15 +1148,15 @@ long neon_element_offset(int reg, int element, MemOp memop)
 {
     int element_size = 1 << (memop & MO_SIZE);
     int ofs = element * element_size;
-#if HOST_BIG_ENDIAN
+
     /*
      * Calculate the offset assuming fully little-endian,
      * then XOR to account for the order of the 8-byte units.
      */
-    if (element_size < 8) {
+    if (HOST_BIG_ENDIAN && element_size < 8) {
         ofs ^= 8 - element_size;
     }
-#endif
+
     return neon_full_reg_offset(reg) + ofs;
 }
 
-- 
2.51.0


