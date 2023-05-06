Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvCGD-0004qn-9L
	for mharc-qemu-riscv@gnu.org; Sat, 06 May 2023 03:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGA-0004n9-Ng
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:14 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFp-0004Sr-4P
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:14 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3062c1e7df8so1731515f8f.1
 for <qemu-riscv@nongnu.org>; Sat, 06 May 2023 00:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357771; x=1685949771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/zSZo4J7v0p5c8aMIcv0bwGQ0NvaaNKP+yN/zUi81E=;
 b=rdirzeBmzWy7b77uv9eRgwWMPlRCnj5tkHB8XBQyOZUBEV+8dhTxdFQUxGR8HMj1tI
 TLO/Egd2knFHhSmC3Uoj/tIAlZccpOwZ/vLoXaCV8Ay9QaZchaJerI7+RHQIR8UXRq6S
 IHhq6LM9hlzylwOuiYYZgrqDyLZiSN4DM+pVuxrmelUpeiU6491sKRoLbqaXugI4IKA1
 nyxaLJQ2UISSHslQEu4h8Kt5qYoQrBRqV1iUe/z7u5DNo0HFEpBvr+z1wuhq+JTPh+L3
 8tx+KBWgUD4pJ8eIEV2s5oXNU6dTXWNuZCLP2tdyuTi8zq7J3wYtYDJXmvMOMbQnbllB
 k6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357771; x=1685949771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I/zSZo4J7v0p5c8aMIcv0bwGQ0NvaaNKP+yN/zUi81E=;
 b=SZX3nG/7Axi0/tv5c6G4ayyRvGHd1YWwtFDHFDd9BmstRBRuzq+n3ICcMEjIBTSTyw
 3BbOP9tfXbKWoLfwGe8wZDcZAMfQ8r53EbnWck7Urm7S2DmIB7dYT4RBLCQvyCDgjomz
 ReVg0NF2QfbPlYhzAvYHeGnVJ26gftyM5Y/HjyggSX40+4tL3zSGvK1oUrjshKxagkDu
 Ur6NQkVS3PUzs+Xgms51ml+O6wRPAU4HL8qnCZoG6kKqgxfSRyF5Zu09J/L5arC16jbm
 Jsq1lngCtGOwQooLLhfhpBHyWaM1C2gaGP2FgS+vXNUK+Pr3q/R8EEhqRZ4DXDwW1ZAl
 J1Aw==
X-Gm-Message-State: AC+VfDzIUAvQ1pENVJH7wJiFRZ8OK6uldYHIlbr8YBp9Zqyt89Y0NGLt
 ovKA7c2GIDt7VTnVftCgH5RP3A==
X-Google-Smtp-Source: ACHHUZ5O55VR7LN+C53N7nuDehZANlZj3InMGmivqzbYYN9/9X8vMjbet+dzwpW+jywKZ7HciojAcQ==
X-Received: by 2002:a5d:6183:0:b0:307:7f38:37f with SMTP id
 j3-20020a5d6183000000b003077f38037fmr2933451wru.66.1683357771749; 
 Sat, 06 May 2023 00:22:51 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 20/30] tcg/loongarch64: Simplify constraints on qemu_ld/st
Date: Sat,  6 May 2023 08:22:25 +0100
Message-Id: <20230506072235.597467-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Sat, 06 May 2023 07:23:15 -0000

The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
we can allow any allocatable reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  2 --
 tcg/loongarch64/tcg-target-con-str.h |  1 -
 tcg/loongarch64/tcg-target.c.inc     | 23 ++++-------------------
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 172c107289..c2bde44613 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -17,9 +17,7 @@
 C_O0_I1(r)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
-C_O0_I2(LZ, L)
 C_O1_I1(r, r)
-C_O1_I1(r, L)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
diff --git a/tcg/loongarch64/tcg-target-con-str.h b/tcg/loongarch64/tcg-target-con-str.h
index 541ff47fa9..6e9ccca3ad 100644
--- a/tcg/loongarch64/tcg-target-con-str.h
+++ b/tcg/loongarch64/tcg-target-con-str.h
@@ -14,7 +14,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 60d2c904dd..83fa45c802 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -133,18 +133,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 #define TCG_CT_CONST_C12   0x1000
 #define TCG_CT_CONST_WSZ   0x2000
 
-#define ALL_GENERAL_REGS      MAKE_64BIT_MASK(0, 32)
-/*
- * For softmmu, we need to avoid conflicts with the first 5
- * argument registers to call the helper.  Some of these are
- * also used for the tlb lookup.
- */
-#ifdef CONFIG_SOFTMMU
-#define SOFTMMU_RESERVE_REGS  MAKE_64BIT_MASK(TCG_REG_A0, 5)
-#else
-#define SOFTMMU_RESERVE_REGS  0
-#endif
-
+#define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
 
 static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
 {
@@ -1541,16 +1530,14 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st32_i64:
     case INDEX_op_st_i32:
     case INDEX_op_st_i64:
+    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_i64:
         return C_O0_I2(rZ, r);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rZ);
 
-    case INDEX_op_qemu_st_i32:
-    case INDEX_op_qemu_st_i64:
-        return C_O0_I2(LZ, L);
-
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
@@ -1586,11 +1573,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld32u_i64:
     case INDEX_op_ld_i32:
     case INDEX_op_ld_i64:
-        return C_O1_I1(r, r);
-
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
-        return C_O1_I1(r, L);
+        return C_O1_I1(r, r);
 
     case INDEX_op_andc_i32:
     case INDEX_op_andc_i64:
-- 
2.34.1


