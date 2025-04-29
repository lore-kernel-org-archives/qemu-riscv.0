Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E96C3ABA5
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 13:00:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9kXf-0002Qu-5M; Tue, 29 Apr 2025 08:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9kXd-0002Qe-OV
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 08:58:29 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9kXc-000093-3c
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 08:58:29 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-225df540edcso69356745ad.0
 for <qemu-riscv@nongnu.org>; Tue, 29 Apr 2025 05:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745931506; x=1746536306; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PSkyU0vjXhUwUWhgnzvXaN8LDQB1wxCHD/83om66W50=;
 b=YeZgB7WzXQ1Qtku2cs5HU7EKH14794/GTd72mnv0qQgMi4cmoYvO8CGgUC4WA9Z+AI
 146fnhIf8NIf+D36zFAp63zG6i7hJzUJOTrQqGY5uPRX1ijLGHXriibjwdi6ecuEKt4M
 Wc0SAaXVGqKgXt8+629pveoooqhyUcYmyDhNaDR0NeG68lkAb5RgUL9A9Y3jK50MzrB7
 ng8SYnvf0CxS3jyKghHnD4Jcy2ckc7/Mldq6szBJWiPDzoVbOKp79s37L8WaLMSi9hrv
 3sqYD24F3LpySdNncRJstZmzrVMrMQP0AD7UJ1M2mVYOUBNWBrUhn/y4D89dfDrOE2u1
 m4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745931506; x=1746536306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PSkyU0vjXhUwUWhgnzvXaN8LDQB1wxCHD/83om66W50=;
 b=IdhFSLqgMvgRfATxhTG09vrktkVbq95+a8cFAZzKQc+8rm7dogQY9+DBuV0dE1deO9
 va22TTQe7mFKT0qH5FHql7ZxGl1ieVdnzOsUwdHccFCLYA5RQpl/Y4tqkylYWerFmlrA
 SvditBFVZ+AipTgx5WIZRqVVJE3MI1QHmdDtaz25TJ2ryMPJ6Y26r07SRfmmsnKoclxI
 cidDAJ4L88uERVi/LvqjcEw7qF4JfisCPwvBwyUcufGG3D+8G4aO1+pgptZFBxR42owZ
 h4RmAmKLkg63yrFaVXrRgDYWfaij00FewjlDwmgtPyceBxLggKDJb50YCZqFclV+wzbQ
 n6Lw==
X-Gm-Message-State: AOJu0Ywd8AGp5VYo4ZEkALL47NT1cEEfC6bkL8JqS759WHRauP0lbtZG
 TpfApSbilQwu8W2FNeymy1daNjytwgalGq7mFlTBfeUiK7nQa9V47dRR9i0EsWg=
X-Gm-Gg: ASbGncvYlfES74/6Ypm9kaucxJSpWcC7NCKBUerfWQbJ57PqVFMH67kKQij+ogYJad5
 W6au8F4ya3zbWaJUdp5SvhGbX/5ruCNtVODbknoSgcywsuVARUVypTWpLmMPAph3DvOX11h2AyH
 Fgi6lsAc/4D/wh2+z42KHnV6BoyoVrz+Z2crOWeFIYgy48ChL1eBsgAPb1gjHMerbn6P78VKX7p
 k0wVTb6tygsaUZJwzijdXVaFZ/CCEr09CW88d0q92tEGJXAEXBGYIbfcrpMMrT7kdKV5Fl0Jdli
 ulpj//d5noV0sn+57FdfcR0SR294f0KBFR3rx9DgInEQltp5HZ8P7w==
X-Google-Smtp-Source: AGHT+IHzid89zuI6wBWF0plcnLCzduocD6bCTt6soORnX5isKTB/Z9IEW9L0MMA4I2/l6LYt5Hag8Q==
X-Received: by 2002:a17:902:c40f:b0:22d:c846:3e32 with SMTP id
 d9443c01a7336-22de6c72accmr40315045ad.25.1745931506521; 
 Tue, 29 Apr 2025 05:58:26 -0700 (PDT)
Received: from grind.. ([152.234.125.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f7fb7e54sm8889440a12.30.2025.04.29.05.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 05:58:26 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, joel@jms.id.au,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 3/9] hw/riscv/virt.c: use s->memmap in virt_machine_done()
Date: Tue, 29 Apr 2025 09:58:05 -0300
Message-ID: <20250429125811.224803-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429125811.224803-1-dbarboza@ventanamicro.com>
References: <20250429125811.224803-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b4a6916abb..f324777161 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1429,9 +1429,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
 {
     RISCVVirtState *s = container_of(notifier, RISCVVirtState,
                                      machine_done);
-    const MemMapEntry *memmap = virt_memmap;
     MachineState *machine = MACHINE(s);
-    hwaddr start_addr = memmap[VIRT_DRAM].base;
+    hwaddr start_addr = s->memmap[VIRT_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
     const char *firmware_name = riscv_default_firmware_name(&s->soc[0]);
     uint64_t fdt_load_addr;
@@ -1475,14 +1474,14 @@ static void virt_machine_done(Notifier *notifier, void *data)
              * let's overwrite the address we jump to after reset to
              * the base of the flash.
              */
-            start_addr = virt_memmap[VIRT_FLASH].base;
+            start_addr = s->memmap[VIRT_FLASH].base;
         } else {
             /*
              * Pflash was supplied but either KVM guest or bios is not none.
              * In this case, base of the flash would contain S-mode payload.
              */
             riscv_setup_firmware_boot(machine);
-            kernel_entry = virt_memmap[VIRT_FLASH].base;
+            kernel_entry = s->memmap[VIRT_FLASH].base;
         }
     }
 
@@ -1496,15 +1495,15 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_entry = boot_info.image_low_addr;
     }
 
-    fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
-                                           memmap[VIRT_DRAM].size,
+    fdt_load_addr = riscv_compute_fdt_addr(s->memmap[VIRT_DRAM].base,
+                                           s->memmap[VIRT_DRAM].size,
                                            machine, &boot_info);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
-                              virt_memmap[VIRT_MROM].base,
-                              virt_memmap[VIRT_MROM].size, kernel_entry,
+                              s->memmap[VIRT_MROM].base,
+                              s->memmap[VIRT_MROM].size, kernel_entry,
                               fdt_load_addr);
 
     /*
-- 
2.49.0


