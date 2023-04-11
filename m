Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Wv-0006R4-8l
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wj-0005b9-PA
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:29 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wd-00027L-T6
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:29 -0400
Received: by mail-pl1-x62a.google.com with SMTP id o2so6263592plg.4
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pgPa5sFpfmtXQ6QYSfFyNkO0K0o+o8ysnES6ma8G0mI=;
 b=hZM0A86joJdjO8KqnAdnB4fJTOdEuM0XToARjEgsXc3gy31s7RfKEZWaIjWCwfPFk8
 x2hmzOGarVvzU79aGB8kfGtamT2xzbzw1tz38Ssq8AYxiWt7e01b37UtqrBV6WoRwvCb
 oNX1iVczEUvx8A6cv2RpkUV02Wtc1ArRq0ru04fruM6499NrDk3g5P855ne3GmPlNme0
 DXYsHTXwhdFNGz+/M2kmYIFMDjQCP4zA0lMyme43AeMlPT788HiQydD9qov359O55FNC
 2F6q8fRxgQLi48FvDuaJCiTwllU9mFZEN5aPLqw19jrvvMYljMWWLcbMn5uaqWyB51hS
 UItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgPa5sFpfmtXQ6QYSfFyNkO0K0o+o8ysnES6ma8G0mI=;
 b=LXbpGiBqCPjf9n2AbhLiLfrg6pMhEPKwD0CnZ4KQtUzYJq60lEdFa32wW4b7y2nnfj
 hu0rkeEXiZ0q13K8cIQ/CwXHmbBGA/F1Hl2HGZ6NK2ub5IS0EDYzamyQAVhtJ66zzfE8
 6kNaolprq8SBcU2Ej/bYjNvsABbK9FKYciOTftIqZ1s8avJcpzFbr5clYed0XB0Os20d
 8MUd17jfj9ay6nBk5UwCp+natJx/evTrqbqCBIO+MnwxIcrtOUsvGCxv27Rk7Zy6hx7K
 ln2nfMLMAJTOlGDTElKtUWWqOlcyNWAAFFllpVcPtXdlAZwa90UolmKwiq9DDYpBAQpS
 FMUA==
X-Gm-Message-State: AAQBX9fQOl4ObJBOfYYQvD15ab+94akiJlGxcHlS1J3zKpZEl9t7y6QC
 38cQ9zqQt1cZFf105sdfHVSxGA==
X-Google-Smtp-Source: AKy350bOhgaurpwgcqT4K1eqdc2LssCFrnCvP+w1tjlRTeGkwG8VfsHgA0HAcX9a7ic61OqMdUO8/A==
X-Received: by 2002:a17:902:c952:b0:1a0:53b3:ee87 with SMTP id
 i18-20020a170902c95200b001a053b3ee87mr11512158pla.62.1681175422384; 
 Mon, 10 Apr 2023 18:10:22 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 52/54] tcg/riscv: Simplify constraints on qemu_ld/st
Date: Mon, 10 Apr 2023 18:05:10 -0700
Message-Id: <20230411010512.5375-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:10:30 -0000

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
index 425ea8902e..35f04ddda9 100644
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
 
@@ -1653,10 +1643,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
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


