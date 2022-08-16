Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oO5uU-000326-Bb
	for mharc-qemu-riscv@gnu.org; Tue, 16 Aug 2022 19:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5uI-0002pd-Er
 for qemu-riscv@nongnu.org; Tue, 16 Aug 2022 19:23:34 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5uE-0007hD-7N
 for qemu-riscv@nongnu.org; Tue, 16 Aug 2022 19:23:33 -0400
Received: by mail-pf1-x42b.google.com with SMTP id p125so10660652pfp.2
 for <qemu-riscv@nongnu.org>; Tue, 16 Aug 2022 16:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=n3v6FJqLLOlerI/jYaRiwEd1GAti8BA2jQEYwdsXZ+I=;
 b=VDvdjRZFTZSlvw3jOWr4MscotqBx7UOuB+ykjU3/2gysDeH5ixGCHb+TSUnuX6/c/o
 OVB7zt3PAcpZKiRVoW0KAacZsY5pVOOX2m02FKZThSm+jow/IO347UjOcKKCl8oB5Lqz
 aKu2KIrTTep1RurD/yZxC7JS/cdqXz85xtt+Jk7YiNe3n48WVSocg1tVNBrnsT5OKXZq
 Avt6oP7XCUaqrC0qk4UdAM+n1xSQNuzDm6Ih6Qp+6umcEO37krp34pJ9ngrrR2wpfISg
 /IkcYn2icyP0RWvaBqxJIf7ZlMkl3NuGDrLWQUG8EniT92ztCyI358C//lfnVxrHG8M9
 lrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=n3v6FJqLLOlerI/jYaRiwEd1GAti8BA2jQEYwdsXZ+I=;
 b=FNsRQnbKKllxcFZw3/EqvrlBkALEoj4ghuWDeT7yk4L2Ugrib3BblAztui2ee8OGnK
 lU6mC8jfTy3/rFhDP0cxVtr5j0rZjo/+s/xMNPS3d9HlABdsnZzkdnWQGD67rmiVwUaA
 g8d1fceXK0Fc6HpM7vbHuhdKmLjVz8gwrzjVdVwacc3PygMIUu4083HEtiqS1UYs+hca
 wyhOMjb60LGHwzM58Du0b8+DjcI5gfLTZJCPEzyGXLAsJEVtcbhhPV1a6bYPR+e9tuG6
 uemudQ0vngfN9CxvdGX1fq+n6FJeDtoFURO0PbqpNEem/d4XSn+GYm3EcDIRQZFzFaHz
 oc8A==
X-Gm-Message-State: ACgBeo3ADJpel54Xxma3xG4Limngm82s/xLbHhztO5F66cAJgLksZD81
 vfgzOg+OsHtb8/FftKhvSVpoUg==
X-Google-Smtp-Source: AA6agR4lNLYlrLiSepHvjWQzEcgHfI7op1DheG2yL6Jq6VkadQU/x/zesWra83Vo5mvpr1bqIVr6rA==
X-Received: by 2002:a05:6a00:180d:b0:52d:9bc0:2155 with SMTP id
 y13-20020a056a00180d00b0052d9bc02155mr23091445pfa.3.1660692208277; 
 Tue, 16 Aug 2022 16:23:28 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a17090a2c4400b001eafa265869sm78608pjm.56.2022.08.16.16.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 16:23:27 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v13 2/6] target/riscv: Simplify counter predicate function
Date: Tue, 16 Aug 2022 16:23:17 -0700
Message-Id: <20220816232321.558250-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816232321.558250-1-atishp@rivosinc.com>
References: <20220816232321.558250-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 16 Aug 2022 23:23:34 -0000

All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
as a unified counter. Thus, the predicate function doesn't need handle each
case separately.

Simplify the predicate function so that we just handle things differently
between RV32/RV64 and S/HS mode.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 110 ++++-----------------------------------------
 1 file changed, 9 insertions(+), 101 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 886695221956..397803d07727 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -75,6 +75,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
+    target_ulong ctr_mask;
     int base_csrno = CSR_CYCLE;
     bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
 
@@ -83,122 +84,29 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
         base_csrno += 0x80;
     }
     ctr_index = csrno - base_csrno;
+    ctr_mask = BIT(ctr_index);
 
     if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
         (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
         goto skip_ext_pmu_check;
     }
 
-    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
+    if (!(cpu->pmu_avail_ctrs & ctr_mask)) {
         /* No counter is enabled in PMU or the counter is out of range */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
 skip_ext_pmu_check:
 
-    if (env->priv == PRV_S) {
-        switch (csrno) {
-        case CSR_CYCLE:
-            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        case CSR_TIME:
-            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        case CSR_INSTRET:
-            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->mcounteren, 1 << ctr_index)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        }
-        if (rv32) {
-            switch (csrno) {
-            case CSR_CYCLEH:
-                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            case CSR_TIMEH:
-                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            case CSR_INSTRETH:
-                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->mcounteren, 1 << ctr_index)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            }
-        }
+    if (((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) ||
+        ((env->priv == PRV_U) && (!get_field(env->scounteren, ctr_mask)))) {
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     if (riscv_cpu_virt_enabled(env)) {
-        switch (csrno) {
-        case CSR_CYCLE:
-            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
-                get_field(env->mcounteren, COUNTEREN_CY)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_TIME:
-            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
-                get_field(env->mcounteren, COUNTEREN_TM)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_INSTRET:
-            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
-                get_field(env->mcounteren, COUNTEREN_IR)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->hcounteren, 1 << ctr_index) &&
-                 get_field(env->mcounteren, 1 << ctr_index)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        }
-        if (rv32) {
-            switch (csrno) {
-            case CSR_CYCLEH:
-                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
-                    get_field(env->mcounteren, COUNTEREN_CY)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_TIMEH:
-                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
-                    get_field(env->mcounteren, COUNTEREN_TM)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_INSTRETH:
-                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
-                    get_field(env->mcounteren, COUNTEREN_IR)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->hcounteren, 1 << ctr_index) &&
-                     get_field(env->mcounteren, 1 << ctr_index)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            }
+        if (!get_field(env->hcounteren, ctr_mask) &&
+            get_field(env->mcounteren, ctr_mask)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
     }
 #endif
-- 
2.25.1


