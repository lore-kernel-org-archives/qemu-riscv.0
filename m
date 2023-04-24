Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqozj-0003Tv-O1
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxz-00068a-Ua
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:42:33 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxB-0004Ps-JU
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:42:22 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2f3fe12de15so2311325f8f.3
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314882; x=1684906882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lj83+ZuDeA8rnosHlZL+RYSkBwDzlxEBOWASJPRt7r8=;
 b=Qj7GBnZVaRRrThlmd54IuMRLRwkwlGqcTp/y9IKMmFyM1Hlcg6OUnnVhG5vr37tttt
 hVWhTi9M73/yND8Qv/LrU6lFYm57QiKQrvWo2k9xaIfXeQ/IYxQJ610LkmIBQVhKBPNh
 vcfuCWZMcGN3veoem/7Z+HMkpawvoPz5obsXlrJj66s0ref832U5i0f+Rq1iRHsxOQMx
 Rqri+d91IcT0nPSFOg7D5q/L3npQ+OFjDaLHtIK5SF/9p0xXoQUzhboSSgZ4uOSsiL9Z
 XRrad8HhKwWFdgC6qtjcf0K3g4tWZNS3FP8HaEBREq5jckHevPntiP1xQA+d6UjrLic3
 ojNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314882; x=1684906882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lj83+ZuDeA8rnosHlZL+RYSkBwDzlxEBOWASJPRt7r8=;
 b=bucLXaFT88iVp3GYVn67jLfa+y7ZvNBwc+B8zyxiVJH0T+NBUZ/b1DqadmAzu3SzwR
 +Bnw6bkkcaHrqjDZsV7gNJoG2b4AAlNjLvl+ldwfxQ9DPbLpP2QhmiMxZSJpNfqI4vRu
 Sevget785Z25FemiBDyt3UMgYf/x8/V7JjO26P6a2EcMFUQpS6YrOqF3IcsVimaIjDxw
 uD7FKM3Z9gv4+Ix+D/hAjTVuGEamPwpLGRtoJ3qgd9CBJM8R5nSem9HTWnthCQwWK3Mb
 LApzZpFWUUbiwJQJfxbpf6w6eWWbR39pv4JIMzKKtz6zmAVyJQB9mbTPXNQoMjO1v2sR
 f4FA==
X-Gm-Message-State: AAQBX9e4OM+iiVLKeSs0CRh1YQfCy6/oK+w5+MU15LpQzyZ3U4eWlTUQ
 Wmcyh8O9Pg+TtTgyqzFGtYG/xQ==
X-Google-Smtp-Source: AKy350bzX/awtbsA/w+dg9vAoAAqUdTZSIp/HPlQbJWSojutFPgb6yNQJ95u97z+OoEIxz3UnVIqUw==
X-Received: by 2002:a5d:428f:0:b0:2f5:ac53:c04f with SMTP id
 k15-20020a5d428f000000b002f5ac53c04fmr9315132wrq.28.1682314881977; 
 Sun, 23 Apr 2023 22:41:21 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 27/57] tcg/riscv: Rationalize args to tcg_out_qemu_{ld,st}
Date: Mon, 24 Apr 2023 06:40:35 +0100
Message-Id: <20230424054105.1579315-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Mon, 24 Apr 2023 05:42:48 -0000

Interpret the variable argument placement in the caller.  Pass data_type
instead of is64 -- there are several places where we already convert back
from bool to type.  Clean things up by using type throughout.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 66 ++++++++++++++------------------------
 1 file changed, 24 insertions(+), 42 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 1edc3b1c4d..3b10ecb767 100644
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
@@ -1136,30 +1136,21 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addr_reg, data_reg;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[1];
-#else
-    unsigned a_bits;
-#endif
+    MemOp opc = get_memop(oi);
     TCGReg base;
 
-    data_reg = *args++;
-    addr_reg = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
-
 #if defined(CONFIG_SOFTMMU)
+    tcg_insn_unit *label_ptr[1];
+
     base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
-    tcg_out_qemu_ld_direct(s, data_reg, base, opc, is_64);
-    add_qemu_ldst_label(s, 1, oi, (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_reg, addr_reg, s->code_ptr, label_ptr);
+    tcg_out_qemu_ld_direct(s, data_reg, base, opc, data_type);
+    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
@@ -1172,7 +1163,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
         base = TCG_REG_TMP0;
     }
-    tcg_out_qemu_ld_direct(s, data_reg, base, opc, is_64);
+    tcg_out_qemu_ld_direct(s, data_reg, base, opc, data_type);
 #endif
 }
 
@@ -1200,30 +1191,21 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg val,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addr_reg, data_reg;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[1];
-#else
-    unsigned a_bits;
-#endif
+    MemOp opc = get_memop(oi);
     TCGReg base;
 
-    data_reg = *args++;
-    addr_reg = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
-
 #if defined(CONFIG_SOFTMMU)
+    tcg_insn_unit *label_ptr[1];
+
     base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
     tcg_out_qemu_st_direct(s, data_reg, base, opc);
-    add_qemu_ldst_label(s, 0, oi, (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
@@ -1528,16 +1510,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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


