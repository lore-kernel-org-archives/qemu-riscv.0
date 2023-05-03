Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6VA-0008NZ-Vl
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UK-0006AZ-FF
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:01:21 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6U7-0003BL-Oi
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:01:20 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso28979925e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097266; x=1685689266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64H1HdxJ2Vo9fMDDBGxTfjpGZYN3L1dEu1eUYP7zZpo=;
 b=Gun8De6tjCsOdoMS7ILKRBuLBuMit7T/elRJ84rU8ameniTrefVr+4CG8l2acaSYhz
 g8dMpXfCn0zGkGsf6HtJtDEcI6AGBFmPh6yRecFWeYmlGeTob8WiOGzXO0VDcjDCB+XW
 xwU4wvl3PDf65+jpF5+DhXclE7k7Y4ppJF+FX8lamkEErdNjVelKEegvaQ586gSrZWQc
 /nvCEZjnl0uXjO5NBIhU2Am/ylH2yDKZEp617sSswbG+lveTbK39N5HgQEA0W5Ples5t
 OvuZl5y5A6M03h4gKfOGXQUdc5ZW4xflP4UKUPzROiflvyTC/oqZjXJzTa1s7rcuS1BI
 YReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097266; x=1685689266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64H1HdxJ2Vo9fMDDBGxTfjpGZYN3L1dEu1eUYP7zZpo=;
 b=HaEhBu1vDji1Lt/Xzxzmw465EXOfQR3Loq4LFWCWvNGPJ5SZ1HGPJG667bGQUCrYJ/
 0ZEOclZViMdNVf1FvXgoGjqehmcWe/H+1meMFuCXZo8aSbd+Kgqk+Sbh7uTscbZIoI82
 Mc6jigJ+dAl2KHYHhB7KDjCqpiroVNmtJL7NE90Uwu8ijFUjv6mbvca9LzTEEYRMMANT
 diqp/wXKIAX4Nko8egJzueAy3zkf2CXGaZDH12P/jVuWML/NEFKr02v/r/xWQJKru5ZZ
 oaqwvaUtlolsikJy1B3/VoLNHjpDmiQdVdydOCaHHS9FMQaJSStxj+owE8Aqm6LQV16a
 IRpQ==
X-Gm-Message-State: AC+VfDyRCTbJ6TcuBsFckWf3CSs4X01vnxBFCoQqG8MFNBwkmBREFn2W
 4J5mK1vi9PCztIINbKrQwbIvtSdZObWmxqyE/xFdSw==
X-Google-Smtp-Source: ACHHUZ6D21QxWbfJFPI6PMDNHSbAkd22/oJ4gd+DiEdWwRI398wT9vknlAH1n0iikUBjDfobJfdPrg==
X-Received: by 2002:a1c:f717:0:b0:3f1:9acf:8670 with SMTP id
 v23-20020a1cf717000000b003f19acf8670mr14658928wmh.22.1683097265939; 
 Wed, 03 May 2023 00:01:05 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 46/54] tcg/mips: Reorg tlb load within prepare_host_addr
Date: Wed,  3 May 2023 07:57:21 +0100
Message-Id: <20230503065729.1745843-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:01:24 -0000

Compare the address vs the tlb entry with sign-extended values.
This simplifies the page+alignment mask constant, and the
generation of the last byte address for the misaligned test.

Move the tlb addend load up, and the zero-extension down.

This frees up a register, which allows us use TMP3 as the returned base
address register instead of A0, which we were using as a 5th temporary.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 31d58e1977..695c137023 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -370,6 +370,8 @@ typedef enum {
     ALIAS_PADDI    = sizeof(void *) == 4 ? OPC_ADDIU : OPC_DADDIU,
     ALIAS_TSRL     = TARGET_LONG_BITS == 32 || TCG_TARGET_REG_BITS == 32
                      ? OPC_SRL : OPC_DSRL,
+    ALIAS_TADDI    = TARGET_LONG_BITS == 32 || TCG_TARGET_REG_BITS == 32
+                     ? OPC_ADDIU : OPC_DADDIU,
 } MIPSInsn;
 
 /*
@@ -1263,14 +1265,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int add_off = offsetof(CPUTLBEntry, addend);
     int cmp_off = is_ld ? offsetof(CPUTLBEntry, addr_read)
                         : offsetof(CPUTLBEntry, addr_write);
-    target_ulong tlb_mask;
 
     ldst = new_ldst_label(s);
     ldst->is_ld = is_ld;
     ldst->oi = oi;
     ldst->addrlo_reg = addrlo;
     ldst->addrhi_reg = addrhi;
-    base = TCG_REG_A0;
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
@@ -1290,15 +1290,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
         tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
     } else {
-        tcg_out_ldst(s, (TARGET_LONG_BITS == 64 ? OPC_LD
-                         : TCG_TARGET_REG_BITS == 64 ? OPC_LWU : OPC_LW),
-                     TCG_TMP0, TCG_TMP3, cmp_off);
+        tcg_out_ld(s, TCG_TYPE_TL, TCG_TMP0, TCG_TMP3, cmp_off);
     }
 
-    /* Zero extend a 32-bit guest address for a 64-bit host. */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addrlo);
-        addrlo = base;
+    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        /* Load the tlb addend for the fast path.  */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP3, TCG_TMP3, add_off);
     }
 
     /*
@@ -1306,18 +1303,18 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * For unaligned accesses, compare against the end of the access to
      * verify that it does not cross a page boundary.
      */
-    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, tlb_mask);
-    if (a_mask >= s_mask) {
-        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrlo);
-    } else {
-        tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP2, addrlo, s_mask - a_mask);
+    tcg_out_movi(s, TCG_TYPE_TL, TCG_TMP1, TARGET_PAGE_MASK | a_mask);
+    if (a_mask < s_mask) {
+        tcg_out_opc_imm(s, ALIAS_TADDI, TCG_TMP2, addrlo, s_mask - a_mask);
         tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, TCG_TMP2);
+    } else {
+        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrlo);
     }
 
-    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-        /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+    /* Zero extend a 32-bit guest address for a 64-bit host. */
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_TMP2, addrlo);
+        addrlo = TCG_TMP2;
     }
 
     ldst->label_ptr[0] = s->code_ptr;
@@ -1329,14 +1326,15 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
 
         /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP3, TCG_TMP3, add_off);
 
         ldst->label_ptr[1] = s->code_ptr;
         tcg_out_opc_br(s, OPC_BNE, addrhi, TCG_TMP0);
     }
 
     /* delay slot */
-    tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_TMP2, addrlo);
+    base = TCG_TMP3;
+    tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_TMP3, addrlo);
 #else
     if (a_mask && (use_mips32r6_instructions || a_bits != s_bits)) {
         ldst = new_ldst_label(s);
-- 
2.34.1


