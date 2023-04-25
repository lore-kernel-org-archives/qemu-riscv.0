Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOS7-0006BC-Rv
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORv-0005jy-MF
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:35:41 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORe-0005TP-28
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:35:38 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4ec81773cf7so6500394e87.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451319; x=1685043319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJE2oDaT5cp3o+g8E/nTmfAiwp2gC4b5DU7t513n6oA=;
 b=nEtG+TTlTB48f/Ku4NCQYtKMl9hMJW2oN9HGP3yQkmBO/Yw3BirZ1KqZW91X1wYYqT
 cCMjDlrydoFC1PUd1XHiNU8cntKzXBs1OF6LFj2ykTiuATZuWfjDHoj/ZRSzC9VKK/fk
 jBTxHiHf413uRCarHIM7yD6d3R4jQtsz0Pm0ut7OkPYTykpIWbAT0v/qwy2TMO7jbgFL
 qW4SzWMHOmKGWKKRucY0LJXyFFUY/bDRQVqhsNk9WPFsipDXcehtRz8ty75R7h7EVt3t
 t2p7a5MgIxyW0G31CVTn8wPT5+QDuUZKsrm9BpC/axHs00DOtgiMZPAha3bxKM06K/In
 jA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451319; x=1685043319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJE2oDaT5cp3o+g8E/nTmfAiwp2gC4b5DU7t513n6oA=;
 b=RfLc7RTvLJVlk+UGXgWJKCRvY6UqE4S538T5lR1tJ2c91lVZuGPk87lea+0N/us4I5
 pUL2mvn+wOS+A+ZSUrtqMN63NgekEo6NZmDZdOo8afHO+ygjmGH9EgeZChvS/kcx5Mws
 hLUgLS4lLfZjMYvytVo9yqMo3e34hPPeedZszyp0loa1llh/WFkUiRYje7C+Z0JaYbU1
 SDegUl+DHJXxRKTJOqtQTfKkmPQAe8w72dlyotuZqqxY3hiPPXH9pr05bHxURKSnBvIk
 yvjFxj3rR5trV9kzYaRFFaGM1WXwF07hUpzEiFRyhFRnnf+2VG9ZUl3a/K1hbQcIvZht
 ha4A==
X-Gm-Message-State: AAQBX9d6uJYdRIa/JwhgC1VYuWYQVDXGwD0sKUB2awtz7xWQ2kyJVyHD
 WtFpbPnqilhWnO59moKu1uVjHw==
X-Google-Smtp-Source: AKy350af3mTHLkD5FplXhP1K3VwfJKE/xCWAlkzToU09u+bbA0daoB9sKrtsH5L/g5j6OEWjBChd7Q==
X-Received: by 2002:a19:c510:0:b0:4eb:20e:6aec with SMTP id
 w16-20020a19c510000000b004eb020e6aecmr4878062lfe.40.1682451318844; 
 Tue, 25 Apr 2023 12:35:18 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:35:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 38/57] tcg/riscv: Support softmmu unaligned accesses
Date: Tue, 25 Apr 2023 20:31:27 +0100
Message-Id: <20230425193146.2106111-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12d.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:35:41 -0000

The system is required to emulate unaligned accesses, even if the
hardware does not support it.  The resulting trap may or may not
be more efficient than the qemu slow path.  There are linux kernel
patches in flight to allow userspace to query hardware support;
we can re-evaluate whether to enable this by default after that.

In the meantime, softmmu now matches useronly, where we already
assumed that unaligned accesses are supported.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 48 ++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 8522561a28..3e4c91cce7 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -924,12 +924,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
+    unsigned s_mask = (1u << s_bits) - 1;
     int mem_index = get_mmuidx(oi);
     int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
     int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
     int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
-    TCGReg mask_base = TCG_AREG0, table_base = TCG_AREG0;
-    tcg_target_long compare_mask;
+    int compare_mask;
+    TCGReg addr_adj;
 
     ldst = new_ldst_label(s);
     ldst->is_ld = is_ld;
@@ -938,14 +939,33 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, mask_base, mask_ofs);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, table_base, table_ofs);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_AREG0, mask_ofs);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, table_ofs);
 
     tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP2, addr_reg,
                     TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
     tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
     tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
 
+    /*
+     * For aligned accesses, we check the first byte and include the alignment
+     * bits within the address.  For unaligned access, we check that we don't
+     * cross pages using the address of the last byte of the access.
+     */
+    addr_adj = addr_reg;
+    if (a_bits < s_bits) {
+        addr_adj = TCG_REG_TMP0;
+        tcg_out_opc_imm(s, TARGET_LONG_BITS == 32 ? OPC_ADDIW : OPC_ADDI,
+                        addr_adj, addr_reg, s_mask - a_mask);
+    }
+    compare_mask = TARGET_PAGE_MASK | a_mask;
+    if (compare_mask == sextreg(compare_mask, 0, 12)) {
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_adj, compare_mask);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
+        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addr_adj);
+    }
+
     /* Load the tlb comparator and the addend.  */
     tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
                is_ld ? offsetof(CPUTLBEntry, addr_read)
@@ -953,29 +973,17 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
                offsetof(CPUTLBEntry, addend));
 
-    /* We don't support unaligned accesses. */
-    if (a_bits < s_bits) {
-        a_bits = s_bits;
-    }
-    /* Clear the non-page, non-alignment bits from the address.  */
-    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | a_mask;
-    if (compare_mask == sextreg(compare_mask, 0, 12)) {
-        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_reg, compare_mask);
-    } else {
-        tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
-        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addr_reg);
-    }
-
     /* Compare masked address with the TLB entry. */
     ldst->label_ptr[0] = s->code_ptr;
     tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
 
     /* TLB Hit - translate address using addend.  */
+    addr_adj = addr_reg;
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, addr_reg);
-        addr_reg = TCG_REG_TMP0;
+        addr_adj = TCG_REG_TMP0;
+        tcg_out_ext32u(s, addr_adj, addr_reg);
     }
-    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addr_reg);
+    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addr_adj);
     *pbase = TCG_REG_TMP0;
 #else
     if (a_mask) {
-- 
2.34.1


