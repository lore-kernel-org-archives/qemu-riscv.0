Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqoxG-0005Rd-P5
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox5-0005Kg-QR
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:27 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqows-0004GJ-QL
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:27 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2f27a9c7970so3618737f8f.2
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314870; x=1684906870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YIgckz6VVGA+z4mpJFQpy6mrt/mutSB41Mg7USic7Pg=;
 b=ebDrgSRCst0G1+Y66lHpi0pawPt54vZrm+crbLhUBbfLHojBey2TEUIISOrtmg4sVm
 j8fwsF/4DoAz26v3rJ65h3631iCCLACjDNlITPHoxvNCoOCzcr1Ft5cpAEBhspCAtBf0
 nEveodQusmsD8eMhHxC6h1ZpIEmZz076Y9GHBt4/F+pB567gQviT6/vgfXonUKRiYWaZ
 5eFDLXNu0FrwtopyjtmLYiPEfH6Yc49ovOUhwkACf8sbXK4EEWN4enlEg2mmT36jdHwF
 DW0mNnO8Ap3aNIf9+mOA1C9PmbapZlI3zNfbNBBkGBJGSfZAAtcHCWE0lt3VUmmJSNSq
 pRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314870; x=1684906870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YIgckz6VVGA+z4mpJFQpy6mrt/mutSB41Mg7USic7Pg=;
 b=HAFg5TzMTSmLgd6ZM1Wi5+tInRNEBqe5M6y+mLVKpt+SlZDaKw39DXkqCKWGM5o8/7
 0NCidSxCbDtNL7q2yb3qwNFPP2EklTwMprXOoKseAcidnvnGYtcpxoiO0fQYMxjKCC76
 wC5l6jv6RvqZIaaLwDoTYIGuLcYJjBk01O7iBPTuEikHJ8rW5I1t7VXTpodBcgRLHwKw
 XJxi6d903sStbe0s2F0z/bMlAzIfcyaNk8/bMoJODYPPMUc/g67EprLBn6jj7CWuUuwx
 Ing+AbgVcyBpUdJCNztBREG0uU0QRuXaREtTdSXheTV7EdWy/w/aNjpzjzdtQkLcohq0
 D9sg==
X-Gm-Message-State: AAQBX9dm3nTItt6JcfRRxir8QO2SckT3E/eBx9A2S3nQx8zDwZek+pfE
 bGCRQQMzYT+Bi6+xxgQa1eSxvg==
X-Google-Smtp-Source: AKy350Y1BfSeuyAshaQwyewAJX7hIlGmwJ1X2HOqj2Xd8PQiRCfhz7cYdR64lMPDSMjlzt/zFCOCgA==
X-Received: by 2002:a5d:40c6:0:b0:2ef:b052:1296 with SMTP id
 b6-20020a5d40c6000000b002efb0521296mr8954146wrq.22.1682314870486; 
 Sun, 23 Apr 2023 22:41:10 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 07/57] tcg/i386: Introduce HostAddress
Date: Mon, 24 Apr 2023 06:40:15 +0100
Message-Id: <20230424054105.1579315-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Mon, 24 Apr 2023 05:41:28 -0000

Collect the 4 potential parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st}_direct to use it.
Reorg guest_base handling to use it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 165 +++++++++++++++++++++-----------------
 1 file changed, 90 insertions(+), 75 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 794d440a9e..b6750c364a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1753,6 +1753,13 @@ static void tcg_out_nopn(TCGContext *s, int n)
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
@@ -2115,17 +2122,13 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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
@@ -2134,8 +2137,9 @@ static inline int setup_guest_base_seg(void)
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
@@ -2143,18 +2147,16 @@ static inline int setup_guest_base_seg(void)
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
@@ -2169,60 +2171,61 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
 
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
@@ -2230,15 +2233,16 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
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
@@ -2251,6 +2255,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
 
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
@@ -2259,8 +2264,11 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
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
@@ -2271,15 +2279,14 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
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
@@ -2298,30 +2305,31 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
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
@@ -2334,6 +2342,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
 
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
@@ -2342,7 +2351,11 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
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
@@ -2353,8 +2366,10 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
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
 
@@ -4060,18 +4075,18 @@ static void tcg_target_qemu_prologue(TCGContext *s)
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


