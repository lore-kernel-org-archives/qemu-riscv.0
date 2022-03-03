Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPvHa-0003V8-Fr
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 18:54:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHZ-0003Tt-Fe
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 18:54:53 -0500
Received: from [2607:f8b0:4864:20::f2c] (port=33387
 helo=mail-qv1-xf2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHX-0003ZG-T8
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 18:54:53 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id f4so5060398qvd.0
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 15:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TIYzNk5T+eiuGTHCthMhPwxF2cED3vmDWiJr1s7zHwc=;
 b=GRJB6Q+7CYpwqz/9Go+b05LlaV9TD0TUFa7/7kPBC/xj9PNM5AHDYhTwnhmjQ3RDne
 UXDO/ZOULLYejfVtDfSDgvKU8HhL/BUb/H+IVuhbXGhMCHjHXYz6EaavRUXxKcPtooNz
 e2HXQQmLrKQSqwvcTUoPG+UG1nG1QRmUJbwYrXLfL/Ljr6zbfI77OhiTzv7wNo25L0fh
 hFJeL7g/1dCMm17JRvbRTSVUBF3pNTItygVCkvzAIaLV/Toh+bdHHsx1Gs4PReRz5Vuc
 HVkEmwYSSmfsaMa/HHwXwRiA9pKybOA+bflvgsxdechUjNycAKOhasld11wrrAbXUDZH
 qaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TIYzNk5T+eiuGTHCthMhPwxF2cED3vmDWiJr1s7zHwc=;
 b=KW3qRpYsu/k0Jubyph7JXD2dSL+Dx77zBSNicJz8vTq12CY6H/ksuYG+EzvCUfy/Fe
 LEYr23gC2YcozK9Ai9Gkk6uemM3I65ADgpjh+FBqT7xZ/Go8uTz9dR7z0yAvVKIt4r9c
 gG1gyRKjT3PmOpD60euPl2JAvNx9Yi5V1LYANFlcvVTc54uuI69t3pwD7cYHRb25qQeC
 5bCOGsSvhRMCvPHWZFJAkZcFvQpeB7frF/wOcnGwrVir4ukh6IE5rqBwId0L34Vb6hBY
 EHK8CDo9IzzXhPVDEHzLW/A93wficQh8wIXUKqMKpN+6hP5DsprALkOGWsCh5zZ0/z1/
 Ykwg==
X-Gm-Message-State: AOAM5328rVB8WpQM5vhGN5xuQPA20kOn/OiVeD43T1ur7T8uaQlbonjV
 7coYG1tTanizh2Nubu0fr9PLbg==
X-Google-Smtp-Source: ABdhPJz+Ej7s4ZeFemjz20qyRq4plUkD8r9Ti+LLDByVYztcOVIM4i126dfuLwK7uEIsUceJkNiSnA==
X-Received: by 2002:a05:6214:5293:b0:432:3071:e947 with SMTP id
 kj19-20020a056214529300b004323071e947mr26201112qvb.62.1646351688055; 
 Thu, 03 Mar 2022 15:54:48 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 h188-20020a376cc5000000b00648d7e2a36bsm1768390qkc.117.2022.03.03.15.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 15:54:47 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v6 01/12] target/riscv: Fix PMU CSR predicate function
Date: Thu,  3 Mar 2022 15:54:29 -0800
Message-Id: <20220303235440.638790-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303235440.638790-1-atishp@rivosinc.com>
References: <20220303235440.638790-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=atishp@rivosinc.com; helo=mail-qv1-xf2c.google.com
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
X-List-Received-Date: Thu, 03 Mar 2022 23:54:53 -0000

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
index b1876b3b6466..6102d5e7e24f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -69,6 +69,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
+    int ctr_index;
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
@@ -96,8 +97,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
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
@@ -123,8 +125,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
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
2.30.2


