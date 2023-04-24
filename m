Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqp1m-00076q-4T
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0C-0005tp-D0
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:44:43 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp04-0005Go-H4
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:44:38 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso24593965e9.3
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315071; x=1684907071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e67Crv76HZSCg/mw2UfCxuP3kRlNk2dyxOLXgebiI/I=;
 b=V5R0e9oJ1k3/iy/GfS3btBIZK9PMyzOkPGpML3uDDAkjWsyrcdV4cnlttM+GcHBL4X
 L5VkO9cnL08vbAVhO5M760t6w9pGWh3HhKF1/0eEmjDhuoTgkQhbD9KKkRKcD3yWQZLQ
 0KDnRJRa825Ao3zkies8fHbIy+zx4b6hffb1RfV9KoNzoYgcNlcreObX6K/Jn19EOQyj
 O3Ets6nDRNOomD15Z+TzRNNTHgfmQF3p9tRKNcQKf00fzLQ4xd+k35kK9igMForXbq2c
 cABddqN/lnk4J3NeJ74EjR0RqqRon/D7VsvT+jE9UNQrh5ICvpeKQBXdwYQJQTiezzgk
 9n+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315071; x=1684907071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e67Crv76HZSCg/mw2UfCxuP3kRlNk2dyxOLXgebiI/I=;
 b=Kl1U6hrA+vxj3bvQMmm9Uc5AySr3IcE+0fI3syLCQETJ4i6wWdREOw1KjM0mhFAjbr
 fv7gTI+Egz+bG9cjzcCyKjfmNtuPputSz/wA1NSGQgnCdREeGQjChA/siXX4e2LMkbZT
 H3IiosTSrC3Ws+UK69REpIRUcgZ4or3oqnnCDFg7/7tnBLyr6AwSWKQYb7x2zNw5hntJ
 ReVcAQv75yrrgvzZL3UJpj6AYZmI3UrSzBuIs/PR/hiu4puXHoC7CkdpmHvT5DQNcxHb
 1Trz7OguU6GOZugppP+eP4/3HEFVsuCW1MCtasHVQyhdY0JSszNs128gc6lbXlKAgSwz
 Vbkw==
X-Gm-Message-State: AAQBX9fgS88muGakHhm1sXFlQ9R+GLAGRl+IN3Ki+IXExTURGybEcGRi
 SEoWxcF/oCv67PxlVHHSdWzy/g==
X-Google-Smtp-Source: AKy350YJAZ4RB9s/3c20vso7XU07flestcrfgdUeVQ/uf+2cUUm8MJPcxhjiCvho6ZRI/uY/0uaneQ==
X-Received: by 2002:a1c:f715:0:b0:3f0:5887:bea3 with SMTP id
 v21-20020a1cf715000000b003f05887bea3mr7041346wmh.27.1682315071091; 
 Sun, 23 Apr 2023 22:44:31 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 42/57] tcg/arm: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 24 Apr 2023 06:40:50 +0100
Message-Id: <20230424054105.1579315-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Mon, 24 Apr 2023 05:44:45 -0000

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.  This allows our local
tcg_out_arg_* infrastructure to be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 140 +++++----------------------------------
 1 file changed, 18 insertions(+), 122 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index c744512778..df514e56fc 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -690,8 +690,8 @@ tcg_out_ldrd_rwb(TCGContext *s, ARMCond cond, TCGReg rt, TCGReg rn, TCGReg rm)
     tcg_out_memop_r(s, cond, INSN_LDRD_REG, rt, rn, rm, 1, 1, 1);
 }
 
-static void tcg_out_strd_8(TCGContext *s, ARMCond cond, TCGReg rt,
-                           TCGReg rn, int imm8)
+static void __attribute__((unused))
+tcg_out_strd_8(TCGContext *s, ARMCond cond, TCGReg rt, TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_STRD_IMM, rt, rn, imm8, 1, 0);
 }
@@ -969,28 +969,16 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_dat_imm(s, COND_AL, ARITH_AND, rd, rn, 0xff);
 }
 
-static void __attribute__((unused))
-tcg_out_ext8u_cond(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
-{
-    tcg_out_dat_imm(s, cond, ARITH_AND, rd, rn, 0xff);
-}
-
 static void tcg_out_ext16s(TCGContext *s, TCGType t, TCGReg rd, TCGReg rn)
 {
     /* sxth */
     tcg_out32(s, 0x06bf0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
-static void tcg_out_ext16u_cond(TCGContext *s, ARMCond cond,
-                                TCGReg rd, TCGReg rn)
-{
-    /* uxth */
-    tcg_out32(s, 0x06ff0070 | (cond << 28) | (rd << 12) | rn);
-}
-
 static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rn)
 {
-    tcg_out_ext16u_cond(s, COND_AL, rd, rn);
+    /* uxth */
+    tcg_out32(s, 0x06ff0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
 static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
@@ -1382,92 +1370,29 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 #endif
 };
 
-/* Helper routines for marshalling helper function arguments into
- * the correct registers and stack.
- * argreg is where we want to put this argument, arg is the argument itself.
- * Return value is the updated argreg ready for the next call.
- * Note that argreg 0..3 is real registers, 4+ on stack.
- *
- * We provide routines for arguments which are: immediate, 32 bit
- * value in register, 16 and 8 bit values in register (which must be zero
- * extended before use) and 64 bit value in a lo:hi register pair.
- */
-#define DEFINE_TCG_OUT_ARG(NAME, ARGTYPE, MOV_ARG, EXT_ARG)                \
-static TCGReg NAME(TCGContext *s, TCGReg argreg, ARGTYPE arg)              \
-{                                                                          \
-    if (argreg < 4) {                                                      \
-        MOV_ARG(s, COND_AL, argreg, arg);                                  \
-    } else {                                                               \
-        int ofs = (argreg - 4) * 4;                                        \
-        EXT_ARG;                                                           \
-        tcg_debug_assert(ofs + 4 <= TCG_STATIC_CALL_ARGS_SIZE);            \
-        tcg_out_st32_12(s, COND_AL, arg, TCG_REG_CALL_STACK, ofs);         \
-    }                                                                      \
-    return argreg + 1;                                                     \
-}
-
-DEFINE_TCG_OUT_ARG(tcg_out_arg_imm32, uint32_t, tcg_out_movi32,
-    (tcg_out_movi32(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg8, TCGReg, tcg_out_ext8u_cond,
-    (tcg_out_ext8u_cond(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg16, TCGReg, tcg_out_ext16u_cond,
-    (tcg_out_ext16u_cond(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg32, TCGReg, tcg_out_mov_reg, )
-
-static TCGReg tcg_out_arg_reg64(TCGContext *s, TCGReg argreg,
-                                TCGReg arglo, TCGReg arghi)
+static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 {
-    /* 64 bit arguments must go in even/odd register pairs
-     * and in 8-aligned stack slots.
-     */
-    if (argreg & 1) {
-        argreg++;
-    }
-    if (argreg >= 4 && (arglo & 1) == 0 && arghi == arglo + 1) {
-        tcg_out_strd_8(s, COND_AL, arglo,
-                       TCG_REG_CALL_STACK, (argreg - 4) * 4);
-        return argreg + 2;
-    } else {
-        argreg = tcg_out_arg_reg32(s, argreg, arglo);
-        argreg = tcg_out_arg_reg32(s, argreg, arghi);
-        return argreg;
-    }
+    /* We arrive at the slow path via "BLNE", so R14 contains l->raddr. */
+    return TCG_REG_R14;
 }
 
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ra_gen = ldst_ra_gen,
+    .ntmp = 1,
+    .tmp = { TCG_REG_TMP },
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg argreg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc24(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    argreg = tcg_out_arg_reg32(s, TCG_REG_R0, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        argreg = tcg_out_arg_reg64(s, argreg, lb->addrlo_reg, lb->addrhi_reg);
-    } else {
-        argreg = tcg_out_arg_reg32(s, argreg, lb->addrlo_reg);
-    }
-    argreg = tcg_out_arg_imm32(s, argreg, oi);
-    argreg = tcg_out_arg_reg32(s, argreg, TCG_REG_R14);
-
-    /* Use the canonical unsigned helpers and minimize icache usage. */
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
-
-    if ((opc & MO_SIZE) == MO_64) {
-        TCGMovExtend ext[2] = {
-            { .dst = lb->datalo_reg, .dst_type = TCG_TYPE_I32,
-              .src = TCG_REG_R0, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-            { .dst = lb->datahi_reg, .dst_type = TCG_TYPE_I32,
-              .src = TCG_REG_R1, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-        };
-        tcg_out_movext2(s, &ext[0], &ext[1], TCG_REG_TMP);
-    } else {
-        tcg_out_movext(s, TCG_TYPE_I32, lb->datalo_reg,
-                       TCG_TYPE_I32, opc & MO_SSIZE, TCG_REG_R0);
-    }
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
 
     tcg_out_goto(s, COND_AL, lb->raddr);
     return true;
@@ -1475,42 +1400,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg argreg, datalo, datahi;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc24(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    argreg = TCG_REG_R0;
-    argreg = tcg_out_arg_reg32(s, argreg, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        argreg = tcg_out_arg_reg64(s, argreg, lb->addrlo_reg, lb->addrhi_reg);
-    } else {
-        argreg = tcg_out_arg_reg32(s, argreg, lb->addrlo_reg);
-    }
-
-    datalo = lb->datalo_reg;
-    datahi = lb->datahi_reg;
-    switch (opc & MO_SIZE) {
-    case MO_8:
-        argreg = tcg_out_arg_reg8(s, argreg, datalo);
-        break;
-    case MO_16:
-        argreg = tcg_out_arg_reg16(s, argreg, datalo);
-        break;
-    case MO_32:
-    default:
-        argreg = tcg_out_arg_reg32(s, argreg, datalo);
-        break;
-    case MO_64:
-        argreg = tcg_out_arg_reg64(s, argreg, datalo, datahi);
-        break;
-    }
-
-    argreg = tcg_out_arg_imm32(s, argreg, oi);
-    argreg = tcg_out_arg_reg32(s, argreg, TCG_REG_R14);
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
 
     /* Tail-call to the helper, which will return to the fast path.  */
     tcg_out_goto(s, COND_AL, qemu_st_helpers[opc & MO_SIZE]);
-- 
2.34.1


