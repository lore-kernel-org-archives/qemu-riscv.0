Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6b9-000107-Bh
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aT-0006nX-Eb
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:41 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a2-0005Zw-Nw
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:41 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso29495275e9.3
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097633; x=1685689633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+GIQLXvELUmUJjDCvdIMzpNNEl1FqkUOfANtu8VRqCQ=;
 b=kW7RyYzhnra0RB3ORlNCLnWOiXv+sqggN9jEeSbp82XEhxiEgh/DeEEKjxK5fHgJpd
 oG47xNlek1jTTCbsqJJ7/vazBaUzBErBR9YkPRmRWtyeovwDhAzpOz9LmIufNFLZ9Nn6
 Xuq8JrebNdBTZBlOdrVr1XEj41DBd+Krl3usSnGPJIKdNU9d46cXx8nEwH6sTr5Wp7YT
 e7EkcBrL52EeWrKdZLdRqU0Xg+65aU372EE1BwM3nA8FjQQEi6WJf/R/+sZaxiGJ5yhA
 li53sbsdJGb7wwFQGCJtd8p5obCigOuzysh+Gvu6BX2EYFKbfR6p3RLJClR/SqSoudLv
 Oadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097633; x=1685689633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GIQLXvELUmUJjDCvdIMzpNNEl1FqkUOfANtu8VRqCQ=;
 b=af05a2M9xBK6YiarM5gtn+wX06/KrREvU/0ZJcyQ+fy/PbwO5Cpq6/9YSigaSaOvBO
 LozxbD3L4WQdaO2VqnaRJm7zhd6LQMFKSl3//RicP7/Za+FhMbBZfKa3uEToiJtb0Zcn
 Jiszjf7VBecVVo8gv2bFKSkjZCLIy1Dg/yDSaHpCTs3CWgwd7NzV5FYo3Y+1LEO84Niv
 dHE4JggSs5YXi1gYIJRyzMmKSsneTOjcPd0Y+lfcOMVN95+5NS/EHecdXHV8OfSclTaq
 /w237Spxq/zSTU7uPnGAc9wUYtJd4eQ3XX4Qs3PbJOpDTOeZU5TCqlrNQpSOauIXWyZS
 kBNw==
X-Gm-Message-State: AC+VfDxxPSuzDeiEZUT/a2CKE5Rod8ONb5iFZAjz48bhuySHCOpQsDgx
 ufPc8oNz3Re/S++QG8Brjz6Ikw==
X-Google-Smtp-Source: ACHHUZ5XlO9o3LDOKy8pVpT7yY0z9QlJSoxW4xmWI555a63u7/keuY5VssCvDAoVcISfNnu/q5BFOg==
X-Received: by 2002:a5d:544c:0:b0:306:264d:5667 with SMTP id
 w12-20020a5d544c000000b00306264d5667mr8210349wrv.41.1683097632722; 
 Wed, 03 May 2023 00:07:12 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 20/57] tcg: Introduce TCG_OPF_TYPE_MASK
Date: Wed,  3 May 2023 08:06:19 +0100
Message-Id: <20230503070656.1746170-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 May 2023 07:07:41 -0000

Reorg TCG_OPF_64BIT and TCG_OPF_VECTOR into a two-bit field so
that we can add TCG_OPF_128BIT without requiring another bit.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h            | 22 ++++++++++++----------
 tcg/optimize.c               | 15 ++++++++++++---
 tcg/tcg.c                    |  4 ++--
 tcg/aarch64/tcg-target.c.inc |  8 +++++---
 tcg/tci/tcg-target.c.inc     |  3 ++-
 5 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index b19e167e1d..efbd891f87 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -932,24 +932,26 @@ typedef struct TCGArgConstraint {
 
 /* Bits for TCGOpDef->flags, 8 bits available, all used.  */
 enum {
+    /* Two bits describing the output type. */
+    TCG_OPF_TYPE_MASK    = 0x03,
+    TCG_OPF_32BIT        = 0x00,
+    TCG_OPF_64BIT        = 0x01,
+    TCG_OPF_VECTOR       = 0x02,
+    TCG_OPF_128BIT       = 0x03,
     /* Instruction exits the translation block.  */
-    TCG_OPF_BB_EXIT      = 0x01,
+    TCG_OPF_BB_EXIT      = 0x04,
     /* Instruction defines the end of a basic block.  */
-    TCG_OPF_BB_END       = 0x02,
+    TCG_OPF_BB_END       = 0x08,
     /* Instruction clobbers call registers and potentially update globals.  */
-    TCG_OPF_CALL_CLOBBER = 0x04,
+    TCG_OPF_CALL_CLOBBER = 0x10,
     /* Instruction has side effects: it cannot be removed if its outputs
        are not used, and might trigger exceptions.  */
-    TCG_OPF_SIDE_EFFECTS = 0x08,
-    /* Instruction operands are 64-bits (otherwise 32-bits).  */
-    TCG_OPF_64BIT        = 0x10,
+    TCG_OPF_SIDE_EFFECTS = 0x20,
     /* Instruction is optional and not implemented by the host, or insn
        is generic and should not be implemened by the host.  */
-    TCG_OPF_NOT_PRESENT  = 0x20,
-    /* Instruction operands are vectors.  */
-    TCG_OPF_VECTOR       = 0x40,
+    TCG_OPF_NOT_PRESENT  = 0x40,
     /* Instruction is a conditional branch. */
-    TCG_OPF_COND_BRANCH  = 0x80
+    TCG_OPF_COND_BRANCH  = 0x80,
 };
 
 typedef struct TCGOpDef {
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 9614fa3638..37d46f2a1f 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -2051,12 +2051,21 @@ void tcg_optimize(TCGContext *s)
         copy_propagate(&ctx, op, def->nb_oargs, def->nb_iargs);
 
         /* Pre-compute the type of the operation. */
-        if (def->flags & TCG_OPF_VECTOR) {
+        switch (def->flags & TCG_OPF_TYPE_MASK) {
+        case TCG_OPF_VECTOR:
             ctx.type = TCG_TYPE_V64 + TCGOP_VECL(op);
-        } else if (def->flags & TCG_OPF_64BIT) {
+            break;
+        case TCG_OPF_128BIT:
+            ctx.type = TCG_TYPE_I128;
+            break;
+        case TCG_OPF_64BIT:
             ctx.type = TCG_TYPE_I64;
-        } else {
+            break;
+        case TCG_OPF_32BIT:
             ctx.type = TCG_TYPE_I32;
+            break;
+        default:
+            qemu_build_not_reached();
         }
 
         /* Assume all bits affected, no bits known zero, no sign reps. */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index d0afabf194..cb5ca9b612 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2294,7 +2294,7 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
             nb_iargs = def->nb_iargs;
             nb_cargs = def->nb_cargs;
 
-            if (def->flags & TCG_OPF_VECTOR) {
+            if ((def->flags & TCG_OPF_TYPE_MASK) == TCG_OPF_VECTOR) {
                 col += ne_fprintf(f, "v%d,e%d,", 64 << TCGOP_VECL(op),
                                   8 << TCGOP_VECE(op));
             }
@@ -4782,7 +4782,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         tcg_out_extrl_i64_i32(s, new_args[0], new_args[1]);
         break;
     default:
-        if (def->flags & TCG_OPF_VECTOR) {
+        if ((def->flags & TCG_OPF_TYPE_MASK) == TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
                            new_args, const_args);
         } else {
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 3adc5fd3a3..43acb4fbcb 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1921,9 +1921,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
 {
-    /* 99% of the time, we can signal the use of extension registers
-       by looking to see if the opcode handles 64-bit data.  */
-    TCGType ext = (tcg_op_defs[opc].flags & TCG_OPF_64BIT) != 0;
+    /*
+     * 99% of the time, we can signal the use of extension registers
+     * by looking to see if the opcode handles 32-bit data or not.
+     */
+    TCGType ext = (tcg_op_defs[opc].flags & TCG_OPF_TYPE_MASK) != TCG_OPF_32BIT;
 
     /* Hoist the loads of the most common arguments.  */
     TCGArg a0 = args[0];
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 4cf03a579c..e31640d109 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -790,7 +790,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     CASE_32_64(sextract) /* Optional (TCG_TARGET_HAS_sextract_*). */
         {
             TCGArg pos = args[2], len = args[3];
-            TCGArg max = tcg_op_defs[opc].flags & TCG_OPF_64BIT ? 64 : 32;
+            TCGArg max = ((tcg_op_defs[opc].flags & TCG_OPF_TYPE_MASK)
+                          == TCG_OPF_32BIT ? 32 : 64);
 
             tcg_debug_assert(pos < max);
             tcg_debug_assert(pos + len <= max);
-- 
2.34.1


