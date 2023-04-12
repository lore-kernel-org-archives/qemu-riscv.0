Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYtf-0005yK-Bi
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtA-0004r7-VW
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt9-0002QG-72
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w24so977706wra.10
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299825; x=1683891825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d5xHxmaEOgXeHn2A8bHUUouqfxAhC2pmFZSPjP/T4RA=;
 b=iUFz6FMNJKOwmKWjet0a5BDbOC5RP1/hvbzKia/CJNC51T0WUDnyNUtoW2yCKYdG8O
 m9+SPinDpvdG9KU4qwEsJXozVJJF3CB2pLxyf52CXZfL6P6v0TELHRmsAb6YdGi8LIxY
 EMi2CzNH8ZtBzDKlvukANZENiWe1qZ3OosWsTwKBlU3R+I7gkPs/kgP394NMeCHNluCQ
 JTuW+gLChrF134ow9A0WVK33F0rlXQYMyDXJ7VuBLjaF1d8y2YHUmGK8M+3w5OzikwW8
 5bms+kTZrBUl2Q5joojdDXJs1Q0C0k+KF9UavbY1sC/MhaoYAD6PGOsOqrNibK8kymKF
 0M5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299825; x=1683891825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d5xHxmaEOgXeHn2A8bHUUouqfxAhC2pmFZSPjP/T4RA=;
 b=NfjmC8189VDwy4G32ABP9yZvmZLIKeYvfY6yHbz+YKSRnHQI0V43iBRi485msSCbZN
 r38tq6xJWzilCXLrOJpeqL1nRxd/jJkijehVq5eAcurhFr82LH9y62hydkptEH0g0fff
 O+fB1mgpioMv5xWlhAZOevNJnd7IXEUHQpOONSew1DVqR9LR7fFrmRC1J03+n8Ms1JNS
 hWQ/fnVrMDSLV1T9ZKC9L279RpuCrJJ9IZKlcyU1zs1kzaEl1Z8RdhzMUvlewyRu5a4/
 tzBxTXaJzQ0A1mUrIzDWTyhW3flUZ7gQtRTmDG0ZP0kdwxrw9GPU0faU6VqRTOMLWMu3
 Q1HA==
X-Gm-Message-State: AAQBX9duOu+ewQAsPjn11OW2eFdTlxJEumgiqqQwPoIaBsWUg0rLFsZe
 KOW0K8kOXlnfl7gCDuAv8I0inQ==
X-Google-Smtp-Source: AKy350bLBhl9BslDvEm2ceQ7VV35OyNiP7h9WSARfXDPMzm2Xqp/2OwFdygK0G62N60tAWZ+/pRrJQ==
X-Received: by 2002:adf:e34c:0:b0:2e5:a86c:fe74 with SMTP id
 n12-20020adfe34c000000b002e5a86cfe74mr8403377wrj.51.1681299824828; 
 Wed, 12 Apr 2023 04:43:44 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 11/25] target/riscv: Rename MMU_HYP_ACCESS_BIT to
 MMU_2STAGE_BIT
Date: Wed, 12 Apr 2023 13:43:19 +0200
Message-Id: <20230412114333.118895-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 11:43:49 -0000

We will enable more uses of this bit in the future.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-12-richard.henderson@linaro.org>
---
 target/riscv/internals.h  | 6 ++++--
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/op_helper.c  | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index b55152a7dc..7b63c0f1b6 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -27,13 +27,15 @@
  *  - S                 0b001
  *  - S+SUM             0b010
  *  - M                 0b011
- *  - HLV/HLVX/HSV adds 0b100
+ *  - U+2STAGE          0b100
+ *  - S+2STAGE          0b101
+ *  - S+SUM+2STAGE      0b110
  */
 #define MMUIdx_U            0
 #define MMUIdx_S            1
 #define MMUIdx_S_SUM        2
 #define MMUIdx_M            3
-#define MMU_HYP_ACCESS_BIT  (1 << 2)
+#define MMU_2STAGE_BIT      (1 << 2)
 
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index abf275d2c6..291a1acbf7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -593,7 +593,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
 {
-    return mmu_idx & MMU_HYP_ACCESS_BIT;
+    return mmu_idx & MMU_2STAGE_BIT;
 }
 
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 663382785e..a5de3daee7 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -437,7 +437,7 @@ static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 
-    return cpu_mmu_index(env, x) | MMU_HYP_ACCESS_BIT;
+    return cpu_mmu_index(env, x) | MMU_2STAGE_BIT;
 }
 
 target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
-- 
2.34.1


