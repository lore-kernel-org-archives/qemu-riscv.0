Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqp2S-0000MC-42
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0G-0005x7-2U
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:44:45 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp05-0005Hg-N6
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:44:42 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso17094895e9.3
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315072; x=1684907072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kF/KuD0+uQLXuYT2v2A5wco+ARF0bjd47P8BXDbif68=;
 b=Wv1S/7sK4OGei3ZKuseQx1PgHH7It+1zWPJY38RJyXJn5Eg4zFC7YzZVL6CBKRR75m
 Q4EW9B8vn5rHIH3XdvCCPGFjzEPXAJAqNIFdWBZpYluu8IWhdWjurRH/YC+aLUh656pb
 aGUlnN2l/dvaRtIRsF8bd0HpQwWpd1oGHq/SanyhWSBRiLhWKavBBtuOpHRsuqKO1whH
 /UdTJaMGq89XMC9mg9/a8gBwimQYyZwUSuLBb/uEXDphS6cEsHN/7ThPaxpCamrTv4ge
 qnLD3DYeZ4bgkF46gNl7xiH8d+9+W7Nx5rVtU8TgiR9NFQ78TcNwuIYbnSoWeLAtbYWy
 pFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315072; x=1684907072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kF/KuD0+uQLXuYT2v2A5wco+ARF0bjd47P8BXDbif68=;
 b=fD2ki7VmLzlI3rTOxrTAMH/F91kkMvyyI5aC/b5odSvw6KXIyBRXpbEAm00XAG//86
 NRY6Rr7rAFKQ5XihC3ly8slgaUeIuVla4+qEQ5c0RCTaU626KD0vyu5v6eFOD1XBzuTr
 lCMySH0w+5dWqfraiqhcD3xmo9Ljy9xjAfLfAhDOoP3OQUJH0Zab6e6ghTjBr36NkUTb
 Z6G+juYSR2EvvgGAk/7f8tsM3btFMgYppoHy1OwvmQHo84HfTqE8ThNEiijloj1Xh+Wg
 7AVye5GrVoDB53Tq06o92ppDPxXiWO17x7ncUnGb2FYTwej+igW6gt91S2BaH6bZoUjC
 xT0A==
X-Gm-Message-State: AAQBX9dQiGPZM3PZD3LP1U3vuTfCXfqAY58/2xtbQqFTSDGYoox+0V1J
 6EtBi9wXilwCTEt0AR40O0k2HA==
X-Google-Smtp-Source: AKy350bE/g6xELbGgEXLa7tMzc8W62JXBXqNZ8uPwzNyf7Z1DqBJaoDtNBkGZjkGGbrgd3GXjSZZMw==
X-Received: by 2002:adf:fb01:0:b0:2f2:b71a:40cb with SMTP id
 c1-20020adffb01000000b002f2b71a40cbmr8159529wrr.56.1682315072173; 
 Sun, 23 Apr 2023 22:44:32 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 44/57] tcg/mips: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 24 Apr 2023 06:40:52 +0100
Message-Id: <20230424054105.1579315-45-richard.henderson@linaro.org>
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
X-List-Received-Date: Mon, 24 Apr 2023 05:44:56 -0000

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.  This allows our local
tcg_out_arg_* infrastructure to be removed.

We are no longer filling the call or return branch
delay slots, nor are we tail-calling for the store,
but this seems a small price to pay.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 154 ++++++--------------------------------
 1 file changed, 22 insertions(+), 132 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 94708e6ea7..022960d79a 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1115,79 +1115,15 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_BEUQ] = helper_be_stq_mmu,
 };
 
-/* Helper routines for marshalling helper function arguments into
- * the correct registers and stack.
- * I is where we want to put this argument, and is updated and returned
- * for the next call. ARG is the argument itself.
- *
- * We provide routines for arguments which are: immediate, 32 bit
- * value in register, 16 and 8 bit values in register (which must be zero
- * extended before use) and 64 bit value in a lo:hi register pair.
- */
-
-static int tcg_out_call_iarg_reg(TCGContext *s, int i, TCGReg arg)
-{
-    if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-        tcg_out_mov(s, TCG_TYPE_REG, tcg_target_call_iarg_regs[i], arg);
-    } else {
-        /* For N32 and N64, the initial offset is different.  But there
-           we also have 8 argument register so we don't run out here.  */
-        tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
-        tcg_out_st(s, TCG_TYPE_REG, arg, TCG_REG_SP, 4 * i);
-    }
-    return i + 1;
-}
-
-static int tcg_out_call_iarg_reg8(TCGContext *s, int i, TCGReg arg)
-{
-    TCGReg tmp = TCG_TMP0;
-    if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-        tmp = tcg_target_call_iarg_regs[i];
-    }
-    tcg_out_ext8u(s, tmp, arg);
-    return tcg_out_call_iarg_reg(s, i, tmp);
-}
-
-static int tcg_out_call_iarg_reg16(TCGContext *s, int i, TCGReg arg)
-{
-    TCGReg tmp = TCG_TMP0;
-    if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-        tmp = tcg_target_call_iarg_regs[i];
-    }
-    tcg_out_opc_imm(s, OPC_ANDI, tmp, arg, 0xffff);
-    return tcg_out_call_iarg_reg(s, i, tmp);
-}
-
-static int tcg_out_call_iarg_imm(TCGContext *s, int i, TCGArg arg)
-{
-    TCGReg tmp = TCG_TMP0;
-    if (arg == 0) {
-        tmp = TCG_REG_ZERO;
-    } else {
-        if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-            tmp = tcg_target_call_iarg_regs[i];
-        }
-        tcg_out_movi(s, TCG_TYPE_REG, tmp, arg);
-    }
-    return tcg_out_call_iarg_reg(s, i, tmp);
-}
-
-static int tcg_out_call_iarg_reg2(TCGContext *s, int i, TCGReg al, TCGReg ah)
-{
-    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
-    i = (i + 1) & ~1;
-    i = tcg_out_call_iarg_reg(s, i, (MIPS_BE ? ah : al));
-    i = tcg_out_call_iarg_reg(s, i, (MIPS_BE ? al : ah));
-    return i;
-}
+/* We have four temps, we might as well expose three of them. */
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 3, .tmp = { TCG_TMP0, TCG_TMP1, TCG_TMP2 }
+};
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    TCGReg v0;
-    int i;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
@@ -1196,29 +1132,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         return false;
     }
 
-    i = 1;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        i = tcg_out_call_iarg_reg2(s, i, l->addrlo_reg, l->addrhi_reg);
-    } else {
-        i = tcg_out_call_iarg_reg(s, i, l->addrlo_reg);
-    }
-    i = tcg_out_call_iarg_imm(s, i, oi);
-    i = tcg_out_call_iarg_imm(s, i, (intptr_t)l->raddr);
+    tcg_out_ld_helper_args(s, l, &ldst_helper_param);
+
     tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)], false);
     /* delay slot */
-    tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
+    tcg_out_nop(s);
 
-    v0 = l->datalo_reg;
-    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        /* We eliminated V0 from the possible output registers, so it
-           cannot be clobbered here.  So we must move V1 first.  */
-        if (MIPS_BE) {
-            tcg_out_mov(s, TCG_TYPE_I32, v0, TCG_REG_V1);
-            v0 = l->datahi_reg;
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_V1);
-        }
-    }
+    tcg_out_ld_helper_ret(s, l, true, &ldst_helper_param);
 
     tcg_out_opc_br(s, OPC_BEQ, TCG_REG_ZERO, TCG_REG_ZERO);
     if (!reloc_pc16(s->code_ptr - 1, l->raddr)) {
@@ -1226,22 +1146,14 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* delay slot */
-    if (TCG_TARGET_REG_BITS == 64 && l->type == TCG_TYPE_I32) {
-        /* we always sign-extend 32-bit loads */
-        tcg_out_ext32s(s, v0, TCG_REG_V0);
-    } else {
-        tcg_out_opc_reg(s, OPC_OR, v0, TCG_REG_V0, TCG_REG_ZERO);
-    }
+    tcg_out_nop(s);
     return true;
 }
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
-    int i;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
@@ -1250,41 +1162,19 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         return false;
     }
 
-    i = 1;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        i = tcg_out_call_iarg_reg2(s, i, l->addrlo_reg, l->addrhi_reg);
-    } else {
-        i = tcg_out_call_iarg_reg(s, i, l->addrlo_reg);
-    }
-    switch (s_bits) {
-    case MO_8:
-        i = tcg_out_call_iarg_reg8(s, i, l->datalo_reg);
-        break;
-    case MO_16:
-        i = tcg_out_call_iarg_reg16(s, i, l->datalo_reg);
-        break;
-    case MO_32:
-        i = tcg_out_call_iarg_reg(s, i, l->datalo_reg);
-        break;
-    case MO_64:
-        if (TCG_TARGET_REG_BITS == 32) {
-            i = tcg_out_call_iarg_reg2(s, i, l->datalo_reg, l->datahi_reg);
-        } else {
-            i = tcg_out_call_iarg_reg(s, i, l->datalo_reg);
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    i = tcg_out_call_iarg_imm(s, i, oi);
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
 
-    /* Tail call to the store helper.  Thus force the return address
-       computation to take place in the return address register.  */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (intptr_t)l->raddr);
-    i = tcg_out_call_iarg_reg(s, i, TCG_REG_RA);
-    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)], true);
+    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)], false);
     /* delay slot */
-    tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
+    tcg_out_nop(s);
+
+    tcg_out_opc_br(s, OPC_BEQ, TCG_REG_ZERO, TCG_REG_ZERO);
+    if (!reloc_pc16(s->code_ptr - 1, l->raddr)) {
+        return false;
+    }
+
+    /* delay slot */
+    tcg_out_nop(s);
     return true;
 }
 
-- 
2.34.1


