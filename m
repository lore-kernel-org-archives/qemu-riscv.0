Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZB-0004mL-5w
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZ9-0004lF-Mq
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:43 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYv-0004XJ-9m
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:43 -0500
Received: by mail-pl1-x62d.google.com with SMTP id v23so963363plo.1
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2kpzoSN5frXUNS/YnvoqX3GwlgAgZ4V3+f4wTeNprg=;
 b=PbOSEtJiVN9CjNCJC7ZSsxT3qdWW+Lab9/Ol1RfgH/I8JrQi+YjKAY6hso1RnGOt+Y
 0YcT4+rXZ1lYRAx7l256panNwVBbgHww1BcYkfkZrv1hdOYpXqAVfjNMW0773bDlsThz
 t3LGY0+F1fWcrcdP8GEcB0G7gvFRwcy9DpvmDXnalpv80IXFvlIy3315k62+VL63Evsk
 smYf5iN6gZM3ZNQH2ltu2gqlH9/8101fhfkfEgu1qKVoBWBVVGs211Lm9ZMAa34To9Ui
 MCV26XKnFznysxHdUdsQMo0Vw8fcaGAWeoCl2Udtqbm5qN6eTCWlBkIu4jdZ1z1JSTLV
 wgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2kpzoSN5frXUNS/YnvoqX3GwlgAgZ4V3+f4wTeNprg=;
 b=uO29ZBKaYnfugjhRtUSHRPRfha8WhUXNGM4dQeaHNOEJ8tEHxtmJpL+OzXIrunvxkh
 HhczWAv0UyjASgZgxqJ1qmL4kbWOstEP7spnSpO/FY8wAvbOqh3BbHdweXoRFKP4USoA
 d/ufwj+VFTpmjmHMpaxTAqvFea+dgQ/NhW7KxDU8vDxjivLQntf8uoVZqLlHbO6U3+ks
 857LZ4JwTStmAuqDol78mI73423WiYHVcppL8V80How1rlheW3BANknlqlVQrrQrBSIC
 J9ha+gAYcIvcHCFTFBu9FAuq+jKdTGDejlkb9NUaaRhHRkI5yz6hlRhcBo2aV3njRoXJ
 h6fA==
X-Gm-Message-State: AFqh2krMEG8RtZPEMUFZoEbm+Z3DfRuKM1QpTvULVrHekU56pUz/ih/O
 CKwWSwPA/2YMHa9AAsdGepGDRg==
X-Google-Smtp-Source: AMrXdXtnXkhIZquwJZf1edTcxpn8Eid7e+zQ2EKGi4DGzVpvnPe2KBbQpWlzcPf9p/h/CBiNyBhDGg==
X-Received: by 2002:a17:903:3287:b0:192:e0ab:a4a2 with SMTP id
 jh7-20020a170903328700b00192e0aba4a2mr15422001plb.51.1673145447968; 
 Sat, 07 Jan 2023 18:37:27 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v4 06/36] tcg: Introduce tcg_target_call_oarg_reg
Date: Sat,  7 Jan 2023 18:36:49 -0800
Message-Id: <20230108023719.2466341-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 08 Jan 2023 02:37:43 -0000

Replace the flat array tcg_target_call_oarg_regs[] with
a function call including the TCGCallReturnKind.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  9 ++++++---
 tcg/aarch64/tcg-target.c.inc     | 10 +++++++---
 tcg/arm/tcg-target.c.inc         | 10 +++++++---
 tcg/i386/tcg-target.c.inc        | 16 ++++++++++------
 tcg/loongarch64/tcg-target.c.inc | 10 ++++++----
 tcg/mips/tcg-target.c.inc        | 10 ++++++----
 tcg/ppc/tcg-target.c.inc         | 10 ++++++----
 tcg/riscv/tcg-target.c.inc       | 10 ++++++----
 tcg/s390x/tcg-target.c.inc       |  9 ++++++---
 tcg/sparc64/tcg-target.c.inc     | 12 ++++++------
 tcg/tci/tcg-target.c.inc         | 12 ++++++------
 11 files changed, 72 insertions(+), 46 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 93d1331f93..092cdaf422 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -148,6 +148,7 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
                         TCGReg base, intptr_t ofs);
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
                          const TCGHelperInfo *info);
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot);
 static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
 #ifdef TCG_TARGET_NEED_LDST_LABELS
 static int tcg_out_ldst_finalize(TCGContext *s);
@@ -719,14 +720,16 @@ static void init_call_layout(TCGHelperInfo *info)
     case dh_typecode_s64:
         info->nr_out = 64 / TCG_TARGET_REG_BITS;
         info->out_kind = TCG_CALL_RET_NORMAL;
-        assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
+        /* Query the last register now to trigger any assert early. */
+        tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
         break;
     case dh_typecode_i128:
         info->nr_out = 128 / TCG_TARGET_REG_BITS;
         info->out_kind = TCG_CALL_RET_NORMAL; /* TODO */
         switch (/* TODO */ TCG_CALL_RET_NORMAL) {
         case TCG_CALL_RET_NORMAL:
-            assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
+            /* Query the last register now to trigger any assert early. */
+            tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
             break;
         case TCG_CALL_RET_BY_REF:
             /*
@@ -4563,7 +4566,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     case TCG_CALL_RET_NORMAL:
         for (i = 0; i < nb_oargs; i++) {
             TCGTemp *ts = arg_temp(op->args[i]);
-            TCGReg reg = tcg_target_call_oarg_regs[i];
+            TCGReg reg = tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, i);
 
             /* ENV should not be modified.  */
             tcg_debug_assert(!temp_readonly(ts));
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 2279a14c11..dfe569dd8c 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -63,9 +63,13 @@ static const int tcg_target_call_iarg_regs[8] = {
     TCG_REG_X0, TCG_REG_X1, TCG_REG_X2, TCG_REG_X3,
     TCG_REG_X4, TCG_REG_X5, TCG_REG_X6, TCG_REG_X7
 };
-static const int tcg_target_call_oarg_regs[1] = {
-    TCG_REG_X0
-};
+
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 1);
+    return TCG_REG_X0 + slot;
+}
 
 #define TCG_REG_TMP TCG_REG_X30
 #define TCG_VEC_TMP TCG_REG_V31
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 8b24481d8c..4e1d06dcd8 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -79,9 +79,13 @@ static const int tcg_target_reg_alloc_order[] = {
 static const int tcg_target_call_iarg_regs[4] = {
     TCG_REG_R0, TCG_REG_R1, TCG_REG_R2, TCG_REG_R3
 };
-static const int tcg_target_call_oarg_regs[2] = {
-    TCG_REG_R0, TCG_REG_R1
-};
+
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 3);
+    return TCG_REG_R0 + slot;
+}
 
 #define TCG_REG_TMP  TCG_REG_R12
 #define TCG_VEC_TMP  TCG_REG_Q15
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 6a021dda8b..ab6881a4f3 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -109,12 +109,16 @@ static const int tcg_target_call_iarg_regs[] = {
 #endif
 };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_EAX,
-#if TCG_TARGET_REG_BITS == 32
-    TCG_REG_EDX
-#endif
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    switch (kind) {
+    case TCG_CALL_RET_NORMAL:
+        tcg_debug_assert(slot >= 0 && slot <= 1);
+        return slot ? TCG_REG_EDX : TCG_REG_EAX;
+    default:
+        g_assert_not_reached();
+    }
+}
 
 /* Constants we accept.  */
 #define TCG_CT_CONST_S32 0x100
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 54b1dcd911..f6b0ed00bb 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -114,10 +114,12 @@ static const int tcg_target_call_iarg_regs[] = {
     TCG_REG_A7,
 };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_A0,
-    TCG_REG_A1,
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 1);
+    return TCG_REG_A0 + slot;
+}
 
 #ifndef CONFIG_SOFTMMU
 #define USE_GUEST_BASE     (guest_base != 0)
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 22b5463f0f..92883176c6 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -136,10 +136,12 @@ static const TCGReg tcg_target_call_iarg_regs[] = {
 #endif
 };
 
-static const TCGReg tcg_target_call_oarg_regs[2] = {
-    TCG_REG_V0,
-    TCG_REG_V1
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 1);
+    return TCG_REG_V0 + slot;
+}
 
 static const tcg_insn_unit *tb_ret_addr;
 static const tcg_insn_unit *bswap32_addr;
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index bf3812eb8d..d31e6c3de4 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -186,10 +186,12 @@ static const int tcg_target_call_iarg_regs[] = {
     TCG_REG_R10
 };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_R3,
-    TCG_REG_R4
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 1);
+    return TCG_REG_R3 + slot;
+}
 
 static const int tcg_target_callee_save_regs[] = {
 #ifdef _CALL_DARWIN
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index b961972b9f..7cfd35e753 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -113,10 +113,12 @@ static const int tcg_target_call_iarg_regs[] = {
     TCG_REG_A7,
 };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_A0,
-    TCG_REG_A1,
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 1);
+    return TCG_REG_A0 + slot;
+}
 
 #define TCG_CT_CONST_ZERO  0x100
 #define TCG_CT_CONST_S12   0x200
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index d65cd79899..cebf180777 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -390,9 +390,12 @@ static const int tcg_target_call_iarg_regs[] = {
     TCG_REG_R6,
 };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_R2,
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot == 0);
+    return TCG_REG_R2;
+}
 
 #define S390_CC_EQ      8
 #define S390_CC_LT      4
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index f6a8a8e605..9b5afb8248 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -133,12 +133,12 @@ static const int tcg_target_call_iarg_regs[6] = {
     TCG_REG_O5,
 };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_O0,
-    TCG_REG_O1,
-    TCG_REG_O2,
-    TCG_REG_O3,
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot <= 3);
+    return TCG_REG_O0 + slot;
+}
 
 #define INSN_OP(x)  ((x) << 30)
 #define INSN_OP2(x) ((x) << 22)
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 633345d74b..cd53cb6b6b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -200,12 +200,12 @@ static const int tcg_target_reg_alloc_order[] = {
 /* No call arguments via registers.  All will be stored on the "stack". */
 static const int tcg_target_call_iarg_regs[] = { };
 
-static const int tcg_target_call_oarg_regs[] = {
-    TCG_REG_R0,
-#if TCG_TARGET_REG_BITS == 32
-    TCG_REG_R1
-#endif
-};
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot < 64 / TCG_TARGET_REG_BITS);
+    return TCG_REG_R0 + slot;
+}
 
 #ifdef CONFIG_DEBUG_TCG
 static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
-- 
2.34.1


