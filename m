Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkybR-0003CR-Q4
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybP-0002zl-1a
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:46:55 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybM-0007ma-W3
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:46:54 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 r13-20020a17090a940d00b0023f07253a2cso176637pjo.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680922011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3GgpyquLQob+XRXyWgnv31s/PrsIm2aDbl8H8cAcdI=;
 b=l63T0M/V0iYGfYGWtNcXzE4Gt1VySSif84TJXZrITNNiJd49pcV85U/uX6922iUN4M
 UkFVfZhx9NZrohCaUZERwV3RS7A8ELtiPWt8TuSg1/JxnCIcs3dXzlpg1vQxR1A0cY3O
 MEHvia/+AMIRsE3NCQp2F/6YAXQA92LEVXIIAAA+QvnFa1nOlguuZYagIJF2UEb2ElK/
 BO3uiV0KDg79C8vS+OHABK7G9NjlMVuviqbOV1FcMIOG+OY0kItBs2A1l5Mo3JrCkTyc
 9rvuM/is0LPtqE95FzfUlzpPN2In8XjHpbt4PgznB698mN1hpv8SHLOn+pfZkbJcrtc3
 lYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680922011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3GgpyquLQob+XRXyWgnv31s/PrsIm2aDbl8H8cAcdI=;
 b=jWNS9qUkti1Z9Q50UcsFvV3YAcqVvp3kNoriit0HPlgIpwBfYwbc2CV/UeNSOIyPcK
 sgxNnggTKuRdE6YT+sZpFznDy52ZtKMjdZ6z+CpaElM0DduTmb8c573L5kC81KEeKWPE
 sfxmzaO9UFjTFyTNw+U+l/h8+Uha3+YfS4/G3AUHz/oURdXDHABKRvuZvaslsTM5sU65
 rHfpr605rBQVTZa00c11W1yxo4HW7Rf75WTJaIjHxdvFlkU29+fB5tETmDSLj/gBmgJq
 0vqOZaydBLLsZc9pCkBhfVwzGjOarVVowg43C7Mj4+28BaF/xGPUAsuSva3s5CjBZbXx
 SxGQ==
X-Gm-Message-State: AAQBX9cGm00M34zHDW7Vkog/kCu/Vql3k7KaIeDCYG/GcN7QTz46pV+W
 QrIoscTEWrUFZPpT1wfELKsMkw==
X-Google-Smtp-Source: AKy350YDKKgt8izzlMeQ/HgUizkAM5xC4rBi5aZ+ZFsb/X4WNTIurMkClVGfBEW67Ly1wEPHbGJwsQ==
X-Received: by 2002:a17:902:e0d4:b0:1a1:d655:1ce4 with SMTP id
 e20-20020a170902e0d400b001a1d6551ce4mr3891401pla.38.1680922011406; 
 Fri, 07 Apr 2023 19:46:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a170902761000b0019aa8149cc9sm3551981pll.35.2023.04.07.19.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:46:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 39/42] tcg/s390x: Use ALGFR in constructing host address for
 qemu_ld/st
Date: Fri,  7 Apr 2023 19:43:11 -0700
Message-Id: <20230408024314.3357414-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:46:56 -0000

Rather than zero-extend the guest address into a register,
use an add instruction which zero-extends the second input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 7d6cb30a06..b53eb70f24 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -149,6 +149,7 @@ typedef enum S390Opcode {
     RRE_ALGR    = 0xb90a,
     RRE_ALCR    = 0xb998,
     RRE_ALCGR   = 0xb988,
+    RRE_ALGFR   = 0xb91a,
     RRE_CGR     = 0xb920,
     RRE_CLGR    = 0xb921,
     RRE_DLGR    = 0xb987,
@@ -1716,8 +1717,10 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 19));
 
-/* Load and compare a TLB entry, leaving the flags set.  Loads the TLB
-   addend into R2.  Returns a register with the santitized guest address.  */
+/*
+ * Load and compare a TLB entry, leaving the flags set.
+ * Loads the TLB addend and returns the register.
+ */
 static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
                                int mem_index, bool is_ld)
 {
@@ -1761,12 +1764,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
 
     tcg_out_insn(s, RXY, LG, TCG_REG_R2, TCG_REG_R2, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
-
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
-        return TCG_REG_R3;
-    }
-    return addr_reg;
+    return TCG_REG_R2;
 }
 
 static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
@@ -1888,16 +1886,20 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
-    TCGReg base_reg;
+    TCGReg addend;
 
-    base_reg = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
+    addend = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
 
     tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
     label_ptr = s->code_ptr;
     s->code_ptr += 1;
 
-    tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
-
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_insn(s, RRE, ALGFR, addend, addr_reg);
+        tcg_out_qemu_ld_direct(s, opc, data_reg, addend, TCG_REG_NONE, 0);
+    } else {
+        tcg_out_qemu_ld_direct(s, opc, data_reg, addend, addr_reg, 0);
+    }
     add_qemu_ldst_label(s, 1, oi, d_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
@@ -1920,16 +1922,20 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
-    TCGReg base_reg;
+    TCGReg addend;
 
-    base_reg = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
+    addend = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
 
     tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
     label_ptr = s->code_ptr;
     s->code_ptr += 1;
 
-    tcg_out_qemu_st_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
-
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_insn(s, RRE, ALGFR, addend, addr_reg);
+        tcg_out_qemu_st_direct(s, opc, data_reg, addend, TCG_REG_NONE, 0);
+    } else {
+        tcg_out_qemu_st_direct(s, opc, data_reg, addend, addr_reg, 0);
+    }
     add_qemu_ldst_label(s, 0, oi, d_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
-- 
2.34.1


