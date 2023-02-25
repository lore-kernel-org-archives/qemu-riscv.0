Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqjQ-0006bM-V8
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:20:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiY-0004c5-NP
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:19:47 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiP-0002z0-Bc
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:19:44 -0500
Received: by mail-pf1-x433.google.com with SMTP id b20so846680pfo.6
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fggkdWaXIry33qUz7sBhGNkv6UnQjXf9/nNJ0GPcic=;
 b=OfPILhhCK8b1pyXviX8Kr2oG6MqzR0jmtNLfm/kzfdEdYTqcdCSgVhyjfVlkErpcx6
 0AO06GM/THJteCOum3m3z3QWqB05A2ii06wYES0HSlFpsHwyY+sWZHenCsgZXE3NAA1D
 SbR43EfaOwxCtnsqcNkfDLkMIhFdtv4qzytp/qQb1v9/yxnNa5Ke/AHN04tzrPHCLCci
 8JFa4R3VI3ecou/+A7Yt2/+WpY0Zt6zg1Xqf5b4aTIgPxH+Xks8NUEskaOpBJJfTD6NM
 ECqWpyASQNHPDZPHjXSKq8WM5sr7118+OH+SqzIBHCb8dIoL+HGxDJRM7079sa51HNTe
 ItEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fggkdWaXIry33qUz7sBhGNkv6UnQjXf9/nNJ0GPcic=;
 b=LQ8DP4Nj96MnGqo5HEO+AXr0sNTzTCnWgMyFcu50NZmuOA0bDHt7HRy2g26rlothkl
 ghrv8LvABX+9Ya5OssROfCVMAa9wUKBMo9nzRq82H5Ab67hnhbmTgAduvBOJHar6Shbk
 NAKThYMcowGteK4Ud/GslXNqt/7ZKlwDR6RZeKWdtr9G9xMNjTCqFR49dcFgQUGutp5f
 CiIbzyzJ0a7fl0Ywh1W5F3HRiqWDepFgUhBwyT+eFUUoqQeYjWJYg2mPqL77tp08niRg
 tAuAfMhutID61xR7KuZzQ40TLHf+4M4JP1CHpCbzUHl2JBPwcdspf8iAjpj2QSZ2+eK9
 Y7Dw==
X-Gm-Message-State: AO0yUKVixOveflfwEMHdqTQYcDvpTGiSoLvo9MOiG0dS1449lWHo6Plx
 i2rDa8+TdeP1RjYRZjMI8t71xw==
X-Google-Smtp-Source: AK7set+6HhvgZob2sF/HH+lp4fzsrlZYYmx3JtOjp73zziuZu7QWmoww/0e+36SpHnIy6hohHrXc4Q==
X-Received: by 2002:a62:1e45:0:b0:5a9:e8dd:80ea with SMTP id
 e66-20020a621e45000000b005a9e8dd80eamr16125126pfe.17.1677316775466; 
 Sat, 25 Feb 2023 01:19:35 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 47/76] target/mips: Drop tcg_temp_free from translate.c
Date: Fri, 24 Feb 2023 23:13:58 -1000
Message-Id: <20230225091427.1817156-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:19:47 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 537 +-----------------------------------
 1 file changed, 14 insertions(+), 523 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 8cad3d15a0..0f27ca6149 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1274,11 +1274,8 @@ static inline void gen_load_srsgpr(int from, int to)
         tcg_gen_add_ptr(addr, cpu_env, addr);
 
         tcg_gen_ld_tl(t0, addr, sizeof(target_ulong) * from);
-        tcg_temp_free_ptr(addr);
-        tcg_temp_free_i32(t2);
     }
     gen_store_gpr(t0, to);
-    tcg_temp_free(t0);
 }
 
 static inline void gen_store_srsgpr(int from, int to)
@@ -1297,9 +1294,6 @@ static inline void gen_store_srsgpr(int from, int to)
         tcg_gen_add_ptr(addr, cpu_env, addr);
 
         tcg_gen_st_tl(t0, addr, sizeof(target_ulong) * to);
-        tcg_temp_free_ptr(addr);
-        tcg_temp_free_i32(t2);
-        tcg_temp_free(t0);
     }
 }
 
@@ -1396,7 +1390,6 @@ void gen_store_fpr32(DisasContext *ctx, TCGv_i32 t, int reg)
     t64 = tcg_temp_new_i64();
     tcg_gen_extu_i32_i64(t64, t);
     tcg_gen_deposit_i64(fpu_f64[reg], fpu_f64[reg], t64, 0, 32);
-    tcg_temp_free_i64(t64);
 }
 
 static void gen_load_fpr32h(DisasContext *ctx, TCGv_i32 t, int reg)
@@ -1414,7 +1407,6 @@ static void gen_store_fpr32h(DisasContext *ctx, TCGv_i32 t, int reg)
         TCGv_i64 t64 = tcg_temp_new_i64();
         tcg_gen_extu_i32_i64(t64, t);
         tcg_gen_deposit_i64(fpu_f64[reg], fpu_f64[reg], t64, 32, 32);
-        tcg_temp_free_i64(t64);
     } else {
         gen_store_fpr32(ctx, t, reg | 1);
     }
@@ -1439,7 +1431,6 @@ void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
         t0 = tcg_temp_new_i64();
         tcg_gen_shri_i64(t0, t, 32);
         tcg_gen_deposit_i64(fpu_f64[reg | 1], fpu_f64[reg | 1], t0, 0, 32);
-        tcg_temp_free_i64(t0);
     }
 }
 
@@ -1852,8 +1843,6 @@ static inline void gen_cmp ## type ## _ ## fmt(DisasContext *ctx, int n,      \
     default:                                                                  \
         abort();                                                              \
     }                                                                         \
-    tcg_temp_free_i##bits(fp0);                                               \
-    tcg_temp_free_i##bits(fp1);                                               \
 }
 
 FOP_CONDS(, 0, d, FMT_D, 64)
@@ -1946,8 +1935,6 @@ static inline void gen_r6_cmp_ ## fmt(DisasContext *ctx, int n,         \
         abort();                                                        \
     }                                                                   \
     STORE;                                                              \
-    tcg_temp_free_i ## bits(fp0);                                       \
-    tcg_temp_free_i ## bits(fp1);                                       \
 }
 
 FOP_CONDNS(d, FMT_D, 64, gen_store_fpr64(ctx, fp0, fd))
@@ -1967,7 +1954,6 @@ static inline void op_ld_##insn(TCGv ret, TCGv arg1, int mem_idx,          \
     tcg_gen_qemu_##fname(ret, arg1, ctx->mem_idx);                         \
     tcg_gen_st_tl(t0, cpu_env, offsetof(CPUMIPSState, lladdr));            \
     tcg_gen_st_tl(ret, cpu_env, offsetof(CPUMIPSState, llval));            \
-    tcg_temp_free(t0);                                                     \
 }
 #else
 #define OP_LD_ATOMIC(insn, fname)                                          \
@@ -2065,9 +2051,7 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
         tcg_gen_andc_tl(t1, t1, t2);
-        tcg_temp_free(t2);
         tcg_gen_or_tl(t0, t0, t1);
-        tcg_temp_free(t1);
         gen_store_gpr(t0, rt);
         break;
     case OPC_LDR:
@@ -2090,15 +2074,12 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
         tcg_gen_and_tl(t1, t1, t2);
-        tcg_temp_free(t2);
         tcg_gen_or_tl(t0, t0, t1);
-        tcg_temp_free(t1);
         gen_store_gpr(t0, rt);
         break;
     case OPC_LDPC:
         t1 = tcg_const_tl(pc_relative_pc(ctx));
         gen_op_addr_add(ctx, t0, t0, t1);
-        tcg_temp_free(t1);
         tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUQ);
         gen_store_gpr(t0, rt);
         break;
@@ -2106,7 +2087,6 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
     case OPC_LWPC:
         t1 = tcg_const_tl(pc_relative_pc(ctx));
         gen_op_addr_add(ctx, t0, t0, t1);
-        tcg_temp_free(t1);
         tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TESL);
         gen_store_gpr(t0, rt);
         break;
@@ -2170,9 +2150,7 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
         tcg_gen_andc_tl(t1, t1, t2);
-        tcg_temp_free(t2);
         tcg_gen_or_tl(t0, t0, t1);
-        tcg_temp_free(t1);
         tcg_gen_ext32s_tl(t0, t0);
         gen_store_gpr(t0, rt);
         break;
@@ -2199,9 +2177,7 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
         tcg_gen_and_tl(t1, t1, t2);
-        tcg_temp_free(t2);
         tcg_gen_or_tl(t0, t0, t1);
-        tcg_temp_free(t1);
         tcg_gen_ext32s_tl(t0, t0);
         gen_store_gpr(t0, rt);
         break;
@@ -2214,7 +2190,6 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         gen_store_gpr(t0, rt);
         break;
     }
-    tcg_temp_free(t0);
 }
 
 /* Store */
@@ -2273,8 +2248,6 @@ static void gen_st(DisasContext *ctx, uint32_t opc, int rt,
         gen_helper_0e2i(swr, t1, t0, mem_idx);
         break;
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 
@@ -2291,7 +2264,6 @@ static void gen_st_cond(DisasContext *ctx, int rt, int base, int offset,
     /* compare the address against that of the preceding LL */
     gen_base_offset_addr(ctx, addr, base, offset);
     tcg_gen_brcond_tl(TCG_COND_EQ, addr, cpu_lladdr, l1);
-    tcg_temp_free(addr);
     tcg_gen_movi_tl(t0, 0);
     gen_store_gpr(t0, rt);
     tcg_gen_br(done);
@@ -2304,10 +2276,8 @@ static void gen_st_cond(DisasContext *ctx, int rt, int base, int offset,
                               eva ? MIPS_HFLAG_UM : ctx->mem_idx, tcg_mo);
     tcg_gen_setcond_tl(TCG_COND_EQ, t0, t0, cpu_llval);
     gen_store_gpr(t0, rt);
-    tcg_temp_free(val);
 
     gen_set_label(done);
-    tcg_temp_free(t0);
 }
 
 /* Load and store */
@@ -2325,7 +2295,6 @@ static void gen_flt_ldst(DisasContext *ctx, uint32_t opc, int ft,
             tcg_gen_qemu_ld_i32(fp0, t0, ctx->mem_idx, MO_TESL |
                                 ctx->default_tcg_memop_mask);
             gen_store_fpr32(ctx, fp0, ft);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_SWC1:
@@ -2334,7 +2303,6 @@ static void gen_flt_ldst(DisasContext *ctx, uint32_t opc, int ft,
             gen_load_fpr32(ctx, fp0, ft);
             tcg_gen_qemu_st_i32(fp0, t0, ctx->mem_idx, MO_TEUL |
                                 ctx->default_tcg_memop_mask);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_LDC1:
@@ -2343,7 +2311,6 @@ static void gen_flt_ldst(DisasContext *ctx, uint32_t opc, int ft,
             tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEUQ |
                                 ctx->default_tcg_memop_mask);
             gen_store_fpr64(ctx, fp0, ft);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_SDC1:
@@ -2352,7 +2319,6 @@ static void gen_flt_ldst(DisasContext *ctx, uint32_t opc, int ft,
             gen_load_fpr64(ctx, fp0, ft);
             tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEUQ |
                                 ctx->default_tcg_memop_mask);
-            tcg_temp_free_i64(fp0);
         }
         break;
     default:
@@ -2381,7 +2347,6 @@ static void gen_cop1_ldst(DisasContext *ctx, uint32_t op, int rt,
     } else {
         generate_exception_err(ctx, EXCP_CpU, 1);
     }
-    tcg_temp_free(t0);
 }
 
 /* Arithmetic with immediate operand */
@@ -2412,15 +2377,12 @@ static void gen_arith_imm(DisasContext *ctx, uint32_t opc,
             tcg_gen_xori_tl(t1, t1, ~uimm);
             tcg_gen_xori_tl(t2, t0, uimm);
             tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
-            tcg_temp_free(t1);
             /* operands of same sign, result different sign */
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(l1);
             tcg_gen_ext32s_tl(t0, t0);
             gen_store_gpr(t0, rt);
-            tcg_temp_free(t0);
         }
         break;
     case OPC_ADDIU:
@@ -2445,14 +2407,11 @@ static void gen_arith_imm(DisasContext *ctx, uint32_t opc,
             tcg_gen_xori_tl(t1, t1, ~uimm);
             tcg_gen_xori_tl(t2, t0, uimm);
             tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
-            tcg_temp_free(t1);
             /* operands of same sign, result different sign */
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(l1);
             gen_store_gpr(t0, rt);
-            tcg_temp_free(t0);
         }
         break;
     case OPC_DADDIU:
@@ -2535,7 +2494,6 @@ static void gen_slt_imm(DisasContext *ctx, uint32_t opc,
         tcg_gen_setcondi_tl(TCG_COND_LTU, cpu_gpr[rt], t0, uimm);
         break;
     }
-    tcg_temp_free(t0);
 }
 
 /* Shifts with immediate operand */
@@ -2575,7 +2533,6 @@ static void gen_shift_imm(DisasContext *ctx, uint32_t opc,
             tcg_gen_trunc_tl_i32(t1, t0);
             tcg_gen_rotri_i32(t1, t1, uimm);
             tcg_gen_ext_i32_tl(cpu_gpr[rt], t1);
-            tcg_temp_free_i32(t1);
         } else {
             tcg_gen_ext32s_tl(cpu_gpr[rt], t0);
         }
@@ -2611,7 +2568,6 @@ static void gen_shift_imm(DisasContext *ctx, uint32_t opc,
         break;
 #endif
     }
-    tcg_temp_free(t0);
 }
 
 /* Arithmetic */
@@ -2642,14 +2598,11 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
             tcg_gen_xor_tl(t1, t1, t2);
             tcg_gen_xor_tl(t2, t0, t2);
             tcg_gen_andc_tl(t1, t2, t1);
-            tcg_temp_free(t2);
             tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
-            tcg_temp_free(t1);
             /* operands of same sign, result different sign */
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(l1);
             gen_store_gpr(t0, rd);
-            tcg_temp_free(t0);
         }
         break;
     case OPC_ADDU:
@@ -2678,9 +2631,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
             tcg_gen_xor_tl(t2, t1, t2);
             tcg_gen_xor_tl(t1, t0, t1);
             tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
-            tcg_temp_free(t1);
             /*
              * operands of different sign, first operand and the result
              * of different sign
@@ -2688,7 +2639,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(l1);
             gen_store_gpr(t0, rd);
-            tcg_temp_free(t0);
         }
         break;
     case OPC_SUBU:
@@ -2718,14 +2668,11 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
             tcg_gen_xor_tl(t1, t1, t2);
             tcg_gen_xor_tl(t2, t0, t2);
             tcg_gen_andc_tl(t1, t2, t1);
-            tcg_temp_free(t2);
             tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
-            tcg_temp_free(t1);
             /* operands of same sign, result different sign */
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(l1);
             gen_store_gpr(t0, rd);
-            tcg_temp_free(t0);
         }
         break;
     case OPC_DADDU:
@@ -2752,9 +2699,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
             tcg_gen_xor_tl(t2, t1, t2);
             tcg_gen_xor_tl(t1, t0, t1);
             tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
-            tcg_temp_free(t1);
             /*
              * Operands of different sign, first operand and result different
              * sign.
@@ -2762,7 +2707,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(l1);
             gen_store_gpr(t0, rd);
-            tcg_temp_free(t0);
         }
         break;
     case OPC_DSUBU:
@@ -2818,9 +2762,6 @@ static void gen_cond_move(DisasContext *ctx, uint32_t opc,
         tcg_gen_movcond_tl(TCG_COND_EQ, cpu_gpr[rd], t0, t1, t2, t1);
         break;
     }
-    tcg_temp_free(t2);
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
 }
 
 /* Logic */
@@ -2899,8 +2840,6 @@ static void gen_slt(DisasContext *ctx, uint32_t opc,
         tcg_gen_setcond_tl(TCG_COND_LTU, cpu_gpr[rd], t0, t1);
         break;
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /* Shifts */
@@ -2947,8 +2886,6 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
             tcg_gen_andi_i32(t2, t2, 0x1f);
             tcg_gen_rotr_i32(t2, t3, t2);
             tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
 #if defined(TARGET_MIPS64)
@@ -2970,8 +2907,6 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
         break;
 #endif
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /* Arithmetic on HI/LO registers */
@@ -3044,7 +2979,6 @@ static inline void gen_r6_ld(target_long addr, int reg, int memidx,
     TCGv t0 = tcg_const_tl(addr);
     tcg_gen_qemu_ld_tl(t0, t0, memidx, memop);
     gen_store_gpr(t0, reg);
-    tcg_temp_free(t0);
 }
 
 static inline void gen_pcrel(DisasContext *ctx, int opc, target_ulong pc,
@@ -3141,8 +3075,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
             tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
             tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_MOD:
@@ -3160,8 +3092,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
             tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
             tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_DIVU:
@@ -3173,8 +3103,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_divu_tl(cpu_gpr[rd], t0, t1);
             tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_MODU:
@@ -3186,8 +3114,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_remu_tl(cpu_gpr[rd], t0, t1);
             tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_MUL:
@@ -3198,8 +3124,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_trunc_tl_i32(t3, t1);
             tcg_gen_mul_i32(t2, t2, t3);
             tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
     case R6_OPC_MUH:
@@ -3210,8 +3134,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_trunc_tl_i32(t3, t1);
             tcg_gen_muls2_i32(t2, t3, t2, t3);
             tcg_gen_ext_i32_tl(cpu_gpr[rd], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
     case R6_OPC_MULU:
@@ -3222,8 +3144,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_trunc_tl_i32(t3, t1);
             tcg_gen_mul_i32(t2, t2, t3);
             tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
     case R6_OPC_MUHU:
@@ -3234,8 +3154,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_trunc_tl_i32(t3, t1);
             tcg_gen_mulu2_i32(t2, t3, t2, t3);
             tcg_gen_ext_i32_tl(cpu_gpr[rd], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
 #if defined(TARGET_MIPS64)
@@ -3251,8 +3169,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_movi_tl(t3, 0);
             tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
             tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_DMOD:
@@ -3267,8 +3183,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_movi_tl(t3, 0);
             tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
             tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_DDIVU:
@@ -3277,8 +3191,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             TCGv t3 = tcg_const_tl(1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_divu_i64(cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_DMODU:
@@ -3287,8 +3199,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             TCGv t3 = tcg_const_tl(1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_remu_i64(cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_DMUL:
@@ -3298,7 +3208,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
         {
             TCGv t2 = tcg_temp_new();
             tcg_gen_muls2_i64(t2, cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_DMULU:
@@ -3308,18 +3217,14 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
         {
             TCGv t2 = tcg_temp_new();
             tcg_gen_mulu2_i64(t2, cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t2);
         }
         break;
 #endif
     default:
         MIPS_INVAL("r6 mul/div");
         gen_reserved_instruction(ctx);
-        goto out;
+        break;
     }
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 #if defined(TARGET_MIPS64)
@@ -3351,8 +3256,6 @@ static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
             tcg_gen_rem_tl(cpu_HI[1], t0, t1);
             tcg_gen_ext32s_tl(cpu_LO[1], cpu_LO[1]);
             tcg_gen_ext32s_tl(cpu_HI[1], cpu_HI[1]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case MMI_OPC_DIVU1:
@@ -3366,18 +3269,13 @@ static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
             tcg_gen_remu_tl(cpu_HI[1], t0, t1);
             tcg_gen_ext32s_tl(cpu_LO[1], cpu_LO[1]);
             tcg_gen_ext32s_tl(cpu_HI[1], cpu_HI[1]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     default:
         MIPS_INVAL("div1 TX79");
         gen_reserved_instruction(ctx);
-        goto out;
+        break;
     }
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 #endif
 
@@ -3414,8 +3312,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_rem_tl(cpu_HI[acc], t0, t1);
             tcg_gen_ext32s_tl(cpu_LO[acc], cpu_LO[acc]);
             tcg_gen_ext32s_tl(cpu_HI[acc], cpu_HI[acc]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case OPC_DIVU:
@@ -3429,8 +3325,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_remu_tl(cpu_HI[acc], t0, t1);
             tcg_gen_ext32s_tl(cpu_LO[acc], cpu_LO[acc]);
             tcg_gen_ext32s_tl(cpu_HI[acc], cpu_HI[acc]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case OPC_MULT:
@@ -3442,8 +3336,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_muls2_i32(t2, t3, t2, t3);
             tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
             tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
     case OPC_MULTU:
@@ -3455,8 +3347,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_mulu2_i32(t2, t3, t2, t3);
             tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
             tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
 #if defined(TARGET_MIPS64)
@@ -3473,8 +3363,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
             tcg_gen_div_tl(cpu_LO[acc], t0, t1);
             tcg_gen_rem_tl(cpu_HI[acc], t0, t1);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case OPC_DDIVU:
@@ -3484,8 +3372,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_divu_i64(cpu_LO[acc], t0, t1);
             tcg_gen_remu_i64(cpu_HI[acc], t0, t1);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case OPC_DMULT:
@@ -3505,10 +3391,8 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_mul_i64(t2, t2, t3);
             tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
             tcg_gen_add_i64(t2, t2, t3);
-            tcg_temp_free_i64(t3);
             gen_move_low32(cpu_LO[acc], t2);
             gen_move_high32(cpu_HI[acc], t2);
-            tcg_temp_free_i64(t2);
         }
         break;
     case OPC_MADDU:
@@ -3523,10 +3407,8 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_mul_i64(t2, t2, t3);
             tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
             tcg_gen_add_i64(t2, t2, t3);
-            tcg_temp_free_i64(t3);
             gen_move_low32(cpu_LO[acc], t2);
             gen_move_high32(cpu_HI[acc], t2);
-            tcg_temp_free_i64(t2);
         }
         break;
     case OPC_MSUB:
@@ -3539,10 +3421,8 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_mul_i64(t2, t2, t3);
             tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
             tcg_gen_sub_i64(t2, t3, t2);
-            tcg_temp_free_i64(t3);
             gen_move_low32(cpu_LO[acc], t2);
             gen_move_high32(cpu_HI[acc], t2);
-            tcg_temp_free_i64(t2);
         }
         break;
     case OPC_MSUBU:
@@ -3557,20 +3437,15 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_mul_i64(t2, t2, t3);
             tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
             tcg_gen_sub_i64(t2, t3, t2);
-            tcg_temp_free_i64(t3);
             gen_move_low32(cpu_LO[acc], t2);
             gen_move_high32(cpu_HI[acc], t2);
-            tcg_temp_free_i64(t2);
         }
         break;
     default:
         MIPS_INVAL("mul/div");
         gen_reserved_instruction(ctx);
-        goto out;
+        break;
     }
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /*
@@ -3625,8 +3500,6 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
             }
             tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
             tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
     case MMI_OPC_MULTU1:
@@ -3644,8 +3517,6 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
             }
             tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
             tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
     case MMI_OPC_MADD1:
@@ -3661,13 +3532,11 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
             tcg_gen_mul_i64(t2, t2, t3);
             tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
             tcg_gen_add_i64(t2, t2, t3);
-            tcg_temp_free_i64(t3);
             gen_move_low32(cpu_LO[acc], t2);
             gen_move_high32(cpu_HI[acc], t2);
             if (rd) {
                 gen_move_low32(cpu_gpr[rd], t2);
             }
-            tcg_temp_free_i64(t2);
         }
         break;
     case MMI_OPC_MADDU1:
@@ -3685,24 +3554,18 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
             tcg_gen_mul_i64(t2, t2, t3);
             tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
             tcg_gen_add_i64(t2, t2, t3);
-            tcg_temp_free_i64(t3);
             gen_move_low32(cpu_LO[acc], t2);
             gen_move_high32(cpu_HI[acc], t2);
             if (rd) {
                 gen_move_low32(cpu_gpr[rd], t2);
             }
-            tcg_temp_free_i64(t2);
         }
         break;
     default:
         MIPS_INVAL("mul/madd TXx9");
         gen_reserved_instruction(ctx);
-        goto out;
+        break;
     }
-
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_cl(DisasContext *ctx, uint32_t opc,
@@ -3924,9 +3787,6 @@ static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
         break;
 #endif
     }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /* Loongson multimedia instructions */
@@ -4221,7 +4081,6 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
             tcg_gen_xor_i64(t1, t1, t2);
             tcg_gen_xor_i64(t2, t2, t0);
             tcg_gen_andc_i64(t1, t2, t1);
-            tcg_temp_free_i64(t2);
             tcg_gen_brcondi_i64(TCG_COND_GE, t1, 0, lab);
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(lab);
@@ -4242,7 +4101,6 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
             tcg_gen_xor_i64(t1, t1, t2);
             tcg_gen_xor_i64(t2, t2, t0);
             tcg_gen_and_i64(t1, t1, t2);
-            tcg_temp_free_i64(t2);
             tcg_gen_brcondi_i64(TCG_COND_GE, t1, 0, lab);
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(lab);
@@ -4284,12 +4142,8 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
             tcg_gen_extrl_i64_i32(t32, t64);
             tcg_gen_deposit_i32(fpu_fcr31, fpu_fcr31, t32,
                                 get_fp_bit(cc), 1);
-
-            tcg_temp_free_i32(t32);
-            tcg_temp_free_i64(t64);
         }
-        goto no_rd;
-        break;
+        return;
     default:
         MIPS_INVAL("loongson_cp2");
         gen_reserved_instruction(ctx);
@@ -4297,10 +4151,6 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
     }
 
     gen_store_fpr64(ctx, t0, rd);
-
-no_rd:
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 }
 
 static void gen_loongson_lswc2(DisasContext *ctx, int rt,
@@ -4328,7 +4178,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
                            ctx->default_tcg_memop_mask);
         gen_store_gpr(t1, rt);
         gen_store_gpr(t0, lsq_rt1);
-        tcg_temp_free(t1);
         break;
     case OPC_GSLQC1:
         check_cp1_enabled(ctx);
@@ -4341,7 +4190,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
                            ctx->default_tcg_memop_mask);
         gen_store_fpr64(ctx, t1, rt);
         gen_store_fpr64(ctx, t0, lsq_rt1);
-        tcg_temp_free(t1);
         break;
     case OPC_GSSQ:
         t1 = tcg_temp_new();
@@ -4353,7 +4201,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
         gen_load_gpr(t1, lsq_rt1);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
                            ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
         break;
     case OPC_GSSQC1:
         check_cp1_enabled(ctx);
@@ -4366,7 +4213,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
         gen_load_fpr64(ctx, t1, lsq_rt1);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
                            ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
         break;
 #endif
     case OPC_GSSHFL:
@@ -4390,16 +4236,13 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             gen_load_fpr32(ctx, fp0, rt);
             tcg_gen_ext_i32_tl(t1, fp0);
             tcg_gen_andc_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t1);
 #if defined(TARGET_MIPS64)
             tcg_gen_extrl_i64_i32(fp0, t0);
 #else
             tcg_gen_ext32s_tl(fp0, t0);
 #endif
             gen_store_fpr32(ctx, fp0, rt);
-            tcg_temp_free_i32(fp0);
             break;
         case OPC_GSLWRC1:
             check_cp1_enabled(ctx);
@@ -4421,16 +4264,13 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             gen_load_fpr32(ctx, fp0, rt);
             tcg_gen_ext_i32_tl(t1, fp0);
             tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t1);
 #if defined(TARGET_MIPS64)
             tcg_gen_extrl_i64_i32(fp0, t0);
 #else
             tcg_gen_ext32s_tl(fp0, t0);
 #endif
             gen_store_fpr32(ctx, fp0, rt);
-            tcg_temp_free_i32(fp0);
             break;
 #if defined(TARGET_MIPS64)
         case OPC_GSLDLC1:
@@ -4450,9 +4290,7 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             tcg_gen_shl_tl(t2, t2, t1);
             gen_load_fpr64(ctx, t1, rt);
             tcg_gen_andc_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t1);
             gen_store_fpr64(ctx, t0, rt);
             break;
         case OPC_GSLDRC1:
@@ -4473,9 +4311,7 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             tcg_gen_shl_tl(t2, t2, t1);
             gen_load_fpr64(ctx, t1, rt);
             tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t1);
             gen_store_fpr64(ctx, t0, rt);
             break;
 #endif
@@ -4495,8 +4331,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             gen_load_fpr32(ctx, fp0, rt);
             tcg_gen_ext_i32_tl(t1, fp0);
             gen_helper_0e2i(swl, t1, t0, ctx->mem_idx);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free(t1);
             break;
         case OPC_GSSWRC1:
             check_cp1_enabled(ctx);
@@ -4506,8 +4340,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             gen_load_fpr32(ctx, fp0, rt);
             tcg_gen_ext_i32_tl(t1, fp0);
             gen_helper_0e2i(swr, t1, t0, ctx->mem_idx);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free(t1);
             break;
 #if defined(TARGET_MIPS64)
         case OPC_GSSDLC1:
@@ -4516,7 +4348,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             gen_base_offset_addr(ctx, t0, rs, shf_offset);
             gen_load_fpr64(ctx, t1, rt);
             gen_helper_0e2i(sdl, t1, t0, ctx->mem_idx);
-            tcg_temp_free(t1);
             break;
         case OPC_GSSDRC1:
             check_cp1_enabled(ctx);
@@ -4524,7 +4355,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             gen_base_offset_addr(ctx, t0, rs, shf_offset);
             gen_load_fpr64(ctx, t1, rt);
             gen_helper_0e2i(sdr, t1, t0, ctx->mem_idx);
-            tcg_temp_free(t1);
             break;
 #endif
         default:
@@ -4538,7 +4368,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
         gen_reserved_instruction(ctx);
         break;
     }
-    tcg_temp_free(t0);
 }
 
 /* Loongson EXT LDC2/SDC2 */
@@ -4633,7 +4462,6 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         tcg_gen_qemu_ld_i32(fp0, t0, ctx->mem_idx, MO_TESL |
                             ctx->default_tcg_memop_mask);
         gen_store_fpr32(ctx, fp0, rt);
-        tcg_temp_free_i32(fp0);
         break;
 #if defined(TARGET_MIPS64)
     case OPC_GSLDXC1:
@@ -4650,21 +4478,18 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         t1 = tcg_temp_new();
         gen_load_gpr(t1, rt);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_SB);
-        tcg_temp_free(t1);
         break;
     case OPC_GSSHX:
         t1 = tcg_temp_new();
         gen_load_gpr(t1, rt);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUW |
                            ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
         break;
     case OPC_GSSWX:
         t1 = tcg_temp_new();
         gen_load_gpr(t1, rt);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL |
                            ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
         break;
 #if defined(TARGET_MIPS64)
     case OPC_GSSDX:
@@ -4672,7 +4497,6 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         gen_load_gpr(t1, rt);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
                            ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
         break;
 #endif
     case OPC_GSSWXC1:
@@ -4680,7 +4504,6 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         gen_load_fpr32(ctx, fp0, rt);
         tcg_gen_qemu_st_i32(fp0, t0, ctx->mem_idx, MO_TEUL |
                             ctx->default_tcg_memop_mask);
-        tcg_temp_free_i32(fp0);
         break;
 #if defined(TARGET_MIPS64)
     case OPC_GSSDXC1:
@@ -4688,14 +4511,11 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         gen_load_fpr64(ctx, t1, rt);
         tcg_gen_qemu_st_i64(t1, t0, ctx->mem_idx, MO_TEUQ |
                             ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
         break;
 #endif
     default:
         break;
     }
-
-    tcg_temp_free(t0);
 }
 
 /* Traps */
@@ -4805,8 +4625,6 @@ static void gen_trap(DisasContext *ctx, uint32_t opc,
         generate_exception(ctx, EXCP_TRAP);
         gen_set_label(l1);
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
@@ -5072,8 +4890,6 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
     if (insn_bytes == 2) {
         ctx->hflags |= MIPS_HFLAG_B16;
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 
@@ -5142,13 +4958,9 @@ static void gen_bitops(DisasContext *ctx, uint32_t opc, int rt,
 fail:
         MIPS_INVAL("bitops");
         gen_reserved_instruction(ctx);
-        tcg_temp_free(t0);
-        tcg_temp_free(t1);
         return;
     }
     gen_store_gpr(t0, rt);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
@@ -5173,8 +4985,6 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
             tcg_gen_and_tl(t0, t0, t2);
             tcg_gen_shli_tl(t0, t0, 8);
             tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t2);
-            tcg_temp_free(t1);
             tcg_gen_ext32s_tl(cpu_gpr[rd], t0);
         }
         break;
@@ -5195,8 +5005,6 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
             tcg_gen_and_tl(t0, t0, t2);
             tcg_gen_shli_tl(t0, t0, 8);
             tcg_gen_or_tl(cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t2);
-            tcg_temp_free(t1);
         }
         break;
     case OPC_DSHD:
@@ -5212,18 +5020,14 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
             tcg_gen_shri_tl(t1, t0, 32);
             tcg_gen_shli_tl(t0, t0, 32);
             tcg_gen_or_tl(cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t2);
-            tcg_temp_free(t1);
         }
         break;
 #endif
     default:
         MIPS_INVAL("bsfhl");
         gen_reserved_instruction(ctx);
-        tcg_temp_free(t0);
         return;
     }
-    tcg_temp_free(t0);
 }
 
 static void gen_align_bits(DisasContext *ctx, int wordsz, int rd, int rs,
@@ -5262,7 +5066,6 @@ static void gen_align_bits(DisasContext *ctx, int wordsz, int rd, int rs,
                 tcg_gen_concat_tl_i64(t2, t1, t0);
                 tcg_gen_shri_i64(t2, t2, 32 - bits);
                 gen_move_low32(cpu_gpr[rd], t2);
-                tcg_temp_free_i64(t2);
             }
             break;
 #if defined(TARGET_MIPS64)
@@ -5273,10 +5076,7 @@ static void gen_align_bits(DisasContext *ctx, int wordsz, int rd, int rs,
             break;
 #endif
         }
-        tcg_temp_free(t1);
     }
-
-    tcg_temp_free(t0);
 }
 
 void gen_align(DisasContext *ctx, int wordsz, int rd, int rs, int rt, int bp)
@@ -5303,7 +5103,6 @@ static void gen_bitswap(DisasContext *ctx, int opc, int rd, int rt)
         break;
 #endif
     }
-    tcg_temp_free(t0);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -5321,8 +5120,6 @@ static inline void gen_mthc0_entrylo(TCGv arg, target_ulong off)
     tcg_gen_concat32_i64(t1, t1, t0);
 #endif
     tcg_gen_st_i64(t1, cpu_env, off);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t0);
 }
 
 static inline void gen_mthc0_store64(TCGv arg, target_ulong off)
@@ -5334,8 +5131,6 @@ static inline void gen_mthc0_store64(TCGv arg, target_ulong off)
     tcg_gen_ld_i64(t1, cpu_env, off);
     tcg_gen_concat32_i64(t1, t1, t0);
     tcg_gen_st_i64(t1, cpu_env, off);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t0);
 }
 
 static inline void gen_mfhc0_entrylo(TCGv arg, target_ulong off)
@@ -5349,7 +5144,6 @@ static inline void gen_mfhc0_entrylo(TCGv arg, target_ulong off)
     tcg_gen_shri_i64(t0, t0, 32);
 #endif
     gen_move_low32(arg, t0);
-    tcg_temp_free_i64(t0);
 }
 
 static inline void gen_mfhc0_load64(TCGv arg, target_ulong off, int shift)
@@ -5359,7 +5153,6 @@ static inline void gen_mfhc0_load64(TCGv arg, target_ulong off, int shift)
     tcg_gen_ld_i64(t0, cpu_env, off);
     tcg_gen_shri_i64(t0, t0, 32 + shift);
     gen_move_low32(arg, t0);
-    tcg_temp_free_i64(t0);
 }
 
 static inline void gen_mfc0_load32(TCGv arg, target_ulong off)
@@ -5368,7 +5161,6 @@ static inline void gen_mfc0_load32(TCGv arg, target_ulong off)
 
     tcg_gen_ld_i32(t0, cpu_env, off);
     tcg_gen_ext_i32_tl(arg, t0);
-    tcg_temp_free_i32(t0);
 }
 
 static inline void gen_mfc0_load64(TCGv arg, target_ulong off)
@@ -5383,7 +5175,6 @@ static inline void gen_mtc0_store32(TCGv arg, target_ulong off)
 
     tcg_gen_trunc_tl_i32(t0, arg);
     tcg_gen_st_i32(t0, cpu_env, off);
-    tcg_temp_free_i32(t0);
 }
 
 #define CP0_CHECK(c)                            \
@@ -5705,7 +5496,6 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
                 }
 #endif
                 gen_move_low32(arg, tmp);
-                tcg_temp_free_i64(tmp);
             }
             register_name = "EntryLo0";
             break;
@@ -5763,7 +5553,6 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
                 }
 #endif
                 gen_move_low32(arg, tmp);
-                tcg_temp_free_i64(tmp);
             }
             register_name = "EntryLo1";
             break;
@@ -6292,7 +6081,6 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
                 TCGv_i64 tmp = tcg_temp_new_i64();
                 tcg_gen_ld_i64(tmp, cpu_env, offsetof(CPUMIPSState, CP0_TagLo));
                 gen_move_low32(arg, tmp);
-                tcg_temp_free_i64(tmp);
             }
             register_name = "TagLo";
             break;
@@ -8813,13 +8601,11 @@ static void gen_mftr(CPUMIPSState *env, DisasContext *ctx, int rt, int rd,
 
                 gen_load_fpr32(ctx, fp0, rt);
                 tcg_gen_ext_i32_tl(t0, fp0);
-                tcg_temp_free_i32(fp0);
             } else {
                 TCGv_i32 fp0 = tcg_temp_new_i32();
 
                 gen_load_fpr32h(ctx, fp0, rt);
                 tcg_gen_ext_i32_tl(t0, fp0);
-                tcg_temp_free_i32(fp0);
             }
             break;
         case 3:
@@ -8836,11 +8622,9 @@ static void gen_mftr(CPUMIPSState *env, DisasContext *ctx, int rt, int rd,
     }
     trace_mips_translate_tr("mftr", rt, u, sel, h);
     gen_store_gpr(t0, rd);
-    tcg_temp_free(t0);
     return;
 
 die:
-    tcg_temp_free(t0);
     LOG_DISAS("mftr (reg %d u %d sel %d h %d)\n", rt, u, sel, h);
     gen_reserved_instruction(ctx);
 }
@@ -9017,13 +8801,11 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
 
                 tcg_gen_trunc_tl_i32(fp0, t0);
                 gen_store_fpr32(ctx, fp0, rd);
-                tcg_temp_free_i32(fp0);
             } else {
                 TCGv_i32 fp0 = tcg_temp_new_i32();
 
                 tcg_gen_trunc_tl_i32(fp0, t0);
                 gen_store_fpr32h(ctx, fp0, rd);
-                tcg_temp_free_i32(fp0);
             }
             break;
         case 3:
@@ -9041,11 +8823,9 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
         }
     }
     trace_mips_translate_tr("mttr", rd, u, sel, h);
-    tcg_temp_free(t0);
     return;
 
 die:
-    tcg_temp_free(t0);
     LOG_DISAS("mttr (reg %d u %d sel %d h %d)\n", rd, u, sel, h);
     gen_reserved_instruction(ctx);
 }
@@ -9071,7 +8851,6 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
 
             gen_load_gpr(t0, rt);
             gen_mtc0(ctx, t0, rd, ctx->opcode & 0x7);
-            tcg_temp_free(t0);
         }
         opn = "mtc0";
         break;
@@ -9092,7 +8871,6 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
 
             gen_load_gpr(t0, rt);
             gen_dmtc0(ctx, t0, rd, ctx->opcode & 0x7);
-            tcg_temp_free(t0);
         }
         opn = "dmtc0";
         break;
@@ -9112,7 +8890,6 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
             TCGv t0 = tcg_temp_new();
             gen_load_gpr(t0, rt);
             gen_mthc0(ctx, t0, rd, ctx->opcode & 0x7);
-            tcg_temp_free(t0);
         }
         opn = "mthc0";
         break;
@@ -9246,7 +9023,7 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
 
     if ((ctx->insn_flags & ISA_MIPS_R6) && (ctx->hflags & MIPS_HFLAG_BMASK)) {
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
 
     if (cc != 0) {
@@ -9286,7 +9063,6 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
             tcg_gen_shri_i32(t0, fpu_fcr31, get_fp_bit(cc));
             tcg_gen_shri_i32(t1, fpu_fcr31, get_fp_bit(cc + 1));
             tcg_gen_nand_i32(t0, t0, t1);
-            tcg_temp_free_i32(t1);
             tcg_gen_andi_i32(t0, t0, 1);
             tcg_gen_extu_i32_tl(bcond, t0);
         }
@@ -9297,7 +9073,6 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
             tcg_gen_shri_i32(t0, fpu_fcr31, get_fp_bit(cc));
             tcg_gen_shri_i32(t1, fpu_fcr31, get_fp_bit(cc + 1));
             tcg_gen_or_i32(t0, t0, t1);
-            tcg_temp_free_i32(t1);
             tcg_gen_andi_i32(t0, t0, 1);
             tcg_gen_extu_i32_tl(bcond, t0);
         }
@@ -9312,7 +9087,6 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
             tcg_gen_and_i32(t0, t0, t1);
             tcg_gen_shri_i32(t1, fpu_fcr31, get_fp_bit(cc + 3));
             tcg_gen_nand_i32(t0, t0, t1);
-            tcg_temp_free_i32(t1);
             tcg_gen_andi_i32(t0, t0, 1);
             tcg_gen_extu_i32_tl(bcond, t0);
         }
@@ -9327,7 +9101,6 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
             tcg_gen_or_i32(t0, t0, t1);
             tcg_gen_shri_i32(t1, fpu_fcr31, get_fp_bit(cc + 3));
             tcg_gen_or_i32(t0, t0, t1);
-            tcg_temp_free_i32(t1);
             tcg_gen_andi_i32(t0, t0, 1);
             tcg_gen_extu_i32_tl(bcond, t0);
         }
@@ -9337,12 +9110,10 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
     default:
         MIPS_INVAL("cp1 cond branch");
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
     ctx->btarget = btarget;
     ctx->hflags |= MIPS_HFLAG_BDS32;
- out:
-    tcg_temp_free_i32(t0);
 }
 
 /* R6 CP1 Branches */
@@ -9359,7 +9130,7 @@ static void gen_compute_branch1_r6(DisasContext *ctx, uint32_t op,
                   "\n", ctx->base.pc_next);
 #endif
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
 
     gen_load_fpr64(ctx, t0, ft);
@@ -9379,7 +9150,7 @@ static void gen_compute_branch1_r6(DisasContext *ctx, uint32_t op,
     default:
         MIPS_INVAL("cp1 cond branch");
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
 
     tcg_gen_trunc_i64_tl(bcond, t0);
@@ -9394,9 +9165,6 @@ static void gen_compute_branch1_r6(DisasContext *ctx, uint32_t op,
         ctx->hflags |= MIPS_HFLAG_BDS32;
         break;
     }
-
-out:
-    tcg_temp_free_i64(t0);
 }
 
 /* Coprocessor 1 (FPU) */
@@ -9624,7 +9392,6 @@ static void gen_cp1(DisasContext *ctx, uint32_t opc, int rt, int fs)
 
             gen_load_fpr32(ctx, fp0, fs);
             tcg_gen_ext_i32_tl(t0, fp0);
-            tcg_temp_free_i32(fp0);
         }
         gen_store_gpr(t0, rt);
         break;
@@ -9635,7 +9402,6 @@ static void gen_cp1(DisasContext *ctx, uint32_t opc, int rt, int fs)
 
             tcg_gen_trunc_tl_i32(fp0, t0);
             gen_store_fpr32(ctx, fp0, fs);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_CFC1:
@@ -9665,7 +9431,6 @@ static void gen_cp1(DisasContext *ctx, uint32_t opc, int rt, int fs)
 
             gen_load_fpr32h(ctx, fp0, fs);
             tcg_gen_ext_i32_tl(t0, fp0);
-            tcg_temp_free_i32(fp0);
         }
         gen_store_gpr(t0, rt);
         break;
@@ -9676,17 +9441,13 @@ static void gen_cp1(DisasContext *ctx, uint32_t opc, int rt, int fs)
 
             tcg_gen_trunc_tl_i32(fp0, t0);
             gen_store_fpr32h(ctx, fp0, fs);
-            tcg_temp_free_i32(fp0);
         }
         break;
     default:
         MIPS_INVAL("cp1 move");
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
-
- out:
-    tcg_temp_free(t0);
 }
 
 static void gen_movci(DisasContext *ctx, int rd, int rs, int cc, int tf)
@@ -9710,7 +9471,6 @@ static void gen_movci(DisasContext *ctx, int rd, int rs, int cc, int tf)
     t0 = tcg_temp_new_i32();
     tcg_gen_andi_i32(t0, fpu_fcr31, 1 << get_fp_bit(cc));
     tcg_gen_brcondi_i32(cond, t0, 0, l1);
-    tcg_temp_free_i32(t0);
     gen_load_gpr(cpu_gpr[rd], rs);
     gen_set_label(l1);
 }
@@ -9733,7 +9493,6 @@ static inline void gen_movcf_s(DisasContext *ctx, int fs, int fd, int cc,
     gen_load_fpr32(ctx, t0, fs);
     gen_store_fpr32(ctx, t0, fd);
     gen_set_label(l1);
-    tcg_temp_free_i32(t0);
 }
 
 static inline void gen_movcf_d(DisasContext *ctx, int fs, int fd, int cc,
@@ -9752,11 +9511,9 @@ static inline void gen_movcf_d(DisasContext *ctx, int fs, int fd, int cc,
 
     tcg_gen_andi_i32(t0, fpu_fcr31, 1 << get_fp_bit(cc));
     tcg_gen_brcondi_i32(cond, t0, 0, l1);
-    tcg_temp_free_i32(t0);
     fp0 = tcg_temp_new_i64();
     gen_load_fpr64(ctx, fp0, fs);
     gen_store_fpr64(ctx, fp0, fd);
-    tcg_temp_free_i64(fp0);
     gen_set_label(l1);
 }
 
@@ -9784,7 +9541,6 @@ static inline void gen_movcf_ps(DisasContext *ctx, int fs, int fd,
     tcg_gen_brcondi_i32(cond, t0, 0, l2);
     gen_load_fpr32h(ctx, t0, fs);
     gen_store_fpr32h(ctx, t0, fd);
-    tcg_temp_free_i32(t0);
     gen_set_label(l2);
 }
 
@@ -9819,10 +9575,6 @@ static void gen_sel_s(DisasContext *ctx, enum fopcode op1, int fd, int ft,
     }
 
     gen_store_fpr32(ctx, fp0, fd);
-    tcg_temp_free_i32(fp2);
-    tcg_temp_free_i32(fp1);
-    tcg_temp_free_i32(fp0);
-    tcg_temp_free_i32(t1);
 }
 
 static void gen_sel_d(DisasContext *ctx, enum fopcode op1, int fd, int ft,
@@ -9856,10 +9608,6 @@ static void gen_sel_d(DisasContext *ctx, enum fopcode op1, int fd, int ft,
     }
 
     gen_store_fpr64(ctx, fp0, fd);
-    tcg_temp_free_i64(fp2);
-    tcg_temp_free_i64(fp1);
-    tcg_temp_free_i64(fp0);
-    tcg_temp_free_i64(t1);
 }
 
 static void gen_farith(DisasContext *ctx, enum fopcode op1,
@@ -9875,9 +9623,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_add_s(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_SUB_S:
@@ -9888,9 +9634,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_sub_s(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_MUL_S:
@@ -9901,9 +9645,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_mul_s(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_DIV_S:
@@ -9914,9 +9656,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_div_s(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_SQRT_S:
@@ -9926,7 +9666,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_sqrt_s(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_ABS_S:
@@ -9940,7 +9679,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_abs_s(fp0, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_MOV_S:
@@ -9949,7 +9687,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr32(ctx, fp0, fs);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_NEG_S:
@@ -9963,7 +9700,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_chs_s(fp0, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_ROUND_L_S:
@@ -9978,9 +9714,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_round_l_s(fp64, cpu_env, fp32);
             }
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_TRUNC_L_S:
@@ -9995,9 +9729,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_trunc_l_s(fp64, cpu_env, fp32);
             }
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_CEIL_L_S:
@@ -10012,9 +9744,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_ceil_l_s(fp64, cpu_env, fp32);
             }
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_FLOOR_L_S:
@@ -10029,9 +9759,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_floor_l_s(fp64, cpu_env, fp32);
             }
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_ROUND_W_S:
@@ -10045,7 +9773,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_round_w_s(fp0, cpu_env, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_TRUNC_W_S:
@@ -10059,7 +9786,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_trunc_w_s(fp0, cpu_env, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_CEIL_W_S:
@@ -10073,7 +9799,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_ceil_w_s(fp0, cpu_env, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_FLOOR_W_S:
@@ -10087,7 +9812,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_floor_w_s(fp0, cpu_env, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_SEL_S:
@@ -10118,7 +9842,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             fp0 = tcg_temp_new_i32();
             gen_load_fpr32(ctx, fp0, fs);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
             gen_set_label(l1);
         }
         break;
@@ -10133,7 +9856,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 fp0 = tcg_temp_new_i32();
                 gen_load_fpr32(ctx, fp0, fs);
                 gen_store_fpr32(ctx, fp0, fd);
-                tcg_temp_free_i32(fp0);
                 gen_set_label(l1);
             }
         }
@@ -10145,7 +9867,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_recip_s(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_RSQRT_S:
@@ -10155,7 +9876,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_rsqrt_s(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_MADDF_S:
@@ -10169,9 +9889,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp2, fd);
             gen_helper_float_maddf_s(fp2, cpu_env, fp0, fp1, fp2);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
-            tcg_temp_free_i32(fp1);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_MSUBF_S:
@@ -10185,9 +9902,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp2, fd);
             gen_helper_float_msubf_s(fp2, cpu_env, fp0, fp1, fp2);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
-            tcg_temp_free_i32(fp1);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_RINT_S:
@@ -10197,7 +9911,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_rint_s(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_CLASS_S:
@@ -10207,7 +9920,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_class_s(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_MIN_S: /* OPC_RECIP2_S */
@@ -10220,9 +9932,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_min_s(fp2, cpu_env, fp0, fp1);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
-            tcg_temp_free_i32(fp1);
-            tcg_temp_free_i32(fp0);
         } else {
             /* OPC_RECIP2_S */
             check_cp1_64bitmode(ctx);
@@ -10233,9 +9942,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr32(ctx, fp0, fs);
                 gen_load_fpr32(ctx, fp1, ft);
                 gen_helper_float_recip2_s(fp0, cpu_env, fp0, fp1);
-                tcg_temp_free_i32(fp1);
                 gen_store_fpr32(ctx, fp0, fd);
-                tcg_temp_free_i32(fp0);
             }
         }
         break;
@@ -10249,9 +9956,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_mina_s(fp2, cpu_env, fp0, fp1);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
-            tcg_temp_free_i32(fp1);
-            tcg_temp_free_i32(fp0);
         } else {
             /* OPC_RECIP1_S */
             check_cp1_64bitmode(ctx);
@@ -10261,7 +9965,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr32(ctx, fp0, fs);
                 gen_helper_float_recip1_s(fp0, cpu_env, fp0);
                 gen_store_fpr32(ctx, fp0, fd);
-                tcg_temp_free_i32(fp0);
             }
         }
         break;
@@ -10274,8 +9977,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_max_s(fp1, cpu_env, fp0, fp1);
             gen_store_fpr32(ctx, fp1, fd);
-            tcg_temp_free_i32(fp1);
-            tcg_temp_free_i32(fp0);
         } else {
             /* OPC_RSQRT1_S */
             check_cp1_64bitmode(ctx);
@@ -10285,7 +9986,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr32(ctx, fp0, fs);
                 gen_helper_float_rsqrt1_s(fp0, cpu_env, fp0);
                 gen_store_fpr32(ctx, fp0, fd);
-                tcg_temp_free_i32(fp0);
             }
         }
         break;
@@ -10298,8 +9998,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_maxa_s(fp1, cpu_env, fp0, fp1);
             gen_store_fpr32(ctx, fp1, fd);
-            tcg_temp_free_i32(fp1);
-            tcg_temp_free_i32(fp0);
         } else {
             /* OPC_RSQRT2_S */
             check_cp1_64bitmode(ctx);
@@ -10310,9 +10008,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr32(ctx, fp0, fs);
                 gen_load_fpr32(ctx, fp1, ft);
                 gen_helper_float_rsqrt2_s(fp0, cpu_env, fp0, fp1);
-                tcg_temp_free_i32(fp1);
                 gen_store_fpr32(ctx, fp0, fd);
-                tcg_temp_free_i32(fp0);
             }
         }
         break;
@@ -10324,9 +10020,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr32(ctx, fp32, fs);
             gen_helper_float_cvtd_s(fp64, cpu_env, fp32);
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_CVT_W_S:
@@ -10340,7 +10034,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_cvt_w_s(fp0, cpu_env, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_CVT_L_S:
@@ -10355,9 +10048,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_cvt_l_s(fp64, cpu_env, fp32);
             }
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_CVT_PS_S:
@@ -10370,10 +10061,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp32_0, fs);
             gen_load_fpr32(ctx, fp32_1, ft);
             tcg_gen_concat_i32_i64(fp64, fp32_1, fp32_0);
-            tcg_temp_free_i32(fp32_1);
-            tcg_temp_free_i32(fp32_0);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_CMP_F_S:
@@ -10408,9 +10096,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_add_d(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_SUB_D:
@@ -10422,9 +10108,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_sub_d(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MUL_D:
@@ -10436,9 +10120,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_mul_d(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_DIV_D:
@@ -10450,9 +10132,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_div_d(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_SQRT_D:
@@ -10463,7 +10143,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_sqrt_d(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_ABS_D:
@@ -10478,7 +10157,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_abs_d(fp0, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MOV_D:
@@ -10488,7 +10166,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr64(ctx, fp0, fs);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_NEG_D:
@@ -10503,7 +10180,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_chs_d(fp0, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_ROUND_L_D:
@@ -10518,7 +10194,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_round_l_d(fp0, cpu_env, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_TRUNC_L_D:
@@ -10533,7 +10208,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_trunc_l_d(fp0, cpu_env, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_CEIL_L_D:
@@ -10548,7 +10222,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_ceil_l_d(fp0, cpu_env, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_FLOOR_L_D:
@@ -10563,7 +10236,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_floor_l_d(fp0, cpu_env, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_ROUND_W_D:
@@ -10578,9 +10250,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_round_w_d(fp32, cpu_env, fp64);
             }
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_TRUNC_W_D:
@@ -10595,9 +10265,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_trunc_w_d(fp32, cpu_env, fp64);
             }
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_CEIL_W_D:
@@ -10612,9 +10280,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_ceil_w_d(fp32, cpu_env, fp64);
             }
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_FLOOR_W_D:
@@ -10629,9 +10295,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_floor_w_d(fp32, cpu_env, fp64);
             }
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_SEL_D:
@@ -10662,7 +10326,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             fp0 = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp0, fs);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
             gen_set_label(l1);
         }
         break;
@@ -10677,7 +10340,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 fp0 = tcg_temp_new_i64();
                 gen_load_fpr64(ctx, fp0, fs);
                 gen_store_fpr64(ctx, fp0, fd);
-                tcg_temp_free_i64(fp0);
                 gen_set_label(l1);
             }
         }
@@ -10690,7 +10352,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_recip_d(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_RSQRT_D:
@@ -10701,7 +10362,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_rsqrt_d(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MADDF_D:
@@ -10715,9 +10375,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp2, fd);
             gen_helper_float_maddf_d(fp2, cpu_env, fp0, fp1, fp2);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
-            tcg_temp_free_i64(fp1);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MSUBF_D:
@@ -10731,9 +10388,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp2, fd);
             gen_helper_float_msubf_d(fp2, cpu_env, fp0, fp1, fp2);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
-            tcg_temp_free_i64(fp1);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_RINT_D:
@@ -10743,7 +10397,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_rint_d(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_CLASS_D:
@@ -10753,7 +10406,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_class_d(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MIN_D: /* OPC_RECIP2_D */
@@ -10765,8 +10417,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_min_d(fp1, cpu_env, fp0, fp1);
             gen_store_fpr64(ctx, fp1, fd);
-            tcg_temp_free_i64(fp1);
-            tcg_temp_free_i64(fp0);
         } else {
             /* OPC_RECIP2_D */
             check_cp1_64bitmode(ctx);
@@ -10777,9 +10427,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr64(ctx, fp0, fs);
                 gen_load_fpr64(ctx, fp1, ft);
                 gen_helper_float_recip2_d(fp0, cpu_env, fp0, fp1);
-                tcg_temp_free_i64(fp1);
                 gen_store_fpr64(ctx, fp0, fd);
-                tcg_temp_free_i64(fp0);
             }
         }
         break;
@@ -10792,8 +10440,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_mina_d(fp1, cpu_env, fp0, fp1);
             gen_store_fpr64(ctx, fp1, fd);
-            tcg_temp_free_i64(fp1);
-            tcg_temp_free_i64(fp0);
         } else {
             /* OPC_RECIP1_D */
             check_cp1_64bitmode(ctx);
@@ -10803,7 +10449,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr64(ctx, fp0, fs);
                 gen_helper_float_recip1_d(fp0, cpu_env, fp0);
                 gen_store_fpr64(ctx, fp0, fd);
-                tcg_temp_free_i64(fp0);
             }
         }
         break;
@@ -10816,8 +10461,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_max_d(fp1, cpu_env, fp0, fp1);
             gen_store_fpr64(ctx, fp1, fd);
-            tcg_temp_free_i64(fp1);
-            tcg_temp_free_i64(fp0);
         } else {
             /* OPC_RSQRT1_D */
             check_cp1_64bitmode(ctx);
@@ -10827,7 +10470,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr64(ctx, fp0, fs);
                 gen_helper_float_rsqrt1_d(fp0, cpu_env, fp0);
                 gen_store_fpr64(ctx, fp0, fd);
-                tcg_temp_free_i64(fp0);
             }
         }
         break;
@@ -10840,8 +10482,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_maxa_d(fp1, cpu_env, fp0, fp1);
             gen_store_fpr64(ctx, fp1, fd);
-            tcg_temp_free_i64(fp1);
-            tcg_temp_free_i64(fp0);
         } else {
             /* OPC_RSQRT2_D */
             check_cp1_64bitmode(ctx);
@@ -10852,9 +10492,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr64(ctx, fp0, fs);
                 gen_load_fpr64(ctx, fp1, ft);
                 gen_helper_float_rsqrt2_d(fp0, cpu_env, fp0, fp1);
-                tcg_temp_free_i64(fp1);
                 gen_store_fpr64(ctx, fp0, fd);
-                tcg_temp_free_i64(fp0);
             }
         }
         break;
@@ -10889,9 +10527,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr64(ctx, fp64, fs);
             gen_helper_float_cvts_d(fp32, cpu_env, fp64);
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_CVT_W_D:
@@ -10906,9 +10542,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_cvt_w_d(fp32, cpu_env, fp64);
             }
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_CVT_L_D:
@@ -10923,7 +10557,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_cvt_l_d(fp0, cpu_env, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_CVT_S_W:
@@ -10933,7 +10566,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_cvts_w(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_CVT_D_W:
@@ -10944,9 +10576,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr32(ctx, fp32, fs);
             gen_helper_float_cvtd_w(fp64, cpu_env, fp32);
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_CVT_S_L:
@@ -10957,9 +10587,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr64(ctx, fp64, fs);
             gen_helper_float_cvts_l(fp32, cpu_env, fp64);
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_CVT_D_L:
@@ -10970,7 +10598,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_cvtd_l(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_CVT_PS_PW:
@@ -10981,7 +10608,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_cvtps_pw(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_ADD_PS:
@@ -10993,9 +10619,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_add_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_SUB_PS:
@@ -11007,9 +10631,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_sub_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MUL_PS:
@@ -11021,9 +10643,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_mul_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_ABS_PS:
@@ -11034,7 +10654,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_abs_ps(fp0, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MOV_PS:
@@ -11044,7 +10663,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr64(ctx, fp0, fs);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_NEG_PS:
@@ -11055,7 +10673,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_chs_ps(fp0, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MOVCF_PS:
@@ -11074,7 +10691,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             fp0 = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp0, fs);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
             gen_set_label(l1);
         }
         break;
@@ -11089,7 +10705,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 fp0 = tcg_temp_new_i64();
                 gen_load_fpr64(ctx, fp0, fs);
                 gen_store_fpr64(ctx, fp0, fd);
-                tcg_temp_free_i64(fp0);
                 gen_set_label(l1);
             }
         }
@@ -11103,9 +10718,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, ft);
             gen_load_fpr64(ctx, fp1, fs);
             gen_helper_float_addr_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MULR_PS:
@@ -11117,9 +10730,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, ft);
             gen_load_fpr64(ctx, fp1, fs);
             gen_helper_float_mulr_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_RECIP2_PS:
@@ -11131,9 +10742,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_recip2_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_RECIP1_PS:
@@ -11144,7 +10753,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_recip1_ps(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_RSQRT1_PS:
@@ -11155,7 +10763,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_rsqrt1_ps(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_RSQRT2_PS:
@@ -11167,9 +10774,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_rsqrt2_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_CVT_S_PU:
@@ -11180,7 +10785,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32h(ctx, fp0, fs);
             gen_helper_float_cvts_pu(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_CVT_PW_PS:
@@ -11191,7 +10795,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_cvtpw_ps(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_CVT_S_PL:
@@ -11202,7 +10805,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_cvts_pl(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_PLL_PS:
@@ -11215,8 +10817,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp1, ft);
             gen_store_fpr32h(ctx, fp0, fd);
             gen_store_fpr32(ctx, fp1, fd);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
         }
         break;
     case OPC_PLU_PS:
@@ -11229,8 +10829,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32h(ctx, fp1, ft);
             gen_store_fpr32(ctx, fp1, fd);
             gen_store_fpr32h(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
         }
         break;
     case OPC_PUL_PS:
@@ -11243,8 +10841,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp1, ft);
             gen_store_fpr32(ctx, fp1, fd);
             gen_store_fpr32h(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
         }
         break;
     case OPC_PUU_PS:
@@ -11257,8 +10853,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32h(ctx, fp1, ft);
             gen_store_fpr32(ctx, fp1, fd);
             gen_store_fpr32h(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
         }
         break;
     case OPC_CMP_F_PS:
@@ -11316,7 +10910,6 @@ static void gen_flt3_ldst(DisasContext *ctx, uint32_t opc,
             tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TESL);
             tcg_gen_trunc_tl_i32(fp0, t0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_LDXC1:
@@ -11326,7 +10919,6 @@ static void gen_flt3_ldst(DisasContext *ctx, uint32_t opc,
             TCGv_i64 fp0 = tcg_temp_new_i64();
             tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEUQ);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_LUXC1:
@@ -11337,7 +10929,6 @@ static void gen_flt3_ldst(DisasContext *ctx, uint32_t opc,
 
             tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEUQ);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_SWXC1:
@@ -11346,7 +10937,6 @@ static void gen_flt3_ldst(DisasContext *ctx, uint32_t opc,
             TCGv_i32 fp0 = tcg_temp_new_i32();
             gen_load_fpr32(ctx, fp0, fs);
             tcg_gen_qemu_st_i32(fp0, t0, ctx->mem_idx, MO_TEUL);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_SDXC1:
@@ -11356,7 +10946,6 @@ static void gen_flt3_ldst(DisasContext *ctx, uint32_t opc,
             TCGv_i64 fp0 = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp0, fs);
             tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEUQ);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_SUXC1:
@@ -11366,11 +10955,9 @@ static void gen_flt3_ldst(DisasContext *ctx, uint32_t opc,
             TCGv_i64 fp0 = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp0, fs);
             tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEUQ);
-            tcg_temp_free_i64(fp0);
         }
         break;
     }
-    tcg_temp_free(t0);
 }
 
 static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
@@ -11397,7 +10984,6 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             tcg_gen_br(l2);
             gen_set_label(l1);
             tcg_gen_brcondi_tl(TCG_COND_NE, t0, 4, l2);
-            tcg_temp_free(t0);
             if (cpu_is_bigendian(ctx)) {
                 gen_load_fpr32(ctx, fp, fs);
                 gen_load_fpr32h(ctx, fph, ft);
@@ -11410,8 +10996,6 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
                 gen_store_fpr32h(ctx, fp, fd);
             }
             gen_set_label(l2);
-            tcg_temp_free_i32(fp);
-            tcg_temp_free_i32(fph);
         }
         break;
     case OPC_MADD_S:
@@ -11425,10 +11009,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr32(ctx, fp1, ft);
             gen_load_fpr32(ctx, fp2, fr);
             gen_helper_float_madd_s(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
         }
         break;
     case OPC_MADD_D:
@@ -11443,10 +11024,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_madd_d(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_MADD_PS:
@@ -11460,10 +11038,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_madd_ps(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_MSUB_S:
@@ -11477,10 +11052,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr32(ctx, fp1, ft);
             gen_load_fpr32(ctx, fp2, fr);
             gen_helper_float_msub_s(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
         }
         break;
     case OPC_MSUB_D:
@@ -11495,10 +11067,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_msub_d(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_MSUB_PS:
@@ -11512,10 +11081,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_msub_ps(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_NMADD_S:
@@ -11529,10 +11095,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr32(ctx, fp1, ft);
             gen_load_fpr32(ctx, fp2, fr);
             gen_helper_float_nmadd_s(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
         }
         break;
     case OPC_NMADD_D:
@@ -11547,10 +11110,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_nmadd_d(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_NMADD_PS:
@@ -11564,10 +11124,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_nmadd_ps(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_NMSUB_S:
@@ -11581,10 +11138,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr32(ctx, fp1, ft);
             gen_load_fpr32(ctx, fp2, fr);
             gen_helper_float_nmsub_s(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
         }
         break;
     case OPC_NMSUB_D:
@@ -11599,10 +11153,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_nmsub_d(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_NMSUB_PS:
@@ -11616,10 +11167,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_nmsub_ps(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     default:
@@ -11708,7 +11256,6 @@ void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel)
         gen_reserved_instruction(ctx);
         break;
     }
-    tcg_temp_free(t0);
 }
 
 static inline void clear_branch_hflags(DisasContext *ctx)
@@ -11767,11 +11314,9 @@ static void gen_branch(DisasContext *ctx, int insn_bytes)
 
                 tcg_gen_andi_tl(t0, btarget, 0x1);
                 tcg_gen_trunc_tl_i32(t1, t0);
-                tcg_temp_free(t0);
                 tcg_gen_andi_i32(hflags, hflags, ~(uint32_t)MIPS_HFLAG_M16);
                 tcg_gen_shli_i32(t1, t1, MIPS_HFLAG_M16_SHIFT);
                 tcg_gen_or_i32(hflags, hflags, t1);
-                tcg_temp_free_i32(t1);
 
                 tcg_gen_andi_tl(cpu_PC, btarget, ~(target_ulong)0x1);
             } else {
@@ -11801,7 +11346,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
                   "\n", ctx->base.pc_next);
 #endif
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
 
     /* Load needed operands and calculate btarget */
@@ -11855,13 +11400,12 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
 
             gen_load_gpr(tbase, rt);
             gen_op_addr_add(ctx, btarget, tbase, toffset);
-            tcg_temp_free(tbase);
         }
         break;
     default:
         MIPS_INVAL("Compact branch/jump");
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
 
     if (bcond_compute == 0) {
@@ -11882,7 +11426,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
         default:
             MIPS_INVAL("Compact branch/jump");
             gen_reserved_instruction(ctx);
-            goto out;
+            return;
         }
 
         /* Generating branch here as compact branches don't have delay slot */
@@ -11972,10 +11516,6 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
                     /* OPC_BNVC */
                     tcg_gen_brcondi_tl(tcg_invert_cond(TCG_COND_EQ), t4, 0, fs);
                 }
-                tcg_temp_free(input_overflow);
-                tcg_temp_free(t4);
-                tcg_temp_free(t3);
-                tcg_temp_free(t2);
             } else if (rs < rt && rs == 0) {
                 /* OPC_BEQZALC, OPC_BNEZALC */
                 if (opc == OPC_BEQZALC) {
@@ -12005,7 +11545,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
         default:
             MIPS_INVAL("Compact conditional branch/jump");
             gen_reserved_instruction(ctx);
-            goto out;
+            return;
         }
 
         /* Generating branch here as compact branches don't have delay slot */
@@ -12014,10 +11554,6 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
 
         ctx->hflags |= MIPS_HFLAG_FBNSLOT;
     }
-
-out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 void gen_addiupc(DisasContext *ctx, int rx, int imm,
@@ -12037,8 +11573,6 @@ void gen_addiupc(DisasContext *ctx, int rx, int imm,
     if (!is_64_bit) {
         tcg_gen_ext32s_tl(cpu_gpr[rx], cpu_gpr[rx]);
     }
-
-    tcg_temp_free(t0);
 }
 
 static void gen_cache_operation(DisasContext *ctx, uint32_t op, int base,
@@ -12048,8 +11582,6 @@ static void gen_cache_operation(DisasContext *ctx, uint32_t op, int base,
     TCGv t1 = tcg_temp_new();
     gen_base_offset_addr(ctx, t1, base, offset);
     gen_helper_cache(cpu_env, t1, t0);
-    tcg_temp_free(t1);
-    tcg_temp_free_i32(t0);
 }
 
 static inline bool is_uhi(DisasContext *ctx, int sdbbp_code)
@@ -12077,9 +11609,6 @@ void gen_ldxs(DisasContext *ctx, int base, int index, int rd)
 
     tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TESL);
     gen_store_gpr(t1, rd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_sync(int stype)
@@ -12183,7 +11712,6 @@ static void gen_mips_lx(DisasContext *ctx, uint32_t opc,
         break;
 #endif
     }
-    tcg_temp_free(t0);
 }
 
 static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
@@ -12397,7 +11925,6 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
                 TCGv_i32 sa_t = tcg_const_i32(v2);
                 gen_helper_precr_sra_ph_w(cpu_gpr[ret], sa_t, v1_t,
                                           cpu_gpr[ret]);
-                tcg_temp_free_i32(sa_t);
                 break;
             }
         case OPC_PRECR_SRA_R_PH_W:
@@ -12406,7 +11933,6 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
                 TCGv_i32 sa_t = tcg_const_i32(v2);
                 gen_helper_precr_sra_r_ph_w(cpu_gpr[ret], sa_t, v1_t,
                                             cpu_gpr[ret]);
-                tcg_temp_free_i32(sa_t);
                 break;
             }
         case OPC_PRECRQ_PH_W:
@@ -12595,7 +12121,6 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
             {
                 TCGv_i32 ret_t = tcg_const_i32(ret);
                 gen_helper_precr_sra_qh_pw(v2_t, v1_t, v2_t, ret_t);
-                tcg_temp_free_i32(ret_t);
                 break;
             }
         case OPC_PRECR_SRA_R_QH_PW:
@@ -12603,7 +12128,6 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
             {
                 TCGv_i32 sa_v = tcg_const_i32(ret);
                 gen_helper_precr_sra_r_qh_pw(v2_t, v1_t, v2_t, sa_v);
-                tcg_temp_free_i32(sa_v);
                 break;
             }
         case OPC_PRECRQ_OB_QH:
@@ -12630,9 +12154,6 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
         break;
 #endif
     }
-
-    tcg_temp_free(v1_t);
-    tcg_temp_free(v2_t);
 }
 
 static void gen_mipsdsp_shift(DisasContext *ctx, uint32_t opc,
@@ -12872,10 +12393,6 @@ static void gen_mipsdsp_shift(DisasContext *ctx, uint32_t opc,
         break;
 #endif
     }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(v1_t);
-    tcg_temp_free(v2_t);
 }
 
 static void gen_mipsdsp_multiply(DisasContext *ctx, uint32_t op1, uint32_t op2,
@@ -13182,10 +12699,6 @@ static void gen_mipsdsp_multiply(DisasContext *ctx, uint32_t op1, uint32_t op2,
         break;
 #endif
     }
-
-    tcg_temp_free_i32(t0);
-    tcg_temp_free(v1_t);
-    tcg_temp_free(v2_t);
 }
 
 static void gen_mipsdsp_bitinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
@@ -13322,8 +12835,6 @@ static void gen_mipsdsp_bitinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
         break;
 #endif
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(val_t);
 }
 
 static void gen_mipsdsp_add_cmp_pick(DisasContext *ctx,
@@ -13506,10 +13017,6 @@ static void gen_mipsdsp_add_cmp_pick(DisasContext *ctx,
         break;
 #endif
     }
-
-    tcg_temp_free(t1);
-    tcg_temp_free(v1_t);
-    tcg_temp_free(v2_t);
 }
 
 static void gen_mipsdsp_append(CPUMIPSState *env, DisasContext *ctx,
@@ -13597,7 +13104,6 @@ static void gen_mipsdsp_append(CPUMIPSState *env, DisasContext *ctx,
         break;
 #endif
     }
-    tcg_temp_free(t0);
 }
 
 static void gen_mipsdsp_accinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
@@ -13814,10 +13320,6 @@ static void gen_mipsdsp_accinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
         break;
 #endif
     }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(v1_t);
 }
 
 /* End MIPSDSP functions. */
@@ -14668,9 +14170,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
                 gen_load_gpr(t1, rs);
 
                 gen_helper_insv(cpu_gpr[rt], cpu_env, t1, t0);
-
-                tcg_temp_free(t0);
-                tcg_temp_free(t1);
                 break;
             }
         default:            /* Invalid */
@@ -14940,9 +14439,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             gen_load_gpr(t1, rs);
 
             gen_helper_dinsv(cpu_gpr[rt], cpu_env, t1, t0);
-
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
             break;
         }
         default:            /* Invalid */
@@ -15169,8 +14665,6 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             gen_load_gpr(t0, rt);
             gen_load_gpr(t1, rs);
             gen_helper_fork(t0, t1);
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
         }
         break;
     case OPC_YIELD:
@@ -15181,7 +14675,6 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             gen_load_gpr(t0, rs);
             gen_helper_yield(t0, cpu_env, t0);
             gen_store_gpr(t0, rd);
-            tcg_temp_free(t0);
         }
         break;
     default:
@@ -15424,7 +14917,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
                     gen_reserved_instruction(ctx);
                     break;
                 }
-                tcg_temp_free(t0);
             }
 #endif /* !CONFIG_USER_ONLY */
             break;
@@ -15872,7 +15364,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
                 TCGv t0 = tcg_temp_new();
                 gen_load_gpr(t0, rs);
                 tcg_gen_addi_tl(cpu_gpr[rt], t0, imm << 16);
-                tcg_temp_free(t0);
             }
 #else
             gen_reserved_instruction(ctx);
-- 
2.34.1


