Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqoyh-00077y-KB
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxF-0005R5-Aj
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:38 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowt-0004IB-VK
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:36 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f86ee42669so3816615f8f.2
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314873; x=1684906873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8x8nNgwxVzWwlXkH7TC04g8D23cjiNxwy3VmZPjq5To=;
 b=cB+RHpr/LDyxIxMlu0TXtnZkfa5eXUHILYMzOPwSYUdcr8pRs/iOvdTrW8F+AiYtX5
 ZRraEFd9voWPzLtRjoR0uDv+sNzg6VIRZDv2DVAAHmx96yuy63+PVAuFRomu+mCfIC1+
 QDowVhC/cEYGg/e73ZyUe6c6UO22W5F2INWe7rNrL42a8jkVAtgF5vK26NUvEucbgHiN
 wV4TVDUQ5DhpX/L8rPPZdiMAKiB9lExSd0J5w8YfRQXt0Xzuk/u/sy22NpO9QVzQYxHL
 17UQ41j8ezSVMIrRkN4cc9P0qHd+VwY17DJyPs4Lux6j9ePcJEsx8wdZ+U8H0BMHwCQS
 3rrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314873; x=1684906873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8x8nNgwxVzWwlXkH7TC04g8D23cjiNxwy3VmZPjq5To=;
 b=f1L3JF59V1KhC25pI9K8cyhLMHETUtFF2hw/ajYuBlY6K0oxkyIfP1UNjZ8v25xs6A
 ostnXo9jNhCRSi4ZCykT2Zi4Lc4RFbe/iYzrkMKn0nkaOz5OfsCoxWsHq/M245kYG0lu
 N2FC62YUqBX50c/pzbFaDAb9c6izPL5rS/gPVNBcKMbqVS7xyFkvHSn2EBPe+H61nU3g
 /u4cxi1T9EtxGWpWf7tb6dcGfEywMmWtl2VTwzXqCLxr++bnE/qTR6oahy9YqXWZfow5
 G2pyaTeJMY20PW6F25DnBrmNsUqjmYPNtQT9FpwcCOAY0iWg6I/H7TgGh/FkWfUNf8Aw
 N38A==
X-Gm-Message-State: AAQBX9fZsnotrCF1XZPFYiN4WcNg/sFd6BPGmrZSeWtX55KW69GlLUEu
 TuMO/3/FirlzOY9ZABVQd7E9EA==
X-Google-Smtp-Source: AKy350Y5kdkvW9AwvK08S+ZJ/REPv9cBaJSsEE/ZMbOgPQEjf9A2Yh6+UVKAioKughLT7WGmwc9Ucg==
X-Received: by 2002:adf:f68b:0:b0:2ce:a34b:2b0b with SMTP id
 v11-20020adff68b000000b002cea34b2b0bmr8473202wrp.28.1682314873260; 
 Sun, 23 Apr 2023 22:41:13 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/57] tcg/aarch64: Rationalize args to tcg_out_qemu_{ld,
 st}
Date: Mon, 24 Apr 2023 06:40:20 +0100
Message-Id: <20230424054105.1579315-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 05:41:38 -0000

Rename the 'ext' parameter 'data_type' to make the use clearer;
pass it to tcg_out_qemu_st as well to even out the interfaces.
Rename the 'otype' local 'addr_type' to make the use clearer.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 4ec3cf3172..ecbf6564fc 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1851,22 +1851,21 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
 }
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi, TCGType ext)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
-    const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
 
 #ifdef CONFIG_SOFTMMU
-    unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
 
-    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 1);
-    tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
-                           TCG_REG_X1, otype, addr_reg);
-    add_qemu_ldst_label(s, true, oi, ext, data_reg, addr_reg,
+    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 1);
+    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
+                           TCG_REG_X1, addr_type, addr_reg);
+    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(memop);
@@ -1874,33 +1873,32 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
     if (USE_GUEST_BASE) {
-        tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
-                               TCG_REG_GUEST_BASE, otype, addr_reg);
+        tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
+                               TCG_REG_GUEST_BASE, addr_type, addr_reg);
     } else {
-        tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
+        tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
                                addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
     }
 #endif /* CONFIG_SOFTMMU */
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
-    const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
 
 #ifdef CONFIG_SOFTMMU
-    unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
 
-    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 0);
+    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 0);
     tcg_out_qemu_st_direct(s, memop, data_reg,
-                           TCG_REG_X1, otype, addr_reg);
-    add_qemu_ldst_label(s, false, oi, (memop & MO_SIZE)== MO_64,
-                        data_reg, addr_reg, s->code_ptr, label_ptr);
+                           TCG_REG_X1, addr_type, addr_reg);
+    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(memop);
     if (a_bits) {
@@ -1908,7 +1906,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     }
     if (USE_GUEST_BASE) {
         tcg_out_qemu_st_direct(s, memop, data_reg,
-                               TCG_REG_GUEST_BASE, otype, addr_reg);
+                               TCG_REG_GUEST_BASE, addr_type, addr_reg);
     } else {
         tcg_out_qemu_st_direct(s, memop, data_reg,
                                addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
@@ -2249,7 +2247,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, REG0(0), a1, a2);
+        tcg_out_qemu_st(s, REG0(0), a1, a2, ext);
         break;
 
     case INDEX_op_bswap64_i64:
-- 
2.34.1


