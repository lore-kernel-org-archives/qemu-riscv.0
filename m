Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Wg-0005Dx-NU
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wa-0004OZ-6K
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:20 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WW-0001uB-9X
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:19 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 c10-20020a17090abf0a00b0023d1bbd9f9eso9348463pjs.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tPq4yFZLlxGIeUiLtMQcn+nY0HTY0k9Dwhcvb1OATj8=;
 b=zNtvf92qQszKWoz+XgaaNdUxQ3Sn3/lrm2wTV3wRGx/59e7ni5E2hpntRbhebNgaNf
 Dd4oEDlQK+glDm36lca0D5Wi8lv/f+akoRKE31Jhbg4JpRPVgSuzPGAuFR43JZ5v7eTn
 7jamgSwtN5rDWPwsrZhvNDdpy1i9BxIcWQKDl6xnGOu9jL248mb5yHzpL/Pc8h8E4mPs
 sh18TQXzP4zhighl8nWEyDjRigMlScPUnSQT2mKrzdFhvzZiq5FApC9OnjNAZOQhDYax
 66AXNAvzuTVG+PMfQ4iQSXX4OLfpmcMWmsHMGzyDr6+ppT+eJ/ElmUCqxJodAodu3OTp
 2L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPq4yFZLlxGIeUiLtMQcn+nY0HTY0k9Dwhcvb1OATj8=;
 b=uLvCsmvkGMnC8L+E5F1d0jPSxyp+uQqJroh1/gR+L05dgEQVRsaIwNJI8IdDeCgA/7
 UpRj6S6zDtgs+Gu7WHRjOIG4fBdgHXFPrSQ3TNBJbNpjB+eHoHM+nGWoeUlDdw8896e9
 jIdRlwuKEsyYnmIiuoNhcv+FTYOuOwn+hU3Y/u6mR12T33VtndrDqXFK+cXspMdrwxKh
 LMg2h2afDe2tTo3Lw1ch2CSgOcDfpvap4+FM6MYpMBaiO3ask76Sy8Al5WyQDlaZ9ucc
 lKNSORDISLCmGKDWjDwMgAKaR2XmmMmfELnCdV8a3sPh2+0X7uZp/2QUS8LCFBF9QL+p
 p3yg==
X-Gm-Message-State: AAQBX9d4DiZpSmEDvctW8tSPkAWPZdUkHmiie4M8TKn9H8VtawdXksnz
 gsv62o+Ks8vZjWmbri1dD8jJPw==
X-Google-Smtp-Source: AKy350Yly0b9t/AY8POseqzcZ/t0siYmoBaYo9SihJPaXfmMxeWvDiTpoDifHnDSVfAhQlUhyQEZ7Q==
X-Received: by 2002:a17:902:e5c9:b0:199:1996:71ec with SMTP id
 u9-20020a170902e5c900b00199199671ecmr17445116plf.16.1681175412478; 
 Mon, 10 Apr 2023 18:10:12 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 47/54] tcg/mips: Reorg tcg_out_tlb_load
Date: Mon, 10 Apr 2023 18:05:05 -0700
Message-Id: <20230411010512.5375-48-richard.henderson@linaro.org>
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
X-List-Received-Date: Tue, 11 Apr 2023 01:10:20 -0000

Compare the address vs the tlb entry with sign-extended values.
This simplifies the page+alignment mask constant, and the
generation of the last byte address for the misaligned test.

Move the tlb addend load up, and the zero-extension down.

This frees up a register, which allows us to drop the 'base'
parameter, with which the caller was giving us a 5th temporary.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 51 ++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index b6db8c6884..2a6376cd0a 100644
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
@@ -1125,12 +1127,12 @@ QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
 
 /*
  * Perform the tlb comparison operation.
- * The complete host address is placed in BASE.
  * Clobbers TMP0, TMP1, TMP2, TMP3.
+ * Returns the register containing the complete host address.
  */
-static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
-                             TCGReg addrh, MemOpIdx oi,
-                             tcg_insn_unit *label_ptr[2], bool is_load)
+static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addrl, TCGReg addrh,
+                               MemOpIdx oi, bool is_load,
+                               tcg_insn_unit *label_ptr[2])
 {
     MemOp opc = get_memop(oi);
     unsigned a_bits = get_alignment_bits(opc);
@@ -1144,7 +1146,6 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
     int add_off = offsetof(CPUTLBEntry, addend);
     int cmp_off = (is_load ? offsetof(CPUTLBEntry, addr_read)
                    : offsetof(CPUTLBEntry, addr_write));
-    target_ulong tlb_mask;
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_AREG0, mask_off);
@@ -1162,15 +1163,12 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
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
-        tcg_out_ext32u(s, base, addrl);
-        addrl = base;
+    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        /* Load the tlb addend for the fast path.  */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP3, TCG_TMP3, add_off);
     }
 
     /*
@@ -1178,18 +1176,18 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
      * For unaligned accesses, compare against the end of the access to
      * verify that it does not cross a page boundary.
      */
-    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, tlb_mask);
-    if (a_mask >= s_mask) {
-        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
-    } else {
-        tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP2, addrl, s_mask - a_mask);
+    tcg_out_movi(s, TCG_TYPE_TL, TCG_TMP1, TARGET_PAGE_MASK | a_mask);
+    if (a_mask < s_mask) {
+        tcg_out_opc_imm(s, ALIAS_TADDI, TCG_TMP2, addrl, s_mask - a_mask);
         tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, TCG_TMP2);
+    } else {
+        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
     }
 
-    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-        /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+    /* Zero extend a 32-bit guest address for a 64-bit host. */
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_TMP2, addrl);
+        addrl = TCG_TMP2;
     }
 
     label_ptr[0] = s->code_ptr;
@@ -1201,14 +1199,15 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
         tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
 
         /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP3, TCG_TMP3, add_off);
 
         label_ptr[1] = s->code_ptr;
         tcg_out_opc_br(s, OPC_BNE, addrh, TCG_TMP0);
     }
 
     /* delay slot */
-    tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_TMP2, addrl);
+    tcg_out_opc_reg(s, ALIAS_PADD, TCG_TMP3, TCG_TMP3, addrl);
+    return TCG_TMP3;
 }
 
 static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
@@ -1488,8 +1487,7 @@ static void tcg_out_qemu_ld(TCGContext *s,
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
 
-    base = TCG_REG_A0;
-    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 1);
+    base = tcg_out_tlb_load(s, addrlo, addrhi, oi, true, label_ptr);
     if (use_mips32r6_instructions || a_bits >= s_bits) {
         tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
     } else {
@@ -1610,8 +1608,7 @@ static void tcg_out_qemu_st(TCGContext *s,
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
 
-    base = TCG_REG_A0;
-    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 0);
+    base = tcg_out_tlb_load(s, addrlo, addrhi, oi, false, label_ptr);
     if (use_mips32r6_instructions || a_bits >= s_bits) {
         tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
     } else {
-- 
2.34.1


