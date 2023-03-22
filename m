Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf7Lm-0008NX-7y
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7Lk-0008NG-C4
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:54:32 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7Li-0002e7-Km
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:54:31 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5456249756bso69219807b3.5
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679525669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEPTSkB86BpaaFtLEftxltn8EEKuvxXM6fE3vNx61Lo=;
 b=EXTkx4wHSqjNWZ+olL88D9M4MwqyVo2Y0/TERUUHxyH6pH+6NkNaPtfDrGOgQ1jW+E
 45ic+FljeP0pa0bOxwGNNMBAuYR1RXZmKmtaNyD6adA6mM1kO0+/K6LlnyU8LxbRtPGs
 0IIN+J2L7tlsU1CHZxxQxuAvid3SO7StouqAQzuQC3ONWxEU8+q1sbjwVODYw4gkgjmJ
 0di06/khasrrkM8zL5ANRatwbVGb3sxWctdbPaiXnlNjpSZTK3dFDN6m5dn2Z4IlIP7P
 ijiSdjjMll/cJD2etlFTXPNyF9xVgnk8mn/65YNbYWFAz1davachZqd5WEqDd4tojPNA
 Jx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679525669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEPTSkB86BpaaFtLEftxltn8EEKuvxXM6fE3vNx61Lo=;
 b=L6IECkaBgXlVwC90BeT+7iPKtoz9xsHHvZwlf4K2QMmJhjW1LYnr4W7Z2F0B1tGAGg
 hUimsbQXESUTuL3oO8gGmDkrYMd27AXPZm1gz6OWGSLhkHimZ5SMwVC4X5Wj8spHGXYQ
 LvPYRAO+cqPn2ZYP3GxePcgcFmcrCX1Fwy+ZBDI9FquG3uPmOZJX3QMTJqxKR6jGRTTR
 WyJx9jQ7uK87NaOYLLNInjJeTIYULfK/op9NCESUeHkOfj4OQ3Lo6P9n9iyezm1v6LIs
 7GR8st0CsY7OdYns/evK+SxBn7sd59e7ZFsvhFV6VyTXaakY/EqzC1pTXPOcVWj4wF5l
 xpVg==
X-Gm-Message-State: AO0yUKXufgODBSSDNj3rH8b7zIpAX1GhV3YheKI6cKKfbVru5UXzKhQH
 8ENhfeDZzGNmSla+9goBLfTFuUztHA0VT7at8Uo=
X-Google-Smtp-Source: AKy350ZNOMJ7M4EsOJkDXyb6z7sOJfOCZnEKTrnFrffCB5GOdt/hCO3EIUKKMnfx3ucKBGiYDL+6mw==
X-Received: by 2002:a05:6870:a68f:b0:17e:e65:c922 with SMTP id
 i15-20020a056870a68f00b0017e0e65c922mr824017oam.36.1679523647246; 
 Wed, 22 Mar 2023 15:20:47 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:46 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 08/25] target/riscv/cpu.c: validate extensions
 before riscv_timer_init()
Date: Wed, 22 Mar 2023 19:19:47 -0300
Message-Id: <20230322222004.357013-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1130.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 22:54:32 -0000

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


