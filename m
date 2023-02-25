Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqfz-000146-Sy
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqf4-0007HL-AX
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:16:10 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqex-00024C-V9
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:16:09 -0500
Received: by mail-pl1-x635.google.com with SMTP id i3so1881640plg.6
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v8FvDq5cUYW7XqWD0shpF1rWNn8tp72Vhml1RK/Q060=;
 b=muFLembfqIxS6r0TKkGiwPXpYQyhHFU4C7X4JsKjGerbWwGDTffugkJ1tRHafx0bbz
 qQ4F/hfqNjI39u7SOOvpMbUDU8da02BSCpoBhSahPVbdpsdSjkUZhxC9d/MWAe9XrxqB
 qLaBoEwzi5BlI3XvqRujCjRDfXNWcBXaGfXIj3jWjq/IrHZnz0Z1WO0IldATnNKXR3wB
 y/Nx0CGu52QKsWhoOiFX+ra/NSzDNxXPHeOh2DjUi7L6qY65p/doZ45Ja5SwJI0Aqj7H
 i3/hSJ1A66KRaBrZI1sX5lwJdgvHZVNXv/mnV8/Yx/Zy9qySjwm7CXgLvt23FjAgOE7x
 syrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v8FvDq5cUYW7XqWD0shpF1rWNn8tp72Vhml1RK/Q060=;
 b=ACRSeVf0gJ39MYhPXFAD2tRoORKc9xow9Z37NEWAcOIu/Rn988EAmuNdX36QrvgNlX
 /i54JU83x3uxwy2/ozBRgYUwtBJEK9TFMWrAbGzrt+r1CDg2aFdUdebohRV/A2z5gr5U
 1fuzzNC/NwGuCkxIRd08G9FXel0ZDvA23z73+4a0HGZNA5ag2e77UTcPHS/Wu0i1H7ef
 9GP6yOGm+TKUud206+ucxbbGOJZ6gx6/Fqd2juoR+nqf0+mABTUGIIm17IdFsJRQlziX
 nQc5siBYIdYA5TdZgEY2IuE3raJOVE19hjCL+QMI8iALoeSfgSXvxkAfnn8oPXsGUFnD
 LD2A==
X-Gm-Message-State: AO0yUKXty0GZkpxuKLy22DuSCiHLsxUo5xFMPbEolUNOu9mlkVWp+K9z
 7hCWQLxuKAOZNET3EZ7J4AuAaA==
X-Google-Smtp-Source: AK7set9tsC/oSNoReg7/HQMUtvo+GvDSiIvloNwIMjUWlEUzYdJn6uHlfYBuifZttI8D5AQ2z7rY/A==
X-Received: by 2002:a17:902:7089:b0:19c:99ad:b8db with SMTP id
 z9-20020a170902708900b0019c99adb8dbmr12565626plk.42.1677316562951; 
 Sat, 25 Feb 2023 01:16:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:16:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 35/76] target/m68k: Drop tcg_temp_free
Date: Fri, 24 Feb 2023 23:13:46 -1000
Message-Id: <20230225091427.1817156-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:16:11 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 181 ----------------------------------------
 1 file changed, 181 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index d7237b6a99..3055d2d246 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -138,7 +138,6 @@ static void delay_set_areg(DisasContext *s, unsigned regno,
 {
     if (s->writeback_mask & (1 << regno)) {
         if (give_temp) {
-            tcg_temp_free(s->writeback[regno]);
             s->writeback[regno] = val;
         } else {
             tcg_gen_mov_i32(s->writeback[regno], val);
@@ -163,7 +162,6 @@ static void do_writebacks(DisasContext *s)
         do {
             unsigned regno = ctz32(mask);
             tcg_gen_mov_i32(cpu_aregs[regno], s->writeback[regno]);
-            tcg_temp_free(s->writeback[regno]);
             mask &= mask - 1;
         } while (mask);
     }
@@ -270,7 +268,6 @@ static void gen_raise_exception(int nr)
 
     tmp = tcg_const_i32(nr);
     gen_helper_raise_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
 }
 
 static void gen_raise_exception_format2(DisasContext *s, int nr,
@@ -582,9 +579,7 @@ static void gen_flush_flags(DisasContext *s)
         gen_ext(t0, t0, s->cc_op - CC_OP_ADDB, 1);
         tcg_gen_xor_i32(t1, QREG_CC_N, QREG_CC_V);
         tcg_gen_xor_i32(QREG_CC_V, QREG_CC_V, t0);
-        tcg_temp_free(t0);
         tcg_gen_andc_i32(QREG_CC_V, t1, QREG_CC_V);
-        tcg_temp_free(t1);
         break;
 
     case CC_OP_SUBB:
@@ -599,9 +594,7 @@ static void gen_flush_flags(DisasContext *s)
         gen_ext(t0, t0, s->cc_op - CC_OP_SUBB, 1);
         tcg_gen_xor_i32(t1, QREG_CC_N, t0);
         tcg_gen_xor_i32(QREG_CC_V, QREG_CC_V, t0);
-        tcg_temp_free(t0);
         tcg_gen_and_i32(QREG_CC_V, QREG_CC_V, t1);
-        tcg_temp_free(t1);
         break;
 
     case CC_OP_CMPB:
@@ -615,7 +608,6 @@ static void gen_flush_flags(DisasContext *s)
         tcg_gen_xor_i32(t0, QREG_CC_Z, QREG_CC_N);
         tcg_gen_xor_i32(QREG_CC_V, QREG_CC_V, QREG_CC_N);
         tcg_gen_and_i32(QREG_CC_V, QREG_CC_V, t0);
-        tcg_temp_free(t0);
         tcg_gen_mov_i32(QREG_CC_N, QREG_CC_Z);
         break;
 
@@ -633,7 +625,6 @@ static void gen_flush_flags(DisasContext *s)
     default:
         t0 = tcg_const_i32(s->cc_op);
         gen_helper_flush_flags(cpu_env, t0);
-        tcg_temp_free(t0);
         s->cc_op_synced = 1;
         break;
     }
@@ -729,14 +720,12 @@ static void gen_partset_reg(int opsize, TCGv reg, TCGv val)
         tmp = tcg_temp_new();
         tcg_gen_ext8u_i32(tmp, val);
         tcg_gen_or_i32(reg, reg, tmp);
-        tcg_temp_free(tmp);
         break;
     case OS_WORD:
         tcg_gen_andi_i32(reg, reg, 0xffff0000);
         tmp = tcg_temp_new();
         tcg_gen_ext16u_i32(tmp, val);
         tcg_gen_or_i32(reg, reg, tmp);
-        tcg_temp_free(tmp);
         break;
     case OS_LONG:
     case OS_SINGLE:
@@ -970,12 +959,10 @@ static void gen_fp_move(TCGv_ptr dest, TCGv_ptr src)
     t32 = tcg_temp_new();
     tcg_gen_ld16u_i32(t32, src, offsetof(FPReg, l.upper));
     tcg_gen_st16_i32(t32, dest, offsetof(FPReg, l.upper));
-    tcg_temp_free(t32);
 
     t64 = tcg_temp_new_i64();
     tcg_gen_ld_i64(t64, src, offsetof(FPReg, l.lower));
     tcg_gen_st_i64(t64, dest, offsetof(FPReg, l.lower));
-    tcg_temp_free_i64(t64);
 }
 
 static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
@@ -1029,8 +1016,6 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
     default:
         g_assert_not_reached();
     }
-    tcg_temp_free(tmp);
-    tcg_temp_free_i64(t64);
 }
 
 static void gen_store_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
@@ -1084,8 +1069,6 @@ static void gen_store_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
     default:
         g_assert_not_reached();
     }
-    tcg_temp_free(tmp);
-    tcg_temp_free_i64(t64);
 }
 
 static void gen_ldst_fp(DisasContext *s, int opsize, TCGv addr,
@@ -1141,7 +1124,6 @@ static int gen_ea_mode_fp(CPUM68KState *env, DisasContext *s, int mode,
             default:
                 g_assert_not_reached();
             }
-            tcg_temp_free(tmp);
         }
         return 0;
     case 1: /* Address register direct.  */
@@ -1187,27 +1169,22 @@ static int gen_ea_mode_fp(CPUM68KState *env, DisasContext *s, int mode,
             case OS_BYTE:
                 tmp = tcg_const_i32((int8_t)read_im8(env, s));
                 gen_helper_exts32(cpu_env, fp, tmp);
-                tcg_temp_free(tmp);
                 break;
             case OS_WORD:
                 tmp = tcg_const_i32((int16_t)read_im16(env, s));
                 gen_helper_exts32(cpu_env, fp, tmp);
-                tcg_temp_free(tmp);
                 break;
             case OS_LONG:
                 tmp = tcg_const_i32(read_im32(env, s));
                 gen_helper_exts32(cpu_env, fp, tmp);
-                tcg_temp_free(tmp);
                 break;
             case OS_SINGLE:
                 tmp = tcg_const_i32(read_im32(env, s));
                 gen_helper_extf32(cpu_env, fp, tmp);
-                tcg_temp_free(tmp);
                 break;
             case OS_DOUBLE:
                 t64 = tcg_const_i64(read_im64(env, s));
                 gen_helper_extf64(cpu_env, fp, t64);
-                tcg_temp_free_i64(t64);
                 break;
             case OS_EXTENDED:
                 if (m68k_feature(s->env, M68K_FEATURE_CF_FPU)) {
@@ -1216,10 +1193,8 @@ static int gen_ea_mode_fp(CPUM68KState *env, DisasContext *s, int mode,
                 }
                 tmp = tcg_const_i32(read_im32(env, s) >> 16);
                 tcg_gen_st16_i32(tmp, fp, offsetof(FPReg, l.upper));
-                tcg_temp_free(tmp);
                 t64 = tcg_const_i64(read_im64(env, s));
                 tcg_gen_st_i64(t64, fp, offsetof(FPReg, l.lower));
-                tcg_temp_free_i64(t64);
                 break;
             case OS_PACKED:
                 /*
@@ -1415,7 +1390,6 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
         tmp2 = tcg_temp_new();
         tcg_gen_xor_i32(tmp2, QREG_CC_N, QREG_CC_V);
         tcg_gen_or_i32(tmp, tmp, tmp2);
-        tcg_temp_free(tmp2);
         tcond = TCG_COND_LT;
         break;
     }
@@ -1495,7 +1469,6 @@ DISAS_INSN(scc)
 
     tcg_gen_neg_i32(tmp, tmp);
     DEST_EA(env, insn, OS_BYTE, tmp, NULL);
-    tcg_temp_free(tmp);
 }
 
 DISAS_INSN(dbcc)
@@ -1562,7 +1535,6 @@ DISAS_INSN(mulw)
     tcg_gen_mul_i32(tmp, tmp, src);
     tcg_gen_mov_i32(reg, tmp);
     gen_logic_cc(s, tmp, OS_LONG);
-    tcg_temp_free(tmp);
 }
 
 DISAS_INSN(divw)
@@ -1693,7 +1665,6 @@ static void bcd_add(TCGv dest, TCGv src)
     tcg_gen_andi_i32(t0, t0, 0x22);
     tcg_gen_add_i32(dest, t0, t0);
     tcg_gen_add_i32(dest, dest, t0);
-    tcg_temp_free(t0);
 
     /*
      * remove the exceeding 0x6
@@ -1701,7 +1672,6 @@ static void bcd_add(TCGv dest, TCGv src)
      */
 
     tcg_gen_sub_i32(dest, t1, dest);
-    tcg_temp_free(t1);
 }
 
 static void bcd_sub(TCGv dest, TCGv src)
@@ -1750,13 +1720,10 @@ static void bcd_sub(TCGv dest, TCGv src)
     tcg_gen_andi_i32(t2, t2, 0x22);
     tcg_gen_add_i32(t0, t2, t2);
     tcg_gen_add_i32(t0, t0, t2);
-    tcg_temp_free(t2);
 
     /* return t1 - t0 */
 
     tcg_gen_sub_i32(dest, t1, t0);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void bcd_flags(TCGv val)
@@ -1857,8 +1824,6 @@ DISAS_INSN(nbcd)
     DEST_EA(env, insn, OS_BYTE, dest, &addr);
 
     bcd_flags(dest);
-
-    tcg_temp_free(dest);
 }
 
 DISAS_INSN(addsub)
@@ -1897,7 +1862,6 @@ DISAS_INSN(addsub)
     } else {
         gen_partset_reg(opsize, DREG(insn, 9), dest);
     }
-    tcg_temp_free(dest);
 }
 
 /* Reverse the order of the bits in REG.  */
@@ -1934,7 +1898,6 @@ DISAS_INSN(bitop_reg)
 
     tmp = tcg_const_i32(1);
     tcg_gen_shl_i32(tmp, tmp, src2);
-    tcg_temp_free(src2);
 
     tcg_gen_and_i32(QREG_CC_Z, src1, tmp);
 
@@ -1952,11 +1915,9 @@ DISAS_INSN(bitop_reg)
     default: /* btst */
         break;
     }
-    tcg_temp_free(tmp);
     if (op) {
         DEST_EA(env, insn, opsize, dest, &addr);
     }
-    tcg_temp_free(dest);
 }
 
 DISAS_INSN(sats)
@@ -1976,7 +1937,6 @@ static void gen_push(DisasContext *s, TCGv val)
     tcg_gen_subi_i32(tmp, QREG_SP, 4);
     gen_store(s, OS_LONG, tmp, val, IS_USER(s));
     tcg_gen_mov_i32(QREG_SP, tmp);
-    tcg_temp_free(tmp);
 }
 
 static TCGv mreg(int reg)
@@ -2052,7 +2012,6 @@ DISAS_INSN(movem)
         for (i = 0; i < 16; i++) {
             if (mask & (1 << i)) {
                 tcg_gen_mov_i32(mreg(i), r[i]);
-                tcg_temp_free(r[i]);
             }
         }
         if (mode == 3) {
@@ -2079,7 +2038,6 @@ DISAS_INSN(movem)
                         tmp = tcg_temp_new();
                         tcg_gen_sub_i32(tmp, cpu_aregs[reg0], incr);
                         gen_store(s, opsize, addr, tmp, IS_USER(s));
-                        tcg_temp_free(tmp);
                     } else {
                         gen_store(s, opsize, addr, mreg(i), IS_USER(s));
                     }
@@ -2095,9 +2053,6 @@ DISAS_INSN(movem)
             }
         }
     }
-
-    tcg_temp_free(incr);
-    tcg_temp_free(addr);
 }
 
 DISAS_INSN(movep)
@@ -2141,8 +2096,6 @@ DISAS_INSN(movep)
             }
         }
     }
-    tcg_temp_free(abuf);
-    tcg_temp_free(dbuf);
 }
 
 DISAS_INSN(bitop_im)
@@ -2201,7 +2154,6 @@ DISAS_INSN(bitop_im)
             break;
         }
         DEST_EA(env, insn, opsize, tmp, &addr);
-        tcg_temp_free(tmp);
     }
 }
 
@@ -2224,7 +2176,6 @@ static TCGv gen_get_sr(DisasContext *s)
     sr = tcg_temp_new();
     tcg_gen_andi_i32(sr, QREG_SR, 0xffe0);
     tcg_gen_or_i32(sr, sr, ccr);
-    tcg_temp_free(ccr);
     return sr;
 }
 
@@ -2373,8 +2324,6 @@ DISAS_INSN(arith_im)
     default:
         abort();
     }
-    tcg_temp_free(im);
-    tcg_temp_free(dest);
 }
 
 DISAS_INSN(cas)
@@ -2430,8 +2379,6 @@ DISAS_INSN(cas)
     gen_update_cc_cmp(s, load, cmp, opsize);
     gen_partset_reg(opsize, DREG(ext, 0), load);
 
-    tcg_temp_free(load);
-
     switch (extract32(insn, 3, 3)) {
     case 3: /* Indirect postincrement.  */
         tcg_gen_addi_i32(AREG(insn, 0), addr, opsize_bytes(opsize));
@@ -2487,7 +2434,6 @@ DISAS_INSN(cas2w)
     } else {
         gen_helper_cas2w(cpu_env, regs, addr1, addr2);
     }
-    tcg_temp_free(regs);
 
     /* Note that cas2w also assigned to env->cc_op.  */
     s->cc_op = CC_OP_CMPW;
@@ -2538,7 +2484,6 @@ DISAS_INSN(cas2l)
     } else {
         gen_helper_cas2l(cpu_env, regs, addr1, addr2);
     }
-    tcg_temp_free(regs);
 
     /* Note that cas2l also assigned to env->cc_op.  */
     s->cc_op = CC_OP_CMPL;
@@ -2610,7 +2555,6 @@ DISAS_INSN(negx)
     z = tcg_const_i32(0);
     tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, src, z, QREG_CC_X, z);
     tcg_gen_sub2_i32(QREG_CC_N, QREG_CC_X, z, z, QREG_CC_N, QREG_CC_X);
-    tcg_temp_free(z);
     gen_ext(QREG_CC_N, QREG_CC_N, opsize, 1);
 
     tcg_gen_andi_i32(QREG_CC_X, QREG_CC_X, 1);
@@ -2658,7 +2602,6 @@ DISAS_INSN(clr)
     opsize = insn_opsize(insn);
     DEST_EA(env, insn, opsize, zero, NULL);
     gen_logic_cc(s, zero, opsize);
-    tcg_temp_free(zero);
 }
 
 DISAS_INSN(move_from_ccr)
@@ -2684,7 +2627,6 @@ DISAS_INSN(neg)
     gen_update_cc_add(dest, src1, opsize);
     tcg_gen_setcondi_i32(TCG_COND_NE, QREG_CC_X, dest, 0);
     DEST_EA(env, insn, opsize, dest, &addr);
-    tcg_temp_free(dest);
 }
 
 DISAS_INSN(move_to_ccr)
@@ -2719,8 +2661,6 @@ DISAS_INSN(swap)
     tcg_gen_shli_i32(src1, reg, 16);
     tcg_gen_shri_i32(src2, reg, 16);
     tcg_gen_or_i32(reg, src1, src2);
-    tcg_temp_free(src2);
-    tcg_temp_free(src1);
     gen_logic_cc(s, reg, OS_LONG);
 }
 
@@ -2763,7 +2703,6 @@ DISAS_INSN(ext)
     else
         tcg_gen_mov_i32(reg, tmp);
     gen_logic_cc(s, tmp, OS_LONG);
-    tcg_temp_free(tmp);
 }
 
 DISAS_INSN(tst)
@@ -2808,7 +2747,6 @@ DISAS_INSN(tas)
         tcg_gen_atomic_fetch_or_tl(src1, addr, tcg_constant_tl(0x80),
                                    IS_USER(s), MO_SB);
         gen_logic_cc(s, src1, OS_BYTE);
-        tcg_temp_free(src1);
 
         switch (mode) {
         case 3: /* Indirect postincrement.  */
@@ -2897,7 +2835,6 @@ static void gen_link(DisasContext *s, uint16_t insn, int32_t offset)
         tcg_gen_mov_i32(reg, tmp);
     }
     tcg_gen_addi_i32(QREG_SP, tmp, offset);
-    tcg_temp_free(tmp);
 }
 
 DISAS_INSN(link)
@@ -2928,8 +2865,6 @@ DISAS_INSN(unlk)
     tmp = gen_load(s, OS_LONG, src, 0, IS_USER(s));
     tcg_gen_mov_i32(reg, tmp);
     tcg_gen_addi_i32(QREG_SP, src, 4);
-    tcg_temp_free(src);
-    tcg_temp_free(tmp);
 }
 
 #if defined(CONFIG_SOFTMMU)
@@ -2969,10 +2904,8 @@ DISAS_INSN(rtr)
     tcg_gen_addi_i32(sp, QREG_SP, 2);
     tmp = gen_load(s, OS_LONG, sp, 0, IS_USER(s));
     tcg_gen_addi_i32(QREG_SP, sp, 4);
-    tcg_temp_free(sp);
 
     gen_set_sr(s, ccr, true);
-    tcg_temp_free(ccr);
 
     gen_jmp(s, tmp);
 }
@@ -3051,9 +2984,7 @@ DISAS_INSN(addsubq)
         }
         gen_update_cc_add(dest, val, opsize);
     }
-    tcg_temp_free(val);
     DEST_EA(env, insn, opsize, dest, &addr);
-    tcg_temp_free(dest);
 }
 
 DISAS_INSN(branch)
@@ -3131,7 +3062,6 @@ DISAS_INSN(or)
         gen_partset_reg(opsize, DREG(insn, 9), dest);
     }
     gen_logic_cc(s, dest, opsize);
-    tcg_temp_free(dest);
 }
 
 DISAS_INSN(suba)
@@ -3166,7 +3096,6 @@ static inline void gen_subx(DisasContext *s, TCGv src, TCGv dest, int opsize)
     tcg_gen_xor_i32(QREG_CC_V, QREG_CC_N, dest);
     tcg_gen_xor_i32(tmp, dest, src);
     tcg_gen_and_i32(QREG_CC_V, QREG_CC_V, tmp);
-    tcg_temp_free(tmp);
 
     /* Copy the rest of the results into place.  */
     tcg_gen_or_i32(QREG_CC_Z, QREG_CC_Z, QREG_CC_N); /* !Z is sticky */
@@ -3214,9 +3143,6 @@ DISAS_INSN(subx_mem)
     gen_subx(s, src, dest, opsize);
 
     gen_store(s, opsize, addr_dest, QREG_CC_N, IS_USER(s));
-
-    tcg_temp_free(dest);
-    tcg_temp_free(src);
 }
 
 DISAS_INSN(mov3q)
@@ -3230,7 +3156,6 @@ DISAS_INSN(mov3q)
     src = tcg_const_i32(val);
     gen_logic_cc(s, src, OS_LONG);
     DEST_EA(env, insn, OS_LONG, src, NULL);
-    tcg_temp_free(src);
 }
 
 DISAS_INSN(cmp)
@@ -3290,7 +3215,6 @@ DISAS_INSN(eor)
     tcg_gen_xor_i32(dest, src, DREG(insn, 9));
     gen_logic_cc(s, dest, opsize);
     DEST_EA(env, insn, opsize, dest, &addr);
-    tcg_temp_free(dest);
 }
 
 static void do_exg(TCGv reg1, TCGv reg2)
@@ -3299,7 +3223,6 @@ static void do_exg(TCGv reg1, TCGv reg2)
     tcg_gen_mov_i32(temp, reg1);
     tcg_gen_mov_i32(reg1, reg2);
     tcg_gen_mov_i32(reg2, temp);
-    tcg_temp_free(temp);
 }
 
 DISAS_INSN(exg_dd)
@@ -3342,7 +3265,6 @@ DISAS_INSN(and)
         gen_partset_reg(opsize, reg, dest);
     }
     gen_logic_cc(s, dest, opsize);
-    tcg_temp_free(dest);
 }
 
 DISAS_INSN(adda)
@@ -3376,7 +3298,6 @@ static inline void gen_addx(DisasContext *s, TCGv src, TCGv dest, int opsize)
     tcg_gen_xor_i32(QREG_CC_V, QREG_CC_N, src);
     tcg_gen_xor_i32(tmp, dest, src);
     tcg_gen_andc_i32(QREG_CC_V, QREG_CC_V, tmp);
-    tcg_temp_free(tmp);
 
     /* Copy the rest of the results into place.  */
     tcg_gen_or_i32(QREG_CC_Z, QREG_CC_Z, QREG_CC_N); /* !Z is sticky */
@@ -3424,9 +3345,6 @@ DISAS_INSN(addx_mem)
     gen_addx(s, src, dest, opsize);
 
     gen_store(s, opsize, addr_dest, QREG_CC_N, IS_USER(s));
-
-    tcg_temp_free(dest);
-    tcg_temp_free(src);
 }
 
 static inline void shift_im(DisasContext *s, uint16_t insn, int opsize)
@@ -3460,7 +3378,6 @@ static inline void shift_im(DisasContext *s, uint16_t insn, int opsize)
                 tcg_gen_sari_i32(QREG_CC_V, reg, bits - 1);
                 tcg_gen_sari_i32(t0, reg, bits - count - 1);
                 tcg_gen_setcond_i32(TCG_COND_NE, QREG_CC_V, QREG_CC_V, t0);
-                tcg_temp_free(t0);
             }
             tcg_gen_neg_i32(QREG_CC_V, QREG_CC_V);
         }
@@ -3518,7 +3435,6 @@ static inline void shift_reg(DisasContext *s, uint16_t insn, int opsize)
             tcg_gen_shri_i32(QREG_CC_C, QREG_CC_N, bits);
             tcg_gen_movcond_i32(TCG_COND_EQ, QREG_CC_C,
                                 s32, zero, zero, QREG_CC_C);
-            tcg_temp_free(zero);
         }
         tcg_gen_andi_i32(QREG_CC_C, QREG_CC_C, 1);
 
@@ -3539,7 +3455,6 @@ static inline void shift_reg(DisasContext *s, uint16_t insn, int opsize)
             TCGv_i64 tt = tcg_const_i64(32);
             /* if shift is greater than 32, use 32 */
             tcg_gen_movcond_i64(TCG_COND_GT, s64, s64, tt, tt, s64);
-            tcg_temp_free_i64(tt);
             /* Sign extend the input to 64 bits; re-do the shift.  */
             tcg_gen_ext_i32_i64(t64, reg);
             tcg_gen_shl_i64(s64, t64, s64);
@@ -3571,10 +3486,6 @@ static inline void shift_reg(DisasContext *s, uint16_t insn, int opsize)
     gen_ext(QREG_CC_N, QREG_CC_N, opsize, 1);
     tcg_gen_mov_i32(QREG_CC_Z, QREG_CC_N);
 
-    tcg_temp_free(s32);
-    tcg_temp_free_i64(s64);
-    tcg_temp_free_i64(t64);
-
     /* Write back the result.  */
     gen_partset_reg(opsize, DREG(insn, 0), QREG_CC_N);
     set_cc_op(s, CC_OP_FLAGS);
@@ -3735,25 +3646,20 @@ static TCGv rotate_x(TCGv reg, TCGv shift, int left, int size)
         /* shx = shx < 0 ? size : shx; */
         zero = tcg_const_i32(0);
         tcg_gen_movcond_i32(TCG_COND_LT, shx, shx, zero, sz, shx);
-        tcg_temp_free(zero);
     } else {
         tcg_gen_mov_i32(shr, shift);      /* shr = shift */
         tcg_gen_movi_i32(shl, size + 1);
         tcg_gen_sub_i32(shl, shl, shift); /* shl = size + 1 - shift */
         tcg_gen_sub_i32(shx, sz, shift); /* shx = size - shift */
     }
-    tcg_temp_free_i32(sz);
 
     /* reg = (reg << shl) | (reg >> shr) | (x << shx); */
 
     tcg_gen_shl_i32(shl, reg, shl);
     tcg_gen_shr_i32(shr, reg, shr);
     tcg_gen_or_i32(reg, shl, shr);
-    tcg_temp_free(shl);
-    tcg_temp_free(shr);
     tcg_gen_shl_i32(shx, QREG_CC_X, shx);
     tcg_gen_or_i32(reg, reg, shx);
-    tcg_temp_free(shx);
 
     /* X = (reg >> size) & 1 */
 
@@ -3787,7 +3693,6 @@ static TCGv rotate32_x(TCGv reg, TCGv shift, int left)
         /* rotate */
 
         tcg_gen_rotl_i64(t0, t0, shift64);
-        tcg_temp_free_i64(shift64);
 
         /* result is [reg:..:reg:X] */
 
@@ -3801,7 +3706,6 @@ static TCGv rotate32_x(TCGv reg, TCGv shift, int left)
         tcg_gen_concat_i32_i64(t0, reg, QREG_CC_X);
 
         tcg_gen_rotr_i64(t0, t0, shift64);
-        tcg_temp_free_i64(shift64);
 
         /* result is value: [X:reg:..:reg] */
 
@@ -3815,17 +3719,13 @@ static TCGv rotate32_x(TCGv reg, TCGv shift, int left)
 
         tcg_gen_shli_i32(hi, hi, 1);
     }
-    tcg_temp_free_i64(t0);
     tcg_gen_or_i32(lo, lo, hi);
-    tcg_temp_free(hi);
 
     /* if shift == 0, register and X are not affected */
 
     zero = tcg_const_i32(0);
     tcg_gen_movcond_i32(TCG_COND_EQ, X, shift, zero, QREG_CC_X, X);
     tcg_gen_movcond_i32(TCG_COND_EQ, reg, shift, zero, reg, lo);
-    tcg_temp_free(zero);
-    tcg_temp_free(lo);
 
     return X;
 }
@@ -3847,9 +3747,7 @@ DISAS_INSN(rotate_im)
     } else {
         TCGv X = rotate32_x(DREG(insn, 0), shift, left);
         rotate_x_flags(DREG(insn, 0), X, 32);
-        tcg_temp_free(X);
     }
-    tcg_temp_free(shift);
 
     set_cc_op(s, CC_OP_FLAGS);
 }
@@ -3874,9 +3772,7 @@ DISAS_INSN(rotate8_im)
     } else {
         TCGv X = rotate_x(reg, shift, left, 8);
         rotate_x_flags(reg, X, 8);
-        tcg_temp_free(X);
     }
-    tcg_temp_free(shift);
     gen_partset_reg(OS_BYTE, DREG(insn, 0), reg);
     set_cc_op(s, CC_OP_FLAGS);
 }
@@ -3900,9 +3796,7 @@ DISAS_INSN(rotate16_im)
     } else {
         TCGv X = rotate_x(reg, shift, left, 16);
         rotate_x_flags(reg, X, 16);
-        tcg_temp_free(X);
     }
-    tcg_temp_free(shift);
     gen_partset_reg(OS_WORD, DREG(insn, 0), reg);
     set_cc_op(s, CC_OP_FLAGS);
 }
@@ -3934,10 +3828,7 @@ DISAS_INSN(rotate_reg)
         tcg_gen_remu_i32(t1, t0, t1);
         X = rotate32_x(DREG(insn, 0), t1, left);
         rotate_x_flags(DREG(insn, 0), X, 32);
-        tcg_temp_free(X);
     }
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
     set_cc_op(s, CC_OP_FLAGS);
 }
 
@@ -3968,10 +3859,7 @@ DISAS_INSN(rotate8_reg)
         tcg_gen_remu_i32(t1, t0, t1);
         X = rotate_x(reg, t1, left, 8);
         rotate_x_flags(reg, X, 8);
-        tcg_temp_free(X);
     }
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
     gen_partset_reg(OS_BYTE, DREG(insn, 0), reg);
     set_cc_op(s, CC_OP_FLAGS);
 }
@@ -4003,10 +3891,7 @@ DISAS_INSN(rotate16_reg)
         tcg_gen_remu_i32(t1, t0, t1);
         X = rotate_x(reg, t1, left, 16);
         rotate_x_flags(reg, X, 16);
-        tcg_temp_free(X);
     }
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
     gen_partset_reg(OS_WORD, DREG(insn, 0), reg);
     set_cc_op(s, CC_OP_FLAGS);
 }
@@ -4026,9 +3911,7 @@ DISAS_INSN(rotate_mem)
     } else {
         TCGv X = rotate_x(src, shift, left, 16);
         rotate_x_flags(src, X, 16);
-        tcg_temp_free(X);
     }
-    tcg_temp_free(shift);
     DEST_EA(env, insn, OS_WORD, src, &addr);
     set_cc_op(s, CC_OP_FLAGS);
 }
@@ -4069,7 +3952,6 @@ DISAS_INSN(bfext_reg)
         } else {
             tcg_gen_shr_i32(dst, tmp, shift);
         }
-        tcg_temp_free(shift);
     } else {
         /* Immediate width.  */
         if (ext & 0x800) {
@@ -4098,7 +3980,6 @@ DISAS_INSN(bfext_reg)
         }
     }
 
-    tcg_temp_free(tmp);
     set_cc_op(s, CC_OP_LOGIC);
 }
 
@@ -4133,16 +4014,8 @@ DISAS_INSN(bfext_mem)
         TCGv_i64 tmp = tcg_temp_new_i64();
         gen_helper_bfextu_mem(tmp, cpu_env, addr, ofs, len);
         tcg_gen_extr_i64_i32(dest, QREG_CC_N, tmp);
-        tcg_temp_free_i64(tmp);
     }
     set_cc_op(s, CC_OP_LOGIC);
-
-    if (!(ext & 0x20)) {
-        tcg_temp_free(len);
-    }
-    if (!(ext & 0x800)) {
-        tcg_temp_free(ofs);
-    }
 }
 
 DISAS_INSN(bfop_reg)
@@ -4210,7 +4083,6 @@ DISAS_INSN(bfop_reg)
                 tcg_gen_movi_i32(tofs, ofs);
             }
         }
-        tcg_temp_free(tmp);
     }
     set_cc_op(s, CC_OP_LOGIC);
 
@@ -4223,8 +4095,6 @@ DISAS_INSN(bfop_reg)
         break;
     case 0x0d00: /* bfffo */
         gen_helper_bfffo_reg(DREG(ext, 12), QREG_CC_N, tofs, tlen);
-        tcg_temp_free(tlen);
-        tcg_temp_free(tofs);
         break;
     case 0x0e00: /* bfset */
         tcg_gen_orc_i32(src, src, mask);
@@ -4235,7 +4105,6 @@ DISAS_INSN(bfop_reg)
     default:
         g_assert_not_reached();
     }
-    tcg_temp_free(mask);
 }
 
 DISAS_INSN(bfop_mem)
@@ -4272,7 +4141,6 @@ DISAS_INSN(bfop_mem)
         t64 = tcg_temp_new_i64();
         gen_helper_bfffo_mem(t64, cpu_env, addr, ofs, len);
         tcg_gen_extr_i64_i32(DREG(ext, 12), QREG_CC_N, t64);
-        tcg_temp_free_i64(t64);
         break;
     case 0x0e00: /* bfset */
         gen_helper_bfset_mem(QREG_CC_N, cpu_env, addr, ofs, len);
@@ -4284,13 +4152,6 @@ DISAS_INSN(bfop_mem)
         g_assert_not_reached();
     }
     set_cc_op(s, CC_OP_LOGIC);
-
-    if (!(ext & 0x20)) {
-        tcg_temp_free(len);
-    }
-    if (!(ext & 0x800)) {
-        tcg_temp_free(ofs);
-    }
 }
 
 DISAS_INSN(bfins_reg)
@@ -4360,11 +4221,7 @@ DISAS_INSN(bfins_reg)
         tcg_gen_rotr_i32(tmp, tmp, rot);
         tcg_gen_and_i32(dst, dst, mask);
         tcg_gen_or_i32(dst, dst, tmp);
-
-        tcg_temp_free(rot);
-        tcg_temp_free(mask);
     }
-    tcg_temp_free(tmp);
 }
 
 DISAS_INSN(bfins_mem)
@@ -4392,13 +4249,6 @@ DISAS_INSN(bfins_mem)
 
     gen_helper_bfins_mem(QREG_CC_N, cpu_env, addr, src, ofs, len);
     set_cc_op(s, CC_OP_LOGIC);
-
-    if (!(ext & 0x20)) {
-        tcg_temp_free(len);
-    }
-    if (!(ext & 0x800)) {
-        tcg_temp_free(ofs);
-    }
 }
 
 DISAS_INSN(ff1)
@@ -4467,9 +4317,7 @@ DISAS_INSN(chk2)
     tcg_gen_addi_i32(addr2, addr1, opsize_bytes(opsize));
 
     bound1 = gen_load(s, opsize, addr1, 1, IS_USER(s));
-    tcg_temp_free(addr1);
     bound2 = gen_load(s, opsize, addr2, 1, IS_USER(s));
-    tcg_temp_free(addr2);
 
     reg = tcg_temp_new();
     if (ext & 0x8000) {
@@ -4480,9 +4328,6 @@ DISAS_INSN(chk2)
 
     gen_flush_flags(s);
     gen_helper_chk2(cpu_env, reg, bound1, bound2);
-    tcg_temp_free(reg);
-    tcg_temp_free(bound1);
-    tcg_temp_free(bound2);
 }
 
 static void m68k_copy_line(TCGv dst, TCGv src, int index)
@@ -4504,10 +4349,6 @@ static void m68k_copy_line(TCGv dst, TCGv src, int index)
     tcg_gen_qemu_st64(t0, addr, index);
     tcg_gen_addi_i32(addr, addr, 8);
     tcg_gen_qemu_st64(t1, addr, index);
-
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free(addr);
 }
 
 DISAS_INSN(move16_reg)
@@ -4528,7 +4369,6 @@ DISAS_INSN(move16_reg)
     tcg_gen_mov_i32(tmp, AREG(ext, 12));
     tcg_gen_addi_i32(AREG(insn, 0), AREG(insn, 0), 16);
     tcg_gen_addi_i32(AREG(ext, 12), tmp, 16);
-    tcg_temp_free(tmp);
 }
 
 DISAS_INSN(move16_mem)
@@ -4547,8 +4387,6 @@ DISAS_INSN(move16_mem)
         m68k_copy_line(addr, reg, index);
     }
 
-    tcg_temp_free(addr);
-
     if (((insn >> 3) & 2) == 0) {
         /* (Ay)+ */
         tcg_gen_addi_i32(reg, reg, 16);
@@ -4633,7 +4471,6 @@ DISAS_INSN(moves)
         } else {
             gen_partset_reg(opsize, reg, tmp);
         }
-        tcg_temp_free(tmp);
     }
     switch (extract32(insn, 3, 3)) {
     case 3: /* Indirect postincrement.  */
@@ -4807,7 +4644,6 @@ DISAS_INSN(pflush)
 
     opmode = tcg_const_i32((insn >> 3) & 3);
     gen_helper_pflush(cpu_env, AREG(insn, 0), opmode);
-    tcg_temp_free(opmode);
 }
 
 DISAS_INSN(ptest)
@@ -4820,7 +4656,6 @@ DISAS_INSN(ptest)
     }
     is_read = tcg_const_i32((insn >> 5) & 1);
     gen_helper_ptest(cpu_env, AREG(insn, 0), is_read);
-    tcg_temp_free(is_read);
 }
 #endif
 
@@ -4936,7 +4771,6 @@ static void gen_qemu_store_fcr(DisasContext *s, TCGv addr, int reg)
     tmp = tcg_temp_new();
     gen_load_fcr(s, tmp, reg);
     tcg_gen_qemu_st32(tmp, addr, index);
-    tcg_temp_free(tmp);
 }
 
 static void gen_qemu_load_fcr(DisasContext *s, TCGv addr, int reg)
@@ -4947,7 +4781,6 @@ static void gen_qemu_load_fcr(DisasContext *s, TCGv addr, int reg)
     tmp = tcg_temp_new();
     tcg_gen_qemu_ld32u(tmp, addr, index);
     gen_store_fcr(s, tmp, reg);
-    tcg_temp_free(tmp);
 }
 
 
@@ -4993,7 +4826,6 @@ static void gen_op_fmove_fcr(CPUM68KState *env, DisasContext *s,
             }
             tmp = tcg_const_i32(read_im32(env, s));
             gen_store_fcr(s, tmp, mask);
-            tcg_temp_free(tmp);
             return;
         }
         break;
@@ -5046,7 +4878,6 @@ static void gen_op_fmove_fcr(CPUM68KState *env, DisasContext *s,
             tcg_gen_mov_i32(AREG(insn, 0), addr);
         }
     }
-    tcg_temp_free_i32(addr);
 }
 
 static void gen_op_fmovem(CPUM68KState *env, DisasContext *s,
@@ -5107,7 +4938,6 @@ static void gen_op_fmovem(CPUM68KState *env, DisasContext *s,
     if ((insn & 070) == 030 || (insn & 070) == 040) {
         tcg_gen_mov_i32(AREG(insn, 0), tmp);
     }
-    tcg_temp_free(tmp);
 }
 
 /*
@@ -5134,8 +4964,6 @@ DISAS_INSN(fpu)
             TCGv rom_offset = tcg_const_i32(opmode);
             cpu_dest = gen_fp_ptr(REG(ext, 7));
             gen_helper_fconst(cpu_env, cpu_dest, rom_offset);
-            tcg_temp_free_ptr(cpu_dest);
-            tcg_temp_free(rom_offset);
             return;
         }
         break;
@@ -5147,7 +4975,6 @@ DISAS_INSN(fpu)
             gen_addr_fault(s);
         }
         gen_helper_ftst(cpu_env, cpu_src);
-        tcg_temp_free_ptr(cpu_src);
         return;
     case 4: /* fmove to control register.  */
     case 5: /* fmove from control register.  */
@@ -5335,7 +5162,6 @@ DISAS_INSN(fpu)
     case 0x36: case 0x37: {
             TCGv_ptr cpu_dest2 = gen_fp_ptr(REG(ext, 0));
             gen_helper_fsincos(cpu_env, cpu_dest, cpu_dest2, cpu_src);
-            tcg_temp_free_ptr(cpu_dest2);
         }
         break;
     case 0x38: /* fcmp */
@@ -5347,9 +5173,7 @@ DISAS_INSN(fpu)
     default:
         goto undef;
     }
-    tcg_temp_free_ptr(cpu_src);
     gen_helper_ftst(cpu_env, cpu_dest);
-    tcg_temp_free_ptr(cpu_dest);
     return;
 undef:
     /* FIXME: Is this right for offset addressing modes?  */
@@ -5478,7 +5302,6 @@ static void gen_fcc_cond(DisasCompare *c, DisasContext *s, int cond)
         c->tcond = TCG_COND_ALWAYS;
         break;
     }
-    tcg_temp_free(fpsr);
 }
 
 static void gen_fjmpcc(DisasContext *s, int cond, TCGLabel *l1)
@@ -5526,7 +5349,6 @@ DISAS_INSN(fscc)
 
     tcg_gen_neg_i32(tmp, tmp);
     DEST_EA(env, insn, OS_BYTE, tmp, NULL);
-    tcg_temp_free(tmp);
 }
 
 DISAS_INSN(ftrapcc)
@@ -5585,7 +5407,6 @@ DISAS_INSN(fsave)
         /* always write IDLE */
         TCGv idle = tcg_const_i32(0x41000000);
         DEST_EA(env, insn, OS_LONG, idle, NULL);
-        tcg_temp_free(idle);
     } else {
         disas_undef(env, s, insn);
     }
@@ -5785,7 +5606,6 @@ DISAS_INSN(mac)
         case 4: /* Pre-decrement.  */
             tcg_gen_mov_i32(AREG(insn, 0), addr);
         }
-        tcg_temp_free(loadval);
     }
 }
 
@@ -5859,7 +5679,6 @@ DISAS_INSN(macsr_to_ccr)
     /* Note that X and C are always cleared. */
     tcg_gen_andi_i32(tmp, QREG_MACSR, CCF_N | CCF_Z | CCF_V);
     gen_helper_set_ccr(cpu_env, tmp);
-    tcg_temp_free(tmp);
     set_cc_op(s, CC_OP_FLAGS);
 }
 
-- 
2.34.1


