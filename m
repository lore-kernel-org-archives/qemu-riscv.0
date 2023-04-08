Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYn-00081W-U9
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYm-0007yc-Ne
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:12 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYH-0005Yj-WA
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:12 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 q15-20020a17090a2dcf00b0023efab0e3bfso2788953pjm.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=itgWaBLjY7YmpUAGU9DqCqqdDqlcaLKLhIh9EK1HPyA=;
 b=A3m5gDP/fp4WQcYuGjaskJmDlmST40OikRcTFfrXBJDwXgP+Mifv7W0SrS20Zp1lfz
 X533Rlb81tvnqhLi9nEKrRPrJaGwdqbe/xJtpNbMJmye6rM4IZQc8jZ47H1Gu7kl0UuH
 vzKKOkC9nW8MIZTPmd3wy3bArqPOINnJhG909AqSE6PiPlz+XJTF9/AAWOm525pKTQd9
 2ykyfK9FDgjRyE2NdZdmJUs/yI+Bu81mdpjYLwWVq7UEdTD8cDgXRhPKs6n7sZLC5tGF
 qeTIc9qAHGpdeTFWNJvSAKIlHbEMZ6taZgnDdwHvhiY0kvpt10uuC9Ym2vrdJ1cmCb3p
 ABhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=itgWaBLjY7YmpUAGU9DqCqqdDqlcaLKLhIh9EK1HPyA=;
 b=jFvW7Fd4a+2X18NSumRTt5OsdTUamw/kZZh1EzPEUZyZVxh3lWbrzBKBPAzOfNOsiN
 gsF2oNtBEMj7ZJVgYu0MWG+T+W3SU/GY5V4gAntw9x5Bg42Xw4qU9l9I40qUg1H+kOGd
 ao1s4w/zz9YK2jwLGMXgLBBXsh7EZehYVzKGN8zI7CQcF7UzVIp04Z3Ob1ToXW8bM6Tr
 zpB458USyfTFbJ86bjv76Q8enbS56QFgsfyFOT0SXJIr17yeV4T8xACHc0vWC1fMIgAl
 xa772t6VwfQhW7HAe56SldI+we+4EXNn/kccJLGKXy7G8ow09r4QAEUPNmT9uynWa0y8
 o+JQ==
X-Gm-Message-State: AAQBX9fbT4zCsCEeSVjIrN6fv1f8Ff59LIESOWSaTuBPmA6F3MC3twOx
 km7O1NbrBXrxzUO+J/gqAnvckA8wfL+VQYzdHEU=
X-Google-Smtp-Source: AKy350bgsRM2mC8eWd97WrYw8nAhZdo2tY47fh7azTjIBl0VEsIr/RI98ss7WNm4zEzf5tMZkTPUbQ==
X-Received: by 2002:a17:902:d50c:b0:1a5:254b:e85b with SMTP id
 b12-20020a170902d50c00b001a5254be85bmr1464760plg.34.1680921821117; 
 Fri, 07 Apr 2023 19:43:41 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 28/42] tcg/riscv: Expand arguments to tcg_out_qemu_{ld,st}
Date: Fri,  7 Apr 2023 19:43:00 -0700
Message-Id: <20230408024314.3357414-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:44:13 -0000

Now that the host is always 64-bit, the address and
data operands are always one operand each.  In addition,
change to using TCGType to describe the data operand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 47 +++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 1edc3b1c4d..6059802d9a 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1101,7 +1101,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 #endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
-                                   TCGReg base, MemOp opc, bool is_64)
+                                   TCGReg base, MemOp opc, TCGType type)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
@@ -1120,7 +1120,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
         tcg_out_opc_imm(s, OPC_LH, val, base, 0);
         break;
     case MO_UL:
-        if (is_64) {
+        if (type == TCG_TYPE_I64) {
             tcg_out_opc_imm(s, OPC_LWU, val, base, 0);
             break;
         }
@@ -1136,11 +1136,10 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
+                            MemOpIdx oi, TCGType d_type)
 {
-    TCGReg addr_reg, data_reg;
-    MemOpIdx oi;
-    MemOp opc;
+    MemOp opc = get_memop(oi);
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
 #else
@@ -1148,16 +1147,11 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 #endif
     TCGReg base;
 
-    data_reg = *args++;
-    addr_reg = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
-
 #if defined(CONFIG_SOFTMMU)
     base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
-    tcg_out_qemu_ld_direct(s, data_reg, base, opc, is_64);
-    add_qemu_ldst_label(s, 1, oi, (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_reg, addr_reg, s->code_ptr, label_ptr);
+    tcg_out_qemu_ld_direct(s, data_reg, base, opc, d_type);
+    add_qemu_ldst_label(s, true, oi, d_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
@@ -1172,7 +1166,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
         base = TCG_REG_TMP0;
     }
-    tcg_out_qemu_ld_direct(s, data_reg, base, opc, is_64);
+    tcg_out_qemu_ld_direct(s, data_reg, base, opc, d_type);
 #endif
 }
 
@@ -1200,11 +1194,10 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg val,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
+                            MemOpIdx oi, TCGType d_type)
 {
-    TCGReg addr_reg, data_reg;
-    MemOpIdx oi;
-    MemOp opc;
+    MemOp opc = get_memop(oi);
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
 #else
@@ -1212,16 +1205,12 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 #endif
     TCGReg base;
 
-    data_reg = *args++;
-    addr_reg = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
 
 #if defined(CONFIG_SOFTMMU)
     base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
     tcg_out_qemu_st_direct(s, data_reg, base, opc);
-    add_qemu_ldst_label(s, 0, oi, (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, d_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
@@ -1528,16 +1517,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, false);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, true);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, false);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, true);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
 
     case INDEX_op_extrh_i64_i32:
-- 
2.34.1


