Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nouNQ-0004Ur-Oo
	for mharc-qemu-riscv@gnu.org; Wed, 11 May 2022 18:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNO-0004Ta-UB
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 18:00:10 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNN-0006eW-5P
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 18:00:10 -0400
Received: by mail-pg1-x536.google.com with SMTP id 31so2912999pgp.8
 for <qemu-riscv@nongnu.org>; Wed, 11 May 2022 15:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ONhH3JMWgWwbUIcvZD7NSVRWryFx2o7RORVMkeNPFY4=;
 b=jSnL5KATGvc2JdB79nRWmRmWK78stCqG0iX14zmEDsEwCppntNWwTQNw611AT6+TtF
 kNur2kiy3spnoQP1G0SHCGebAgG22cwJzHFgNOEvc1ImMgMSc4sxSSlJK25LoXvoQxum
 q2aUEDukZv9Ahq0CQOzgIV/rhGL1EQscHATegz43zk7ZVdrsttoJqImlPeWOMUl7QDMH
 dITisMOluBdahB+Vi26BICz1bP6EzSzi396rqgJxEb3PUC59Ns+MuFft6WI4jy3oemH7
 4N9zTICCnd7LWPiCIR5Pn8JsSLMS19X9ejxQGyYES3moPGSuD/jOxz3nk1ZzqeiXkn6G
 mDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ONhH3JMWgWwbUIcvZD7NSVRWryFx2o7RORVMkeNPFY4=;
 b=fYdxT6jNKLWFNdLHWY6jbrT6u4d4i1x3XYU88K9NvMyHOuW7UskZz1Mlmf+0dDDnuu
 CIOGakwcjod1qvhCoFZixsJXN2cfQmHF0lRG+Cf+Ug/EKJJkbQcQt881x0v3gOhn4PN/
 +pTpC2cQtdAtT4d8hgKMo0PRdPL1ntP0DU7bdxOdFUcfFQwWbAlrgcY5DWYxyL/hwr/A
 8T1kBsqFdiYe/f/CdDBVYFrGq56CHbVjJm1+qPaHg6pIH7/3hGrAibZVrBdG2a1FJ0ek
 JD/IKecGJzTo0v68nHglrqo8gghTQUYnHjJokKsup48KKQxWwQSNUuErrdbTB/qrTn+U
 5HtA==
X-Gm-Message-State: AOAM533emGaE95zzdB0uuPnUIsVtKNlNUxi2TGcjBqtiO75yKbNb/ANv
 wdYQjybTswqwvzjthi3egflvVZj9QDhrFA==
X-Google-Smtp-Source: ABdhPJzqfDqaifuNzHijb5AxK44u67XJ1WtpCuhjWdxJOfkJN8m89Y3FCMOABikx46OzbZMjvrHxZQ==
X-Received: by 2002:a63:874a:0:b0:3c6:aa29:15f6 with SMTP id
 i71-20020a63874a000000b003c6aa2915f6mr14748527pge.210.1652306407528; 
 Wed, 11 May 2022 15:00:07 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a62e417000000b0050dc762816asm2261303pfh.68.2022.05.11.15.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 15:00:06 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v8 01/12] target/riscv: Fix PMU CSR predicate function
Date: Wed, 11 May 2022 14:59:45 -0700
Message-Id: <20220511215956.2351243-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511215956.2351243-1-atishp@rivosinc.com>
References: <20220511215956.2351243-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Wed, 11 May 2022 22:00:11 -0000

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


