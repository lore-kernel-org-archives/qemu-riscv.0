Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWOL-0000fH-RS
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNY-00055Y-1g
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:52 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNU-000716-C3
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:51 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso4016503pjs.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iYaMJQN3FS2hLRKLRxWbPb4i2fPMZWZUTwMSKfyflhs=;
 b=i9Pfe4pS521rDBdpM+FVZq3a4cMLQFE83RrVP6TzWUipoEBlQds9bWgaLquzrRI3VE
 J3fF6D4WIuJ4/u0icN+2iYJ1HHQ/KNfM5RJM98wxAkMwUpvsXcTULWCwZZT3eM50E0Ty
 x7/ajGa/jzS+ALBMFq3whd8KIlqw42EQeg3ks+rBBe13xroCv6uga0mYUSyOMnbh1E1i
 U0VOVBvaU54yqsjr48618muhN/GIg1xeMXfxJiuPEOxaxHyQ68OFSkwedbxIHmmE9r4W
 xWxJ+DzfzrMyBVvHrE3kdi59kEcdR0mUVT80yFG33YjzqIedlr9TZCB1+HERPHmop0Zd
 lvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iYaMJQN3FS2hLRKLRxWbPb4i2fPMZWZUTwMSKfyflhs=;
 b=hbxy2H346nFW11lhp+Ehodc81orcrPLQqpUYwdH2rqXxxt2fBfQDo5tGASzA8dO7MV
 7TVN3+0YHglz6zPUxB5xE0c4YOJIrNC8BmQ6dlIeMcBmF0HhE5g/vDEVfYXZn81zTqI2
 I6xauMQRn3cydec3s0gKlgx/ry0DuT+pM+1qKTw1HRVGAsCPLLJjKAWzqh6570sU6mhR
 fLrqwqNqzlUrvJ/a75/XpUWvXbEJiuyQD/lGdQ96/hksJsffXh3bPN06mlddKmc/4433
 PWHHG1laCQbeBpT2HAWZgS0ERO2HAMJcrKTA+YjWISXrIseiixEaV6I8SaIpz5BBgrWN
 zbhA==
X-Gm-Message-State: AO0yUKUV/3Y1WtJPHn8DqfOUULSs1Gu0DsaHLzedN8vs3Es2CzAGh0zj
 banHB2YHuTLCaobksuNuj/Hffg==
X-Google-Smtp-Source: AK7set8tORbRYvUDW48QkpR7V0SGmG0cCf6Tl9mQjGvqqqHYnVehlMnTmwf8XYF1Lo4Z9+x4y2fZPA==
X-Received: by 2002:a17:902:f988:b0:19c:eb50:88b9 with SMTP id
 ky8-20020a170902f98800b0019ceb5088b9mr6494626plb.29.1677476927275; 
 Sun, 26 Feb 2023 21:48:47 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 69/70] tcg: Drop tcg_const_*_vec
Date: Sun, 26 Feb 2023 19:42:32 -1000
Message-Id: <20230227054233.390271-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:48:53 -0000

Replace with tcg_constant_vec*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         |  4 ----
 tcg/tcg-op-vec.c          | 34 ++--------------------------------
 tcg/i386/tcg-target.c.inc |  9 ++++-----
 3 files changed, 6 insertions(+), 41 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 43ce4bfa7d..80a2597293 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -992,10 +992,6 @@ void tcg_optimize(TCGContext *s);
 /* Allocate a new temporary and initialize it with a constant. */
 TCGv_i32 tcg_const_i32(int32_t val);
 TCGv_i64 tcg_const_i64(int64_t val);
-TCGv_vec tcg_const_zeros_vec(TCGType);
-TCGv_vec tcg_const_ones_vec(TCGType);
-TCGv_vec tcg_const_zeros_vec_matching(TCGv_vec);
-TCGv_vec tcg_const_ones_vec_matching(TCGv_vec);
 
 /*
  * Locate or create a read-only temporary that is a constant.
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 0f023f42c6..aeeb2435cb 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -229,32 +229,6 @@ void tcg_gen_mov_vec(TCGv_vec r, TCGv_vec a)
     }
 }
 
-TCGv_vec tcg_const_zeros_vec(TCGType type)
-{
-    TCGv_vec ret = tcg_temp_new_vec(type);
-    tcg_gen_dupi_vec(MO_64, ret, 0);
-    return ret;
-}
-
-TCGv_vec tcg_const_ones_vec(TCGType type)
-{
-    TCGv_vec ret = tcg_temp_new_vec(type);
-    tcg_gen_dupi_vec(MO_64, ret, -1);
-    return ret;
-}
-
-TCGv_vec tcg_const_zeros_vec_matching(TCGv_vec m)
-{
-    TCGTemp *t = tcgv_vec_temp(m);
-    return tcg_const_zeros_vec(t->base_type);
-}
-
-TCGv_vec tcg_const_ones_vec_matching(TCGv_vec m)
-{
-    TCGTemp *t = tcgv_vec_temp(m);
-    return tcg_const_ones_vec(t->base_type);
-}
-
 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec r, uint64_t a)
 {
     TCGTemp *rt = tcgv_vec_temp(r);
@@ -431,9 +405,7 @@ void tcg_gen_not_vec(unsigned vece, TCGv_vec r, TCGv_vec a)
     const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
 
     if (!TCG_TARGET_HAS_not_vec || !do_op2(vece, r, a, INDEX_op_not_vec)) {
-        TCGv_vec t = tcg_const_ones_vec_matching(r);
-        tcg_gen_xor_vec(0, r, a, t);
-        tcg_temp_free_vec(t);
+        tcg_gen_xor_vec(0, r, a, tcg_constant_vec_matching(r, 0, -1));
     }
     tcg_swap_vecop_list(hold_list);
 }
@@ -446,9 +418,7 @@ void tcg_gen_neg_vec(unsigned vece, TCGv_vec r, TCGv_vec a)
     hold_list = tcg_swap_vecop_list(NULL);
 
     if (!TCG_TARGET_HAS_neg_vec || !do_op2(vece, r, a, INDEX_op_neg_vec)) {
-        TCGv_vec t = tcg_const_zeros_vec_matching(r);
-        tcg_gen_sub_vec(vece, r, t, a);
-        tcg_temp_free_vec(t);
+        tcg_gen_sub_vec(vece, r, tcg_constant_vec_matching(r, vece, 0), a);
     }
     tcg_swap_vecop_list(hold_list);
 }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 883ced8168..e8e2a31658 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3651,6 +3651,7 @@ static void expand_vec_sari(TCGType type, unsigned vece,
         break;
 
     case MO_64:
+        t1 = tcg_temp_new_vec(type);
         if (imm <= 32) {
             /*
              * We can emulate a small sign extend by performing an arithmetic
@@ -3659,24 +3660,22 @@ static void expand_vec_sari(TCGType type, unsigned vece,
              * does not, so we have to bound the smaller shift -- we get the
              * same result in the high half either way.
              */
-            t1 = tcg_temp_new_vec(type);
             tcg_gen_sari_vec(MO_32, t1, v1, MIN(imm, 31));
             tcg_gen_shri_vec(MO_64, v0, v1, imm);
             vec_gen_4(INDEX_op_x86_blend_vec, type, MO_32,
                       tcgv_vec_arg(v0), tcgv_vec_arg(v0),
                       tcgv_vec_arg(t1), 0xaa);
-            tcg_temp_free_vec(t1);
         } else {
             /* Otherwise we will need to use a compare vs 0 to produce
              * the sign-extend, shift and merge.
              */
-            t1 = tcg_const_zeros_vec(type);
-            tcg_gen_cmp_vec(TCG_COND_GT, MO_64, t1, t1, v1);
+            tcg_gen_cmp_vec(TCG_COND_GT, MO_64, t1,
+                            tcg_constant_vec(type, MO_64, 0), v1);
             tcg_gen_shri_vec(MO_64, v0, v1, imm);
             tcg_gen_shli_vec(MO_64, t1, t1, 64 - imm);
             tcg_gen_or_vec(MO_64, v0, v0, t1);
-            tcg_temp_free_vec(t1);
         }
+        tcg_temp_free_vec(t1);
         break;
 
     default:
-- 
2.34.1


