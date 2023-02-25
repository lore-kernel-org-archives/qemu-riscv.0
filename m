Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqeU-0005fD-F4
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeT-0005e2-72
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:33 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeQ-0001hG-TM
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:32 -0500
Received: by mail-pl1-x62c.google.com with SMTP id i10so1863357plr.9
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUdQc0vOWU2ksX0RP7JNSAL2uqNTzPqxOne2f4ZPS34=;
 b=iM21ey5e35bnP54CgvxDUU/+HS9+s+u+qNFmJ9XJuZcqr2hC8Uh0RISkxa17LwDLTw
 rGwP3Vaq55GBw3djyRzvS3zojtV/RsIVwK8/cyGlu2N9v5NBCSuw6kXXNvDb8scHwttD
 UdWHh3V7VeAdkTz7nEbIpBVzy7WAeWsEGUXEAmxLl/sZ4SE22x6cxQ1MNFmI/92hS6iY
 BXHKgAtZI8YQkYb7/0p5TRi1BMlluR5gwTvLT9hnVdX0P5dpd6JhgrEfHyb0TVb4LHBV
 wnKChlF+epY15mmXiCzvW9b+OGqopSm9bc5PmUwNhujpYmoqTsSPIs+J8KncphQrYGMW
 JyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUdQc0vOWU2ksX0RP7JNSAL2uqNTzPqxOne2f4ZPS34=;
 b=WXjjawY1YO6I0fTBtt/s00ys5XT4aUB6NadDssfE63breOE/raLAViM5ox7eOZ3a3G
 2H6XmaglJOv1LWApEVxMnALc69n6Ivk9FI3PkwYqqNC8OwFOQ/F41V7SGqOU0nu6hq1L
 95laWPJ9Dx4V6zhnXADW0CBnQt1fFXHSky27EBTdjGgY+2cv45O2qrsAYa690LErgXhs
 BiVbbk/iAaM3H/6piWi/SS1DPT7lFUaPGnVnulFwEQkw4e2KtQaES75pQb6Z1L7mOuCG
 6HEYETGMDcdVLhrcbsOzCC0Fsxm/1pcikY1i/oxF7HyRjF4yDKi82bHL8jpRbzCWur6b
 M92A==
X-Gm-Message-State: AO0yUKVxK2C5B2GkUFfKFK697ok1PmmFxcpQfLiFo49Cj+l6PV8JEFHw
 Ja+Qv6MUz6zCCaHy4G8bAU7HVw==
X-Google-Smtp-Source: AK7set9F848qycQYYX3nq1JoAOtKRRaZ2E/MIe8mgmeXxyuyKaJE74fAZHr5apdX0AfaV1XR+x+rwg==
X-Received: by 2002:a17:902:ec8f:b0:19c:171a:d346 with SMTP id
 x15-20020a170902ec8f00b0019c171ad346mr21195764plg.44.1677316529983; 
 Sat, 25 Feb 2023 01:15:29 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 22/76] target/cris: Drop cris_alu_m_free_temps
Date: Fri, 24 Feb 2023 23:13:33 -1000
Message-Id: <20230225091427.1817156-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:15:33 -0000

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


