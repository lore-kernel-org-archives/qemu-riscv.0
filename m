Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Wa-0004U1-Ui
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WQ-0003kE-Nd
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:12 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WM-0001tn-01
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:09 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 ie17-20020a17090b401100b00246d4b282eeso1477374pjb.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z4X5sE72MavuwGwyDna/DkVfIgfKG696lLpFZYMk0lw=;
 b=urjrTFSuMeLF3aNKvHGoWLcjL2POUNBJsLStQkbxoskIWf/Z3+/8gB4S32cT0Xcjfk
 OwJHoRnoJIqiN5/yylzpqv5eS1zR+CrUrtlnO5vmUj5QnxTkcYH049Br/VBfwFRnquGt
 LF04hN3Ear03jffzvYFioObtDlA7fn/KWwK7JD/rdPZe3QK68hOQ2MoYTaP6MlvcpkBH
 ue2ehjQPJi8MVK4Lak4hVlk1mpxU5yhzXSYPGCj4P6DZ0ozIkNGoOtCDZG/mruw9t49u
 QhVihjD2XYneZRN6pdB6Epn7lkDV7rh1ipLzPwDsAdAka4QKKQPDWTHEs/zr4cZUQAjs
 XReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z4X5sE72MavuwGwyDna/DkVfIgfKG696lLpFZYMk0lw=;
 b=eP2Ka9V3KuTJhb0rPzaqh6dZmut5Rop7MozAkZjfbFzLOtwv5hSA5u+r88v7ALqjnE
 U0evTzcbD8FMUfCSryaIIz1KjnbaVCJfW3unat7PDr+IvP/ePz+yQBQVSWv78W51IQQX
 blawDhT/6OnrgWXPDWdW/DYWm0QJkHGNZicfFotJYjMhcprSTHP3ryk5E7kuGbR47j1h
 p/LBJWF14xjHcoSRqPabjvrQLl+FYGLeetMWk1q49bL9EY+AFOvLoG7ZJHxqHyi9gPEM
 +NrD43PwYZqcFXfz+PRWOnmPgkPltyuDZv4wpVyKIBvzwxGrNk0cSPyvW73utw479lq1
 guxQ==
X-Gm-Message-State: AAQBX9cTtDYpQR23gC6H5JygCd/ey57pbGfuF3p3k7YURHV8+t2iEo+O
 gOjuEOHZ+xrXV2RlojP7dKAuriAe/KPwInywPmjoIg==
X-Google-Smtp-Source: AKy350aYuL830aCpyVY6DSTW+zkB40ZDj4ewgDvEM/3ONmt+rOBlYjP7svVpBYiGi1TM3Ylnz4pRiw==
X-Received: by 2002:a17:902:d14a:b0:1a2:9a94:2f00 with SMTP id
 t10-20020a170902d14a00b001a29a942f00mr863122plt.27.1681175404402; 
 Mon, 10 Apr 2023 18:10:04 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 41/54] tcg/mips: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 10 Apr 2023 18:04:59 -0700
Message-Id: <20230411010512.5375-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:10:14 -0000

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.  This allows our local
tcg_out_arg_* infrastructure to be removed.

We are no longer filling the call or return branch
delay slots, nor are we tail-calling for the store,
but this seems a small price to pay.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 156 ++++++--------------------------------
 1 file changed, 23 insertions(+), 133 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index ee5826c2b5..9f7c9cd688 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1115,72 +1115,6 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
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
-
 /* We expect to use a 16-bit negative offset from ENV.  */
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
@@ -1295,13 +1229,15 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
     }
 }
 
+/* We have four temps, we might as well expose three of them. */
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 3, .tmp = { TCG_TMP0, TCG_TMP1, TCG_TMP2 }
+};
+
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
@@ -1310,29 +1246,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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
@@ -1340,22 +1260,14 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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
@@ -1364,41 +1276,19 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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


