Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYtk-0006Yt-DW
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtG-0004x0-V2
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:57 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtF-0002T6-2t
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:54 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 j1-20020a05600c1c0100b003f04da00d07so2098555wms.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299830; x=1683891830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PGKLd4EHm+dCotYmJKaBamFgwpM99B3AQVGNyZFQsdk=;
 b=QTF9njU393ydPl4QfHDvoJ8NgV5kD34YNrIFg9uMEPMwLND7vtcYS1ztBKBHoV8Rra
 yr18xSt41U3ZmIq5oWfRiC6kgvNmaxGveqmJ+JDJrrKNqoCN4vcBRUaCQ3PSVbO1p4l2
 NLQBQeuPoJp01bzqcWfOlnJQqwM1bt43+Qk42yYYL4UkajtwzERtGKHZmERoLTHtoN5r
 ywdXXTVsdTteYGSaA9X7n6bsqpR9NoWBctkWth0t9kNIU5hN1YF99IwWL3RDgkWcGKwp
 u308NZDgO2Er+38tZPz6GxTLDovol7HMi04ZpM6WQM2CM/NSkQN5gY+h1UxsyCpnmRvA
 q0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299830; x=1683891830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PGKLd4EHm+dCotYmJKaBamFgwpM99B3AQVGNyZFQsdk=;
 b=YfjHhVyTkLanMX+p/Azp2R1EhobpP/syiYhqnAMFsMzQL8d7ST7lJLp94uTMyO9SFF
 Tl5myf7E74imVqaW1InjBWSwuk89H2wuIJewArNaf+XA6qX00N0KmOIgwMx+oGmo79Rl
 G28/CFHVyPWDUe/2Ow/rWFZIBhHO+6/+OMX8SAbR7skIejRCkbd5ZUjm/MyFFT4vrCjN
 tckzpO9lHIHjMutJJjTp5HNoZge0VfvY7DsWTxdr3XjyUGfxNyOfi3whQDh3TNo28MzU
 hXrVzd4J1BYiAnoatpvOaP6Oie/i8D3Jucngb8b9dsAC34HTSn/bgy4adITts6TDbXjc
 5gcg==
X-Gm-Message-State: AAQBX9cEeGTk72zsW4rso6yenN2UqbJQmKHGuAtVN3TCnxleJ0RsHfof
 dNa8WDEnX4U3FDHCGjwWO/qPeQ==
X-Google-Smtp-Source: AKy350YeXzl7vGOQWx8T/TR1r6n2rHEI+GalmJjZBEA1gBg95x4BcNd4fOyRlOM/UL+fFSgCz497dQ==
X-Received: by 2002:a05:600c:ad2:b0:3f0:7ddf:d8e4 with SMTP id
 c18-20020a05600c0ad200b003f07ddfd8e4mr1602192wmr.17.1681299830573; 
 Wed, 12 Apr 2023 04:43:50 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 17/25] target/riscv: Check SUM in the correct register
Date: Wed, 12 Apr 2023 13:43:25 +0200
Message-Id: <20230412114333.118895-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 11:43:57 -0000

Table 9.5 "Effect of MPRV..." specifies that MPV=1 uses VS-level
vsstatus.SUM instead of HS-level sstatus.SUM.

For HLV/HSV instructions, the HS-level register does not apply, but
the VS-level register presumably does, though this is not mentioned
explicitly in the manual.  However, it matches the behavior for MPV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-18-richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 12 ++++++++----
 target/riscv/op_helper.c  |  6 +++++-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index baa4b3a1d2..38bd83f66d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -42,11 +42,16 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 
     /* All priv -> mmu_idx mapping are here */
     if (!ifetch) {
-        if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
+        uint64_t status = env->mstatus;
+
+        if (mode == PRV_M && get_field(status, MSTATUS_MPRV)) {
             mode = get_field(env->mstatus, MSTATUS_MPP);
             virt = get_field(env->mstatus, MSTATUS_MPV);
+            if (virt) {
+                status = env->vsstatus;
+            }
         }
-        if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
+        if (mode == PRV_S && get_field(status, MSTATUS_SUM)) {
             mode = MMUIdx_S_SUM;
         }
     }
@@ -826,8 +831,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 2;
     }
-    /* status.SUM will be ignored if execute on background */
-    sum = mmuidx_sum(mmu_idx) || use_background || is_debug;
+    sum = mmuidx_sum(mmu_idx) || is_debug;
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 49c19d971d..66a9065a5d 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -437,7 +437,11 @@ static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 
-    return get_field(env->hstatus, HSTATUS_SPVP) | MMU_2STAGE_BIT;
+    int mode = get_field(env->hstatus, HSTATUS_SPVP);
+    if (!x && mode == PRV_S && get_field(env->vsstatus, MSTATUS_SUM)) {
+        mode = MMUIdx_S_SUM;
+    }
+    return mode | MMU_2STAGE_BIT;
 }
 
 target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
-- 
2.34.1


