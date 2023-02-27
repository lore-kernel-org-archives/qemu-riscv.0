Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1H-00072P-EL
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1F-0006yl-8r
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:49 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW18-0007PI-B8
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:48 -0500
Received: by mail-pj1-x1043.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso8833076pjb.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N6B+a0N7tu/9UM+UAFolg4I0Ga2IK7hy9mNAOGH/dPg=;
 b=gJdK7aZt1u6+wWiGl1LYeNpXxYb3+8ND4VW+6DB/lxPFH0LVS6lgzwz+RFBEiHXDUl
 Wx2ksEBy+GIjAR169yqfWsXAjZYVB61RHCH7cLovDFZB1rJDBdyJ0o5FfnzEBFS04Rmf
 lFGGSpMDTEG+EE4r0UNGtEPiKMKRgDPWInM6ydpKkxodp8A5JCxMtD63h1JsW/q+t64K
 jES4lFteJg0Bfg4wg8/8GyrGSQLbNpP0lMZGLod1oj7nsCVVUjf8Ite/a4ZoIMZX1w11
 dYGqwUgs/3b5ztfOruJmJ/gXoIaYK8xTqnjSlkgA29mdz+gULKHNYb43CBlMLSO7oqPE
 HbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6B+a0N7tu/9UM+UAFolg4I0Ga2IK7hy9mNAOGH/dPg=;
 b=KNX0f+MKywXCzk3bEpoF4IZIlniVWkuAvkHEJ8ix2kJkcR7Q2jIV9oSnl4FN21ITd5
 zvYNdIkc3Cb+i3RGuG8dBY8nZ4DyrGdhSq+cNOnnqNGbYVQMgZzTlWNpVasV2ZTNW51n
 tyjkQoCwuo1BEF+Ovh9mrcngfkgE+LPXrWAdnVsECa3+96GEYviMaGpDHmuP69AQk4iC
 DHTdZmie8ZAKUcMRkwsopsD3vvXXKOi4Bm6BVadzwGeqUR39dNRTgMZyK8ravt4AxHek
 MVPStbQSmip8d7HGxk+9GJf+89apojAMbgm/8npgLZc6aFwKiOgeApT8UeyxIEoFw5SY
 EYag==
X-Gm-Message-State: AO0yUKUwtjQc4g00Ilw12wWSPItNmOCTkWPTKms86K9pWLgbIvXBBvKj
 rwVOX/JpCmNM0Px/bgHkTULJ1g==
X-Google-Smtp-Source: AK7set8Sw6LABw9Um0lgl6lAMOhowI/V18JbvsWtqZmUH5YmEIdK18hPklc2kIMXOHerBA5iAHTTZQ==
X-Received: by 2002:a17:902:fb90:b0:19c:d97f:5d20 with SMTP id
 lg16-20020a170902fb9000b0019cd97f5d20mr8882982plb.38.1677475540543; 
 Sun, 26 Feb 2023 21:25:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:25:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 11/76] target/arm: Drop tcg_temp_free from
 translator-m-nocp.c
Date: Sun, 26 Feb 2023 19:24:00 -1000
Message-Id: <20230227052505.352889-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:25:49 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-m-nocp.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 5df7d46120..9a89aab785 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -91,7 +91,6 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
     } else {
         gen_helper_v7m_vlstm(cpu_env, fptr);
     }
-    tcg_temp_free_i32(fptr);
 
     clear_eci_state(s);
 
@@ -303,8 +302,6 @@ static void gen_branch_fpInactive(DisasContext *s, TCGCond cond,
     tcg_gen_andi_i32(fpca, fpca, R_V7M_CONTROL_FPCA_MASK);
     tcg_gen_or_i32(fpca, fpca, aspen);
     tcg_gen_brcondi_i32(tcg_invert_cond(cond), fpca, 0, label);
-    tcg_temp_free_i32(aspen);
-    tcg_temp_free_i32(fpca);
 }
 
 static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
@@ -328,7 +325,6 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
     case ARM_VFP_FPSCR:
         tmp = loadfn(s, opaque, true);
         gen_helper_vfp_set_fpscr(cpu_env, tmp);
-        tcg_temp_free_i32(tmp);
         gen_lookup_tb(s);
         break;
     case ARM_VFP_FPSCR_NZCVQC:
@@ -351,7 +347,6 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_gen_andi_i32(fpscr, fpscr, ~FPCR_NZCV_MASK);
         tcg_gen_or_i32(fpscr, fpscr, tmp);
         store_cpu_field(fpscr, vfp.xregs[ARM_VFP_FPSCR]);
-        tcg_temp_free_i32(tmp);
         break;
     }
     case ARM_VFP_FPCXT_NS:
@@ -400,8 +395,6 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
         gen_helper_vfp_set_fpscr(cpu_env, tmp);
         s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
-        tcg_temp_free_i32(tmp);
-        tcg_temp_free_i32(sfpa);
         break;
     }
     case ARM_VFP_VPR:
@@ -423,7 +416,6 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
                             R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
         store_cpu_field(vpr, v7m.vpr);
         s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
-        tcg_temp_free_i32(tmp);
         break;
     }
     default:
@@ -491,7 +483,6 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
         tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
         tcg_gen_or_i32(tmp, tmp, sfpa);
-        tcg_temp_free_i32(sfpa);
         /*
          * Store result before updating FPSCR etc, in case
          * it is a memory write which causes an exception.
@@ -505,7 +496,6 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         store_cpu_field(control, v7m.control[M_REG_S]);
         fpscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-        tcg_temp_free_i32(fpscr);
         lookup_tb = true;
         break;
     }
@@ -546,7 +536,6 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
         tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
         tcg_gen_or_i32(tmp, tmp, sfpa);
-        tcg_temp_free_i32(control);
         /* Store result before updating FPSCR, in case it faults */
         storefn(s, opaque, tmp, true);
         /* If SFPA is zero then set FPSCR from FPDSCR_NS */
@@ -554,9 +543,6 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_movcond_i32(TCG_COND_EQ, fpscr, sfpa, tcg_constant_i32(0),
                             fpdscr, fpscr);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-        tcg_temp_free_i32(sfpa);
-        tcg_temp_free_i32(fpdscr);
-        tcg_temp_free_i32(fpscr);
         break;
     }
     case ARM_VFP_VPR:
@@ -598,7 +584,6 @@ static void fp_sysreg_to_gpr(DisasContext *s, void *opaque, TCGv_i32 value,
     if (a->rt == 15) {
         /* Set the 4 flag bits in the CPSR */
         gen_set_nzcv(value);
-        tcg_temp_free_i32(value);
     } else {
         store_reg(s, a->rt, value);
     }
@@ -666,7 +651,6 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value,
     if (do_access) {
         gen_aa32_st_i32(s, value, addr, get_mem_index(s),
                         MO_UL | MO_ALIGN | s->be_data);
-        tcg_temp_free_i32(value);
     }
 
     if (a->w) {
@@ -675,8 +659,6 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value,
             tcg_gen_addi_i32(addr, addr, offset);
         }
         store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
     }
 }
 
@@ -717,8 +699,6 @@ static TCGv_i32 memory_to_fp_sysreg(DisasContext *s, void *opaque,
             tcg_gen_addi_i32(addr, addr, offset);
         }
         store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
     }
     return value;
 }
-- 
2.34.1


