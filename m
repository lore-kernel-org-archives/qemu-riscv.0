Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYa-0007ij-PV
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYZ-0007gq-9d
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:59 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYB-0005Zk-7X
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:59 -0400
Received: by mail-pl1-x633.google.com with SMTP id bg9so507853plb.2
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gpvk0vsaxCF51jInYoDBgD+gUZ6vD6omZfVFJBugzXU=;
 b=vAT9yUpLF0VuSKLFRmAGNRdlQdhsMd8MZvpbMRMdsbUtuUfbFVy+Tc3LHOLh8gbQRB
 XQ/cBkaB+RVXrKkvfKT6Oe37Eqik3nG/beSOrm6UyXIUi9d1hs/Ueg0Co+Dj++D6/emL
 LNRKW6w3n8BTRhvMoNpwPylEYxZE7jJ7PUGipy+Gp/h05MOoRSZBpNENgrC8iclEzNSb
 c5KXiXDa7Xg2SBMJ1VKk6wOiRdhrGCf888K1IrN46jqgeibgJ64tjMhlGQ8Jx6+BOtYw
 ILM5d+GwIDEnfJkQBkN7D3NDf7gblZEEX6b4+wv/31CCtqULDZQ7zA4R+6+DSuC6HnQD
 NRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gpvk0vsaxCF51jInYoDBgD+gUZ6vD6omZfVFJBugzXU=;
 b=3JuSrKca+5Rm6N1jy1felA87lZPAqvuizvHH6Gir72onhnx3+kLcNXtRp/8YxfjT02
 hyMZPiKF7F6Cl7mUq3XTfuzOoYX5+xzUzqtjvTB/0mNrZcFeR+t1drea/a0Q9ZeQ/JKW
 b06F3SA3vMttF+nCgQZFxqaORs78dpqtp/M4DfNCG+jcA4Vs8A9qjoRiDIZp6qXe7pbN
 XIMs/1v6BbBC5uuROPuHTZS5vZeLdJfv5IC5sVNSfcoIaXDIknOmkBBrzaSSJ5CIhWrl
 nR1q+2ED4eoPArfm+RVVl1ajXOKLc6DWmXEGVnBlZZQrIiOCkwYaWIX7c9qOP8NcwZSA
 qTxQ==
X-Gm-Message-State: AAQBX9c6e9VKxPyZTkmpKImrOlcCI/g70/2fdeN0C63XYjfiDNkP9St4
 MbdjmQL1AV54KymW7tEJHiIHXA==
X-Google-Smtp-Source: AKy350bCxREkNLWznR7V+ExF9nEYZovy/ZXCNzcPAgFBkE/6b+Lmr/lP6HgYv7QnMayRgSH8kGZGbw==
X-Received: by 2002:a17:902:e0d4:b0:1a1:d655:1ce4 with SMTP id
 e20-20020a170902e0d400b001a1d6551ce4mr3884467pla.38.1680921814194; 
 Fri, 07 Apr 2023 19:43:34 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 20/42] tcg/i386: Use TCGType not bool is_64 in
 tcg_out_qemu_{ld, st}
Date: Fri,  7 Apr 2023 19:42:52 -0700
Message-Id: <20230408024314.3357414-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:59 -0000

There are several places where we already convert back from
bool to type.  Clean things up by using type throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 54465c7f46..ff4062ef54 100644
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
@@ -2151,11 +2151,10 @@ static inline int setup_guest_base_seg(void)
 
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
@@ -2248,7 +2247,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
 /* XXX: qemu_ld and qemu_st could be modified to clobber only EDX and
    EAX. It will be useful once fixed registers globals are less
    common. */
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType d_type)
 {
     TCGReg datalo, datahi, addrlo;
     TCGReg addrhi __attribute__((unused));
@@ -2262,7 +2261,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 
     datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
+    datahi = TCG_TARGET_REG_BITS == 64 || d_type == TCG_TYPE_I32 ? 0 : *args++;
     addrlo = *args++;
     addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
     oi = *args++;
@@ -2275,10 +2274,10 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
                      label_ptr, offsetof(CPUTLBEntry, addr_read));
 
     /* TLB Hit.  */
-    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, is64, opc);
+    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, d_type, opc);
 
     /* Record the current context of a load into ldst label */
-    add_qemu_ldst_label(s, true, is64, oi, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, true, d_type, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
@@ -2288,7 +2287,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 
     tcg_out_qemu_ld_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg,
-                           is64, opc);
+                           d_type, opc);
 #endif
 }
 
@@ -2344,7 +2343,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType d_type)
 {
     TCGReg datalo, datahi, addrlo;
     TCGReg addrhi __attribute__((unused));
@@ -2358,7 +2357,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 
     datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
+    datahi = TCG_TARGET_REG_BITS == 64 || d_type == TCG_TYPE_I32 ? 0 : *args++;
     addrlo = *args++;
     addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
     oi = *args++;
@@ -2374,7 +2373,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     tcg_out_qemu_st_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, opc);
 
     /* Record the current context of a store into ldst label */
-    add_qemu_ldst_label(s, false, is64, oi, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, false, d_type, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
@@ -2672,17 +2671,17 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, 0);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, 1);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st8_i32:
-        tcg_out_qemu_st(s, args, 0);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, 1);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I64);
         break;
 
     OP_32_64(mulu2):
-- 
2.34.1


