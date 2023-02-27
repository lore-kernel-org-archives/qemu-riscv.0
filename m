Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWEU-00010l-ST
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWD9-0003PY-Ra
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:09 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWD3-0002uc-6R
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:02 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so8859512pjb.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EN6i3124GbzuDzAfWYCmS/x0Jquz/HN39rL+uzxBiIE=;
 b=Uxj4uRpCpqZL5iI8xx/448eGHU8w2e36Mkh8lGpxZnx+zHg3hUkvE3AKZizAKCrFdq
 IyX0ueIDuHosRIJtKY1Fildw0KQq5ywVaXP/sE2UisifYHh4z7MbPAn2dLtUfJxA9Gvo
 g2bv/iEqDfq90WTkjQ2aV7G7GcqH0ZUstjgPUTVQ3KllTAhRURmDqoZfChMfQZ4+MeOv
 bw4qGO+MKBlRE+75LYBKLp0a1P1jvyUQHq2FIk5tRzgOgdzmsw7ZuypFKhcaMTSUPdOe
 gO3Yy7RzmkosVbYVgWvyfB40+c91kGsuT6qSi6zgon1Zp+I8hcLIZayoPLZrvsGolnLr
 oteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EN6i3124GbzuDzAfWYCmS/x0Jquz/HN39rL+uzxBiIE=;
 b=D2rws4zzLbS90dwnGrnKuSAkKtOmZDAHauSmj+V7Aj/PMJHTrVu2CZYmbooT7dW+Th
 8Y6gAAcIFvrLpPwn/ipCIZThCksMEUj1+UmOk2wqGoyjEtwHtWevtfXYayYbgQiGQeo6
 b9zieJBtWKUZcD/ZN84Y1di2v7Qb++ZHN+3UOt+AGL5AGYWRYZRPs77WHBhr2nTVtPwj
 WNL3HoU6E+n2QfyfTG+nm8X+2KRZVqZI24ASqRo8LNMs9Dut1tgm6mDZ+vwoAonF8/zc
 7/hbmEBINbNjAzQAnnDWeJAdXBtMo7Q/Ij8Y7w1iqfnITVbwl/uHKwEwYGpN9KGMipKE
 jLCg==
X-Gm-Message-State: AO0yUKUjhGTxeg8ntwbA2GA8YnTyMiH+zXgvLSbEIiE528UC3as51aqp
 InbJ16NSRqL/rBZ8OoIo1Gw6YllEaLVx6AMnaQ8=
X-Google-Smtp-Source: AK7set8waP010j+FmSTOcz5vRnyljIKP6pyZxBu4MjL+krvn+gH1zWvcXMU+BBkjK31Gsz9Qx6FAoA==
X-Received: by 2002:a05:6a21:3396:b0:cd:1808:87bb with SMTP id
 yy22-20020a056a21339600b000cd180887bbmr4899219pzb.7.1677476278683; 
 Sun, 26 Feb 2023 21:37:58 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 19/31] target/arm: Drop copies in gen_sve_{ldr,str}
Date: Sun, 26 Feb 2023 19:36:49 -1000
Message-Id: <20230227053701.368744-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:38:19 -0000

Since we now get TEMP_TB temporaries by default, we no longer
need to make copies across these loops.  These were the only
uses of new_tmp_a64_local(), so remove that as well.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  1 -
 target/arm/translate-a64.c |  6 ------
 target/arm/translate-sve.c | 32 --------------------------------
 3 files changed, 39 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index ad3762d1ac..ca24c39dbe 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -19,7 +19,6 @@
 #define TARGET_ARM_TRANSLATE_A64_H
 
 TCGv_i64 new_tmp_a64(DisasContext *s);
-TCGv_i64 new_tmp_a64_local(DisasContext *s);
 TCGv_i64 new_tmp_a64_zero(DisasContext *s);
 TCGv_i64 cpu_reg(DisasContext *s, int reg);
 TCGv_i64 cpu_reg_sp(DisasContext *s, int reg);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 67e9c4ee79..9da5010fe1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -436,12 +436,6 @@ TCGv_i64 new_tmp_a64(DisasContext *s)
     return s->tmp_a64[s->tmp_a64_count++] = tcg_temp_new_i64();
 }
 
-TCGv_i64 new_tmp_a64_local(DisasContext *s)
-{
-    assert(s->tmp_a64_count < TMP_A64_MAX);
-    return s->tmp_a64[s->tmp_a64_count++] = tcg_temp_local_new_i64();
-}
-
 TCGv_i64 new_tmp_a64_zero(DisasContext *s)
 {
     TCGv_i64 t = new_tmp_a64(s);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 621a2abb22..02150d93e8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4344,17 +4344,6 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_const_local_ptr(0);
 
-        /* Copy the clean address into a local temp, live across the loop. */
-        t0 = clean_addr;
-        clean_addr = new_tmp_a64_local(s);
-        tcg_gen_mov_i64(clean_addr, t0);
-
-        if (base != cpu_env) {
-            TCGv_ptr b = tcg_temp_local_new_ptr();
-            tcg_gen_mov_ptr(b, base);
-            base = b;
-        }
-
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4370,11 +4359,6 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
-
-        if (base != cpu_env) {
-            tcg_temp_free_ptr(base);
-            assert(len_remain == 0);
-        }
     }
 
     /*
@@ -4445,17 +4429,6 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_const_local_ptr(0);
 
-        /* Copy the clean address into a local temp, live across the loop. */
-        t0 = clean_addr;
-        clean_addr = new_tmp_a64_local(s);
-        tcg_gen_mov_i64(clean_addr, t0);
-
-        if (base != cpu_env) {
-            TCGv_ptr b = tcg_temp_local_new_ptr();
-            tcg_gen_mov_ptr(b, base);
-            base = b;
-        }
-
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4471,11 +4444,6 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
-
-        if (base != cpu_env) {
-            tcg_temp_free_ptr(base);
-            assert(len_remain == 0);
-        }
     }
 
     /* Predicate register stores can be any multiple of 2.  */
-- 
2.34.1


