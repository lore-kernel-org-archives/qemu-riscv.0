Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6F6C5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 21:48:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLT8-0003Zl-AS; Wed, 26 Aug 2026 17:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLT6-0003WL-Eh
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLT4-0001Oy-Op
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:36 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QKdWU82340300
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TXXYzGBfZD6V3RJhLGHE2ttOLnRMKqlY3H2NvRaYbog=; b=Umeowt5MdZb/ozUd
 1e5/Z59XpAYJ6MLot1YagxJojtLPFHTA1L+SiEgFhD1Q+VCoqMHZA3BvNGFioFZ/
 fO4hbLWpBPAnjQ2R9OUjdAELaTb1LVjUKnihmhHJi6CgNeHXjiIb4yuFcU0R9Ml/
 Dv4o7f9nDVPU1xyp/bQvAFaHG4Myzg2EGEXWJCyjvzRRFd4XPkUUHVWcML+peyDI
 mtEKl2qmvYwAbV5/0EFZplPDSsW7PRXiQFIadu1KTSakVobPnGLglr6DrwrXAnlb
 dimkmHECZEVsA+kHMLkp2cpKZ0tXdaO9XRYO6MbtXldGJehEHK/h3Rxh/acvVjbS
 rq3Qkg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4eggxau-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-9077b4c35c5so26990366d6.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 14:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787780843; x=1788385643; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TXXYzGBfZD6V3RJhLGHE2ttOLnRMKqlY3H2NvRaYbog=;
 b=hR1opue+/Nw1kBRIuJxmal7qdJ+SUqmJiv5sngs8e2Y5dFQi1njrLVKHlfJUFOUDnq
 Wz0s5nhFwaljuYYfbBu+CKU5GkywkY8+IloxmlGPWdTuvXhNvDwW0CMcZy7jno84p7A6
 SmTTPrlzbAgH8jB1jmcAOAjwdREAro0soNugyFFtiv6ydHksh1lxnGQmum0kQltkNVtQ
 X/xUnaU46yoGT9nFIGivek8DfTkw6Br7xvgFI4WiII9rFRQhNjveKVMfemWlCy1gBA0u
 LroRnoNM2wjqo2k49RPjdcJj6iIlj6mukzfDdlRFioOv8dOt4VOKQYorrjpODTqqUqTr
 strQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787780843; x=1788385643;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TXXYzGBfZD6V3RJhLGHE2ttOLnRMKqlY3H2NvRaYbog=;
 b=rNPE54r3UCIk9lsx6lVa0XzCkiJmZ1bxja+NflcC41rm5z7luj65JKAi4D7meqDmbc
 FqRjrjWEzpS33K8CokwPPTFsvsHwu2wxJz6HbUeT4mvRMZj+tLQvwpaHu6wK1pppmXFF
 myMZtIL8Gp/LLW1OdzoYpxgflhydI884m/HfqMrq9VpXtd26/W61B0yK9CftD67E5nRb
 DbwDSm7IGb54IzZXkaQrDgXAvMnH7ha99PAwgpAzLN+BCJ/mePIIRUH6SH/jUix1Yuu6
 pcZNdGvH8zkGpkwKfGkea6QBdJlrBXDcdtWBTCIcIWWiiTXGkGKcvdTB20P2uPko9I7l
 6Lvw==
X-Gm-Message-State: AFuF++mRQVtWmtxzNzd9xDqYdh+U6iMY17FhRZSFaAhQUCDHuNq3pupz
 34/uz0Egqu55+AXkwribeROvnWWZHSC6RlvqMAIGC8zUFBaksOKPooxW9hekM/n9cW6AQQi2k5Y
 ZyDva0cWh4CL3sT37u4QvOQ0PgTNxVmn72k8NRgRb3dbP6/hsXJIC69eCUQ==
X-Gm-Gg: AR+sD13cfgchVQG113tt/yq8JJV1ddJHhPQGsx8cJqbNQq5piBPpYUwqYQGcoePKIF2
 nPwUwaKVbiWxAQyaSwDlFcQEUvbhdfS19izF/Uwj21OKAR+AxSwg6Ri2rk5HxNzpItzpuFZEuRD
 6B/jOG1I1l0GXjNdD8ZaLJhF1QT66Fl+S3jwf6R18r4NkU69ql32AdIbsROsXxokzjjsrB1pYAV
 f9W3fj8ihBJUyJJzDCQCP/aLiUpbSwbZkZVTHTl0fgxRXj1y4PEzuZkdZe91qMu/zvvhM/N8GX1
 T75A1fd3FYElz3I25foXMP2YRek9ITTr8QJFTZpid2arl+sVTOWs3alCYH9fHgM2SDTuKWOJ9sP
 I2YFUv5BhJMnmLeBgznY308qxUqn9DvlJ755NDQ==
X-Received: by 2002:a05:6214:20aa:b0:90c:8fe7:22f1 with SMTP id
 6a1803df08f44-90cc79498demr111228196d6.9.1787780843159; 
 Wed, 26 Aug 2026 14:47:23 -0700 (PDT)
X-Received: by 2002:a05:6214:20aa:b0:90c:8fe7:22f1 with SMTP id
 6a1803df08f44-90cc79498demr111227826d6.9.1787780842754; 
 Wed, 26 Aug 2026 14:47:22 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cd73e4117sm490916d6.24.2026.08.26.14.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 14:47:22 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 12/14] hw/riscv/device-common, virt.c: add flash helpers
Date: Wed, 26 Aug 2026 18:46:40 -0300
Message-ID: <20260826214643.122728-13-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DAORzXe3tOJB8dcIWvgc9uk3Pnd-gWGC
X-Proofpoint-ORIG-GUID: DAORzXe3tOJB8dcIWvgc9uk3Pnd-gWGC
X-Authority-Analysis: v=2.4 cv=DsRmPm/+ c=1 sm=1 tr=0 ts=6a8f5eeb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Faol744VrePhJRHcD5sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfX9U/+4HB4TIL9
 EQ+sGgUZCJH18LaiCFOVQ80C8Nelcm7I659eOaJZ8EmmLamlY6BAqZ1FM94JiWJejWuqVa0f0Fi
 RvQIdvg34x30+lYkxPdDV62Trjunwhggen+T73ZEHOjtKMCU2+Fzp/k5R++1kDiN5hU+tRIaKyu
 KGS3Frq4ut6AqxfKlUjZvI7SAezhPhXhldqa4KieMxcAAMgu4Dl+pPwdIYm63FQmOw/kTKVKadE
 QBUvmA44l1vMlRbjJgwu6r5yp9HFl5Ef342szDReXBJEWJxYdbEcj1YbSCXi8xiDLzRbnWFabyP
 ip6IFT4kcBVLqZtVnUf317LX93GINRcZQebPpyyF+/klOqlTAxT/d6ZcNcuXOzCe548fosyrqsq
 GbDn8BGmkZ7pMiJBlKSJRVRYVdrdWa4OBRa3ACbuLp9eCAdEOQDdCmIyV3WPC0vzyxwy5HLlqvM
 hvfz5UaWz9WZz1ZWk3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfXzLpO6f6ntet6
 ESbnc3mDLzsZW+hT748RdBJu9V3LdKEKmGQZwyZ3iW+GR8gtH16VDBAiLUgE/2Omy0wN4uT6hwL
 JKPSp1H1E2UULvSvaHE2B9t3arZkL40=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260183
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Move the flash device creating and flash map initialization to
device-common.c.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/device-common.c         | 44 ++++++++++++++++++++++++
 hw/riscv/virt.c                  | 57 +++++---------------------------
 include/hw/riscv/device-common.h |  6 ++++
 3 files changed, 58 insertions(+), 49 deletions(-)

diff --git a/hw/riscv/device-common.c b/hw/riscv/device-common.c
index d3c68a9e71..a054cd7114 100644
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
 
@@ -46,3 +48,45 @@ DeviceState *riscv_create_platform_bus(DeviceState *irqchip,
 
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
index 8ffe8ae538..b033c19fee 100644
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
index 12af031bbf..9f8bc67a1d 100644
--- a/include/hw/riscv/device-common.h
+++ b/include/hw/riscv/device-common.h
@@ -10,10 +10,16 @@
 #define RISCV_DEVICE_COMMON_H
 
 #include "exec/hwaddr.h"
+#include "hw/block/flash.h"
 #include "hw/core/qdev.h"
 
 DeviceState *riscv_create_platform_bus(DeviceState *irqchip,
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


