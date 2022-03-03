Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPvHs-00040Z-2D
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 18:55:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHk-0003pp-8Z
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 18:55:04 -0500
Received: from [2607:f8b0:4864:20::72c] (port=35674
 helo=mail-qk1-x72c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHh-0003cV-GM
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 18:55:03 -0500
Received: by mail-qk1-x72c.google.com with SMTP id j78so5277737qke.2
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 15:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjQjVRc6JGZydRAP4hI/4xfDkd8BKr7Odvu3sRR7Egk=;
 b=njQSJz2lbpRvk8JXkJFkYOjjemgQWwBBgMa9MXE2ylIhbITJnwwFd8llW6365M1dSk
 Whn91zpfiShn+uOjQuWFsMSiRKPuyRDFiGOHhjaOkZWTfTZq6sZhNwcF4fXwEtD1sj80
 4DZ41499FklGiF03wuiIGiJsgoMSvEujJa8noZpqoubLR981eJ9XAxpRqMwpzv4GY8Vo
 vhV+ydsLlyIMsmX4ozZMzzuwgh6P6D1MJpKvxL/8JU6757yMchJyXnU0ji4n4I+7xR+r
 cmTb73vj5zNhAtuZ3w2BFQl7dTeV0mWhnkDPa8pO0sv7tyWzPSUMOPMcDP1xrRi4sBNU
 JLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjQjVRc6JGZydRAP4hI/4xfDkd8BKr7Odvu3sRR7Egk=;
 b=6eCNIzLqKLtrYI5BxN3i17Rcpt+Ev+CANLAfgbXTX9cP0ie1rxE4hDn13/+etNx7lu
 BI1AJbpbp+n5a5qFR8kq9zXksg6wDcPKpWaHsuha5B4cA4oX622xrEyZvISSN7w3AIDY
 njlcVFAITzO0dJvQD21DMCqFKRgFi+JhBzJQ0Wy8qGiTxpLGYRKXSDeHqOiy+NEyVIHD
 zYelPB14GJee4ijf88tyxlNmSrQsVAupljLfv5vJ9hrAOZeEa/VpuQY9AlzP8CWaKIUU
 DObTkS2+TA4DKITRaN6LVU5ithEdNL4e2CTLXQZWp+yX+qbOYVadRVIG7xOOBR9+oScE
 B54w==
X-Gm-Message-State: AOAM530IlCXd4fZF/XD8b0P3arASZgukOXPHI3sr0yVOxXYCXoDpYoEM
 MiT8RuoJdiZX+rq8K6e5kzcF9A==
X-Google-Smtp-Source: ABdhPJx2RmjTQfYwtvdDsUEtRWBzB82UI4Bq+B9PYbRyLI7KXzFjBUQeD+RBa3VUwwuQF4wKJWqlCQ==
X-Received: by 2002:a37:6413:0:b0:46c:e3c1:7209 with SMTP id
 y19-20020a376413000000b0046ce3c17209mr1047804qkb.708.1646351700494; 
 Thu, 03 Mar 2022 15:55:00 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 h188-20020a376cc5000000b00648d7e2a36bsm1768390qkc.117.2022.03.03.15.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 15:55:00 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v6 09/12] target/riscv: Simplify counter predicate function
Date: Thu,  3 Mar 2022 15:54:37 -0800
Message-Id: <20220303235440.638790-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303235440.638790-1-atishp@rivosinc.com>
References: <20220303235440.638790-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=atishp@rivosinc.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 03 Mar 2022 23:55:04 -0000

All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
as a unified counter. Thus, the predicate function doesn't need handle each
case separately.

Simplify the predicate function so that we just handle things differently
between RV32/RV64 and S/HS mode.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 111 ++++-----------------------------------------
 1 file changed, 10 insertions(+), 101 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index cfcc1a0882d9..771e16d99f39 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -115,6 +115,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
+    target_ulong ctr_mask;
     int base_csrno = CSR_CYCLE;
     bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
 
@@ -123,122 +124,30 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
         base_csrno += 0x80;
     }
     ctr_index = csrno - base_csrno;
+    ctr_mask = BIT(ctr_index);
 
     if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
         (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
         goto skip_ext_pmu_check;
     }
 
-    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
+    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & ctr_mask))) {
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
+    if ((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) {
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
+        if (!get_field(env->mcounteren, ctr_mask)) {
+            /* The bit must be set in mcountern for HS mode access */
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        } else if (!get_field(env->hcounteren, ctr_mask)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
     }
 #endif
-- 
2.30.2


