Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC1DC77B7E
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 16:49:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2E8d-0007d8-5J; Thu, 25 May 2023 12:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q2E8V-0007WG-2h
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 12:48:24 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q2E8T-00054N-E4
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 12:48:22 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6af93a6166fso1261937a34.3
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685033299; x=1687625299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eVaVHzz3vfkOxCt8T8+XgQqN4G+awtuQH6z59VxVcMM=;
 b=c31gxL0NhLExePMUlcoubPHqFoTv3L7h+i9MaOvHBnkolzW830JbcP9faKr5xB6ZVY
 dCfngWLHcXFQ8MueD3YdixQoXQqGVi038AwSTyFMYi83kTqGZjX+8WyYaPah6LZKNaPM
 EJR6aV3NiYVH9qL8Q0sBHgAZAU1UXkeUgiVUnwWoKXEgIJAkxzt8l5A0QDyeXREu+ILq
 MS8VkN2xpQCsfjQUl6Tnxi3Q6CMq4ympe8bTutv6XbrQdo6Qgg/YufU4IjBRsj7qYL9c
 RHn7LpXpK3fwb8BKAKeT8DjZ8pASLBGA/vA++FxmId2u51w76Tl7CF00bVemkNPQ4LnI
 OuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685033299; x=1687625299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eVaVHzz3vfkOxCt8T8+XgQqN4G+awtuQH6z59VxVcMM=;
 b=cE+j2nItgzH8/yoD4pRkZGC2ryo+pwD5Fo7oo0zxVMMPbeQFmoh3VktaxPxuSbmD8r
 1iW42H445LDZRHVqnhmCLFGpzy+MBK8BsTpwiTPeimPBNZXRQG4ardFkG/s+5AYm/mpR
 NCi6wa455IActJ5Mm/E/v37A2HnU8emXjpRu6GSmK0ziqQQEShpra2G3wO9JXmw3aKCq
 Qf5vAHpfQdnRwrpKE8RHBQl9JOqXSv4o5r5RG1mU2sMAWPO/mvBoj18zNGy4zLPBEPbw
 4SRc517gDthVr9pYv2K7D3RURoS2Wq7cjeHMYC3uRrufZMFnKdb9VMVfbN5laX+7p354
 gcNg==
X-Gm-Message-State: AC+VfDw3RVrsWsNx7p4Bni2F/bW3TkYbQrRnNuGWI0dk2d3CXCgO9JP5
 +/0Sj3IJbDjR1RpyQB4gilrVCfdm4WNAncCYf/I=
X-Google-Smtp-Source: ACHHUZ48qVVFsv95YxjDlyG6cr7qJeULTqQbuP2PEN60tfp+lukoShDJ6lrlPjP9m5SITkwp1LAx7A==
X-Received: by 2002:a05:6830:1389:b0:6af:9589:d9a7 with SMTP id
 d9-20020a056830138900b006af9589d9a7mr93431otq.16.1685033299146; 
 Thu, 25 May 2023 09:48:19 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.186.3])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a9d7a92000000b006af886703f2sm803905otn.37.2023.05.25.09.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 09:48:18 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v4 2/3] riscv/virt: Support using pflash via -blockdev option
Date: Thu, 25 May 2023 22:18:02 +0530
Message-Id: <20230525164803.17992-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525164803.17992-1-sunilvl@ventanamicro.com>
References: <20230525164803.17992-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
or if=pflash options. This is the legacy way and the
better way is to use -blockdev as in other architectures.
libvirt also has moved to -blockdev method.

To support -blockdev option, pflash devices need to be
created in instance_init itself. So, update the code to
move the virt_flash_create() to instance_init. Also, use
standard interfaces to detect whether pflash0 is
configured or not.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reported-by: Andrea Bolognani <abologna@redhat.com>
---
 hw/riscv/virt.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1187a60d6e..48fcbdbf06 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1246,6 +1246,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
     const char *firmware_name = riscv_default_firmware_name(&s->soc[0]);
     uint32_t fdt_load_addr;
     uint64_t kernel_entry = 0;
+    BlockBackend *pflash_blk0;
+    MemoryRegion *flash_mem;
 
     /*
      * Only direct boot kernel is currently supported for KVM VM,
@@ -1265,21 +1267,22 @@ static void virt_machine_done(Notifier *notifier, void *data)
 
     firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
                                                      start_addr, NULL);
-
-    if (drive_get(IF_PFLASH, 0, 0)) {
+    pflash_blk0 = pflash_cfi01_get_blk(s->flash[0]);
+    if (pflash_blk0) {
+        flash_mem = pflash_cfi01_get_memory(s->flash[0]);
         if (machine->firmware && !strcmp(machine->firmware, "none")) {
             /*
              * Pflash was supplied but bios is none, let's overwrite the
              * address we jump to after reset to the base of the flash.
              */
-            start_addr = virt_memmap[VIRT_FLASH].base;
+            start_addr = flash_mem->addr;
         } else {
             /*
              * Pflash was supplied but bios is not none. In this case,
              * base of the flash would contain S-mode payload.
              */
             riscv_setup_firmware_boot(machine);
-            kernel_entry = virt_memmap[VIRT_FLASH].base;
+            kernel_entry = flash_mem->addr;
         }
     }
 
@@ -1497,8 +1500,6 @@ static void virt_machine_init(MachineState *machine)
     sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
         qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
 
-    virt_flash_create(s);
-
     for (i = 0; i < ARRAY_SIZE(s->flash); i++) {
         /* Map legacy -drive if=pflash to machine properties */
         pflash_cfi01_legacy_drive(s->flash[i],
@@ -1525,6 +1526,8 @@ static void virt_machine_instance_init(Object *obj)
 {
     RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
 
+    virt_flash_create(s);
+
     s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     s->acpi = ON_OFF_AUTO_AUTO;
-- 
2.34.1


