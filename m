Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWOM-0000k6-Lq
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNa-0005H2-Dh
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:54 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNX-0007Kg-0k
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:53 -0500
Received: by mail-pl1-x62f.google.com with SMTP id c1so5582324plg.4
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sYsgaqBrBGiI3+Jh2WZEiCq4q19WvUz6hEnSof98BJo=;
 b=FSrTyzh5bK28sB/luozKktwrAKm3kgVnjqPE8wFy6dO/K9ex6XKsTUfZPWliw3b6KG
 rGo/RYFt5GhajQKl90pAq8mqK9dv+dW8DgtTWt4CgZkbeKEHbV+yN0vhxKwRBhf95vEI
 EnXKnyKv3SsR+nOkp/kh2qp9cJF2ONolJ5keSYEk/l9k6VKebaRbNLnu+odihfZVH1K+
 ob8yC8PkLGj3PM/w+IqJRWY+8+0uKJtlGWe+Fwc51E3dGobJGs03XwRfSfRuuzX5ENjY
 jX6DY0JyRXToAmgLWalysPHeX509mkNLmiTAU97bbEke2W1lkulA8zfbvRqywzx9FDjK
 M10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sYsgaqBrBGiI3+Jh2WZEiCq4q19WvUz6hEnSof98BJo=;
 b=lLEuVKiquKNc0X8vQh8qvALekOFFPy4pc4prnlQA0b2F8AoQOf/Wi+d8LHuPefb/ya
 koqDy9tQybL0hEhsdz4Ylg6EtvNehblxsHo4He4sttZPntfdAbpDnyndaWSRy5PVL2X6
 4aWpbS1wxQbRorMZxzCwYC2oP1clbiuGJL55d4wliRGPlbo1Ftz2z6I6u1sRMUQcPuK4
 /MVYu1xbcLM9LXiJ6N4REHcwZKXc+ai7+BVekLVO+yTKEkAWPb9pwUb+6vek6C4qFsI4
 mjHLHBnRg7AI8BhwpeSkMdbg0yuTOM9wP4o2re3M5FXyVvoCgKelDCRTGBhbZ5PvHg77
 g8mQ==
X-Gm-Message-State: AO0yUKVdc8+RGzYC9Kz1AKpyR7kdywqdiC3CxKb2RSAP+QxOjH9ePhBB
 v7h6Kf+mTba9SEvlwfgrDE8MkA==
X-Google-Smtp-Source: AK7set8khz0qAVxBS8pvTfThfYIKxjh3hzfoHnVoB5CdCutNEFEX3T/0Si0wAQt1gQejDHtOUyyUdw==
X-Received: by 2002:a17:902:e812:b0:19b:da8:1ce6 with SMTP id
 u18-20020a170902e81200b0019b0da81ce6mr30069146plg.55.1677476929962; 
 Sun, 26 Feb 2023 21:48:49 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 70/70] tcg: Drop tcg_const_*
Date: Sun, 26 Feb 2023 19:42:33 -1000
Message-Id: <20230227054233.390271-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:48:54 -0000

These functions are no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  4 ----
 include/tcg/tcg.h    |  6 ------
 tcg/tcg.c            | 16 ----------------
 3 files changed, 26 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 353d430a63..1d682d0b0a 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1094,9 +1094,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_extract_tl tcg_gen_extract_i64
 #define tcg_gen_sextract_tl tcg_gen_sextract_i64
 #define tcg_gen_extract2_tl tcg_gen_extract2_i64
-#define tcg_const_tl tcg_const_i64
 #define tcg_constant_tl tcg_constant_i64
-#define tcg_const_local_tl tcg_const_local_i64
 #define tcg_gen_movcond_tl tcg_gen_movcond_i64
 #define tcg_gen_add2_tl tcg_gen_add2_i64
 #define tcg_gen_sub2_tl tcg_gen_sub2_i64
@@ -1210,9 +1208,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_extract_tl tcg_gen_extract_i32
 #define tcg_gen_sextract_tl tcg_gen_sextract_i32
 #define tcg_gen_extract2_tl tcg_gen_extract2_i32
-#define tcg_const_tl tcg_const_i32
 #define tcg_constant_tl tcg_constant_i32
-#define tcg_const_local_tl tcg_const_local_i32
 #define tcg_gen_movcond_tl tcg_gen_movcond_i32
 #define tcg_gen_add2_tl tcg_gen_add2_i32
 #define tcg_gen_sub2_tl tcg_gen_sub2_i32
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 80a2597293..a1b41c1728 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -989,10 +989,6 @@ void tcg_remove_ops_after(TCGOp *op);
 
 void tcg_optimize(TCGContext *s);
 
-/* Allocate a new temporary and initialize it with a constant. */
-TCGv_i32 tcg_const_i32(int32_t val);
-TCGv_i64 tcg_const_i64(int64_t val);
-
 /*
  * Locate or create a read-only temporary that is a constant.
  * This kind of temporary need not be freed, but for convenience
@@ -1014,10 +1010,8 @@ TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val);
 TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 
 #if UINTPTR_MAX == UINT32_MAX
-# define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
 # define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i32((intptr_t)(x)))
 #else
-# define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i64((intptr_t)(x)))
 # define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i64((intptr_t)(x)))
 #endif
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 4d3fb6aee2..3ba0bdaaba 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1444,22 +1444,6 @@ TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val)
     return tcg_constant_vec(t->base_type, vece, val);
 }
 
-TCGv_i32 tcg_const_i32(int32_t val)
-{
-    TCGv_i32 t0;
-    t0 = tcg_temp_new_i32();
-    tcg_gen_movi_i32(t0, val);
-    return t0;
-}
-
-TCGv_i64 tcg_const_i64(int64_t val)
-{
-    TCGv_i64 t0;
-    t0 = tcg_temp_new_i64();
-    tcg_gen_movi_i64(t0, val);
-    return t0;
-}
-
 /* Return true if OP may appear in the opcode stream.
    Test the runtime variable that controls each opcode.  */
 bool tcg_op_supported(TCGOpcode op)
-- 
2.34.1


