Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvCGR-0005Py-8j
	for mharc-qemu-riscv@gnu.org; Sat, 06 May 2023 03:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGO-0005L0-L4
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:28 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFq-0004Tm-UR
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:28 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3063b5f32aaso1724112f8f.2
 for <qemu-riscv@nongnu.org>; Sat, 06 May 2023 00:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357773; x=1685949773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64H1HdxJ2Vo9fMDDBGxTfjpGZYN3L1dEu1eUYP7zZpo=;
 b=ky2YCrj7nprVSv+K8+hY7vYElXahHAbysB5tyFC89LHGUxORGeWj+oLX8m9pzG6kS5
 m6pGvcdZjKKtCZ6YjOVS83sAbUf4eXoeFNHbnLsLs/qfb6gpP7Ag4e+yC4ZxchR5V1lI
 D97gm72qSPsgcss/pA/gp9GWJHnJaO1v7E9aKTl/LNBHj6FrbLg++1ZNviZXRt5Bm4Xb
 Rd0dASC4qerJXjcdh6w3yaaeQr75qKmR3rVLXu4kkObz7app4mMDYBmY0b7Z4hy2OOdg
 FKbcEDdGTzbQpFgUvrVw0RL+m7B2uTDJxZTSKBNm7puMrXbMK948ScX9JsBke0mcRAw8
 uxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357773; x=1685949773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64H1HdxJ2Vo9fMDDBGxTfjpGZYN3L1dEu1eUYP7zZpo=;
 b=hBSQZzf2IOEqia3Zan3xWQR1lP7WudvV1fxxTeutnuwjYs/dktFZviKiP6cH4OzQfz
 RHqdWoO17GusCY7gVIUbKVXvROJ15KV5iS3z2YTL0QVv/qtZb2XLHWdW5cdXFyuOwbF6
 V3DQDlvlkxyZ9vCNtIBHSZby4SzKSKzWlZAEMRDzlDLzxRBN/l9hKdj8+D7DJNsRtZ2z
 BgMYi5kgqR+J0Wn+9M094sGm+47W/xG6tFsWAMmRknGXLgekdvIMZChgBnms3/N/LdSS
 q7WLuJsY559TlQa9faQhEbNqzgx0AjvYrzya42miZXDR0r8jjWdW7D0moxiT3icIpNrG
 eG2g==
X-Gm-Message-State: AC+VfDwpGMyCJTA02oK/leROUM29wS2QaCfanXvmyp83yHxx/+VRmPu8
 p8BQS6iPCRJASoQXrwjxccsjBg==
X-Google-Smtp-Source: ACHHUZ6cSsxoSW4ssoD4taDX/pqF0KXwUKGponZZwhL1XCkNgAqQX3jL7rlM+zUIBN8bJV+sttqvoQ==
X-Received: by 2002:adf:e80e:0:b0:2f9:85ee:e031 with SMTP id
 o14-20020adfe80e000000b002f985eee031mr2866309wrm.26.1683357773603; 
 Sat, 06 May 2023 00:22:53 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 22/30] tcg/mips: Reorg tlb load within prepare_host_addr
Date: Sat,  6 May 2023 08:22:27 +0100
Message-Id: <20230506072235.597467-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Sat, 06 May 2023 07:23:29 -0000

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


