Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6R6-0007n4-Ef
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R4-0007kZ-CI
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:58 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qo-0001kW-Dv
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:58 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f4000ec6ecso26345e9.0
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097061; x=1685689061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PC+Gw/9P+2wBG7ELo5n/093Z6DPtUA9B8lGYDE8K0ac=;
 b=tIj6iY1ZtdTtwOkdR5f4rcOR85von0qLqLVbbO/6qkwzKbgdW2uaYvmdP31S7F0AOm
 hRFKoUHHTFhOBt9Ek5RtoaG5/Mp6VznWyHD/i4mM9kBokyLHH2QD/85baC0adkg7N2ZA
 wVH0fx2k1sUJDiawlQUSxsS0JSS6iNEJ6VeU/dCZFTK4FOHJ9JX2p06jYKfqO/CRRZNb
 OBJirCKjqwMniiFdHJEmjInlKTo8ipxaMTMqbzd8IWzceQw5kPDDrnpSccceNjsaiuwM
 GdIHgAGB6I4oWSW9jU9HOFPsHKAyZdua8MZ8vNTXlk5+HLTo6eE2jSx+zrUMk600Bq93
 Z+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097061; x=1685689061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PC+Gw/9P+2wBG7ELo5n/093Z6DPtUA9B8lGYDE8K0ac=;
 b=J9Cpl9GZLj1HywQOo/43S61W3syp4Mt+sRoCPP8kQRsoTU8OppE6zWdCo7w9za4oSc
 rGt1GveKzgIXJrgRdZMFxCqy9xLj8UWWCC0p5nSNsB/ggXRflwVsjUr2+YkAxFxh+TUz
 9U9zUXR/6VTaOhCPXr7HIv9nHNOJ2Af9vkVgSnATj5XgJrU0Ttzk0lNstr4dTjxTnW0j
 ze6Eq/9yEDUK2B+WpK1TVEL4n2bRcyBxLQl370IWAVKHcrDN6sLTaZL8OFvcaW7LQQMV
 VqkBKZgbL3LdjPExf5a2lj7T9V7A0S0UBhSdZ9G66NUmepXmdRI8MLWGMsYXd3U1VAv8
 gFIg==
X-Gm-Message-State: AC+VfDw6WQlRVyPTv+nUGzr5BpliqZDrF/Q9OeGRvlSgxXGWopZvzsz5
 FY11mlCjmrWSj1J3HPL0Vikyhg==
X-Google-Smtp-Source: ACHHUZ42rtZ5GqZApRVyGPv+QFIaEbiZbIKXWpmR8I76RCgA8hEZ72p/QJxBATE2c5jsPJ2SCFFz6A==
X-Received: by 2002:a1c:7c18:0:b0:3f1:789d:ad32 with SMTP id
 x24-20020a1c7c18000000b003f1789dad32mr14272670wmc.11.1683097061023; 
 Tue, 02 May 2023 23:57:41 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 14/54] tcg/loongarch64: Rationalize args to
 tcg_out_qemu_{ld, st}
Date: Wed,  3 May 2023 07:56:49 +0100
Message-Id: <20230503065729.1745843-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Wed, 03 May 2023 06:57:58 -0000

Interpret the variable argument placement in the caller.  Shift some
code around slightly to share more between softmmu and user-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 100 +++++++++++++------------------
 1 file changed, 42 insertions(+), 58 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 0940788c6f..2e3c67054b 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1049,39 +1049,31 @@ static void tcg_out_qemu_ld_indexed(TCGContext *s, TCGReg rd, TCGReg rj,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addr_regl;
-    TCGReg data_regl;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
+    MemOp opc = get_memop(oi);
+    TCGReg base, index;
+
+#ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr[1];
-#else
-    unsigned a_bits;
-#endif
-    TCGReg base;
 
-    data_regl = *args++;
-    addr_regl = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
-
-#if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 1);
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    tcg_out_qemu_ld_indexed(s, data_regl, base, TCG_REG_TMP2, opc, type);
-    add_qemu_ldst_label(s, 1, oi, type,
-                        data_regl, addr_regl,
-                        s->code_ptr, label_ptr);
+    tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
+    index = TCG_REG_TMP2;
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
-        tcg_out_test_alignment(s, true, addr_regl, a_bits);
+        tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
-    tcg_out_qemu_ld_indexed(s, data_regl, base, guest_base_reg, opc, type);
+    index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+#endif
+
+    base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
+    tcg_out_qemu_ld_indexed(s, data_reg, base, index, opc, data_type);
+
+#ifdef CONFIG_SOFTMMU
+    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #endif
 }
 
@@ -1109,39 +1101,31 @@ static void tcg_out_qemu_st_indexed(TCGContext *s, TCGReg data,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType type)
+static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addr_regl;
-    TCGReg data_regl;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
+    MemOp opc = get_memop(oi);
+    TCGReg base, index;
+
+#ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr[1];
-#else
-    unsigned a_bits;
-#endif
-    TCGReg base;
 
-    data_regl = *args++;
-    addr_regl = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
-
-#if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 0);
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    tcg_out_qemu_st_indexed(s, data_regl, base, TCG_REG_TMP2, opc);
-    add_qemu_ldst_label(s, 0, oi, type,
-                        data_regl, addr_regl,
-                        s->code_ptr, label_ptr);
+    tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
+    index = TCG_REG_TMP2;
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
-        tcg_out_test_alignment(s, false, addr_regl, a_bits);
+        tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
-    tcg_out_qemu_st_indexed(s, data_regl, base, guest_base_reg, opc);
+    index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+#endif
+
+    base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
+    tcg_out_qemu_st_indexed(s, data_reg, base, index, opc);
+
+#ifdef CONFIG_SOFTMMU
+    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #endif
 }
 
@@ -1564,16 +1548,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, TCG_TYPE_I32);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, TCG_TYPE_I32);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, TCG_TYPE_I64);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
-- 
2.34.1


