Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg4Gr-0000p5-8Y
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 09:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg4Gp-0000oY-Bk
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 09:49:23 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg4Gm-0001Q1-I4
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 09:49:21 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 m20-20020a9d6094000000b0069caf591747so2339393otj.2
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 06:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679752159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dAPb1e70A2EeMvluMXyx4Hmmha63qgfKQDGsGkU+B1U=;
 b=EFInm4P/4y5EdV1iXaw7H8vEDKAitnfdeL1Cn/dhpczihHGN00fdlvAWbxRrLEH/SC
 2f9Bs/BZIlpWWhpfA33FM/cXdPSQTg8XttCsnmqSNmQ84kWuEWeOGkEu6MOl5hv2aKsG
 XFQdnfOHb9RjAYfDgHIxZfUZAbgRil/eff/f+R1yvMvdlbGT5HfuUs5Rzp3OKEyWy3QS
 ngZyGlB0U44XfjEC7UrJgIqOrEBFFPessrmGvX/DIGAdLsrd+O5x9dCg6fSub4yDMFPM
 koKG3+f9lmQ7X4Du9yA1/jd6mVoJR6wcFIW806BWLy6pP+gbS2mPsKoLhfCb+13ZUY2J
 5jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679752159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dAPb1e70A2EeMvluMXyx4Hmmha63qgfKQDGsGkU+B1U=;
 b=r9ub3YxacfBDvE9OrNx9r69nvJgYPnqC+dw1NS4/ygbYU5q+CpThzL0ZAiywObh/1D
 URrDJwxqhNj44HdCytc/39HUsb2bIHLaQrkNBg8NYe1dVU8ThxHu0/5MLIzTszn2s4Om
 1IKZYAa8R7JSXQqLyCNIj2KzwKCPqwLslqNqA2HWNjE5Ti0iMR/oC74FMayaHwwJm+Jx
 5jpx7Z4JgV9N9HOJ1pCHiDPIR5E/K8Au+i8YOFJy5YwZ8k7srSyAnivKtaSyICW3kxbq
 3bDR97r1Xu6yzrAT9j+o6oLxnmaXZWsfdSzaYDLLNs86S9f7tDAEhSw30VxlGU06N0HF
 4spA==
X-Gm-Message-State: AO0yUKVVjS1xLTfVBDe4YJegHKMJBhUButH/yjC3aSCOaVV9WFQO2Kuf
 rijx3hX7dFxiHYc4U5TpNlqUR8c02wgS3SBxIxw=
X-Google-Smtp-Source: AKy350ZVUAj0LaYtphW8vVRQiBUoK6lBAWhtYd4P2MUMfJmBARMlo5+MI01Gm6ogY6R6bnNDJirU5g==
X-Received: by 2002:a17:90b:4c49:b0:23b:4bf6:bbfa with SMTP id
 np9-20020a17090b4c4900b0023b4bf6bbfamr6446087pjb.11.1679741692731; 
 Sat, 25 Mar 2023 03:54:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 25/25] target/riscv: Reorg sum check in get_physical_address
Date: Sat, 25 Mar 2023 03:54:29 -0700
Message-Id: <20230325105429.1142530-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 13:49:23 -0000

Implement this by adjusting prot, which reduces the set of
checks required.  This prevents exec to be set for U pages
in MMUIdx_S_SUM.  While it had been technically incorrect,
it did not manifest as a bug, because we will never attempt
to execute from MMUIdx_S_SUM.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 725ca45106..7336d1273b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -800,7 +800,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     *ret_prot = 0;
 
     hwaddr base;
-    int levels, ptidxbits, ptesize, vm, sum, widened;
+    int levels, ptidxbits, ptesize, vm, widened;
 
     if (first_stage == true) {
         if (use_background) {
@@ -831,7 +831,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 2;
     }
-    sum = mmuidx_sum(mmu_idx);
+
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
@@ -999,15 +999,15 @@ restart:
         prot |= PAGE_EXEC;
     }
 
-    if ((pte & PTE_U) &&
-        ((mode != PRV_U) && (!sum || access_type == MMU_INST_FETCH))) {
-        /*
-         * User PTE flags when not U mode and mstatus.SUM is not set,
-         * or the access type is an instruction fetch.
-         */
-        return TRANSLATE_FAIL;
-    }
-    if (!(pte & PTE_U) && (mode != PRV_S)) {
+    if (pte & PTE_U) {
+        if (mode != PRV_U) {
+            if (!mmuidx_sum(mmu_idx)) {
+                return TRANSLATE_FAIL;
+            }
+            /* SUM allows only read+write, not execute. */
+            prot &= PAGE_READ | PAGE_WRITE;
+        }
+    } else if (mode != PRV_S) {
         /* Supervisor PTE flags when not S mode */
         return TRANSLATE_FAIL;
     }
-- 
2.34.1


