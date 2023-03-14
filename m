Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7qu-0005dI-9Q
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qs-0005Tz-59
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:18 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qq-0002qg-Is
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:17 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1755e639b65so17996384fac.3
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x65YaMF/q551T09YOmWRrKe4JEANKzCqnWd/M7vc3rI=;
 b=OMgoS9JklXoXl4Fem5uyAGscJ+kGX0hj5e14KHIUTRz1MDNzY3zjeFtfbNGV4NlwEj
 xe8PENcpDSKmjW4Px7DbZ/pfHziiFJqheZLYYIA/CIEuLAwT8GNdZjVzNjQ7avNaXHNL
 3+2XW2KEmhMr+quWWFuMyXQn9bjdyNzLvVmyffGllpO1Euu9UQy4178NQSkGErl48WQx
 xsqAdei9wd+q5/9scEjebGMzfqQLiCQE6mxt29/aRPiW+34T6V5qYxb0WbUbqPpz11Wu
 BlmEzO/283T/gRs4oD7JfwtDn7Ymfx/ML0ACF9AXkUdVsEaEhq9eiYugQ7vnRXEEifod
 0fRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x65YaMF/q551T09YOmWRrKe4JEANKzCqnWd/M7vc3rI=;
 b=DpKug1N81EEteS7bz2/r7KCCVAe8+rmeUG8M2hcca01JGTaDnHS1oEqKS0clIj5fJy
 a31IMBQL8OduvzMD3+i/dxrxoA/FmZf/pvd32dYU+/MHY2kF+fwlmclffjnsco1diuWJ
 79ozy3QuoYr2WTruBLatg01g2fLzEtP0FvBZOV+xVnyZW395GO3a3GBz1fU0TVG+ya5K
 d03UwyOKUS5I6lspvtmAlMIRK0ezIH69XYe8OCEmmdSrAflxG/TgcM8HHQzT8PjB9tHp
 3KHEE8nyRYgfMbaEvfv4PpE9Xf5QnFwn6KJj4X9Q0ddmGv78v2q2bRqhkmwVjSU1Q74A
 ki2Q==
X-Gm-Message-State: AO0yUKV6UfEs5QIri1zBaUqmk+GJ5B0Q2nRWo4bZxD23qpY4+jfyeC4f
 9pEfmenFsbiAePnzXwmXgZc2AA==
X-Google-Smtp-Source: AK7set+7CIYv7yQhzU/aIaLMLfYeYa7PwfAPTXhoU9zkLO2wfL4DoV7BzQ2QSuv7QgaPRxSLpgQ32w==
X-Received: by 2002:a05:6870:d0c6:b0:17a:a7af:6cf3 with SMTP id
 k6-20020a056870d0c600b0017aa7af6cf3mr1693734oaa.56.1678812615491; 
 Tue, 14 Mar 2023 09:50:15 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 07/26] target/riscv: move pmp and epmp validations
 to validate_set_extensions()
Date: Tue, 14 Mar 2023 13:49:29 -0300
Message-Id: <20230314164948.539135-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:50:18 -0000

In the near future, write_misa() will use a variation of what we have
now as riscv_cpu_validate_set_extensions(). The pmp and epmp validation
will be required in write_misa() and it's already required here in
riscv_cpu_realize(), so move it to riscv_cpu_validate_set_extensions().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1a298e5e55..7458845fec 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -916,6 +916,15 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     Error *local_err = NULL;
     uint32_t ext = 0;
 
+    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
+        /*
+         * Enhanced PMP should only be available
+         * on harts with PMP support
+         */
+        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
+        return;
+    }
+
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                             cpu->cfg.ext_a && cpu->cfg.ext_f &&
@@ -1228,16 +1237,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
-        /*
-         * Enhanced PMP should only be available
-         * on harts with PMP support
-         */
-        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
-        return;
-    }
-
-
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.ext_sstc) {
         riscv_timer_init(cpu);
-- 
2.39.2


