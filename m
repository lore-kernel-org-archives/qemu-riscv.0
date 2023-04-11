Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2T6-00061X-Rr
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sr-0005Iz-57
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:29 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sn-0000qT-KH
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:28 -0400
Received: by mail-pl1-x633.google.com with SMTP id ke16so6197764plb.6
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qT5Ws6ngWptSo4hILomLrOc966JOOEK9o/7KOS44348=;
 b=Oisl1rGHQ+TxSBO1B/ReZ+l2mtmKd/rj1AY5qg/5YsKuinnxI6MiznNJ1nfK4hIRC7
 +fajgPC/zQ+5pknv99XGJkiiPDN3qbXESXTBvwZ6tYzD5VGkEDaM4xwWB1rd3Di6v1MX
 6xheVQJR0C2HR2IiCaPDu4em5EK8Q8MMo2QJ4FDPzSHtHzQVmV0ukIcDgwxntNAzL78e
 /Y9o8coyHFH2f4V0/LRFDEi8wFcjAnwnViPSn/vmGy6V2pj8IfrAZFIpA/y2xg+NrCYT
 NV7M0dXX8Bi35iSPBWY03GmTDIPZE5fimthpyPlxL/Gsd7PPCl43tN9e3u4xQPO4uhid
 wEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qT5Ws6ngWptSo4hILomLrOc966JOOEK9o/7KOS44348=;
 b=sQBxCtVZEljJ1CyqRAVlh5HX9le3gD0zg5UwvIWZcEWVXyDWCtN5aEmHkq5djOJaYW
 Lai1q+/zzZ9CblJCm3oQtjO+PwySIlsZJVNR6MARHltmlMYCGVs4g2Ut9dBdokzn7K17
 WhbIerIJgYYz6Tx7OSsYQQvW8mfEV5DqmxwQftPU1faA9OdSKYVmnjE3FIbbV6KERWlq
 1CtXKXLFgWgJVnW6XXu1smyznUZzfDgkd3XcbrCzTrMitnXXgIZFQy23USJP2Y7LYgQ5
 lRrG2itVMcuJ40EwVR15B7zRq/XdDkUUsEFJfpma3oVsuUHo75FKlibPWlZFPmm65/jD
 +d/A==
X-Gm-Message-State: AAQBX9fn7lhD6AtaMCPQ7Qk/ebQ0EROR0tnxLm8O5+IcdS9d5rnJ9TVR
 A0SxLHMMWaenFgbM8OeuQpwLnQ==
X-Google-Smtp-Source: AKy350bfGGglGa4qJua4v6lLmEdwGeusAwqDLwnmA/7IiZYCGgnpM7BOWwjnvbgNU+46Xpxd5LQ4Uw==
X-Received: by 2002:a17:903:120a:b0:1a0:76d1:545c with SMTP id
 l10-20020a170903120a00b001a076d1545cmr23254412plh.10.1681175183521; 
 Mon, 10 Apr 2023 18:06:23 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 23/54] tcg/mips: Rationalize args to tcg_out_qemu_{ld,st}
Date: Mon, 10 Apr 2023 18:04:41 -0700
Message-Id: <20230411010512.5375-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:06:29 -0000

Interpret the variable argument placement in the caller.
Mark the argument registers const, because they must be passed to
add_qemu_ldst_label unmodified.  There are several places where we
already convert back from bool to type.  Clean things up by using
type throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 188 ++++++++++++++++++++------------------
 1 file changed, 97 insertions(+), 91 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index a83ebe8729..ee5826c2b5 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1479,7 +1479,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 #endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
-                                   TCGReg base, MemOp opc, bool is_64)
+                                   TCGReg base, MemOp opc, TCGType type)
 {
     switch (opc & (MO_SSIZE | MO_BSWAP)) {
     case MO_UB:
@@ -1503,7 +1503,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         tcg_out_opc_imm(s, OPC_LH, lo, base, 0);
         break;
     case MO_UL | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64 && is_64) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
             if (use_mips32r2_instructions) {
                 tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
                 tcg_out_bswap32(s, lo, lo, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
@@ -1528,7 +1528,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         }
         break;
     case MO_UL:
-        if (TCG_TARGET_REG_BITS == 64 && is_64) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
             tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
             break;
         }
@@ -1583,7 +1583,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
 }
 
 static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
-                                    TCGReg base, MemOp opc, bool is_64)
+                                    TCGReg base, MemOp opc, TCGType type)
 {
     const MIPSInsn lw1 = MIPS_BE ? OPC_LWL : OPC_LWR;
     const MIPSInsn lw2 = MIPS_BE ? OPC_LWR : OPC_LWL;
@@ -1623,7 +1623,7 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     case MO_UL:
         tcg_out_opc_imm(s, lw1, lo, base, 0);
         tcg_out_opc_imm(s, lw2, lo, base, 3);
-        if (TCG_TARGET_REG_BITS == 64 && is_64 && !sgn) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn) {
             tcg_out_ext32u(s, lo, lo);
         }
         break;
@@ -1634,18 +1634,18 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, lw1, lo, base, 0);
             tcg_out_opc_imm(s, lw2, lo, base, 3);
             tcg_out_bswap32(s, lo, lo,
-                            TCG_TARGET_REG_BITS == 64 && is_64
+                            TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64
                             ? (sgn ? TCG_BSWAP_OS : TCG_BSWAP_OZ) : 0);
         } else {
             const tcg_insn_unit *subr =
-                (TCG_TARGET_REG_BITS == 64 && is_64 && !sgn
+                (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn
                  ? bswap32u_addr : bswap32_addr);
 
             tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0);
             tcg_out_bswap_subr(s, subr);
             /* delay slot */
             tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 3);
-            tcg_out_mov(s, is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32, lo, TCG_TMP3);
+            tcg_out_mov(s, type, lo, TCG_TMP3);
         }
         break;
 
@@ -1702,68 +1702,60 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_ld(TCGContext *s,
+                            const TCGReg datalo, const TCGReg datahi,
+                            const TCGReg addrlo, const TCGReg addrhi,
+                            const MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addr_regl, addr_regh __attribute__((unused));
-    TCGReg data_regl, data_regh;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
-#else
-#endif
-    unsigned a_bits, s_bits;
-    TCGReg base = TCG_REG_A0;
-
-    data_regl = *args++;
-    data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addr_regl = *args++;
-    addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-    a_bits = get_alignment_bits(opc);
-    s_bits = opc & MO_SIZE;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned s_bits = opc & MO_SIZE;
+    TCGReg base;
 
     /*
      * R6 removes the left/right instructions but requires the
      * system to support misaligned memory accesses.
      */
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 1);
+    tcg_insn_unit *label_ptr[2];
+
+    base = TCG_REG_A0;
+    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 1);
     if (use_mips32r6_instructions || a_bits >= s_bits) {
-        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
     } else {
-        tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_unalign(s, datalo, datahi, base, opc, data_type);
     }
-    add_qemu_ldst_label(s, 1, oi,
-                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_regl, data_regh, addr_regl, addr_regh,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
+    base = addrlo;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
+        tcg_out_ext32u(s, TCG_REG_A0, base);
+        base = TCG_REG_A0;
     }
-    if (guest_base == 0 && data_regl != addr_regl) {
-        base = addr_regl;
-    } else if (guest_base == (int16_t)guest_base) {
-        tcg_out_opc_imm(s, ALIAS_PADDI, base, addr_regl, guest_base);
-    } else {
-        tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    if (guest_base) {
+        if (guest_base == (int16_t)guest_base) {
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
+        } else {
+            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
+                            TCG_GUEST_BASE_REG);
+        }
+        base = TCG_REG_A0;
     }
     if (use_mips32r6_instructions) {
         if (a_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
-        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
     } else {
         if (a_bits && a_bits != s_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
         if (a_bits >= s_bits) {
-            tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+            tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
         } else {
-            tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, is_64);
+            tcg_out_qemu_ld_unalign(s, datalo, datahi, base, opc, data_type);
         }
     }
 #endif
@@ -1902,67 +1894,61 @@ static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
         g_assert_not_reached();
     }
 }
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
-{
-    TCGReg addr_regl, addr_regh __attribute__((unused));
-    TCGReg data_regl, data_regh;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
-#endif
-    unsigned a_bits, s_bits;
-    TCGReg base = TCG_REG_A0;
 
-    data_regl = *args++;
-    data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addr_regl = *args++;
-    addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-    a_bits = get_alignment_bits(opc);
-    s_bits = opc & MO_SIZE;
+static void tcg_out_qemu_st(TCGContext *s,
+                            const TCGReg datalo, const TCGReg datahi,
+                            const TCGReg addrlo, const TCGReg addrhi,
+                            const MemOpIdx oi, TCGType data_type)
+{
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned s_bits = opc & MO_SIZE;
+    TCGReg base;
 
     /*
      * R6 removes the left/right instructions but requires the
      * system to support misaligned memory accesses.
      */
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 0);
+    tcg_insn_unit *label_ptr[2];
+
+    base = TCG_REG_A0;
+    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 0);
     if (use_mips32r6_instructions || a_bits >= s_bits) {
-        tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+        tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
     } else {
-        tcg_out_qemu_st_unalign(s, data_regl, data_regh, base, opc);
+        tcg_out_qemu_st_unalign(s, datalo, datahi, base, opc);
     }
-    add_qemu_ldst_label(s, 0, oi,
-                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_regl, data_regh, addr_regl, addr_regh,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
+    base = addrlo;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
+        tcg_out_ext32u(s, TCG_REG_A0, base);
+        base = TCG_REG_A0;
     }
-    if (guest_base == 0) {
-        base = addr_regl;
-    } else if (guest_base == (int16_t)guest_base) {
-        tcg_out_opc_imm(s, ALIAS_PADDI, base, addr_regl, guest_base);
-    } else {
-        tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    if (guest_base) {
+        if (guest_base == (int16_t)guest_base) {
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
+        } else {
+            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
+                            TCG_GUEST_BASE_REG);
+        }
+        base = TCG_REG_A0;
     }
     if (use_mips32r6_instructions) {
         if (a_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
-        tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+        tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
     } else {
         if (a_bits && a_bits != s_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
         if (a_bits >= s_bits) {
-            tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+            tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
         } else {
-            tcg_out_qemu_st_unalign(s, data_regl, data_regh, base, opc);
+            tcg_out_qemu_st_unalign(s, datalo, datahi, base, opc);
         }
     }
 #endif
@@ -2425,16 +2411,36 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, false);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_ld(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, true);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, a0, a1, a2, -1, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_ld(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, false);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_st(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, true);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, a0, a1, a2, -1, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
 
     case INDEX_op_add2_i32:
-- 
2.34.1


