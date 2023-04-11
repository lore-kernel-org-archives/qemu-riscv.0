Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2WX-0003zj-E2
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WQ-0003kI-Qv
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:12 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WN-0001uD-19
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:10 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 ie17-20020a17090b401100b00246d4b282eeso1477438pjb.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whk/sbAs9+BgxjsuU75DgmoVbPnFYtMBoe2U/lcKgTQ=;
 b=OR2xHDnpp8bhheZrUJB2FxNDewxKz2u5/msylF1TuSGrGk5kWLRLzDb9p1RKMvZ3EP
 gtHBa+tZtM0w/ip1w9k10JtcgXlz4lXN8bhbHXEqXI3PC4s0cC/DK4vyJtq46Qj+LQFN
 T6gbPtsouKNDtSTXu0XSoPGIbGHoU3KnmsEmyuICaFstZF6anOO14RzlkTqjp7bOfasj
 5sGhMwtPjgrKyXy4It8i84r/+Zd1/9v7gucnfYvyy0JwvtJt+IKbk1EgnMjOp4mbUy9X
 cXJhsFxhrUgqHxt8MtHIH0sVsKtCugaGGB2bC0iaO6L+JsJanq1LylsFQB4VrV8/yqTJ
 5hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whk/sbAs9+BgxjsuU75DgmoVbPnFYtMBoe2U/lcKgTQ=;
 b=Dx+N2pJqoQRyU3IN5Zd4xl26/cJxiuHfaMtLNrcREj5Cc5solw3ou53z3MK9IRk1HF
 cQfjf5o4JdMrkCzXKHGpoZhkuW/dCztZtgdE1OMC0+FbeYNS8ISWhCH7fxwFqFntOfdH
 Tn3ADcFZDkXDlcrHP//yzXChqrBf0+8PRcElkFlk2pJoXGUhGJ4lnBD9RZLtqnfSl4uc
 +6quxZPUvNVQqJJy50V6JydR/sGfwhx1s8nToAJgW3ADkqHx3yFr/g121T2Yn23BKZbq
 m30gCUFi9jXAL7qAdp1eF3jzWjI44ecVakl0tD0lP4ZpeC47i+FjeDSVhpkVbui26zTP
 xopQ==
X-Gm-Message-State: AAQBX9fjr+3I5CKC+o47EmWCp9/+Mf6Cg6fxNY13qc4CyiLRiuxNB5Ga
 /D86FgDyI1K80xNHkahLlW8Adz1VCXLD1gXDijImfg==
X-Google-Smtp-Source: AKy350asTAIjQ54gL7lWFBebhd0PPY+ScyOEv7Gi+u4oMbqkFGFq2u9t8Cp3NFalKVWUayqZmPD6Vg==
X-Received: by 2002:a17:903:124a:b0:1a1:d624:2fe2 with SMTP id
 u10-20020a170903124a00b001a1d6242fe2mr16822239plh.17.1681175405708; 
 Mon, 10 Apr 2023 18:10:05 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 42/54] tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 10 Apr 2023 18:05:00 -0700
Message-Id: <20230411010512.5375-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:10:12 -0000

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 88 ++++++++++++----------------------------
 1 file changed, 26 insertions(+), 62 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 90093a6509..1b60166d2f 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2137,44 +2137,38 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
     label->label_ptr[0] = lptr;
 }
 
+static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
+{
+    if (arg < 0) {
+        arg = TCG_REG_TMP1;
+    }
+    tcg_out32(s, MFSPR | RT(arg) | LR);
+    return arg;
+}
+
+/*
+ * For the purposes of ppc32 sorting 4 input registers into 4 argument
+ * registers, there is an outside chance we would require 3 temps.
+ * Because of constraints, no inputs are in r3, and env will not be
+ * placed into r3 until after the sorting is done, and is thus free.
+ */
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ra_gen = ldst_ra_gen,
+    .ntmp = 3,
+    .tmp = { TCG_REG_TMP1, TCG_REG_R0, TCG_REG_R3 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    TCGReg hi, lo, arg = TCG_REG_R3;
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc14(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, arg++, TCG_AREG0);
-
-    lo = lb->addrlo_reg;
-    hi = lb->addrhi_reg;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        /* If the address needed to be zero-extended, we'll have already
-           placed it in R4.  The only remaining case is 64-bit guest.  */
-        tcg_out_mov(s, TCG_TYPE_TL, arg++, lo);
-    }
-
-    tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
-    tcg_out32(s, MFSPR | RT(arg) | LR);
-
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, LK, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
-
-    lo = lb->datalo_reg;
-    hi = lb->datahi_reg;
-    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        tcg_out_mov(s, TCG_TYPE_I32, lo, TCG_REG_R4);
-        tcg_out_mov(s, TCG_TYPE_I32, hi, TCG_REG_R3);
-    } else {
-        tcg_out_movext(s, lb->type, lo,
-                       TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_R3);
-    }
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
 
     tcg_out_b(s, 0, lb->raddr);
     return true;
@@ -2182,43 +2176,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
-    TCGReg hi, lo, arg = TCG_REG_R3;
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc14(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, arg++, TCG_AREG0);
-
-    lo = lb->addrlo_reg;
-    hi = lb->addrhi_reg;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        /* If the address needed to be zero-extended, we'll have already
-           placed it in R4.  The only remaining case is 64-bit guest.  */
-        tcg_out_mov(s, TCG_TYPE_TL, arg++, lo);
-    }
-
-    lo = lb->datalo_reg;
-    hi = lb->datahi_reg;
-    if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        tcg_out_movext(s, s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                       arg++, lb->type, s_bits, lo);
-    }
-
-    tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
-    tcg_out32(s, MFSPR | RT(arg) | LR);
-
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, LK, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     tcg_out_b(s, 0, lb->raddr);
-- 
2.34.1


