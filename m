Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Su-0005Vt-PK
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sm-00052H-96
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:25 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sj-0000as-0u
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:23 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 y11-20020a17090a600b00b0024693e96b58so5214831pji.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FiOY1i4B1cEP4NOTlXXKaOmijImJBQ0KrqKCcc9XMSM=;
 b=N/LHwF/1PDgSMLYBwLwUTAxJUsY6MHIfiPWRdPPSY12mvP2z/yGDtXEQ/H0jVUFVCd
 HG7HCCtVdW9Zh2KhDR0J5bjLimvc+CnQxXh8KvgvziD2kuo7MGT4X8TCn/35t3e7lZ4y
 pXAfhXk3Pkbqn6woOGwKeF00Xk8GkftZmIfUgTQ530MhxQgjyjb2HviuaZjK20F+uR21
 AiYwYaGtZxuj5wY3Uvjjsc49Qk6+Vq6FZfyeAf836ph4pTqalPzATWijtQeYw/xjBQUe
 5BciEISPbvx0DfwAxZUBvHggT39dC+hbPvNipgkm7oOk+PxmL5o9XhR/ZnPfZBcDrZiM
 S92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FiOY1i4B1cEP4NOTlXXKaOmijImJBQ0KrqKCcc9XMSM=;
 b=IgwRZXfU6yNmOuzqxs8DJ/18lbvbEVglXMoBvHeBFxlIYLYGspKlRaYy9X0DiSDUYG
 pyNgrD2Ec6VgVecB3tvTx/4PdOEKtdOVXIQ581WGTa2Zwau57vWYM/UYpeXmplYHYv2s
 Kz36VylC9wgI0/E1rTzRgQGx/oSraPWM2ogH0bT2/CA1Y5HuAoGXh3XCny7FqqzmXgTQ
 LdgqpvQJ3ermEhCuRBHyE9KBrw91M6nAQ1vnZu7JHdW2ACCRm+7KX5EHZXqs7LlYjuPd
 cyNsB5K/1r7wZM+X0dT7KUwet+JNUPcnSGKpv5DRKwf1gZ6A81XgpnyIb1Au+q0Q2fBE
 VNxQ==
X-Gm-Message-State: AAQBX9cBQnpvBWvm6R0jhXHLA5OF4gPQKoCc1RnvtBIKB/Iklx2KCfhw
 Tdh9M2BSl7rVPaXoU1hmijmBWQ==
X-Google-Smtp-Source: AKy350YLhj1Ni21mXYj3u0bcWqhwUnVzSWX3SIubuXRK1WimBE7kWpQM3GEqN2znfQyu01vJbuzFPQ==
X-Received: by 2002:a17:902:e549:b0:1a5:2809:97f3 with SMTP id
 n9-20020a170902e54900b001a5280997f3mr10278315plf.14.1681175179540; 
 Mon, 10 Apr 2023 18:06:19 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 21/54] tcg/aarch64: Rationalize args to tcg_out_qemu_{ld,
 st}
Date: Mon, 10 Apr 2023 18:04:39 -0700
Message-Id: <20230411010512.5375-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:06:26 -0000

Mark the argument registers const, because they must be passed to
add_qemu_ldst_label unmodified.  Rename the 'ext' parameter 'data_type' to
make the use clearer; pass it to tcg_out_qemu_st as well to even out the
interfaces.  Rename the 'otype' local 'addr_type' to make the use clearer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 42 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 4ec3cf3172..251464ae6f 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1850,23 +1850,23 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi, TCGType ext)
+static void tcg_out_qemu_ld(TCGContext *s, const TCGReg data_reg,
+                            const TCGReg addr_reg, const MemOpIdx oi,
+                            TCGType data_type)
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
@@ -1874,33 +1874,33 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
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
 
-static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi)
+static void tcg_out_qemu_st(TCGContext *s, const TCGReg data_reg,
+                            const TCGReg addr_reg, const MemOpIdx oi,
+                            TCGType data_type)
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
@@ -1908,7 +1908,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     }
     if (USE_GUEST_BASE) {
         tcg_out_qemu_st_direct(s, memop, data_reg,
-                               TCG_REG_GUEST_BASE, otype, addr_reg);
+                               TCG_REG_GUEST_BASE, addr_type, addr_reg);
     } else {
         tcg_out_qemu_st_direct(s, memop, data_reg,
                                addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
@@ -2249,7 +2249,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, REG0(0), a1, a2);
+        tcg_out_qemu_st(s, REG0(0), a1, a2, ext);
         break;
 
     case INDEX_op_bswap64_i64:
-- 
2.34.1


