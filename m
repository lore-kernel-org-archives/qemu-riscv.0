Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntHpk-000457-AA
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 19:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHpi-00042I-9n
 for qemu-riscv@nongnu.org; Mon, 23 May 2022 19:51:30 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHpg-0000Mb-7Z
 for qemu-riscv@nongnu.org; Mon, 23 May 2022 19:51:30 -0400
Received: by mail-pf1-x42c.google.com with SMTP id c14so15033127pfn.2
 for <qemu-riscv@nongnu.org>; Mon, 23 May 2022 16:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ONhH3JMWgWwbUIcvZD7NSVRWryFx2o7RORVMkeNPFY4=;
 b=becsQZ8lVgmeL6x3bHYJH7GP7lwQbKJePGFqm/juUGoJ+dSz7jVmGqErG99uGxTPfj
 oRcI44+xpEDABRNGS9HJ4tCkdsz5ySwlxM87HpQoXXsAbHryUvhPw+DWHCVwkcpFonJw
 LCJ9SRVLEw8KDJ6WO4U3C4wX450iATxJzS1jEUfM5U1Nryfs5mpDFklGWSNCdCbgVU1e
 VjPjOhTi1rR1tLPOntds8+oymxhMcaDr4Rj3YckR721g18TgIh/j7Y+BVvMlAo33T8VU
 m/77VHxSfyuzrFwAC+nyKNI6wQEHYRJqvNsre33AcTrqaiyr4/OZtlWzLJBNwdFLQ4FZ
 HO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ONhH3JMWgWwbUIcvZD7NSVRWryFx2o7RORVMkeNPFY4=;
 b=t/nuLPmvTS7lLJ9kQ6ydp4ze/bzULbZ/TJLkVSATG50XJtsTSUUOvKs9nA3qKwaS8R
 M6Sh7NCkRkbsJbjslm5T1vO7NZLKYGlthH5n/gNkh7mHv4fs4mOAla4g48DDYwlFVmYO
 rCnGSr6Og4xmXl7D8TFvgdy/ZdiAmFluMmYHOLaWHqPCD4ggKtfIZM6SDTN3tzl5EEqK
 24RGY2PUd/j75Maoq/4JSBfGOAyUAXcQczHDVLEr7pg3nnsw6aWdQmxig/vntBRFi3N8
 pbjJG5hN18s5emzAAFNj94GY+c9ILTLcyW3Prp3FaVhVglI9HvvQpWLOqwRBGtKysmgJ
 6jDA==
X-Gm-Message-State: AOAM530Vn6847vDEF+1TAYP2jhO3wdC0zBgry4WorX+oM7vfFy0oFAIn
 pv3SAxXw25a1Bj0QKDfL46k5yA==
X-Google-Smtp-Source: ABdhPJwiBfNzumr8Fq7F4dFvV4WH+GxLTkEtkEmlHzPKXVu97V/KrkG4H6Ykksf1z74FnIW16AyRSQ==
X-Received: by 2002:a05:6a00:2405:b0:4e1:5008:adcc with SMTP id
 z5-20020a056a00240500b004e15008adccmr25793449pfh.35.1653349886902; 
 Mon, 23 May 2022 16:51:26 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 pl15-20020a17090b268f00b001df4b919937sm257084pjb.16.2022.05.23.16.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 16:51:26 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v9 01/12] target/riscv: Fix PMU CSR predicate function
Date: Mon, 23 May 2022 16:50:46 -0700
Message-Id: <20220523235057.123882-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523235057.123882-1-atishp@rivosinc.com>
References: <20220523235057.123882-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 23 May 2022 23:51:30 -0000

From: Atish Patra <atish.patra@wdc.com>

The predicate function calculates the counter index incorrectly for
hpmcounterx. Fix the counter index to reflect correct CSR number.

Fixes: e39a8320b088 ("target/riscv: Support the Virtual Instruction fault")

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3500e07f92e1..ee3a35afa256 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -72,6 +72,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
+    int ctr_index;
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
@@ -99,8 +100,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
-                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                 get_field(env->mcounteren, 1 << ctr_index)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
@@ -126,8 +128,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
                 }
                 break;
             case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
-                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                     get_field(env->mcounteren, 1 << ctr_index)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
-- 
2.25.1


