Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15035C77B7E
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 05:00:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4aPL-0004he-VX; Thu, 01 Jun 2023 00:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q4aPK-0004hG-Jq
 for qemu-riscv@nongnu.org; Thu, 01 Jun 2023 00:59:30 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q4aPJ-0006Fu-0a
 for qemu-riscv@nongnu.org; Thu, 01 Jun 2023 00:59:30 -0400
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-397f10f861eso389878b6e.0
 for <qemu-riscv@nongnu.org>; Wed, 31 May 2023 21:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685595567; x=1688187567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oyoyB7K4g21QQhSn1QlP7nYODAnnSF7DtjAfnzuKxh8=;
 b=iStWuPd/ZdyAwT5tJAOGFylL8FZTehQaTZVaCUESCggHGli9nMzJgZbA3poalAYPsC
 GsKJ2l1FFSMB/SYGqCMfgv4Q8aVC42XXayNb4zX9PR3Y+2Jotubb7Atn0XX8SPc1kE1y
 M4efPpUPdDagznc6Jnd4rI3c/8EAJT/IO9fpbdCegjfimyp8Phil1CQPFefn/MduALaY
 ZUQfcSItlZfdzMlax1jm/3Jeksw/i8WYOOHr0fysHZf/ZCMR3+qWR+CQZcxejQRZzQwX
 FUARh7N5kn9muKsfdGtRKfJPkc1YCE8SQtED+mu9fJc6Bd5YWZ0hwzH9KjLcgt43klUn
 flvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685595567; x=1688187567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oyoyB7K4g21QQhSn1QlP7nYODAnnSF7DtjAfnzuKxh8=;
 b=IAdKmH7uKTpJ42kVko+Llnc4FV7Rirvib8jBoaRhtVwthZeYyiCkYJc2P+Ip3ZAg+1
 PJMG87rpEz4qfasP+yctd/Va5P3QWFiFF5XaQhpCzHu3vkSbF/wh6LB+H4OJN8ZB3A09
 1pv0chRG1UWRjOeCtl2ET8c93mRqq0eiznG2CUuBl6BTPT7zRmcUFYiC6QhIXCwm18/q
 xyy6Ce+PTZENQ2dLWFGaaY0XEPHT0ap5uTNBwulKH/lEgWDN0wWhqjj29przES1/pEvG
 nQPaJccqF61HzKTNiZLwY1qS1Q3wZruUo8Tza2/yazlDha4TIXryTEm9I7Uje62UuE+V
 GyXQ==
X-Gm-Message-State: AC+VfDyYtp1N5yWuTPBBcgsledP9pvXTo4n9ndt13sJgPcJyjayXLHvM
 8Xi/2fShWtYExpCskG4q8tbZjJJHHDYfAUiy9Ck9vg==
X-Google-Smtp-Source: ACHHUZ4D42p+GckBZGX5URxMgag/IQD4kTK9F838EilvOsS8slAUN15yW7Lbq9ZcdXwR8IasmbnWBw==
X-Received: by 2002:aca:e1c4:0:b0:39a:4439:2626 with SMTP id
 y187-20020acae1c4000000b0039a44392626mr413859oig.2.1685595567520; 
 Wed, 31 May 2023 21:59:27 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.83.242])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a4ab648000000b0055530a42ce3sm3985608ooo.34.2023.05.31.21.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 21:59:27 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 2/3] riscv/virt: Support using pflash via -blockdev option
Date: Thu,  1 Jun 2023 10:29:09 +0530
Message-Id: <20230601045910.18646-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601045910.18646-1-sunilvl@ventanamicro.com>
References: <20230601045910.18646-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Currently, pflash devices can be configured only via -pflash
or -drive options. This is the legacy way and the
better way is to use -blockdev as in other architectures.
libvirt also has moved to use -blockdev method.

To support -blockdev option, pflash devices need to be
created in instance_init itself. So, update the code to
move the virt_flash_create() to instance_init. Also, use
standard interfaces to detect whether pflash0 is
configured or not.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reported-by: Andrea Bolognani <abologna@redhat.com>
Tested-by: Andrea Bolognani <abologna@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/virt.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3e5dc649c3..76c7a3ba3b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1246,6 +1246,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
     const char *firmware_name = riscv_default_firmware_name(&s->soc[0]);
     uint32_t fdt_load_addr;
     uint64_t kernel_entry = 0;
+    BlockBackend *pflash_blk0;
 
     /*
      * Only direct boot kernel is currently supported for KVM VM,
@@ -1266,7 +1267,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
     firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
                                                      start_addr, NULL);
 
-    if (drive_get(IF_PFLASH, 0, 0)) {
+    pflash_blk0 = pflash_cfi01_get_blk(s->flash[0]);
+    if (pflash_blk0) {
         if (machine->firmware && !strcmp(machine->firmware, "none") &&
             !kvm_enabled()) {
             /*
@@ -1499,8 +1501,6 @@ static void virt_machine_init(MachineState *machine)
     sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
         qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
 
-    virt_flash_create(s);
-
     for (i = 0; i < ARRAY_SIZE(s->flash); i++) {
         /* Map legacy -drive if=pflash to machine properties */
         pflash_cfi01_legacy_drive(s->flash[i],
@@ -1527,6 +1527,8 @@ static void virt_machine_instance_init(Object *obj)
 {
     RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
 
+    virt_flash_create(s);
+
     s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     s->acpi = ON_OFF_AUTO_AUTO;
-- 
2.34.1


