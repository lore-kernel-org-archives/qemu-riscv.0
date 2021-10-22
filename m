Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdz8j-000886-LG
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 14:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8d-0007wl-Uf; Fri, 22 Oct 2021 14:19:32 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8b-0004s7-1f; Fri, 22 Oct 2021 14:19:31 -0400
Received: by mail-ed1-x532.google.com with SMTP id y12so4266762eda.4;
 Fri, 22 Oct 2021 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W5iUGc82DsUx4SZybvXEZ9UtGiWCFpnb8VLX4xKVJzs=;
 b=kai3WcAjudwjf1eZ6DCIstvct+sU+5WefuxK/OPEsbddrDec0rPNlSHTepZl2uFoN5
 s3Rp3OM65NFvDgY02SAf7z/eMVrlgrbgoFJD/hY61TmnpQ5k9/LwxvKGfjGXsRy7dSMh
 FDDf4ucu6aWPL7qn4D2uuhtdTnEflewLGpSMvyE/0XTAfrPszcAf2/gLjGHu3+yKd3+f
 AjFKTQiBSyFAc89CFKa+Xxu5EQFLPkbwVuaIlQ667ko/FSiK8ED2RAikTX/Ty5nvR62K
 77x7vRwz0w0RJsshj1rWORfuUgWWAVEruvH6bHodhbl2rcr6PWb/fsJhTO4uV4oCvXyT
 JflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W5iUGc82DsUx4SZybvXEZ9UtGiWCFpnb8VLX4xKVJzs=;
 b=JyCN1Yyj90ooinCPosK+KJ1oO9bCw5LViYlKQm6Hvf8ee5VIXvGi5TKIO9B6TF9+Jt
 +gbLXuXGQxuLELZg1pq851ux+O9aBlTCxaNlCZIrhjVvhc9UKB+9PGbxCLqMXJF7B9vu
 Pj86mTu9ZvLiYqAFETAeYIuEXqksaHhsMN4jl+n0vaTGZDVfR7rFImrFMKsW6IoSgPx8
 fiFhW1l1AZCMUdpQ7DeY4GmzZN+OBAYKu2D6772pDUb3UUJP5jLESk4J7IOeJZy5UMCu
 Z6jZP27ync1r/2ozFFfX6PlCYdyPAa7mcm6A/OHLlPaOy93uXU6FcawGrwKNg438wlry
 4Vig==
X-Gm-Message-State: AOAM5308y385Ys/pnQtFWYktJcGig67XF1Tb+RaSOxvXPPxP+VfanN8q
 BiP0GF4tB8kpHNI08smGZe4=
X-Google-Smtp-Source: ABdhPJyb1/a2ZiAdnRtrY0NawG4S/dT1TwZVKmSILZG3s9OCOSElPwPCtPJBYYhINISF8Wv+ZyUF+A==
X-Received: by 2002:aa7:cd8b:: with SMTP id x11mr2068324edv.384.1634926767434; 
 Fri, 22 Oct 2021 11:19:27 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id p22sm4233079ejl.90.2021.10.22.11.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 11:19:26 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v16 6/8] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
Date: Fri, 22 Oct 2021 21:19:08 +0300
Message-Id: <20211022181910.1999197-7-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
References: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Fri, 22 Oct 2021 18:19:32 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rva.c.inc | 3 +++
 target/riscv/insn_trans/trans_rvd.c.inc | 2 ++
 target/riscv/insn_trans/trans_rvf.c.inc | 2 ++
 target/riscv/insn_trans/trans_rvi.c.inc | 2 ++
 target/riscv/translate.c                | 8 ++++++++
 5 files changed, 17 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index 6ea07d89b0..40fe132b04 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -25,6 +25,7 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
+    src1 = gen_pm_adjust_address(ctx, src1);
     tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
     if (a->aq) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -44,6 +45,7 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
     TCGLabel *l2 = gen_new_label();
 
     src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
+    src1 = gen_pm_adjust_address(ctx, src1);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
 
     /*
@@ -84,6 +86,7 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
     TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
     TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
 
+    src1 = gen_pm_adjust_address(ctx, src1);
     func(dest, src1, src2, ctx->mem_idx, mop);
 
     gen_set_gpr(ctx, a->rd, dest);
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index db9ae15755..64fb0046f7 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -31,6 +31,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
+    addr = gen_pm_adjust_address(ctx, addr);
 
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
 
@@ -51,6 +52,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
+    addr = gen_pm_adjust_address(ctx, addr);
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index bddbd418d9..b5459249c4 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -37,6 +37,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
+    addr = gen_pm_adjust_address(ctx, addr);
 
     dest = cpu_fpr[a->rd];
     tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
@@ -59,6 +60,7 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
+    addr = gen_pm_adjust_address(ctx, addr);
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
 
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 91dc438a3a..e51dbc41c5 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -144,6 +144,7 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
+    addr = gen_pm_adjust_address(ctx, addr);
 
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
     gen_set_gpr(ctx, a->rd, dest);
@@ -185,6 +186,7 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
+    addr = gen_pm_adjust_address(ctx, addr);
 
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
     return true;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d38f87d718..a5e6fa145d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -271,6 +271,14 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
+/*
+ * Temp stub: generates address adjustment for PointerMasking
+ */
+static TCGv gen_pm_adjust_address(DisasContext *s, TCGv src)
+{
+    return src;
+}
+
 #ifndef CONFIG_USER_ONLY
 /* The states of mstatus_fs are:
  * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
-- 
2.30.2


