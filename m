Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWJV-0007uz-DS
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJN-00078w-2O
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:33 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJC-0005Zk-UW
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:31 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 132so2822999pgh.13
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXCMxBWQmLHmmqt1iKjCO3RiwtMJobhj4kTdr9q0fJo=;
 b=Iytrot8CZ+x91sOgJ81SvVKzTnlb4e5C49eQ32YhiCL1b6jIwY6hVlmR5fRsxMR+1c
 QOq1fBVAA9EgKhCd516whjlNxq7oRQ3RMhA7FVVCcfY+F1vOiMXEDHTPY6q7hn+bMR8X
 wNIbm+UDhTavVxC8EBJT9L3Sk+YtgqQD4PeABJUnuPO6lYSgOT1nAMwpFEj4gAFZEN2r
 wc4pxQ6lgyxvzTfj0mh0FySJt8/vbIdh/pYRVx9Lm18lYUdP02stRIJINu5UE36T3lGv
 l9RnVpbyxcr9yv5yl2j6dPLjqyKBk+Z0DSuqdQC7YFUzLgciBo8PCSsPY0Io9+Q72Oyy
 YZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXCMxBWQmLHmmqt1iKjCO3RiwtMJobhj4kTdr9q0fJo=;
 b=7kNZFmSniqwdXD8UrT0wa+yPG05IhD0pAL1ZNQ1mBrNRV+qeSCGTUvAb7fFALqq7Mj
 8vjNkiPnAoHfDLPaxx1wl9jLsuNcC9FpkOdSP0fVI0IvcVQvd9X5LyuNLlhRVEMEg+Ff
 1mkgYiE4EascquoF4x6TMfkGIbtcjIachJLGlGoT/HnBpbaj4ZwnCX22aQg9j1DW0ISn
 ot87Vd+WTCrJznk8h9sZSCvCJYzaoHhoGSiOINWapDKwEx5hrtceerBxHgqRqmDAzSk2
 5Z9dlSGD+V1y/ikQwvCiLZNkLIIOoWgPsNxbwsYe4SIsuTycCZIIlHmMg8tNVEkmkezq
 1afg==
X-Gm-Message-State: AO0yUKXPAaTiSOU0JA4rmJfNDH2zZv/5NsdhSVHoJ3dbT/rs+7sLmgtm
 24h/+4fLvfvlZRowfuhxIDbI4Q==
X-Google-Smtp-Source: AK7set9es0/of0CgTgN/Jwj4x78Q5E8nBkYvj+XicdJoKUqWgmW/Lwv9SP32UhbX0dSuTrvJEsLfIg==
X-Received: by 2002:aa7:9597:0:b0:5a8:4b27:5db2 with SMTP id
 z23-20020aa79597000000b005a84b275db2mr20400884pfj.1.1677476661484; 
 Sun, 26 Feb 2023 21:44:21 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:44:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 37/70] target/ppc: Avoid tcg_const_* in vmx-impl.c.inc
Date: Sun, 26 Feb 2023 19:42:00 -1000
Message-Id: <20230227054233.390271-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:44:33 -0000

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vmx-impl.c.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index ca27c11d87..112233b541 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1624,7 +1624,7 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
             gen_exception(ctx, POWERPC_EXCP_VPU);                       \
             return;                                                     \
         }                                                               \
-        uimm = tcg_const_i32(UIMM5(ctx->opcode));                       \
+        uimm = tcg_constant_i32(UIMM5(ctx->opcode));                    \
         rb = gen_avr_ptr(rB(ctx->opcode));                              \
         rd = gen_avr_ptr(rD(ctx->opcode));                              \
         gen_helper_##name(cpu_env, rd, rb, uimm);                       \
@@ -1965,7 +1965,7 @@ static void gen_vsldoi(DisasContext *ctx)
     ra = gen_avr_ptr(rA(ctx->opcode));
     rb = gen_avr_ptr(rB(ctx->opcode));
     rd = gen_avr_ptr(rD(ctx->opcode));
-    sh = tcg_const_i32(VSH(ctx->opcode));
+    sh = tcg_constant_i32(VSH(ctx->opcode));
     gen_helper_vsldoi(rd, ra, rb, sh);
 }
 
@@ -2575,7 +2575,7 @@ static void gen_##op(DisasContext *ctx)             \
     rb = gen_avr_ptr(rB(ctx->opcode));              \
     rd = gen_avr_ptr(rD(ctx->opcode));              \
                                                     \
-    ps = tcg_const_i32((ctx->opcode & 0x200) != 0); \
+    ps = tcg_constant_i32((ctx->opcode & 0x200) != 0); \
                                                     \
     gen_helper_##op(cpu_crf[6], rd, ra, rb, ps);    \
 }
@@ -2594,7 +2594,7 @@ static void gen_##op(DisasContext *ctx)             \
     rb = gen_avr_ptr(rB(ctx->opcode));              \
     rd = gen_avr_ptr(rD(ctx->opcode));              \
                                                     \
-    ps = tcg_const_i32((ctx->opcode & 0x200) != 0); \
+    ps = tcg_constant_i32((ctx->opcode & 0x200) != 0); \
                                                     \
     gen_helper_##op(cpu_crf[6], rd, rb, ps);        \
 }
@@ -2726,7 +2726,7 @@ static void gen_##op(DisasContext *ctx)       \
     }                                         \
     ra = gen_avr_ptr(rA(ctx->opcode));        \
     rd = gen_avr_ptr(rD(ctx->opcode));        \
-    st_six = tcg_const_i32(rB(ctx->opcode));  \
+    st_six = tcg_constant_i32(rB(ctx->opcode));  \
     gen_helper_##op(rd, ra, st_six);          \
 }
 
-- 
2.34.1


