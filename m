Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1C-0006tV-Hq
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW16-0006l4-32
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:41 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW13-0007Jv-9Z
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:39 -0500
Received: by mail-pl1-x62b.google.com with SMTP id v11so2001339plz.8
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hocy2mGz2CCTt4Bq9qJMXd0ON/jxXgLLJ1IYsbDvM70=;
 b=Z3qB62jRnsosfZFFSnFsygvQwHDESxfA6NXeL/SrCxOH4nlJPz/sQnIq5WdwrbKbcq
 YallIXZuELjIHIiN9/0lt+SJdGu8U1NCnplKGkWm/kfYSIAEaE169XiEEnjfsbN2w3Lu
 zUsEirC+QmGVRnWIIjRSLzoWck4KIpiVOlhgs6TihYhii19HqJ9JOUl2HTGU4mc/nBkL
 GghIFUJnHhk4Aj87GYp3Rm3v+MEQseSGwOVmsJ2tfFmZkGtgyOWDbUr2/fDhXuPoKiYw
 mnwG+j4WfyubHZG9qw22iKv79dI97857/t85UVRCaEUIw0z6RQJXiJeawuAKRPLleO8z
 rCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hocy2mGz2CCTt4Bq9qJMXd0ON/jxXgLLJ1IYsbDvM70=;
 b=zvFTBqVlYp/SYUXZOftCqZS5x02xpnPuwqTv+H1smDrlMtzqD1VFgnqsz680+2NiJD
 n7y5Fh8JzQb3E9PDP4pxAzCNa59f6vNx9EppyfDsL15PfxNFf9LkBwcRy7jk0q0GdKsh
 8UWvVlieGT+XazqGB0ypZfnQjMETHSdn/FbG11axMmLQ2lYzsDK2OZobuf7374v0TSpp
 Gf4RJiqHSK0egrYLXc8311omh5dFgZhfMbPJmiEu1Rz2m2abVp0smkvK12llgnSt0i5M
 kYyb3MjNxfE1FVB+5AmvvF0z/dpfNRfKyzzQ5X6EvVr0y8b7FEFELtJpKAHmLwTg5Zw0
 slow==
X-Gm-Message-State: AO0yUKV9kVS8lBQY1IFsqDVaGqwXPcs7Nx1d5fX4UgQMkR5SxrXolMcn
 pRYrQ3NCIhmt7pMJqZrVuHhxNQ==
X-Google-Smtp-Source: AK7set8kol9HF9Xbb7B3wZ0EdzlGrvHSIx3cExvKYnzgr6V7Zxfhwi5c1uYhkK53No6Q8Eby3YXoCg==
X-Received: by 2002:a17:903:41cd:b0:199:10d2:b9da with SMTP id
 u13-20020a17090341cd00b0019910d2b9damr24884092ple.58.1677475529538; 
 Sun, 26 Feb 2023 21:25:29 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:25:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 07/76] target/arm: Drop DisasContext.tmp_a64
Date: Sun, 26 Feb 2023 19:23:56 -1000
Message-Id: <20230227052505.352889-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:25:42 -0000

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     |  3 ---
 target/arm/translate-a64.c | 25 +------------------------
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index db29e8d799..d7fdbc1e3e 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -149,9 +149,6 @@ typedef struct DisasContext {
     int c15_cpar;
     /* TCG op of the current insn_start.  */
     TCGOp *insn_start;
-#define TMP_A64_MAX 16
-    int tmp_a64_count;
-    TCGv_i64 tmp_a64[TMP_A64_MAX];
 } DisasContext;
 
 typedef struct DisasCompare {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2a0bba3815..98d1bee5d5 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -408,27 +408,9 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
     }
 }
 
-static void init_tmp_a64_array(DisasContext *s)
-{
-#ifdef CONFIG_DEBUG_TCG
-    memset(s->tmp_a64, 0, sizeof(s->tmp_a64));
-#endif
-    s->tmp_a64_count = 0;
-}
-
-static void free_tmp_a64(DisasContext *s)
-{
-    int i;
-    for (i = 0; i < s->tmp_a64_count; i++) {
-        tcg_temp_free_i64(s->tmp_a64[i]);
-    }
-    init_tmp_a64_array(s);
-}
-
 TCGv_i64 new_tmp_a64(DisasContext *s)
 {
-    assert(s->tmp_a64_count < TMP_A64_MAX);
-    return s->tmp_a64[s->tmp_a64_count++] = tcg_temp_new_i64();
+    return tcg_temp_new_i64();
 }
 
 TCGv_i64 new_tmp_a64_zero(DisasContext *s)
@@ -14781,8 +14763,6 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
         bound = 1;
     }
     dc->base.max_insns = MIN(dc->base.max_insns, bound);
-
-    init_tmp_a64_array(dc);
 }
 
 static void aarch64_tr_tb_start(DisasContextBase *db, CPUState *cpu)
@@ -14938,9 +14918,6 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         break;
     }
 
-    /* if we allocated any temporaries, free them here */
-    free_tmp_a64(s);
-
     /*
      * After execution of most insns, btype is reset to 0.
      * Note that we set btype == -1 when the insn sets btype.
-- 
2.34.1


