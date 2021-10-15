Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbSu2-00005G-VR
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 15:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbStq-0008Pw-Uf; Fri, 15 Oct 2021 15:29:51 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:33388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbStk-0008Rh-Uj; Fri, 15 Oct 2021 15:29:50 -0400
Received: by mail-lf1-x12b.google.com with SMTP id j21so46407062lfe.0;
 Fri, 15 Oct 2021 12:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DweWpu1nyaYej/bfepjwL+LvuFwYZziMfgCW4ZOvBp0=;
 b=NBzwJZD0CpfJLW/9qzDxIZgguLLuI36nGdn1VgD3fM4rvn+LP4zFoqy87ArAmZZWzQ
 E3DWtEGwTl8fqva26BtxBPBQWCyDli1z1oz527ffM0YMd+ZNZtLDOwFgKCGQ7XsyTBhY
 9SLJBuh0LR/OtPCXTr8zjovh8p0GztB3Ul3dmMx6IEt+hcpWNVCzaxvakW+c68KOg1Ji
 yYWg1RGAZ/MMx7wasEvThmJtKucZZIa73SVNC3cl58VkMI2QbbaGlV8t/DZBh5O5NENi
 xL/kUmyRIH9Suh5S7WduNrBKtmHVbtpNj5rmvTPJqhxwfweaaibXkruduUT8htsjvywl
 U3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DweWpu1nyaYej/bfepjwL+LvuFwYZziMfgCW4ZOvBp0=;
 b=yxALqNc2TQgb7mnEP7WEAosEpLFtZq9lrjwxxy8zBW4W56tw32cVZ+WPvCQAkj0z3k
 WchoCuely/PZ5GST7vmi0DJwDnvDWc30Jj6yxbPGkv+WzvXsGYzSZiEqEs2YuhjQg9I1
 BzKzDp3tyBrfMVhfF8Hggk/VVtM1c3XQhW0JSTNfnuuA3TmpPHmKY5i/6GlujisYNzt1
 AE+THR3BTzJcrXtX4MNAt+T3Gv9cnP62BrwcMTWwtEfOgG+BBN1FnPXOcDcpTbAPs9P8
 eoecmkF7HKnwTb7JDw64bszhBFQw9/aufcuKKCImKyUsxTk1Utv7nVnFVRkLjML9Mt5j
 C5bA==
X-Gm-Message-State: AOAM532rJaj/ZxeGd5kzYWMEmN3BA6hyEcyjfj5oOcyMPECEDdqxgbRF
 X+UW4oD8ihG2phu/h1ZNm7rgM99YW22CgvCWjkU=
X-Google-Smtp-Source: ABdhPJypVM1Vhk6ZM+qLQQ+fS51lqYtnSf3WgG1542BZpi/9TFycxQsP9fYAOwsroG9KNLcZOF/B2Q==
X-Received: by 2002:a2e:8799:: with SMTP id n25mr15611198lji.174.1634326183199; 
 Fri, 15 Oct 2021 12:29:43 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id n19sm527261lfu.207.2021.10.15.12.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 12:29:42 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v13 5/7] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
Date: Fri, 15 Oct 2021 22:29:29 +0300
Message-Id: <20211015192931.227387-6-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 GAPPY_SUBJECT=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 19:29:53 -0000

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
index 6ea07d89b0..5bdc412191 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -25,6 +25,7 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
+    gen_pm_adjust_address(ctx, &src1, src1);
     tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
     if (a->aq) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -44,6 +45,7 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
     TCGLabel *l2 = gen_new_label();
 
     src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
+    gen_pm_adjust_address(ctx, &src1, src1);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
 
     /*
@@ -84,6 +86,7 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
     TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
     TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
 
+    gen_pm_adjust_address(ctx, &src1, src1);
     func(dest, src1, src2, ctx->mem_idx, mop);
 
     gen_set_gpr(ctx, a->rd, dest);
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index db9ae15755..40e73d9959 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -31,6 +31,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
+    gen_pm_adjust_address(ctx, &addr, addr);
 
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
 
@@ -51,6 +52,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
+    gen_pm_adjust_address(ctx, &addr, addr);
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index bddbd418d9..945dc75fdc 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -37,6 +37,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
+    gen_pm_adjust_address(ctx, &addr, addr);
 
     dest = cpu_fpr[a->rd];
     tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
@@ -59,6 +60,7 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
+    gen_pm_adjust_address(ctx, &addr, addr);
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
 
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 920ae0edb3..d4097b59f7 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -146,6 +146,7 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
+    gen_pm_adjust_address(ctx, &addr, addr);
 
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
     gen_set_gpr(ctx, a->rd, dest);
@@ -187,6 +188,7 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
+    gen_pm_adjust_address(ctx, &addr, addr);
 
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
     return true;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d2442f0cf5..95739b1e41 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -118,6 +118,16 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
     tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
 }
 
+/*
+ * Temp stub: generates address adjustment for PointerMasking
+ */
+static void gen_pm_adjust_address(DisasContext *s,
+                                  TCGv         *dst,
+                                  TCGv          src)
+{
+    tcg_gen_mov_tl(*dst, src);
+}
+
 /*
  * A narrow n-bit operation, where n < FLEN, checks that input operands
  * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
-- 
2.30.2


