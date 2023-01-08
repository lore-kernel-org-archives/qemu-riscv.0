Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZ7-0004jW-Oy
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZ6-0004hV-DG
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:40 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYt-0004WL-J9
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:40 -0500
Received: by mail-pl1-x62c.google.com with SMTP id c6so5884450pls.4
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Rv856N+OWstGUl7U1vP59WucQCWPrxG6fVCW7RDz4k=;
 b=fwnqtv2jC1ESO6lC5Y/IX69fD2uiohbh2dlaBhqIJbRImITXE5f0gRRB53LvD4+qGu
 eb2v1+Y6NM8MKVEFWYxwb+tUCD7RhgA2Iy/qxjlqNUxMTgIX4tPkOnz0BnrDLNMKgx1z
 YucwxKi04pkBHZaeCjtaFjgw6NOZO0m1GUijODP5btf5r5+H/+0sPcqhY4pBy6TUSZ5Z
 rW3lYxxsxu97umMu+3Jm+LxaGkpgeFtsK4+z/R5MeDfKuWaN9bZE+uXnm+iH141I3+kJ
 dcg17m1mguxXmpTaBR6I0gzQJ0WCZW2LsTzGfAhWFR8TGe/tUunOpdah7qQBCfyDTuej
 3wCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Rv856N+OWstGUl7U1vP59WucQCWPrxG6fVCW7RDz4k=;
 b=n79oEuxOPczoL9Rja3hWBH5P+Ht/LwTFoJK/uXBI9gqbVEYsrzO1IzFGjyR8b35QpH
 doQrmtEFClBWTs5uhM38NU5UpfvzVJ5QhyWCbfg9UmzOHVkj41hZUewrz3uC2cvdfQT6
 WGIesjFo/bph7xgTBm8TR0mLPVNX1+kVIsFbFM9ozYpe3z/muiIJ3bIJ1g1hUllR94gC
 NTLzBxWRGo+1ivp8NW+HqwcF12L1L3ErF1Lit8Kk+M4tuFfTWjXgmgYdoHN6Yjhzd56w
 5Vv36Oenolf8/hC2tNSypNoIkJVKgSLkhBkLWF0DPGfb38luh030zag4IkX5H6u/3OUC
 Jieg==
X-Gm-Message-State: AFqh2krdJVxpr4qy7+1gYjwzpOkR2a9ssIKoKZkccwwseTgDgT87ocKX
 S5H0w0usHYxNb0agvOWIVJ0nvQ==
X-Google-Smtp-Source: AMrXdXuz9rPfuEcj89rl2AbxoiX8/IJTVUDvrXji45IGqXFo8r5ub0hZzb9mYsQ2kUJQVzuAzgBDMw==
X-Received: by 2002:a17:902:ccc4:b0:186:e434:6265 with SMTP id
 z4-20020a170902ccc400b00186e4346265mr73347806ple.2.1673145445962; 
 Sat, 07 Jan 2023 18:37:25 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v4 04/36] tcg: Introduce tcg_out_addi_ptr
Date: Sat,  7 Jan 2023 18:36:47 -0800
Message-Id: <20230108023719.2466341-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 08 Jan 2023 02:37:40 -0000

Implement the function for arm, i386, and s390x, which will use it.
Add stubs for all other backends.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  2 ++
 tcg/aarch64/tcg-target.c.inc     |  7 +++++++
 tcg/arm/tcg-target.c.inc         | 20 ++++++++++++++++++++
 tcg/i386/tcg-target.c.inc        |  8 ++++++++
 tcg/loongarch64/tcg-target.c.inc |  7 +++++++
 tcg/mips/tcg-target.c.inc        |  7 +++++++
 tcg/ppc/tcg-target.c.inc         |  7 +++++++
 tcg/riscv/tcg-target.c.inc       |  7 +++++++
 tcg/s390x/tcg-target.c.inc       |  7 +++++++
 tcg/sparc64/tcg-target.c.inc     |  7 +++++++
 tcg/tci/tcg-target.c.inc         |  7 +++++++
 11 files changed, 86 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 7e69e2c9fd..a6c2783285 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -103,6 +103,8 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long)
+    __attribute__((unused));
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS]);
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index ad1816e32d..2279a14c11 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1102,6 +1102,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     tcg_out_insn(s, 3305, LDR, 0, rd);
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 /* Define something more legible for general use.  */
 #define tcg_out_ldst_r  tcg_out_insn_3310
 
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 9245ea86d0..8b24481d8c 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2540,6 +2540,26 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     tcg_out_movi32(s, COND_AL, ret, arg);
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    int enc, opc = ARITH_ADD;
+
+    /* All of the easiest immediates to encode are positive. */
+    if (imm < 0) {
+        imm = -imm;
+        opc = ARITH_SUB;
+    }
+    enc = encode_imm(imm);
+    if (enc >= 0) {
+        tcg_out_dat_imm(s, COND_AL, opc, rd, rs, enc);
+    } else {
+        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, imm);
+        tcg_out_dat_reg(s, COND_AL, opc, rd, rs,
+                        TCG_REG_TMP, SHIFT_IMM_LSL(0));
+    }
+}
+
 /* Type is always V128, with I64 elements.  */
 static void tcg_out_dup2_vec(TCGContext *s, TCGReg rd, TCGReg rl, TCGReg rh)
 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 58bd5873f5..6a021dda8b 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1069,6 +1069,14 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+    tcg_out_modrm_offset(s, OPC_LEA, rd, rs, imm);
+}
+
 static inline void tcg_out_pushi(TCGContext *s, tcg_target_long val)
 {
     if (val == (int8_t)val) {
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index c9e99e8ec3..54b1dcd911 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -389,6 +389,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     }
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
 {
     tcg_out_opc_andi(s, ret, arg, 0xff);
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 292e490b5c..22b5463f0f 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -550,6 +550,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 static void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
 {
     /* ret and arg can't be register tmp0 */
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e0621463f6..bf3812eb8d 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1125,6 +1125,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg ret,
     }
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 static bool mask_operand(uint32_t c, int *mb, int *me)
 {
     uint32_t lsb, test;
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index f741e0582d..b961972b9f 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -558,6 +558,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     tcg_out_opc_imm(s, OPC_LD, rd, rd, 0);
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
 {
     tcg_out_opc_imm(s, OPC_ANDI, ret, arg, 0xff);
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index b9ba7b605e..d65cd79899 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1020,6 +1020,13 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    tcg_out_mem(s, RX_LA, RXY_LAY, rd, rs, TCG_REG_NONE, imm);
+}
+
 /* load data from an absolute host address */
 static void tcg_out_ld_abs(TCGContext *s, TCGType type,
                            TCGReg dest, const void *abs)
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index eb913f33c8..f6a8a8e605 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -497,6 +497,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 static void tcg_out_ldst_rr(TCGContext *s, TCGReg data, TCGReg a1,
                             TCGReg a2, int op)
 {
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index d36a7ebdd1..633345d74b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -557,6 +557,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
+                             tcg_target_long imm)
+{
+    /* This function is only used for passing structs by reference. */
+    g_assert_not_reached();
+}
+
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *func,
                          const TCGHelperInfo *info)
 {
-- 
2.34.1


