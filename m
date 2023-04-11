Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2TQ-000836-Ar
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2TO-0007qq-8h
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:07:02 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2TK-0000kz-RK
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:07:01 -0400
Received: by mail-pl1-x630.google.com with SMTP id p8so6322144plk.9
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wT8ck/m6Yrnq0cI43qjCHs3L45KZUY0JQGXqMIH7izw=;
 b=d72fFk9g7C7hnaEZvaiJakzNXmXa4Gu+ogwZWoPokUzDgPEbKbdZ4UPSyL0PrEieXj
 6xSxDcPwNU4wDFminypHNfJ+TdPt4+yg7Y8JdB9+KMxwvfxODjHbk7T48/00LYx/eu0g
 jE0g/oWnJ1t/zIFIPXS4CapNL4imF34uYIepoSDokX08hDhxt8xhvUq4+pga751UmOEH
 hBCJjJWGAQX5tmU6Nk+kMK0Rm9mMUTqzkTcNvDfU7pwP2LSvo1Kj/TUDpyljNqeqHVrt
 y6uNdSxcF2WSSqXupI/1C4UoDmeI9gTvYjiqJ06k70ZLON8bcNZmqidHlFuQF43wPltp
 RWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wT8ck/m6Yrnq0cI43qjCHs3L45KZUY0JQGXqMIH7izw=;
 b=bFkl6VMbaWY7wxVHxYIAogcHNRRwrRIi6BrOlUBVaDSH/n4uDWv9ZKnodBaMk/aGPe
 ru4Wjp0ny4L2EBTsjP0kV/lh8sb11ueICdSkswm+PCfYDLd6rZ3NPA6GniL3J5lnxYY9
 EJQ1uPM4LYOgkmKhzEOQLfgBgpFyjMUH2KBLO7gIcBrZMtr0OBZ0SxdNokoq6FpFL8u3
 iU0U9SOGSBAHNNF6G7GqV1JcwHeN/TL1BM75cGh1TcoGPykmKtL/3g2jyMNx4F5D3aND
 XghUD4qrDS6pSgecNrGT+x3SM7zGvVrwa271kHTX1pGuWk3BXqTGsw9r57b+/4aOzMNa
 dMVA==
X-Gm-Message-State: AAQBX9fux96xgNhkByEsKw+olIeXAlnc9Hp37p3niZZpjOKMSQ3Tt/YF
 MxJlS8cjPPOf1ocWOb38A2NbrA==
X-Google-Smtp-Source: AKy350YU2WraZqWNTm31ybnLVtm+HkAcmS2dNf4rw41t/7ob+IKBAps1DuDCyoXQ+RbxG0S4C1XBvw==
X-Received: by 2002:a17:902:ec92:b0:1a6:3b04:92bb with SMTP id
 x18-20020a170902ec9200b001a63b0492bbmr6219444plg.18.1681175217846; 
 Mon, 10 Apr 2023 18:06:57 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 39/54] tcg/arm: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 10 Apr 2023 18:04:57 -0700
Message-Id: <20230411010512.5375-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 01:07:02 -0000

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.  This allows our local
tcg_out_arg_* infrastructure to be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 146 ++++++---------------------------------
 1 file changed, 21 insertions(+), 125 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 3706a3b93e..57319674e5 100644
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
@@ -1375,58 +1363,6 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
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
-{
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
-}
-
 #define TLB_SHIFT	(CPU_TLB_ENTRY_BITS + CPU_TLB_BITS)
 
 /* We expect to use an 9-bit sign-magnitude negative offset from ENV.  */
@@ -1546,40 +1482,29 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
     label->label_ptr[0] = label_ptr;
 }
 
+static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
+{
+    /* We arrive at the slow path via "BLNE", so R14 contains l->raddr. */
+    return TCG_REG_R14;
+}
+
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
@@ -1587,42 +1512,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
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


