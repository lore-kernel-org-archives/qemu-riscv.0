Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqp24-0007Dc-9K
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0C-0005tt-DX
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:44:43 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp03-0005GS-Vv
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:44:35 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2fa47de5b04so3818406f8f.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315070; x=1684907070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ZL038/Ng9nS/xr0DDxwNdtMDtu/OB6KUuAjmGyJXv0=;
 b=oltYc1IboHs0WxDU+tq7KL0mu+avtM9cwzNM9fqVjgvg0fn4qOCEGKxaca2DYaSZJb
 CMuOdC4DcDFI3OrrfDg/5owpS1MPUNZfeJDh1x6EZLAfCQ6f40GMnJJt0KyOX4cjhvQ+
 vzQHi2+wHuDlKdquO82wpTZzGrlDEwrSO97kuU8XkksPcW2AX7iiauokK+c+HW+hJL5B
 KCcUlbOBW3MV1z5DkXvHLao/dSr9xekuEVe17B3p8ot/i4gAcoV2lxA5+hwu7YgMQWs/
 BZyVFOYKbcHoN8FDiTC6ZMt2IlMkdYqp3PnE+z4MPGfHqJSHHVwKCuVuJVj7M0bWvYDf
 +QMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315070; x=1684907070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ZL038/Ng9nS/xr0DDxwNdtMDtu/OB6KUuAjmGyJXv0=;
 b=fp3T+tQaTbtlX9PS6mrVblB/BOkBnP6Hn6OBKlT6daPYmyvOM58FPQ7KmO5UrIApBP
 w3XobBTt90ceLJb80eXshopoaD4hqf1YbFXHc81pUz3welkoufmxKyEkvR6n0RgaXc+X
 jcHkNzidB/x4qYIYpAbRLvdiNYmLMqvUhzzyOV5f7yBTr68/6Xp1jdQTJHOMP0CA5HlM
 iOeL8l35jdJ5C++WFINmRlqhoWOy0e6wfBrNdKg6LgIvpGScN0kAzU4rmHkROtRadmlU
 d4r16ocLSsPZpGQXvwWDUespyY4U+wkqCuKk9K2qy+A+q1VCHrvkAzDrtO7LlN8Z79ps
 uleA==
X-Gm-Message-State: AAQBX9d6ggMhyvBL5AsSVfmB337m3LfFWmnueKULURXJyImIlWREMFda
 zgjgU6d/JH1cx1PFTs8xzpqrEw==
X-Google-Smtp-Source: AKy350aDBRjqE6m21yMah+Wkg6hP/C8aPIBm1vvu3WSPnkbtV4q1a6AjJ7/hvroXtYbqvrTXJpOHQg==
X-Received: by 2002:a05:6000:1b8b:b0:304:71e8:d506 with SMTP id
 r11-20020a0560001b8b00b0030471e8d506mr2883301wru.48.1682315070505; 
 Sun, 23 Apr 2023 22:44:30 -0700 (PDT)
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
Subject: [PATCH v3 41/57] tcg/aarch64: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 24 Apr 2023 06:40:49 +0100
Message-Id: <20230424054105.1579315-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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


