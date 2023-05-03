Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6bc-0003qe-Oo
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ar-0008RQ-9x
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:08:06 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aG-0005qu-Fu
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:08:04 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so30036565e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097646; x=1685689646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hwPT0K7vPN2gwriWFptyrPUN/cJGPYaIAkx6d9u1m44=;
 b=CC6VwXXfMkXSLW1Nj9lbrxfMpMDuU/+/ETS2oHEIbOTv/6tnR1jrCnn1ciIrqiBofB
 a2dtyrP19nWBU//i+B/M4iaQ3YjWajafl70gclE81nsjsE0bi4kk2KKJLew5oQRUCEZF
 6N74gwe4zzbnH8K0Tj8acTyGaLyZRyYIYhBShB/+sHYnw3CP+CSkRaD6cTJc80ARxHPa
 xQ5uX1nRnniIJAjCHOsWM95kLBcO9GsxNsu6JFZLjIq2Lz953pNlU2Yw2p0bQh1PcqLR
 6QzOeAJj3b0MKGc+LMQigEN+Ug2trksGUZR8oI73tiN7D5U7BA7YX4wRoLiMg/vQol+q
 CC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097646; x=1685689646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hwPT0K7vPN2gwriWFptyrPUN/cJGPYaIAkx6d9u1m44=;
 b=CmO2nV3AIgCUtIjYpA1kuEAr3nwFyT2mjCsSUnYVXiwjNkpSobWZwtwqCMlsQYDse/
 6okiIvOkqWZ9vFS/qjkbcSkE918mmJbXCDSVQutJcCCS9mPpV1VeZIe1lYfSC6YUcjDv
 1IogYHTWkEEvts6p++t6rlwq7wRWIMag2ObD8vaeshE7UfeCzVNId/1XEs/1g5kWqz3u
 HcQcyc5Tl8pKDy11rdzTg5eB5LUIcdaoH15dp9ndPX8kKy1y4SX8XQxyML25pM2geH4P
 nc6J6P6siLQ8Nfx1bBa9JdYNodz7sXTDo6IVPfhNTaXKOPFWCZEJP70K/CF3vvxz+Uk5
 XrbA==
X-Gm-Message-State: AC+VfDwT2s4fhNiVbM3IRLpxQ/FrD6e3UlzExnwbWrzPukx9VPl3RJlo
 IYygMlWrDlCTZgNRuwEdARwULw==
X-Google-Smtp-Source: ACHHUZ5aLEY+/s4Qb3oOHAoYlBS+sBLsE3i/XCskQJCKbJzH3xw3Gfzs67bPDbHZRHA+6Cv8MMF8mQ==
X-Received: by 2002:a1c:f20b:0:b0:3f3:1299:5625 with SMTP id
 s11-20020a1cf20b000000b003f312995625mr13780006wmc.30.1683097646133; 
 Wed, 03 May 2023 00:07:26 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 38/57] tcg/riscv: Support softmmu unaligned accesses
Date: Wed,  3 May 2023 08:06:37 +0100
Message-Id: <20230503070656.1746170-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:08:10 -0000

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
index 19cd4507fb..415e6c6e15 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -910,12 +910,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 
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
@@ -924,14 +925,33 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 
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
@@ -939,29 +959,17 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
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


