Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqe2-0004vD-Q4
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqe1-0004te-KC
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:05 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdy-0001Wq-Lk
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:05 -0500
Received: by mail-pj1-x1043.google.com with SMTP id c23so1408370pjo.4
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N6B+a0N7tu/9UM+UAFolg4I0Ga2IK7hy9mNAOGH/dPg=;
 b=JdlgqmgncbGxTjAuCB0/873O2vU9vmLANYXIv3k8ur613utSc3rjohTKRX+Y6VC559
 DB59RO2ijObnUCe/50HID/xjosGZUyZgBl+ekudR4M2KZlIKh0QM+qPcny4C3gHZIQcI
 aS644G+5LpPepYRV2YtZDOupeh9LbzkNVxtb8GcyfZ1POHipzSKAcZXbmloz1RPVrfH4
 DDxt9DghD4PftKmUKbMnvN4lOTKnSFColkHY6fzLxAXQlVOI1S+01Z24iGCQRMxzZNIZ
 EIM5vbVqbfyW+MWAP/PrTAZTPHpXYo7vygkTSoPZ1zJxuCbBAwCXsrhVX1V5sT90HWEA
 E/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6B+a0N7tu/9UM+UAFolg4I0Ga2IK7hy9mNAOGH/dPg=;
 b=M6pycKGtxVupnHYjk/0Oe1HSXQtnNuuMt/sB2SpflvyA+Z8q+EOyVVxFhSg3ivlSC4
 mhW4E8u6NaWDHiBj5LiKpnM2reO0n1iPfR1QYDrXGJQjVLm39Kua//g2o7M8r56YFftV
 Jb//22nx3u+MAiRVH01NMND/PpsEDvO5YND8MpruVqaOROS503WdABmyVbT9NTLlf3kS
 kGFmF7hmZX9OQ/lsCB2fQWexKFn05Gw4a1BTFLxsxWCfYv00YKnJVvHQ4G1RzpvrD5GN
 nWzlLXJd8Hd51AoTOimq5I8A8MsIzrhdBsCzQrBnDxrCC7fP0GO45Btm47yYXuWSREej
 JGKA==
X-Gm-Message-State: AO0yUKXeK/nJ2rJ8Xac0hM8smLUptmVpIwabNeNyu/6w1dPEiP+c9jBz
 s1q4iqkd6g95k9/6tpHoVeeqiA==
X-Google-Smtp-Source: AK7set+ETG06BW1NjuuehZv7bhhcf7doSUAEHqY0gw95KL8aOSYxSUq1wCyn7R4X1vW7BpRIgIm/xw==
X-Received: by 2002:a17:902:e5d0:b0:19a:80e6:2a21 with SMTP id
 u16-20020a170902e5d000b0019a80e62a21mr25497874plf.33.1677316501185; 
 Sat, 25 Feb 2023 01:15:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 11/76] target/arm: Drop tcg_temp_free from translator-m-nocp.c
Date: Fri, 24 Feb 2023 23:13:22 -1000
Message-Id: <20230225091427.1817156-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Sat, 25 Feb 2023 09:15:05 -0000

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


