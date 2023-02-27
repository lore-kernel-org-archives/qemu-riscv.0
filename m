Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWO5-0006Ux-3z
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNH-0004FL-Dr
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:39 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNF-0007J5-1W
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:35 -0500
Received: by mail-pj1-x102e.google.com with SMTP id kb15so4919438pjb.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I0nuMJ82HVYxh2319z4AOHVFLixzgJR82pq22O8Q0Zc=;
 b=uE51e6SGXuXMjJMflHsSd5YBOdMR66VosqpLIe1cDZA2aXi3VGa4s8rUsKYyaAQUrl
 +fWCrOP3fVdtEFUfHs3nnwVnVXA3QWJxhlFIe+HCReQHlbNxgEQQUsVl5eG4/0Fyrde0
 bboOilhvKgdmlm/K/SPgkDiOtNlrGzKCGJHKThjtGGMhNHr809MHkqH4rEqFF8yQzkAR
 XwAOMu+bWgGFWBof58EmDypCgKQj4NLJ5Z2WFuNpwy2J9vPDx7ADobSR7Mpewc2YFP05
 Zn9xvTTP6013FenPZz78uBpG/SsmlUvMyoS3P3QzjS1joEk6Eckc4/t+lHcWpmhHAF2A
 iz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I0nuMJ82HVYxh2319z4AOHVFLixzgJR82pq22O8Q0Zc=;
 b=I6tcfOXstwsD5zObneDSTCIsy0l0NYQylNjthNllHOql0jKqaQSkeCqjNCWae3/xVb
 lo0dQPlLeqN8Ea4GSnKmlf2HipbOmzEkV3h83lqVSKwra/3Yp/xhibTtbiovxujglZ63
 mSpX1s3ibeYnnNjuen7/O0Slp1UHQ/pQpTiFZKa/084HagWO1kdOf+Jd02sIoRiilAW+
 b0EzSy2YSL+1lgLHUc3nPEnFgbMQ8l+e4VUaIAUrnDpEwzc8L85Vd92uLs4b1AXzz8hV
 I0rDokUCpiUAl/T0vJDGhr5P+gwo1gUYHn5oIgoCbYNRZiHZG1UZEFTl1Ri3o9MUu1rl
 TFvQ==
X-Gm-Message-State: AO0yUKUylqX/kH+yvyu3Cx+7qfkGY584ihs1Dc40nspXX+47kAlGZ1Pd
 a7AxeJhWoktp3rMicv991u3Qag==
X-Google-Smtp-Source: AK7set/xf78pk9zxxQK8k2a2OyfxZx4LDcPtOkWEjb9/ZhLRK4dUBcl9iBDv+mfRKlsNxMjUtPbTPg==
X-Received: by 2002:a17:902:e80d:b0:19a:b4a9:9df7 with SMTP id
 u13-20020a170902e80d00b0019ab4a99df7mr29397733plg.53.1677476911916; 
 Sun, 26 Feb 2023 21:48:31 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 63/70] target/xtensa: Tidy translate_clamps
Date: Sun, 26 Feb 2023 19:42:26 -1000
Message-Id: <20230227054233.390271-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:48:41 -0000

All writes to arg[0].out; use tcg_constant_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index e3fcd50691..d727f9ffd8 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1514,11 +1514,11 @@ static void translate_callxw(DisasContext *dc, const OpcodeArg arg[],
 static void translate_clamps(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 tmp1 = tcg_const_i32(-1u << arg[2].imm);
-    TCGv_i32 tmp2 = tcg_const_i32((1 << arg[2].imm) - 1);
+    TCGv_i32 tmp1 = tcg_constant_i32(-1u << arg[2].imm);
+    TCGv_i32 tmp2 = tcg_constant_i32((1 << arg[2].imm) - 1);
 
-    tcg_gen_smax_i32(tmp1, tmp1, arg[1].in);
-    tcg_gen_smin_i32(arg[0].out, tmp1, tmp2);
+    tcg_gen_smax_i32(arg[0].out, tmp1, arg[1].in);
+    tcg_gen_smin_i32(arg[0].out, arg[0].out, tmp2);
 }
 
 static void translate_clrb_expstate(DisasContext *dc, const OpcodeArg arg[],
-- 
2.34.1


