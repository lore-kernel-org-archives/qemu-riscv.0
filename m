Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2UB-0000JI-9j
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 07:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2U9-0000IK-Pn
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:55:01 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2U5-0008Fx-Ag
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:54:59 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id 59so3326210qva.11
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1C7JBeZYsSuK59INs65mEH6x0tpxz6ymfYLghIcQtMo=;
 b=tRCmXGSBUWFoLKyGSxrAgfCsAT1jrprXm1ZnharEOSQO68Fp59t1yR9yDk8/P3o6ep
 VHnZFPFHeRZ9xMUr3lwBY2Z1XICxhyfacuDG6BsnJGZiSvYOZnbASLxYIInv6jaI+Vlo
 lwaTlFq/8WepbA0fp8atkqgGl4pqjIaAy7FOB6yAmHa34944m6wBx0yclbOPbfp7XVit
 LUuJV0iQo8vPyqSLxqSeDVMqqTsdpoIv1tST9ewumciCwf3LVL+kME+1Z9GUDJxZ+fPY
 8vytAbbEjdZNtkHb/j1nMzt6LsgI1A0Ryr1zignT99p+tWSc28mbohwHq5MS5LnONfXs
 RvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1C7JBeZYsSuK59INs65mEH6x0tpxz6ymfYLghIcQtMo=;
 b=yHmSvF29aNJUgniDgi5Dso6IAU36Bj5hJLg1SC7gxBLwk3IiUQDNEqwh2KAGhP/Z56
 pAN++Pp3thMA4cOQfsmfj54eJq/Hv5E/UqMqnkKci1YgM71W4nwK2yvbD/V3g7HCr03Y
 5wo/5J2RuuD3ZfIUttRSna9HH3FxJY7vR0AUh8YBsg0uxnaL5gm3F4HAcHGY8FY7sFMA
 /v2EXr3kua/IuOguQw91Q68a91HJT/i3hzy2O515XLcgn+KZKRpORfWv0ZRKnljszYLh
 4oSiqomoTQPs+oaKr2NaEf/vdF6GbHT7Pgi0MccHlbeJtOYlHaMVNKul+c+A5qOPgO0Z
 18/w==
X-Gm-Message-State: AAQBX9etiavU3gQ8iUM42YI/NfT2rkCv+bpiz7+X3rPMEAZAVCxp4u3n
 8e+KIOok7b71epBvbP5tze3sVrm9+L9kcFTzSCc=
X-Google-Smtp-Source: AKy350a7iHLuYtQjT9nTWuNwG2rzKCrE+LgKXPSBmYEY6hnJrlMSP8MFUMiBsNWGnaMxg2aSZQSRjA==
X-Received: by 2002:a17:90b:4a45:b0:23b:d506:226e with SMTP id
 lb5-20020a17090b4a4500b0023bd506226emr5973974pjb.42.1679741680473; 
 Sat, 25 Mar 2023 03:54:40 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 11/25] target/riscv: Rename MMU_HYP_ACCESS_BIT to
 MMU_2STAGE_BIT
Date: Sat, 25 Mar 2023 03:54:15 -0700
Message-Id: <20230325105429.1142530-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 11:55:02 -0000

We will enable more uses of this bit in the future.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 9bb84be4e1..888f7ae0ef 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -605,7 +605,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
 {
-    return mmu_idx & MMU_HYP_ACCESS_BIT;
+    return mmu_idx & MMU_2STAGE_BIT;
 }
 
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 0f81645adf..81362537b6 100644
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


