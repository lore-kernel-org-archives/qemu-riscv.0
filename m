Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6RM-00086P-7L
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6RK-00081e-TK
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:14 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qt-0001n8-Kx
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:07 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so28939505e9.2
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097066; x=1685689066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gzBsBjNi69rBqU30/4XrEpjrpJ6MM+4FytYgW6co40=;
 b=EqgLfVmH+U8gH8RCKqN2MzFLZngvKU2amPXL9BBdSvuaKnWeVJZOUPL5RcmOsgtLrX
 q+oCYU3okq+Rd8DGOx5KYiKx+JktCHoxWwO/NyrAFjT1MztF8bSCDZ5uIMZ/AlOOH7nG
 Vi6dLTgCraovecvXXUvObpFYtEPDsXlChB677KIlCjrAuYaq4AUTIWC+NoRSs2e+QodY
 r3PtEPmdW7aPKxCTM4GVrCuji+9FCBp+suXwNSby2opzH1qvb/t4H37n4i9QqG9A1yk/
 gTqVEJ/Bz8b1gGWvI8mPaGK8qFUqfnBzNFODSPXyk9zMPzgzBAqdwBiosKqOLHQLI3C+
 eUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097066; x=1685689066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gzBsBjNi69rBqU30/4XrEpjrpJ6MM+4FytYgW6co40=;
 b=CXc4CmojUlQvHJ4G+xCkntcMWoviNlZdtGVJx5YIi+WZ8PrdxYk3m/zkLkmOWXkmxV
 5Uf+peZozPvfUXD3FgEuYgpmBKCZjP0jh3IEcEWg+xVoZQ7GlJLwzPbwakToEeTwZIxh
 Q/dho3gW2hXi9PDG8HGe2ry8x/vzghOMIr1ayGyqJJFHWwqB6kX7bMFYlvj4MP/2ycHn
 0J3luBWEPIVaEPmHzqYieLAexjJASi/FBLB/wWIoZYmGVMt7CCjssm9zZSaG6E4cIwE8
 fnhHVPoShKFVP/qNOamix8eqFpMjyXmns1ZrRvSIb2+VuFoAKSo2Z+Hm9nA5zXJBMKdW
 WI/g==
X-Gm-Message-State: AC+VfDxVC/jAeSbic339nDfeOb1C5Qxs5XdXg4TQWmwPttNbbsQlvCrJ
 UB2o85tsGE3Jn3/5GEkiM6aZsg==
X-Google-Smtp-Source: ACHHUZ6ILOIxa8PvMgp+1ehO3q3igALPvvYStNZMulhnqs+EifIJ32vVQyTEiNl1lkxEJFPCFSNWJQ==
X-Received: by 2002:a7b:ca47:0:b0:3f3:1cb7:b2a3 with SMTP id
 m7-20020a7bca47000000b003f31cb7b2a3mr12781409wml.9.1683097066094; 
 Tue, 02 May 2023 23:57:46 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 20/54] tcg/ppc: Introduce HostAddress
Date: Wed,  3 May 2023 07:56:55 +0100
Message-Id: <20230503065729.1745843-21-richard.henderson@linaro.org>
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
X-List-Received-Date: Wed, 03 May 2023 06:58:15 -0000

Collect the parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st} to use it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 90 +++++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 43 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index d1aa2a9f53..cd473deb36 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2287,67 +2287,71 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     return tcg_out_fail_alignment(s, l);
 }
-
 #endif /* SOFTMMU */
 
+typedef struct {
+    TCGReg base;
+    TCGReg index;
+} HostAddress;
+
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             TCGReg addrlo, TCGReg addrhi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
     MemOp s_bits = opc & MO_SIZE;
-    TCGReg rbase;
+    HostAddress h;
 
 #ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr;
 
-    addrlo = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), true);
+    h.index = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), true);
+    h.base = TCG_REG_R3;
 
     /* Load a pointer into the current opcode w/conditional branch-link. */
     label_ptr = s->code_ptr;
     tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
-
-    rbase = TCG_REG_R3;
 #else  /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
     }
-    rbase = guest_base ? TCG_GUEST_BASE_REG : 0;
+    h.base = guest_base ? TCG_GUEST_BASE_REG : 0;
+    h.index = addrlo;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
-        addrlo = TCG_REG_TMP1;
+        h.index = TCG_REG_TMP1;
     }
 #endif
 
     if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
         if (opc & MO_BSWAP) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, LWBRX | TAB(datalo, rbase, addrlo));
-            tcg_out32(s, LWBRX | TAB(datahi, rbase, TCG_REG_R0));
-        } else if (rbase != 0) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, LWZX | TAB(datahi, rbase, addrlo));
-            tcg_out32(s, LWZX | TAB(datalo, rbase, TCG_REG_R0));
-        } else if (addrlo == datahi) {
-            tcg_out32(s, LWZ | TAI(datalo, addrlo, 4));
-            tcg_out32(s, LWZ | TAI(datahi, addrlo, 0));
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, h.index, 4));
+            tcg_out32(s, LWBRX | TAB(datalo, h.base, h.index));
+            tcg_out32(s, LWBRX | TAB(datahi, h.base, TCG_REG_R0));
+        } else if (h.base != 0) {
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, h.index, 4));
+            tcg_out32(s, LWZX | TAB(datahi, h.base, h.index));
+            tcg_out32(s, LWZX | TAB(datalo, h.base, TCG_REG_R0));
+        } else if (h.index == datahi) {
+            tcg_out32(s, LWZ | TAI(datalo, h.index, 4));
+            tcg_out32(s, LWZ | TAI(datahi, h.index, 0));
         } else {
-            tcg_out32(s, LWZ | TAI(datahi, addrlo, 0));
-            tcg_out32(s, LWZ | TAI(datalo, addrlo, 4));
+            tcg_out32(s, LWZ | TAI(datahi, h.index, 0));
+            tcg_out32(s, LWZ | TAI(datalo, h.index, 4));
         }
     } else {
         uint32_t insn = qemu_ldx_opc[opc & (MO_BSWAP | MO_SSIZE)];
         if (!have_isa_2_06 && insn == LDBRX) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, LWBRX | TAB(datalo, rbase, addrlo));
-            tcg_out32(s, LWBRX | TAB(TCG_REG_R0, rbase, TCG_REG_R0));
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, h.index, 4));
+            tcg_out32(s, LWBRX | TAB(datalo, h.base, h.index));
+            tcg_out32(s, LWBRX | TAB(TCG_REG_R0, h.base, TCG_REG_R0));
             tcg_out_rld(s, RLDIMI, datalo, TCG_REG_R0, 32, 0);
         } else if (insn) {
-            tcg_out32(s, insn | TAB(datalo, rbase, addrlo));
+            tcg_out32(s, insn | TAB(datalo, h.base, h.index));
         } else {
             insn = qemu_ldx_opc[opc & (MO_SIZE | MO_BSWAP)];
-            tcg_out32(s, insn | TAB(datalo, rbase, addrlo));
+            tcg_out32(s, insn | TAB(datalo, h.base, h.index));
             tcg_out_movext(s, TCG_TYPE_REG, datalo,
                            TCG_TYPE_REG, opc & MO_SSIZE, datalo);
         }
@@ -2365,52 +2369,52 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
 {
     MemOp opc = get_memop(oi);
     MemOp s_bits = opc & MO_SIZE;
-    TCGReg rbase;
+    HostAddress h;
 
 #ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr;
 
-    addrlo = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), false);
+    h.index = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), false);
+    h.base = TCG_REG_R3;
 
     /* Load a pointer into the current opcode w/conditional branch-link. */
     label_ptr = s->code_ptr;
     tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
-
-    rbase = TCG_REG_R3;
 #else  /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
     }
-    rbase = guest_base ? TCG_GUEST_BASE_REG : 0;
+    h.base = guest_base ? TCG_GUEST_BASE_REG : 0;
+    h.index = addrlo;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
-        addrlo = TCG_REG_TMP1;
+        h.index = TCG_REG_TMP1;
     }
 #endif
 
     if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
         if (opc & MO_BSWAP) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, STWBRX | SAB(datalo, rbase, addrlo));
-            tcg_out32(s, STWBRX | SAB(datahi, rbase, TCG_REG_R0));
-        } else if (rbase != 0) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, STWX | SAB(datahi, rbase, addrlo));
-            tcg_out32(s, STWX | SAB(datalo, rbase, TCG_REG_R0));
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, h.index, 4));
+            tcg_out32(s, STWBRX | SAB(datalo, h.base, h.index));
+            tcg_out32(s, STWBRX | SAB(datahi, h.base, TCG_REG_R0));
+        } else if (h.base != 0) {
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, h.index, 4));
+            tcg_out32(s, STWX | SAB(datahi, h.base, h.index));
+            tcg_out32(s, STWX | SAB(datalo, h.base, TCG_REG_R0));
         } else {
-            tcg_out32(s, STW | TAI(datahi, addrlo, 0));
-            tcg_out32(s, STW | TAI(datalo, addrlo, 4));
+            tcg_out32(s, STW | TAI(datahi, h.index, 0));
+            tcg_out32(s, STW | TAI(datalo, h.index, 4));
         }
     } else {
         uint32_t insn = qemu_stx_opc[opc & (MO_BSWAP | MO_SIZE)];
         if (!have_isa_2_06 && insn == STDBRX) {
-            tcg_out32(s, STWBRX | SAB(datalo, rbase, addrlo));
-            tcg_out32(s, ADDI | TAI(TCG_REG_TMP1, addrlo, 4));
+            tcg_out32(s, STWBRX | SAB(datalo, h.base, h.index));
+            tcg_out32(s, ADDI | TAI(TCG_REG_TMP1, h.index, 4));
             tcg_out_shri64(s, TCG_REG_R0, datalo, 32);
-            tcg_out32(s, STWBRX | SAB(TCG_REG_R0, rbase, TCG_REG_TMP1));
+            tcg_out32(s, STWBRX | SAB(TCG_REG_R0, h.base, TCG_REG_TMP1));
         } else {
-            tcg_out32(s, insn | SAB(datalo, rbase, addrlo));
+            tcg_out32(s, insn | SAB(datalo, h.base, h.index));
         }
     }
 
-- 
2.34.1


