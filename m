Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAu1-0000SM-Vx
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAu0-0000PB-Lk
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:04 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAty-0005WY-VM
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:04 -0400
Received: by mail-pf1-x441.google.com with SMTP id a14so874696pfi.2
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lVeIL6sco3ONh+Bbp+QoLOvs2rU2KjxsD48epcvi0xM=;
 b=EjVf2Uy9LM2r2fcwRB72VK7hQaoqvYib8AOkE367YBVhiXXwmCNpoNqodH3Qja6Rky
 muY7b6wb8hD4rLuSx/yfr3gkPC0iHq8XeQPJjGmEVAYL4JycZvqXCkzUAyAXfREsuQhv
 JLPTJKVeahXslxiDfZXka2LlF4m2jJxeynDmiM0mjUROfpqU8UvYh1wLe2EHfnJB3xhV
 S3sskPFx4Ozjfz8ZmvHbXC5L4mnFazOswJjs1aJILllHk8gqytZXVEZ+Ye9Mn6N16a5P
 +lpZMXzV08wC9ChVLJYw4A3aTZw/Q11ArTa7XQzuizn1fSBvgPympegI0BS0ruzsXZ/m
 DkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lVeIL6sco3ONh+Bbp+QoLOvs2rU2KjxsD48epcvi0xM=;
 b=XtduXjjq93FtvmXvGuFP3WdD9sVtSQ103PWEBn1IWZC4LMgTM5W7l4eYRDgSkxM8FJ
 rDGwbE4lOKWNNbSfh+3QL/EtOhY7XPOnFTbW0lKJfX3VOJWwdKLmBqizHrLVA+LQ3IMk
 D7hBvOKzO2+YD7FMfju36CyEd9PwPhCXZvRD7E1p8/BUzqiL6x8ebtLqpiffKh2E6+NR
 E6p36FKJ0yRdLBxlUa0vSBwyaJK6WOiOTqglmVqGJzZtSc77hIdYoqub3aUbYxWt9SKs
 4yxT8uLlB1uLiSxnCg9S45qTZGttjGGYeS0ZKQ0GKepf2xaN//v+RoUHmc4i4z6bVpPP
 lyGw==
X-Gm-Message-State: AOAM530GLAoldO5JQZEKFJ2CJVX8w7kLt5sl9mM6sfw7B9hdIPB569P2
 j2bIm6EDKN5qEWxAeGxQSSHPbw==
X-Google-Smtp-Source: ABdhPJw64aCt3pf0FJ5M1wE2OWKkAmRPTHmmsVTrirt2HeTLUuKDKJG2GYua1VP9fSA95KMlMLYVWw==
X-Received: by 2002:a62:6201:: with SMTP id w1mr28589831pfb.254.1595409541786; 
 Wed, 22 Jul 2020 02:19:01 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:19:01 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 21/76] target/riscv: rvv-0.9: configure instructions
Date: Wed, 22 Jul 2020 17:15:44 +0800
Message-Id: <20200722091641.8834-22-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Jul 2020 09:19:05 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 12 ++++++++----
 target/riscv/vector_helper.c            | 10 +++++++++-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 85738ba4f7..ca2ae59bb3 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -98,8 +98,10 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     s2 = tcg_temp_new();
     dst = tcg_temp_new();
 
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
+    if (a->rd == 0 && a->rs1 == 0) {
+        s1 = tcg_temp_new();
+        tcg_gen_mov_tl(s1, cpu_vl);
+    } else if (a->rs1 == 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
         s1 = tcg_const_tl(RV_VLEN_MAX);
     } else {
@@ -131,8 +133,10 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
     s2 = tcg_const_tl(a->zimm);
     dst = tcg_temp_new();
 
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
+    if (a->rd == 0 && a->rs1 == 0) {
+        s1 = tcg_temp_new();
+        tcg_gen_mov_tl(s1, cpu_vl);
+    } else if (a->rs1 == 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
         s1 = tcg_const_tl(RV_VLEN_MAX);
     } else {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index fb689ab3f9..9320eeabfd 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -36,7 +36,15 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     bool vill = FIELD_EX64(s2, VTYPE, VILL);
     target_ulong reserved = FIELD_EX64(s2, VTYPE, RESERVED);
 
-    if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
+    uint64_t lmul = (FIELD_EX64(s2, VTYPE, VFLMUL) << 2)
+        | FIELD_EX64(s2, VTYPE, VLMUL);
+    float vflmul = flmul_table[lmul];
+
+    if ((sew > cpu->cfg.elen)
+        || vill
+        || vflmul < ((float)sew / cpu->cfg.elen)
+        || (ediv != 0)
+        || (reserved != 0)) {
         /* only set vill bit. */
         env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
         env->vl = 0;
-- 
2.17.1


