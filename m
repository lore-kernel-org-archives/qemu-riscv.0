Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqk3-0000x0-PS
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjN-0006Vp-9x
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:40 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjG-0003CT-Kb
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:35 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c10so206012pfv.13
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x5RhcaUXSQ5MfMxq0C6EBN7haRQoUvmPfbIAZ3PLMW4=;
 b=VUJ7RFfRVwbXo1RBt+nRsutOHLuWIV/8OqTOn2/rV6UeFM1DYBPojTr92lXn8ZMv55
 Z7jYSoKAbotdxwH+vWoEqNGjZKwvtTueCqnjzqdcieDUGNv84+DNyVdTWjF4UtZbsgUy
 mGlFVmk5CnQup8FHZeGrb0ZTD9+zTLxudo0n3mjrgB8mbyiMREHgVMsbnDByjZSIamgX
 jRPq4IPqSN2g5DFOgOqnT5b/8G7DIxXBOrkXSUlWjjV2qCgDi5Gy4T+i+vGpvyWCJJIb
 ZMVCcvHhd4hVzkTI0kwIvvUBW4OulJACgY/KZcuYq+9VVvR4qBKH6LREERWhKEyzouhf
 80Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x5RhcaUXSQ5MfMxq0C6EBN7haRQoUvmPfbIAZ3PLMW4=;
 b=g/bzUNp49Y1XAtD60SEokfOqnRMTGdZPYZKUstmPiddJKzp5uU6CW/Q6y6cFbOhXAd
 gcMrLsHwVL6RXOhnHZAPLJ7vq2CcR1vkouk4NNTn50EbEDOXJWZM5n+eJfaq5NRnhrgR
 bF3wSGHOKspGv+9ltD3DRjv6JREoQBP9lAp3imZzOoi1mheTUmeeaF5MqWZVNjpd+6F6
 tEyKVc3ObF1RHY8RD/8q4U5avqsLipGu1e/+90rrknNcmMMjCh/4eYaYlCV4+T3UY28Z
 kSlGVGKIYVv7RtLi+rkm+RVQh3kAJsYr4e4SOYYPzcGTTHJEQNf4onS10xOeFiZYARuY
 J3qw==
X-Gm-Message-State: AO0yUKWsaSdr6sahqcMZxpxl7d694kEXX1iVuQaDgJQHEKG5nPTURIdS
 JR7UacKeV9H0KsAJxr8b4in40w==
X-Google-Smtp-Source: AK7set8SDqyJbi2ZGXo/rAJ8reS1eiHqshfcM0p+VxW9HSQ50JQh0IO6cVYgfqDe6x1oCgn9jrjvew==
X-Received: by 2002:aa7:8f11:0:b0:5df:3aa1:10c5 with SMTP id
 x17-20020aa78f11000000b005df3aa110c5mr6774524pfr.14.1677316829736; 
 Sat, 25 Feb 2023 01:20:29 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 68/76] target/sparc: Drop free_compare
Date: Fri, 24 Feb 2023 23:14:19 -1000
Message-Id: <20230225091427.1817156-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:20:41 -0000

Translators are no longer required to free tcg temporaries.
Remove the g1 and g2 members of DisasCompare, as they were
used to track which temps needed to be freed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 560fb32e28..f32f237051 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -93,7 +93,6 @@ typedef struct DisasContext {
 typedef struct {
     TCGCond cond;
     bool is_bool;
-    bool g1, g2;
     TCGv c1, c2;
 } DisasCompare;
 
@@ -1066,16 +1065,6 @@ static inline void gen_op_next_insn(void)
     tcg_gen_addi_tl(cpu_npc, cpu_npc, 4);
 }
 
-static void free_compare(DisasCompare *cmp)
-{
-    if (!cmp->g1) {
-        tcg_temp_free(cmp->c1);
-    }
-    if (!cmp->g2) {
-        tcg_temp_free(cmp->c2);
-    }
-}
-
 static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
                         DisasContext *dc)
 {
@@ -1135,17 +1124,14 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
         cmp->cond = logic_cond[cond];
     do_compare_dst_0:
         cmp->is_bool = false;
-        cmp->g2 = false;
         cmp->c2 = tcg_const_tl(0);
 #ifdef TARGET_SPARC64
         if (!xcc) {
-            cmp->g1 = false;
             cmp->c1 = tcg_temp_new();
             tcg_gen_ext32s_tl(cmp->c1, cpu_cc_dst);
             break;
         }
 #endif
-        cmp->g1 = true;
         cmp->c1 = cpu_cc_dst;
         break;
 
@@ -1167,7 +1153,6 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
             if (!xcc) {
                 /* Note that sign-extension works for unsigned compares as
                    long as both operands are sign-extended.  */
-                cmp->g1 = cmp->g2 = false;
                 cmp->c1 = tcg_temp_new();
                 cmp->c2 = tcg_temp_new();
                 tcg_gen_ext32s_tl(cmp->c1, cpu_cc_src);
@@ -1175,7 +1160,6 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
                 break;
             }
 #endif
-            cmp->g1 = cmp->g2 = true;
             cmp->c1 = cpu_cc_src;
             cmp->c2 = cpu_cc_src2;
             break;
@@ -1192,7 +1176,6 @@ static void gen_compare(DisasCompare *cmp, bool xcc, unsigned int cond,
         /* We're going to generate a boolean result.  */
         cmp->cond = TCG_COND_NE;
         cmp->is_bool = true;
-        cmp->g1 = cmp->g2 = false;
         cmp->c1 = r_dst = tcg_temp_new();
         cmp->c2 = tcg_const_tl(0);
 
@@ -1258,7 +1241,6 @@ static void gen_fcompare(DisasCompare *cmp, unsigned int cc, unsigned int cond)
     /* For now we still generate a straight boolean result.  */
     cmp->cond = TCG_COND_NE;
     cmp->is_bool = true;
-    cmp->g1 = cmp->g2 = false;
     cmp->c1 = r_dst = tcg_temp_new();
     cmp->c2 = tcg_const_tl(0);
 
@@ -1342,8 +1324,6 @@ static void gen_cond(TCGv r_dst, unsigned int cc, unsigned int cond,
     } else {
         tcg_gen_setcond_tl(cmp.cond, r_dst, cmp.c1, cmp.c2);
     }
-
-    free_compare(&cmp);
 }
 
 static void gen_fcond(TCGv r_dst, unsigned int cc, unsigned int cond)
@@ -1357,8 +1337,6 @@ static void gen_fcond(TCGv r_dst, unsigned int cc, unsigned int cond)
     } else {
         tcg_gen_setcond_tl(cmp.cond, r_dst, cmp.c1, cmp.c2);
     }
-
-    free_compare(&cmp);
 }
 
 #ifdef TARGET_SPARC64
@@ -1378,8 +1356,6 @@ static void gen_compare_reg(DisasCompare *cmp, int cond, TCGv r_src)
 {
     cmp->cond = tcg_invert_cond(gen_tcg_cond_reg[cond]);
     cmp->is_bool = false;
-    cmp->g1 = true;
-    cmp->g2 = false;
     cmp->c1 = r_src;
     cmp->c2 = tcg_const_tl(0);
 }
@@ -1391,8 +1367,6 @@ static inline void gen_cond_reg(TCGv r_dst, int cond, TCGv r_src)
 
     /* The interface is to return a boolean in r_dst.  */
     tcg_gen_setcond_tl(cmp.cond, r_dst, cmp.c1, cmp.c2);
-
-    free_compare(&cmp);
 }
 #endif
 
@@ -3268,7 +3242,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                     l1 = gen_new_label();
                     tcg_gen_brcond_tl(tcg_invert_cond(cmp.cond),
                                       cmp.c1, cmp.c2, l1);
-                    free_compare(&cmp);
                 }
 
                 mask = ((dc->def->features & CPU_FEATURE_HYPV) && supervisor(dc)
@@ -3827,7 +3800,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                     cpu_src1 = get_src1(dc, insn);                 \
                     gen_compare_reg(&cmp, cond, cpu_src1);         \
                     gen_fmov##sz(dc, &cmp, rd, rs2);               \
-                    free_compare(&cmp);                            \
                 } while (0)
 
                 if ((xop & 0x11f) == 0x005) { /* V9 fmovsr */
@@ -3851,7 +3823,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         cond = GET_FIELD_SP(insn, 14, 17);              \
                         gen_fcompare(&cmp, fcc, cond);                  \
                         gen_fmov##sz(dc, &cmp, rd, rs2);                \
-                        free_compare(&cmp);                             \
                     } while (0)
 
                     case 0x001: /* V9 fmovscc %fcc0 */
@@ -3901,7 +3872,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         cond = GET_FIELD_SP(insn, 14, 17);              \
                         gen_compare(&cmp, xcc, cond, dc);               \
                         gen_fmov##sz(dc, &cmp, rd, rs2);                \
-                        free_compare(&cmp);                             \
                     } while (0)
 
                     case 0x101: /* V9 fmovscc %icc */
@@ -4713,7 +4683,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             tcg_gen_movcond_tl(cmp.cond, dst,
                                                cmp.c1, cmp.c2,
                                                cpu_src2, dst);
-                            free_compare(&cmp);
                             gen_store_gpr(dc, rd, dst);
                             break;
                         }
@@ -4745,7 +4714,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             tcg_gen_movcond_tl(cmp.cond, dst,
                                                cmp.c1, cmp.c2,
                                                cpu_src2, dst);
-                            free_compare(&cmp);
                             gen_store_gpr(dc, rd, dst);
                             break;
                         }
-- 
2.34.1


