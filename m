Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWEn-0002QS-M8
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDX-0004FH-DN
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:32 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDU-0003Aa-6J
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:30 -0500
Received: by mail-pl1-x635.google.com with SMTP id i3so5552311plg.6
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=muKWZigrTG0gZJODOQUV3tX7j3/M0bbzqhpHMPJfkYo=;
 b=Xyt2k5Ud8eiGrcvqCwysPkVoeyDvBNW4qJpXU+br2EzibIoVBJ2Yqu24dH4NMfCkGK
 PgAXe2EAfxemCQ4TnoNTl7zgTEnyOo1MnpJ88B9wptJPKK2YhUZrqHKVafXYQ+39qN2p
 GFg5oW4chwgKYzbcPY6F6OGmqpqJh/XOIaqJYf/QFjqzzAiDDFnq+0JvJxP/edpm/8j6
 i7YKQEDNBHMuyuPGr/o148tOAoKHi9+soy4DRTb7Y3Bob6qCxFz+1RvPnK31JEfrHRaW
 3h0+2Gsh62ZQHpjCz1MaJ9NJjubpT4FQJzOP+3wlZh7y6Hm37SqZ2baVJ5sKlHcBGGTz
 QCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=muKWZigrTG0gZJODOQUV3tX7j3/M0bbzqhpHMPJfkYo=;
 b=75sKY1BZbxzsK6W421JDSvmiPc7OZQtDkLRfqewfn6Z12ikn7Ly+fPFS7sc8Dd+/qg
 TkeyAJyWEgkvzGCG740Ly01u86ClVz56DrBv7WCplsghNonm/D9jgF/b65uXQhMb/xA5
 M7TY/bkDLdR5eSwJSzubkSD2w/5rpw+evJobe5U5pLdK8nKbjRfdTtrJ9lF1ahdz6MDk
 W6dM+fB/go2k9zev9ltiX8nWed8AWr1XoSq1jfSNp/jsOi//afL+QAUh7doyqk97RGRH
 2ycQOOQwFlajNcJMZYBCfx80OBuLTr5nZ3A9njys4d+N1YrxSvTE+b3Hn1TR2hTGQKo1
 K1pQ==
X-Gm-Message-State: AO0yUKVOD9ho8Yk6/Hk3nbF3oGeydYSdMC2Pz4jeMewj/NJAaVVaC/4f
 wSb+zZO8II2LChU8BDqXViwiDA==
X-Google-Smtp-Source: AK7set9/dZfAt+PbcViu83yXnTSbOulqyWT5/3CDn5n65w9+/OiFuS0fZgVCU497F5yi8Xr7dYbX4A==
X-Received: by 2002:a05:6a20:160a:b0:b8:a0e1:2739 with SMTP id
 l10-20020a056a20160a00b000b8a0e12739mr29438519pzj.3.1677476306870; 
 Sun, 26 Feb 2023 21:38:26 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 30/31] tcg: Remove tcg_temp_local_new_*, tcg_const_local_*
Date: Sun, 26 Feb 2023 19:37:00 -1000
Message-Id: <20230227053701.368744-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_BITCOIN=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:38:32 -0000

These symbols are now unused.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  2 --
 include/tcg/tcg.h    | 28 ----------------------------
 tcg/tcg.c            | 16 ----------------
 3 files changed, 46 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 66b1461caa..353d430a63 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -828,14 +828,12 @@ static inline void tcg_gen_plugin_cb_end(void)
 #if TARGET_LONG_BITS == 32
 #define tcg_temp_new() tcg_temp_new_i32()
 #define tcg_global_mem_new tcg_global_mem_new_i32
-#define tcg_temp_local_new() tcg_temp_local_new_i32()
 #define tcg_temp_free tcg_temp_free_i32
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i32
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i32
 #else
 #define tcg_temp_new() tcg_temp_new_i64()
 #define tcg_global_mem_new tcg_global_mem_new_i64
-#define tcg_temp_local_new() tcg_temp_local_new_i64()
 #define tcg_temp_free tcg_temp_free_i64
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i64
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i64
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 2e220d4040..7e2b954dbc 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -905,12 +905,6 @@ static inline TCGv_i32 tcg_temp_new_i32(void)
     return temp_tcgv_i32(t);
 }
 
-static inline TCGv_i32 tcg_temp_local_new_i32(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_TB);
-    return temp_tcgv_i32(t);
-}
-
 static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
@@ -931,12 +925,6 @@ static inline TCGv_i64 tcg_temp_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
-static inline TCGv_i64 tcg_temp_local_new_i64(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_TB);
-    return temp_tcgv_i64(t);
-}
-
 /* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
 static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
 {
@@ -950,12 +938,6 @@ static inline TCGv_i128 tcg_temp_new_i128(void)
     return temp_tcgv_i128(t);
 }
 
-static inline TCGv_i128 tcg_temp_local_new_i128(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_TB);
-    return temp_tcgv_i128(t);
-}
-
 static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
@@ -976,12 +958,6 @@ static inline TCGv_ptr tcg_temp_new_ptr(void)
     return temp_tcgv_ptr(t);
 }
 
-static inline TCGv_ptr tcg_temp_local_new_ptr(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_TB);
-    return temp_tcgv_ptr(t);
-}
-
 #if defined(CONFIG_DEBUG_TCG)
 /* If you call tcg_clear_temp_count() at the start of a section of
  * code which is not supposed to leak any TCG temporaries, then
@@ -1084,8 +1060,6 @@ void tcg_optimize(TCGContext *s);
 /* Allocate a new temporary and initialize it with a constant. */
 TCGv_i32 tcg_const_i32(int32_t val);
 TCGv_i64 tcg_const_i64(int64_t val);
-TCGv_i32 tcg_const_local_i32(int32_t val);
-TCGv_i64 tcg_const_local_i64(int64_t val);
 TCGv_vec tcg_const_zeros_vec(TCGType);
 TCGv_vec tcg_const_ones_vec(TCGType);
 TCGv_vec tcg_const_zeros_vec_matching(TCGv_vec);
@@ -1113,11 +1087,9 @@ TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 
 #if UINTPTR_MAX == UINT32_MAX
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
-# define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i32((intptr_t)(x)))
 # define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i32((intptr_t)(x)))
 #else
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i64((intptr_t)(x)))
-# define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i64((intptr_t)(x)))
 # define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i64((intptr_t)(x)))
 #endif
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 758b2a3e06..b65f2ffdbe 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1476,22 +1476,6 @@ TCGv_i64 tcg_const_i64(int64_t val)
     return t0;
 }
 
-TCGv_i32 tcg_const_local_i32(int32_t val)
-{
-    TCGv_i32 t0;
-    t0 = tcg_temp_local_new_i32();
-    tcg_gen_movi_i32(t0, val);
-    return t0;
-}
-
-TCGv_i64 tcg_const_local_i64(int64_t val)
-{
-    TCGv_i64 t0;
-    t0 = tcg_temp_local_new_i64();
-    tcg_gen_movi_i64(t0, val);
-    return t0;
-}
-
 #if defined(CONFIG_DEBUG_TCG)
 void tcg_clear_temp_count(void)
 {
-- 
2.34.1


