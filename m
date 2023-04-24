Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqp3A-00038p-8k
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0V-0006De-7v
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:45:16 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0F-0005JT-QY
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:44:57 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19ab99540so16202285e9.2
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315074; x=1684907074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/zSZo4J7v0p5c8aMIcv0bwGQ0NvaaNKP+yN/zUi81E=;
 b=aXXTkZMsBBpm742Z1RSsJqqFEEWUOaCHiteadUsrw+nYbF4G+sWYbu+YTB5KCORFxm
 psy4w3rmeAcjNza7vc2ivHMRriG3Cd/8+dxVIPVoYnAIDYXUBsSPbqoTRDpbPOUzoe2J
 iAvLfLreLvtdQansUFHRdSgAJr6KTNZ0CIDrKymy6nZHMx3fvkzGQm6A1Y6g5mUBFywr
 yps684vRpmbZY2W21Je2C+dT92FHh9U792BtWZmmuUlVV7dTL8nAnbhzP13wieMPyQGh
 jTzALGiW8KJs9bu7K2SOA9WOv1amIPKZ+qB/8JhUG8dCzRbBCk4vlAPTY03wQ63GjSbU
 nVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315074; x=1684907074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I/zSZo4J7v0p5c8aMIcv0bwGQ0NvaaNKP+yN/zUi81E=;
 b=WirqW5b5AZD7jlPYvs7kkm+9sanvC+aPsqx1FqrnwCyYCUA29dHn1+PJpGgdlk2S/Y
 fKC8DawpaQjigRFev7/KZ7AMRqYN3OWTAX/VFAPGLd1T7uoagMakTgLsAzITgUosaEEs
 De9O9zZeKh90gBCw6nCYSu+ySYbl1tx94chnFA3M+yEm3R3P2AVFxE4PtlzYkV5YXyRy
 89I6CFLGz+vCORsoeLCSdos3dlYYpm3EA+JmXxMOYeanem1wmNO/IX/t2I1mEk6vZ84z
 E7kBypo55sJv1jwie66wbmgAfZPdFXAc4bS/3v0jQkKbk4RDaydhAlZIt+ux9805qLis
 quLQ==
X-Gm-Message-State: AAQBX9cPEF/h/DKq9GFK/K1SQ8meRUnlb3kKF72HwTwnn5lgNSobLxsy
 2iTyvJtFmrwtrV+OjcZf+cPCmw==
X-Google-Smtp-Source: AKy350aoBfINHni9q0yvD+Er5kTUinmfH8vzEUfRMwAxhiujMY6VnoEFjgXuXbGyw585OmCV0M+xUw==
X-Received: by 2002:a05:600c:3783:b0:3f0:a9b1:81e0 with SMTP id
 o3-20020a05600c378300b003f0a9b181e0mr6822091wmr.19.1682315074448; 
 Sun, 23 Apr 2023 22:44:34 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 48/57] tcg/loongarch64: Simplify constraints on qemu_ld/st
Date: Mon, 24 Apr 2023 06:40:56 +0100
Message-Id: <20230424054105.1579315-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Mon, 24 Apr 2023 05:45:20 -0000

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


