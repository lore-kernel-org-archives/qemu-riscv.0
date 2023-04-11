Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Wu-0006Hx-4v
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wl-0005hg-5n
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:31 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wf-0001wH-Ch
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:30 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso293440pjc.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQBNu8V+ZGC47olucQpF77r7JB5TGZB02URjduX3yP4=;
 b=SMrNm8TCmw6Fkrh+IvWmqANJfS9+PbjJ0Czx65AEZSAqu6BUcFtO9BKIdKbkZ5LoCk
 JCV/NNSgzE3XggjAwABhJDEObMzHzgqmUn02wARmVVNS6HZzI6CRlRLAi+91HwiBxK7w
 Z1N48ft/61aaBUuBBKMbKuRYw9ML1TFIqQf3K8GbMUZStpzHpo0hum6TeM4VH9mR7fE6
 ljLfDXEk8RejOZCiz+QBPJwEEojOk8BA7Q7WQw7Ob/U+ZK7vgE95ITWJNFpPD27GXayT
 UOoLkHQNB6YQa6fKyDtwHyBxQX39ytvAB/znULY6d6wCXzt4lBLzqBSvo5KR+s+EW0ib
 HbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQBNu8V+ZGC47olucQpF77r7JB5TGZB02URjduX3yP4=;
 b=TV8glTKCKrXY/PrLyIPofHDRcUbTzoPUK8v4ZObo7l/ftTEu/2teA+Doj8v8Pttkuq
 8UNCM6uBSd7NhXQYoiKX8WQglcV3NMHUo5E9yyi7YPc2OZmRQtDnVKuQZBK+ZRZTItK0
 4gpJu/hBiQzHpNFMd4UKQlfv0/9ljRfFRpDs64albTYG3wXfzRvtwntapIzpFKDzPY2t
 lLzH/M53TYHUPckP7tBIPDJaRWNIAMRihomIRcp1Tih5sF+NuWXijhr3+xYg2CDJEf17
 ZevmaG+StkI5W+vvjgpI8AymiJV5zFSW9oqJxsE1WON8D6ewT0A+EZhl7kkWTNyUnSMl
 NTtw==
X-Gm-Message-State: AAQBX9eSpspE6oXviO+hyF0FZ9eNou9+3EoQO1Ia+Wngxr6TDNoDB6gP
 JRRxWJ8R/KZ/LqtSKKXWhd1FJ96VxSDrbOrvb7/uGQ==
X-Google-Smtp-Source: AKy350ZwOCa2OljDm/D7Md0bhXDbPBzA4/T3DpNBTlLSIRHIUFeiz5lWfLe96TQLdXyM7sr4yPwKug==
X-Received: by 2002:a17:902:a701:b0:1a1:f5dd:2dd5 with SMTP id
 w1-20020a170902a70100b001a1f5dd2dd5mr974710plq.13.1681175424411; 
 Mon, 10 Apr 2023 18:10:24 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 53/54] tcg/s390x: Use ALGFR in constructing host address
 for qemu_ld/st
Date: Mon, 10 Apr 2023 18:05:11 -0700
Message-Id: <20230411010512.5375-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:10:31 -0000

Rather than zero-extend the guest address into a register,
use an add instruction which zero-extends the second input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 6d7b056931..42d3e13e08 100644
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
@@ -1892,16 +1890,20 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
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
     add_qemu_ldst_label(s, 1, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
@@ -1924,16 +1926,20 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
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
     add_qemu_ldst_label(s, 0, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
-- 
2.34.1


