Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1FFC021A4
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 12:25:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiYEv-00026Y-UY; Thu, 13 Feb 2025 07:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYEt-00025m-Qw
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 07:22:43 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYEr-0002Wf-TH
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 07:22:43 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso141409366b.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Feb 2025 04:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739449360; x=1740054160; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r3JDPQWYy24MD735D0eYi/u2QpMsBv2AYsysjl3US+0=;
 b=mNfBdApziv2SIrFJzQPxLi4yEHCwQQBlXEGGY4dSu08SqJCQrW2jKNQWe+JQ9KN9ha
 Sq9ds4ZdoM5ZbjITcwikcW8xGW6MvMQm7TANt3a9w/XeJvNNcrR2xgc4fphiFeFWJzWo
 v9hsVAexUcS6HH5Odray6GZW/7BpDclyTID4uZvkt3ruiWS1eYuRZwFJ0lw2KO2uFMNg
 K1gDYQgbnS1bTn640kOrL+YAzyK+fW7ZtSBwhqwPXX8dmVn4jA7DuhF/cHgJxbLMY+OF
 zNizKncyW447jPaSFRj/c0FgJ16Ppm/IYE1yXcLgyT1l06fKxRKeBVAGkVzVFu1DVi2Q
 rSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739449360; x=1740054160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r3JDPQWYy24MD735D0eYi/u2QpMsBv2AYsysjl3US+0=;
 b=Lr8EIyi0bGMceohNiNiiU1P97dhl2p+WvCtBJaB6tB88D0nZR7XhL1y8fuSaZlZrIs
 0JfceMM7PIOKGUeZOWUyKB54RIUzhpXdJCclAO7NsGW1CxlTB5G74XQwctEg4xPKOZVF
 W3tj3flhcgrggmoh374n25qpKhbU4F9qWFxHWmMPtXvdm4kWJ3rSoon9ZehxS6RZwsPp
 LaU3kMaTF4BqW7PGg4wY98oA2P/7bj8Fv6CDfDmhrNpLno2Su8xxX8jt2JZaMuUKmX+w
 zZbnw+n0DjXXlVnH+Qv7XNcsa4JvYeNISTzC2AijX+xRb1YccO1ZxlX1VzXugUip8EbX
 F/eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPpuzSqVB8rasR6ZFc3FzsqKSydUCSI68byFSw/Rjelg3roiGY/J+LlVK++t/OuRslD299vfCcmSuR@nongnu.org
X-Gm-Message-State: AOJu0YwkjqH3qbOcb6WRZq4TEukga4gFCbR2SJIM2XsDdARSLvheJFB+
 8mg1wfzI7XFIv576mmXhuou7JV6KHZwwvEchclOR8ihIxtD1hJbSopeHEcOG0OM=
X-Gm-Gg: ASbGncs+uk/k0BYBfMObg+4aXVPsGJBHU9L0qehS6ke+DAhUxtXbUA0bml3biW477zB
 +5xdLzPCGeJF1o9VKYDiiRxJ6h2PEdnuEGHGU9l+1b5aYklia7IfkjdqXvxXNRUitIqPPSgksJw
 BJrjX6bCqdIGYVyJaCs4uznQ2Y7KhshY+YgEcvk59dzEgtnVIpOH51MVWJU07Ht+wISZLcBW+NF
 btlIVjYLX7+HXdwCrPijAlkMDJE5rRHNdd4pk8xezlGn5bom7fcn6JBA76jK9y8u0AzB1vlUCsj
 E7AgaqrXKllK4GgFwoy+wCPp8yidu4BiokPa5uobtM93QSKEv1sbID0E58yJ
X-Google-Smtp-Source: AGHT+IEznmJMZZNfZ7IlQeUdOnxvKSt1N6d7xckNeCTTIj+doVEuu3SYjLk0qTteifxbQ0CmWZ0dcA==
X-Received: by 2002:a17:907:7206:b0:ab7:ee47:993f with SMTP id
 a640c23a62f3a-ab7f34a31c4mr634545966b.47.1739449360292; 
 Thu, 13 Feb 2025 04:22:40 -0800 (PST)
Received: from localhost.localdomain (6.170.88.92.rev.sfr.net. [92.88.170.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53398364sm122047166b.128.2025.02.13.04.22.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Feb 2025 04:22:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v8 3/6] hw/net/xilinx_ethlite: Make device endianness
 configurable
Date: Thu, 13 Feb 2025 13:22:14 +0100
Message-ID: <20250213122217.62654-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250213122217.62654-1-philmd@linaro.org>
References: <20250213122217.62654-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair of
DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.

Add the "endianness" property to select the device endianness.
This property is unspecified by default, and machines need to
make it explicit.

Set the proper endianness for each machine using the device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
 hw/net/xilinx_ethlite.c                  | 29 +++++++++++++++++++-----
 hw/riscv/microblaze-v-generic.c          |  1 +
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 15cabe11777..d419dc49a25 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -123,6 +123,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[TIMER_IRQ]);
 
     dev = qdev_new("xlnx.xps-ethernetlite");
+    qdev_prop_set_enum(dev, "endianness", endianness);
     qemu_configure_nic_device(dev, true, NULL);
     qdev_prop_set_uint32(dev, "tx-ping-pong", 0);
     qdev_prop_set_uint32(dev, "rx-ping-pong", 0);
diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 14bf2b2e17a..15d9b95aa80 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -34,6 +34,7 @@
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
 #include "hw/misc/unimp.h"
 #include "net/net.h"
 #include "trace.h"
@@ -85,6 +86,7 @@ struct XlnxXpsEthLite
 {
     SysBusDevice parent_obj;
 
+    EndianMode model_endianness;
     MemoryRegion container;
     qemu_irq irq;
     NICState *nic;
@@ -183,10 +185,10 @@ static void port_tx_write(void *opaque, hwaddr addr, uint64_t value,
     }
 }
 
-static const MemoryRegionOps eth_porttx_ops = {
+static const MemoryRegionOps eth_porttx_ops[2] = {
+    [0 ... 1] = {
         .read = port_tx_read,
         .write = port_tx_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
         .impl = {
             .min_access_size = 4,
             .max_access_size = 4,
@@ -195,6 +197,9 @@ static const MemoryRegionOps eth_porttx_ops = {
             .min_access_size = 4,
             .max_access_size = 4,
         },
+    },
+    [0].endianness = DEVICE_LITTLE_ENDIAN,
+    [1].endianness = DEVICE_BIG_ENDIAN,
 };
 
 static uint64_t port_rx_read(void *opaque, hwaddr addr, unsigned int size)
@@ -232,10 +237,10 @@ static void port_rx_write(void *opaque, hwaddr addr, uint64_t value,
     }
 }
 
-static const MemoryRegionOps eth_portrx_ops = {
+static const MemoryRegionOps eth_portrx_ops[2] = {
+    [0 ... 1] = {
         .read = port_rx_read,
         .write = port_rx_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
         .impl = {
             .min_access_size = 4,
             .max_access_size = 4,
@@ -244,6 +249,9 @@ static const MemoryRegionOps eth_portrx_ops = {
             .min_access_size = 4,
             .max_access_size = 4,
         },
+    },
+    [0].endianness = DEVICE_LITTLE_ENDIAN,
+    [1].endianness = DEVICE_BIG_ENDIAN,
 };
 
 static bool eth_can_rx(NetClientState *nc)
@@ -300,6 +308,14 @@ static NetClientInfo net_xilinx_ethlite_info = {
 static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
 {
     XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
+    unsigned ops_index;
+
+    if (s->model_endianness == ENDIAN_MODE_UNSPECIFIED) {
+        error_setg(errp, TYPE_XILINX_ETHLITE " property 'endianness'"
+                         " must be set to 'big' or 'little'");
+        return;
+    }
+    ops_index = s->model_endianness == ENDIAN_MODE_BIG ? 1 : 0;
 
     memory_region_init(&s->container, OBJECT(dev),
                        "xlnx.xps-ethernetlite", 0x2000);
@@ -328,7 +344,7 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
                                BUFSZ_MAX, &error_abort);
         memory_region_add_subregion(&s->container, 0x0800 * i, &s->port[i].txbuf);
         memory_region_init_io(&s->port[i].txio, OBJECT(dev),
-                              &eth_porttx_ops, s,
+                              &eth_porttx_ops[ops_index], s,
                               i ? "ethlite.tx[1]io" : "ethlite.tx[0]io",
                               4 * TX_MAX);
         memory_region_add_subregion(&s->container, i ? A_TX_BASE1 : A_TX_BASE0,
@@ -340,7 +356,7 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
         memory_region_add_subregion(&s->container, 0x1000 + 0x0800 * i,
                                     &s->port[i].rxbuf);
         memory_region_init_io(&s->port[i].rxio, OBJECT(dev),
-                              &eth_portrx_ops, s,
+                              &eth_portrx_ops[ops_index], s,
                               i ? "ethlite.rx[1]io" : "ethlite.rx[0]io",
                               4 * RX_MAX);
         memory_region_add_subregion(&s->container, i ? A_RX_BASE1 : A_RX_BASE0,
@@ -363,6 +379,7 @@ static void xilinx_ethlite_init(Object *obj)
 }
 
 static const Property xilinx_ethlite_properties[] = {
+    DEFINE_PROP_ENDIAN_NODEFAULT("endianness", XlnxXpsEthLite, model_endianness),
     DEFINE_PROP_UINT32("tx-ping-pong", XlnxXpsEthLite, c_tx_pingpong, 1),
     DEFINE_PROP_UINT32("rx-ping-pong", XlnxXpsEthLite, c_rx_pingpong, 1),
     DEFINE_NIC_PROPERTIES(XlnxXpsEthLite, conf),
diff --git a/hw/riscv/microblaze-v-generic.c b/hw/riscv/microblaze-v-generic.c
index ebdd461ae98..a21fdfbe6db 100644
--- a/hw/riscv/microblaze-v-generic.c
+++ b/hw/riscv/microblaze-v-generic.c
@@ -120,6 +120,7 @@ static void mb_v_generic_init(MachineState *machine)
 
     /* Emaclite */
     dev = qdev_new("xlnx.xps-ethernetlite");
+    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
     qemu_configure_nic_device(dev, true, NULL);
     qdev_prop_set_uint32(dev, "tx-ping-pong", 0);
     qdev_prop_set_uint32(dev, "rx-ping-pong", 0);
-- 
2.47.1


