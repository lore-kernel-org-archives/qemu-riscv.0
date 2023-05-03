Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6R7-0007ns-LT
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R5-0007mB-JG
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:59 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qp-0001l9-Bz
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:58 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f19ab99540so46164205e9.2
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097062; x=1685689062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N3QoKqsv+R/CZvxHdMJxo06yfgQBTVK77OIFinD6LW0=;
 b=mH2U7/eWOoHkBLRrNCKqxG+jmnf5v7M7dBw410V3TxRDy31ElUphWWXUBlbVshw88X
 kUW7/OJ2Tm0NmS8Up4O9GctHL8lvSB+kv8bRrPXn5lCXB18rq75OyE8lf4qJyC8RCiHm
 tfMgEAkI8k/MCZThxcgRiyyXtc6c9p9UmUU4RViuNS7vZmoCwzJtPB7vQtFcBmspdHuT
 gakwAQyHz7wlN6Hi4I8fXP/+8pU9xx+G74wPn6uaIMp63+cGAJVhjar+gilDhu4XT4rz
 BGv10wj2GgNjnZ0DOQ76amwV8KAMGx04n0H9gazUVA9jdox7rbkXXqxhAlGeJhviI2up
 EeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097062; x=1685689062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N3QoKqsv+R/CZvxHdMJxo06yfgQBTVK77OIFinD6LW0=;
 b=aIcbWtfhndVLDsggQ/nyq2mxgVfO5JwgVbiaEBRWcnWTrnE0Ud3sPE953OFfNts/In
 d+9x2lTFtf30X6uSr8XqOhWZ0TfqCWxXz+dXt5Ijo7UUjgX2pNiQ8PKl4W5zNhDdp+gp
 uXoaY+frZ0gFzcjJ2cHPwXNpDN5Vrm2nJsFq3N1CtyVrKHGrVjbHRUKgGMnEPohxNW8Z
 YPZbXz7XoHMigMSXGfzXENfPfmfb7RpLc02rNZa7EeUMucGfmZQBnVZ1tT0GmPsXvff6
 GG1SGwS8ui0Do9gOjjxdX+H2vwilsBeH9Ut4oaF18x+UbOjoGL0vAI8EtL8a266K6Mx3
 khjw==
X-Gm-Message-State: AC+VfDw5sQJ6z3jdRYUjm3vFaR4uG9DLY/6rM/WJ0mYWzvg3gFJfkb7k
 fTUW2xibGS4XNC8PdMS5NYk2iw==
X-Google-Smtp-Source: ACHHUZ77ZnjEIdjQq2+0VolikBmYGbyWkpJ8l3KkQR1RdU/B+IaKQj4232kQz+keSE5GXzDLYcbXIw==
X-Received: by 2002:a05:600c:24a:b0:3f2:51e7:f1f4 with SMTP id
 10-20020a05600c024a00b003f251e7f1f4mr14411206wmj.10.1683097061901; 
 Tue, 02 May 2023 23:57:41 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 15/54] tcg/loongarch64: Introduce HostAddress
Date: Wed,  3 May 2023 07:56:50 +0100
Message-Id: <20230503065729.1745843-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Wed, 03 May 2023 06:57:59 -0000

Collect the 2 parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st}_direct to use it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 55 +++++++++++++++++---------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 2e3c67054b..6a87a5e5a3 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1013,36 +1013,41 @@ static TCGReg tcg_out_zext_addr_if_32_bit(TCGContext *s,
     return addr;
 }
 
-static void tcg_out_qemu_ld_indexed(TCGContext *s, TCGReg rd, TCGReg rj,
-                                   TCGReg rk, MemOp opc, TCGType type)
+typedef struct {
+    TCGReg base;
+    TCGReg index;
+} HostAddress;
+
+static void tcg_out_qemu_ld_indexed(TCGContext *s, MemOp opc, TCGType type,
+                                    TCGReg rd, HostAddress h)
 {
     /* Byte swapping is left to middle-end expansion.  */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SSIZE) {
     case MO_UB:
-        tcg_out_opc_ldx_bu(s, rd, rj, rk);
+        tcg_out_opc_ldx_bu(s, rd, h.base, h.index);
         break;
     case MO_SB:
-        tcg_out_opc_ldx_b(s, rd, rj, rk);
+        tcg_out_opc_ldx_b(s, rd, h.base, h.index);
         break;
     case MO_UW:
-        tcg_out_opc_ldx_hu(s, rd, rj, rk);
+        tcg_out_opc_ldx_hu(s, rd, h.base, h.index);
         break;
     case MO_SW:
-        tcg_out_opc_ldx_h(s, rd, rj, rk);
+        tcg_out_opc_ldx_h(s, rd, h.base, h.index);
         break;
     case MO_UL:
         if (type == TCG_TYPE_I64) {
-            tcg_out_opc_ldx_wu(s, rd, rj, rk);
+            tcg_out_opc_ldx_wu(s, rd, h.base, h.index);
             break;
         }
         /* fallthrough */
     case MO_SL:
-        tcg_out_opc_ldx_w(s, rd, rj, rk);
+        tcg_out_opc_ldx_w(s, rd, h.base, h.index);
         break;
     case MO_UQ:
-        tcg_out_opc_ldx_d(s, rd, rj, rk);
+        tcg_out_opc_ldx_d(s, rd, h.base, h.index);
         break;
     default:
         g_assert_not_reached();
@@ -1053,23 +1058,23 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
-    TCGReg base, index;
+    HostAddress h;
 
 #ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr[1];
 
     tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
-    index = TCG_REG_TMP2;
+    h.index = TCG_REG_TMP2;
 #else
     unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
-    index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+    h.index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
 #endif
 
-    base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
-    tcg_out_qemu_ld_indexed(s, data_reg, base, index, opc, data_type);
+    h.base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
+    tcg_out_qemu_ld_indexed(s, opc, data_type, data_reg, h);
 
 #ifdef CONFIG_SOFTMMU
     add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
@@ -1077,24 +1082,24 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 #endif
 }
 
-static void tcg_out_qemu_st_indexed(TCGContext *s, TCGReg data,
-                                   TCGReg rj, TCGReg rk, MemOp opc)
+static void tcg_out_qemu_st_indexed(TCGContext *s, MemOp opc,
+                                    TCGReg rd, HostAddress h)
 {
     /* Byte swapping is left to middle-end expansion.  */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SIZE) {
     case MO_8:
-        tcg_out_opc_stx_b(s, data, rj, rk);
+        tcg_out_opc_stx_b(s, rd, h.base, h.index);
         break;
     case MO_16:
-        tcg_out_opc_stx_h(s, data, rj, rk);
+        tcg_out_opc_stx_h(s, rd, h.base, h.index);
         break;
     case MO_32:
-        tcg_out_opc_stx_w(s, data, rj, rk);
+        tcg_out_opc_stx_w(s, rd, h.base, h.index);
         break;
     case MO_64:
-        tcg_out_opc_stx_d(s, data, rj, rk);
+        tcg_out_opc_stx_d(s, rd, h.base, h.index);
         break;
     default:
         g_assert_not_reached();
@@ -1105,23 +1110,23 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
-    TCGReg base, index;
+    HostAddress h;
 
 #ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr[1];
 
     tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
-    index = TCG_REG_TMP2;
+    h.index = TCG_REG_TMP2;
 #else
     unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
-    index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+    h.index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
 #endif
 
-    base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
-    tcg_out_qemu_st_indexed(s, data_reg, base, index, opc);
+    h.base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
+    tcg_out_qemu_st_indexed(s, opc, data_reg, h);
 
 #ifdef CONFIG_SOFTMMU
     add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
-- 
2.34.1


