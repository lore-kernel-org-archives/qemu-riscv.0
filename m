Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqdl-0004aS-MQ
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdd-0004Ng-Da
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:14:41 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqda-0001OM-TC
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:14:41 -0500
Received: by mail-pl1-x644.google.com with SMTP id u14so1874185ple.7
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9BPaQYLLp4+nmOO9gXaqu9l3zT8hpHGLtGA7cjOsUko=;
 b=Mt/F88kEjGQQnFv2SL01L5ZL2sVYh8ciwcEMa7iEfXhqvZfuJ8YtaTSPnyBBIWCDyV
 38PZcEQkuQ4cC4FBSYQa6txcRLnXSsrrA8Np8N3J1w/yfmkSgLMy0ykMmx9CLTcYS3z3
 m3Y5Y8YBDZqshMk+YT2YJGhUzWD7EJ/M6lrqjUcqQq9oFVxwA3g0nkfn0YY/OHl5IuZS
 uQ6X8u+5LSAbBLjO7qC03i1WOfHpHz31VVaafQfCryA0MWMMzVkunX7VxmIwQ3o7Xp1i
 uXjcgLesBMazW27iAVvh0TtcZyDgfe1TPN0E6+aqDfKtJZK37CceoOoVcAKlEBcU7ioE
 CMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9BPaQYLLp4+nmOO9gXaqu9l3zT8hpHGLtGA7cjOsUko=;
 b=xCuRbaZFLDqfk9HhZkuNhpzbZO3MHMgJYsZ6eLECSc7RgbS+Lcw/6cyXBBQ6lsP/75
 5Nj0PSyIGADxtywd583+JBpBWCcHLHTf0MoJMNQEIq5uLd6iWXs1E4H8HmOjmRMUcRRi
 dOJ+FschqrSvsTwFpKF+cdGEE3WevnX8R8LrPPhEAJ9fb8N6s5eGY49sKFR6Lo8glkzz
 lDHimTVfRi2jw7Pw1OmBbvtbzfI1cdLVz05rIZTU7yi1yhRQrUIlIwEY6nB9IEC27KSU
 2tQMTfI75rCSC/LVk2kR+BlZnnF+EsqY77lCZL9q0vuMLpwE1sMZGd3omQkCkyfl9sbx
 OSmA==
X-Gm-Message-State: AO0yUKW3F+N+692IoheUXpzF3vD4UQoxeomKpWZBidYVe8aTb1i5fPkc
 BM4Jm/sx1RJpHYPCcs5oVqYsTw==
X-Google-Smtp-Source: AK7set91Ng9OKED98Hu9wSg6j6Ab3iBd13jc3p72tXXurG6ucIIM38zrcVRvJFocGl2CNa6tGdR0xA==
X-Received: by 2002:a17:903:124e:b0:19c:a5df:3d56 with SMTP id
 u14-20020a170903124e00b0019ca5df3d56mr13542460plh.66.1677316477388; 
 Sat, 25 Feb 2023 01:14:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:14:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 02/76] accel/tcg: Remove translator_loop_temp_check
Date: Fri, 24 Feb 2023 23:13:13 -1000
Message-Id: <20230225091427.1817156-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:14:42 -0000

Finish removing tcg temp free accounting interfaces.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h  | 2 --
 accel/tcg/translator.c     | 4 ----
 target/alpha/translate.c   | 1 -
 target/arm/translate-a64.c | 2 --
 target/arm/translate.c     | 1 -
 target/ppc/translate.c     | 2 --
 6 files changed, 12 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 8b36690e80..797fef7515 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -150,8 +150,6 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
                      target_ulong pc, void *host_pc,
                      const TranslatorOps *ops, DisasContextBase *db);
 
-void translator_loop_temp_check(DisasContextBase *db);
-
 /**
  * translator_use_goto_tb
  * @db: Disassembly context
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 88567a88d1..b4183d0278 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -18,10 +18,6 @@
 #include "exec/plugin-gen.h"
 #include "sysemu/replay.h"
 
-void translator_loop_temp_check(DisasContextBase *db)
-{
-}
-
 bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 {
     /* Suppress goto_tb if requested. */
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 716b083f39..a0afdbb465 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -2996,7 +2996,6 @@ static void alpha_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     ctx->base.is_jmp = translate_one(ctx, insn);
 
     free_context_temps(ctx);
-    translator_loop_temp_check(&ctx->base);
 }
 
 static void alpha_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9da5010fe1..98537bc2ef 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14957,8 +14957,6 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     if (s->btype > 0 && s->base.is_jmp != DISAS_NORETURN) {
         reset_btype(s);
     }
-
-    translator_loop_temp_check(&s->base);
 }
 
 static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9c8e1ac04c..614c438786 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9600,7 +9600,6 @@ static void arm_post_translate_insn(DisasContext *dc)
         gen_set_label(dc->condlabel.label);
         dc->condjmp = 0;
     }
-    translator_loop_temp_check(&dc->base);
 }
 
 static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 2956021e89..c179f26f64 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7618,8 +7618,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     if (ctx->base.is_jmp == DISAS_NEXT && !(pc & ~TARGET_PAGE_MASK)) {
         ctx->base.is_jmp = DISAS_TOO_MANY;
     }
-
-    translator_loop_temp_check(&ctx->base);
 }
 
 static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


