Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6Qx-0007dJ-Ag
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qv-0007bC-MN
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:49 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qk-0001iF-FQ
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:49 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so28938655e9.2
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097057; x=1685689057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1bbEpaIXXaTgQeWDYcOIlkZ67YetPKNrTK/y3Em/irY=;
 b=Ql3qcpiVgJXBr7RjQxRlTKrqqFUCnsT4hpDQo/m5KEbllzoV6JsMX8x1E3D5Bz9t3N
 pfP5mGtnjQyzEm2+oLoZGOgORiH0GQf424hHpLUcOh5vSdR0TLaSB4Glkuf0agEYW3va
 c7eRaY1cda/8E0sx24g/9+H5TabqjRd1SJifGXjmvHYttb6XYaH+eHItc9/JFk27nrRG
 8RZamJQ/w4NIyOjmiqqpTauhg5I8Brv2bKaBvPN33k4XmesTol/m5pvBrzOeR2hpk5zy
 v90K+uwmx9PxHa1PZzgo3zdzslP9pAS+/sFwmTa9OchpccdVkKr9Gr5qVy2EobUx/ZoU
 paaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097057; x=1685689057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1bbEpaIXXaTgQeWDYcOIlkZ67YetPKNrTK/y3Em/irY=;
 b=X1fSWNzJmi5Ifse0t4kpVBUSO/IEw+NWOPcXK9gaNYuMcZGmFQPWKegtsGeUjcZRmM
 lcY7CHMTHcUJgBlb9EeMkIO7DevXbq+dmmywnwKGFjcnUdm8sjstAb2uG9kkZzsUxeP5
 PTjlFRKlnKM34tXzq0WYLKrb2V6vbhpShk96DZuN64lmRH+RE71Aam2bEqWNIZ7fjLAi
 eKFwsjL2SL5ia3kJpDYY4VrkK7HChNTsMo4TFZdveVMB5weFVgBzE/GkndYSzRPlLCgt
 QaXevgxnlHbAJFApPtwGHmGHk9EdXycIw3fx0akRKHfdVCdC4IC3w38n0HxdfgN1nRG5
 x6mA==
X-Gm-Message-State: AC+VfDy831cA4Gzqc0l4812bmZ7dpyBJ7A4osnK4tonVQ3U/9XxS1SmO
 hhhNkCFex9SamCvgmnnHhn+4UKRUn0pWW7nIcFTdmA==
X-Google-Smtp-Source: ACHHUZ6Kc7ybNpns5As6G5VqW/yoL6WdpzKo1Foz0LnSHbNBE+Xm8zjAj2ZzTKG3eJjkQnDglucRxg==
X-Received: by 2002:a7b:cb89:0:b0:3ed:a80e:6dfa with SMTP id
 m9-20020a7bcb89000000b003eda80e6dfamr13411066wmi.40.1683097056995; 
 Tue, 02 May 2023 23:57:36 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 09/54] tcg/aarch64: Introduce HostAddress
Date: Wed,  3 May 2023 07:56:44 +0100
Message-Id: <20230503065729.1745843-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Wed, 03 May 2023 06:57:50 -0000

Collect the 3 potential parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st}_direct to use it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 86 +++++++++++++++++++++++++-----------
 1 file changed, 59 insertions(+), 27 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index ecbf6564fc..d8d464e4a0 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1587,6 +1587,12 @@ static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
     tcg_out_insn(s, 3406, ADR, rd, offset);
 }
 
+typedef struct {
+    TCGReg base;
+    TCGReg index;
+    TCGType index_ext;
+} HostAddress;
+
 #ifdef CONFIG_SOFTMMU
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     MemOpIdx oi, uintptr_t ra)
@@ -1796,32 +1802,31 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 #endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
-                                   TCGReg data_r, TCGReg addr_r,
-                                   TCGType otype, TCGReg off_r)
+                                   TCGReg data_r, HostAddress h)
 {
     switch (memop & MO_SSIZE) {
     case MO_UB:
-        tcg_out_ldst_r(s, I3312_LDRB, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRB, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_SB:
         tcg_out_ldst_r(s, ext ? I3312_LDRSBX : I3312_LDRSBW,
-                       data_r, addr_r, otype, off_r);
+                       data_r, h.base, h.index_ext, h.index);
         break;
     case MO_UW:
-        tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRH, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_SW:
         tcg_out_ldst_r(s, (ext ? I3312_LDRSHX : I3312_LDRSHW),
-                       data_r, addr_r, otype, off_r);
+                       data_r, h.base, h.index_ext, h.index);
         break;
     case MO_UL:
-        tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRW, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_SL:
-        tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRSWX, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_UQ:
-        tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRX, data_r, h.base, h.index_ext, h.index);
         break;
     default:
         g_assert_not_reached();
@@ -1829,21 +1834,20 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
-                                   TCGReg data_r, TCGReg addr_r,
-                                   TCGType otype, TCGReg off_r)
+                                   TCGReg data_r, HostAddress h)
 {
     switch (memop & MO_SIZE) {
     case MO_8:
-        tcg_out_ldst_r(s, I3312_STRB, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRB, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_16:
-        tcg_out_ldst_r(s, I3312_STRH, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRH, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_32:
-        tcg_out_ldst_r(s, I3312_STRW, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRW, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_64:
-        tcg_out_ldst_r(s, I3312_STRX, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRX, data_r, h.base, h.index_ext, h.index);
         break;
     default:
         g_assert_not_reached();
@@ -1855,6 +1859,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 {
     MemOp memop = get_memop(oi);
     TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    HostAddress h;
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
@@ -1863,8 +1868,14 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     tcg_insn_unit *label_ptr;
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 1);
-    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
-                           TCG_REG_X1, addr_type, addr_reg);
+
+    h = (HostAddress){
+        .base = TCG_REG_X1,
+        .index = addr_reg,
+        .index_ext = addr_type
+    };
+    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg, h);
+
     add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
@@ -1873,12 +1884,19 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
     if (USE_GUEST_BASE) {
-        tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
-                               TCG_REG_GUEST_BASE, addr_type, addr_reg);
+        h = (HostAddress){
+            .base = TCG_REG_GUEST_BASE,
+            .index = addr_reg,
+            .index_ext = addr_type
+        };
     } else {
-        tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
-                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
+        h = (HostAddress){
+            .base = addr_reg,
+            .index = TCG_REG_XZR,
+            .index_ext = TCG_TYPE_I64
+        };
     }
+    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg, h);
 #endif /* CONFIG_SOFTMMU */
 }
 
@@ -1887,6 +1905,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 {
     MemOp memop = get_memop(oi);
     TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    HostAddress h;
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
@@ -1895,8 +1914,14 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     tcg_insn_unit *label_ptr;
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 0);
-    tcg_out_qemu_st_direct(s, memop, data_reg,
-                           TCG_REG_X1, addr_type, addr_reg);
+
+    h = (HostAddress){
+        .base = TCG_REG_X1,
+        .index = addr_reg,
+        .index_ext = addr_type
+    };
+    tcg_out_qemu_st_direct(s, memop, data_reg, h);
+
     add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
@@ -1905,12 +1930,19 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
         tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
     if (USE_GUEST_BASE) {
-        tcg_out_qemu_st_direct(s, memop, data_reg,
-                               TCG_REG_GUEST_BASE, addr_type, addr_reg);
+        h = (HostAddress){
+            .base = TCG_REG_GUEST_BASE,
+            .index = addr_reg,
+            .index_ext = addr_type
+        };
     } else {
-        tcg_out_qemu_st_direct(s, memop, data_reg,
-                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
+        h = (HostAddress){
+            .base = addr_reg,
+            .index = TCG_REG_XZR,
+            .index_ext = TCG_TYPE_I64
+        };
     }
+    tcg_out_qemu_st_direct(s, memop, data_reg, h);
 #endif /* CONFIG_SOFTMMU */
 }
 
-- 
2.34.1


