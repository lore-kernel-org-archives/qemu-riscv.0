Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1i6A-0006cx-94
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5v-0006IW-4S
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:31 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5f-0001UU-Gw
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:30 -0400
Received: by mail-pf1-x435.google.com with SMTP id j9so1914180pfc.5
 for <qemu-riscv@nongnu.org>; Thu, 08 Jul 2021 21:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YLQLWU6UQVIyCDrZPADZhL8rRwVuD5u3CTypQGrVN5o=;
 b=io3KN9JTJ9ZQrhLCPU9wSB49BzCvWwNni6ZeOcJrCOves+hnpye0IVAoUSXHEhRxyN
 eTVYcHtyaIFQTA0Sdt7M4BNJ6d3dxzRlKYZSt6+hONmPn8AuAGANQDPG6D8et78gYyjc
 DTEPfFQLVcflqPH1uwXeEMzKRyicqmWYz90e27Y8l5RBjVYbuZFOelIlXwqo2qilHicD
 OzXX3G6bDLgi22ywkar/uCT5mNdxtdajP74bFEAJ+KWrmPCOV07SbW7T3mnzAKBFPoZD
 YeR6NdTdCXk8RrMf9jpQJAxCEKnLNSRz4QX/buRLOHh6a1hAng4lXecJpgw/b3/SSDya
 qhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YLQLWU6UQVIyCDrZPADZhL8rRwVuD5u3CTypQGrVN5o=;
 b=ndcV+07wU94L01dOJta36UT8y++NHDTO6xgsEiwhxfX1n2vZoFmW8h502YrHHQulhB
 caQx1CTh2hGRgUEIvomit8gjosDSW/SUWuyWwdLqw5kvGCcObUhMtEFjBeeFfuZqarOK
 g4uA8eM2wdVTEiWCcTiEEX0+W2GesCCWHGvYs9wg3iDlxGyfyotcB+m1xa+y34pulYn5
 72uaeqn3gdbgic3wtZk8QuzCDbbX3rgr/5e3DG+R2rcuihA091XAMK24HiA2eug2EB99
 xXbqk/20B9EP50QzmJVuv5szTMIkfzKntZih5qd4I+xKzbCMnQmwZj/bMnHnjc4XOUZ2
 IoVw==
X-Gm-Message-State: AOAM530N3I+kmMOZvKj9lsJ5XejJfjUZghB9ktjJfLwjBM94MTOB8MZK
 33NKmkpSrIHFs8QWl6o7XjwV9A==
X-Google-Smtp-Source: ABdhPJy8QIPHgs66I91NkTId3fzcObVtOjCC32X+/BPQMtjrTT5PDDly9I/RvJpoMno+NUejTiXtoA==
X-Received: by 2002:a63:ba48:: with SMTP id l8mr30087632pgu.259.1625804773282; 
 Thu, 08 Jul 2021 21:26:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Subject: [PATCH 06/17] target/riscv: Use gpr_src in branches
Date: Thu,  8 Jul 2021 21:25:57 -0700
Message-Id: <20210709042608.883256-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 04:26:32 -0000

Narrow the scope of t0 in trans_jalr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 6e736c9d0d..a603925637 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -54,24 +54,25 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
 
 static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
 {
-    /* no chaining with JALR */
     TCGLabel *misaligned = NULL;
-    TCGv t0 = tcg_temp_new();
 
-
-    gen_get_gpr(cpu_pc, a->rs1);
-    tcg_gen_addi_tl(cpu_pc, cpu_pc, a->imm);
+    tcg_gen_addi_tl(cpu_pc, gpr_src(ctx, a->rs1), a->imm);
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
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
 
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


