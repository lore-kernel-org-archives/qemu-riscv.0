Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6RX-0008No-GK
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6RV-0008Li-Vk
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:26 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qy-0001qd-ED
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:25 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e25fso3016965f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097071; x=1685689071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wieZHyAasr1N3tLh9UlWK+BlLvLaFAxyqWZefWKXIaw=;
 b=Pfi9xVFyrMKTQg3EiZvhlLosZHAZtgqRISZpfeGDPsbczHhMK+63axZ7HL42X5GyJK
 uXIh+x9XwyHh0IOIl1pPMQjTt/3UD89jW225iWz7ZBO1AruYzvpffwsgIO+25ay1mmyV
 E0GY0x8f/1F6FebPJT4Z9a47vPB3s4r2TM6hec8eRR+B5r4J48qSVD1KWhG5EbUcrdNM
 7+GabP1wbpSrEs0o1sfMn16ImW6xKoXdpI54AJ50DQic0Wi+TRtY2opxktGlI3PI3noc
 pr4oHXJNRbRKmk1g0yMRViDBcNF5ekYDV4tzC5lN3CuIA7XnoiZl91aSo5g45KVX8oQf
 h4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097071; x=1685689071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wieZHyAasr1N3tLh9UlWK+BlLvLaFAxyqWZefWKXIaw=;
 b=NEwcGGwKTkGrDluqsCb+Y0m3KLGfP3A7Gcc0vYQMVSbk74GPAQ1EcLMWhjWQdV3zNU
 Wyto2V8vEofb7jNfWpM/G22D7g6cigTwU4kEPAnTYw/vNxaPE4PGd4zJbqGrXmNYs5o5
 jXqi4GKqs16ubVokoC5XOmHJlR+5+zvdXR64XQpB9ewzY83WFwQIF7FDIHh4HhHWQBnk
 q65Khl1//BByih09PgzNKbpHdOkrUcRxzPYxRF1+uYcCdfO79Kxx63RleWgFoEZMYvbi
 PlrDw3zOVslMpwtnRMmRFZuXT1VOZuG5AUjhf3HnlphstdPJP0cCqdPB2S7oghBRK+Yb
 iFtw==
X-Gm-Message-State: AC+VfDzMxMg8e4g5CoCueJPh16zHu6Wap9G5exb/VImj2SviBgZ0sv5i
 EX6W6RlLFhyUQvWc+717WctRGA==
X-Google-Smtp-Source: ACHHUZ4kdFGCFTkbeNYxm+dmqSgMhMc4pVfcGWxDkzPQsTrngCig47o8KOOZ69pG16faU2b6IWZ1tQ==
X-Received: by 2002:a5d:42c5:0:b0:2f7:a333:8cab with SMTP id
 t5-20020a5d42c5000000b002f7a3338cabmr13325454wrr.71.1683097070971; 
 Tue, 02 May 2023 23:57:50 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 26/54] tcg/s390x: Introduce HostAddress
Date: Wed,  3 May 2023 07:57:01 +0100
Message-Id: <20230503065729.1745843-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
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
X-List-Received-Date: Wed, 03 May 2023 06:58:26 -0000

Collect the 3 potential parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st}_direct to use it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 109 ++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 49 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index e931f0cde4..da7ee5b085 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1606,58 +1606,64 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest,
     tcg_out_call_int(s, dest);
 }
 
+typedef struct {
+    TCGReg base;
+    TCGReg index;
+    int disp;
+} HostAddress;
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
-                                   TCGReg base, TCGReg index, int disp)
+                                   HostAddress h)
 {
     switch (opc & (MO_SSIZE | MO_BSWAP)) {
     case MO_UB:
-        tcg_out_insn(s, RXY, LLGC, data, base, index, disp);
+        tcg_out_insn(s, RXY, LLGC, data, h.base, h.index, h.disp);
         break;
     case MO_SB:
-        tcg_out_insn(s, RXY, LGB, data, base, index, disp);
+        tcg_out_insn(s, RXY, LGB, data, h.base, h.index, h.disp);
         break;
 
     case MO_UW | MO_BSWAP:
         /* swapped unsigned halfword load with upper bits zeroed */
-        tcg_out_insn(s, RXY, LRVH, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRVH, data, h.base, h.index, h.disp);
         tcg_out_ext16u(s, data, data);
         break;
     case MO_UW:
-        tcg_out_insn(s, RXY, LLGH, data, base, index, disp);
+        tcg_out_insn(s, RXY, LLGH, data, h.base, h.index, h.disp);
         break;
 
     case MO_SW | MO_BSWAP:
         /* swapped sign-extended halfword load */
-        tcg_out_insn(s, RXY, LRVH, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRVH, data, h.base, h.index, h.disp);
         tcg_out_ext16s(s, TCG_TYPE_REG, data, data);
         break;
     case MO_SW:
-        tcg_out_insn(s, RXY, LGH, data, base, index, disp);
+        tcg_out_insn(s, RXY, LGH, data, h.base, h.index, h.disp);
         break;
 
     case MO_UL | MO_BSWAP:
         /* swapped unsigned int load with upper bits zeroed */
-        tcg_out_insn(s, RXY, LRV, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRV, data, h.base, h.index, h.disp);
         tcg_out_ext32u(s, data, data);
         break;
     case MO_UL:
-        tcg_out_insn(s, RXY, LLGF, data, base, index, disp);
+        tcg_out_insn(s, RXY, LLGF, data, h.base, h.index, h.disp);
         break;
 
     case MO_SL | MO_BSWAP:
         /* swapped sign-extended int load */
-        tcg_out_insn(s, RXY, LRV, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRV, data, h.base, h.index, h.disp);
         tcg_out_ext32s(s, data, data);
         break;
     case MO_SL:
-        tcg_out_insn(s, RXY, LGF, data, base, index, disp);
+        tcg_out_insn(s, RXY, LGF, data, h.base, h.index, h.disp);
         break;
 
     case MO_UQ | MO_BSWAP:
-        tcg_out_insn(s, RXY, LRVG, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRVG, data, h.base, h.index, h.disp);
         break;
     case MO_UQ:
-        tcg_out_insn(s, RXY, LG, data, base, index, disp);
+        tcg_out_insn(s, RXY, LG, data, h.base, h.index, h.disp);
         break;
 
     default:
@@ -1666,44 +1672,44 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
-                                   TCGReg base, TCGReg index, int disp)
+                                   HostAddress h)
 {
     switch (opc & (MO_SIZE | MO_BSWAP)) {
     case MO_UB:
-        if (disp >= 0 && disp < 0x1000) {
-            tcg_out_insn(s, RX, STC, data, base, index, disp);
+        if (h.disp >= 0 && h.disp < 0x1000) {
+            tcg_out_insn(s, RX, STC, data, h.base, h.index, h.disp);
         } else {
-            tcg_out_insn(s, RXY, STCY, data, base, index, disp);
+            tcg_out_insn(s, RXY, STCY, data, h.base, h.index, h.disp);
         }
         break;
 
     case MO_UW | MO_BSWAP:
-        tcg_out_insn(s, RXY, STRVH, data, base, index, disp);
+        tcg_out_insn(s, RXY, STRVH, data, h.base, h.index, h.disp);
         break;
     case MO_UW:
-        if (disp >= 0 && disp < 0x1000) {
-            tcg_out_insn(s, RX, STH, data, base, index, disp);
+        if (h.disp >= 0 && h.disp < 0x1000) {
+            tcg_out_insn(s, RX, STH, data, h.base, h.index, h.disp);
         } else {
-            tcg_out_insn(s, RXY, STHY, data, base, index, disp);
+            tcg_out_insn(s, RXY, STHY, data, h.base, h.index, h.disp);
         }
         break;
 
     case MO_UL | MO_BSWAP:
-        tcg_out_insn(s, RXY, STRV, data, base, index, disp);
+        tcg_out_insn(s, RXY, STRV, data, h.base, h.index, h.disp);
         break;
     case MO_UL:
-        if (disp >= 0 && disp < 0x1000) {
-            tcg_out_insn(s, RX, ST, data, base, index, disp);
+        if (h.disp >= 0 && h.disp < 0x1000) {
+            tcg_out_insn(s, RX, ST, data, h.base, h.index, h.disp);
         } else {
-            tcg_out_insn(s, RXY, STY, data, base, index, disp);
+            tcg_out_insn(s, RXY, STY, data, h.base, h.index, h.disp);
         }
         break;
 
     case MO_UQ | MO_BSWAP:
-        tcg_out_insn(s, RXY, STRVG, data, base, index, disp);
+        tcg_out_insn(s, RXY, STRVG, data, h.base, h.index, h.disp);
         break;
     case MO_UQ:
-        tcg_out_insn(s, RXY, STG, data, base, index, disp);
+        tcg_out_insn(s, RXY, STG, data, h.base, h.index, h.disp);
         break;
 
     default:
@@ -1883,20 +1889,23 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return tcg_out_fail_alignment(s, l);
 }
 
-static void tcg_prepare_user_ldst(TCGContext *s, TCGReg *addr_reg,
-                                  TCGReg *index_reg, tcg_target_long *disp)
+static HostAddress tcg_prepare_user_ldst(TCGContext *s, TCGReg addr_reg)
 {
+    TCGReg index;
+    int disp;
+
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_TMP0, *addr_reg);
-        *addr_reg = TCG_TMP0;
+        tcg_out_ext32u(s, TCG_TMP0, addr_reg);
+        addr_reg = TCG_TMP0;
     }
     if (guest_base < 0x80000) {
-        *index_reg = TCG_REG_NONE;
-        *disp = guest_base;
+        index = TCG_REG_NONE;
+        disp = guest_base;
     } else {
-        *index_reg = TCG_GUEST_BASE_REG;
-        *disp = 0;
+        index = TCG_GUEST_BASE_REG;
+        disp = 0;
     }
+    return (HostAddress){ .base = addr_reg, .index = index, .disp = disp };
 }
 #endif /* CONFIG_SOFTMMU */
 
@@ -1904,31 +1913,32 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
+
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
-    TCGReg base_reg;
 
-    base_reg = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
+    h.base = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
+    h.index = TCG_REG_R2;
+    h.disp = 0;
 
     tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
     label_ptr = s->code_ptr;
     s->code_ptr += 1;
 
-    tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
+    tcg_out_qemu_ld_direct(s, opc, data_reg, h);
 
     add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
-    TCGReg index_reg;
-    tcg_target_long disp;
     unsigned a_bits = get_alignment_bits(opc);
 
     if (a_bits) {
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
-    tcg_prepare_user_ldst(s, &addr_reg, &index_reg, &disp);
-    tcg_out_qemu_ld_direct(s, opc, data_reg, addr_reg, index_reg, disp);
+    h = tcg_prepare_user_ldst(s, addr_reg);
+    tcg_out_qemu_ld_direct(s, opc, data_reg, h);
 #endif
 }
 
@@ -1936,31 +1946,32 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
+
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
-    TCGReg base_reg;
 
-    base_reg = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
+    h.base = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
+    h.index = TCG_REG_R2;
+    h.disp = 0;
 
     tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
     label_ptr = s->code_ptr;
     s->code_ptr += 1;
 
-    tcg_out_qemu_st_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
+    tcg_out_qemu_st_direct(s, opc, data_reg, h);
 
     add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
-    TCGReg index_reg;
-    tcg_target_long disp;
     unsigned a_bits = get_alignment_bits(opc);
 
     if (a_bits) {
         tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
-    tcg_prepare_user_ldst(s, &addr_reg, &index_reg, &disp);
-    tcg_out_qemu_st_direct(s, opc, data_reg, addr_reg, index_reg, disp);
+    h = tcg_prepare_user_ldst(s, addr_reg);
+    tcg_out_qemu_st_direct(s, opc, data_reg, h);
 #endif
 }
 
-- 
2.34.1


