Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNmf-0007Wv-3b
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmd-0007UG-TS
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:43 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmb-0006DV-FU
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:43 -0400
Received: by mail-pg1-x530.google.com with SMTP id m21so9258047pgu.13
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b2VQJZ4SVd/BHGvUsiIojNw2Inf+6+8BGAFntZKL6Wc=;
 b=lT0qEmFzPqzulMdKTPnto+qZZ/wUq8aL/cA1gY9wYW2jzSGt+SuFgRL4YYS22yIU8/
 58W/gXw4Pk7IsaKvPCYKc74gWbFE+AQ5pZkPTdoBSIVtbXs6FM4g1E/jmPESrcb2k8hv
 /4LBWFciMoIDgebh/2Qh+W3/M1ze5kUfW+sHt/H34hwquWxydcjH+wf5QYGmikxvXwRX
 T/JO5ETOutAcfR7/bnfQW/nOukFySAN8dYNuF12LHJTe0a5PLYOerYjBm8TXo3ccgfLN
 BjKU8i1Ka9V0J7UbSsufar563C752ODnYo1aOHoPRW/LhiByUaWdXd8D2ch3XPgO9p6Y
 w8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b2VQJZ4SVd/BHGvUsiIojNw2Inf+6+8BGAFntZKL6Wc=;
 b=QjVERfpaNa698U5MtiHfUX0SWGeNEex0lXH8YE14ys6+F1mPupqWYKFgyR47LAzWIP
 +oLTiiNoxXaJB6IOdSg1h2wQMYS8OnrZPyt8yeuoWpPwgBVHISujIbPdn2RiK++AjTM1
 xtPtoR1XtaQXGfSqOj3ja44IvmYZ9K1hTYRNDyRlf3q465mKO+gugRa7zMT4A9aFqrpv
 Vku82/mqFP7mvO20h97eiSQ+9k33L4lSgZlPjkCjul+K09dFNNOlpMMzb+8rZtB/abk2
 r5FkFELNjk46zIVpocF5S4BDraMUqVO4js9miSrmhrSfxbQR03ZntTL7xqVOZmeZu2Qs
 2h9w==
X-Gm-Message-State: AOAM531Ir6OU8tJfICatQa6c1SuIVydPVXXhY+sth1CBSjO8zWeDteiq
 YGEnBFoUs8f72lqN++r/UXB0qA==
X-Google-Smtp-Source: ABdhPJxY/mh2vz8ykol8/CZ5dX2TcbGEIVIlgaaEgT5GEhJNdQDl5lN+5aYDv1VLqO82mHXAz3GrwA==
X-Received: by 2002:a05:6a00:888:b0:44c:c00e:189c with SMTP id
 q8-20020a056a00088800b0044cc00e189cmr9603064pfj.79.1635498160318; 
 Fri, 29 Oct 2021 02:02:40 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:02:39 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 49/76] target/riscv: rvv-1.0: mask-register logical
 instructions
Date: Fri, 29 Oct 2021 16:58:54 +0800
Message-Id: <20211029085922.255197-50-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 29 Oct 2021 09:02:44 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 target/riscv/vector_helper.c            | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 804f423d5bb..5c0c3d25478 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2652,7 +2652,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
 #define GEN_MM_TRANS(NAME)                                         \
 static bool trans_##NAME(DisasContext *s, arg_r *a)                \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
+    if (require_rvv(s) &&                                          \
+        vext_check_isa_ill(s)) {                                   \
         uint32_t data = 0;                                         \
         gen_helper_gvec_4_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 71d7b1e8796..f883fdf4749 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4231,7 +4231,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;          \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4241,9 +4240,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         b = vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
-    for (; i < vlmax; i++) {                              \
-        vext_set_elem_mask(vd, i, 0);                     \
-    }                                                     \
 }
 
 #define DO_NAND(N, M)  (!(N & M))
-- 
2.25.1


