Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md8hY-0004F3-2j
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 06:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hP-0003no-WE; Wed, 20 Oct 2021 06:19:56 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hM-00030r-O6; Wed, 20 Oct 2021 06:19:55 -0400
Received: by mail-ed1-x532.google.com with SMTP id t16so24255605eds.9;
 Wed, 20 Oct 2021 03:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhMy1wtSNlrR+WThebIS2yNEL+ESPAJihTsSOi8MDEw=;
 b=o50T04x1x8l7/uUT9YBLWMOeFzouNpbRxwB/HYgG7BUkUWAZ64eaT24IQ/E6oYG27S
 ryCxVr4f6hjEa5sdKvH2fS4O52KOovRC/mTveSFP4WWnXLeDlMuIKwFX/NyJn6IkztH0
 LQ+sI+Fkpldf85cBErU1xLxeESCRjuiq/dREsPxp+mNAXNAiUCvYtXX5kOrzBn4hNEgc
 8dLS7S7f9l5VmfEPaL4caWB3d/NVSfg38GaweOidkmSNBhw3g+oSWFaM4cLFhbG5hE5s
 JdZ+IohSO+7SOU2Xw6zAi+v8ARC/VLBTlqoVcTDmuE1UdUPAuu63KTXSRD/MKv/5U8AL
 cKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhMy1wtSNlrR+WThebIS2yNEL+ESPAJihTsSOi8MDEw=;
 b=osJ+08idic6+WocJlXVoRhf4Uq9hklFjDZZ6YNEirgR3mKG/1purZGbK5VkFgzQF+w
 TlNgpKnRv0ItJGjUlRpyR62bzHUS8shSwq/iZKJhxy10fHIOSnd0W3moZCa5SYAWDck9
 Lkz/MNV6vG6Gzn+jJD3ieGEMRLCswZcNP54AJtDVHTmn7qGeloO4Yue2Il9ii+hI4kdC
 RzfDbOl6TnbWQW5Pk0g31XfrhSqacct1aUlgR6508mpLZlVJdkm8bpYaazAIY0EGeCcT
 C2rCxIKKSzAljprwotrv8bGVsbhUkcEI1HGnTOPQUakLopTAgsuPJTytigSr2tb9RQH9
 RYkA==
X-Gm-Message-State: AOAM5316NhGgwQCxrhdY/Cpbw4piRJIqf3ys5lzcd82/z1wGd1/loUnL
 TucsakoP73CzQk9gJpJRC0o=
X-Google-Smtp-Source: ABdhPJwn1T9uXuxN27gxjqm4rgtEuyyL4Qd5NVzLjw5kcD22Ync6pFnRYAkf0353shzp+mpqKl526A==
X-Received: by 2002:a17:906:3715:: with SMTP id
 d21mr46399780ejc.74.1634725189402; 
 Wed, 20 Oct 2021 03:19:49 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id k19sm821284ejg.13.2021.10.20.03.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:49 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v15 6/8] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
Date: Wed, 20 Oct 2021 13:19:33 +0300
Message-Id: <20211020101935.1369682-7-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
References: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
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
X-List-Received-Date: Wed, 20 Oct 2021 10:19:56 -0000

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


