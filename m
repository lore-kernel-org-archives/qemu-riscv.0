Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C8B606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 04:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=fWDnNfs4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLvKi-0007bT-Rh; Wed, 28 Oct 2026 00:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xLvKT-0007Xx-Kx
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 00:32:05 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xLvKR-0001ed-VZ
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 00:32:01 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-3ac6971aaebso50963a91.3
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 21:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1793161919; x=1793766719; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nrsCEOFP+P+GVjt2HnqxRXhb4WtF/Kann6KO1TyB3JY=;
 b=fWDnNfs4iBv1KTpPjO9rlvs3fCJkTMO8Dni+gnYhmvtN4FugtJVZ7c+LPlMGniSEO7
 WhT+DN+sEyea1N0ROjo0al2JZ2DDhAIG2ApK8ILk3WAb/L3HrGCsddwmcdC6Jx9kGKJ6
 i6sYBPX3Kx7SVmigWEhenDXssgkX1fKQCIfpgH1FSJT00uFmBCPPzhqQDabQflOfEutD
 XvFTB/mFSR6uzFvy4bWkj6VODVqpS/5mZE7i+LNS/6CYC69IV5bzELUZgUFxtH733irm
 RFr5oCrpX7aeHUSgYqvtaKEkHG5+ZxJF1AeCU4d+WXPxjj+zlZv4/wv8rHbsDcONIoUR
 inQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793161919; x=1793766719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nrsCEOFP+P+GVjt2HnqxRXhb4WtF/Kann6KO1TyB3JY=;
 b=UEuO2xlAVPdwj6ZrufCGzQSqdR4O7J2DP3oFhLxDM9cCr58zkhth1HdlgO+iwAHyDz
 9FEXnKjzvKdHiPDIM3ZkKhD0n5fMDSrvmCrutFOpOvAdLU6zVkemF7anrUDf1tFrUZq8
 WRnKCjtkQ0QZSunuM9y4CRD2JDDEEMxyURuZNZ0/cHR5g/d/mZAxCuCOcmpBBRoTG3GH
 VpEEMmSEJQwKvnPH3MWXroWxrQXpiocmzIlbHs5RqLUim0Kks2PNcFwv4t532LEAyUby
 8qEVYSaRrMhBHmOzty3AMS+jIXnQ0lB0bIQ2gbFQebgY8kkihP/gHJDYLeAlS+n7PJaa
 pxfQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz621YsbhpMv1BfPKQxcy4wuwzCY+A/eRT2DXGg/kWjV9q/sVHAVnTSsO2IR8GBICx3IO0lEgylziCI@nongnu.org
X-Gm-Message-State: AFq9FYKNGK26XZVdXj9WwmRZhfqxhkGUiw7nCUAZWjKo2jc3ryDBk6BY
 GmdqMU4zDak0GjgPVT0l3G19X/vy3U5YUbAvPMif7IX++yFG+X9tybweUmKV3w5r2+U=
X-Gm-Gg: AYBFou3ejO/5+52MKswV+BLaeUoh/u9vX3YWqZhDYboophWsGoY3CS6/GFD/FaVbJxb
 snTTSxe/Lz0MprsVoOK+fjorbFpy+7NR1KNzyAWX6G1t9d0jkQjKCDgO08aE+z6yk22ArjS7EUt
 PMla+zDk7+TuSKRjTEW1RDAYIB8ZwCcl8spoYk5ULUDT7Zxg7UlKuiCMzg4OBeWgnbCfw/mOT7w
 8qIaF520TzB8aL8ixVM/hJPkCGwWuWnadqnelBZzLnT6SIG6XeuJ9OypzixRcutMIcmvbhnzTTq
 QfUc538sy24YOylUJmOJWyM8uXhnMt8FfY2oeKrWexmDF3zhq85qlQVOKmeiR01R1xjyxKlZZLK
 wCuLbtyQ8E5fsjyw8TywgFr2GOdtuMsTbA8aAVEetdKYThw3hveLEYU6goY/abbWRLKmnZH3MC5
 ndnOxAfw/L8WcvXbfa3q7Rrhzk0q/vFhMVHyZsla4BPiqn84Q2FsHJul5GAdmQVOKdhJNMYOWnt
 4Pg65ZiZGPV10iMH5tvFLyk8yaAmumycfEwf6hi+nSJ6d/b0dsqy7wH/JVyBXnfhoUA28Op+wlq
 dvs1vpUbNBFBijMsS+lHF7aGC4Far22NWGULHiY2MNJpDWbTgnOAYvMkszGy3ROXeXI3BppQmJO
 /9Q==
X-Received: by 2002:a17:90b:1a82:b0:3a4:9d98:f980 with SMTP id
 98e67ed59e1d1-3ae57e2c7b2mr1532990a91.1.1793161918752; 
 Tue, 27 Oct 2026 21:31:58 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae5a5d45a8sm1024470a91.17.2026.10.27.21.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 21:31:58 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Michael Ellerman <mpe@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 07/10] hw/riscv/atlantis: Back RCPU memory region by
 unimplemented device
Date: Wed, 28 Oct 2026 14:30:56 +1000
Message-ID: <20261028043059.600498-8-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028043059.600498-1-portias@oss.tenstorrent.com>
References: <20261028043059.600498-1-portias@oss.tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=portias@tenstorrent.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Most devices on the RCPU memmap are not modeled yet in QEMU. Back the
entire 4G memory view of the RCPU by a low priority unimplemented
device. This prevents accesses to non-modeled device from faulting.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 hw/riscv/Kconfig               |  1 +
 hw/riscv/tt_atlantis.c         | 20 ++++++++++++++++++++
 include/hw/riscv/tt_atlantis.h |  6 ++++++
 3 files changed, 27 insertions(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 4eccfa443e..8e1812923a 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -150,6 +150,7 @@ config TENSTORRENT
     select DS1338
     select TMP105
     select CPU_CLUSTER
+    select UNIMP
 
 config XIANGSHAN_KUNMINGHU
     bool
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index edf2180a98..66cbb2b8cf 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -519,6 +519,17 @@ static void load_fdt(TTAtlantisState *ams)
     create_fdt_memory(ms->fdt, ac->memmap, ms->ram_size);
 }
 
+static void mmio_map_unimplemented(MemoryRegion *memory, SysBusDevice *dev,
+                                   const char *name, hwaddr addr, uint64_t size)
+{
+    qdev_prop_set_string(DEVICE(dev), "name", name);
+    qdev_prop_set_uint64(DEVICE(dev), "size", size);
+    sysbus_realize(dev, &error_abort);
+
+    memory_region_add_subregion_overlap(memory, addr,
+                                        sysbus_mmio_get_region(dev, 0), -1000);
+}
+
 static void tt_atlantis_machine_done(Notifier *n, void *data)
 {
     TTAtlantisState *ams = container_of(n, TTAtlantisState, machine_done);
@@ -596,6 +607,8 @@ static void tt_rcpu_cluster_init(Object *obj)
                             TYPE_CPU_CLUSTER);
     object_initialize_child(OBJECT(&rc->cluster), "cpus", &rc->cpus,
                             TYPE_RISCV_HART_ARRAY);
+    object_initialize_child(OBJECT(rc), "tt-rcpu.unimp-mem", &rc->unimp_mem,
+                            TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 static void tt_rcpu_cluster_realize(DeviceState *dev, Error **errp)
@@ -651,6 +664,13 @@ static void tt_rcpu_cluster_realize(DeviceState *dev, Error **errp)
     if (!qdev_realize(DEVICE(&rc->cluster), NULL, errp)) {
         return;
     }
+
+    /*
+     * Map the entire 4G memory view as unimplemented to prevent faults from
+     * devices that have not been modeled yet.
+     */
+    mmio_map_unimplemented(&rc->memory, SYS_BUS_DEVICE(&rc->unimp_mem),
+                           "tt-rcpu.unimp", 0, UINT32_MAX);
 }
 
 static void tt_rcpu_cluster_class_init(ObjectClass *oc, const void *data)
diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index ceb138dc88..4dfeb993d4 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -16,6 +16,7 @@
 #include "hw/misc/tt_atlantis_prcm.h"
 #include "hw/char/dw8250.h"
 #include "hw/cpu/cluster.h"
+#include "hw/misc/unimp.h"
 #include "hw/riscv/riscv_hart.h"
 
 #define TYPE_TT_ATLANTIS_MACHINE MACHINE_TYPE_NAME("tt-atlantis")
@@ -63,6 +64,11 @@ struct TTRCPUClusterState {
     CPUClusterState cluster;
     MemoryRegion bootrom;
     MemoryRegion sram;
+    /*
+     * All device memory is backed by a catch-all unimplemented device to
+     * prevent faults on accesses to regions not modeled.
+     */
+    UnimplementedDeviceState unimp_mem;
 };
 
 struct TTAtlantisSoCState {
-- 
2.43.0


