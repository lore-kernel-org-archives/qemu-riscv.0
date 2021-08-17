Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG6Tg-0001h3-G1
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 17:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6Td-0001ap-Qp
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:29 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6Ta-0001Cq-MS
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:28 -0400
Received: by mail-pf1-x430.google.com with SMTP id m26so6249pff.3
 for <qemu-riscv@nongnu.org>; Tue, 17 Aug 2021 14:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gHsQub6dgXk5izfZm4KxXE3aZtQVWz9lmDcpviRGa+c=;
 b=WTKNHehtXWye8wZYoe1zfvBy2g+o9glNjJb2iPCwjdQr7Rs7h1ITxTO8ayA2yTf8p6
 vFTmUgthf05znKSnXyFTf1UJCG+BnxgXbV4bLDxpWEwS4KJ+WhFl/z//+3irGQ+DzaT+
 /fdC8KShX3b0QEhwaklHfQHnkscgY67baDY+65uUrObl6ocjAnIxvuXvhBtEMVN2iwOF
 F52/xyVtWeZv84CEvo+AC7PBS373rWfgtYfD/AUSX/lz5S2kq+bSGfdYbUwT9c7gjrmy
 EyQDtmhAi5UYsl/5wpkRZuOd4aAIjCceLikS8CwRzipYe5BECug9C67HzpRyxQavn7cM
 EvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gHsQub6dgXk5izfZm4KxXE3aZtQVWz9lmDcpviRGa+c=;
 b=WCpXrBbd4mTZIJ20YH5KmzlO9e0t8tTsnBwu41VRVDUsA7PwPBwvLXWTxQVN/1DP70
 Dw9wmEcEyZZH0p8oqTqZMdiBUXVqVkPxytWFImNIMir7yg44Ft5dbFUj56h13mVna1Sw
 iTtXFoLKsNTB+AntAB5bfkV/clzLP59m3GzjGRImbYrG25YtpI5br1itM2ihNjlEy2qR
 9LH1pv1haSNV22NCo/kokSWuk/za+GptWB0Ciy9RY1uFMbUHpeb4LAskYlmMv9wfip9C
 DAgwDjbd0ZCyNUuIqRm9sdW3ZLcrvy05mhLxWnOnUtnzxZMGV8zlWWwxbLFfCvsgE0Ex
 6NJw==
X-Gm-Message-State: AOAM533W79PJWyZ6KwdeBGvXvyCA8On3aS4/WVteR04fOCjQHsLM/olL
 vxDE1T8hQ48a35p6Q5DmM468hA==
X-Google-Smtp-Source: ABdhPJxVniYPrxnV/AujPW9FPrmgmPqnmylL2o/E18MkFp7W6aXWKKVtH5QzWv2EK41FHMLJmoitmQ==
X-Received: by 2002:a63:a511:: with SMTP id n17mr5337135pgf.156.1629235105425; 
 Tue, 17 Aug 2021 14:18:25 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com
Subject: [PATCH v2 12/21] target/riscv: Add gen_greviw
Date: Tue, 17 Aug 2021 11:17:54 -1000
Message-Id: <20210817211803.283639-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Aug 2021 21:18:30 -0000

Replicate the bswap special case from gen_grevi for
the word-sized operation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b97c3ca5da..af7694ed29 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -568,12 +568,24 @@ static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
     return gen_shift(ctx, a, EXT_ZERO, gen_helper_grev);
 }
 
+static void gen_greviw(TCGv dest, TCGv src, target_long shamt)
+{
+#if TARGET_LONG_BITS == 64
+    if (shamt == 32 - 8) {
+        /* rev4, byte swaps */
+        tcg_gen_bswap32_i64(dest, src, TCG_BSWAP_IZ | TCG_BSWAP_OS);
+        return;
+    }
+#endif
+    gen_helper_grev(dest, src, tcg_constant_tl(shamt));
+}
+
 static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_grev);
+    return gen_shift_imm_fn(ctx, a, EXT_ZERO, gen_greviw);
 }
 
 static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
-- 
2.25.1


