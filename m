Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzaNI-0007vt-75
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 02:15:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaNG-0007rF-E0
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:15:22 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaNE-0004J1-Gu
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:15:22 -0500
Received: by mail-pg1-x52b.google.com with SMTP id n10so910421pgl.10
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 23:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cg/XSyBDgfWMKTaj4H5pnj/4AfFpWEh9kdHo1QO7YT0=;
 b=NS0ez8MPi0X4EbHi+B5qyNbwgnh1n7o3YbCOWWmYPbaeYUWRf7MfpB4eyIKlgmwam1
 l1zYrGNxwWp7pJRZRR7eD78psyz7haWU6jk/2S2HVDTn1lRPeoDHUfcTy46fjQQ2umJc
 GIuVh7yVfOMgBkEobbWQuq1KADVr3k4y35EItd3NRReIMebfWHgBgesP2lkivw6rUr+k
 7K592HJE3cFZo/BqTpjd7odUiJ/NosSGrrbtYqcdXJgyHRoFQIgslL8rQWrxQaI7bGv4
 pWa86q7uvFY7AAcn4kZ4/onDcNEd5iRz5IqICi0RWr0qfYSrn7MstwekNFaltB8sl8uK
 WM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cg/XSyBDgfWMKTaj4H5pnj/4AfFpWEh9kdHo1QO7YT0=;
 b=Qtd5E7mxno0JsR4GgNnm5FkL+0Bkx5K7ZK6Xe6/o0MXhny08MN9KtvA1xEMyjICxce
 neeor72v6jkQUug0JfBLga+FO93b5PnXNDek6YCWeEIiYFN6ZBA+BES+DpM0PFxaLFDW
 Fv2pTLZExrdQBG68HUrrlm/mGKLd6FuKJr3Jy/vQ7RojXBKnmQuUUZidHCVOF6Ib6xdA
 jJdxj6mbTqQn4rFQTHUodf/LK46x6uhj0EHRmGATXFC/fKmT5yYRe1kIlbnPgUYizlyX
 rkSYKRSkKWFSUrWOA9LwFVhP0WyY/dOHABknHHWEjb6y8OnffKBUa93VyV+MIo0UjWo1
 80Qw==
X-Gm-Message-State: AOAM532osWaeeOqeUzjcotMRWzNooA+c3uQXV1nHRd8P2D/kA/q1D4b0
 1XD0boeJk2SIdnz8CMIKh1tfUg==
X-Google-Smtp-Source: ABdhPJwJltMq326+RDedv4QOk0tqIEDlLzOZYYbiB6rW9NA1kseQQYwmJU1qXkcO9OGjoeYpRgI+/Q==
X-Received: by 2002:a62:2f03:0:b029:1af:b254:d1b0 with SMTP id
 v3-20020a622f030000b02901afb254d1b0mr1091981pfv.5.1610522119183; 
 Tue, 12 Jan 2021 23:15:19 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:15:18 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v4 15/16] target/riscv: rvb: add/shift with prefix zero-extend
Date: Wed, 13 Jan 2021 15:13:47 +0800
Message-Id: <20210113071350.24852-16-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113071350.24852-1-frank.chang@sifive.com>
References: <20210113071350.24852-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 07:15:22 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32-64.decode           |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 22 ++++++++++++++++++++++
 target/riscv/translate.c                |  6 ++++++
 3 files changed, 31 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 2f80b0c07ae..01b28718af5 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -107,6 +107,7 @@ gorcw      0010100 .......... 101 ..... 0111011 @r
 sh1add_uw  0010000 .......... 010 ..... 0111011 @r
 sh2add_uw  0010000 .......... 100 ..... 0111011 @r
 sh3add_uw  0010000 .......... 110 ..... 0111011 @r
+add_uw     0000100 .......... 000 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -116,3 +117,5 @@ sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
+
+slli_uw    00001. ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index ca987f2705f..94fcf822a36 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -390,4 +390,26 @@ GEN_TRANS_SHADD_UW(1)
 GEN_TRANS_SHADD_UW(2)
 GEN_TRANS_SHADD_UW(3)
 
+static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_add_uw);
+}
+
+static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
+{
+    TCGv source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    if (a->shamt < 32) {
+        tcg_gen_deposit_z_i64(source1, source1, a->shamt, 32);
+    } else {
+        tcg_gen_shli_i64(source1, source1, a->shamt);
+    }
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    return true;
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7365e591eb7..dbcc15ed73f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -930,6 +930,12 @@ GEN_SHADD_UW(1)
 GEN_SHADD_UW(2)
 GEN_SHADD_UW(3)
 
+static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_add_tl(ret, arg1, arg2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


