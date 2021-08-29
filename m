Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKOy5-0001CM-UG
	for mharc-qemu-riscv@gnu.org; Sun, 29 Aug 2021 13:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mKOy3-00013V-JY; Sun, 29 Aug 2021 13:51:39 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:41952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mKOy1-0003RD-L0; Sun, 29 Aug 2021 13:51:39 -0400
Received: by mail-ed1-x52c.google.com with SMTP id eb14so8863748edb.8;
 Sun, 29 Aug 2021 10:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g+PumKIAElrYtAKpETEYK26W+8VFMET6XAdY4jj48ps=;
 b=JTqKPdYEddf5mKMaNLYC456L0x2QoD6COIwDH6YAoVR/MVAjlA1wEryV67lLALbRWT
 TM1NvlGbtze+V/b+Jd2L95vzzixfcklbKsB8DhpbIJtCDe61YGoUVRvFYup5VqLC5B17
 0guCPqDpLkQy7eGdhKh5QMP8CYYihKzDXzpSQm3HlFWeE527u3R/LMWK4/OD70unG7XI
 NLZh3+EFOhHfYwcG0kbgtcq0U9CnkWPQiPIMz6Uz5pIVGr3spyWJI2SoYVAjCk6IX8aM
 jYR/9Aba0RXmJZZfTBw9VwHh6asJt3lZKm7hfew2bRw1B0Ot06+A80A3nv8EZUJ9idSt
 Lt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g+PumKIAElrYtAKpETEYK26W+8VFMET6XAdY4jj48ps=;
 b=F6AFaTXD0Bs2/FFFcoJxqgUWWJCEYiSnzeFHBawft7kLGleDHn/jBj5Eyr/St1xwch
 5VgBJhN1nm04+nCElR33SCG0ap58IlZRCp+RB9jL7WxCkZBRDfpMG72RmG4X4KaOKiGA
 GB4Eqi0mhqBSp1ezWvI9TDg4/D5e83LIlMDQ3ThebVE1nyZoJbH7898Cnng8q0tV4ZQ+
 8vWzKmaNWx5d+442O7EHng6qr1Ri5GcIwcEBJ1ItYBLQxmzxDyhmbwdMk+EAv0Gc9K+m
 KMRhcIPqCUORwrhjzHQQGAGIHFDlgyCrgCJ2mjMGOYI9Q5Zh6wRd1GunlGCmuZkGyA7u
 r4yg==
X-Gm-Message-State: AOAM531RorHdxO/grEQ0/usDb9W7DU3VRmA/6YBLEhrWMnSh+bF9Re9K
 B/ETpr6J0rY6Ccatt4son6s=
X-Google-Smtp-Source: ABdhPJybVEYqcL951Tq/OP0bIqY2PLxvVeJR/7ae0UWBOHDjdr95IaQbV89T4ozP2Bb0le6umUUn7Q==
X-Received: by 2002:a05:6402:1d25:: with SMTP id
 dh5mr18312648edb.91.1630259495964; 
 Sun, 29 Aug 2021 10:51:35 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id e22sm6564361edu.35.2021.08.29.10.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 10:51:35 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 5/7] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
Date: Sun, 29 Aug 2021 20:51:18 +0300
Message-Id: <20210829175120.19413-6-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829175120.19413-1-space.monkey.delivers@gmail.com>
References: <20210829175120.19413-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 GAPPY_SUBJECT=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 29 Aug 2021 17:51:40 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rva.c.inc |  3 +++
 target/riscv/insn_trans/trans_rvd.c.inc |  2 ++
 target/riscv/insn_trans/trans_rvf.c.inc |  2 ++
 target/riscv/insn_trans/trans_rvi.c.inc |  2 ++
 target/riscv/translate.c                | 10 ++++++++++
 5 files changed, 19 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index ab2ec4f0a5..e8879a1a6b 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -26,6 +26,7 @@ static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
+    gen_pm_adjust_address(ctx, src1, src1);
     tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
     if (a->aq) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -46,6 +47,7 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
     TCGLabel *l2 = gen_new_label();
 
     gen_get_gpr(src1, a->rs1);
+    gen_pm_adjust_address(ctx, src1, src1);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
 
     gen_get_gpr(src2, a->rs2);
@@ -91,6 +93,7 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
     gen_get_gpr(src1, a->rs1);
     gen_get_gpr(src2, a->rs2);
 
+    gen_pm_adjust_address(ctx, src1, src1);
     (*func)(src2, src1, src2, ctx->mem_idx, mop);
 
     gen_set_gpr(a->rd, src2);
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 7e45538ae0..27a89d7f96 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -25,6 +25,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
     TCGv t0 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_pm_adjust_address(ctx, t0, t0);
 
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
 
@@ -40,6 +41,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
     TCGv t0 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_pm_adjust_address(ctx, t0, t0);
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index db1c0c9974..d81548a359 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -30,6 +30,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
     TCGv t0 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_pm_adjust_address(ctx, t0, t0);
 
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
     gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
@@ -47,6 +48,7 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     gen_get_gpr(t0, a->rs1);
 
     tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_pm_adjust_address(ctx, t0, t0);
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
 
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 6e736c9d0d..d0ba4a99ba 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -147,6 +147,7 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
     TCGv t1 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_pm_adjust_address(ctx, t0, t0);
 
     tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
     gen_set_gpr(a->rd, t1);
@@ -186,6 +187,7 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
     TCGv dat = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_pm_adjust_address(ctx, t0, t0);
     gen_get_gpr(dat, a->rs2);
 
     tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6983be5723..ab79da6711 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -94,6 +94,16 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
     tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
 }
 
+/*
+ * Temp stub: generates address adjustment for PointerMasking
+ */
+static void gen_pm_adjust_address(DisasContext *s,
+                                  TCGv_i64      dst,
+                                  TCGv_i64      src)
+{
+    tcg_gen_mov_i64(dst, src);
+}
+
 /*
  * A narrow n-bit operation, where n < FLEN, checks that input operands
  * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
-- 
2.20.1


