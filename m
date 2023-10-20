Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE027CDB474
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:41:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtsVg-0003je-4M; Fri, 20 Oct 2023 12:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsVY-0003J1-Id
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:37:58 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsVN-0002WY-N4
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:37:51 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so1512222a12.2
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 09:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819863; x=1698424663; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lIfqIPgjXaT+HDThdwR33vMHRV/AQLZXNgmR/zi6+zY=;
 b=szzuUPkKTNsnv2t0fwjExL1sKpkTOcPVMA6IXkOmzpnrB6qP9vnhOn1tVPm2tH9Liw
 vVGMXVNacKwDSP0whtCMpIfFZqkPBvnUFAad1CMTSPI594iBY7OgGZ5ZNMGNa+soJ90o
 PGPa53g1mBYrM7B4gPIQ7hVFQ53TnhSQHpZ8mKsjga5iiXngbpGjL60qLhTFOtzSVYYd
 ZWoaejGs8uBW4T4b1C0kCuaMZXG3UlspHvg8iRbbTWMGSlApDQ0hmFhz7+u3JHN1norT
 s1WTtyy7EaLtLqC1n48tEabRDjTNWRWc+Myh5KMWqdME90L4+B8kvSaJA0NypAluDTqA
 7zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819863; x=1698424663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lIfqIPgjXaT+HDThdwR33vMHRV/AQLZXNgmR/zi6+zY=;
 b=N5UahoXAY+bOdAXhqHkBwnOkmBRgmr8wfvOvkhwyX8p05dGyAeEN+i+FggYK751xKu
 1Gn8dgXkjiyDXONdjFL/nNqua9gBsOXM1FdKtaoeHdi2PQch0WVCLsX+CaOxXUn7ZJ2z
 OambrzqSZBnKnwDQxzfBBOaUXQEjl+HIOEQYIUwSjzyrfwIuH8grEGmYHtSlqfWbnDgI
 vF62rjJMQjhspop1qWhPslmuAHv0ijlNSAyRPUEcnT1dEHwB26V1yChpmFr2u543+QO/
 5MrIDBbpq8rc0RmjEwPdSXnuaGgOIgFcS+K/D8hAu+s03Rw1lTbxAAFzgFs8y7S2/myj
 tdGw==
X-Gm-Message-State: AOJu0YwMiZkfZ3OS+5NynSRlgEf1pQdAl2kSvAoHXamMLVbhnf5sNIYR
 vpFQsirlX3QGjVfM0x7K5cvCvQ==
X-Google-Smtp-Source: AGHT+IHBVyZvw4f5Hs2t7cng9Y5f77G/O2sVJ7W2ZL6Q5XN2PZL/Jc6G4ofUIv4JkhfUQQT3G+9t1Q==
X-Received: by 2002:a50:ab12:0:b0:530:7ceb:33c with SMTP id
 s18-20020a50ab12000000b005307ceb033cmr1872603edc.4.1697819863159; 
 Fri, 20 Oct 2023 09:37:43 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 m14-20020a50ef0e000000b0053f0e4e0411sm1747279eds.76.2023.10.20.09.37.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 09:37:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 07/19] cpus: Filter for target specific CPU (riscv)
Date: Fri, 20 Oct 2023 18:36:29 +0200
Message-ID: <20231020163643.86105-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Enforce qemu_get_cpu() to return RISCV CPUs in RISCV specific files.

Mechanical change using the following coccinelle script:

  @@ expression index; @@
  -   qemu_get_cpu(index, NULL)
  +   qemu_get_cpu(index, TYPE_RISCV_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/sifive_plic.c | 2 +-
 hw/riscv/boot.c       | 2 +-
 hw/riscv/opentitan.c  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 3e2534ac04..ea0e7af16e 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -499,7 +499,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
 
     for (i = 0; i < plic->num_addrs; i++) {
         int cpu_num = plic->addr_config[i].hartid;
-        CPUState *cpu = qemu_get_cpu(cpu_num, NULL);
+        CPUState *cpu = qemu_get_cpu(cpu_num, TYPE_RISCV_CPU);
 
         if (plic->addr_config[i].mode == PLICMode_M) {
             qdev_connect_gpio_out(dev, cpu_num - hartid_base + num_harts,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index ea733b3df1..1d004660d4 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -49,7 +49,7 @@ char *riscv_plic_hart_config_string(int hart_count)
     int i;
 
     for (i = 0; i < hart_count; i++) {
-        CPUState *cs = qemu_get_cpu(i, NULL);
+        CPUState *cs = qemu_get_cpu(i, TYPE_RISCV_CPU);
         CPURISCVState *env = &RISCV_CPU(cs)->env;
 
         if (kvm_enabled()) {
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index e98361de19..106ef5d2d0 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -190,7 +190,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->plic), 0, memmap[IBEX_DEV_PLIC].base);
 
     for (i = 0; i < ms->smp.cpus; i++) {
-        CPUState *cpu = qemu_get_cpu(i, NULL);
+        CPUState *cpu = qemu_get_cpu(i, TYPE_RISCV_CPU);
 
         qdev_connect_gpio_out(DEVICE(&s->plic), ms->smp.cpus + i,
                               qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
@@ -223,7 +223,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
                        0, qdev_get_gpio_in(DEVICE(&s->plic),
                        IBEX_TIMER_TIMEREXPIRED0_0));
     qdev_connect_gpio_out(DEVICE(&s->timer), 0,
-                          qdev_get_gpio_in(DEVICE(qemu_get_cpu(0, NULL)),
+                          qdev_get_gpio_in(DEVICE(qemu_get_cpu(0, TYPE_RISCV_CPU)),
                                            IRQ_M_TIMER));
 
     /* SPI-Hosts */
-- 
2.41.0


