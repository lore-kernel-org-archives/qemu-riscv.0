Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1z-0008OB-0F
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1v-0008Iu-LM
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:31 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1s-0007iI-3R
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:31 -0500
Received: by mail-pl1-x641.google.com with SMTP id u5so2127771plq.7
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+x4VXTBSHjkJ17E29ZUX+j7Q1yyitgbjfDCvsbqBOhY=;
 b=G6Ie9lLEX+QUHBlmm7ymdhP0Y+aMant2l8Bg4XYNADDIntSeGH7UYmqlanHsfovo+a
 LbDaf7xYXnRawbaMmH3nEsPkX7p0H+b+GMg9A8ERcTHpzDpRfdc+zkn6ldSnBGrjePp8
 t5b1Z1tzm6Owq3jsbOqZVLXY6P4U3kroUTURd1KNJQPiSfFI4sAJTH5AkNCS3adcEA/Y
 rsUh8BxTjC2+f8/gzKHtd0OXppHcyoDPBk98nOQCFTBKk1nnb7jlsVXGTyprFbiH/lp0
 agBWM6dMMpjFoJRPyhnASB3LGzWOdhMqyxLhGUGc/Jb5Li48epx/PH7z182N0k1iRNaj
 MQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+x4VXTBSHjkJ17E29ZUX+j7Q1yyitgbjfDCvsbqBOhY=;
 b=zfIIaOztO6z7bPpzLfGZTgas/IM8r5lygeQL0fcrX9XcLeAUwI/f9hDUGthHe7hteF
 jZ9rQQzkUumoYYn3HfW6TECEtXqNcWD/vybWkFII2O0U28b6LdxIR4VMwbTiW34P1f05
 ni25jfxh19VAolTmvKIjv2J2x9dCe3p6ohvUfhk9/bMIdPs9mBrVTIB43+Qni2+nDA0z
 b+Ydnq04RjlSlPwnnNmhah1rJMC1/H2KPqVVnIyYEPn2VRSJCYb2rmvEAlW7eRly4giS
 ZfLjOHF1HPw7MXMJ7F8PXpiPJom0GbUuNb2DJ92xD0zPRteYfhXwQixR5HmX8BKLPbwB
 yVhw==
X-Gm-Message-State: AO0yUKU3SpvZPyGLCYIto8dTLvrLE5osDs5YNiN4hjeL+s0AOpkV2jAt
 GNb/9zfF82aKEBpXrzkSROrefg==
X-Google-Smtp-Source: AK7set99q7kWMYvmSQDIxS59NkYxQYRLN3967kRdH6EUMjnZbC+FvoEMUVMT3TIG0sKi5Zf4wX9How==
X-Received: by 2002:a17:903:32cf:b0:19a:8e52:ce0 with SMTP id
 i15-20020a17090332cf00b0019a8e520ce0mr31213701plr.58.1677475587257; 
 Sun, 26 Feb 2023 21:26:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 28/76] target/hexagon/idef-parser: Drop HexValue.is_manual
Date: Sun, 26 Feb 2023 19:24:17 -1000
Message-Id: <20230227052505.352889-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:26:31 -0000

This field is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/idef-parser.h    |  1 -
 target/hexagon/idef-parser/parser-helpers.c | 15 ---------------
 target/hexagon/idef-parser/idef-parser.y    |  2 --
 3 files changed, 18 deletions(-)

diff --git a/target/hexagon/idef-parser/idef-parser.h b/target/hexagon/idef-parser/idef-parser.h
index 5c49d4da3e..17d2ebfaf6 100644
--- a/target/hexagon/idef-parser/idef-parser.h
+++ b/target/hexagon/idef-parser/idef-parser.h
@@ -185,7 +185,6 @@ typedef struct HexValue {
     unsigned bit_width;         /**< Bit width of the rvalue                  */
     HexSignedness signedness;   /**< Unsigned flag for the rvalue             */
     bool is_dotnew;             /**< rvalue of predicate type is dotnew?      */
-    bool is_manual;             /**< Opt out of automatic freeing of params   */
 } HexValue;
 
 /**
diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index bdbb8b6a5f..0b401f7dbe 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -278,7 +278,6 @@ static HexValue gen_constant(Context *c,
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = true;
     rvalue.tmp.index = c->inst.tmp_count;
     OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
         " = tcg_constant_i", &bit_width, "(", value, ");\n");
@@ -299,7 +298,6 @@ HexValue gen_tmp(Context *c,
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.tmp.index = c->inst.tmp_count;
     OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
         " = tcg_temp_new_i", &bit_width, "();\n");
@@ -320,7 +318,6 @@ HexValue gen_tmp_value(Context *c,
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.tmp.index = c->inst.tmp_count;
     OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
         " = tcg_const_i", &bit_width, "(", value, ");\n");
@@ -339,7 +336,6 @@ static HexValue gen_tmp_value_from_imm(Context *c,
     rvalue.bit_width = value->bit_width;
     rvalue.signedness = value->signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.tmp.index = c->inst.tmp_count;
     /*
      * Here we output the call to `tcg_const_i<width>` in
@@ -375,7 +371,6 @@ HexValue gen_imm_value(Context *c __attribute__((unused)),
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.imm.type = VALUE;
     rvalue.imm.value = value;
     return rvalue;
@@ -390,7 +385,6 @@ HexValue gen_imm_qemu_tmp(Context *c, YYLTYPE *locp, unsigned bit_width,
     memset(&rvalue, 0, sizeof(HexValue));
     rvalue.type = IMMEDIATE;
     rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
     rvalue.bit_width = bit_width;
     rvalue.signedness = signedness;
     rvalue.imm.type = QEMU_TMP;
@@ -1242,15 +1236,12 @@ void gen_rdeposit_op(Context *c,
      */
     k64 = gen_bin_op(c, locp, SUB_OP, &k64, &width_m);
     mask = gen_bin_op(c, locp, LSR_OP, &mask, &k64);
-    begin_m.is_manual = true;
     mask = gen_bin_op(c, locp, ASL_OP, &mask, &begin_m);
-    mask.is_manual = true;
     value_m = gen_bin_op(c, locp, ASL_OP, &value_m, &begin_m);
     value_m = gen_bin_op(c, locp, ANDB_OP, &value_m, &mask);
 
     OUT(c, locp, "tcg_gen_not_i", &dst->bit_width, "(", &mask, ", ",
         &mask, ");\n");
-    mask.is_manual = false;
     res = gen_bin_op(c, locp, ANDB_OP, dst, &mask);
     res = gen_bin_op(c, locp, ORB_OP, &res, &value_m);
 
@@ -1410,8 +1401,6 @@ HexValue gen_convround(Context *c,
     HexValue and;
     HexValue src_p1;
 
-    src_m.is_manual = true;
-
     and = gen_bin_op(c, locp, ANDB_OP, &src_m, &mask);
     src_p1 = gen_bin_op(c, locp, ADD_OP, &src_m, &one);
 
@@ -1569,10 +1558,6 @@ HexValue gen_round(Context *c,
     b = gen_extend_op(c, locp, &src_width, 64, pos, UNSIGNED);
     b = rvalue_materialize(c, locp, &b);
 
-    /* Disable auto-free of values used more than once */
-    a.is_manual = true;
-    b.is_manual = true;
-
     n_m1 = gen_bin_op(c, locp, SUB_OP, &b, &one);
     shifted = gen_bin_op(c, locp, ASL_OP, &one, &n_m1);
     sum = gen_bin_op(c, locp, ADD_OP, &shifted, &a);
diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/idef-parser/idef-parser.y
index 59c93f85b4..fae291e5f8 100644
--- a/target/hexagon/idef-parser/idef-parser.y
+++ b/target/hexagon/idef-parser/idef-parser.y
@@ -534,7 +534,6 @@ rvalue : FAIL
              rvalue.imm.type = IMM_CONSTEXT;
              rvalue.signedness = UNSIGNED;
              rvalue.is_dotnew = false;
-             rvalue.is_manual = false;
              $$ = rvalue;
          }
        | var
@@ -693,7 +692,6 @@ rvalue : FAIL
          }
        | rvalue '?'
          {
-             $1.is_manual = true;
              Ternary t = { 0 };
              t.state = IN_LEFT;
              t.cond = $1;
-- 
2.34.1


