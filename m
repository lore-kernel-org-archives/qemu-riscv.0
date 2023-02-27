Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWEX-0001bp-QA
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDN-0003aU-QC
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:23 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDI-0002qR-QJ
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:20 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so5073713pjz.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xoCNCTfOA+IAeo+WWbY5Cg+uzKY+6Jpeq9pYOaVqoU4=;
 b=eEXeZYqryIO4esXcaeanL0vDPI8EPf5U9pNPhL7mKmQTize1Y+j2Gr3fnFCvlruJxr
 fSQamKMTNbOAcRvSv9nXNWdLZL0169oflr0r7HD9IU5u4D3PS3Lf5LN9QszPewDyXulZ
 gkTlRa8sRgPFL44QGgNIwHA4LsSurAZIpXPBdtETyIHRRXMkpE2/bqIyLUPGqT35slVF
 cfWpX0g9aBlChvHsfwnVFJuK7Kb9umXaqhF85SLiKvhItBvrkYZC1xJI66Z5ARIYvYKU
 NWXskdv5fIQhd05hcYu6ExyncAadrgbakyAvmcGKCe0hWT6R1tlGRxFCU2u8Z5E2RYmf
 +UXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xoCNCTfOA+IAeo+WWbY5Cg+uzKY+6Jpeq9pYOaVqoU4=;
 b=NKLk0cIEFliT/18IUtUXFC+BBgB7i8HuHmPHfMkwMHLIRec4Dp/g6MGWGB8J3Vekyv
 uzS/GNx5XtAKV2G8xH7++aGQGWsOUBVCiPiiAyW7wMhqrivxMx8eXFT41Kd4TnNkDLnL
 xjbCsTLmO78HVzVoKN+ywRSPsWkC+t1ILZMnMKyK+d6gnCRts5vHJKd3sKhNB3X4J52v
 MYXfIK0du0OAFT2vWYaUOPrI29GPHqhUCgCSdeL/Nl0Ma37sJVnJ91NxT+YpT6xpirSd
 RWsAXCWzEzahYA2VY+KGbX/+itqw1Y1YSiNZ17c2WRpJsRAnJ8wmHsPOTR6U1RAC8t5X
 hiow==
X-Gm-Message-State: AO0yUKX9OXWCi6LSxWYFOGvKy7PT0/BI98JKRTfC7n+RjuarvdT8FQGJ
 tamQcLOToHpIPuyV0wWS6oJO8A==
X-Google-Smtp-Source: AK7set9z2fm9shIR7gpYhRF8SgjcXX35YWe+oZeXB0+2khqCH/BJUpkzgkx2hHS4ZeUmI3FzyXHe0Q==
X-Received: by 2002:a05:6a20:8e06:b0:bc:8b91:69a3 with SMTP id
 y6-20020a056a208e0600b000bc8b9169a3mr19386293pzj.46.1677476294259; 
 Sun, 26 Feb 2023 21:38:14 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 25/31] target/i386: Don't use tcg_temp_local_new
Date: Sun, 26 Feb 2023 19:36:55 -1000
Message-Id: <20230227053701.368744-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:38:25 -0000

Since tcg_temp_new is now identical, use that.
In some cases we can avoid a copy from A0 or T0.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a47d60f057..baf1cfc2bc 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3426,13 +3426,10 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 if (mod == 3) {
                     goto illegal_op;
                 }
-                a0 = tcg_temp_local_new();
-                t0 = tcg_temp_local_new();
+                a0 = s->A0;
+                t0 = s->T0;
                 label1 = gen_new_label();
 
-                tcg_gen_mov_tl(a0, s->A0);
-                tcg_gen_mov_tl(t0, s->T0);
-
                 gen_set_label(label1);
                 t1 = tcg_temp_new();
                 t2 = tcg_temp_new();
@@ -3444,9 +3441,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_brcond_tl(TCG_COND_NE, t0, t2, label1);
 
                 tcg_temp_free(t2);
-                tcg_temp_free(a0);
                 tcg_gen_neg_tl(s->T0, t0);
-                tcg_temp_free(t0);
             } else {
                 tcg_gen_neg_tl(s->T0, s->T0);
                 if (mod != 3) {
@@ -6248,13 +6243,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #endif
         {
             TCGLabel *label1;
-            TCGv t0, t1, t2, a0;
+            TCGv t0, t1, t2;
 
             if (!PE(s) || VM86(s))
                 goto illegal_op;
-            t0 = tcg_temp_local_new();
-            t1 = tcg_temp_local_new();
-            t2 = tcg_temp_local_new();
+            t0 = tcg_temp_new();
+            t1 = tcg_temp_new();
+            t2 = tcg_temp_new();
             ot = MO_16;
             modrm = x86_ldub_code(env, s);
             reg = (modrm >> 3) & 7;
@@ -6263,11 +6258,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_op_ld_v(s, ot, t0, s->A0);
-                a0 = tcg_temp_local_new();
-                tcg_gen_mov_tl(a0, s->A0);
             } else {
                 gen_op_mov_v_reg(s, ot, t0, rm);
-                a0 = NULL;
             }
             gen_op_mov_v_reg(s, ot, t1, reg);
             tcg_gen_andi_tl(s->tmp0, t0, 3);
@@ -6280,8 +6272,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_movi_tl(t2, CC_Z);
             gen_set_label(label1);
             if (mod != 3) {
-                gen_op_st_v(s, ot, t0, a0);
-                tcg_temp_free(a0);
+                gen_op_st_v(s, ot, t0, s->A0);
            } else {
                 gen_op_mov_reg_v(s, ot, rm, t0);
             }
@@ -6304,7 +6295,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             modrm = x86_ldub_code(env, s);
             reg = ((modrm >> 3) & 7) | REX_R(s);
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
-            t0 = tcg_temp_local_new();
+            t0 = tcg_temp_new();
             gen_update_cc_op(s);
             if (b == 0x102) {
                 gen_helper_lar(t0, cpu_env, s->T0);
@@ -7052,7 +7043,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->tmp2_i32 = tcg_temp_new_i32();
     dc->tmp3_i32 = tcg_temp_new_i32();
     dc->tmp4 = tcg_temp_new();
-    dc->cc_srcT = tcg_temp_local_new();
+    dc->cc_srcT = tcg_temp_new();
 }
 
 static void i386_tr_tb_start(DisasContextBase *db, CPUState *cpu)
-- 
2.34.1


