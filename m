Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvCGZ-0005u7-CQ
	for mharc-qemu-riscv@gnu.org; Sat, 06 May 2023 03:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGW-0005jF-MV
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:36 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFv-0004Xr-Bm
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:36 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e25fso1737094f8f.0
 for <qemu-riscv@nongnu.org>; Sat, 06 May 2023 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357778; x=1685949778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4FwbXCfJhxIqyab8rUpzADm0cxrqrrSpiPKuK+rasgY=;
 b=q4NPOj9/E+zXYe/Zd3aMwxW38WnbsUv/LrnxjyrUyqRetTj8CpVgMTLPp93IC2Jc0Z
 OKy2/Ct/HVz4Ci56jwggj0kV1ij0MuPSOqlRgTS2Yei0rtwINNDKxjn+D4YUx96jJUTC
 k7DYbjOvQfJHKng5G6jhsNshWFwIyaB0YokThGDvwSOozkkcG+N9sLguhbAY0qooRjYV
 +siGncxgkENvCkBcRRZjXkNuRW0NAeduVpVpVUwlCOTxzy4M92QqNjwU5cGdSFuMPWsd
 y/MiUJbc7s1jk7NZqWpuM2bLI3BNlegW6L5GtLje110xN65kK/cnbvnqZd1zNFbvy0L5
 hsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357778; x=1685949778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4FwbXCfJhxIqyab8rUpzADm0cxrqrrSpiPKuK+rasgY=;
 b=G2C8UikorM93SahbpThYQ0amfj1Kxh3AIodgKDm4KVgXxotiovuIZZgSB+t7YbpG//
 9p6T97M97T8oPbhaAcYnFZtzSrHXYVQ9KEK/jlIAcpnztXxBLZYuGlEypuI+xdvFTGRh
 m68vg1ZFauhd/RtWHGLSD1UDsu6rJLWfyMr4AbOeDjMoyu2g2UyIQ0ab3IaLRoFUcXcm
 BTQKz1D6LLibp5HcTTISgEwBqhV7uyvFfL0KYqd9dsHjARwhJMD8kwlaq5DJ4xFmacu8
 ytZDfUmGdp8eNiJn+ShMSGVErrcNqIXvL/ReeS8RuhYd1LSbJZ/6y5tOGS9dIjdfsIUe
 pclw==
X-Gm-Message-State: AC+VfDyqyiBF+k+Slp2WxLmgtszmvvBL0i4/VsmZOf+VRZa4QX6Y8OTF
 kgSHwU575tvq49AEHbBuOpejPQ==
X-Google-Smtp-Source: ACHHUZ4OXtX7ABpVOie++W8GF2F6Gp1/PJd1+WNRKcfP98KZSA6+0qKlpCMt0xL2P5gKYFnnKrhCTQ==
X-Received: by 2002:a5d:6801:0:b0:306:2b64:fd1b with SMTP id
 w1-20020a5d6801000000b003062b64fd1bmr2828134wru.52.1683357778081; 
 Sat, 06 May 2023 00:22:58 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 28/30] tcg/riscv: Simplify constraints on qemu_ld/st
Date: Sat,  6 May 2023 08:22:33 +0100
Message-Id: <20230506072235.597467-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Sat, 06 May 2023 07:23:37 -0000

The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
we can allow any allocatable reg.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-set.h |  2 --
 tcg/riscv/tcg-target-con-str.h |  1 -
 tcg/riscv/tcg-target.c.inc     | 16 +++-------------
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
index d4cff673b0..d88888d3ac 100644
--- a/tcg/riscv/tcg-target-con-set.h
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -10,10 +10,8 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
-C_O0_I2(LZ, L)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
-C_O1_I1(r, L)
 C_O1_I1(r, r)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
diff --git a/tcg/riscv/tcg-target-con-str.h b/tcg/riscv/tcg-target-con-str.h
index 8d8afaee53..6f1cfb976c 100644
--- a/tcg/riscv/tcg-target-con-str.h
+++ b/tcg/riscv/tcg-target-con-str.h
@@ -9,7 +9,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index c22d1e35ac..d12b824d8c 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -125,17 +125,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 #define TCG_CT_CONST_N12   0x400
 #define TCG_CT_CONST_M12   0x800
 
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
+#define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
 
 #define sextreg  sextract64
 
@@ -1600,10 +1590,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
-        return C_O1_I1(r, L);
+        return C_O1_I1(r, r);
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
-        return C_O0_I2(LZ, L);
+        return C_O0_I2(rZ, r);
 
     default:
         g_assert_not_reached();
-- 
2.34.1


