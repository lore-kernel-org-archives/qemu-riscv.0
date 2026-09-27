Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303F8C9832F
	for <qemu-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 20:14:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAvG9-0008L4-Is; Sun, 27 Sep 2026 16:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1xAvG6-0008KH-Ml
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 16:14:02 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1xAvG4-0003Yd-IS
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 16:14:02 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 98e67ed59e1d1-396ccafb751so1104869a91.2
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 13:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790540039; x=1791144839; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MDFf3IWahPTWa14J2uR2N8Pogf4wEqs7mJpzR2c7Kpc=;
 b=CPeY6/Jks2BEuHt8SWWxcdr5cZQnlbTxaD9mtUhJLYBNe7bgMJ/v5037YwWPyY8d3M
 Kfi5SiO1Rgr0ZPmh4QAWovAluU5lf4Tf2ImDl4l+unpcfYI0YfS52u5uqX8XuXsjfRaz
 pe8hLYelCTRUw1Ed4jFzZVX2VAFp1q+DlESLNRLY/OrX56pajamu57miA7y4JTfgg9gX
 zEnVIie/TBRaY7FXRD8tFErg9fzJ7YAd/7GhlhvN+OEbboVphlw2zTROKKsuchaMKZk2
 2NWc+Y5tWZdR32rFgsokknhocmNiRbU0qr/48yG47m6DBCxsjsIIsh8bG82kM78SjrpF
 SIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790540039; x=1791144839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MDFf3IWahPTWa14J2uR2N8Pogf4wEqs7mJpzR2c7Kpc=;
 b=RRYoLjO73wxDoC8Yl6IqYEiEWh2XMPm8HWWKVGVpj8MZ3A4ARXu7MTMqyKJAUEFxoE
 UlmQ1IkEwLTgVVRzQDSYWZDjAzdkjiy0DzcmK8gb18bX+K7mHUvdpprAOM68MNeuT5xm
 2xelRLIc4bFSxArHPJYANXvdTB/ZSvtbJvtZfbHt14khT7XJFkJDTiaAfaDzoEiSnKzp
 RAVE5BtCatuHMTwmwW9oecMBfUEeLuiAzP9pq84HAM/HQV3NoTIwt4utkFrLcQfSQvXX
 472X1DC2gwXUXHoqiwGfg3O88pgJO97OCvgA1GJFKtOsmwTRlBJwH79Kcd6Vk1E+gf8I
 L+aw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxY0Yga/x+uucs/052+rK+yBtrhi+VlGZa69XuXEVWjFMXiSSCmH/i+S1/CKp1ASCX9kzk5mPEhuBmJ@nongnu.org
X-Gm-Message-State: AFq9FYIACX2s4acoI55RWOMgsss2Odh1bXK3Y0RoSh4Z4nEVi5w0KVYK
 6GTYz2El3YAnviEurwr7y+fhPs+LUqul2az4NGtVFnGR2NUxqHn+siDe
X-Gm-Gg: AYBFou1o5vgjtgKAGmLghJoo9Q1NZKkzxsM6b3Vioxt44zwfRSMU6zEM8T2NBmKfHYx
 od7FehINjZVCoe1UlpIp1TJatYq6EdMiSfxFm8CkdRTHJu0JUavCTM2Gb6bOv22XH6kdmyfdkKr
 9XTV6eSLhuyakRZf/jY8XIpTQz1k8zprSfEUencuAVjy3TbTD7u51JtxRU9nTvwUL0hAsaG9jK1
 cG+Qk5OBrbSJiQFmoGi51xg4izHn5wCyp+n+C5eWd4L8icFpcxQYxQU1ihDM6DMSF9vwWVZyL34
 HmBAeNzj6TRKPIiyfCS+IN57aOpW+3nf9EKd5SpcRc5Vd58RPep7A+7L2sZPfVVb4qRJ9Xuu5qy
 K3Mx4OyMxq3j5K+S6og/1IF2sFJo1rkhR/fhVPDAok0jgOmw0O95eEWSVyeTSejdT5gpgxEaTmH
 xHgelr9KNko0puoonUG1ug56Kw5UG3gJaSAylaAL7UwoLbtM0AiDF9iglNfPPS33G47vxCeLhxW
 AxinEiO9qe9vj3sXq13yoQR42TcI5T87YN4MmZKcZA0d5hmLKOfXq0juaeuJyHHK+/XkZ44Z7Yr
 PbS+mniykA==
X-Received: by 2002:a17:90a:bc9:b0:3a0:a515:c477 with SMTP id
 98e67ed59e1d1-3a0a515c8a1mr5063412a91.16.1790540039193; 
 Sun, 27 Sep 2026 13:13:59 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (33.223.194.35.bc.googleusercontent.com. [35.194.223.33])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0c719f86fsm13932737a91.7.2026.09.27.13.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 13:13:58 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 farosas@suse.de, lvivier@redhat.com
Cc: liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 portias@oss.tenstorrent.com, wxchen0913@gmail.com, jserv@ccns.ncku.edu.tw,
 marscheng@google.com, eleanor15x@gmail.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v5 3/7] hw/riscv: Add Sophgo CV1800B SoC support
Date: Sun, 27 Sep 2026 20:13:22 +0000
Message-ID: <20260927201326.650943-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260927201326.650943-1-visitorckw@gmail.com>
References: <20260927201326.650943-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=visitorckw@gmail.com; helo=mail-pj2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Add the Sophgo CV1800B SoC, which is the heart of the Milk-V Duo board.

The SoC features a T-Head C906 CPU along with integrated PLIC, CLINT,
and dw8250 UART. The memory map and interrupts are configured according
to the CV1800B datasheet. [1]

Several peripheral blocks are included as unimplemented devices to
ensure that drivers can probe successfully without causing errors
during boot.

Link: https://github.com/milkv-duo/duo-files/tree/main/duo/datasheet [1]
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/Kconfig           |   8 ++
 hw/riscv/cv1800b.c         | 177 +++++++++++++++++++++++++++++++++++++
 hw/riscv/meson.build       |   2 +
 include/hw/riscv/cv1800b.h |  56 ++++++++++++
 4 files changed, 243 insertions(+)
 create mode 100644 hw/riscv/cv1800b.c
 create mode 100644 include/hw/riscv/cv1800b.h

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index d06ac26648..b7c0871c67 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -164,3 +164,11 @@ config K230
     select K230_WDT
     select K230_GSDMA
     select K230_DECOMP_GZIP
+
+config SOPHGO_CV1800B
+    bool
+    depends on RISCV64
+    select RISCV_ACLINT
+    select SIFIVE_PLIC
+    select SOPHGO_CV1800B_CLK
+    select DW8250
diff --git a/hw/riscv/cv1800b.c b/hw/riscv/cv1800b.c
new file mode 100644
index 0000000000..9386c40de8
--- /dev/null
+++ b/hw/riscv/cv1800b.c
@@ -0,0 +1,177 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Sophgo CV1800B SoC
+ *
+ * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/riscv/cv1800b.h"
+#include "hw/core/qdev-properties.h"
+#include "target/riscv/cpu-qom.h"
+#include "system/system.h"
+#include "hw/intc/riscv_aclint.h"
+#include "system/address-spaces.h"
+#include "hw/intc/sifive_plic.h"
+#include "target/riscv/cpu.h"
+#include "hw/riscv/boot.h"
+#include "hw/sd/sdhci.h"
+#include "hw/misc/unimp.h"
+
+const MemMapEntry cv1800b_memmap[] = {
+    [CV1800B_DEV_TOP_MISC]     = { 0x03000000,      0x1000 },
+    [CV1800B_DEV_PINMUX]       = { 0x03001000,      0x1000 },
+    [CV1800B_DEV_CLK]          = { 0x03002000,      0x1000 },
+    [CV1800B_DEV_RST]          = { 0x03003000,      0x1000 },
+    [CV1800B_DEV_WDT]          = { 0x03010000,      0x1000 },
+    [CV1800B_DEV_GPIO]         = { 0x03020000,      0x4000 },
+    [CV1800B_DEV_UART0]        = { 0x04140000,     0x10000 },
+    [CV1800B_DEV_SD0]          = { 0x04310000,     0x10000 },
+    [CV1800B_DEV_ROM]          = { 0x04400000,     0x10000 },
+    [CV1800B_DEV_RTC_GPIO]     = { 0x05021000,      0x1000 },
+    [CV1800B_DEV_RTC_IO]       = { 0x05027000,      0x1000 },
+    [CV1800B_DEV_PLIC]         = { 0x70000000,   0x4000000 },
+    [CV1800B_DEV_CLINT]        = { 0x74000000,     0x10000 },
+    [CV1800B_DEV_DRAM]         = { 0x80000000,         0x0 },
+};
+
+static void cv1800b_soc_instance_init(Object *obj)
+{
+    CV1800BSoCState *s = CV1800B_SOC(obj);
+
+    object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY);
+    qdev_prop_set_uint32(DEVICE(&s->cpus), "hartid-base", 0);
+    qdev_prop_set_string(DEVICE(&s->cpus), "cpu-type", TYPE_RISCV_CPU_THEAD_C906);
+    qdev_prop_set_uint64(DEVICE(&s->cpus), "resetvec",
+                         cv1800b_memmap[CV1800B_DEV_ROM].base);
+
+    object_initialize_child(obj, "clk", &s->clk, TYPE_CV1800B_CLK);
+    object_initialize_child(obj, "uart", &s->uart, TYPE_DW8250);
+    object_initialize_child(obj, "sdhci", &s->sdhci, TYPE_SYSBUS_SDHCI);
+}
+
+static void cv1800b_soc_realize(DeviceState *dev, Error **errp)
+{
+    CV1800BSoCState *s = CV1800B_SOC(dev);
+    MachineState *ms = MACHINE(qdev_get_machine());
+    uint32_t num_harts = ms->smp.cpus;
+    MemoryRegion *system_memory = get_system_memory();
+    char *plic_hart_config;
+
+    qdev_prop_set_uint32(DEVICE(&s->cpus), "num-harts", num_harts);
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->cpus), errp)) {
+        return;
+    }
+
+    memory_region_init_rom(&s->rom, OBJECT(dev), "cv1800b.rom",
+                           cv1800b_memmap[CV1800B_DEV_ROM].size, &error_fatal);
+    memory_region_add_subregion(system_memory,
+                                cv1800b_memmap[CV1800B_DEV_ROM].base, &s->rom);
+
+    riscv_aclint_swi_create(system_memory,
+                            cv1800b_memmap[CV1800B_DEV_CLINT].base,
+                            0, num_harts, false);
+    riscv_aclint_mtimer_create(system_memory,
+                               cv1800b_memmap[CV1800B_DEV_CLINT].base +
+                               RISCV_ACLINT_SWI_SIZE,
+                               RISCV_ACLINT_DEFAULT_MTIMER_SIZE,
+                               0, num_harts, RISCV_ACLINT_DEFAULT_MTIMECMP,
+                               RISCV_ACLINT_DEFAULT_MTIME,
+                               RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
+
+    plic_hart_config = riscv_plic_hart_config_string(num_harts);
+    s->plic = sifive_plic_create(
+        system_memory,
+        cv1800b_memmap[CV1800B_DEV_PLIC].base,
+        plic_hart_config,
+        num_harts,
+        0,
+        CV1800B_PLIC_NUM_SOURCES,
+        CV1800B_PLIC_NUM_PRIORITIES,
+        0x0,
+        0x1000,
+        0x2000,
+        0x80,
+        0x200000,
+        0x1000,
+        cv1800b_memmap[CV1800B_DEV_PLIC].size);
+
+    g_free(plic_hart_config);
+
+    qdev_prop_set_uint8(DEVICE(&s->uart), "regshift", 2);
+    qdev_prop_set_chr(DEVICE(&s->uart), "chardev", serial_hd(0));
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->uart), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart), 0, cv1800b_memmap[CV1800B_DEV_UART0].base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart), 0,
+                    qdev_get_gpio_in(DEVICE(s->plic), CV1800B_UART0_IRQ));
+
+    qdev_prop_set_uint8(DEVICE(&s->sdhci), "sd-spec-version", 3);
+    qdev_prop_set_uint64(DEVICE(&s->sdhci), "capareg", 0x056900b9);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdhci), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci), 0, cv1800b_memmap[CV1800B_DEV_SD0].base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
+                       qdev_get_gpio_in(DEVICE(s->plic), CV1800B_SD0_IRQ));
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->clk), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->clk), 0,
+                    cv1800b_memmap[CV1800B_DEV_CLK].base);
+
+    create_unimplemented_device("cv1800b.top_misc",
+                                cv1800b_memmap[CV1800B_DEV_TOP_MISC].base,
+                                cv1800b_memmap[CV1800B_DEV_TOP_MISC].size);
+
+    create_unimplemented_device("cv1800b.pinmux",
+                                cv1800b_memmap[CV1800B_DEV_PINMUX].base,
+                                cv1800b_memmap[CV1800B_DEV_PINMUX].size);
+
+    create_unimplemented_device("cv1800b.rst",
+                                cv1800b_memmap[CV1800B_DEV_RST].base,
+                                cv1800b_memmap[CV1800B_DEV_RST].size);
+
+    create_unimplemented_device("cv1800b.wdt",
+                                cv1800b_memmap[CV1800B_DEV_WDT].base,
+                                cv1800b_memmap[CV1800B_DEV_WDT].size);
+
+    create_unimplemented_device("cv1800b.gpio0_3",
+                                cv1800b_memmap[CV1800B_DEV_GPIO].base,
+                                cv1800b_memmap[CV1800B_DEV_GPIO].size);
+
+    create_unimplemented_device("cv1800b.rtc_gpio",
+                                cv1800b_memmap[CV1800B_DEV_RTC_GPIO].base,
+                                cv1800b_memmap[CV1800B_DEV_RTC_GPIO].size);
+
+    create_unimplemented_device("cv1800b.rtc_io",
+                                cv1800b_memmap[CV1800B_DEV_RTC_IO].base,
+                                cv1800b_memmap[CV1800B_DEV_RTC_IO].size);
+}
+
+static void cv1800b_soc_class_init(ObjectClass *oc, const void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = cv1800b_soc_realize;
+    dc->user_creatable = false;
+}
+
+static const TypeInfo cv1800b_soc_type_info = {
+    .name = TYPE_CV1800B_SOC,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(CV1800BSoCState),
+    .instance_init = cv1800b_soc_instance_init,
+    .class_init = cv1800b_soc_class_init,
+};
+
+static void cv1800b_soc_register_types(void)
+{
+    type_register_static(&cv1800b_soc_type_info);
+}
+
+type_init(cv1800b_soc_register_types)
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 7aa3c1578d..45895486d4 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -22,4 +22,6 @@ riscv_ss.add(when: 'CONFIG_RISCV_MIPS_CPS', if_true: files('cps.c'))
 riscv_ss.add(when: 'CONFIG_MIPS_BOSTON_AIA', if_true: files('boston-aia.c'))
 riscv_ss.add(when: 'CONFIG_K230', if_true: files('k230.c'))
 
+riscv_ss.add(when: 'CONFIG_SOPHGO_CV1800B', if_true: files('cv1800b.c'))
+
 hw_arch += {'riscv': riscv_ss}
diff --git a/include/hw/riscv/cv1800b.h b/include/hw/riscv/cv1800b.h
new file mode 100644
index 0000000000..bde5eff96b
--- /dev/null
+++ b/include/hw/riscv/cv1800b.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Sophgo CV1800B SoC
+ *
+ * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+ */
+
+#ifndef HW_RISCV_CV1800B_H
+#define HW_RISCV_CV1800B_H
+
+#include "hw/core/boards.h"
+#include "hw/riscv/riscv_hart.h"
+#include "hw/misc/cv1800b_clk.h"
+#include "hw/char/dw8250.h"
+#include "hw/sd/sdhci.h"
+
+#define TYPE_CV1800B_SOC "cv1800b-soc"
+OBJECT_DECLARE_SIMPLE_TYPE(CV1800BSoCState, CV1800B_SOC)
+
+struct CV1800BSoCState {
+    DeviceState parent_obj;
+
+    RISCVHartArrayState cpus;
+    MemoryRegion rom;
+    DeviceState *plic;
+    CV1800BClkState clk;
+    DW8250State uart;
+    SDHCIState sdhci;
+};
+
+#define CV1800B_PLIC_NUM_SOURCES 136
+#define CV1800B_PLIC_NUM_PRIORITIES 31
+
+#define CV1800B_UART0_IRQ 44
+#define CV1800B_SD0_IRQ   36
+
+enum {
+    CV1800B_DEV_TOP_MISC,
+    CV1800B_DEV_PINMUX,
+    CV1800B_DEV_CLK,
+    CV1800B_DEV_RST,
+    CV1800B_DEV_WDT,
+    CV1800B_DEV_GPIO,
+    CV1800B_DEV_UART0,
+    CV1800B_DEV_SD0,
+    CV1800B_DEV_ROM,
+    CV1800B_DEV_RTC_GPIO,
+    CV1800B_DEV_RTC_IO,
+    CV1800B_DEV_PLIC,
+    CV1800B_DEV_CLINT,
+    CV1800B_DEV_DRAM,
+};
+
+extern const MemMapEntry cv1800b_memmap[];
+
+#endif
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


