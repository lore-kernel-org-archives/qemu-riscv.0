Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSmEk-0002yX-5z
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 16:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmEg-0002wf-GD
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 16:56:16 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmEd-0001uh-Hy
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 16:56:14 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-16e809949eeso2733530fac.9
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 13:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzgUQCLPgU6X7MZ2uleR0+KefuKd7NhosDsVObTIs/M=;
 b=imUYMFZDHZh32yw12+AHcbg267SgQ1y00YFEfNuOnI8KA4OXir12wdqUY6WcMM055m
 EaCWuDg2ZQ2Do8YD+4xZb9/3mYvSp/tSgJdgBqgYgODGL1feBIMSWwmQ5v9OZ3BT/H4Q
 QpfVxlUQhbGba9Xi1gpif7aNAxpgDDUWVYdAijjeC/DsgmkzFh+veB0k/sc+7xa/3REv
 BHx2OUtWk1DCbTWRgvneadz9DfyaRDIVR0i56B6xd97rkxIBJxjilWj2b7rypNQMuJSx
 azngnMLBkZcnj44o47UyqWEa/ofERI2D9rOgiDoMfZvU/+d7vB9+l4zMdND449/8LiuM
 XAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzgUQCLPgU6X7MZ2uleR0+KefuKd7NhosDsVObTIs/M=;
 b=MIppOOagduNx/vu8l9OMmp5d025+sGY//3YWJiaz4jSmomWGv8ywGFbqmBcNat62oN
 ndwdYh8g0jgZrSEOf7KlBCeeyBLCG0o/aOF5t8CTJYweoFKjomxoOvCuKloqHr2OmLCw
 jCLEGmm4A+VkuRHxm31yTKMwN2P5IFiGz17edbIrAucs72y7Cng+wJwwCdxeMR4U1NWl
 2qzl/EwfZ6YGp9eWbBMEePmvK1Bj8WEi6L7xteYidf//2Df8hc7fYm9Z5onLcmMCGNuh
 5LNERd/gZ9jYS+2OU9JFj0Ds2B7LjUZK64BmlCsYWj+VtI2Urc26SGiLWcz9og0I9684
 o1tQ==
X-Gm-Message-State: AO0yUKVoONEGQVFgrnN0iptrbVbXnYYInZeslak9zRhNgPTc998N4J4P
 1RoKe2BPwrRRYqbPJxq8ontoMw==
X-Google-Smtp-Source: AK7set/djE5anyqH9zUeS3zG1f2HtaiE5/NXkrfsmX9aSglmJhrk87UmQvoueoZw2TKWg3P8d8zsVQ==
X-Received: by 2002:a05:6871:5cd:b0:16b:398:7322 with SMTP id
 v13-20020a05687105cd00b0016b03987322mr4267212oan.25.1676584569195; 
 Thu, 16 Feb 2023 13:56:09 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 i132-20020acaea8a000000b0037d7f4d0890sm1047570oih.26.2023.02.16.13.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 13:56:08 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 4/9] target/riscv/cpu.c: error out if EPMP is enabled
 without PMP
Date: Thu, 16 Feb 2023 18:55:45 -0300
Message-Id: <20230216215550.1011637-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 21:56:16 -0000

Instead of silently ignoring the EPMP setting if there is no PMP
available, error out informing the user that EPMP depends on PMP
support:

$ ./qemu-system-riscv64 -cpu rv64,pmp=false,x-epmp=true
qemu-system-riscv64: Invalid configuration: EPMP requires PMP support

This will force users to pick saner options in the QEMU command line.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e34a5e3f11..4585ca74dc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -925,13 +925,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     if (cpu->cfg.pmp) {
         riscv_set_feature(env, RISCV_FEATURE_PMP);
+    }
+
+    if (cpu->cfg.epmp) {
+        riscv_set_feature(env, RISCV_FEATURE_EPMP);
 
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
-        if (cpu->cfg.epmp) {
-            riscv_set_feature(env, RISCV_FEATURE_EPMP);
+        if (!cpu->cfg.pmp) {
+            error_setg(errp, "Invalid configuration: EPMP requires PMP support");
+            return;
         }
     }
 
-- 
2.39.1


