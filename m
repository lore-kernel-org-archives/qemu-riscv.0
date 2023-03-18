Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcne-00054n-M0
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnd-00054Q-EV
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:09 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcna-00076T-RU
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:09 -0400
Received: by mail-oi1-x229.google.com with SMTP id s41so6187523oiw.13
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEPTSkB86BpaaFtLEftxltn8EEKuvxXM6fE3vNx61Lo=;
 b=TDDlvkp56ov3KIIHPlwZxNuiE87wOJf0PYPwXwb0XfAhmlqmDKEj1692eOnP5ehQMG
 NKhQ7YG6HPBGdM0gdspVNJzo4rgMSiFIaRcP4a2UAPrCWQl328GcJrQZ0VKkNnAX0dC4
 s07juJFqiNrr8k5396eVZ1g7E2udYzrqvDz0WiZT4Jf8c3dkhFkToSMASC0G1auIpdpM
 /fwPwEYjsW9lW+zWHbkf82byWLDhUSDTKBaZCLpPutbMC3XMDXcTxBXCWI0ht669XE3O
 V8ukfKITIw1K/WM6xLbSRA8OEbmj+NStkjDIjvdMivF00flNyHo5PqXYY+lWgD+LCROi
 gPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEPTSkB86BpaaFtLEftxltn8EEKuvxXM6fE3vNx61Lo=;
 b=78Gi9EJvbqBjCyJvpiPRRPwhEBzuEfJ4xNRo5c9e2nuw8RdLBT46kjFbbZOaR4/Op/
 IGB5HXKZ7V2NGi7NJ6qD6NvAtbTq25RDLM7feyQESKtvn3uFBj6QrdcoExhJsdxpYnsh
 C6Mz4JXAcAyMw7GT/v8vcmvvB9WIsA0PGMmiy5YiywGuNxjyA5BKYHdvMbzqUvlFBT5O
 dZtncqjPWHBW6R/6p2kbbDDt5wVRd2bIvunvIv1mCIqI7wy8pW3QK6qBvlqsaSFt/WMQ
 hiRlbF+6V+CczByx9n3WOsXEBcUQ3HnyACOqeuVnT7Xis3MIs8UckcoHQryaX+4yntT2
 nt6w==
X-Gm-Message-State: AO0yUKUg4BzNrMOb8ijLxonntky39H+xu672i+XsixF9coFMlBfp5Wvz
 DgGdgWvTgYeKFumgYSS7pnpmogFK7NonHIqF/4c=
X-Google-Smtp-Source: AK7set+8OZMuZrhaWKjkioENyu81i8Ly80Fc+V2AGZqYMXA/LA96yokoVxKYnHJX6afKBZyMX3yfZA==
X-Received: by 2002:a54:4498:0:b0:36d:f6c4:1860 with SMTP id
 v24-20020a544498000000b0036df6c41860mr6115865oiv.34.1679169905650; 
 Sat, 18 Mar 2023 13:05:05 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:05 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 08/26] target/riscv/cpu.c: validate extensions
 before riscv_timer_init()
Date: Sat, 18 Mar 2023 17:04:18 -0300
Message-Id: <20230318200436.299464-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
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
X-List-Received-Date: Sat, 18 Mar 2023 20:05:09 -0000

There is no need to init timers if we're not even sure that our
extensions are valid. Execute riscv_cpu_validate_set_extensions() before
riscv_timer_init().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7458845fec..fef55d7d79 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1237,12 +1237,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-#ifndef CONFIG_USER_ONLY
-    if (cpu->cfg.ext_sstc) {
-        riscv_timer_init(cpu);
-    }
-#endif /* CONFIG_USER_ONLY */
-
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1250,6 +1244,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
 #ifndef CONFIG_USER_ONLY
+    if (cpu->cfg.ext_sstc) {
+        riscv_timer_init(cpu);
+    }
+
     if (cpu->cfg.pmu_num) {
         if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
             cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-- 
2.39.2


