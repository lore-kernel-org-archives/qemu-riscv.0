Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqe7-00053Q-S3
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:15:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqe5-0004zJ-SW
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:09 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqe1-0001Xi-QJ
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:09 -0500
Received: by mail-pl1-x632.google.com with SMTP id ky4so1898648plb.3
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=63vP/1m7se/PbTGCfuF9d+mJQxl3ohStWxPPN9QP+1Q=;
 b=zP4WUYUAsPeJ4L6C4lIiE+7x4PGZjuKxYuouKldp0u2SIyatAWQAsIj8ZjfbWGUItO
 k7VtxM2i4bOV+PW49HjUoQJKXEEUxe4Khm0R1r0+lG1hXQJlEQW2hA6No6rzRrwyh2Hg
 ZtB6q+yfAW0s/Mic9uDAQSepYBxFVgrGcEQ5g4J+KImZzJhvzhX6eIyGIg41gnvCLzB7
 fzqRhxhMy5dIB+aJBE5vUiG079JE1I18Bsk9BB00bfk0rbSlXTvyYonF+bLiphLcQ61h
 Z3PkB8xtYFJW7BTn0yucp3M9pZ7FOjtK5UlYuiD6g94sMQ8lD+wyuvFWbejVK/dhlKLN
 9kWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=63vP/1m7se/PbTGCfuF9d+mJQxl3ohStWxPPN9QP+1Q=;
 b=6etddq1etEq/9LmuSZk77Bc45eu74cPsi3rvm2D2zn/hCfgdhzjvu+HH1F++i9g/m7
 LujXNQLro3g88yMdFWlFsOihmwjRMf3htqGeT5c8Cq6n1BdFRjicrn81vdw1RXCHEmcy
 hc5+Fbr6UZJFT+2Uk53KJ7DF/QGkpPgvA13lD67cF8bGdN6ijT3rgyF7Sq5aD1UAuuZm
 aCR7/iSV1f8lqx6CMbPRSTcAGGV8UkA+ltxu6RfNorR3DZX+12uC20s5y5540CbhOecg
 6hy3AluJgaTpl+iRvW9kGb9gdNfLNxnOZ+SuNMdhEpP1V5MTMIjLjhcWgLBo/rIKOyui
 H8gQ==
X-Gm-Message-State: AO0yUKXq+nNUQkZJm13tNwhemDv7AdVDksP+OmXS2Y9MLlAJ2NNciU8F
 wciXI0R2oMTOrRsIZ5tAsR2kOw==
X-Google-Smtp-Source: AK7set8TEsw8cnVucvmC+hbcyvMJHeiQmPaWAsuwafsrepAXcKJ6377LDrvpLkTlxQOl7nLXI9W+5A==
X-Received: by 2002:a17:902:d488:b0:196:5f75:66f9 with SMTP id
 c8-20020a170902d48800b001965f7566f9mr23108994plg.63.1677316503823; 
 Sat, 25 Feb 2023 01:15:03 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 12/76] target/arm: Drop tcg_temp_free from translator-mve.c
Date: Fri, 24 Feb 2023 23:13:23 -1000
Message-Id: <20230225091427.1817156-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:15:10 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-mve.c | 52 --------------------------------------
 1 file changed, 52 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index db7ea3f603..798b4fddfe 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -178,7 +178,6 @@ static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn,
 
     qreg = mve_qreg_ptr(a->qd);
     fn(cpu_env, qreg, addr);
-    tcg_temp_free_ptr(qreg);
 
     /*
      * Writeback always happens after the last beat of the insn,
@@ -189,8 +188,6 @@ static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn,
             tcg_gen_addi_i32(addr, addr, offset);
         }
         store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
     }
     mve_update_eci(s);
     return true;
@@ -242,9 +239,6 @@ static bool do_ldst_sg(DisasContext *s, arg_vldst_sg *a, MVEGenLdStSGFn fn)
     qd = mve_qreg_ptr(a->qd);
     qm = mve_qreg_ptr(a->qm);
     fn(cpu_env, qd, qm, addr);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qm);
-    tcg_temp_free_i32(addr);
     mve_update_eci(s);
     return true;
 }
@@ -341,8 +335,6 @@ static bool do_ldst_sg_imm(DisasContext *s, arg_vldst_sg_imm *a,
     qd = mve_qreg_ptr(a->qd);
     qm = mve_qreg_ptr(a->qm);
     fn(cpu_env, qd, qm, tcg_constant_i32(offset));
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qm);
     mve_update_eci(s);
     return true;
 }
@@ -414,8 +406,6 @@ static bool do_vldst_il(DisasContext *s, arg_vldst_il *a, MVEGenLdStIlFn *fn,
     if (a->w) {
         tcg_gen_addi_i32(rn, rn, addrinc);
         store_reg(s, a->rn, rn);
-    } else {
-        tcg_temp_free_i32(rn);
     }
     mve_update_and_store_eci(s);
     return true;
@@ -506,9 +496,7 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
         qd = mve_qreg_ptr(a->qd);
         tcg_gen_dup_i32(a->size, rt, rt);
         gen_helper_mve_vdup(cpu_env, qd, rt);
-        tcg_temp_free_ptr(qd);
     }
-    tcg_temp_free_i32(rt);
     mve_update_eci(s);
     return true;
 }
@@ -534,8 +522,6 @@ static bool do_1op_vec(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn,
         qd = mve_qreg_ptr(a->qd);
         qm = mve_qreg_ptr(a->qm);
         fn(cpu_env, qd, qm);
-        tcg_temp_free_ptr(qd);
-        tcg_temp_free_ptr(qm);
     }
     mve_update_eci(s);
     return true;
@@ -631,8 +617,6 @@ static bool do_vcvt_rmode(DisasContext *s, arg_1op *a,
     qd = mve_qreg_ptr(a->qd);
     qm = mve_qreg_ptr(a->qm);
     fn(cpu_env, qd, qm, tcg_constant_i32(arm_rmode_to_sf(rmode)));
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qm);
     mve_update_eci(s);
     return true;
 }
@@ -821,9 +805,6 @@ static bool do_2op_vec(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn,
         qn = mve_qreg_ptr(a->qn);
         qm = mve_qreg_ptr(a->qm);
         fn(cpu_env, qd, qn, qm);
-        tcg_temp_free_ptr(qd);
-        tcg_temp_free_ptr(qn);
-        tcg_temp_free_ptr(qm);
     }
     mve_update_eci(s);
     return true;
@@ -1076,9 +1057,6 @@ static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
     qn = mve_qreg_ptr(a->qn);
     rm = load_reg(s, a->rm);
     fn(cpu_env, qd, qn, rm);
-    tcg_temp_free_i32(rm);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qn);
     mve_update_eci(s);
     return true;
 }
@@ -1204,15 +1182,11 @@ static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
         rdalo = load_reg(s, a->rdalo);
         rdahi = load_reg(s, a->rdahi);
         tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
-        tcg_temp_free_i32(rdalo);
-        tcg_temp_free_i32(rdahi);
     } else {
         rda = tcg_const_i64(0);
     }
 
     fn(rda, cpu_env, qn, qm, rda);
-    tcg_temp_free_ptr(qn);
-    tcg_temp_free_ptr(qm);
 
     rdalo = tcg_temp_new_i32();
     rdahi = tcg_temp_new_i32();
@@ -1220,7 +1194,6 @@ static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
     tcg_gen_extrh_i64_i32(rdahi, rda);
     store_reg(s, a->rdalo, rdalo);
     store_reg(s, a->rdahi, rdahi);
-    tcg_temp_free_i64(rda);
     mve_update_eci(s);
     return true;
 }
@@ -1312,8 +1285,6 @@ static bool do_dual_acc(DisasContext *s, arg_vmladav *a, MVEGenDualAccOpFn *fn)
 
     fn(rda, cpu_env, qn, qm, rda);
     store_reg(s, a->rda, rda);
-    tcg_temp_free_ptr(qn);
-    tcg_temp_free_ptr(qm);
 
     mve_update_eci(s);
     return true;
@@ -1451,7 +1422,6 @@ static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
     qm = mve_qreg_ptr(a->qm);
     fns[a->size][a->u](rda, cpu_env, qm, rda);
     store_reg(s, a->rda, rda);
-    tcg_temp_free_ptr(qm);
 
     mve_update_eci(s);
     return true;
@@ -1494,8 +1464,6 @@ static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
         rdalo = load_reg(s, a->rdalo);
         rdahi = load_reg(s, a->rdahi);
         tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
-        tcg_temp_free_i32(rdalo);
-        tcg_temp_free_i32(rdahi);
     } else {
         /* Accumulate starting at zero */
         rda = tcg_const_i64(0);
@@ -1507,7 +1475,6 @@ static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
     } else {
         gen_helper_mve_vaddlv_s(rda, cpu_env, qm, rda);
     }
-    tcg_temp_free_ptr(qm);
 
     rdalo = tcg_temp_new_i32();
     rdahi = tcg_temp_new_i32();
@@ -1515,7 +1482,6 @@ static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
     tcg_gen_extrh_i64_i32(rdahi, rda);
     store_reg(s, a->rdalo, rdalo);
     store_reg(s, a->rdahi, rdahi);
-    tcg_temp_free_i64(rda);
     mve_update_eci(s);
     return true;
 }
@@ -1543,7 +1509,6 @@ static bool do_1imm(DisasContext *s, arg_1imm *a, MVEGenOneOpImmFn *fn,
     } else {
         qd = mve_qreg_ptr(a->qd);
         fn(cpu_env, qd, tcg_constant_i64(imm));
-        tcg_temp_free_ptr(qd);
     }
     mve_update_eci(s);
     return true;
@@ -1616,8 +1581,6 @@ static bool do_2shift_vec(DisasContext *s, arg_2shift *a, MVEGenTwoOpShiftFn fn,
         qd = mve_qreg_ptr(a->qd);
         qm = mve_qreg_ptr(a->qm);
         fn(cpu_env, qd, qm, tcg_constant_i32(shift));
-        tcg_temp_free_ptr(qd);
-        tcg_temp_free_ptr(qm);
     }
     mve_update_eci(s);
     return true;
@@ -1723,8 +1686,6 @@ static bool do_2shift_scalar(DisasContext *s, arg_shl_scalar *a,
     qda = mve_qreg_ptr(a->qda);
     rm = load_reg(s, a->rm);
     fn(cpu_env, qda, qda, rm);
-    tcg_temp_free_ptr(qda);
-    tcg_temp_free_i32(rm);
     mve_update_eci(s);
     return true;
 }
@@ -1868,7 +1829,6 @@ static bool trans_VSHLC(DisasContext *s, arg_VSHLC *a)
     rdm = load_reg(s, a->rdm);
     gen_helper_mve_vshlc(rdm, cpu_env, qd, rdm, tcg_constant_i32(a->imm));
     store_reg(s, a->rdm, rdm);
-    tcg_temp_free_ptr(qd);
     mve_update_eci(s);
     return true;
 }
@@ -1898,7 +1858,6 @@ static bool do_vidup(DisasContext *s, arg_vidup *a, MVEGenVIDUPFn *fn)
     rn = load_reg(s, a->rn);
     fn(rn, cpu_env, qd, rn, tcg_constant_i32(a->imm));
     store_reg(s, a->rn, rn);
-    tcg_temp_free_ptr(qd);
     mve_update_eci(s);
     return true;
 }
@@ -1934,8 +1893,6 @@ static bool do_viwdup(DisasContext *s, arg_viwdup *a, MVEGenVIWDUPFn *fn)
     rm = load_reg(s, a->rm);
     fn(rn, cpu_env, qd, rn, rm, tcg_constant_i32(a->imm));
     store_reg(s, a->rn, rn);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_i32(rm);
     mve_update_eci(s);
     return true;
 }
@@ -2001,8 +1958,6 @@ static bool do_vcmp(DisasContext *s, arg_vcmp *a, MVEGenCmpFn *fn)
     qn = mve_qreg_ptr(a->qn);
     qm = mve_qreg_ptr(a->qm);
     fn(cpu_env, qn, qm);
-    tcg_temp_free_ptr(qn);
-    tcg_temp_free_ptr(qm);
     if (a->mask) {
         /* VPT */
         gen_vpst(s, a->mask);
@@ -2034,8 +1989,6 @@ static bool do_vcmp_scalar(DisasContext *s, arg_vcmp_scalar *a,
         rm = load_reg(s, a->rm);
     }
     fn(cpu_env, qn, rm);
-    tcg_temp_free_ptr(qn);
-    tcg_temp_free_i32(rm);
     if (a->mask) {
         /* VPT */
         gen_vpst(s, a->mask);
@@ -2138,7 +2091,6 @@ static bool do_vmaxv(DisasContext *s, arg_vmaxv *a, MVEGenVADDVFn fn)
     rda = load_reg(s, a->rda);
     fn(rda, cpu_env, qm, rda);
     store_reg(s, a->rda, rda);
-    tcg_temp_free_ptr(qm);
     mve_update_eci(s);
     return true;
 }
@@ -2203,8 +2155,6 @@ static bool do_vabav(DisasContext *s, arg_vabav *a, MVEGenVABAVFn *fn)
     rda = load_reg(s, a->rda);
     fn(rda, cpu_env, qn, qm, rda);
     store_reg(s, a->rda, rda);
-    tcg_temp_free_ptr(qm);
-    tcg_temp_free_ptr(qn);
     mve_update_eci(s);
     return true;
 }
@@ -2297,12 +2247,10 @@ static bool trans_VMOV_from_2gp(DisasContext *s, arg_VMOV_to_2gp *a)
     if (!mve_skip_vmov(s, vd, a->idx, MO_32)) {
         tmp = load_reg(s, a->rt);
         write_neon_element32(tmp, vd, a->idx, MO_32);
-        tcg_temp_free_i32(tmp);
     }
     if (!mve_skip_vmov(s, vd + 1, a->idx, MO_32)) {
         tmp = load_reg(s, a->rt2);
         write_neon_element32(tmp, vd + 1, a->idx, MO_32);
-        tcg_temp_free_i32(tmp);
     }
 
     mve_update_and_store_eci(s);
-- 
2.34.1


