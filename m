Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqjl-0000Fx-3g
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjF-0006N5-IR
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:31 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqj7-0003PJ-N2
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:27 -0500
Received: by mail-pg1-x544.google.com with SMTP id z10so917888pgr.8
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i017TKSUYPFS3C2eJMn5LGB/zmI/ObKEVqMTAqXsooY=;
 b=mAk9QeGcpp69We1+VHePXpPKx7vxhtGNp/gawskXtsBRRrLPnY3Mbyg28Yn4H8u5/M
 8WWw79LV/t5sR0X0feOtVCFsFz1KDSULO8BX3QiedIkZYIV+adBGGqn2+qrAzjZpoG7f
 yKyA71H0OJZJ/aW+xXshnD0pcIX7cAnvtLJmf5L86VHnZIbxajE7GKIJP14cLhGttEoq
 34MlaCyRnHWNcBmr02FUqM7vdrjY0hwPM+QXCYuCcDzA5q1O5PxJGzVtZSVozqmpT38U
 gBPquCmZJ81eerU3X74XQ2DfYuIRLnX+jKLspP83zN1A5oKY2ptKOUaHuzRNFt85HPiB
 DN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i017TKSUYPFS3C2eJMn5LGB/zmI/ObKEVqMTAqXsooY=;
 b=BrzJeMrROgwuLopFVSDe8XKXP5pMVGeDFN93Wuklbh7+jpGX7dTru0MbeHOheNiUYD
 LlBAm5mU7TjYwCJbp21bSOk5I1IDnbOhn9jKrCuodmMtwfV2SNWzwRzWldohU/Bp3XwP
 xbaCZbYfU5GphMuH6JboUsg3cryaemOACVFqZ7n7j/8PcoRmaP5P6NnI5mdDjjpOHSDQ
 s57FElTpb+y9sonOYS0TbtNfYgZbDI69X+65QR6xKnauQ04p/RrgIRiEFRkEYQSej/rB
 SkAVg/+OBEpp3UFl27BzeO9WlcHZBI/qf9dMdUPF/YP5E+pDkWTHUgswdO38zjwQ2a17
 p8mA==
X-Gm-Message-State: AO0yUKVPkIdMp4kEmn4kzXxmlbphHDgPHi/PDwsTtq03xqNH1YGgWAGT
 59CATxe698clqcT1yEpIvnm+Yw==
X-Google-Smtp-Source: AK7set89fuz6TcNculeIqC1vwOhP+UKQvPWSyIugLlUlX7EebAFhYwGOPPkmgWi0QEU5zQ0gdYweiA==
X-Received: by 2002:a05:6a00:f95:b0:5a8:d3d9:e03a with SMTP id
 ct21-20020a056a000f9500b005a8d3d9e03amr2627803pfb.0.1677316819439; 
 Sat, 25 Feb 2023 01:20:19 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 64/76] target/sh4: Drop tcg_temp_free
Date: Fri, 24 Feb 2023 23:14:15 -1000
Message-Id: <20230225091427.1817156-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:20:35 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 110 -----------------------------------------
 1 file changed, 110 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 23563024e0..ad6de41712 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -196,7 +196,6 @@ static void gen_read_sr(TCGv dst)
     tcg_gen_or_i32(dst, dst, t0);
     tcg_gen_shli_i32(t0, cpu_sr_t, SR_T);
     tcg_gen_or_i32(dst, cpu_sr, t0);
-    tcg_temp_free_i32(t0);
 }
 
 static void gen_write_sr(TCGv src)
@@ -499,7 +498,6 @@ static void _decode_opc(DisasContext * ctx)
 	    tcg_gen_addi_i32(addr, REG(B11_8), B3_0 * 4);
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
                                 MO_TEUL | UNALIGN(ctx));
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x5000:		/* mov.l @(disp,Rm),Rn */
@@ -508,7 +506,6 @@ static void _decode_opc(DisasContext * ctx)
 	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 4);
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
                                 MO_TESL | UNALIGN(ctx));
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0xe000:		/* mov #imm,Rn */
@@ -531,14 +528,12 @@ static void _decode_opc(DisasContext * ctx)
 	{
             TCGv addr = tcg_const_i32(ctx->base.pc_next + 4 + B7_0 * 2);
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESW);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0xd000:		/* mov.l @(disp,PC),Rn */
 	{
             TCGv addr = tcg_const_i32((ctx->base.pc_next + 4 + B7_0 * 4) & ~3);
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x7000:		/* add #imm,Rn */
@@ -590,7 +585,6 @@ static void _decode_opc(DisasContext * ctx)
             /* might cause re-execution */
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_UB);
 	    tcg_gen_mov_i32(REG(B11_8), addr);			/* modify register status */
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x2005:		/* mov.w Rm,@-Rn */
@@ -600,7 +594,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
                                 MO_TEUW | UNALIGN(ctx));
 	    tcg_gen_mov_i32(REG(B11_8), addr);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x2006:		/* mov.l Rm,@-Rn */
@@ -610,7 +603,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
                                 MO_TEUL | UNALIGN(ctx));
 	    tcg_gen_mov_i32(REG(B11_8), addr);
-        tcg_temp_free(addr);
 	}
 	return;
     case 0x6004:		/* mov.b @Rm+,Rn */
@@ -635,7 +627,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_UB);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x0005:		/* mov.w Rm,@(R0,Rn) */
@@ -644,7 +635,6 @@ static void _decode_opc(DisasContext * ctx)
 	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
                                 MO_TEUW | UNALIGN(ctx));
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x0006:		/* mov.l Rm,@(R0,Rn) */
@@ -653,7 +643,6 @@ static void _decode_opc(DisasContext * ctx)
 	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
                                 MO_TEUL | UNALIGN(ctx));
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x000c:		/* mov.b @(R0,Rm),Rn */
@@ -661,7 +650,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_SB);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x000d:		/* mov.w @(R0,Rm),Rn */
@@ -670,7 +658,6 @@ static void _decode_opc(DisasContext * ctx)
 	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
                                 MO_TESW | UNALIGN(ctx));
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x000e:		/* mov.l @(R0,Rm),Rn */
@@ -679,7 +666,6 @@ static void _decode_opc(DisasContext * ctx)
 	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
                                 MO_TESL | UNALIGN(ctx));
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x6008:		/* swap.b Rm,Rn */
@@ -687,7 +673,6 @@ static void _decode_opc(DisasContext * ctx)
             TCGv low = tcg_temp_new();
             tcg_gen_bswap16_i32(low, REG(B7_4), 0);
             tcg_gen_deposit_i32(REG(B11_8), REG(B7_4), low, 0, 16);
-	    tcg_temp_free(low);
 	}
 	return;
     case 0x6009:		/* swap.w Rm,Rn */
@@ -701,8 +686,6 @@ static void _decode_opc(DisasContext * ctx)
 	    low = tcg_temp_new();
 	    tcg_gen_shri_i32(low, REG(B11_8), 16);
 	    tcg_gen_or_i32(REG(B11_8), high, low);
-	    tcg_temp_free(low);
-	    tcg_temp_free(high);
 	}
 	return;
     case 0x300c:		/* add Rm,Rn */
@@ -716,8 +699,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_add2_i32(t1, cpu_sr_t, cpu_sr_t, t0, REG(B7_4), t0);
             tcg_gen_add2_i32(REG(B11_8), cpu_sr_t,
                              REG(B11_8), t0, t1, cpu_sr_t);
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
         }
 	return;
     case 0x300f:		/* addv Rm,Rn */
@@ -730,11 +711,8 @@ static void _decode_opc(DisasContext * ctx)
             t2 = tcg_temp_new();
             tcg_gen_xor_i32(t2, REG(B7_4), REG(B11_8));
             tcg_gen_andc_i32(cpu_sr_t, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_shri_i32(cpu_sr_t, cpu_sr_t, 31);
-            tcg_temp_free(t1);
             tcg_gen_mov_i32(REG(B7_4), t0);
-            tcg_temp_free(t0);
         }
 	return;
     case 0x2009:		/* and Rm,Rn */
@@ -764,8 +742,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_andc_i32(cmp1, cmp1, cmp2);
             tcg_gen_andi_i32(cmp1, cmp1, 0x80808080);
             tcg_gen_setcondi_i32(TCG_COND_NE, cpu_sr_t, cmp1, 0);
-	    tcg_temp_free(cmp2);
-	    tcg_temp_free(cmp1);
 	}
 	return;
     case 0x2007:		/* div0s Rm,Rn */
@@ -801,11 +777,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_xor_i32(t1, t1, t0);
             tcg_gen_xori_i32(cpu_sr_t, t1, 1);
             tcg_gen_xor_i32(cpu_sr_q, cpu_sr_m, t1);
-
-            tcg_temp_free(zero);
-            tcg_temp_free(t2);
-            tcg_temp_free(t1);
-            tcg_temp_free(t0);
         }
 	return;
     case 0x300d:		/* dmuls.l Rm,Rn */
@@ -834,8 +805,6 @@ static void _decode_opc(DisasContext * ctx)
 	    arg1 = tcg_temp_new();
             tcg_gen_qemu_ld_i32(arg1, REG(B11_8), ctx->memidx, MO_TESL);
             gen_helper_macl(cpu_env, arg0, arg1);
-	    tcg_temp_free(arg1);
-	    tcg_temp_free(arg0);
 	    tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
 	    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
 	}
@@ -848,8 +817,6 @@ static void _decode_opc(DisasContext * ctx)
 	    arg1 = tcg_temp_new();
             tcg_gen_qemu_ld_i32(arg1, REG(B11_8), ctx->memidx, MO_TESL);
             gen_helper_macw(cpu_env, arg0, arg1);
-	    tcg_temp_free(arg1);
-	    tcg_temp_free(arg0);
 	    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 2);
 	    tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 2);
 	}
@@ -865,8 +832,6 @@ static void _decode_opc(DisasContext * ctx)
 	    arg1 = tcg_temp_new();
 	    tcg_gen_ext16s_i32(arg1, REG(B11_8));
 	    tcg_gen_mul_i32(cpu_macl, arg0, arg1);
-	    tcg_temp_free(arg1);
-	    tcg_temp_free(arg0);
 	}
 	return;
     case 0x200e:		/* mulu.w Rm,Rn */
@@ -877,8 +842,6 @@ static void _decode_opc(DisasContext * ctx)
 	    arg1 = tcg_temp_new();
 	    tcg_gen_ext16u_i32(arg1, REG(B11_8));
 	    tcg_gen_mul_i32(cpu_macl, arg0, arg1);
-	    tcg_temp_free(arg1);
-	    tcg_temp_free(arg0);
 	}
 	return;
     case 0x600b:		/* neg Rm,Rn */
@@ -892,7 +855,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_sub2_i32(REG(B11_8), cpu_sr_t,
                              t0, t0, REG(B11_8), cpu_sr_t);
             tcg_gen_andi_i32(cpu_sr_t, cpu_sr_t, 1);
-            tcg_temp_free(t0);
         }
 	return;
     case 0x6007:		/* not Rm,Rn */
@@ -921,10 +883,6 @@ static void _decode_opc(DisasContext * ctx)
             /* select between the two cases */
             tcg_gen_movi_i32(t0, 0);
             tcg_gen_movcond_i32(TCG_COND_GE, REG(B11_8), REG(B7_4), t0, t1, t2);
-
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
-            tcg_temp_free(t2);
 	}
 	return;
     case 0x400d:		/* shld Rm,Rn */
@@ -947,10 +905,6 @@ static void _decode_opc(DisasContext * ctx)
             /* select between the two cases */
             tcg_gen_movi_i32(t0, 0);
             tcg_gen_movcond_i32(TCG_COND_GE, REG(B11_8), REG(B7_4), t0, t1, t2);
-
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
-            tcg_temp_free(t2);
 	}
 	return;
     case 0x3008:		/* sub Rm,Rn */
@@ -965,8 +919,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_sub2_i32(REG(B11_8), cpu_sr_t,
                              REG(B11_8), t0, t1, cpu_sr_t);
             tcg_gen_andi_i32(cpu_sr_t, cpu_sr_t, 1);
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
         }
 	return;
     case 0x300b:		/* subv Rm,Rn */
@@ -979,11 +931,8 @@ static void _decode_opc(DisasContext * ctx)
             t2 = tcg_temp_new();
             tcg_gen_xor_i32(t2, REG(B11_8), REG(B7_4));
             tcg_gen_and_i32(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_shri_i32(cpu_sr_t, t1, 31);
-            tcg_temp_free(t1);
             tcg_gen_mov_i32(REG(B11_8), t0);
-            tcg_temp_free(t0);
         }
 	return;
     case 0x2008:		/* tst Rm,Rn */
@@ -991,7 +940,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv val = tcg_temp_new();
 	    tcg_gen_and_i32(val, REG(B7_4), REG(B11_8));
             tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, val, 0);
-	    tcg_temp_free(val);
 	}
 	return;
     case 0x200a:		/* xor Rm,Rn */
@@ -1014,7 +962,6 @@ static void _decode_opc(DisasContext * ctx)
             TCGv_i64 fp = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp, XHACK(B7_4));
             tcg_gen_qemu_st_i64(fp, REG(B11_8), ctx->memidx, MO_TEUQ);
-            tcg_temp_free_i64(fp);
 	} else {
             tcg_gen_qemu_st_i32(FREG(B7_4), REG(B11_8), ctx->memidx, MO_TEUL);
 	}
@@ -1025,7 +972,6 @@ static void _decode_opc(DisasContext * ctx)
             TCGv_i64 fp = tcg_temp_new_i64();
             tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx, MO_TEUQ);
             gen_store_fpr64(ctx, fp, XHACK(B11_8));
-            tcg_temp_free_i64(fp);
 	} else {
             tcg_gen_qemu_ld_i32(FREG(B11_8), REG(B7_4), ctx->memidx, MO_TEUL);
 	}
@@ -1036,7 +982,6 @@ static void _decode_opc(DisasContext * ctx)
             TCGv_i64 fp = tcg_temp_new_i64();
             tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx, MO_TEUQ);
             gen_store_fpr64(ctx, fp, XHACK(B11_8));
-            tcg_temp_free_i64(fp);
             tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 8);
 	} else {
             tcg_gen_qemu_ld_i32(FREG(B11_8), REG(B7_4), ctx->memidx, MO_TEUL);
@@ -1052,13 +997,11 @@ static void _decode_opc(DisasContext * ctx)
                 gen_load_fpr64(ctx, fp, XHACK(B7_4));
                 tcg_gen_subi_i32(addr, REG(B11_8), 8);
                 tcg_gen_qemu_st_i64(fp, addr, ctx->memidx, MO_TEUQ);
-                tcg_temp_free_i64(fp);
             } else {
                 tcg_gen_subi_i32(addr, REG(B11_8), 4);
                 tcg_gen_qemu_st_i32(FREG(B7_4), addr, ctx->memidx, MO_TEUL);
             }
             tcg_gen_mov_i32(REG(B11_8), addr);
-            tcg_temp_free(addr);
         }
 	return;
     case 0xf006: /* fmov @(R0,Rm),{F,D,X}Rm - FPSCR: Nothing */
@@ -1070,11 +1013,9 @@ static void _decode_opc(DisasContext * ctx)
                 TCGv_i64 fp = tcg_temp_new_i64();
                 tcg_gen_qemu_ld_i64(fp, addr, ctx->memidx, MO_TEUQ);
                 gen_store_fpr64(ctx, fp, XHACK(B11_8));
-                tcg_temp_free_i64(fp);
 	    } else {
                 tcg_gen_qemu_ld_i32(FREG(B11_8), addr, ctx->memidx, MO_TEUL);
 	    }
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0xf007: /* fmov {F,D,X}Rn,@(R0,Rn) - FPSCR: Nothing */
@@ -1086,11 +1027,9 @@ static void _decode_opc(DisasContext * ctx)
                 TCGv_i64 fp = tcg_temp_new_i64();
                 gen_load_fpr64(ctx, fp, XHACK(B7_4));
                 tcg_gen_qemu_st_i64(fp, addr, ctx->memidx, MO_TEUQ);
-                tcg_temp_free_i64(fp);
 	    } else {
                 tcg_gen_qemu_st_i32(FREG(B7_4), addr, ctx->memidx, MO_TEUL);
 	    }
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0xf000: /* fadd Rm,Rn - FPSCR: R[PR,Enable.O/U/I]/W[Cause,Flag] */
@@ -1132,8 +1071,6 @@ static void _decode_opc(DisasContext * ctx)
                     return;
                 }
                 gen_store_fpr64(ctx, fp0, B11_8);
-                tcg_temp_free_i64(fp0);
-                tcg_temp_free_i64(fp1);
 	    } else {
                 switch (ctx->opcode & 0xf00f) {
                 case 0xf000:		/* fadd Rm,Rn */
@@ -1185,8 +1122,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_qemu_ld_i32(val, addr, ctx->memidx, MO_UB);
 	    tcg_gen_andi_i32(val, val, B7_0);
             tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_UB);
-	    tcg_temp_free(val);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x8b00:		/* bf label */
@@ -1217,7 +1152,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0);
             tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_SB);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0xc500:		/* mov.w @(disp,GBR),R0 */
@@ -1225,7 +1159,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 2);
             tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_TESW);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0xc600:		/* mov.l @(disp,GBR),R0 */
@@ -1233,7 +1166,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 4);
             tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_TESL);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0xc000:		/* mov.b R0,@(disp,GBR) */
@@ -1241,7 +1173,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0);
             tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_UB);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0xc100:		/* mov.w R0,@(disp,GBR) */
@@ -1249,7 +1180,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 2);
             tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_TEUW);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0xc200:		/* mov.l R0,@(disp,GBR) */
@@ -1257,7 +1187,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 4);
             tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_TEUL);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x8000:		/* mov.b R0,@(disp,Rn) */
@@ -1265,7 +1194,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0);
             tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_UB);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x8100:		/* mov.w R0,@(disp,Rn) */
@@ -1274,7 +1202,6 @@ static void _decode_opc(DisasContext * ctx)
 	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 2);
             tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx,
                                 MO_TEUW | UNALIGN(ctx));
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x8400:		/* mov.b @(disp,Rn),R0 */
@@ -1282,7 +1209,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0);
             tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_SB);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0x8500:		/* mov.w @(disp,Rn),R0 */
@@ -1291,7 +1217,6 @@ static void _decode_opc(DisasContext * ctx)
 	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 2);
             tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx,
                                 MO_TESW | UNALIGN(ctx));
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0xc700:		/* mova @(disp,PC),R0 */
@@ -1310,8 +1235,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_qemu_ld_i32(val, addr, ctx->memidx, MO_UB);
 	    tcg_gen_ori_i32(val, val, B7_0);
             tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_UB);
-	    tcg_temp_free(val);
-	    tcg_temp_free(addr);
 	}
 	return;
     case 0xc300:		/* trapa #imm */
@@ -1321,7 +1244,6 @@ static void _decode_opc(DisasContext * ctx)
             gen_save_cpu_state(ctx, true);
 	    imm = tcg_const_i32(B7_0);
             gen_helper_trapa(cpu_env, imm);
-	    tcg_temp_free(imm);
             ctx->base.is_jmp = DISAS_NORETURN;
 	}
 	return;
@@ -1330,7 +1252,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv val = tcg_temp_new();
 	    tcg_gen_andi_i32(val, REG(0), B7_0);
             tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, val, 0);
-	    tcg_temp_free(val);
 	}
 	return;
     case 0xcc00:		/* tst.b #imm,@(R0,GBR) */
@@ -1340,7 +1261,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_qemu_ld_i32(val, val, ctx->memidx, MO_UB);
 	    tcg_gen_andi_i32(val, val, B7_0);
             tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, val, 0);
-	    tcg_temp_free(val);
 	}
 	return;
     case 0xca00:		/* xor #imm,R0 */
@@ -1355,8 +1275,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_qemu_ld_i32(val, addr, ctx->memidx, MO_UB);
 	    tcg_gen_xori_i32(val, val, B7_0);
             tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_UB);
-	    tcg_temp_free(val);
-	    tcg_temp_free(addr);
 	}
 	return;
     }
@@ -1382,7 +1300,6 @@ static void _decode_opc(DisasContext * ctx)
 	    tcg_gen_subi_i32(addr, REG(B11_8), 4);
             tcg_gen_qemu_st_i32(ALTREG(B6_4), addr, ctx->memidx, MO_TEUL);
 	    tcg_gen_mov_i32(REG(B11_8), addr);
-	    tcg_temp_free(addr);
 	}
 	return;
     }
@@ -1430,7 +1347,6 @@ static void _decode_opc(DisasContext * ctx)
             TCGv val = tcg_temp_new();
             tcg_gen_andi_i32(val, REG(B11_8), 0x700083f3);
             gen_write_sr(val);
-            tcg_temp_free(val);
             ctx->base.is_jmp = DISAS_STOP;
         }
 	return;
@@ -1441,7 +1357,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_qemu_ld_i32(val, REG(B11_8), ctx->memidx, MO_TESL);
             tcg_gen_andi_i32(val, val, 0x700083f3);
             gen_write_sr(val);
-	    tcg_temp_free(val);
 	    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
             ctx->base.is_jmp = DISAS_STOP;
 	}
@@ -1459,8 +1374,6 @@ static void _decode_opc(DisasContext * ctx)
             gen_read_sr(val);
             tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_TEUL);
 	    tcg_gen_mov_i32(REG(B11_8), addr);
-            tcg_temp_free(val);
-	    tcg_temp_free(addr);
 	}
 	return;
 #define LD(reg,ldnum,ldpnum,prechk)		\
@@ -1485,7 +1398,6 @@ static void _decode_opc(DisasContext * ctx)
 	tcg_gen_subi_i32(addr, REG(B11_8), 4);			\
         tcg_gen_qemu_st_i32(cpu_##reg, addr, ctx->memidx, MO_TEUL); \
 	tcg_gen_mov_i32(REG(B11_8), addr);			\
-	tcg_temp_free(addr);					\
     }								\
     return;
 #define LDST(reg,ldnum,ldpnum,stnum,stpnum,prechk)		\
@@ -1514,7 +1426,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_qemu_ld_i32(addr, REG(B11_8), ctx->memidx, MO_TESL);
 	    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
             gen_helper_ld_fpscr(cpu_env, addr);
-	    tcg_temp_free(addr);
             ctx->base.is_jmp = DISAS_STOP;
 	}
 	return;
@@ -1532,8 +1443,6 @@ static void _decode_opc(DisasContext * ctx)
 	    tcg_gen_subi_i32(addr, REG(B11_8), 4);
             tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_TEUL);
 	    tcg_gen_mov_i32(REG(B11_8), addr);
-	    tcg_temp_free(addr);
-	    tcg_temp_free(val);
 	}
 	return;
     case 0x00c3:		/* movca.l R0,@Rm */
@@ -1542,7 +1451,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_qemu_ld_i32(val, REG(B11_8), ctx->memidx, MO_TEUL);
             gen_helper_movcal(cpu_env, REG(B11_8), val);
             tcg_gen_qemu_st_i32(REG(0), REG(B11_8), ctx->memidx, MO_TEUL);
-            tcg_temp_free(val);
         }
         ctx->has_movcal = 1;
 	return;
@@ -1586,7 +1494,6 @@ static void _decode_opc(DisasContext * ctx)
                 tcg_gen_atomic_cmpxchg_i32(tmp, REG(B11_8), cpu_lock_value,
                                            REG(0), ctx->memidx, MO_TEUL);
                 tcg_gen_setcond_i32(TCG_COND_EQ, cpu_sr_t, tmp, cpu_lock_value);
-                tcg_temp_free(tmp);
             } else {
                 tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_lock_addr, -1, fail);
                 tcg_gen_qemu_st_i32(REG(0), REG(B11_8), ctx->memidx, MO_TEUL);
@@ -1617,7 +1524,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_qemu_ld_i32(REG(0), REG(B11_8), ctx->memidx, MO_TESL);
             tcg_gen_mov_i32(cpu_lock_value, REG(0));
             tcg_gen_mov_i32(cpu_lock_addr, tmp);
-            tcg_temp_free(tmp);
         } else {
             tcg_gen_qemu_ld_i32(REG(0), REG(B11_8), ctx->memidx, MO_TESL);
             tcg_gen_movi_i32(cpu_lock_addr, 0);
@@ -1653,7 +1559,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_shri_i32(cpu_sr_t, REG(B11_8), 31);
 	    tcg_gen_shli_i32(REG(B11_8), REG(B11_8), 1);
             tcg_gen_or_i32(REG(B11_8), REG(B11_8), tmp);
-	    tcg_temp_free(tmp);
 	}
 	return;
     case 0x4025:		/* rotcr Rn */
@@ -1663,7 +1568,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_andi_i32(cpu_sr_t, REG(B11_8), 1);
 	    tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 1);
             tcg_gen_or_i32(REG(B11_8), REG(B11_8), tmp);
-	    tcg_temp_free(tmp);
 	}
 	return;
     case 0x4004:		/* rotl Rn */
@@ -1711,7 +1615,6 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_atomic_fetch_or_i32(val, REG(B11_8), val,
                                         ctx->memidx, MO_UB);
             tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, val, 0);
-            tcg_temp_free(val);
         }
         return;
     case 0xf00d: /* fsts FPUL,FRn - FPSCR: Nothing */
@@ -1732,7 +1635,6 @@ static void _decode_opc(DisasContext * ctx)
 	    fp = tcg_temp_new_i64();
             gen_helper_float_DT(fp, cpu_env, cpu_fpul);
             gen_store_fpr64(ctx, fp, B11_8);
-	    tcg_temp_free_i64(fp);
 	}
 	else {
             gen_helper_float_FT(FREG(B11_8), cpu_env, cpu_fpul);
@@ -1748,7 +1650,6 @@ static void _decode_opc(DisasContext * ctx)
 	    fp = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp, B11_8);
             gen_helper_ftrc_DT(cpu_fpul, cpu_env, fp);
-	    tcg_temp_free_i64(fp);
 	}
 	else {
             gen_helper_ftrc_FT(cpu_fpul, cpu_env, FREG(B11_8));
@@ -1772,7 +1673,6 @@ static void _decode_opc(DisasContext * ctx)
             gen_load_fpr64(ctx, fp, B11_8);
             gen_helper_fsqrt_DT(fp, cpu_env, fp);
             gen_store_fpr64(ctx, fp, B11_8);
-	    tcg_temp_free_i64(fp);
 	} else {
             gen_helper_fsqrt_FT(FREG(B11_8), cpu_env, FREG(B11_8));
 	}
@@ -1798,7 +1698,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv_i64 fp = tcg_temp_new_i64();
             gen_helper_fcnvsd_FT_DT(fp, cpu_env, cpu_fpul);
             gen_store_fpr64(ctx, fp, B11_8);
-	    tcg_temp_free_i64(fp);
 	}
 	return;
     case 0xf0bd: /* fcnvds DRn,FPUL */
@@ -1807,7 +1706,6 @@ static void _decode_opc(DisasContext * ctx)
 	    TCGv_i64 fp = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp, B11_8);
             gen_helper_fcnvds_DT_FT(cpu_fpul, cpu_env, fp);
-	    tcg_temp_free_i64(fp);
 	}
 	return;
     case 0xf0ed: /* fipr FVm,FVn */
@@ -1817,8 +1715,6 @@ static void _decode_opc(DisasContext * ctx)
             TCGv m = tcg_const_i32((ctx->opcode >> 8) & 3);
             TCGv n = tcg_const_i32((ctx->opcode >> 10) & 3);
             gen_helper_fipr(cpu_env, m, n);
-            tcg_temp_free(m);
-            tcg_temp_free(n);
             return;
         }
         break;
@@ -1831,7 +1727,6 @@ static void _decode_opc(DisasContext * ctx)
             }
             TCGv n = tcg_const_i32((ctx->opcode >> 10) & 3);
             gen_helper_ftrv(cpu_env, n);
-            tcg_temp_free(n);
             return;
         }
         break;
@@ -2220,11 +2115,6 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
         g_assert_not_reached();
     }
 
-    /* If op_src is not a valid register, then op_arg was a constant.  */
-    if (op_src < 0 && op_arg) {
-        tcg_temp_free_i32(op_arg);
-    }
-
     /* The entire region has been translated.  */
     ctx->envflags &= ~TB_FLAG_GUSA_MASK;
     ctx->base.pc_next = pc_end;
-- 
2.34.1


