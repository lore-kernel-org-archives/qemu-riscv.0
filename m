Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mc9wq-0001qs-Rv
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 13:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wn-0001iq-0p; Sun, 17 Oct 2021 13:27:45 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wl-0003G6-5e; Sun, 17 Oct 2021 13:27:44 -0400
Received: by mail-ed1-x536.google.com with SMTP id g10so61269111edj.1;
 Sun, 17 Oct 2021 10:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhMy1wtSNlrR+WThebIS2yNEL+ESPAJihTsSOi8MDEw=;
 b=OO0Q7ClfqVAIpjQ2W3dUWyik5iu1EefyVby8suiNN3Kn1JjwRlbGB+zZM28DOlYaID
 orpQ1mQB3YyhSAaLiQKiOjn+Ne3tS1bTWubycX+bZTpxk7gu6Yd36K+rhOakjFaJmnCv
 nKg4hmTbgdI+YXYHA26Ls0Wl0IXzsRo+5GrEGCRYPeG4iP4VZbdtUg0zS3Qwtd8gUU72
 saWzvgGJlTQ5SI2zjpbPhGS2dj0HdZcUt9eMdLHLQWKNYBTeQMq/dhY3/mwtTT3Zdchx
 FHAxaAKtEJzjQ/NQDrMsnQcZ36F0jT0Erho1okaFAZ0fekmQ5hYn4Hdt0TxvNvwrGgA+
 eixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhMy1wtSNlrR+WThebIS2yNEL+ESPAJihTsSOi8MDEw=;
 b=Raf1luinaYsZjm7QIwa9mZqEtSPQjxhkUFqyYrMmHMh4aXId1MAYmthbaZZ5HAvgn9
 2J0BfsyPC9g1LJSsSgta0oPf3K5s5ZMr5U3qZRaHGlpy4JlaOqJP6AqxvZRIWjeRrR8A
 cRJS+oObJruCZ8ioKqMSXG4ESwVYTQ1CuNEl/zAO6iUIlnBYkuRQ88K+4ndj4bpzG6zc
 OvAMJ4akfLd23AhCXBwL5n/ys1Tg3fHTsWkz0ZLjlu5mUCb3pi99FVkHn1GlHuenqosG
 KQ4kx0vnKJ99qH4Rcpek1UhtVkKlTxFfkHm6bQs3NfWngCgyeDUl1nXwrXHRQJU2fUGo
 ZWaw==
X-Gm-Message-State: AOAM532q4i0kjFrMCYurq9YcoRjOr/sUoOepBD5h2V7rvguCllU7SZfX
 xsvwIe5nrtWoWqngtPLGpbE=
X-Google-Smtp-Source: ABdhPJwR72YN9WpTFXBgwq5O4ygrfLcr5XjlRLSNSUGWbc2bzDWxr+rEeeC+jBRzVQM7G/U9yiescQ==
X-Received: by 2002:a17:907:9687:: with SMTP id
 hd7mr21896227ejc.535.1634491661371; 
 Sun, 17 Oct 2021 10:27:41 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id v19sm7989814ejx.26.2021.10.17.10.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 10:27:41 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v14 6/8] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
Date: Sun, 17 Oct 2021 20:27:26 +0300
Message-Id: <20211017172728.759687-7-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
References: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Sun, 17 Oct 2021 17:27:45 -0000

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
index a6a57c94bb..8690c977d5 100644
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
index 6d7fbca1fa..9e176b8137 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -247,6 +247,14 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
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


