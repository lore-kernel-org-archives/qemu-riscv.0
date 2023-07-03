Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856CFEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 03:46:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGAW7-000815-RN; Sun, 02 Jul 2023 23:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qGAW4-00080J-SM; Sun, 02 Jul 2023 23:46:21 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qGAW2-00086v-Od; Sun, 02 Jul 2023 23:46:20 -0400
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-635e5b06aaeso25639116d6.0; 
 Sun, 02 Jul 2023 20:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688355977; x=1690947977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=yTWHFPqmsLAr6H0AweQ3FDt2bg8rQrwdv61MLdX7124=;
 b=HCDvng62tnDj1nq/1DQsh030pmBWB0AINd+s2DQjFAvo94zy43+tYdHJZzdGv8Tg+A
 n1n2A3U1GrcAImpYu85q8k/v5N83s+p5ne9uUWP5QSpXWl2Pwb1wJyV6iqRXoFWEt0oG
 UFwN7M0dDV49sC9SwB+B0MUV4yVyGior9DZw8O3B0gzHlBKHycQk38bdmiR2BeM/tV1X
 2T8UtUBga1HbLf1xpUmNb0KgTUDZcfvuvcNPMjILoQbyp1I1ocZJtp0lEElJFb5iWal9
 jTsAn2IH32vvBiTzrNFbeDR0hbeSySNTJW2suDkr8SJn/NwVGIqQkhcmBMyd2vDBknPg
 4eQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688355977; x=1690947977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTWHFPqmsLAr6H0AweQ3FDt2bg8rQrwdv61MLdX7124=;
 b=j6pdKdN12IPVUFO71o0k1aWginmp3k3qsvdMDbINNF8lpHJa0fwYkYZ9DzkkHnaZFh
 q/5ld+wDrjyM6hraSxy9JnHM2b+Pox77ceoBhtV4tqNQ+Mb4uPGN/7HyT71QkMDi8x37
 dE4ztcxN05z8GpnIdxpfqZA4bKB7zTG4KGJfYJqolwHvtiWPRFJuaBFKCJ21vOh7ubm3
 zK7UWA5qCOmT86xc52NM8n2rDoDbf1q83sMyesCAzQvVyMbN8bJBgVaodtesj2yMvlnx
 HfnVHCjSge/YKdbzFyZ8GG9xNM/L/BF8DuO0oDD9mK6Ad/LvalOWb8flZYqwAd/gQJij
 4kaw==
X-Gm-Message-State: ABy/qLZcC1Qgl8aSIwU8zlb3W7U0DcfrDHuq/XukKQM0DNlwFiroFKxs
 WrH8gwheOR+r36qhX8BFh8c=
X-Google-Smtp-Source: APBJJlGFIva9JCWdRQ6zJ94dioIdESE5E4yHOZs261NP7GwMDicil4cFTxtKJfadSaNWML0TcGnqZA==
X-Received: by 2002:a05:6214:624:b0:62d:f1b0:1ec with SMTP id
 a4-20020a056214062400b0062df1b001ecmr10575718qvx.26.1688355977151; 
 Sun, 02 Jul 2023 20:46:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k125-20020a632483000000b0055b149a6db5sm8624718pgk.43.2023.07.02.20.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 20:46:16 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair23@gmail.com>
Subject: [PATCH] riscv: Generate devicetree only after machine initialization
 is complete
Date: Sun,  2 Jul 2023 20:46:14 -0700
Message-Id: <20230703034614.3909079-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=groeck7@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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
Create devicetree in virt_machine_done() to solve the problem.

Cc: Alistair Francis <alistair23@gmail.com>
Fixes: 325b7c4e75 hw/riscv: Enable TPM backends
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/riscv/virt.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ed4c27487e..08876284f5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1248,6 +1248,11 @@ static void virt_machine_done(Notifier *notifier, void *data)
     uint64_t kernel_entry = 0;
     BlockBackend *pflash_blk0;
 
+    /* create devicetree if not provided */
+    if (!machine->dtb) {
+        create_fdt(s, memmap);
+    }
+
     /*
      * Only direct boot kernel is currently supported for KVM VM,
      * so the "-bios" parameter is not supported when KVM is enabled.
@@ -1508,15 +1513,13 @@ static void virt_machine_init(MachineState *machine)
     }
     virt_flash_map(s, system_memory);
 
-    /* load/create device tree */
+    /* load device tree */
     if (machine->dtb) {
         machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
         if (!machine->fdt) {
             error_report("load_device_tree() failed");
             exit(1);
         }
-    } else {
-        create_fdt(s, memmap);
     }
 
     s->machine_done.notify = virt_machine_done;
-- 
2.39.2


