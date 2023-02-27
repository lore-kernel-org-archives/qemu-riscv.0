Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1u-0008H6-SS
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1p-00083K-U2
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:25 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1j-0007Cs-S9
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:25 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so8837262pjb.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xvy4wYhYTWxOuE8RedvZQpxyXfOu/63Y7YjVW3K3Dzg=;
 b=d/wPaGeTVekrJbo2HIW/ikWnJqwJ09hM9BpGXqJESSah415UkqwJEo7sFPp/Ce7A4z
 gKe2aYFx8lR7ZNz0fCbKrSdp+BL8ikphXPuRDsqb2lAGZZbyzAPaFvH4Ih3l9JhAoSm/
 NjlJdV4UEgFScM18npsM4DPeEqAxdDNvPu2eOQfpA7oP432BZTWUEmDUwdsxE4YfxA2E
 o8LfbDh8qBW0HoK5leNkVgTez0xP+V0TkC34Y0bPTe4QqnO4esvYTTgxdOw6OLYwvhH1
 zJIH/fUw+d4Z26OVE4KDK2xXKPmOLDy5DXjsHFEc/t2vZ/VsllDSpQ2l+QQeXp4Ksfkc
 se0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xvy4wYhYTWxOuE8RedvZQpxyXfOu/63Y7YjVW3K3Dzg=;
 b=OSIFlz9oA4wf9/WWYWVzkuc1ZzmfAGHvGA5Bku2074cKMzBp0RERHEL0bAvGrUc96p
 njM0jRYBL7zPZA2+S3JMehes9klNi59LFfst7cRfEuZA8MbxJsNjoly0Z73yoZExk/uR
 DOxW0srro/DMVfhCBnj/BO7IeiNUaw92FLG8VKMIBQMtR5i4p/EApbxKN42+FnH4Vnsq
 c32Mz5wD32VUccr0lM+vY2+qhHDXCb2Q0tyCIIsSU+kbAjiGfBmPDDzC+dl9i+SCla4A
 M3Di+fK96q0A5JZ/oUndVG2SBVKpLu3qWmxWKzOOAS/+xmI6ATr5wgqr6skGIuJPi3EU
 bHEQ==
X-Gm-Message-State: AO0yUKWJlIcWJd5woWCE61oQDm6caBJlYoYToSyDFemjZRmz0PauzTwW
 MGYpnm2Uv5khO3CHjgivcFtdBA==
X-Google-Smtp-Source: AK7set+Pn8/b5Ol3KVMm0L5xQgUowRzCV/QCaPkxk4sv1YZDNeCVBZF5C90mEc2GNEHNCqTlfQTr8g==
X-Received: by 2002:a17:903:2843:b0:19c:d309:4612 with SMTP id
 kq3-20020a170903284300b0019cd3094612mr9625595plb.6.1677475579003; 
 Sun, 26 Feb 2023 21:26:19 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 25/76] target/hexagon: Drop tcg_temp_free from C code
Date: Sun, 26 Feb 2023 19:24:14 -1000
Message-Id: <20230227052505.352889-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:26:26 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_tcg.h     | 29 ------------------
 target/hexagon/gen_tcg_hvx.h | 15 ----------
 target/hexagon/macros.h      |  7 -----
 target/hexagon/genptr.c      | 58 ------------------------------------
 target/hexagon/translate.c   |  7 -----
 target/hexagon/README        |  5 ----
 6 files changed, 121 deletions(-)

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index a219a7f5dd..b2e7880b5c 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -77,7 +77,6 @@
         tcg_gen_mov_tl(EA, RxV); \
         gen_read_ireg(ireg, MuV, (SHIFT)); \
         gen_helper_fcircadd(RxV, RxV, ireg, MuV, hex_gpr[HEX_REG_CS0 + MuN]); \
-        tcg_temp_free(ireg); \
     } while (0)
 
 /* Instructions with multiple definitions */
@@ -116,7 +115,6 @@
         gen_read_ireg(ireg, MuV, SHIFT); \
         gen_helper_fcircadd(RxV, RxV, ireg, MuV, hex_gpr[HEX_REG_CS0 + MuN]); \
         LOAD; \
-        tcg_temp_free(ireg); \
     } while (0)
 
 #define fGEN_TCG_L2_loadrub_pcr(SHORTCODE) \
@@ -168,8 +166,6 @@
         for (int i = 0; i < 2; i++) { \
             gen_set_half(i, RdV, gen_get_byte(byte, i, tmp, (SIGN))); \
         } \
-        tcg_temp_free(tmp); \
-        tcg_temp_free(byte); \
     } while (0)
 
 #define fGEN_TCG_L2_loadbzw2_io(SHORTCODE) \
@@ -222,8 +218,6 @@
         for (int i = 0; i < 4; i++) { \
             gen_set_half_i64(i, RddV, gen_get_byte(byte, i, tmp, (SIGN)));  \
         }  \
-        tcg_temp_free(tmp); \
-        tcg_temp_free(byte); \
     } while (0)
 
 #define fGEN_TCG_L2_loadbzw4_io(SHORTCODE) \
@@ -273,8 +267,6 @@
         tcg_gen_extu_i32_i64(tmp_i64, tmp); \
         tcg_gen_shri_i64(RyyV, RyyV, 16); \
         tcg_gen_deposit_i64(RyyV, RyyV, tmp_i64, 48, 16); \
-        tcg_temp_free(tmp); \
-        tcg_temp_free_i64(tmp_i64); \
     } while (0)
 
 #define fGEN_TCG_L4_loadalignh_ur(SHORTCODE) \
@@ -304,8 +296,6 @@
         tcg_gen_extu_i32_i64(tmp_i64, tmp); \
         tcg_gen_shri_i64(RyyV, RyyV, 8); \
         tcg_gen_deposit_i64(RyyV, RyyV, tmp_i64, 56, 8); \
-        tcg_temp_free(tmp); \
-        tcg_temp_free_i64(tmp_i64); \
     } while (0)
 
 #define fGEN_TCG_L2_loadalignb_io(SHORTCODE) \
@@ -347,7 +337,6 @@
         tcg_gen_brcondi_tl(TCG_COND_EQ, LSB, 0, label); \
         fLOAD(1, SIZE, SIGN, EA, RdV); \
         gen_set_label(label); \
-        tcg_temp_free(LSB); \
     } while (0)
 
 #define fGEN_TCG_L2_ploadrubt_pi(SHORTCODE) \
@@ -407,7 +396,6 @@
         tcg_gen_brcondi_tl(TCG_COND_EQ, LSB, 0, label); \
         fLOAD(1, 8, u, EA, RddV); \
         gen_set_label(label); \
-        tcg_temp_free(LSB); \
     } while (0)
 
 #define fGEN_TCG_L2_ploadrdt_pi(SHORTCODE) \
@@ -434,8 +422,6 @@
         TCGv HALF = tcg_temp_new(); \
         TCGv BYTE = tcg_temp_new(); \
         SHORTCODE; \
-        tcg_temp_free(HALF); \
-        tcg_temp_free(BYTE); \
     } while (0)
 
 #define fGEN_TCG_STORE_pcr(SHIFT, STORE) \
@@ -447,9 +433,6 @@
         gen_read_ireg(ireg, MuV, SHIFT); \
         gen_helper_fcircadd(RxV, RxV, ireg, MuV, hex_gpr[HEX_REG_CS0 + MuN]); \
         STORE; \
-        tcg_temp_free(ireg); \
-        tcg_temp_free(HALF); \
-        tcg_temp_free(BYTE); \
     } while (0)
 
 #define fGEN_TCG_S2_storerb_pbr(SHORTCODE) \
@@ -531,7 +514,6 @@
         gen_helper_sfrecipa(tmp, cpu_env, RsV, RtV);  \
         tcg_gen_extrh_i64_i32(RdV, tmp); \
         tcg_gen_extrl_i64_i32(PeV, tmp); \
-        tcg_temp_free_i64(tmp); \
     } while (0)
 
 /*
@@ -547,7 +529,6 @@
         gen_helper_sfinvsqrta(tmp, cpu_env, RsV); \
         tcg_gen_extrh_i64_i32(RdV, tmp); \
         tcg_gen_extrl_i64_i32(PeV, tmp); \
-        tcg_temp_free_i64(tmp); \
     } while (0)
 
 /*
@@ -565,7 +546,6 @@
         tcg_gen_add2_i64(RddV, carry, RddV, carry, RttV, zero); \
         tcg_gen_extrl_i64_i32(PxV, carry); \
         gen_8bitsof(PxV, PxV); \
-        tcg_temp_free_i64(carry); \
     } while (0)
 
 /* r5:4 = sub(r1:0, r3:2, p1):carry */
@@ -581,8 +561,6 @@
         tcg_gen_add2_i64(RddV, carry, RddV, carry, not_RttV, zero); \
         tcg_gen_extrl_i64_i32(PxV, carry); \
         gen_8bitsof(PxV, PxV); \
-        tcg_temp_free_i64(carry); \
-        tcg_temp_free_i64(not_RttV); \
     } while (0)
 
 /*
@@ -607,9 +585,6 @@
             tcg_gen_umin_tl(tmp, left, right); \
             gen_set_byte_i64(i, RddV, tmp); \
         } \
-        tcg_temp_free(left); \
-        tcg_temp_free(right); \
-        tcg_temp_free(tmp); \
     } while (0)
 
 #define fGEN_TCG_J2_call(SHORTCODE) \
@@ -815,14 +790,12 @@
         TCGv LSB = tcg_temp_new(); \
         COND; \
         gen_cond_jump(ctx, TCG_COND_EQ, LSB, riV); \
-        tcg_temp_free(LSB); \
     } while (0)
 #define fGEN_TCG_cond_jumpf(COND) \
     do { \
         TCGv LSB = tcg_temp_new(); \
         COND; \
         gen_cond_jump(ctx, TCG_COND_NE, LSB, riV); \
-        tcg_temp_free(LSB); \
     } while (0)
 
 #define fGEN_TCG_J2_jumpt(SHORTCODE) \
@@ -863,14 +836,12 @@
         TCGv LSB = tcg_temp_new(); \
         COND; \
         gen_cond_jumpr(ctx, RsV, TCG_COND_EQ, LSB); \
-        tcg_temp_free(LSB); \
     } while (0)
 #define fGEN_TCG_cond_jumprf(COND) \
     do { \
         TCGv LSB = tcg_temp_new(); \
         COND; \
         gen_cond_jumpr(ctx, RsV, TCG_COND_NE, LSB); \
-        tcg_temp_free(LSB); \
     } while (0)
 
 #define fGEN_TCG_J2_jumprt(SHORTCODE) \
diff --git a/target/hexagon/gen_tcg_hvx.h b/target/hexagon/gen_tcg_hvx.h
index 083f4d92c6..94f272e286 100644
--- a/target/hexagon/gen_tcg_hvx.h
+++ b/target/hexagon/gen_tcg_hvx.h
@@ -136,7 +136,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
         TCGLabel *end_label = gen_new_label(); \
         tcg_gen_andi_tl(lsb, PsV, 1); \
         tcg_gen_brcondi_tl(TCG_COND_NE, lsb, PRED, false_label); \
-        tcg_temp_free(lsb); \
         tcg_gen_gvec_mov(MO_64, VdV_off, VuV_off, \
                          sizeof(MMVector), sizeof(MMVector)); \
         tcg_gen_br(end_label); \
@@ -212,7 +211,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
         tcg_gen_andi_tl(shift, RtV, 15); \
         tcg_gen_gvec_sars(MO_16, VdV_off, VuV_off, shift, \
                           sizeof(MMVector), sizeof(MMVector)); \
-        tcg_temp_free(shift); \
     } while (0)
 
 #define fGEN_TCG_V6_vasrh_acc(SHORTCODE) \
@@ -224,7 +222,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
                           sizeof(MMVector), sizeof(MMVector)); \
         tcg_gen_gvec_add(MO_16, VxV_off, VxV_off, tmpoff, \
                          sizeof(MMVector), sizeof(MMVector)); \
-        tcg_temp_free(shift); \
     } while (0)
 
 #define fGEN_TCG_V6_vasrw(SHORTCODE) \
@@ -233,7 +230,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
         tcg_gen_andi_tl(shift, RtV, 31); \
         tcg_gen_gvec_sars(MO_32, VdV_off, VuV_off, shift, \
                           sizeof(MMVector), sizeof(MMVector)); \
-        tcg_temp_free(shift); \
     } while (0)
 
 #define fGEN_TCG_V6_vasrw_acc(SHORTCODE) \
@@ -245,7 +241,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
                           sizeof(MMVector), sizeof(MMVector)); \
         tcg_gen_gvec_add(MO_32, VxV_off, VxV_off, tmpoff, \
                           sizeof(MMVector), sizeof(MMVector)); \
-        tcg_temp_free(shift); \
     } while (0)
 
 #define fGEN_TCG_V6_vlsrb(SHORTCODE) \
@@ -254,7 +249,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
         tcg_gen_andi_tl(shift, RtV, 7); \
         tcg_gen_gvec_shrs(MO_8, VdV_off, VuV_off, shift, \
                           sizeof(MMVector), sizeof(MMVector)); \
-        tcg_temp_free(shift); \
     } while (0)
 
 #define fGEN_TCG_V6_vlsrh(SHORTCODE) \
@@ -263,7 +257,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
         tcg_gen_andi_tl(shift, RtV, 15); \
         tcg_gen_gvec_shrs(MO_16, VdV_off, VuV_off, shift, \
                           sizeof(MMVector), sizeof(MMVector)); \
-        tcg_temp_free(shift); \
     } while (0)
 
 #define fGEN_TCG_V6_vlsrw(SHORTCODE) \
@@ -272,7 +265,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
         tcg_gen_andi_tl(shift, RtV, 31); \
         tcg_gen_gvec_shrs(MO_32, VdV_off, VuV_off, shift, \
                           sizeof(MMVector), sizeof(MMVector)); \
-        tcg_temp_free(shift); \
     } while (0)
 
 /* Vector shift left - various forms */
@@ -282,7 +274,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
         tcg_gen_andi_tl(shift, RtV, 7); \
         tcg_gen_gvec_shls(MO_8, VdV_off, VuV_off, shift, \
                           sizeof(MMVector), sizeof(MMVector)); \
-        tcg_temp_free(shift); \
     } while (0)
 
 #define fGEN_TCG_V6_vaslh(SHORTCODE) \
@@ -291,7 +282,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
         tcg_gen_andi_tl(shift, RtV, 15); \
         tcg_gen_gvec_shls(MO_16, VdV_off, VuV_off, shift, \
                           sizeof(MMVector), sizeof(MMVector)); \
-        tcg_temp_free(shift); \
     } while (0)
 
 #define fGEN_TCG_V6_vaslh_acc(SHORTCODE) \
@@ -303,7 +293,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
                           sizeof(MMVector), sizeof(MMVector)); \
         tcg_gen_gvec_add(MO_16, VxV_off, VxV_off, tmpoff, \
                          sizeof(MMVector), sizeof(MMVector)); \
-        tcg_temp_free(shift); \
     } while (0)
 
 #define fGEN_TCG_V6_vaslw(SHORTCODE) \
@@ -312,7 +301,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
         tcg_gen_andi_tl(shift, RtV, 31); \
         tcg_gen_gvec_shls(MO_32, VdV_off, VuV_off, shift, \
                           sizeof(MMVector), sizeof(MMVector)); \
-        tcg_temp_free(shift); \
     } while (0)
 
 #define fGEN_TCG_V6_vaslw_acc(SHORTCODE) \
@@ -324,7 +312,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
                           sizeof(MMVector), sizeof(MMVector)); \
         tcg_gen_gvec_add(MO_32, VxV_off, VxV_off, tmpoff, \
                          sizeof(MMVector), sizeof(MMVector)); \
-        tcg_temp_free(shift); \
     } while (0)
 
 /* Vector max - various forms */
@@ -564,7 +551,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
         GET_EA; \
         PRED; \
         tcg_gen_brcondi_tl(TCG_COND_EQ, LSB, 0, false_label); \
-        tcg_temp_free(LSB); \
         gen_vreg_load(ctx, DSTOFF, EA, true); \
         INC; \
         tcg_gen_br(end_label); \
@@ -735,7 +721,6 @@ static inline void assert_vhist_tmp(DisasContext *ctx)
         GET_EA; \
         PRED; \
         tcg_gen_brcondi_tl(TCG_COND_EQ, LSB, 0, false_label); \
-        tcg_temp_free(LSB); \
         gen_vreg_store(ctx, EA, SRCOFF, insn->slot, ALIGN); \
         INC; \
         tcg_gen_br(end_label); \
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index cd64bb8eec..17facadaad 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -220,8 +220,6 @@ static inline void gen_pred_cancel(TCGv pred, uint32_t slot_num)
     tcg_gen_andi_tl(tmp, pred, 1);
     tcg_gen_movcond_tl(TCG_COND_EQ, hex_slot_cancelled, tmp, zero,
                        slot_mask, hex_slot_cancelled);
-    tcg_temp_free(slot_mask);
-    tcg_temp_free(tmp);
 }
 #define PRED_LOAD_CANCEL(PRED, EA) \
     gen_pred_cancel(PRED, insn->is_endloop ? 4 : insn->slot)
@@ -376,10 +374,6 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv val, int shift)
     tcg_gen_deposit_tl(result, msb, lsb, 0, 7);
 
     tcg_gen_shli_tl(result, result, shift);
-
-    tcg_temp_free(msb);
-    tcg_temp_free(lsb);
-
     return result;
 }
 #define fREAD_IREG(VAL, SHIFT) gen_read_ireg(ireg, (VAL), (SHIFT))
@@ -512,7 +506,6 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv val, int shift)
         TCGv tmp = tcg_temp_new(); \
         tcg_gen_shli_tl(tmp, REG2, SCALE); \
         tcg_gen_add_tl(EA, REG, tmp); \
-        tcg_temp_free(tmp); \
     } while (0)
 #define fEA_IRs(IMM, REG, SCALE) \
     do { \
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 591461b043..86bd093ce8 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -65,8 +65,6 @@ static inline void gen_masked_reg_write(TCGv new_val, TCGv cur_val,
         tcg_gen_andi_tl(new_val, new_val, ~reg_mask);
         tcg_gen_andi_tl(tmp, cur_val, reg_mask);
         tcg_gen_or_tl(new_val, new_val, tmp);
-
-        tcg_temp_free(tmp);
     }
 }
 
@@ -90,8 +88,6 @@ static inline void gen_log_predicated_reg_write(int rnum, TCGv val,
         tcg_gen_setcond_tl(TCG_COND_EQ, slot_mask, slot_mask, zero);
         tcg_gen_or_tl(hex_reg_written[rnum], hex_reg_written[rnum], slot_mask);
     }
-
-    tcg_temp_free(slot_mask);
 }
 
 void gen_log_reg_write(int rnum, TCGv val)
@@ -137,9 +133,6 @@ static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val,
         tcg_gen_or_tl(hex_reg_written[rnum + 1], hex_reg_written[rnum + 1],
                       slot_mask);
     }
-
-    tcg_temp_free(val32);
-    tcg_temp_free(slot_mask);
 }
 
 static void gen_log_reg_write_pair(int rnum, TCGv_i64 val)
@@ -165,8 +158,6 @@ static void gen_log_reg_write_pair(int rnum, TCGv_i64 val)
         /* Do this so HELPER(debug_commit_end) will know */
         tcg_gen_movi_tl(hex_reg_written[rnum + 1], 1);
     }
-
-    tcg_temp_free(val32);
 }
 
 void gen_log_pred_write(DisasContext *ctx, int pnum, TCGv val)
@@ -189,8 +180,6 @@ void gen_log_pred_write(DisasContext *ctx, int pnum, TCGv val)
                        hex_new_pred_value[pnum], base_val);
     }
     tcg_gen_ori_tl(hex_pred_written, hex_pred_written, 1 << pnum);
-
-    tcg_temp_free(base_val);
 }
 
 static inline void gen_read_p3_0(TCGv control_reg)
@@ -238,7 +227,6 @@ static inline void gen_read_ctrl_reg_pair(DisasContext *ctx, const int reg_num,
         TCGv p3_0 = tcg_temp_new();
         gen_read_p3_0(p3_0);
         tcg_gen_concat_i32_i64(dest, p3_0, hex_gpr[reg_num + 1]);
-        tcg_temp_free(p3_0);
     } else if (reg_num == HEX_REG_PC - 1) {
         TCGv pc = tcg_constant_tl(ctx->base.pc_next);
         tcg_gen_concat_i32_i64(dest, hex_gpr[reg_num], pc);
@@ -250,14 +238,11 @@ static inline void gen_read_ctrl_reg_pair(DisasContext *ctx, const int reg_num,
         tcg_gen_addi_tl(insn_cnt, hex_gpr[HEX_REG_QEMU_INSN_CNT],
                         ctx->num_insns);
         tcg_gen_concat_i32_i64(dest, pkt_cnt, insn_cnt);
-        tcg_temp_free(pkt_cnt);
-        tcg_temp_free(insn_cnt);
     } else if (reg_num == HEX_REG_QEMU_HVX_CNT) {
         TCGv hvx_cnt = tcg_temp_new();
         tcg_gen_addi_tl(hvx_cnt, hex_gpr[HEX_REG_QEMU_HVX_CNT],
                         ctx->num_hvx_insns);
         tcg_gen_concat_i32_i64(dest, hvx_cnt, hex_gpr[reg_num + 1]);
-        tcg_temp_free(hvx_cnt);
     } else {
         tcg_gen_concat_i32_i64(dest,
             hex_gpr[reg_num],
@@ -273,7 +258,6 @@ static void gen_write_p3_0(DisasContext *ctx, TCGv control_reg)
         gen_log_pred_write(ctx, i, hex_p8);
         ctx_log_pred_write(ctx, i);
     }
-    tcg_temp_free(hex_p8);
 }
 
 /*
@@ -312,7 +296,6 @@ static inline void gen_write_ctrl_reg_pair(DisasContext *ctx, int reg_num,
         gen_write_p3_0(ctx, val32);
         tcg_gen_extrh_i64_i32(val32, val);
         gen_log_reg_write(reg_num + 1, val32);
-        tcg_temp_free(val32);
         ctx_log_reg_write(ctx, reg_num + 1);
     } else {
         gen_log_reg_write_pair(reg_num, val);
@@ -346,7 +329,6 @@ TCGv gen_get_byte_i64(TCGv result, int N, TCGv_i64 src, bool sign)
         tcg_gen_extract_i64(res64, src, N * 8, 8);
     }
     tcg_gen_extrl_i64_i32(result, res64);
-    tcg_temp_free_i64(res64);
 
     return result;
 }
@@ -371,7 +353,6 @@ void gen_set_half_i64(int N, TCGv_i64 result, TCGv src)
     TCGv_i64 src64 = tcg_temp_new_i64();
     tcg_gen_extu_i32_i64(src64, src);
     tcg_gen_deposit_i64(result, result, src64, N * 16, 16);
-    tcg_temp_free_i64(src64);
 }
 
 void gen_set_byte_i64(int N, TCGv_i64 result, TCGv src)
@@ -379,7 +360,6 @@ void gen_set_byte_i64(int N, TCGv_i64 result, TCGv src)
     TCGv_i64 src64 = tcg_temp_new_i64();
     tcg_gen_extu_i32_i64(src64, src);
     tcg_gen_deposit_i64(result, result, src64, N * 8, 8);
-    tcg_temp_free_i64(src64);
 }
 
 static inline void gen_load_locked4u(TCGv dest, TCGv vaddr, int mem_index)
@@ -412,7 +392,6 @@ static inline void gen_store_conditional4(DisasContext *ctx,
                               ctx->mem_idx, MO_32);
     tcg_gen_movcond_tl(TCG_COND_EQ, pred, tmp, hex_llsc_val,
                        one, zero);
-    tcg_temp_free(tmp);
     tcg_gen_br(done);
 
     gen_set_label(fail);
@@ -439,7 +418,6 @@ static inline void gen_store_conditional8(DisasContext *ctx,
     tcg_gen_movcond_i64(TCG_COND_EQ, tmp, tmp, hex_llsc_val_i64,
                         one, zero);
     tcg_gen_extrl_i64_i32(pred, tmp);
-    tcg_temp_free_i64(tmp);
     tcg_gen_br(done);
 
     gen_set_label(fail);
@@ -607,12 +585,10 @@ static void gen_cmpnd_cmp_jmp(DisasContext *ctx,
         TCGv pred = tcg_temp_new();
         gen_compare(cond1, pred, arg1, arg2);
         gen_log_pred_write(ctx, pnum, pred);
-        tcg_temp_free(pred);
     } else {
         TCGv pred = tcg_temp_new();
         tcg_gen_mov_tl(pred, hex_new_pred_value[pnum]);
         gen_cond_jump(ctx, cond2, pred, pc_off);
-        tcg_temp_free(pred);
     }
 }
 
@@ -666,12 +642,10 @@ static void gen_cmpnd_tstbit0_jmp(DisasContext *ctx,
         tcg_gen_andi_tl(pred, arg, 1);
         gen_8bitsof(pred, pred);
         gen_log_pred_write(ctx, pnum, pred);
-        tcg_temp_free(pred);
     } else {
         TCGv pred = tcg_temp_new();
         tcg_gen_mov_tl(pred, hex_new_pred_value[pnum]);
         gen_cond_jump(ctx, cond, pred, pc_off);
-        tcg_temp_free(pred);
     }
 }
 
@@ -681,7 +655,6 @@ static void gen_testbit0_jumpnv(DisasContext *ctx,
     TCGv pred = tcg_temp_new();
     tcg_gen_andi_tl(pred, arg, 1);
     gen_cond_jump(ctx, cond, pred, pc_off);
-    tcg_temp_free(pred);
 }
 
 static void gen_jump(DisasContext *ctx, int pc_off)
@@ -711,7 +684,6 @@ static void gen_cond_call(DisasContext *ctx, TCGv pred,
     tcg_gen_andi_tl(lsb, pred, 1);
     gen_write_new_pc_pcrel(ctx, pc_off, cond, lsb);
     tcg_gen_brcondi_tl(cond, lsb, 0, skip);
-    tcg_temp_free(lsb);
     next_PC =
         tcg_constant_tl(ctx->pkt->pc + ctx->pkt->encod_pkt_size_in_bytes);
     gen_log_reg_write(HEX_REG_LR, next_PC);
@@ -771,8 +743,6 @@ static void gen_endloop0(DisasContext *ctx)
         }
         gen_set_label(label3);
     }
-
-    tcg_temp_free(lpcfg);
 }
 
 static void gen_cmp_jumpnv(DisasContext *ctx,
@@ -781,7 +751,6 @@ static void gen_cmp_jumpnv(DisasContext *ctx,
     TCGv pred = tcg_temp_new();
     tcg_gen_setcond_tl(cond, pred, val, src);
     gen_cond_jump(ctx, TCG_COND_EQ, pred, pc_off);
-    tcg_temp_free(pred);
 }
 
 static void gen_cmpi_jumpnv(DisasContext *ctx,
@@ -790,7 +759,6 @@ static void gen_cmpi_jumpnv(DisasContext *ctx,
     TCGv pred = tcg_temp_new();
     tcg_gen_setcondi_tl(cond, pred, val, src);
     gen_cond_jump(ctx, TCG_COND_EQ, pred, pc_off);
-    tcg_temp_free(pred);
 }
 
 /* Shift left with saturation */
@@ -830,11 +798,6 @@ static void gen_shl_sat(TCGv dst, TCGv src, TCGv shift_amt)
     tcg_gen_or_tl(hex_new_value[HEX_REG_USR], hex_new_value[HEX_REG_USR], ovf);
 
     tcg_gen_movcond_tl(TCG_COND_EQ, dst, dst_sar, src, dst, satval);
-
-    tcg_temp_free(sh32);
-    tcg_temp_free(dst_sar);
-    tcg_temp_free(ovf);
-    tcg_temp_free(satval);
 }
 
 static void gen_sar(TCGv dst, TCGv src, TCGv shift_amt)
@@ -846,7 +809,6 @@ static void gen_sar(TCGv dst, TCGv src, TCGv shift_amt)
     TCGv tmp = tcg_temp_new();
     tcg_gen_umin_tl(tmp, shift_amt, tcg_constant_tl(31));
     tcg_gen_sar_tl(dst, src, tmp);
-    tcg_temp_free(tmp);
 }
 
 /* Bidirectional shift right with saturation */
@@ -869,8 +831,6 @@ static void gen_asr_r_r_sat(TCGv RdV, TCGv RsV, TCGv RtV)
     gen_sar(RdV, RsV, shift_amt);
 
     gen_set_label(done);
-
-    tcg_temp_free(shift_amt);
 }
 
 /* Bidirectional shift left with saturation */
@@ -893,8 +853,6 @@ static void gen_asl_r_r_sat(TCGv RdV, TCGv RsV, TCGv RtV)
     gen_shl_sat(RdV, RsV, shift_amt);
 
     gen_set_label(done);
-
-    tcg_temp_free(shift_amt);
 }
 
 static intptr_t vreg_src_off(DisasContext *ctx, int num)
@@ -924,7 +882,6 @@ static void gen_log_vreg_write(DisasContext *ctx, intptr_t srcoff, int num,
         /* Don't do anything if the slot was cancelled */
         tcg_gen_extract_tl(cancelled, hex_slot_cancelled, slot_num, 1);
         tcg_gen_brcondi_tl(TCG_COND_NE, cancelled, 0, label_end);
-        tcg_temp_free(cancelled);
     }
 
     if (type != EXT_TMP) {
@@ -965,7 +922,6 @@ static void gen_log_qreg_write(intptr_t srcoff, int num, int vnew,
         /* Don't do anything if the slot was cancelled */
         tcg_gen_extract_tl(cancelled, hex_slot_cancelled, slot_num, 1);
         tcg_gen_brcondi_tl(TCG_COND_NE, cancelled, 0, label_end);
-        tcg_temp_free(cancelled);
     }
 
     dstoff = offsetof(CPUHexagonState, future_QRegs[num]);
@@ -989,7 +945,6 @@ static void gen_vreg_load(DisasContext *ctx, intptr_t dstoff, TCGv src,
         tcg_gen_addi_tl(src, src, 8);
         tcg_gen_st_i64(tmp, cpu_env, dstoff + i * 8);
     }
-    tcg_temp_free_i64(tmp);
 }
 
 static void gen_vreg_store(DisasContext *ctx, TCGv EA, intptr_t srcoff,
@@ -1061,10 +1016,6 @@ static void vec_to_qvec(size_t size, intptr_t dstoff, intptr_t srcoff)
 
         tcg_gen_st8_i64(mask, cpu_env, dstoff + i);
     }
-    tcg_temp_free_i64(tmp);
-    tcg_temp_free_i64(word);
-    tcg_temp_free_i64(bits);
-    tcg_temp_free_i64(mask);
 }
 
 void probe_noshuf_load(TCGv va, int s, int mi)
@@ -1088,7 +1039,6 @@ void gen_set_usr_field_if(int field, TCGv val)
         tcg_gen_or_tl(hex_new_value[HEX_REG_USR],
                       hex_new_value[HEX_REG_USR],
                       tmp);
-        tcg_temp_free(tmp);
     } else {
         TCGLabel *skip_label = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, val, 0, skip_label);
@@ -1140,7 +1090,6 @@ void gen_sat_i64_ovfl(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width)
     ovfl_64 = tcg_temp_new_i64();
     tcg_gen_setcond_i64(TCG_COND_NE, ovfl_64, dest, source);
     tcg_gen_trunc_i64_tl(ovfl, ovfl_64);
-    tcg_temp_free_i64(ovfl_64);
 }
 
 void gen_satu_i64(TCGv_i64 dest, TCGv_i64 source, int width)
@@ -1158,7 +1107,6 @@ void gen_satu_i64_ovfl(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width)
     ovfl_64 = tcg_temp_new_i64();
     tcg_gen_setcond_i64(TCG_COND_NE, ovfl_64, dest, source);
     tcg_gen_trunc_i64_tl(ovfl, ovfl_64);
-    tcg_temp_free_i64(ovfl_64);
 }
 
 /* Implements the fADDSAT64 macro in TCG */
@@ -1182,15 +1130,12 @@ void gen_add_sat_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b)
 
     /* if (xor & mask) */
     tcg_gen_and_i64(cond1, xor, mask);
-    tcg_temp_free_i64(xor);
     tcg_gen_brcondi_i64(TCG_COND_NE, cond1, 0, no_ovfl_label);
-    tcg_temp_free_i64(cond1);
 
     /* else if ((a ^ sum) & mask) */
     tcg_gen_xor_i64(cond2, a, sum);
     tcg_gen_and_i64(cond2, cond2, mask);
     tcg_gen_brcondi_i64(TCG_COND_NE, cond2, 0, ovfl_label);
-    tcg_temp_free_i64(cond2);
     /* fallthrough to no_ovfl_label branch */
 
     /* if branch */
@@ -1201,10 +1146,7 @@ void gen_add_sat_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b)
     /* else if branch */
     gen_set_label(ovfl_label);
     tcg_gen_and_i64(cond3, sum, mask);
-    tcg_temp_free_i64(mask);
-    tcg_temp_free_i64(sum);
     tcg_gen_movcond_i64(TCG_COND_NE, ret, cond3, zero, max_pos, max_neg);
-    tcg_temp_free_i64(cond3);
     SET_USR_FIELD(USR_OVF, 1);
 
     gen_set_label(ret_label);
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 381fdaa3a8..93fd1b55e3 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -481,7 +481,6 @@ static void gen_pred_writes(DisasContext *ctx)
                                hex_new_pred_value[pred_num],
                                hex_pred[pred_num]);
         }
-        tcg_temp_free(pred_written);
     } else {
         for (i = 0; i < ctx->preg_log_idx; i++) {
             int pred_num = ctx->preg_log[i];
@@ -536,7 +535,6 @@ void process_store(DisasContext *ctx, int slot_num)
         /* Don't do anything if the slot was cancelled */
         tcg_gen_extract_tl(cancelled, hex_slot_cancelled, slot_num, 1);
         tcg_gen_brcondi_tl(TCG_COND_NE, cancelled, 0, label_end);
-        tcg_temp_free(cancelled);
     }
     {
         TCGv address = tcg_temp_new();
@@ -586,7 +584,6 @@ void process_store(DisasContext *ctx, int slot_num)
                 gen_helper_commit_store(cpu_env, slot);
             }
         }
-        tcg_temp_free(address);
     }
     if (is_predicated) {
         gen_set_label(label_end);
@@ -627,8 +624,6 @@ static void process_dczeroa(DisasContext *ctx)
         tcg_gen_qemu_st64(zero, addr, ctx->mem_idx);
         tcg_gen_addi_tl(addr, addr, 8);
         tcg_gen_qemu_st64(zero, addr, ctx->mem_idx);
-
-        tcg_temp_free(addr);
     }
 }
 
@@ -673,7 +668,6 @@ static void gen_commit_hvx(DisasContext *ctx)
 
             tcg_gen_andi_tl(cmp, hex_VRegs_updated, 1 << rnum);
             tcg_gen_brcondi_tl(TCG_COND_EQ, cmp, 0, label_skip);
-            tcg_temp_free(cmp);
             tcg_gen_gvec_mov(MO_64, dstoff, srcoff, size, size);
             gen_set_label(label_skip);
         } else {
@@ -706,7 +700,6 @@ static void gen_commit_hvx(DisasContext *ctx)
 
             tcg_gen_andi_tl(cmp, hex_QRegs_updated, 1 << rnum);
             tcg_gen_brcondi_tl(TCG_COND_EQ, cmp, 0, label_skip);
-            tcg_temp_free(cmp);
             tcg_gen_gvec_mov(MO_64, dstoff, srcoff, size, size);
             gen_set_label(label_skip);
         } else {
diff --git a/target/hexagon/README b/target/hexagon/README
index 2e32639fb7..251960b862 100644
--- a/target/hexagon/README
+++ b/target/hexagon/README
@@ -88,7 +88,6 @@ tcg_funcs_generated.c.inc
         gen_helper_A2_add(RdV, cpu_env, RsV, RtV);
         gen_log_reg_write(RdN, RdV);
         ctx_log_reg_write(ctx, RdN);
-        tcg_temp_free(RdV);
     }
 
 helper_funcs_generated.c.inc
@@ -160,12 +159,8 @@ istruction.
         tcg_gen_addi_ptr(VvV, cpu_env, VvV_off);
         TCGv slot = tcg_constant_tl(insn->slot);
         gen_helper_V6_vaddw(cpu_env, VdV, VuV, VvV, slot);
-        tcg_temp_free(slot);
         gen_log_vreg_write(ctx, VdV_off, VdN, EXT_DFL, insn->slot, false);
         ctx_log_vreg_write(ctx, VdN, EXT_DFL, false);
-        tcg_temp_free_ptr(VdV);
-        tcg_temp_free_ptr(VuV);
-        tcg_temp_free_ptr(VvV);
     }
 
 Notice that we also generate a variable named <operand>_off for each operand of
-- 
2.34.1


