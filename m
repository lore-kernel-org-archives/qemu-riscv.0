Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2XS-0005il-8h
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 07:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2XP-0005ec-JY
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:58:23 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2XN-0002TK-MF
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:58:23 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5419d4c340aso81913617b3.11
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 04:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4rfLgFNzYBP18XOZQ9r8lBQXEnzeUKDygCPE/LFPAk=;
 b=tnUV+pMk4b//Rh01CMFrWFrtA2ffdZ7WNWewK7yVnf9bd86BPN0CWLidYi/wuxmjBP
 3gcrd+9fEtwp1zlpbU815ParntoJ6Vlul4X9e0d7jbhle+9u22PL5v6bFKvw244EAa7I
 ibqLDbz4JiOL2YeFfyMpUHnlFqCN4fn0yyHCrKGI+xSDmZgOKhqhzpN8z3DbG95tBoRN
 pyiiPsfrAWXaxkBfQcycEhKbBTGoeYViCbC+JTyCD6vW+r/VMLT9wNvU9Qvw190vmPeW
 ze7lscaCZHaN0p7ge7KDl+UaZt42YUHIbzYHD3ROKqitoD8evH9z4CjokX78i/Cy7wjp
 ukfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b4rfLgFNzYBP18XOZQ9r8lBQXEnzeUKDygCPE/LFPAk=;
 b=CGuON5e4xyYkD0z0vSZQ1x7qDdvglriC5TOvVYZ7mrxppcdTZpSDfofb38nHvucJbv
 SSHeGFH0yevxu36qCa/iFJwFNiyrKOBbrV9YY55w3QpAuY4hFtJZ5nGW545QQNF3wp+7
 Q/IQzW6wD5DLiSo0JcoSFkig3McGR6L5yFOIb8oJl7TjEw4zPMcyK4ymKtobyBLY20mL
 lnBG6iKO5+ouzvZf872H450xgPkCda4DKu6fEqUcVcZDBkPGEuAzMvfFgQD9Vzt2tS8J
 nj/UD3K6cfisTAaABHOoUtPa7tG+M9khJ8FIRgnaFabPkrELtSRUymapXM7QbkZpH34V
 IMLg==
X-Gm-Message-State: AAQBX9cxAeLR4nvot6zdSmxZZeSbu2PqCmsdwUwkIsGOiHKP5qPzXFa8
 gtXeNGeod+ufYDAjGpf7Xkjfsxwl1pGH+cAw/aE=
X-Google-Smtp-Source: AKy350Yi4SAePNRJRWkI83rJpPRmv1gdDdL94w0WjaWGrqsBq5qg4Bj2WnjiD3DeL4EEvBMr6C9Tww==
X-Received: by 2002:a17:90b:298:b0:240:c4c:59ea with SMTP id
 az24-20020a17090b029800b002400c4c59eamr11732915pjb.11.1679741683043; 
 Sat, 25 Mar 2023 03:54:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 14/25] target/riscv: Introduce mmuidx_2stage
Date: Sat, 25 Mar 2023 03:54:18 -0700
Message-Id: <20230325105429.1142530-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1132.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 11:58:24 -0000

Move and rename riscv_cpu_two_stage_lookup, to match
the other mmuidx_* functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        |  1 -
 target/riscv/internals.h  |  5 +++++
 target/riscv/cpu_helper.c | 17 ++++++-----------
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f03ff1f10c..b6bcfb3834 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -586,7 +586,6 @@ void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
-bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                MMUAccessType access_type, int mmu_idx,
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 4aa1cb409f..b5f823c7ec 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -51,6 +51,11 @@ static inline bool mmuidx_sum(int mmu_idx)
     return (mmu_idx & 3) == MMUIdx_S_SUM;
 }
 
+static inline bool mmuidx_2stage(int mmu_idx)
+{
+    return mmu_idx & MMU_2STAGE_BIT;
+}
+
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index cb260b88ea..8a124888cd 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -603,11 +603,6 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
     }
 }
 
-bool riscv_cpu_two_stage_lookup(int mmu_idx)
-{
-    return mmu_idx & MMU_2STAGE_BIT;
-}
-
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
 {
     CPURISCVState *env = &cpu->env;
@@ -791,7 +786,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
     /* MPRV does not affect the virtual-machine load/store
        instructions, HLV, HLVX, and HSV. */
-    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
+    if (mmuidx_2stage(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
     }
 
@@ -1177,7 +1172,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 
     env->badaddr = addr;
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
-                            riscv_cpu_two_stage_lookup(mmu_idx);
+                            mmuidx_2stage(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
@@ -1203,7 +1198,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     }
     env->badaddr = addr;
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
-                            riscv_cpu_two_stage_lookup(mmu_idx);
+                            mmuidx_2stage(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
@@ -1255,7 +1250,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
     /* MPRV does not affect the virtual-machine load/store
        instructions, HLV, HLVX, and HSV. */
-    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
+    if (mmuidx_2stage(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
     } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
                get_field(env->mstatus, MSTATUS_MPRV)) {
@@ -1267,7 +1262,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
     pmu_tlb_fill_incr_ctr(cpu, access_type);
     if (riscv_cpu_virt_enabled(env) ||
-        ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
+        ((mmuidx_2stage(mmu_idx) || two_stage_lookup) &&
          access_type != MMU_INST_FETCH)) {
         /* Two stage lookup */
         ret = get_physical_address(env, &pa, &prot, address,
@@ -1365,7 +1360,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         raise_mmu_exception(env, address, access_type, pmp_violation,
                             first_stage_error,
                             riscv_cpu_virt_enabled(env) ||
-                                riscv_cpu_two_stage_lookup(mmu_idx),
+                                mmuidx_2stage(mmu_idx),
                             two_stage_indirect_error);
         cpu_loop_exit_restore(cs, retaddr);
     }
-- 
2.34.1


