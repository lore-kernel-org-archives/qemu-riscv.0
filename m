Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWIk-0005Ho-3i
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIW-0004d6-A2
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:47 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIT-000580-0G
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:39 -0500
Received: by mail-pf1-x441.google.com with SMTP id fd25so2816124pfb.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFwp7rJLT3ezFoTtdpkm7g7WVshe2Fl4tPXf7GfT8CY=;
 b=Xys5m/BhbJaiCezwG82ZLYx/sXlKRyOWp1V43O+ESWxJ3q7z7L/1IWSXsz/lgCVpB2
 I8KNFl3Fu088dUar4wziVBNBRYCKoU3hQV5TH+h90k7dGz6S/tMJLB3XJqDSv8qh/E4f
 ghr49G7CYMIg+goESjyPWoDAbhfvQq4mCgU1R9EPILtsWX/UcB3oBtFaILFttPoHz+sY
 TMEHDTSYROdZv8CIOiqtdgN0wOHReaW9Y+WFNprr4rrDSCnOV9CTtkKDMxTEfvM45a89
 97D1MlecNJU0s/ZlDE8qVbvid6Z0MBRFJLDXUN7k5m586rIVYX1dkRRjtf2eryG8N77y
 QxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dFwp7rJLT3ezFoTtdpkm7g7WVshe2Fl4tPXf7GfT8CY=;
 b=sOJqGw4ZIieLKpFfSfxHfLtWeCgXLXQM6sn446j3uh5XyYksMh/0GQyQSLkEaD23pk
 Y5KZMMz5XW9jKgZCmE8jyACHuR594BPZ2OxGYZ28sEb/oURaKduaO7bETQvbPXtzeo8B
 teyJIRpnXDhDY6cYJsPY0aAI6ZUwUuZ+hI0aZah4i2Ouu4GS8/Y7q/AjqN8UwBKqojWx
 gecqFV8zIaL9y7WfcoDjiFWwcjHlx9DF7E2gO82A+R0iGBOIwScPLr4wwj6qOqhDPRSe
 BY8CgydmGgkEL9vem/jt7jWgz+yofYPO+xLVcicdJCElpkgm9NgpY7VFjKU9ihp1aQEh
 DNag==
X-Gm-Message-State: AO0yUKWypBODhageTPBVtQfIVwwPVLiAn65+TEffU5vZfQSarP/ghlIT
 V8qiXItUW8Jr5ZIyBBLdiFqfJw==
X-Google-Smtp-Source: AK7set8Rtcnirnn4zrZSrRGGY5iZBqATjlxAkru+dJEDU7IMIE+hPyNLIzT+4ftnI2iQsGnwmAmx/w==
X-Received: by 2002:aa7:9a1b:0:b0:590:921d:5740 with SMTP id
 w27-20020aa79a1b000000b00590921d5740mr20538709pfj.13.1677476615305; 
 Sun, 26 Feb 2023 21:43:35 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 19/70] target/hexagon/idef-parser: Use gen_constant for
 gen_extend_tcg_width_op
Date: Sun, 26 Feb 2023 19:41:42 -1000
Message-Id: <20230227054233.390271-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:47 -0000

We already have a temporary, res, which we can use for the intermediate
shift result.  Simplify the constant to -1 instead of 0xf*f.
This was the last use of gen_tmp_value, so remove it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 30 +++------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index c0e6f2190c..e1a55412c8 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -305,26 +305,6 @@ HexValue gen_tmp(Context *c,
     return rvalue;
 }
 
-static HexValue gen_tmp_value(Context *c,
-                       YYLTYPE *locp,
-                       const char *value,
-                       unsigned bit_width,
-                       HexSignedness signedness)
-{
-    HexValue rvalue;
-    assert(bit_width == 32 || bit_width == 64);
-    memset(&rvalue, 0, sizeof(HexValue));
-    rvalue.type = TEMP;
-    rvalue.bit_width = bit_width;
-    rvalue.signedness = signedness;
-    rvalue.is_dotnew = false;
-    rvalue.tmp.index = c->inst.tmp_count;
-    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
-        " = tcg_const_i", &bit_width, "(", value, ");\n");
-    c->inst.tmp_count++;
-    return rvalue;
-}
-
 static HexValue gen_constant_from_imm(Context *c,
                                       YYLTYPE *locp,
                                       HexValue *value)
@@ -1120,15 +1100,11 @@ static HexValue gen_extend_tcg_width_op(Context *c,
     OUT(c, locp, "tcg_gen_subfi_i", &dst_width);
     OUT(c, locp, "(", &shift, ", ", &dst_width, ", ", &src_width_m, ");\n");
     if (signedness == UNSIGNED) {
-        const char *mask_str = (dst_width == 32)
-            ? "0xffffffff"
-            : "0xffffffffffffffff";
-        HexValue mask = gen_tmp_value(c, locp, mask_str,
-                                     dst_width, UNSIGNED);
+        HexValue mask = gen_constant(c, locp, "-1", dst_width, UNSIGNED);
         OUT(c, locp, "tcg_gen_shr_i", &dst_width, "(",
-            &mask, ", ", &mask, ", ", &shift, ");\n");
+            &res, ", ", &mask, ", ", &shift, ");\n");
         OUT(c, locp, "tcg_gen_and_i", &dst_width, "(",
-            &res, ", ", value, ", ", &mask, ");\n");
+            &res, ", ", &res, ", ", value, ");\n");
     } else {
         OUT(c, locp, "tcg_gen_shl_i", &dst_width, "(",
             &res, ", ", value, ", ", &shift, ");\n");
-- 
2.34.1


