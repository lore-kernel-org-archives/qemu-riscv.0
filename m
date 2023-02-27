Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWEX-0001Tl-0G
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDG-0003Tr-Aq
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:19 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDD-000318-TI
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:13 -0500
Received: by mail-pg1-x541.google.com with SMTP id z10so2835707pgr.8
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFzuw10fPpVdZT8YHItC/Ct7hZDecHi/kBTYhZQX5Yc=;
 b=saUlNmAiPUlLxAbmr2ChMTkrmHqhis+3yd55SQnZO9n3SYyLn03AA3qsUukQ6XjLKi
 bN2xzDxLEM2/L3Lq/CtOYautj55z6KUKYrHpw15LxNV1WfBJmdAAATH+HmCdV7QK5t6u
 CJ4M5j5uHZuG577nzuxnx0yBnhWkNgpKQL68CAXUrBnWp0kbIVlXjrgNdjJYA3sU/7Pb
 6/pqHKifXapmrhsZXzvLb7MtfumR//4fjfAUDE/Ojo9lEynyY8oLBJxavG6+r/PQMOaL
 vxjB0L1OxbmS6pwz0c+6anB5Ff8ECIxKdiNf9qqn6BxCdzSrg+BseC5P1DLpC4Ywhd9Y
 Cfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFzuw10fPpVdZT8YHItC/Ct7hZDecHi/kBTYhZQX5Yc=;
 b=TLsPDcuEzV9MvTo+zG7nD6LBwhamiKs3fPPNjDfG6c2usoJTa1+Vo766NAn5HXwIAF
 Z8I/gGmw8FUH43IxHzfF2FTeA3uZ9iVhBkEpubL1+pJC1cfKVSw7Ag+WLX0Bxyrusr0j
 55BLWGjekzCMVnpbLYhdaorb15TUONUl9O5tz2K/x9qApM2h6rgOEfCEkMQ+vCSBOgmz
 O16RaI/JU6WcJd/eZfkURbyS4WyNFVbqbkiaskaEOWWOaq7qSt++etXnrJlEXWVLA+MI
 8GwDI6EANf1iDcbuM6/SqeeOSRJljImpBliO0luRHS+rwsSDnMxvR1cKyf7cW6G3YRYx
 jRjQ==
X-Gm-Message-State: AO0yUKWaOKcwAGlIKmWu7SYIAZEi4+oEU4SLxgi+C/nzoBlHVzo8RKbL
 FeGH3RE//PsuY62wZAdHgEYp8g==
X-Google-Smtp-Source: AK7set9E3saBB4rhs8Y+GOHzaJYo5+8eXobzZvrrpsez8UJDdH67eDLLQEuiW12zFiUOA8ZtMn+BSg==
X-Received: by 2002:aa7:98c3:0:b0:5a8:4ba7:5840 with SMTP id
 e3-20020aa798c3000000b005a84ba75840mr21645028pfm.26.1677476289091; 
 Sun, 26 Feb 2023 21:38:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v4 23/31] target/hexagon/idef-parser: Drop gen_tmp_local
Date: Sun, 26 Feb 2023 19:36:53 -1000
Message-Id: <20230227053701.368744-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:38:21 -0000

This is now equivalent to gen_tmp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 24 ++-------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index dfb9c65b52..3025040640 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -307,26 +307,6 @@ HexValue gen_tmp(Context *c,
     return rvalue;
 }
 
-HexValue gen_tmp_local(Context *c,
-                       YYLTYPE *locp,
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
-    rvalue.is_manual = false;
-    rvalue.tmp.index = c->inst.tmp_count;
-    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
-        " = tcg_temp_new_i", &bit_width, "();\n");
-    c->inst.tmp_count++;
-    return rvalue;
-}
-
 HexValue gen_tmp_value(Context *c,
                        YYLTYPE *locp,
                        const char *value,
@@ -2161,8 +2141,8 @@ HexValue gen_rvalue_sat(Context *c, YYLTYPE *locp, HexSat *sat,
     assert_signedness(c, locp, sat->signedness);
 
     unsigned_str = (sat->signedness == UNSIGNED) ? "u" : "";
-    res = gen_tmp_local(c, locp, value->bit_width, sat->signedness);
-    ovfl = gen_tmp_local(c, locp, 32, sat->signedness);
+    res = gen_tmp(c, locp, value->bit_width, sat->signedness);
+    ovfl = gen_tmp(c, locp, 32, sat->signedness);
     OUT(c, locp, "gen_sat", unsigned_str, "_", bit_suffix, "_ovfl(");
     OUT(c, locp, &ovfl, ", ", &res, ", ", value, ", ", &width->imm.value,
         ");\n");
-- 
2.34.1


