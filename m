Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mH8YR-0006HL-Lp
	for mharc-qemu-riscv@gnu.org; Fri, 20 Aug 2021 13:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8YE-0005lA-Dr
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:30 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:44870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Y7-0003wm-1t
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:30 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s11so9887725pgr.11
 for <qemu-riscv@nongnu.org>; Fri, 20 Aug 2021 10:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qYb4KcS76i1HvVLzrH2TA0j+WopMecWVOQWs5FlWmg0=;
 b=Ln7xb5YIxIPuqdfQN8goufJ06Qe3vdea7pK5o6UEJL+Z/CP0nzvPDOzo/OI03If244
 JGFgnZOpDg357Bx0GKs2wL/xKKG5b4cqdHWHZGGkNLCiOAAkTUWHTKvy8uJevbk3VrjE
 22EA62nUpMkQ10n6U9O/U7mLMa6EhOMKbFiSgNmpgBKOTu7rBDr5zhDtVRizGook/B/p
 R495GCdi/Xx8JdyBzmAjIKJRi+5SsQ2g3Is+5zIIBzlFNtIk33szw/3TI2CJQJgYquXW
 H1VReHvxIU6h6E1g+buBV1A1JmERJc6IDJj0AP1TpqcM90XGRkoHtWk2PGSnNI8Cx7wI
 gkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qYb4KcS76i1HvVLzrH2TA0j+WopMecWVOQWs5FlWmg0=;
 b=EUqO9kUwfgyrDBZvRSiXZlvFXWRJ0dcTQ+A7YxxVLv6FcD7r5KtZS+OAbcOVftpTmK
 tdTrakzUvChI8Lans2i1b2hY3tkAuN2fE3qzhQkBIpPd6fquB5cbMtjXutj84gE/WtXF
 XQbMmWBJwY3aBvzxZQ1yG0WJ8wqAHnpvreyytARNnuCBpTSF6HHgvvkp+zhLaGphQGNB
 NnB7GdraeN5Lfrme7i7HQvlwAKMxJGaIraooB+LC883AmZcGL5IYQJDayw5eV/Jaz7vp
 OkydjikciX+Cmpsjtq73SQNhf82+37hfcSykB+hgTp5YEuIplrb2uT4ifPs+R/FH03Uv
 5kvA==
X-Gm-Message-State: AOAM531YcyYZ6Cu0rf8qqFOSLCIhr4x33KrfcAxawy9q9up6afBRXM7q
 QUv1YcRSmckMgeEDtXkdRGk1LywoCGM2Yg==
X-Google-Smtp-Source: ABdhPJwWukdqn7mluYBuOl7f8d3dwKJipaHhDEuDRH61Gvk67srfSAiL/oKRYlGwHiciLZt77ImpSA==
X-Received: by 2002:a63:4303:: with SMTP id q3mr19710002pga.375.1629481401708; 
 Fri, 20 Aug 2021 10:43:21 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 13/21] target/riscv: Use get_gpr in branches
Date: Fri, 20 Aug 2021 07:42:49 -1000
Message-Id: <20210820174257.548286-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Fri, 20 Aug 2021 17:43:30 -0000

Narrow the scope of t0 in trans_jalr.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index e25f64c45a..af3e0bc0e6 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -54,24 +54,25 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
 
 static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
 {
-    /* no chaining with JALR */
     TCGLabel *misaligned = NULL;
-    TCGv t0 = tcg_temp_new();
 
-
-    gen_get_gpr(ctx, cpu_pc, a->rs1);
-    tcg_gen_addi_tl(cpu_pc, cpu_pc, a->imm);
+    tcg_gen_addi_tl(cpu_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
 
     if (!has_ext(ctx, RVC)) {
+        TCGv t0 = tcg_temp_new();
+
         misaligned = gen_new_label();
         tcg_gen_andi_tl(t0, cpu_pc, 0x2);
         tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
+        tcg_temp_free(t0);
     }
 
     if (a->rd != 0) {
         tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
     }
+
+    /* No chaining with JALR. */
     lookup_and_goto_ptr(ctx);
 
     if (misaligned) {
@@ -80,21 +81,18 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 
-    tcg_temp_free(t0);
     return true;
 }
 
 static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 {
     TCGLabel *l = gen_new_label();
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
 
-    tcg_gen_brcond_tl(cond, source1, source2, l);
+    tcg_gen_brcond_tl(cond, src1, src2, l);
     gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
+
     gen_set_label(l); /* branch taken */
 
     if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
@@ -105,9 +103,6 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-
     return true;
 }
 
-- 
2.25.1


