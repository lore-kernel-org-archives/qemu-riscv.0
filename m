Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Ss-0005O5-4H
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sj-000503-KJ
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:21 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sg-0000oW-7v
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:20 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 c10-20020a17090abf0a00b0023d1bbd9f9eso9339404pjs.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K4Tl5/6sS6Ul06hRndVgbUtfNlW6vW4zDrAz6/Lvpe0=;
 b=A9nMV6rW+fR+PAgPDbhVu30JcOcF+Rx9IGZBdbDj6DUTyOOg0cit+PFXADLzyZ48YT
 va/qVe2j8YqAZdNo+0tnXzyPUZMsG2T+iHpYKSEwTXTgKLbJth+qqiDH09ttdNDJpb9p
 SFxrbQP5+LJpZVi9cPvGHM6IVc5HFajPS9nhD96oBQC+fxNwZQDYQi5LVDMRZPRpOZZu
 PAF3gw7WiihZUcUn3ixcm8aGMTCkA0HD5uqGbNeGl69SZp5iJVp9VgNQhd1do84VN6M4
 oTn9KBbVpHqfY0mw7DMSehb/tsmzTHUUYVoTE1XQUsNSXLvidcovZNDNH5oEk6ThDm90
 W79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K4Tl5/6sS6Ul06hRndVgbUtfNlW6vW4zDrAz6/Lvpe0=;
 b=kYso9DIRpblVS1JvJeEuc1NTd9k/nsMOTCC2jXxgwuN6Ep7Y+4dJHGN35MKCqnF7yu
 rtA1N2gZJSG2xkINWZk3viM2WnOX4R8FId4GNPiwZDEahscnLiWr6QO1+PGEGUetGTKS
 nRabEGhr7l5Xj9NrirmbGNEulHl2kbsbNeya0snxECP+tEF4XNs4SVzfPHCw1QUyDSmJ
 kbts71OO4em3e7ksCBwDTtA9PeUyyAhGFDxbjk1mnL4rtfFig8n3AwSgGrLGAJzzwwJa
 Z00JwLIq4cwcQjSgO0KEpiQkw5DiL1j5FUBbSi1uSOomVQbDVFjA/27YJz953OXJoHMx
 0lDw==
X-Gm-Message-State: AAQBX9fYC5/QFi6V4aqyuTicaRxM5WVHNDijmgJmOzq4ljJ1scWCMfac
 hylFjVpphaiyIjvybI2nrHQBZQ==
X-Google-Smtp-Source: AKy350bglOfITkmZbyLvQo9FamGbj97MTi4bcdnUnbQZns3IfEvkt8aYFLS/oadU6FEOtORpzAxFIQ==
X-Received: by 2002:a17:902:f213:b0:1a5:2592:89c6 with SMTP id
 m19-20020a170902f21300b001a5259289c6mr9213915plc.29.1681175177001; 
 Mon, 10 Apr 2023 18:06:17 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 20/54] tcg/i386: Rationalize args to tcg_out_qemu_{ld,st}
Date: Mon, 10 Apr 2023 18:04:38 -0700
Message-Id: <20230411010512.5375-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:06:23 -0000

Interpret the variable argument placement in the caller.
Mark the argument register const, because they must be passed to
add_qemu_ldst_label unmodified.

Pass data_type instead of is64 -- there are several places where
we already convert back from bool to type.  Clean things up by
using type throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 113 ++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 61 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 238a75b17e..2b2759d696 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1886,8 +1886,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
  * Record the context of a call to the out of line helper code for the slow path
  * for a load or store, so that we can later generate the correct helper code
  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
-                                MemOpIdx oi,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
+                                TCGType type, MemOpIdx oi,
                                 TCGReg datalo, TCGReg datahi,
                                 TCGReg addrlo, TCGReg addrhi,
                                 tcg_insn_unit *raddr,
@@ -1897,7 +1897,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
 
     label->is_ld = is_ld;
     label->oi = oi;
-    label->type = is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    label->type = type;
     label->datalo_reg = datalo;
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
@@ -2154,11 +2154,10 @@ static inline int setup_guest_base_seg(void)
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                    TCGReg base, int index, intptr_t ofs,
-                                   int seg, bool is64, MemOp memop)
+                                   int seg, TCGType type, MemOp memop)
 {
-    TCGType type = is64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
     bool use_movbe = false;
-    int rexw = is64 * P_REXW;
+    int rexw = (type == TCG_TYPE_I32 ? 0 : P_REXW);
     int movop = OPC_MOVL_GvEv;
 
     /* Do big-endian loads with movbe.  */
@@ -2248,50 +2247,35 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
     }
 }
 
-/* XXX: qemu_ld and qemu_st could be modified to clobber only EDX and
-   EAX. It will be useful once fixed registers globals are less
-   common. */
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_ld(TCGContext *s,
+                            const TCGReg datalo, const TCGReg datahi,
+                            const TCGReg addrlo, const TCGReg addrhi,
+                            const MemOpIdx oi, TCGType data_type)
 {
-    TCGReg datalo, datahi, addrlo;
-    TCGReg addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc;
+    MemOp opc = get_memop(oi);
+
 #if defined(CONFIG_SOFTMMU)
-    int mem_index;
     tcg_insn_unit *label_ptr[2];
-#else
-    unsigned a_bits;
-#endif
 
-    datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-
-#if defined(CONFIG_SOFTMMU)
-    mem_index = get_mmuidx(oi);
-
-    tcg_out_tlb_load(s, addrlo, addrhi, mem_index, opc,
+    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), opc,
                      label_ptr, offsetof(CPUTLBEntry, addr_read));
 
     /* TLB Hit.  */
-    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, is64, opc);
+    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1,
+                           -1, 0, 0, data_type, opc);
 
     /* Record the current context of a load into ldst label */
-    add_qemu_ldst_label(s, true, is64, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, data_type, oi, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
     }
 
     tcg_out_qemu_ld_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg,
-                           is64, opc);
+                           data_type, opc);
 #endif
 }
 
@@ -2347,40 +2331,27 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_st(TCGContext *s,
+                            const TCGReg datalo, const TCGReg datahi,
+                            const TCGReg addrlo, const TCGReg addrhi,
+                            const MemOpIdx oi, TCGType data_type)
 {
-    TCGReg datalo, datahi, addrlo;
-    TCGReg addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc;
+    MemOp opc = get_memop(oi);
+
 #if defined(CONFIG_SOFTMMU)
-    int mem_index;
     tcg_insn_unit *label_ptr[2];
-#else
-    unsigned a_bits;
-#endif
 
-    datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-
-#if defined(CONFIG_SOFTMMU)
-    mem_index = get_mmuidx(oi);
-
-    tcg_out_tlb_load(s, addrlo, addrhi, mem_index, opc,
+    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), opc,
                      label_ptr, offsetof(CPUTLBEntry, addr_write));
 
     /* TLB Hit.  */
     tcg_out_qemu_st_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, opc);
 
     /* Record the current context of a store into ldst label */
-    add_qemu_ldst_label(s, false, is64, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, data_type, oi, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
     }
@@ -2675,17 +2646,37 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, 0);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_ld(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, 1);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, a0, a1, a2, -1, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_ld(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st8_i32:
-        tcg_out_qemu_st(s, args, 0);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_st(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, 1);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, a0, a1, a2, -1, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
 
     OP_32_64(mulu2):
-- 
2.34.1


