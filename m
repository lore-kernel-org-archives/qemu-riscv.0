Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfIu0-0002jj-0M
	for mharc-qemu-riscv@gnu.org; Wed, 18 Nov 2020 03:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItx-0002hO-Fk
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:33:17 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItu-0004sw-1p
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:33:17 -0500
Received: by mail-pj1-x1031.google.com with SMTP id r9so661237pjl.5
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2020 00:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VaebsCk9K1Y9qJEuu5VY5G+5Sx7GFsn+qQdyCJE/iJw=;
 b=aoFMcbXcdO4UpK+WiTh0SsMuImS0LD0lCaQXsLsKWX/gPtq2gM2H0v7ODjWMMEJm+F
 vyn4CD/8yfgn92MR6VqsJ0V9sQkVIKa/+FRpSrdnn7B/jebaJ3WVsejZhqyQ3muPs8zk
 xrX92QwXNVBUoD4mSqGTYQa9OXiY7/yNzxogCDOfaF7EFlTeyZgSrXSFdbBPSGXIh8nh
 5jmPXdSuGaUN4fbpIC8uhzDEaznsrn0vBNp8j45hKTo9bvalMFSQgmLJkhR0rOBImIC6
 DMgizieawaS2URNzFuWqPKOyem2agWP0l7NO/rnLoUS1j/RfV+lDQmFxti0lVEAzE+Ke
 Ip5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VaebsCk9K1Y9qJEuu5VY5G+5Sx7GFsn+qQdyCJE/iJw=;
 b=R5XiT4PiWM4HtVTdVhDrZfF/5AXlhZBkIBe/sQiV+o5QlEmPXn9aImI+AOxzXy5OSy
 x524tcnEOjyvVqcDGvnrJLSTfmmYrujrgJ7YsLE4ox6P7T9Xw1kSwqmDu3mHpNp21y6J
 L5BtOz9HwAJ72vjDAFa7wShypxgixIDV0Cf3idYvKH3u2Na4ypKWQXSQYSsVI0tiIV/X
 QqIu7IndQympZhJ7hq8hvNxNZzmPhARSqhGSPeP5kEKacHt7HAQRa5bR3ai428aFcxAw
 tCAgn58/nnHmxZZbP0WZwXiUphbr2t9b/Eq6X4loWNdtX4ceL6qNTcx9JkEz/h7Ysbox
 FqqA==
X-Gm-Message-State: AOAM531oqASP6jbI9E4F4m30aRXEMouJCLu/5+ablTz4ngxVdeq7Q4+P
 SGyy0tU4nBSs6Qp+T1GvbPB8HOZIa57SQBvS55E=
X-Google-Smtp-Source: ABdhPJwx8ugxSLW0pUZ47g8UkvSZ9kvd4W786Xy61zhsVjjhdC57ztzCPTfo4sUDgWnnLJnTWI8IlA==
X-Received: by 2002:a17:90a:62c4:: with SMTP id
 k4mr3123683pjs.32.1605688392770; 
 Wed, 18 Nov 2020 00:33:12 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:33:12 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Frank Chang <frank.chang@sifive.com>
Subject: [RFC 14/15] target/riscv: rvb: add/sub with postfix zero-extend
Date: Wed, 18 Nov 2020 16:29:52 +0800
Message-Id: <20201118083044.13992-15-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Wed, 18 Nov 2020 08:33:18 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/insn32-64.decode           |  7 +++++
 target/riscv/insn_trans/trans_rvb.c.inc | 38 +++++++++++++++++++++++++
 target/riscv/translate.c                | 18 ++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 42bafbc03a0..5df10cd3066 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -107,6 +107,9 @@ gorcw      0010100 .......... 101 ..... 0111011 @r
 sh1addu_w  0010000 .......... 010 ..... 0111011 @r
 sh2addu_w  0010000 .......... 100 ..... 0111011 @r
 sh3addu_w  0010000 .......... 110 ..... 0111011 @r
+addwu      0000101 .......... 000 ..... 0111011 @r
+subwu      0100101 .......... 000 ..... 0111011 @r
+addu_w     0000100 .......... 000 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
@@ -116,3 +119,7 @@ sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
+
+addiwu     ................. 100 ..... 0011011 @i
+
+slliu_w    000010 ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 31d791236d9..c6fcdc5f0c1 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -434,4 +434,42 @@ GEN_TRANS_SHADDU_W(1)
 GEN_TRANS_SHADDU_W(2)
 GEN_TRANS_SHADDU_W(3)
 
+static bool trans_addwu(DisasContext *ctx, arg_addwu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_addwu);
+}
+
+static bool trans_addiwu(DisasContext *ctx, arg_addiwu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith_imm_tl(ctx, a, &gen_addwu);
+}
+
+static bool trans_subwu(DisasContext *ctx, arg_subwu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_subwu);
+}
+
+static bool trans_addu_w(DisasContext *ctx, arg_addu_w *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_addu_w);
+}
+
+static bool trans_slliu_w(DisasContext *ctx, arg_slliu_w *a)
+{
+    TCGv source1;
+    source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    tcg_gen_ext32u_tl(source1, source1);
+    tcg_gen_shli_tl(source1, source1, a->shamt);
+    gen_set_gpr(a->rd, source1);
+
+    tcg_temp_free(source1);
+    return true;
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 584550a9db2..9d36d2bd685 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -672,12 +672,24 @@ static void gen_addw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_ext32s_tl(ret, ret);
 }
 
+static void gen_addwu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_add_tl(ret, arg1, arg2);
+    tcg_gen_ext32u_tl(ret, ret);
+}
+
 static void gen_subw(TCGv ret, TCGv arg1, TCGv arg2)
 {
     tcg_gen_sub_tl(ret, arg1, arg2);
     tcg_gen_ext32s_tl(ret, ret);
 }
 
+static void gen_subwu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_sub_tl(ret, arg1, arg2);
+    tcg_gen_ext32u_tl(ret, ret);
+}
+
 static void gen_mulw(TCGv ret, TCGv arg1, TCGv arg2)
 {
     tcg_gen_mul_tl(ret, arg1, arg2);
@@ -1252,6 +1264,12 @@ GEN_SHADDU_W(1)
 GEN_SHADDU_W(2)
 GEN_SHADDU_W(3)
 
+static void gen_addu_w(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_add_tl(ret, arg1, arg2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


