Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Sz-0005k0-Nv
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Su-0005WF-Tr
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:32 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sq-0000rl-0A
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:32 -0400
Received: by mail-pj1-x1029.google.com with SMTP id px4so4175582pjb.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wpL42c9J2QGyr3Q5COzWKJRPwuGzBbj68w1re0qrOug=;
 b=IMTLNXjVdG+a8pDuh/CK1ugU+lZsI/H2UJn/qrRMxdqvKlNRTeViDlP6iRdOAE4ELE
 Px4+2AQ+BsT2qp/jgtETh60TPy7sxHPwYKeRZqjM/k1oj1g0C2L0mX3LTstsVWeDUFO0
 a0fnoXvG8w70KYD82D1H9JGoL6ZgVobIufsn/f+QTSRCbE5VPN47p4ZwsQ0esP4WzwF6
 +QkSTHcaW/pQ83Rcf5JVlS7o1aVbHfpLUH+03Ur5rXxpUHx7tCDNa/uTOSa1evvQYceN
 QWphzgFwDHm4EqNLq1uLG1I0uUYCsU1HUuRWazXt0HFcEvYfs65oiHbVo9la0BR6dWqP
 QB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wpL42c9J2QGyr3Q5COzWKJRPwuGzBbj68w1re0qrOug=;
 b=CccMZEngtjHCyIvP3VZbI2MLgk9PycqgZaJ5j/qSwrgKO1zgHDjuQkNb09vOUCthfd
 5fh4YjWiTSqkK3Q/khiq/O3SH3tGQ+q6N1EZvtZ1VmWAJq+l8/Or55K5OV1WlyrCC3uO
 3k/ambykfFriB38u52R17CTg49mKpoR+mDSctq7Zh0al+3EgyPMUCfDojslMUVefsSnR
 7EmNlUhXODtTR+jej8Riev2t/U6MqftQqGfIcS0kUx4m7+KFDT5FlFsajzJI8fDG1S7R
 VN6ypkdx127wiCZcE/BDMdGk4MJTYpbWcF34uCv+Ij9u06Jw7Tq55djq7HHVnWkXMq46
 mFIg==
X-Gm-Message-State: AAQBX9cSdFEwmAVIBidvaowLQNgXCCFkB4v0jaLdV1bvZKxc4+yR6kA3
 D/AkycNHSZOBm68qnA7Bsa6PSw==
X-Google-Smtp-Source: AKy350aZBlDuuG0OSSzi/IOhXKZ5f02Xg1og2/6i/TWk+kVbyUe5NaZnk4HqNZi2L/HGKgnvj8reEw==
X-Received: by 2002:a17:90b:164f:b0:240:67d5:aea1 with SMTP id
 il15-20020a17090b164f00b0024067d5aea1mr16790701pjb.14.1681175186315; 
 Mon, 10 Apr 2023 18:06:26 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 25/54] tcg/ppc: Rationalize args to tcg_out_qemu_{ld,st}
Date: Mon, 10 Apr 2023 18:04:43 -0700
Message-Id: <20230411010512.5375-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:06:33 -0000

Interpret the variable argument placement in the caller.
Mark the argument register const, because they must be passed to
add_qemu_ldst_label unmodified.  This requires a bit of local
variable renaming, because addrlo was being modified.

Pass data_type instead of is64 -- there are several places where
we already convert back from bool to type.  Clean things up by
using type throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 164 +++++++++++++++++++++------------------
 1 file changed, 89 insertions(+), 75 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 77abb7d20c..90093a6509 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2118,7 +2118,8 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
 /* Record the context of a call to the out of line helper code for the slow
    path for a load or store, so that we can later generate the correct
    helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
+                                TCGType type, MemOpIdx oi,
                                 TCGReg datalo_reg, TCGReg datahi_reg,
                                 TCGReg addrlo_reg, TCGReg addrhi_reg,
                                 tcg_insn_unit *raddr, tcg_insn_unit *lptr)
@@ -2126,6 +2127,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
     TCGLabelQemuLdst *label = new_ldst_label(s);
 
     label->is_ld = is_ld;
+    label->type = type;
     label->oi = oi;
     label->datalo_reg = datalo_reg;
     label->datahi_reg = datahi_reg;
@@ -2288,30 +2290,19 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 #endif /* SOFTMMU */
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_ld(TCGContext *s,
+                            const TCGReg datalo, const TCGReg datahi,
+                            const TCGReg addrlo, const TCGReg addrhi,
+                            const MemOpIdx oi, TCGType data_type)
 {
-    TCGReg datalo, datahi, addrlo, rbase;
-    TCGReg addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc, s_bits;
+    MemOp opc = get_memop(oi);
+    MemOp s_bits = opc & MO_SIZE;
+    TCGReg rbase, index;
+
 #ifdef CONFIG_SOFTMMU
-    int mem_index;
     tcg_insn_unit *label_ptr;
-#else
-    unsigned a_bits;
-#endif
 
-    datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-    s_bits = opc & MO_SIZE;
-
-#ifdef CONFIG_SOFTMMU
-    mem_index = get_mmuidx(oi);
-    addrlo = tcg_out_tlb_read(s, opc, addrlo, addrhi, mem_index, true);
+    index = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), true);
 
     /* Load a pointer into the current opcode w/conditional branch-link. */
     label_ptr = s->code_ptr;
@@ -2319,80 +2310,71 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 
     rbase = TCG_REG_R3;
 #else  /* !CONFIG_SOFTMMU */
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
     }
     rbase = guest_base ? TCG_GUEST_BASE_REG : 0;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
-        addrlo = TCG_REG_TMP1;
+        index = TCG_REG_TMP1;
+    } else {
+        index = addrlo;
     }
 #endif
 
     if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
         if (opc & MO_BSWAP) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, LWBRX | TAB(datalo, rbase, addrlo));
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, index, 4));
+            tcg_out32(s, LWBRX | TAB(datalo, rbase, index));
             tcg_out32(s, LWBRX | TAB(datahi, rbase, TCG_REG_R0));
         } else if (rbase != 0) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, LWZX | TAB(datahi, rbase, addrlo));
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, index, 4));
+            tcg_out32(s, LWZX | TAB(datahi, rbase, index));
             tcg_out32(s, LWZX | TAB(datalo, rbase, TCG_REG_R0));
-        } else if (addrlo == datahi) {
-            tcg_out32(s, LWZ | TAI(datalo, addrlo, 4));
-            tcg_out32(s, LWZ | TAI(datahi, addrlo, 0));
+        } else if (index == datahi) {
+            tcg_out32(s, LWZ | TAI(datalo, index, 4));
+            tcg_out32(s, LWZ | TAI(datahi, index, 0));
         } else {
-            tcg_out32(s, LWZ | TAI(datahi, addrlo, 0));
-            tcg_out32(s, LWZ | TAI(datalo, addrlo, 4));
+            tcg_out32(s, LWZ | TAI(datahi, index, 0));
+            tcg_out32(s, LWZ | TAI(datalo, index, 4));
         }
     } else {
         uint32_t insn = qemu_ldx_opc[opc & (MO_BSWAP | MO_SSIZE)];
         if (!have_isa_2_06 && insn == LDBRX) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, LWBRX | TAB(datalo, rbase, addrlo));
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, index, 4));
+            tcg_out32(s, LWBRX | TAB(datalo, rbase, index));
             tcg_out32(s, LWBRX | TAB(TCG_REG_R0, rbase, TCG_REG_R0));
             tcg_out_rld(s, RLDIMI, datalo, TCG_REG_R0, 32, 0);
         } else if (insn) {
-            tcg_out32(s, insn | TAB(datalo, rbase, addrlo));
+            tcg_out32(s, insn | TAB(datalo, rbase, index));
         } else {
             insn = qemu_ldx_opc[opc & (MO_SIZE | MO_BSWAP)];
-            tcg_out32(s, insn | TAB(datalo, rbase, addrlo));
+            tcg_out32(s, insn | TAB(datalo, rbase, index));
             tcg_out_movext(s, TCG_TYPE_REG, datalo,
                            TCG_TYPE_REG, opc & MO_SSIZE, datalo);
         }
     }
 
 #ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, data_type, oi, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #endif
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_st(TCGContext *s,
+                            const TCGReg datalo, const TCGReg datahi,
+                            const TCGReg addrlo, const TCGReg addrhi,
+                            const MemOpIdx oi, TCGType data_type)
 {
-    TCGReg datalo, datahi, addrlo, rbase;
-    TCGReg addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc, s_bits;
+    MemOp opc = get_memop(oi);
+    MemOp s_bits = opc & MO_SIZE;
+    TCGReg rbase, index;
+
 #ifdef CONFIG_SOFTMMU
-    int mem_index;
     tcg_insn_unit *label_ptr;
-#else
-    unsigned a_bits;
-#endif
 
-    datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-    s_bits = opc & MO_SIZE;
-
-#ifdef CONFIG_SOFTMMU
-    mem_index = get_mmuidx(oi);
-    addrlo = tcg_out_tlb_read(s, opc, addrlo, addrhi, mem_index, false);
+    index = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), false);
 
     /* Load a pointer into the current opcode w/conditional branch-link. */
     label_ptr = s->code_ptr;
@@ -2400,45 +2382,47 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 
     rbase = TCG_REG_R3;
 #else  /* !CONFIG_SOFTMMU */
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
     }
     rbase = guest_base ? TCG_GUEST_BASE_REG : 0;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
-        addrlo = TCG_REG_TMP1;
+        index = TCG_REG_TMP1;
+    } else {
+        index = addrlo;
     }
 #endif
 
     if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
         if (opc & MO_BSWAP) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, STWBRX | SAB(datalo, rbase, addrlo));
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, index, 4));
+            tcg_out32(s, STWBRX | SAB(datalo, rbase, index));
             tcg_out32(s, STWBRX | SAB(datahi, rbase, TCG_REG_R0));
         } else if (rbase != 0) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, STWX | SAB(datahi, rbase, addrlo));
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, index, 4));
+            tcg_out32(s, STWX | SAB(datahi, rbase, index));
             tcg_out32(s, STWX | SAB(datalo, rbase, TCG_REG_R0));
         } else {
-            tcg_out32(s, STW | TAI(datahi, addrlo, 0));
-            tcg_out32(s, STW | TAI(datalo, addrlo, 4));
+            tcg_out32(s, STW | TAI(datahi, index, 0));
+            tcg_out32(s, STW | TAI(datalo, index, 4));
         }
     } else {
         uint32_t insn = qemu_stx_opc[opc & (MO_BSWAP | MO_SIZE)];
         if (!have_isa_2_06 && insn == STDBRX) {
-            tcg_out32(s, STWBRX | SAB(datalo, rbase, addrlo));
-            tcg_out32(s, ADDI | TAI(TCG_REG_TMP1, addrlo, 4));
+            tcg_out32(s, STWBRX | SAB(datalo, rbase, index));
+            tcg_out32(s, ADDI | TAI(TCG_REG_TMP1, index, 4));
             tcg_out_shri64(s, TCG_REG_R0, datalo, 32);
             tcg_out32(s, STWBRX | SAB(TCG_REG_R0, rbase, TCG_REG_TMP1));
         } else {
-            tcg_out32(s, insn | SAB(datalo, rbase, addrlo));
+            tcg_out32(s, insn | SAB(datalo, rbase, index));
         }
     }
 
 #ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, false, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, data_type, oi, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #endif
 }
 
@@ -2972,16 +2956,46 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, false);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_ld(s, args[0], -1, args[1], args[2],
+                            args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, true);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, args[0], args[1], args[2], -1,
+                            args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_ld(s, args[0], args[1], args[2], args[3],
+                            args[4], TCG_TYPE_I64);
+        }
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, false);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_st(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_st(s, args[0], -1, args[1], args[2],
+                            args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, true);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_st(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, args[0], args[1], args[2], -1,
+                            args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_st(s, args[0], args[1], args[2], args[3],
+                            args[4], TCG_TYPE_I64);
+        }
         break;
 
     case INDEX_op_setcond_i32:
-- 
2.34.1


