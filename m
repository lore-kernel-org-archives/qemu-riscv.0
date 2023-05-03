Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6SK-0001RC-B0
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Ro-0000FV-6D
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:49 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R6-0001zA-LD
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:43 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f315712406so11014555e9.0
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097079; x=1685689079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ZL038/Ng9nS/xr0DDxwNdtMDtu/OB6KUuAjmGyJXv0=;
 b=MGiG4dTeI/0nQJhf4YjQWwHGV7/+mKmN23xZaSezoMDSCW4f5Jt5OrLUrfJFRAOrf4
 j2EVFhNYjeMkNT14rIVE08uVDiG4kyzIRuy7vpg6TRSkcxJKFaeWkRaALK3uCnYzOyRl
 tX2m+d9zoz+1+oeoxDf2K+SjomfueoQb22And00WxNR4UE72Ak589QaLhgpqrQxM2Iw2
 eJj0BEOxIaA+Se3fx9RW8vNLELQm0PO5W9MfJWPLxVSJj40+QU0ZNnZ2ee3udLUbRLiu
 i3kJKmUFVeqPj6oxuQYS2vkHMzLGKmDrvVGji3sjkN/Cpqu2/a7MKMn4IifXbhBPaB7e
 wM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097079; x=1685689079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ZL038/Ng9nS/xr0DDxwNdtMDtu/OB6KUuAjmGyJXv0=;
 b=Pmoj3cAzsh9sxYId+xsJkwf3VRMUs1Y4Qa2g/ocf2Tdiq6I2aUqUZVL/mh8N/RImiG
 w2id6hKC8w6o/1MTYmokAQqD3OAwkAINv1cn/0XvO7eJ4W3/LVHqLzU7Tg8MQ/+HzmNz
 5Z3HL+3QP7P2HaBWS2eZ80ZQU3kHchVbXdb9rfCe5Pgfua/9kzeLOop9haA0twc+S3F8
 g+Q2gs05Aupz1UdyatQOdPkZOHD4pk9KTdALyTsKlkr7xD1j37drU6wTJZiwJDcW/Pyz
 OvvszCrXnjS4rpErpKk0psnxNx/zs5x0Fzdhec0rWMlHb0kwxJ+2XUlnFNeHzRYIudEx
 Kl8g==
X-Gm-Message-State: AC+VfDyV5HWwqazCWHVNfcYNkDdjGXwtzhFUdNxkEdLKI42+BL9F27VD
 AULjep7QtV/69VayII4vCdFrqQ==
X-Google-Smtp-Source: ACHHUZ6xwNXSxNYsdtJ9sPV0rEy1vXQ2i0YjqT/L0lpf8zU6e+CCSKX6fRR5bPO2oUrFnRbeBf/gYQ==
X-Received: by 2002:adf:f1d0:0:b0:306:d43:4d8e with SMTP id
 z16-20020adff1d0000000b003060d434d8emr673144wro.29.1683097078957; 
 Tue, 02 May 2023 23:57:58 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 37/54] tcg/aarch64: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Wed,  3 May 2023 07:57:12 +0100
Message-Id: <20230503065729.1745843-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Wed, 03 May 2023 06:59:02 -0000

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 40 +++++++++++++++---------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 202b90c001..62dd22d73c 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1580,13 +1580,6 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
     }
 }
 
-static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
-{
-    ptrdiff_t offset = tcg_pcrel_diff(s, target);
-    tcg_debug_assert(offset == sextract64(offset, 0, 21));
-    tcg_out_insn(s, 3406, ADR, rd, offset);
-}
-
 typedef struct {
     TCGReg base;
     TCGReg index;
@@ -1627,47 +1620,46 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 #endif
 };
 
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 1, .tmp = { TCG_REG_TMP }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc19(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
-    tcg_out_mov(s, TARGET_LONG_BITS == 64, TCG_REG_X1, lb->addrlo_reg);
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X2, oi);
-    tcg_out_adr(s, TCG_REG_X3, lb->raddr);
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
-
-    tcg_out_movext(s, lb->type, lb->datalo_reg,
-                   TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_X0);
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
     tcg_out_goto(s, lb->raddr);
     return true;
 }
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc19(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
-    tcg_out_mov(s, TARGET_LONG_BITS == 64, TCG_REG_X1, lb->addrlo_reg);
-    tcg_out_mov(s, size == MO_64, TCG_REG_X2, lb->datalo_reg);
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X3, oi);
-    tcg_out_adr(s, TCG_REG_X4, lb->raddr);
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE]);
     tcg_out_goto(s, lb->raddr);
     return true;
 }
 #else
+static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
+{
+    ptrdiff_t offset = tcg_pcrel_diff(s, target);
+    tcg_debug_assert(offset == sextract64(offset, 0, 21));
+    tcg_out_insn(s, 3406, ADR, rd, offset);
+}
+
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     if (!reloc_pc19(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-- 
2.34.1


