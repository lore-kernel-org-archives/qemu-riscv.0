Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6Qo-0007TE-8O
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qm-0007RW-Gw
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qg-0001fS-5A
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:40 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f7db354092so2934757f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097052; x=1685689052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/6oOL9Qxq+7huZ1LmoWKmGGF4tAmAVlunpyi8FXbSEY=;
 b=jNnX9facr8HTBfe4yU47OdtaLb3rFENF53u38m5Ej8GgSu0+YR2wU46xxyFhVocChH
 vHb0nBBck/Wor2H+1EOFLkNUoNwT2j67qmcrCiSzhCKU118mlU+3edNtgPz93zU97lDU
 QTdh9nlVzG/xvJBocOrw/S2gETDO6VlYaInLdONvL5n2Clrqvlm8A0w9xzNHiCRY+wIq
 597/lTv4WIjVbEdxVyZ9X57llu6EoTocsvLTMgGQ7kyK0vR+x8/dVjaEEsApI1B1UAso
 fH5uFF6xVmB4zLjnJIR/1Q+BjdLw+/oRQ50feMbY0VAOOw1yqioUR914stsa6Vdv+Kjx
 n0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097052; x=1685689052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/6oOL9Qxq+7huZ1LmoWKmGGF4tAmAVlunpyi8FXbSEY=;
 b=fQYUQK9e03uC7EH8r+YpE3Nhb/ICNqQl8bF5VlOWoJ0uyYUKQ8qANmtqvym1sawXNp
 z9iU5cfvYktVHw0x+Af6UyZJsWBFZRzz+UErPTRs7cU3wGOOOK+MwhFSvluewA9gag/E
 j2yx1bqEoKK7JqvQMcbztzXT63fcxlCUfn8Qy8T2Zou3lo6XzkLFANHn9MxObY4DA/52
 cCkrrsLAKxE/cDerUSHC1uvLtDjSO7Kc9orLBHX0Sp/Y4nqqnwM2IygsZyVcNo55yBaB
 uBkWn8d5v9jT8Gqon6Cbp1ZaA/2LKWT9lYi3RecL8+oJiDGYSVc8g7/IHVQzpgAuUGuq
 nyzA==
X-Gm-Message-State: AC+VfDxjaMWjp/49uV1kfp2Ys2IBpQW7HoPHjvYVDk3tNHvbGxnTZwRP
 oJZpMDU/GipeCI3eA/wkS1HCxg==
X-Google-Smtp-Source: ACHHUZ6WFicOVmkUNeKK4YWO03SxQAcJt+KMlyaL/ckhZ663tpqKjf6kgzUCItWcMDhFyY5F+PLw3w==
X-Received: by 2002:adf:fe86:0:b0:306:3b39:9a2a with SMTP id
 l6-20020adffe86000000b003063b399a2amr2086611wrr.42.1683097052534; 
 Tue, 02 May 2023 23:57:32 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 03/54] tcg/i386: Introduce HostAddress
Date: Wed,  3 May 2023 07:56:38 +0100
Message-Id: <20230503065729.1745843-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Wed, 03 May 2023 06:57:40 -0000

Collect the 4 potential parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st}_direct to use it.
Reorg guest_base handling to use it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 165 +++++++++++++++++++++-----------------
 1 file changed, 90 insertions(+), 75 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 173f3c3172..909eecd4a3 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1751,6 +1751,13 @@ static void tcg_out_nopn(TCGContext *s, int n)
     tcg_out8(s, 0x90);
 }
 
+typedef struct {
+    TCGReg base;
+    int index;
+    int ofs;
+    int seg;
+} HostAddress;
+
 #if defined(CONFIG_SOFTMMU)
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
@@ -2113,17 +2120,13 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return tcg_out_fail_alignment(s, l);
 }
 
-#if TCG_TARGET_REG_BITS == 32
-# define x86_guest_base_seg     0
-# define x86_guest_base_index   -1
-# define x86_guest_base_offset  guest_base
-#else
-static int x86_guest_base_seg;
-static int x86_guest_base_index = -1;
-static int32_t x86_guest_base_offset;
-# if defined(__x86_64__) && defined(__linux__)
-#  include <asm/prctl.h>
-#  include <sys/prctl.h>
+static HostAddress x86_guest_base = {
+    .index = -1
+};
+
+#if defined(__x86_64__) && defined(__linux__)
+# include <asm/prctl.h>
+# include <sys/prctl.h>
 int arch_prctl(int code, unsigned long addr);
 static inline int setup_guest_base_seg(void)
 {
@@ -2132,8 +2135,9 @@ static inline int setup_guest_base_seg(void)
     }
     return 0;
 }
-# elif defined (__FreeBSD__) || defined (__FreeBSD_kernel__)
-#  include <machine/sysarch.h>
+#elif defined(__x86_64__) && \
+      (defined (__FreeBSD__) || defined (__FreeBSD_kernel__))
+# include <machine/sysarch.h>
 static inline int setup_guest_base_seg(void)
 {
     if (sysarch(AMD64_SET_GSBASE, &guest_base) == 0) {
@@ -2141,18 +2145,16 @@ static inline int setup_guest_base_seg(void)
     }
     return 0;
 }
-# else
+#else
 static inline int setup_guest_base_seg(void)
 {
     return 0;
 }
-# endif
-#endif
+#endif /* setup_guest_base_seg */
 #endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
-                                   TCGReg base, int index, intptr_t ofs,
-                                   int seg, TCGType type, MemOp memop)
+                                   HostAddress h, TCGType type, MemOp memop)
 {
     bool use_movbe = false;
     int rexw = (type == TCG_TYPE_I32 ? 0 : P_REXW);
@@ -2167,60 +2169,61 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
 
     switch (memop & MO_SSIZE) {
     case MO_UB:
-        tcg_out_modrm_sib_offset(s, OPC_MOVZBL + seg, datalo,
-                                 base, index, 0, ofs);
+        tcg_out_modrm_sib_offset(s, OPC_MOVZBL + h.seg, datalo,
+                                 h.base, h.index, 0, h.ofs);
         break;
     case MO_SB:
-        tcg_out_modrm_sib_offset(s, OPC_MOVSBL + rexw + seg, datalo,
-                                 base, index, 0, ofs);
+        tcg_out_modrm_sib_offset(s, OPC_MOVSBL + rexw + h.seg, datalo,
+                                 h.base, h.index, 0, h.ofs);
         break;
     case MO_UW:
         if (use_movbe) {
             /* There is no extending movbe; only low 16-bits are modified.  */
-            if (datalo != base && datalo != index) {
+            if (datalo != h.base && datalo != h.index) {
                 /* XOR breaks dependency chains.  */
                 tgen_arithr(s, ARITH_XOR, datalo, datalo);
-                tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + P_DATA16 + seg,
-                                         datalo, base, index, 0, ofs);
+                tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + P_DATA16 + h.seg,
+                                         datalo, h.base, h.index, 0, h.ofs);
             } else {
-                tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + P_DATA16 + seg,
-                                         datalo, base, index, 0, ofs);
+                tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + P_DATA16 + h.seg,
+                                         datalo, h.base, h.index, 0, h.ofs);
                 tcg_out_ext16u(s, datalo, datalo);
             }
         } else {
-            tcg_out_modrm_sib_offset(s, OPC_MOVZWL + seg, datalo,
-                                     base, index, 0, ofs);
+            tcg_out_modrm_sib_offset(s, OPC_MOVZWL + h.seg, datalo,
+                                     h.base, h.index, 0, h.ofs);
         }
         break;
     case MO_SW:
         if (use_movbe) {
-            tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + P_DATA16 + seg,
-                                     datalo, base, index, 0, ofs);
+            tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + P_DATA16 + h.seg,
+                                     datalo, h.base, h.index, 0, h.ofs);
             tcg_out_ext16s(s, type, datalo, datalo);
         } else {
-            tcg_out_modrm_sib_offset(s, OPC_MOVSWL + rexw + seg,
-                                     datalo, base, index, 0, ofs);
+            tcg_out_modrm_sib_offset(s, OPC_MOVSWL + rexw + h.seg,
+                                     datalo, h.base, h.index, 0, h.ofs);
         }
         break;
     case MO_UL:
-        tcg_out_modrm_sib_offset(s, movop + seg, datalo, base, index, 0, ofs);
+        tcg_out_modrm_sib_offset(s, movop + h.seg, datalo,
+                                 h.base, h.index, 0, h.ofs);
         break;
 #if TCG_TARGET_REG_BITS == 64
     case MO_SL:
         if (use_movbe) {
-            tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + seg, datalo,
-                                     base, index, 0, ofs);
+            tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + h.seg, datalo,
+                                     h.base, h.index, 0, h.ofs);
             tcg_out_ext32s(s, datalo, datalo);
         } else {
-            tcg_out_modrm_sib_offset(s, OPC_MOVSLQ + seg, datalo,
-                                     base, index, 0, ofs);
+            tcg_out_modrm_sib_offset(s, OPC_MOVSLQ + h.seg, datalo,
+                                     h.base, h.index, 0, h.ofs);
         }
         break;
 #endif
     case MO_UQ:
         if (TCG_TARGET_REG_BITS == 64) {
-            tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
-                                     base, index, 0, ofs);
+            tcg_out_modrm_sib_offset(s, movop + P_REXW + h.seg, datalo,
+                                     h.base, h.index, 0, h.ofs);
             break;
         }
         if (use_movbe) {
@@ -2228,15 +2231,16 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
             datalo = datahi;
             datahi = t;
         }
-        if (base == datalo || index == datalo) {
-            tcg_out_modrm_sib_offset(s, OPC_LEA, datahi, base, index, 0, ofs);
-            tcg_out_modrm_offset(s, movop + seg, datalo, datahi, 0);
-            tcg_out_modrm_offset(s, movop + seg, datahi, datahi, 4);
+        if (h.base == datalo || h.index == datalo) {
+            tcg_out_modrm_sib_offset(s, OPC_LEA, datahi,
+                                     h.base, h.index, 0, h.ofs);
+            tcg_out_modrm_offset(s, movop + h.seg, datalo, datahi, 0);
+            tcg_out_modrm_offset(s, movop + h.seg, datahi, datahi, 4);
         } else {
-            tcg_out_modrm_sib_offset(s, movop + seg, datalo,
-                                     base, index, 0, ofs);
-            tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                     base, index, 0, ofs + 4);
+            tcg_out_modrm_sib_offset(s, movop + h.seg, datalo,
+                                     h.base, h.index, 0, h.ofs);
+            tcg_out_modrm_sib_offset(s, movop + h.seg, datahi,
+                                     h.base, h.index, 0, h.ofs + 4);
         }
         break;
     default:
@@ -2249,6 +2253,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
 
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
@@ -2257,8 +2262,11 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
                      label_ptr, offsetof(CPUTLBEntry, addr_read));
 
     /* TLB Hit.  */
-    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1,
-                           -1, 0, 0, data_type, opc);
+    h.base = TCG_REG_L1;
+    h.index = -1;
+    h.ofs = 0;
+    h.seg = 0;
+    tcg_out_qemu_ld_direct(s, datalo, datahi, h, data_type, opc);
 
     /* Record the current context of a load into ldst label */
     add_qemu_ldst_label(s, true, data_type, oi, datalo, datahi,
@@ -2269,15 +2277,14 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
         tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
     }
 
-    tcg_out_qemu_ld_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
-                           x86_guest_base_offset, x86_guest_base_seg,
-                           data_type, opc);
+    h = x86_guest_base;
+    h.base = addrlo;
+    tcg_out_qemu_ld_direct(s, datalo, datahi, h, data_type, opc);
 #endif
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
-                                   TCGReg base, int index, intptr_t ofs,
-                                   int seg, MemOp memop)
+                                   HostAddress h, MemOp memop)
 {
     bool use_movbe = false;
     int movop = OPC_MOVL_EvGv;
@@ -2296,30 +2303,31 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
     case MO_8:
         /* This is handled with constraints on INDEX_op_qemu_st8_i32. */
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || datalo < 4);
-        tcg_out_modrm_sib_offset(s, OPC_MOVB_EvGv + P_REXB_R + seg,
-                                 datalo, base, index, 0, ofs);
+        tcg_out_modrm_sib_offset(s, OPC_MOVB_EvGv + P_REXB_R + h.seg,
+                                 datalo, h.base, h.index, 0, h.ofs);
         break;
     case MO_16:
-        tcg_out_modrm_sib_offset(s, movop + P_DATA16 + seg, datalo,
-                                 base, index, 0, ofs);
+        tcg_out_modrm_sib_offset(s, movop + P_DATA16 + h.seg, datalo,
+                                 h.base, h.index, 0, h.ofs);
         break;
     case MO_32:
-        tcg_out_modrm_sib_offset(s, movop + seg, datalo, base, index, 0, ofs);
+        tcg_out_modrm_sib_offset(s, movop + h.seg, datalo,
+                                 h.base, h.index, 0, h.ofs);
         break;
     case MO_64:
         if (TCG_TARGET_REG_BITS == 64) {
-            tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
-                                     base, index, 0, ofs);
+            tcg_out_modrm_sib_offset(s, movop + P_REXW + h.seg, datalo,
+                                     h.base, h.index, 0, h.ofs);
         } else {
             if (use_movbe) {
                 TCGReg t = datalo;
                 datalo = datahi;
                 datahi = t;
             }
-            tcg_out_modrm_sib_offset(s, movop + seg, datalo,
-                                     base, index, 0, ofs);
-            tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                     base, index, 0, ofs + 4);
+            tcg_out_modrm_sib_offset(s, movop + h.seg, datalo,
+                                     h.base, h.index, 0, h.ofs);
+            tcg_out_modrm_sib_offset(s, movop + h.seg, datahi,
+                                     h.base, h.index, 0, h.ofs + 4);
         }
         break;
     default:
@@ -2332,6 +2340,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
 
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
@@ -2340,7 +2349,11 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
                      label_ptr, offsetof(CPUTLBEntry, addr_write));
 
     /* TLB Hit.  */
-    tcg_out_qemu_st_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, opc);
+    h.base = TCG_REG_L1;
+    h.index = -1;
+    h.ofs = 0;
+    h.seg = 0;
+    tcg_out_qemu_st_direct(s, datalo, datahi, h, opc);
 
     /* Record the current context of a store into ldst label */
     add_qemu_ldst_label(s, false, data_type, oi, datalo, datahi,
@@ -2351,8 +2364,10 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
         tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
     }
 
-    tcg_out_qemu_st_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
-                           x86_guest_base_offset, x86_guest_base_seg, opc);
+    h = x86_guest_base;
+    h.base = addrlo;
+
+    tcg_out_qemu_st_direct(s, datalo, datahi, h, opc);
 #endif
 }
 
@@ -4058,18 +4073,18 @@ static void tcg_target_qemu_prologue(TCGContext *s)
                          (ARRAY_SIZE(tcg_target_callee_save_regs) + 2) * 4
                          + stack_addend);
 #else
-# if !defined(CONFIG_SOFTMMU) && TCG_TARGET_REG_BITS == 64
+# if !defined(CONFIG_SOFTMMU)
     if (guest_base) {
         int seg = setup_guest_base_seg();
         if (seg != 0) {
-            x86_guest_base_seg = seg;
+            x86_guest_base.seg = seg;
         } else if (guest_base == (int32_t)guest_base) {
-            x86_guest_base_offset = guest_base;
+            x86_guest_base.ofs = guest_base;
         } else {
             /* Choose R12 because, as a base, it requires a SIB byte. */
-            x86_guest_base_index = TCG_REG_R12;
-            tcg_out_movi(s, TCG_TYPE_PTR, x86_guest_base_index, guest_base);
-            tcg_regset_set_reg(s->reserved_regs, x86_guest_base_index);
+            x86_guest_base.index = TCG_REG_R12;
+            tcg_out_movi(s, TCG_TYPE_PTR, x86_guest_base.index, guest_base);
+            tcg_regset_set_reg(s->reserved_regs, x86_guest_base.index);
         }
     }
 # endif
-- 
2.34.1


