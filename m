Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA43EEB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 04:00:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHG9j-0003vG-06; Wed, 05 Jul 2023 23:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qHG9g-0003uk-R2; Wed, 05 Jul 2023 23:59:44 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qHG9f-0003WB-0e; Wed, 05 Jul 2023 23:59:44 -0400
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-345a8a78bcfso681795ab.2; 
 Wed, 05 Jul 2023 20:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688615981; x=1691207981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=iqwBsVmA2TQ8Fg9x96O8kThBiSlkCnVel1KOtzNHkyM=;
 b=kwIxZwKSLL6fU2i+zl9x/rvYYvQ5WMnzb6YPC5WvX4tncLGbe+W7mGD6IJQlzKcxv5
 AnzpXU72i945CrLER0hh0VIa9bW8W2M3VOBePLNhTZgZ9zD9JUUJNVzcZGs5GBZeWIy6
 KLcXyoL9r7Km5/VNC2GjrN1RgXPLVf2FaN/LKA0Nxs4bB7rk7yeejVe3KP8+QaKlGkau
 jZPaonnYJoyYmfPDuD2u++vcIjRcwVBGTyIwZq7GtZow2fLsVIVLpy0lNdpnc/1A3q+Z
 5deS0cH9HQQlggm8GsHOWb42dO86OLhykyVLJRgDLRvaEtyipRiJhK44jnz8ta6jEx80
 sbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688615981; x=1691207981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iqwBsVmA2TQ8Fg9x96O8kThBiSlkCnVel1KOtzNHkyM=;
 b=Tq1ELnLw7oCBoJg8fi/icrYUUCfNSAtG2JMK4V/Hb53jkf6ryQL0uy8wowwHp2e79u
 xE1GlewEMK3Las9go1lLAGMluAeL/1GFkTsCwVXgJmvRx3sjq8emyrnh/vLg5dB6M+w4
 c6NdiMYpKUyAMln/V8jnJ+hLbkt99mDoePY8n0PFpMf7qdO1s1+AhBfLQd3fp+3LTpib
 L7nqtw4DzVD17IQNAtlyiynGYhkRP1DeFBmUrMwa1ss6GMCB8NU18eFMK5suVvsAIx7C
 /kfjOVaom7sTkwpo7rfyvvUfkDH82welm/o/XIqoKh3avRn/WjpP864FcAPOWMoqZchj
 goNw==
X-Gm-Message-State: ABy/qLZu8UeDUQeZUahxLHzp2QEzKegsYY78B7XFC5GeXIN7NFJRKkpP
 1Vh6KDEJChI5cQPf4IGbk/o=
X-Google-Smtp-Source: APBJJlFX76siPBMypkCxPZv+fmi9wX6opl/Uq9nvKr5/2pwQmC/zmVqa67bp8+zWqdShyJhSbn6klg==
X-Received: by 2002:a05:6e02:14c5:b0:345:bf10:4010 with SMTP id
 o5-20020a056e0214c500b00345bf104010mr1141035ilk.12.1688615980736; 
 Wed, 05 Jul 2023 20:59:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 iy4-20020a170903130400b001b7e63cfa08sm232902plb.293.2023.07.05.20.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 20:59:40 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.c>
Subject: [PATCH v2] riscv: Generate devicetree only after machine
 initialization is complete
Date: Wed,  5 Jul 2023 20:59:37 -0700
Message-Id: <20230706035937.1870483-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=groeck7@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

If the devicetree is created before machine initialization is complete,
it misses dynamic devices. Specifically, the tpm device is not added
to the devicetree file and is therefore not instantiated in Linux.
Load/create devicetree in virt_machine_done() to solve the problem.

Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Alistair Francis <alistair23@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.c>
Fixes: 325b7c4e75 hw/riscv: Enable TPM backends
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Handle devicetree (load & create) entirely in machine_done function.

 hw/riscv/virt.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ed4c27487e..1c4bd823df 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1248,6 +1248,17 @@ static void virt_machine_done(Notifier *notifier, void *data)
     uint64_t kernel_entry = 0;
     BlockBackend *pflash_blk0;
 
+    /* load/create device tree */
+    if (machine->dtb) {
+        machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
+        if (!machine->fdt) {
+            error_report("load_device_tree() failed");
+            exit(1);
+        }
+    } else {
+        create_fdt(s, memmap);
+    }
+
     /*
      * Only direct boot kernel is currently supported for KVM VM,
      * so the "-bios" parameter is not supported when KVM is enabled.
@@ -1508,17 +1519,6 @@ static void virt_machine_init(MachineState *machine)
     }
     virt_flash_map(s, system_memory);
 
-    /* load/create device tree */
-    if (machine->dtb) {
-        machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
-        if (!machine->fdt) {
-            error_report("load_device_tree() failed");
-            exit(1);
-        }
-    } else {
-        create_fdt(s, memmap);
-    }
-
     s->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&s->machine_done);
 }
-- 
2.39.2


