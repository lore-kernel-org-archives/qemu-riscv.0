Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbffn-00031t-OZ
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 05:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffk-0002q6-9a
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 05:08:08 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffi-0002XM-IZ
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 05:08:08 -0400
Received: by mail-pj1-x1036.google.com with SMTP id oa4so8880880pjb.2
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gvT+ugt0RnwUYBQp1GdTW5HfV8/drZC1OIWiYgfWmCk=;
 b=bJiTOylpIVoP0+rMky2FSZ5gOp9gc1/paCv0mNWaZcJZTIf0BXps+5FmmU69gg9G6X
 iAVfsLxOjPWm2rakSCUXo9JclCezM9uDkCXjNTltkWJ3uFOyXdzQZzxOWwu/5INYa4w8
 JNGS5UXZ8Gpq9UDMiZqPEGJSOqLivKvuRD5OmQB402A5UedXmc7qhnqVshOSrov2Fr2h
 FhOKoAJ4ub8M6IjBccZcbFov/j0A78O2ClOWcjmUO2ZuogPG88nqN52/pTa2s77PBOZL
 mA7CSx0how8PdYAx6V+6L3a0vzOcOVoSmDMxPnsPyFyGZlbYX34KalbOlJruciXxFxJ8
 w6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gvT+ugt0RnwUYBQp1GdTW5HfV8/drZC1OIWiYgfWmCk=;
 b=393fAKvB/Fm8WnG5N9yeJeyw8Xrvz8Gkki89j0XEUBo7yCik0aI0S4KKTDwdnK9ZNF
 h5XvVOZ0z4urcQLYhxZ3fL+nhRnByR1kk8kkHc0qjnpjIm1b2jORlxcSuADASXPsMXA8
 CNM9ct5E5VoEvew8VsaHN0RoNHo0Y4vJplxSe+RcR6CjPlkOZ+vA6LC3KS3DfbTWWUBI
 SdcIDU7OC7Ie/T/DfsUMUa0GnMMKoAjovnEA628nrbH/+Z2PuuHeHot81hb3FFHQC93h
 iORRQI/Zmpx8wEW98w2OytzbZ1hLQSYvXsxvjWf/LCPTHAVxKl+Cx6nbphi8LxdKJCRg
 /uQA==
X-Gm-Message-State: AOAM5301Hoa0XTA3IIDrquH6aEGVE7QVBfpE/NgJ0CAeF1YNtdxFCawO
 QsdIFlzgLLHSjOEwRClFMREkuQ==
X-Google-Smtp-Source: ABdhPJwOZny19K2oWV3ZV7lt0zCwoQTHwbXcl4EgzKNHhU1+38M203/6WU9zRFbbbkc4i45yxYHlYA==
X-Received: by 2002:a17:902:6b0c:b0:13f:aaf4:3df3 with SMTP id
 o12-20020a1709026b0c00b0013faaf43df3mr60206plk.75.1634375284865; 
 Sat, 16 Oct 2021 02:08:04 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:487:fa85:301f:cc98:b428:6b86])
 by smtp.gmail.com with ESMTPSA id d138sm7208936pfd.74.2021.10.16.02.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 02:08:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 5/6] target/riscv: zfh: half-precision floating-point
 classify
Date: Sat, 16 Oct 2021 17:07:40 +0800
Message-Id: <20211016090742.3034669-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016090742.3034669-1-frank.chang@sifive.com>
References: <20211016090742.3034669-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 09:08:08 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/fpu_helper.c                 |  6 ++++++
 target/riscv/helper.h                     |  1 +
 target/riscv/insn32.decode                |  1 +
 target/riscv/insn_trans/trans_rvzfh.c.inc | 12 ++++++++++++
 4 files changed, 20 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index ec2009ee65b..388e23ca670 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -482,6 +482,12 @@ target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
     return float16_eq_quiet(frs1, frs2, &env->fp_status);
 }
 
+target_ulong helper_fclass_h(uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    return fclass_h(frs1);
+}
+
 target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
 {
     float16 frs1 = check_nanbox_h(rs1);
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9c89521d4ad..d25cf725c57 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -89,6 +89,7 @@ DEF_HELPER_FLAGS_2(fcvt_h_w, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3906c9fb201..6c4cde216bc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -754,6 +754,7 @@ fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
 feq_h      1010010  ..... ..... 010 ..... 1010011 @r
 flt_h      1010010  ..... ..... 001 ..... 1010011 @r
 fle_h      1010010  ..... ..... 000 ..... 1010011 @r
+fclass_h   1110010  00000 ..... 001 ..... 1010011 @r2
 fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
 fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 8d0959a6671..0549e25fb45 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -372,6 +372,18 @@ static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
     return true;
 }
 
+static bool trans_fclass_h(DisasContext *ctx, arg_fclass_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_fclass_h(dest, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
 static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
 {
     REQUIRE_FPU;
-- 
2.25.1


