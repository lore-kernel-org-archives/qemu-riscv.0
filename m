Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIG30-0006b1-RH
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 15:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2z-0006Ur-3D
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:53 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2o-00039i-S3
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:52 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 ot2-20020a17090b3b4200b0019127f8ed87so562224pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vJ/pmJnEHhfxg/ptEpqhuR5Wn/nbZbRjoP5x1AyfD8g=;
 b=kkkATWy9uBhIZ58lDcdCsI+9cR8r1979UkjyLUSdvj8Vh7Unx0uV7l9JQY9+QmPCIo
 n6rCHYl8wVii5tU+VPKDVroIMM+vIidF8dyd4SFa+FW140/p9jfeNFq8vxUxUXnOIU5Q
 1ynukNSwvkv7ys0RpruUsWSknc3MiQgGgi6VckjM144v3M/jo/vu1SkshNUM9zksMPnL
 wntxiqxRap5qdssIjicChoYJ9oFomUgtTIOILBXriMrpWqc+qxVLHIp/reK0p0fO2diq
 UsyUgecMBeQ1RFnUiDx+4RBQktEXxjep2TLgvU2KfuC0jHxSGAZviPTxlTurfNiW19or
 IoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vJ/pmJnEHhfxg/ptEpqhuR5Wn/nbZbRjoP5x1AyfD8g=;
 b=riM4NMgLBj2A/T4Izig0BVjOuQ40YmBMDpVq5deHbt1O1rE3RyiaZ4izJtdiCmRo3X
 sgw3PharFlofbSZ/fv8coBX2yG0j4lCinYVYZ95ULZtNLNk7FU2iELlaJM284pcnCAaL
 GQVJIeiDMWPKWkItEZ0UftNhjoxdMSvAUN9qKHS+3QwytkG9lhn68CFLS2dsscx49J3u
 cMhOmqBVZoGUyCRWrI5/J0I0CP/LkpQLxxvzoGfqTiitpEZwqa3rysBZA47muZxqqdZ7
 Rx7ngqVx6BN0fNkUZ9lPnvMl85dvEzNpBmln8g8suj0WTBo3IrlB5VR+GXqcKadaFYHq
 pGsA==
X-Gm-Message-State: AOAM532Ed08hA2Dlb+6sfh4cNZVmOxIj3/c4HY+agu9DnOrxX++ARHV+
 3VsV8dXJRiCxW0SIW4PAeBpVOw==
X-Google-Smtp-Source: ABdhPJwnivNKvh5YCpPS1Dzej4ZNnmRCn7qEDuWjM69d9QHs0BmUcVku3QKHvorLK49QWwCO1+/SPQ==
X-Received: by 2002:a17:90a:b795:: with SMTP id
 m21mr227222pjr.143.1629748541297; 
 Mon, 23 Aug 2021 12:55:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v5 14/24] target/riscv: Use get_gpr in branches
Date: Mon, 23 Aug 2021 12:55:19 -0700
Message-Id: <20210823195529.560295-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 19:55:53 -0000

Narrow the scope of t0 in trans_jalr.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 9e8d99be51..a5249e71c2 100644
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


