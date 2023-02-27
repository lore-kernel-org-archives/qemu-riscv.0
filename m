Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1l-0007ma-K1
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1e-0007Rw-C8
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:17 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1c-0007dS-Jm
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:14 -0500
Received: by mail-pl1-x636.google.com with SMTP id y11so1382112plg.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUdQc0vOWU2ksX0RP7JNSAL2uqNTzPqxOne2f4ZPS34=;
 b=DABoIIBjeLCSWX9fNpvYc9qNBud2YuoAWQDZDiWduAFTnM/ZVQHWEKyMAsdYHPgOZm
 WYH9VVE86nARsQz3jmcu18/G8RmwKHt1WNK5/GVFzYNK7i6Z+OpJw6EsYY751SinJwwZ
 odhhfmdWzM+dm7Om0LgErwBIEbfU1fa/NEyUx1M442sA8ybg59wO2TFqhX/UA9Y4U38a
 3VZErgUKnNMjJl8G7Cm6dHvrSE2zu1I8zavR5MV3jiKW2/AI31JEVRc3UjzjOTjLbFIx
 Zxpmz/JZf5/FUGT49WTsRKK0gjGSYcc4VZUpAkhD1QFyc5WM6Bi58Q+JvSj8s8o6hZwT
 BODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUdQc0vOWU2ksX0RP7JNSAL2uqNTzPqxOne2f4ZPS34=;
 b=sbvO2/3wNyMwJDoovMx7fQKkmgLzF0ujI2glHMKN3LrEMbUtfJHYUDJ+qxtf83NCnr
 eL4MqIrvCq/oiHii+nHV0PwvU3G+WWF9zEO/bPHtgzW9zYIEO3s1JoUKPPeQFDA8Bghf
 4s4O3/Ty52UuHD/1IhBN5JnpJ57dPVoK8iAAYo4g4dQI/AYPjCXx62bgpH/CNJjvUtaJ
 0eC8GUxhweYYsBO4OXdZkxQvIJGT3BNrdu0QLqCGqhrR+lu/E3aMZ9lKbI9eayYgBkx/
 RYiajVn5mPyTyNP/6NQfN5EfbeJsyrRt7jNe3mu5rT5ZbMXzjPLMAdKl2CqQbL1WLTwW
 pfhw==
X-Gm-Message-State: AO0yUKXwJhd4aMc46ZooIrnT/nyR5x8B1PW9o6EUVUIlSri9OYRlPjGH
 CzXQkeXBx8KmM0O2W3cQRP/t/Q==
X-Google-Smtp-Source: AK7set9dRRiuDvKK4eWySxtMxmoRw/RRzPlMLAB3jiLJiW+qG+T3MNFS5JqeAtCpVAX9ZVNRUKaOzQ==
X-Received: by 2002:a17:903:74d:b0:19c:d550:8cd4 with SMTP id
 kl13-20020a170903074d00b0019cd5508cd4mr8911733plb.7.1677475570866; 
 Sun, 26 Feb 2023 21:26:10 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 22/76] target/cris: Drop cris_alu_m_free_temps
Date: Sun, 26 Feb 2023 19:24:11 -1000
Message-Id: <20230227052505.352889-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:26:18 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         | 23 -----------------------
 target/cris/translate_v10.c.inc |  4 ----
 2 files changed, 27 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 76db745fe2..439af701e6 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -2101,12 +2101,6 @@ static inline void cris_alu_m_alloc_temps(TCGv *t)
     t[1] = tcg_temp_new();
 }
 
-static inline void cris_alu_m_free_temps(TCGv *t)
-{
-    tcg_temp_free(t[0]);
-    tcg_temp_free(t[1]);
-}
-
 static int dec_movs_m(CPUCRISState *env, DisasContext *dc)
 {
     TCGv t[2];
@@ -2124,7 +2118,6 @@ static int dec_movs_m(CPUCRISState *env, DisasContext *dc)
     cris_alu(dc, CC_OP_MOVE,
             cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2145,7 +2138,6 @@ static int dec_addu_m(CPUCRISState *env, DisasContext *dc)
     cris_alu(dc, CC_OP_ADD,
             cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2165,7 +2157,6 @@ static int dec_adds_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_ADD, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2185,7 +2176,6 @@ static int dec_subu_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_SUB, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2205,7 +2195,6 @@ static int dec_subs_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_SUB, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2225,7 +2214,6 @@ static int dec_movu_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZ);
     cris_alu(dc, CC_OP_MOVE, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2244,7 +2232,6 @@ static int dec_cmpu_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_CMP, cpu_R[dc->op2], cpu_R[dc->op2], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2265,7 +2252,6 @@ static int dec_cmps_m(CPUCRISState *env, DisasContext *dc)
             cpu_R[dc->op2], cpu_R[dc->op2], t[1],
             memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2286,7 +2272,6 @@ static int dec_cmp_m(CPUCRISState *env, DisasContext *dc)
             cpu_R[dc->op2], cpu_R[dc->op2], t[1],
             memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2312,7 +2297,6 @@ static int dec_test_m(CPUCRISState *env, DisasContext *dc)
          cpu_R[dc->op2], t[1], c, memsize_zz(dc));
     tcg_temp_free(c);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2331,7 +2315,6 @@ static int dec_and_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZ);
     cris_alu(dc, CC_OP_AND, cpu_R[dc->op2], t[0], t[1], memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2351,7 +2334,6 @@ static int dec_add_m(CPUCRISState *env, DisasContext *dc)
     cris_alu(dc, CC_OP_ADD,
          cpu_R[dc->op2], t[0], t[1], memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2370,7 +2352,6 @@ static int dec_addo_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, 0);
     cris_alu(dc, CC_OP_ADD, cpu_R[R_ACR], t[0], t[1], 4);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2413,7 +2394,6 @@ static int dec_addc_mr(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_ADDC, cpu_R[dc->op2], t[0], t[1], 4);
     do_postinc(dc, 4);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2432,7 +2412,6 @@ static int dec_sub_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZVC);
     cris_alu(dc, CC_OP_SUB, cpu_R[dc->op2], t[0], t[1], memsize);
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2452,7 +2431,6 @@ static int dec_or_m(CPUCRISState *env, DisasContext *dc)
     cris_alu(dc, CC_OP_OR,
             cpu_R[dc->op2], t[0], t[1], memsize_zz(dc));
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
@@ -2484,7 +2462,6 @@ static int dec_move_mp(CPUCRISState *env, DisasContext *dc)
     t_gen_mov_preg_TN(dc, dc->op2, t[1]);
 
     do_postinc(dc, memsize);
-    cris_alu_m_free_temps(t);
     return insn_len;
 }
 
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index 9660f28584..5e9d1c0fe8 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -922,9 +922,6 @@ static int dec10_ind_alu(CPUCRISState *env, DisasContext *dc,
         dc->delayed_branch = 1;
         return insn_len;
     }
-
-    cris_alu_m_free_temps(t);
-
     return insn_len;
 }
 
@@ -1058,7 +1055,6 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
                 cris_alu(dc, CC_OP_CMP, cpu_R[dc->dst],
                          t[0], c, size);
                 tcg_temp_free(c);
-                cris_alu_m_free_temps(t);
                 break;
             case CRISV10_IND_ADD:
                 LOG_DIS("add size=%d op=%d %d\n",  size, dc->src, dc->dst);
-- 
2.34.1


