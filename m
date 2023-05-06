Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvCG6-0004ab-Oh
	for mharc-qemu-riscv@gnu.org; Sat, 06 May 2023 03:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCG5-0004Vv-J8
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFm-0004Re-Sr
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:09 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30771c68a9eso2073989f8f.2
 for <qemu-riscv@nongnu.org>; Sat, 06 May 2023 00:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357769; x=1685949769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bp+7jHuRwCoumX81kkmi2LLSK4XPzI38mrYIrW5iAjM=;
 b=RuPpVsg69wZKOXhZJXZGvrel3vwJkeiLbWsRHRKNhkuAVbXkWi/RgCI01gLVQw/u1e
 2DjT0R/gJruizoYHzqLILaiebnpsRYb9DM1+O5oFA2z+RQOktgCKkyb2tEiVriTgdH2s
 dN8OqSmdt+bBOJ+ipT5XYmgxihdGLyVOe9ghbHmPvJEmGFc1BVDXC3NAita07AifBvIH
 Ym+aHnwVSp3eYKhyolzQIHbHGtG4Livy+E/XP/u8VCz/GrYrZVhr/b9dj9AGWvTAFisc
 BLX2kDT0OYENsd5wcJynbznpZ9q4A4wfSojUCoUhG+52N0GVQ2Sok9CPXilexURwR3fJ
 iC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357769; x=1685949769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bp+7jHuRwCoumX81kkmi2LLSK4XPzI38mrYIrW5iAjM=;
 b=ceHpsCPAemQgNevCz4UvLziA47Qn3sfh6M8vPTEanWntaN6EquDwq3O4x/aGpNDMd9
 7my6kf6SaBHe+oxrNJlXTqNq2cbDAPrxQQojImNvqlFIADSU4/uc6mz8Qqjx9AC/VKve
 LWMBIzT/0Jlgl5NeTpUzRx9fkAi2MnK3GXFZKpf8UeVX+vlzr9KI+/x2XOJjdFs5gedf
 xn/FX5AGESWjCZv+9Tb+bXhN+TaChtWn7i2krUfsoSe0H4S1eaJafIMTKow83DtOkRKv
 J+8h7mNGRE+BqjgnXMm+Rg6dqa4lo6r98+Fb3WNVfyFDfcDmJdQx7/TVowcnU4wElLab
 elxQ==
X-Gm-Message-State: AC+VfDxaWwcLOBbcCzoyXlBiJuLbIhuK3BUtJLYDzuA78JH4l3H3mbU1
 hN2+SHXsn1f+9CK5+PoXBoo4IQ==
X-Google-Smtp-Source: ACHHUZ6zmAb3COBB6G8a3/hJRcraPL06UVJKdAkWZOR9xTe8RPhtxW0RtwnHeSEo6BOtRvQDQCepXQ==
X-Received: by 2002:a05:6000:12c9:b0:2d0:bba8:3901 with SMTP id
 l9-20020a05600012c900b002d0bba83901mr2702707wrx.62.1683357769412; 
 Sat, 06 May 2023 00:22:49 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 17/30] tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Sat,  6 May 2023 08:22:22 +0100
Message-Id: <20230506072235.597467-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Sat, 06 May 2023 07:23:09 -0000

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 88 ++++++++++++----------------------------
 1 file changed, 26 insertions(+), 62 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 7239335bdf..042136fee7 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2003,44 +2003,38 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_BEUQ] = helper_be_stq_mmu,
 };
 
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
@@ -2048,43 +2042,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
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


