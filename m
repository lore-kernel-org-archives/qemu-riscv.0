Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVILi-0003vW-Mh
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 15:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILZ-0003if-1n; Tue, 28 Sep 2021 15:00:57 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:43526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILX-0000yF-7M; Tue, 28 Sep 2021 15:00:56 -0400
Received: by mail-ed1-x52d.google.com with SMTP id v10so83012130edj.10;
 Tue, 28 Sep 2021 12:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tlteLcgV5pgcPc0BrSWtyap8sk2WF8Vs0CA3AHMqqbs=;
 b=ZkrRMNNEv2aYEWaNm9Bj7HOUmfqvBbKW8b0/bRMZNrVKVpXmF77iNlyEIm3G2N2QtJ
 JWZXPh1kRb24sNA18qj/TPnOY1EFFQwbQLCX2Nzdb+uJtQytCKXdhI4c3OVs4OGzz9jD
 CWFuLwCCHbzNAm9bseR0K4tHS948m1N1WEvVCDTIm2XPJP2LvcVUre+ago/pAM2INRUr
 OGqg+n0PYUcvhDVWv7n5m6A6RYuE8LVD+1zjJuHvrHYm2vyIyrEox7Z0kf4LB9CLj8Hx
 823+2MfuVl9pwx4dWOaV9u7vasdZeiXCW8aa77MOoLQBCDr+WZfeEj+H/f7cOsOh+nk9
 IZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tlteLcgV5pgcPc0BrSWtyap8sk2WF8Vs0CA3AHMqqbs=;
 b=SoeJDwJvrSDeX8mnEJIep+4o1T/OkGaQoKehNHbYxEUxBTscokLwbB3iUi2ROokv2I
 yB+yona7VH5yfpifZWt4VxjKCeDXiQqC01ZV0ohxMgrIcCIFMwQjH7owebdZGNISHvFX
 xUNMryW6929sqFURUNhYo/FpZzLQ0s4vPRHw3rse/cdjEoodhnmGiVN1ViM8TYCDXSfm
 /ZMRHSsmvQVQd/ehcGZ3xIfX6XwIIOWYFfx91n5gf1CV7hq0wdwYr6IW4dPI6JrYG22N
 n9OYAk3Rv8HfSnf8VDhFKGXHuI8BRGUvn+xzkvQ6tbDI9kXowaIJk10iFfPsCPc4jX8z
 4Zxw==
X-Gm-Message-State: AOAM532CTMxWmOcPquTZ7MsyJa/bxNntRALVmrK7C/PaKbyCQCOprF5D
 WqrEYuK49/4g50op5s0rKCk=
X-Google-Smtp-Source: ABdhPJzdyOs4b29SadbfAzIxaRBp1+2xpcihn880sHi7kvYRpBO7sI2hsPzWdLGekEKIlQceRJ5L4A==
X-Received: by 2002:a17:906:3a0f:: with SMTP id
 z15mr8925271eje.42.1632855653515; 
 Tue, 28 Sep 2021 12:00:53 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id f10sm4500330edu.70.2021.09.28.12.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 12:00:53 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v12 5/7] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
Date: Tue, 28 Sep 2021 22:00:34 +0300
Message-Id: <20210928190036.4114438-6-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
References: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52d.google.com
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
X-List-Received-Date: Tue, 28 Sep 2021 19:00:58 -0000

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
index 74b33fa3c9..de4997a3e5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -117,6 +117,16 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
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


