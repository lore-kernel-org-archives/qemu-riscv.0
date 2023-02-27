Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW8D-0004ft-7x
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6t-0008Ss-A9
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:40 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6o-00015r-Ve
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:39 -0500
Received: by mail-pl1-x644.google.com with SMTP id u5so2136850plq.7
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=36+6c6XhddMEyIhn3+S9l0econtu2Qbbfj3zvO3qr6w=;
 b=d7KDUAEmH2YMRMJY/9bGIXI+gQqAK5MF8dsbuecvsf46BWeAkj5bXreDJVuoDoKkm3
 kEgaIQEFU0O0bUrnCUfBEgMr0ogOYr7Au9A17/ny3pfVK1vw2I2bcnXlwULPymOjlfnk
 vDEZDZvARIR2v1xxpnBznFPIuzbvC8hoF9Im+KbPSecgIhY+GqehxEUzcw5xhmhIcpCP
 hGKZ7xFb8JuufOZf6PoBgVS9ffxmYdz3IoTj9EAbbNpA+glVjDD4FpscDaPXPYX1PSrU
 /d6Yto+cCYZvSi+fXt61BbZXT55vT3rYaJBJJWdmn60Xt+FAOudgXx3s9dgVg8d6NnuV
 miWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=36+6c6XhddMEyIhn3+S9l0econtu2Qbbfj3zvO3qr6w=;
 b=NifNBvtmXC3jrBqNzdu7X9EPLZsoPydStjIg9hjXQ+3RfSJswwqvbQ/8+w7UHivxDG
 WPh/XjcCAMAhBLWQx/JQSIc5mvlTy5Ro48343vpCwy2/XnZR+wasBVOiDQrs72LXf68N
 yGJQQirkUrtffh/QB884ok1i3qE10Hp+BabKn1RNtuaDX9NuIhiEHr3NF07fKMHoEYwn
 wnR3LhGL4anZg20oGk5TVIlE31RTBBBMkGyWSefs2jMA/pg+JCkgcT4i6N5GGl+F2gbt
 2WarANNP63wletskC2rLJqiIF9bcrhvLYDC3aSpcIrzAmUL6gMkHCUTDw+Zd6FU2PYYx
 1c5w==
X-Gm-Message-State: AO0yUKU4VPJFH0xU5SuT0ozsE25gfTVzPfOyVFIK6c3oHMZKGmc4yx8H
 OG3fE829vew5X41e9uCU6n0/NGv5E+34hIPuZFz2tA==
X-Google-Smtp-Source: AK7set8+swk1gqzDC4KAxoM06/7wxDBwiZzG3fCPGPh0vYX6Fpia7rR+/SaL6rSD9tgoNkMGoLA52Q==
X-Received: by 2002:a17:90b:3892:b0:237:aade:444 with SMTP id
 mu18-20020a17090b389200b00237aade0444mr9018394pjb.42.1677475893649; 
 Sun, 26 Feb 2023 21:31:33 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 72/76] target/xtensa: Drop tcg_temp_free
Date: Sun, 26 Feb 2023 19:25:01 -1000
Message-Id: <20230227052505.352889-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:31:42 -0000

Translators are no longer required to free tcg temporaries.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 107 --------------------------------------
 1 file changed, 107 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 910350dec6..3ea50d8bc3 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1102,16 +1102,6 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
         ops->translate(dc, pslot->arg, ops->par);
     }
 
-    for (i = 0; i < n_arg_copy; ++i) {
-        if (arg_copy[i].arg->num_bits <= 32) {
-            tcg_temp_free_i32(arg_copy[i].temp);
-        } else if (arg_copy[i].arg->num_bits <= 64) {
-            tcg_temp_free_i64(arg_copy[i].temp);
-        } else {
-            g_assert_not_reached();
-        }
-    }
-
     if (dc->base.is_jmp == DISAS_NEXT) {
         gen_postprocess(dc, 0);
         dc->op_flags = 0;
@@ -1238,10 +1228,6 @@ static void xtensa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (dc->icount) {
-        tcg_temp_free(dc->next_icount);
-    }
-
     switch (dc->base.is_jmp) {
     case DISAS_NORETURN:
         break;
@@ -1369,7 +1355,6 @@ static void translate_addx(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_shli_i32(tmp, arg[1].in, par[0]);
     tcg_gen_add_i32(arg[0].out, tmp, arg[2].in);
-    tcg_temp_free(tmp);
 }
 
 static void translate_all(DisasContext *dc, const OpcodeArg arg[],
@@ -1388,8 +1373,6 @@ static void translate_all(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_shri_i32(tmp, tmp, arg[1].imm + shift);
     tcg_gen_deposit_i32(arg[0].out, arg[0].out,
                         tmp, arg[0].imm, 1);
-    tcg_temp_free(mask);
-    tcg_temp_free(tmp);
 }
 
 static void translate_and(DisasContext *dc, const OpcodeArg arg[],
@@ -1404,7 +1387,6 @@ static void translate_ball(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_and_i32(tmp, arg[0].in, arg[1].in);
     gen_brcond(dc, par[0], tmp, arg[1].in, arg[2].imm);
-    tcg_temp_free(tmp);
 }
 
 static void translate_bany(DisasContext *dc, const OpcodeArg arg[],
@@ -1413,7 +1395,6 @@ static void translate_bany(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_and_i32(tmp, arg[0].in, arg[1].in);
     gen_brcondi(dc, par[0], tmp, 0, arg[2].imm);
-    tcg_temp_free(tmp);
 }
 
 static void translate_b(DisasContext *dc, const OpcodeArg arg[],
@@ -1439,8 +1420,6 @@ static void translate_bb(DisasContext *dc, const OpcodeArg arg[],
 #endif
     tcg_gen_and_i32(tmp, arg[0].in, bit);
     gen_brcondi(dc, par[0], tmp, 0, arg[2].imm);
-    tcg_temp_free(tmp);
-    tcg_temp_free(bit);
 }
 
 static void translate_bbi(DisasContext *dc, const OpcodeArg arg[],
@@ -1453,7 +1432,6 @@ static void translate_bbi(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_andi_i32(tmp, arg[0].in, 0x00000001u << arg[1].imm);
 #endif
     gen_brcondi(dc, par[0], tmp, 0, arg[2].imm);
-    tcg_temp_free(tmp);
 }
 
 static void translate_bi(DisasContext *dc, const OpcodeArg arg[],
@@ -1494,8 +1472,6 @@ static void translate_boolean(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_shri_i32(tmp2, arg[2].in, arg[2].imm);
     op[par[0]](tmp1, tmp1, tmp2);
     tcg_gen_deposit_i32(arg[0].out, arg[0].out, tmp1, arg[0].imm, 1);
-    tcg_temp_free(tmp1);
-    tcg_temp_free(tmp2);
 }
 
 static void translate_bp(DisasContext *dc, const OpcodeArg arg[],
@@ -1505,7 +1481,6 @@ static void translate_bp(DisasContext *dc, const OpcodeArg arg[],
 
     tcg_gen_andi_i32(tmp, arg[0].in, 1 << arg[0].imm);
     gen_brcondi(dc, par[0], tmp, 0, arg[1].imm);
-    tcg_temp_free(tmp);
 }
 
 static void translate_call0(DisasContext *dc, const OpcodeArg arg[],
@@ -1520,7 +1495,6 @@ static void translate_callw(DisasContext *dc, const OpcodeArg arg[],
 {
     TCGv_i32 tmp = tcg_const_i32(arg[0].imm);
     gen_callw_slot(dc, par[0], tmp, adjust_jump_slot(dc, arg[0].imm, 0));
-    tcg_temp_free(tmp);
 }
 
 static void translate_callx0(DisasContext *dc, const OpcodeArg arg[],
@@ -1530,7 +1504,6 @@ static void translate_callx0(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_mov_i32(tmp, arg[0].in);
     tcg_gen_movi_i32(cpu_R[0], dc->base.pc_next);
     gen_jump(dc, tmp);
-    tcg_temp_free(tmp);
 }
 
 static void translate_callxw(DisasContext *dc, const OpcodeArg arg[],
@@ -1540,7 +1513,6 @@ static void translate_callxw(DisasContext *dc, const OpcodeArg arg[],
 
     tcg_gen_mov_i32(tmp, arg[0].in);
     gen_callw_slot(dc, par[0], tmp, -1);
-    tcg_temp_free(tmp);
 }
 
 static void translate_clamps(DisasContext *dc, const OpcodeArg arg[],
@@ -1551,8 +1523,6 @@ static void translate_clamps(DisasContext *dc, const OpcodeArg arg[],
 
     tcg_gen_smax_i32(tmp1, tmp1, arg[1].in);
     tcg_gen_smin_i32(arg[0].out, tmp1, tmp2);
-    tcg_temp_free(tmp1);
-    tcg_temp_free(tmp2);
 }
 
 static void translate_clrb_expstate(DisasContext *dc, const OpcodeArg arg[],
@@ -1574,7 +1544,6 @@ static void translate_const16(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 c = tcg_const_i32(arg[1].imm);
 
     tcg_gen_deposit_i32(arg[0].out, c, arg[0].in, 16, 16);
-    tcg_temp_free(c);
 }
 
 static void translate_dcache(DisasContext *dc, const OpcodeArg arg[],
@@ -1585,8 +1554,6 @@ static void translate_dcache(DisasContext *dc, const OpcodeArg arg[],
 
     tcg_gen_addi_i32(addr, arg[0].in, arg[1].imm);
     tcg_gen_qemu_ld8u(res, addr, dc->cring);
-    tcg_temp_free(addr);
-    tcg_temp_free(res);
 }
 
 static void translate_depbits(DisasContext *dc, const OpcodeArg arg[],
@@ -1637,7 +1604,6 @@ static void translate_extui(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_shri_i32(tmp, arg[1].in, arg[2].imm);
     tcg_gen_andi_i32(arg[0].out, tmp, maskimm);
-    tcg_temp_free(tmp);
 }
 
 static void translate_getex(DisasContext *dc, const OpcodeArg arg[],
@@ -1648,7 +1614,6 @@ static void translate_getex(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_extract_i32(tmp, cpu_SR[ATOMCTL], 8, 1);
     tcg_gen_deposit_i32(cpu_SR[ATOMCTL], cpu_SR[ATOMCTL], arg[0].in, 8, 1);
     tcg_gen_mov_i32(arg[0].out, tmp);
-    tcg_temp_free(tmp);
 }
 
 static void translate_icache(DisasContext *dc, const OpcodeArg arg[],
@@ -1660,7 +1625,6 @@ static void translate_icache(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movi_i32(cpu_pc, dc->pc);
     tcg_gen_addi_i32(addr, arg[0].in, arg[1].imm);
     gen_helper_itlb_hit_test(cpu_env, addr);
-    tcg_temp_free(addr);
 #endif
 }
 
@@ -1695,7 +1659,6 @@ static void translate_l32e(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
     mop = gen_load_store_alignment(dc, MO_TEUL, addr);
     tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->ring, mop);
-    tcg_temp_free(addr);
 }
 
 #ifdef CONFIG_USER_ONLY
@@ -1726,7 +1689,6 @@ static void translate_l32ex(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_qemu_ld_i32(arg[0].out, addr, dc->cring, mop);
     tcg_gen_mov_i32(cpu_exclusive_addr, addr);
     tcg_gen_mov_i32(cpu_exclusive_val, arg[0].out);
-    tcg_temp_free(addr);
 }
 
 static void translate_ldst(DisasContext *dc, const OpcodeArg arg[],
@@ -1749,7 +1711,6 @@ static void translate_ldst(DisasContext *dc, const OpcodeArg arg[],
             tcg_gen_mb(TCG_BAR_LDAQ | TCG_MO_ALL);
         }
     }
-    tcg_temp_free(addr);
 }
 
 static void translate_lct(DisasContext *dc, const OpcodeArg arg[],
@@ -1770,7 +1731,6 @@ static void translate_l32r(DisasContext *dc, const OpcodeArg arg[],
         tmp = tcg_const_i32(arg[1].imm);
     }
     tcg_gen_qemu_ld32u(arg[0].out, tmp, dc->cring);
-    tcg_temp_free(tmp);
 }
 
 static void translate_loop(DisasContext *dc, const OpcodeArg arg[],
@@ -1856,19 +1816,12 @@ static void translate_mac16(DisasContext *dc, const OpcodeArg arg[],
                                  lo, hi);
             }
             tcg_gen_ext8s_i32(cpu_SR[ACCHI], cpu_SR[ACCHI]);
-
-            tcg_temp_free_i32(lo);
-            tcg_temp_free_i32(hi);
         }
-        tcg_temp_free(m1);
-        tcg_temp_free(m2);
     }
     if (ld_offset) {
         tcg_gen_mov_i32(arg[1].out, vaddr);
         tcg_gen_mov_i32(cpu_SR[MR + arg[0].imm], mem32);
     }
-    tcg_temp_free(vaddr);
-    tcg_temp_free(mem32);
 }
 
 static void translate_memw(DisasContext *dc, const OpcodeArg arg[],
@@ -1932,7 +1885,6 @@ static void translate_movp(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movcond_i32(par[0],
                         arg[0].out, tmp, zero,
                         arg[1].in, arg[0].in);
-    tcg_temp_free(tmp);
 }
 
 static void translate_movsp(DisasContext *dc, const OpcodeArg arg[],
@@ -1955,8 +1907,6 @@ static void translate_mul16(DisasContext *dc, const OpcodeArg arg[],
         tcg_gen_ext16u_i32(v2, arg[2].in);
     }
     tcg_gen_mul_i32(arg[0].out, v1, v2);
-    tcg_temp_free(v2);
-    tcg_temp_free(v1);
 }
 
 static void translate_mull(DisasContext *dc, const OpcodeArg arg[],
@@ -1975,7 +1925,6 @@ static void translate_mulh(DisasContext *dc, const OpcodeArg arg[],
     } else {
         tcg_gen_mulu2_i32(lo, arg[0].out, arg[1].in, arg[2].in);
     }
-    tcg_temp_free(lo);
 }
 
 static void translate_neg(DisasContext *dc, const OpcodeArg arg[],
@@ -2110,7 +2059,6 @@ static void translate_retw(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_deposit_i32(tmp, tmp, cpu_R[0], 0, 30);
     gen_helper_retw(cpu_env, cpu_R[0]);
     gen_jump(dc, tmp);
-    tcg_temp_free(tmp);
 }
 
 static void translate_rfde(DisasContext *dc, const OpcodeArg arg[],
@@ -2149,7 +2097,6 @@ static void translate_rfw(DisasContext *dc, const OpcodeArg arg[],
                        cpu_SR[WINDOW_START], tmp);
     }
 
-    tcg_temp_free(tmp);
     gen_helper_restore_owb(cpu_env);
     gen_jump(dc, cpu_SR[EPC1]);
 }
@@ -2199,7 +2146,6 @@ static void translate_rsr_ptevaddr(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_shri_i32(tmp, cpu_SR[EXCVADDR], 10);
     tcg_gen_or_i32(tmp, tmp, cpu_SR[PTEVADDR]);
     tcg_gen_andi_i32(arg[0].out, tmp, 0xfffffffc);
-    tcg_temp_free(tmp);
 #endif
 }
 
@@ -2273,8 +2219,6 @@ static void translate_s32c1i(DisasContext *dc, const OpcodeArg arg[],
     gen_check_atomctl(dc, addr);
     tcg_gen_atomic_cmpxchg_i32(arg[0].out, addr, cpu_SR[SCOMPARE1],
                                tmp, dc->cring, mop);
-    tcg_temp_free(addr);
-    tcg_temp_free(tmp);
 }
 
 static void translate_s32e(DisasContext *dc, const OpcodeArg arg[],
@@ -2286,7 +2230,6 @@ static void translate_s32e(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
     mop = gen_load_store_alignment(dc, MO_TEUL, addr);
     tcg_gen_qemu_st_tl(arg[0].in, addr, dc->ring, mop);
-    tcg_temp_free(addr);
 }
 
 static void translate_s32ex(DisasContext *dc, const OpcodeArg arg[],
@@ -2312,9 +2255,6 @@ static void translate_s32ex(DisasContext *dc, const OpcodeArg arg[],
     gen_set_label(label);
     tcg_gen_extract_i32(arg[0].out, cpu_SR[ATOMCTL], 8, 1);
     tcg_gen_deposit_i32(cpu_SR[ATOMCTL], cpu_SR[ATOMCTL], res, 8, 1);
-    tcg_temp_free(prev);
-    tcg_temp_free(addr);
-    tcg_temp_free(res);
 }
 
 static void translate_salt(DisasContext *dc, const OpcodeArg arg[],
@@ -2338,7 +2278,6 @@ static void translate_sext(DisasContext *dc, const OpcodeArg arg[],
         TCGv_i32 tmp = tcg_temp_new_i32();
         tcg_gen_shli_i32(tmp, arg[1].in, shift);
         tcg_gen_sari_i32(arg[0].out, tmp, shift);
-        tcg_temp_free(tmp);
     }
 }
 
@@ -2378,8 +2317,6 @@ static void translate_simcall(DisasContext *dc, const OpcodeArg arg[],
                     tcg_gen_extu_i32_i64(tmp, reg); \
                     tcg_gen_##cmd##_i64(v, v, tmp); \
                     tcg_gen_extrl_i64_i32(arg[0].out, v); \
-                    tcg_temp_free_i64(v); \
-                    tcg_temp_free_i64(tmp); \
                 } while (0)
 
 #define gen_shift(cmd) gen_shift_reg(cmd, cpu_SR[SAR])
@@ -2396,7 +2333,6 @@ static void translate_sll(DisasContext *dc, const OpcodeArg arg[],
         tcg_gen_andi_i32(s, s, 0x3f);
         tcg_gen_extu_i32_i64(v, arg[1].in);
         gen_shift_reg(shl, s);
-        tcg_temp_free(s);
     }
 }
 
@@ -2463,7 +2399,6 @@ static void translate_ssa8b(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_shli_i32(tmp, arg[0].in, 3);
     gen_left_shift_sar(dc, tmp);
-    tcg_temp_free(tmp);
 }
 
 static void translate_ssa8l(DisasContext *dc, const OpcodeArg arg[],
@@ -2472,7 +2407,6 @@ static void translate_ssa8l(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_shli_i32(tmp, arg[0].in, 3);
     gen_right_shift_sar(dc, tmp);
-    tcg_temp_free(tmp);
 }
 
 static void translate_ssai(DisasContext *dc, const OpcodeArg arg[],
@@ -2505,7 +2439,6 @@ static void translate_subx(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_shli_i32(tmp, arg[1].in, par[0]);
     tcg_gen_sub_i32(arg[0].out, tmp, arg[2].in);
-    tcg_temp_free(tmp);
 }
 
 static void translate_waiti(DisasContext *dc, const OpcodeArg arg[],
@@ -2757,7 +2690,6 @@ static void translate_xsr(DisasContext *dc, const OpcodeArg arg[],
         tcg_gen_mov_i32(tmp, arg[0].in);
         tcg_gen_mov_i32(arg[0].out, cpu_SR[par[0]]);
         tcg_gen_mov_i32(cpu_SR[par[0]], tmp);
-        tcg_temp_free(tmp);
     } else {
         tcg_gen_movi_i32(arg[0].out, 0);
     }
@@ -2772,7 +2704,6 @@ static void translate_xsr_mask(DisasContext *dc, const OpcodeArg arg[],
         tcg_gen_mov_i32(tmp, arg[0].in);
         tcg_gen_mov_i32(arg[0].out, cpu_SR[par[0]]);
         tcg_gen_andi_i32(cpu_SR[par[0]], tmp, par[2]);
-        tcg_temp_free(tmp);
     } else {
         tcg_gen_movi_i32(arg[0].out, 0);
     }
@@ -2792,7 +2723,6 @@ static void translate_xsr_ccount(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_mov_i32(tmp, cpu_SR[par[0]]);
     gen_helper_wsr_ccount(cpu_env, arg[0].in);
     tcg_gen_mov_i32(arg[0].out, tmp);
-    tcg_temp_free(tmp);
 
 #endif
 }
@@ -2810,7 +2740,6 @@ static void translate_xsr_ccount(DisasContext *dc, const OpcodeArg arg[],
     } \
     translate_wsr_##name(dc, arg, par); \
     tcg_gen_mov_i32(arg[0].out, tmp); \
-    tcg_temp_free(tmp); \
 }
 
 gen_translate_xsr(acchi)
@@ -6297,16 +6226,6 @@ static inline void put_f32_o1_i3(const OpcodeArg *arg, const OpcodeArg *arg32,
         (o0 >= 0 && arg[o0].num_bits == 64)) {
         if (o0 >= 0) {
             tcg_gen_extu_i32_i64(arg[o0].out, arg32[o0].out);
-            tcg_temp_free_i32(arg32[o0].out);
-        }
-        if (i0 >= 0) {
-            tcg_temp_free_i32(arg32[i0].in);
-        }
-        if (i1 >= 0) {
-            tcg_temp_free_i32(arg32[i1].in);
-        }
-        if (i2 >= 0) {
-            tcg_temp_free_i32(arg32[i2].in);
         }
     }
 }
@@ -6430,9 +6349,6 @@ static void translate_compare_d(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movcond_i32(TCG_COND_NE,
                         arg[0].out, res, zero,
                         set_br, clr_br);
-    tcg_temp_free(res);
-    tcg_temp_free(set_br);
-    tcg_temp_free(clr_br);
 }
 
 static void translate_compare_s(DisasContext *dc, const OpcodeArg arg[],
@@ -6463,9 +6379,6 @@ static void translate_compare_s(DisasContext *dc, const OpcodeArg arg[],
                         arg[0].out, res, zero,
                         set_br, clr_br);
     put_f32_i2(arg, arg32, 1, 2);
-    tcg_temp_free(res);
-    tcg_temp_free(set_br);
-    tcg_temp_free(clr_br);
 }
 
 static void translate_const_d(DisasContext *dc, const OpcodeArg arg[],
@@ -6584,7 +6497,6 @@ static void translate_ldsti(DisasContext *dc, const OpcodeArg arg[],
     if (par[1]) {
         tcg_gen_mov_i32(arg[1].out, addr);
     }
-    tcg_temp_free(addr);
 }
 
 static void translate_ldstx(DisasContext *dc, const OpcodeArg arg[],
@@ -6603,7 +6515,6 @@ static void translate_ldstx(DisasContext *dc, const OpcodeArg arg[],
     if (par[1]) {
         tcg_gen_mov_i32(arg[1].out, addr);
     }
-    tcg_temp_free(addr);
 }
 
 static void translate_fpu2k_madd_s(DisasContext *dc, const OpcodeArg arg[],
@@ -6639,7 +6550,6 @@ static void translate_movcond_d(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movcond_i64(par[0], arg[0].out,
                         arg2, zero,
                         arg[1].in, arg[0].in);
-    tcg_temp_free_i64(arg2);
 }
 
 static void translate_movcond_s(DisasContext *dc, const OpcodeArg arg[],
@@ -6668,8 +6578,6 @@ static void translate_movp_d(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movcond_i64(par[0],
                         arg[0].out, tmp2, zero,
                         arg[1].in, arg[0].in);
-    tcg_temp_free_i32(tmp1);
-    tcg_temp_free_i64(tmp2);
 }
 
 static void translate_movp_s(DisasContext *dc, const OpcodeArg arg[],
@@ -6683,7 +6591,6 @@ static void translate_movp_s(DisasContext *dc, const OpcodeArg arg[],
         tcg_gen_movcond_i32(par[0],
                             arg[0].out, tmp, zero,
                             arg[1].in, arg[0].in);
-        tcg_temp_free(tmp);
     } else {
         translate_movp_d(dc, arg, par);
     }
@@ -7015,7 +6922,6 @@ static void translate_cvtd_s(DisasContext *dc, const OpcodeArg arg[],
 
     tcg_gen_extrl_i64_i32(v, arg[1].in);
     gen_helper_cvtd_s(arg[0].out, cpu_env, v);
-    tcg_temp_free_i32(v);
 }
 
 static void translate_cvts_d(DisasContext *dc, const OpcodeArg arg[],
@@ -7025,7 +6931,6 @@ static void translate_cvts_d(DisasContext *dc, const OpcodeArg arg[],
 
     gen_helper_cvts_d(v, cpu_env, arg[1].in);
     tcg_gen_extu_i32_i64(arg[0].out, v);
-    tcg_temp_free_i32(v);
 }
 
 static void translate_ldsti_d(DisasContext *dc, const OpcodeArg arg[],
@@ -7053,9 +6958,6 @@ static void translate_ldsti_d(DisasContext *dc, const OpcodeArg arg[],
             tcg_gen_addi_i32(arg[1].out, arg[1].in, arg[2].imm);
         }
     }
-    if (par[1]) {
-        tcg_temp_free(addr);
-    }
 }
 
 static void translate_ldsti_s(DisasContext *dc, const OpcodeArg arg[],
@@ -7088,9 +6990,6 @@ static void translate_ldsti_s(DisasContext *dc, const OpcodeArg arg[],
             tcg_gen_addi_i32(arg[1].out, arg[1].in, arg[2].imm);
         }
     }
-    if (par[1]) {
-        tcg_temp_free(addr);
-    }
 }
 
 static void translate_ldstx_d(DisasContext *dc, const OpcodeArg arg[],
@@ -7118,9 +7017,6 @@ static void translate_ldstx_d(DisasContext *dc, const OpcodeArg arg[],
             tcg_gen_add_i32(arg[1].out, arg[1].in, arg[2].in);
         }
     }
-    if (par[1]) {
-        tcg_temp_free(addr);
-    }
 }
 
 static void translate_ldstx_s(DisasContext *dc, const OpcodeArg arg[],
@@ -7153,9 +7049,6 @@ static void translate_ldstx_s(DisasContext *dc, const OpcodeArg arg[],
             tcg_gen_add_i32(arg[1].out, arg[1].in, arg[2].in);
         }
     }
-    if (par[1]) {
-        tcg_temp_free(addr);
-    }
 }
 
 static void translate_madd_d(DisasContext *dc, const OpcodeArg arg[],
-- 
2.34.1


