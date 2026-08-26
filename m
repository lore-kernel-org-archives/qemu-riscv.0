Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BC1C61DC4
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 16:50:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzGo7-0006Lm-MG; Wed, 26 Aug 2026 12:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzGo5-0006KT-S6
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 12:48:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzGo2-0000we-NN
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 12:48:57 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QDuYse502286
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 16:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=sKbGwJXyn+M
 cuKxpE6iklpsr3F53nmaiHi3Fl9IxJqo=; b=cE+mt4D0aEPmO+goMV7LYVrWVYz
 DiRMoWFiCVNznUQy1K29Ix7icmusLDcaxUPn3Yfk7k7UsVLrf5y4TDkjscm0EvOh
 RSHv7Ur1VCUZdFoKsh2hVmfeX4wfB7i4pBppNHGjx7MkVePaaX4fQGK3fXKxKdYW
 c0SHbLbAmuz07TsK3uRTO0mt+selVu1FpcKoYnwlbZzy65kqhUJzixXCBdRsICcO
 utG42JwLiHIeSopbLgCBaEs/1ov1rCCQZrELyaOzBNNf388S9wUGlzMvxB99JeHh
 pSBSCVC7gDBFaNxllXu1iRXY9UIfzAwtSHZxme4kJWmGMtRcEHPJqkdUQYw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03u12q3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 16:48:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-90cc2b97f8fso21373876d6.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 09:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787762932; x=1788367732; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sKbGwJXyn+McuKxpE6iklpsr3F53nmaiHi3Fl9IxJqo=;
 b=VGeTy3wlj6zHwVe+G7C93CinxqDkjR+JAw5Ft3zNNgCOrAnto69Qe5yekqZSR/dhuv
 N8uPOpZ89FUdV5mydwJW60LKA3X5FGZCfgyG4G2QF2EgKT/C64hFazx2BBqReehJwkwP
 qIkchZZrwAUsw5zxFM46BLhiZG1VUUO41VeZ0pP9ydPHysEZCXB1gRHLjBhCgm54sX0e
 jfv9XZVH/tZ2rMuiXAV+4H0tM2FZjD24KhJQpiMX0X71kWRTDRQe0inXB7Wtx42oSp4n
 vUelZaQdb2l5K38PD+LDml8aNmpS8RF/S/zo/ZVRi/tIM9OWFcCi8Id7ETEQyOE/43a3
 x1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787762932; x=1788367732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sKbGwJXyn+McuKxpE6iklpsr3F53nmaiHi3Fl9IxJqo=;
 b=Gwu6ETkwvOTMahhqr9K7CFp8Q0Bm+ni33PKG9ILWngOfukHS6uJaEjRwUpS5GdIKvN
 MS5ku+27e6smFd5g8ppwG7Hjb8EK1Mttb2EAyt+lo490FeYI+gMl9cZLb4AgKGYr73OK
 a7TMuPTfn78qC0S5RPCmp16fCLlWFXNPMhJ2b8YiuTfPWohE2oJjP9lj3iQKM2SpIEKS
 n88WB2z+DEQTYwVbki6aJeQZ7qMVyWQ3SVmTZBR/xrVuxlJWOrGWONNaHDRzASMFdQ67
 HfFe2j4XBA4VY5b0Ikx9JlaKD8eANftoWyw0aNPYdcm0anLW2wWDKaqyV61xY3VtXHon
 yYYw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoS7NeNFjCcuSqun5bZCKAIjU5Joutsuy+W/bWm9jVBZvlSBue8xI4Q8RW3ztSkWjokxaq5qJXW5G8o@nongnu.org
X-Gm-Message-State: AFuF++lKBILgHgLKfwxApg1qebVzE5YHXw5vZvNgqqu1lYQXonz0yQ/1
 JFOJ6yQbHID3vbLX1c91tpyap4nmfsbcAfQa9U6tpwt/QXi1inm9SFy+LwRzeOnQYDYD5N9XkkF
 sy9ySsP7L5DPsB3hQ9HnF6MQlx47j2uRp5RKjKw4msID4NYbf/qwACwqqwA==
X-Gm-Gg: AR+sD12vhr0P4VAjeIpRNXopiIQEV4d03Ls86fq4o2KGh8g7oia0FpO197HdJsZ6Kbv
 uim5UW+mJx1RX3F+yRMr3lLj/Jfv7Qd2rGp63D054Gn63nssEhti/M2gtbitOFpTcEQQGcjZ+gR
 keKWIPuqloZgfIM7O3R9f8RQydyY2GwQhz9BZvtT3qOM0+s1zn+PxodIbwhM6cG4t5LYyAZMZZi
 /hvCiWw5KY/c80cOhMWFUvbGKuIx1E0ahKlulMWvrD03I+ar578NUzjZstb6mJ+8gq39ThZlMVJ
 71AO1cXOjqkBVywk//O97VWeKRlfsPikuGKJAurtAK6mdlGy+76nWaWHWx3PPpY0VLAor4OC1ZK
 75T90k4ac0v4Sx7804dkv+c1D65+HXFLcKAn7RA==
X-Received: by 2002:a05:622a:8319:b0:52e:f03e:4af7 with SMTP id
 d75a77b69052e-52ef03e57f5mr37907341cf.17.1787762931538; 
 Wed, 26 Aug 2026 09:48:51 -0700 (PDT)
X-Received: by 2002:a05:622a:8319:b0:52e:f03e:4af7 with SMTP id
 d75a77b69052e-52ef03e57f5mr37905881cf.17.1787762930318; 
 Wed, 26 Aug 2026 09:48:50 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52e4275fc3esm20092651cf.25.2026.08.26.09.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 09:48:49 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v2 11/13] hw/riscv/device-common, virt.c: add flash helpers
Date: Wed, 26 Aug 2026 13:48:11 -0300
Message-ID: <20260826164814.44335-12-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
References: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MCBTYWx0ZWRfXyuS1oXGKfjvX
 0A/TiclmdUsrNys//6zBB5zxAEDW8LoJoTTTb0PBXuBnDFzyP9FD1TP2qHT5mWqW/DjPh1TKg2l
 QWzLrr9RJ1zzsfTGHm+FzSOG7JBm6+0ahHZkqhQ/pOFfzYuOwxL7ojU4wfDpmddmNkLgoFTiRtX
 mLo4W7PBAK9cvWtWhwt27sQBLCXEDfgvjzU9GlsmJUxDPpAHGuEZKghn+i1VVNUB/e8B5gqo4P6
 B3OlMIu6eUCWw9gZfqL5gj8vJHXAZY2uQeqrHsBIhedNmzp9b33mzei+l+bdHIs9ri0WWvrOjWT
 DnTsbY8RHY1OGFce8Pe8dUzZiItgRXx0jlW6Jw2I1PmWyIJg44y6fyotc75mX4kzRzv337p/+Dd
 kG/FI1q+8S9bKQ3LRm4swfWgCHpXWnW/FDRTSv3O2roufQpsBAdEaK1QnETRXvUP+5OdCkIWUeB
 JYFbNevw/TsLGVYDXWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MCBTYWx0ZWRfXx9/XM3YThuYR
 d8vs1JdefSB7UF49IPU6i+ylNfNRKlZh0zO6yVKkopDs7FxKjDPLMKMG7DtvlOByGUVAMOTxaQ7
 6+9rA8T21Jaz6Ei+21eWZfDWLxGwjg0=
X-Proofpoint-ORIG-GUID: lf6bw8N_pdsDYaXwFyKCOb3uit52qdiF
X-Authority-Analysis: v=2.4 cv=RcqgzVtv c=1 sm=1 tr=0 ts=6a8f18f5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Ak_EWCeJEXv7LabEeCgA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: lf6bw8N_pdsDYaXwFyKCOb3uit52qdiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260140
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Move the flash device creating and flash map initialization to
device-common.c.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/device-common.c         | 44 ++++++++++++++++++++++++
 hw/riscv/virt.c                  | 57 +++++---------------------------
 include/hw/riscv/device-common.h |  6 ++++
 3 files changed, 58 insertions(+), 49 deletions(-)

diff --git a/hw/riscv/device-common.c b/hw/riscv/device-common.c
index 74627b996d..03e85a7c86 100644
--- a/hw/riscv/device-common.c
+++ b/hw/riscv/device-common.c
@@ -10,11 +10,13 @@
 
 #include "hw/riscv/device-common.h"
 
+#include "hw/block/flash.h"
 #include "hw/core/platform-bus.h"
 #include "hw/core/qdev.h"
 #include "hw/core/qdev-properties.h"
 #include "hw/core/sysbus.h"
 #include "qapi/error.h"
+#include "qom/object.h"
 #include "system/address-spaces.h"
 #include "system/memory.h"
 
@@ -46,3 +48,45 @@ DeviceState *create_platform_bus(DeviceState *irqchip,
 
     return dev;
 }
+
+PFlashCFI01 *riscv_flash_create(Object *parent, const char *name,
+                                const char *alias_prop_name,
+                                int flash_sector_size)
+{
+    /*
+     * Create a single flash device.  We use the same parameters as
+     * the flash devices on the ARM virt board.
+     */
+    DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
+
+    qdev_prop_set_uint64(dev, "sector-length", flash_sector_size);
+    qdev_prop_set_uint8(dev, "width", 4);
+    qdev_prop_set_uint8(dev, "device-width", 2);
+    qdev_prop_set_bit(dev, "big-endian", false);
+    qdev_prop_set_uint16(dev, "id0", 0x89);
+    qdev_prop_set_uint16(dev, "id1", 0x18);
+    qdev_prop_set_uint16(dev, "id2", 0x00);
+    qdev_prop_set_uint16(dev, "id3", 0x00);
+    qdev_prop_set_string(dev, "name", name);
+
+    object_property_add_child(parent, name, OBJECT(dev));
+    object_property_add_alias(parent, alias_prop_name,
+                              OBJECT(dev), "drive");
+
+    return PFLASH_CFI01(dev);
+}
+
+void riscv_init_flash_map(PFlashCFI01 *flash, hwaddr base, hwaddr size,
+                          MemoryRegion *sysmem, int flash_sector_size)
+{
+    DeviceState *dev = DEVICE(flash);
+
+    assert(QEMU_IS_ALIGNED(size, flash_sector_size));
+    assert(size / flash_sector_size <= UINT32_MAX);
+
+    qdev_prop_set_uint32(dev, "num-blocks", size / flash_sector_size);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    memory_region_add_subregion(sysmem, base,
+                            sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 7ecc3aeb6e..6ffafae46d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -120,53 +120,12 @@ static MemMapEntry virt_high_pcie_memmap;
 
 #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
 
-static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
-                                       const char *name,
-                                       const char *alias_prop_name)
-{
-    /*
-     * Create a single flash device.  We use the same parameters as
-     * the flash devices on the ARM virt board.
-     */
-    DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
-
-    qdev_prop_set_uint64(dev, "sector-length", VIRT_FLASH_SECTOR_SIZE);
-    qdev_prop_set_uint8(dev, "width", 4);
-    qdev_prop_set_uint8(dev, "device-width", 2);
-    qdev_prop_set_bit(dev, "big-endian", false);
-    qdev_prop_set_uint16(dev, "id0", 0x89);
-    qdev_prop_set_uint16(dev, "id1", 0x18);
-    qdev_prop_set_uint16(dev, "id2", 0x00);
-    qdev_prop_set_uint16(dev, "id3", 0x00);
-    qdev_prop_set_string(dev, "name", name);
-
-    object_property_add_child(OBJECT(s), name, OBJECT(dev));
-    object_property_add_alias(OBJECT(s), alias_prop_name,
-                              OBJECT(dev), "drive");
-
-    return PFLASH_CFI01(dev);
-}
-
 static void virt_flash_create(RISCVVirtState *s)
 {
-    s->flash[0] = virt_flash_create1(s, "virt.flash0", "pflash0");
-    s->flash[1] = virt_flash_create1(s, "virt.flash1", "pflash1");
-}
-
-static void virt_flash_map1(PFlashCFI01 *flash,
-                            hwaddr base, hwaddr size,
-                            MemoryRegion *sysmem)
-{
-    DeviceState *dev = DEVICE(flash);
-
-    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
-    assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
-    qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    memory_region_add_subregion(sysmem, base,
-                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev),
-                                                       0));
+    s->flash[0] = riscv_flash_create(OBJECT(s), "virt.flash0", "pflash0",
+                                     VIRT_FLASH_SECTOR_SIZE);
+    s->flash[1] = riscv_flash_create(OBJECT(s), "virt.flash1", "pflash1",
+                                     VIRT_FLASH_SECTOR_SIZE);
 }
 
 static void virt_flash_map(RISCVVirtState *s,
@@ -175,10 +134,10 @@ static void virt_flash_map(RISCVVirtState *s,
     hwaddr flashsize = s->memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = s->memmap[VIRT_FLASH].base;
 
-    virt_flash_map1(s->flash[0], flashbase, flashsize,
-                    sysmem);
-    virt_flash_map1(s->flash[1], flashbase + flashsize, flashsize,
-                    sysmem);
+    riscv_init_flash_map(s->flash[0], flashbase, flashsize,
+                         sysmem, VIRT_FLASH_SECTOR_SIZE);
+    riscv_init_flash_map(s->flash[1], flashbase + flashsize, flashsize,
+                         sysmem, VIRT_FLASH_SECTOR_SIZE);
 }
 
 static void create_fdt_socket_plic(RISCVVirtState *s,
diff --git a/include/hw/riscv/device-common.h b/include/hw/riscv/device-common.h
index f91c39511f..1cdb8ab5cc 100644
--- a/include/hw/riscv/device-common.h
+++ b/include/hw/riscv/device-common.h
@@ -10,10 +10,16 @@
 #define RISCV_DEVICE_COMMON_H
 
 #include "exec/hwaddr.h"
+#include "hw/block/flash.h"
 #include "hw/core/qdev.h"
 
 DeviceState *create_platform_bus(DeviceState *irqchip,
                                  const MemMapEntry *platform_bus_mem,
                                  int platform_bus_base_irq,
                                  int platform_bus_num_irqs);
+PFlashCFI01 *riscv_flash_create(Object *parent, const char *name,
+                                const char *alias_prop_name,
+                                int flash_sector_size);
+void riscv_init_flash_map(PFlashCFI01 *flash, hwaddr base, hwaddr size,
+                          MemoryRegion *sysmem, int flash_sector_size);
 #endif
-- 
2.43.0


