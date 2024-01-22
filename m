Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052D0C46CD2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 22:18:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rS2aV-0004vE-R9; Mon, 22 Jan 2024 17:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rS2aC-0004pl-FX
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 17:15:57 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rS2aA-0005x6-Ii
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 17:15:55 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d7393de183so8236185ad.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 14:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705961753; x=1706566553; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O5iJeKaMhSSEIURROwKDqU58ZqHVR0g4H9L7rGUnf5Q=;
 b=k0uRMoN8RNswmdViYjzorjlyt3qLglxbB7ZxFzephDbRYFp1hPLJXlcVXLlxCzXxgD
 dRVb4hZc3IXYj6hh/rwQPCoX/6AKQFtiwGy43JCiOLtRHM0/e9y/NppT7HXCODJsJxNf
 H5W817r1nXsoCguDrDEhfb4NUUG8NtPAKevyE5cjoVlF3f6c6fyga75pdWXf316AOltv
 Rs2V37EXSSpSBf+9mhW+8ZUvsqpM8df0CNFVfzJGPxJRAYcs5W/yA/0wuB9PoEtm4f9U
 8INhfeK5jJwbObTAFfLy3DqtmJ5hIlK9bstAiCQYAekO8JcOGsI7efNjRz93Z9kGw2Bz
 LjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705961753; x=1706566553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O5iJeKaMhSSEIURROwKDqU58ZqHVR0g4H9L7rGUnf5Q=;
 b=lT2Swd5RZOQRVi3T59/e+gJces4xvjczHW/ZbZPsuOXdAiy838WMo1XuPGPlRGV5Vl
 eTeN3az5zVV3jQGyJg7mjun0Utn3rPbgZ5yUlLAG7UHpLHraN668U1Oba1C75Ax8JKzY
 BhhIrxok/znBs+o55vCjw+dGqJQI7R7Q7Z8p2zQWZNcSbvg+ih3CfK9hXkWMYh57ZBcv
 4y+wyN7PPlT9F99TwhneJ7i9XPIjFejOjZLAz91C/v9o1vMclfFfZfi6pP/P9eqAhU8t
 OYhdmOp9IS42M3oP5ldmlw35AD2SkKg+JXNLHTgNrO0prV56qusqLt7roNdzbnNa5ai2
 S13A==
X-Gm-Message-State: AOJu0YxdvsQz/qdxQJ4XUJeYvyNZ2zZbKF1NzOSx33LfTDZ/0cEPYbEj
 gdVocExs5qjjeoQ+tvxrXQqigP0dZ/KE53eFGgMR6gbrU3Bn1JnNm04nXVQoVB8=
X-Google-Smtp-Source: AGHT+IHgf6blRaPvZqSH7SYMlfoiOcbAG7XmobK3zlocwbsM3KDDWm48s0i73fH4i0VKNNhktSCMRA==
X-Received: by 2002:a17:903:3305:b0:1d5:e313:8380 with SMTP id
 jk5-20020a170903330500b001d5e3138380mr2025694plb.2.1705961753222; 
 Mon, 22 Jan 2024 14:15:53 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 kr8-20020a170903080800b001d7338977e6sm4029104plb.223.2024.01.22.14.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 14:15:52 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 6/7] hw/riscv/virt.c: use g_autofree in virt_machine_init()
Date: Mon, 22 Jan 2024 19:15:28 -0300
Message-ID: <20240122221529.86562-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122221529.86562-1-dbarboza@ventanamicro.com>
References: <20240122221529.86562-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Move 'soc_name' to the loop, and give it g_autofree, to avoid the manual
g_free().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index f8278df83f..710fbbda2c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1356,7 +1356,6 @@ static void virt_machine_init(MachineState *machine)
     RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
-    char *soc_name;
     DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
     int socket_count = riscv_socket_count(machine);
@@ -1376,6 +1375,8 @@ static void virt_machine_init(MachineState *machine)
     /* Initialize sockets */
     mmio_irqchip = virtio_irqchip = pcie_irqchip = NULL;
     for (i = 0; i < socket_count; i++) {
+        g_autofree char *soc_name = g_strdup_printf("soc%d", i);
+
         if (!riscv_socket_check_hartids(machine, i)) {
             error_report("discontinuous hartids in socket%d", i);
             exit(1);
@@ -1393,10 +1394,8 @@ static void virt_machine_init(MachineState *machine)
             exit(1);
         }
 
-        soc_name = g_strdup_printf("soc%d", i);
         object_initialize_child(OBJECT(machine), soc_name, &s->soc[i],
                                 TYPE_RISCV_HART_ARRAY);
-        g_free(soc_name);
         object_property_set_str(OBJECT(&s->soc[i]), "cpu-type",
                                 machine->cpu_type, &error_abort);
         object_property_set_int(OBJECT(&s->soc[i]), "hartid-base",
-- 
2.43.0


