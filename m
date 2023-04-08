Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyZS-0001Xr-TZ
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyZ8-0008WT-U0
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:36 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYR-0005dY-FV
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:34 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 j14-20020a17090a7e8e00b002448c0a8813so4739234pjl.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3QvbuMmLJFN66+AgerJ4hDVUqG975uEhSCFouk7XB4=;
 b=ZdSWsa6ERlfHiTwam0IQTYjTL62Eq74YZIMXCeXBvP/ME89ZlRUlqB5ZFbNJbov+ZE
 Q+1LDauE8R/aoEm/zXUFr5e1Fxq62FVH+RSJo/Zkmy85AyNU+Xv5midE3bZJLqlOLPsX
 R5qwJ9id6YPcJpTvGNNV/6oda6uPWUuKBFE6Kd+rUIowu6FTFMLUavvHTcUa3qbU/J/c
 pvXg5PV/0VGP/fUSbAjM273gK+FaKTrqBCjxe+Ghqes88VS5CV6YNWO+2AnonpPbm069
 JABdgPdYNXOCSRjcsF0ArTCnDxYIAAqcgp0irOu4jdPTmXWuOmQGUkyz+2WcN1/vAd/3
 /4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3QvbuMmLJFN66+AgerJ4hDVUqG975uEhSCFouk7XB4=;
 b=q5RZpPQh8W5IQD9OZNmhvpzf7zJMUE4xb9Nih1d835OMaFlGf54rFRK47dwGKocKLg
 N8jDpQV39gxMDSJgIZDKypPgzHDhJNX1tppIcvRc8oN4eZ0ZcbePKAfDrWmka0pC2OYF
 OeQnuUNpn3W44Gef2mkMdgmIj0DlN9gpMWsti3IwNbzyg96NAQTUWAnlul7o80wqMom2
 OLQ5LOZrKbGuGm/cn8l+bCyX/LwNCcKkUQQgoFKIOFKc+I5QzbL4ApyWeX3JljatKjna
 HkJK0wewxqo/aXKqOHOkdy08UWeSxgGZycsFrOclf0EDCJ96jO87+ZDIornfldMVK5ae
 FTAA==
X-Gm-Message-State: AAQBX9fGD6rqDeNz1F2TgwD5X5e3Z8+/CiJfwlONDbrLsgMZKpRMNvEb
 PkU+OBtc99UrHhwuVnSLsbpWng==
X-Google-Smtp-Source: AKy350avgOZzqLI0Z4wOlxccbqMIa01nBBS+jFX/TE/+7qVLZl3AyexzbX/1iI9oW1adtGPYCuPfZA==
X-Received: by 2002:a17:902:ec83:b0:1a1:dd05:39fe with SMTP id
 x3-20020a170902ec8300b001a1dd0539femr823556plg.4.1680921830263; 
 Fri, 07 Apr 2023 19:43:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 38/42] tcg/riscv: Simplify constraints on qemu_ld/st
Date: Fri,  7 Apr 2023 19:43:10 -0700
Message-Id: <20230408024314.3357414-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:44:43 -0000

The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
we can allow any allocatable reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-set.h |  2 --
 tcg/riscv/tcg-target-con-str.h |  1 -
 tcg/riscv/tcg-target.c.inc     | 16 +++-------------
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
index c11710d117..1a8b8e9f2b 100644
--- a/tcg/riscv/tcg-target-con-set.h
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -10,11 +10,9 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
-C_O0_I2(LZ, L)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
 C_O0_I4(rZ, rZ, rZ, rZ)
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
index ab70aa71a8..45a4bc3714 100644
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
 
@@ -1654,10 +1644,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
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


