Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F8ACC6B2F
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 03:20:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHBzf-0006kH-VE; Wed, 14 Oct 2026 23:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xHBzZ-0006hV-MP
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 23:18:53 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xHBzX-0006if-VV
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 23:18:53 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-89a837bf00eso394483b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 20:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1792034330; x=1792639130; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lSuRssBqPq4eepN2kOGh1UyXRV553icR6wX0UHNQwfg=;
 b=PcxclAqkFxo+VPRePDGhoh9ZqxQEXKYmWm0zRvZVwpPAfFwbp6uSGR4m6fNeqF3f8C
 sHtfK7wrpSgpW5OsldEEnK5UlbPwWTVXVV5NzQwDPqKTmqN8frxzQsv5sIXLQ+H/byl/
 HJlxUh0NjNp8qAnqfUGDJ0EETwYOhyPazZlYZEid6W1gQjdj8ud0/RMln6tGgbEWr7e+
 QgJZ9XGsjZ4ECchvCNOqH6l3fXmp8Uc9BmcWlJPifjXQsQEcX3OFhojV6s5CUJh5B7Hh
 DZu9cglhiFCVKTezWZFx82CMKZ1OAbFs4G5AzCLmEtleSiGyuEc7YRez2TP0uGaXMF6g
 875g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792034330; x=1792639130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=lSuRssBqPq4eepN2kOGh1UyXRV553icR6wX0UHNQwfg=;
 b=NmnGvHDgndBcAc99ks2TcPKFWrA9rHi5SM44TtuEhQaQSLd0pOmNshiEHz0H0BLWsD
 Cko0tFZPfWxF+9Rg54MSnKGDYANYGzCBd6+V07TAGMtkj+0B+smUFr20BESqolsGxpwj
 SsdU0HOECv5TYdwNXcjog/Zipc1mfQs9pRHIDIb3GZt5Du5FsjBugi/PmemjUdIXXJdo
 p7bGYLF+5Ng3t15yfObvqgiE18wyBuzP9/2Gx8KK0uCbo2jW1QaMjqG85nSXLxgnowPe
 Z6XMn/59CphwpJfAssOuXHjl5D1aiWkI4SeEBvIT6o9KNZBheSjnS2zxuOS1YUMEpFh4
 IUuw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2qIJ0HYPg1AlbMM3+73yXmREnrQXT76aSDTHQjcdRwxQreWDxtQozgAsP0zRDo8VxE936Ko95qc02@nongnu.org
X-Gm-Message-State: AFq9FYLMjtD2TVUhZgdUG1at4WTmed3aT4P2Bcnc2IfRsWLXbBhmxcSB
 x5rOtIzNUkw6K44vZboYs32CV6V3Gs8T9frSFnDn0cUBezUpjzWbyjCpXZepxoZ1uYE=
X-Gm-Gg: AYBFou1MkL2WPn/xdyc3nWqg0eDFi2APeFlthJ1M2yDDavyKQHcJd7la4vnqm4hFNcT
 LkBLrI9KL5Xg6/EJjj+qPgfV4oXCL2nncPm08JGxkEs+P2HaWAbTz6MXuDH/hIiYTuPRmwWjHBQ
 jmaoUXIXaBA1TeQqTq8W7RnHjSmO+6MHbAQ4VboqmOX3tFiliA1OxwN+iNYJ4hf+atxox6aHsOv
 8TCHoU1xCVCkPvKTK/whOueiWIMFUd/ze7gZIUcI1VsP4qCQtk0TMp6dN1YKxYOV41DZB0X+FOU
 J98UasjWnTXUCn6PiKxNgoVoGexQcr52SOOAqmaAlIehtzbCKj4FGNwI/XP004HsQnEFXBLCfv8
 QAxvCOl5ltUZmSlaGnlitv9Mga6nv9QhHuKnXVSrv8qm0SxcmeO/CRUoe7dmLapRxofonJGAeWy
 7ME/+v0fGFubiBnPkQp2ySdjZeMmvkmYiOlCNqhWRM8pKl1cLgNgZKa8F9DZkcxKIGgYcwiFvTY
 m1Pz96W9pFmBlZX6v8cSnChswDYhXQE43DJdWuUod8lIOA=
X-Received: by 2002:a17:90b:224e:b0:3a0:bcc8:1549 with SMTP id
 98e67ed59e1d1-3ab3afb180emr25908491a91.6.1792034330649; 
 Wed, 14 Oct 2026 20:18:50 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ac93049ec2sm1321725a91.1.2026.10.14.20.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 20:18:50 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>
Subject: [PATCH 05/12] hw/riscv/atlantis: Create CPU cluster for Atlantis cpus
Date: Thu, 15 Oct 2026 13:17:57 +1000
Message-ID: <20261015031804.2406055-6-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015031804.2406055-1-portias@oss.tenstorrent.com>
References: <20261015031804.2406055-1-portias@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=portias@tenstorrent.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In preparation for adding the RCPU, put the Ascalon harts in a
CPUCluster. This will allow gdb to properly handle CPUs of different
types.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 hw/riscv/Kconfig               |  1 +
 hw/riscv/tt_atlantis.c         | 13 ++++++++++++-
 include/hw/riscv/tt_atlantis.h |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index d89fdfcc86..4eccfa443e 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -149,6 +149,7 @@ config TENSTORRENT
     select DESIGNWARE_I2C
     select DS1338
     select TMP105
+    select CPU_CLUSTER
 
 config XIANGSHAN_KUNMINGHU
     bool
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index f087fd16e3..5a2665b211 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -50,6 +50,8 @@ QEMU_BUILD_BUG_ON(TT_IMSIC_STRIDE != (0x1000 << TT_IMSIC_GUEST_BITS));
 #define TT_ACLINT_MTIMECMP      0x8000
 #define TT_ACLINT_TIMEBASE_FREQ 1000000000
 
+#define ASCALON_CLUSTER_ID     0
+
 static const MemMapEntry tt_atlantis_memmap[] = {
     /* Keep sorted with :'<,'>!sort -g -k 4 */
     [TT_ATL_DDR_LO] =           { 0x00000000,    0x80000000 },
@@ -556,7 +558,10 @@ static void tt_ascalon_cluster_init(Object *obj)
 {
     TTAscalonClusterState *ac = TT_ASCALON_CLUSTER(obj);
 
-    object_initialize_child(obj, "cpus", &ac->cpus, TYPE_RISCV_HART_ARRAY);
+    object_initialize_child(obj, "tt-ascalon.cluster", &ac->cluster,
+                            TYPE_CPU_CLUSTER);
+    object_initialize_child(OBJECT(&ac->cluster), "cpus", &ac->cpus,
+                            TYPE_RISCV_HART_ARRAY);
 }
 
 static void tt_ascalon_cluster_realize(DeviceState *dev, Error **errp)
@@ -594,6 +599,12 @@ static void tt_ascalon_cluster_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&ac->cpus), errp)) {
         return;
     }
+
+    qdev_prop_set_uint32(DEVICE(&ac->cluster), "cluster-id", ASCALON_CLUSTER_ID);
+    /* cluster must be realized after the hart array */
+    if (!qdev_realize(DEVICE(&ac->cluster), NULL, errp)) {
+        return;
+    }
 }
 
 static const Property tt_ascalon_cluster_props[] = {
diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index 52b44504ae..e5fce1f675 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -15,6 +15,7 @@
 #include "hw/intc/riscv_imsic.h"
 #include "hw/misc/tt_atlantis_prcm.h"
 #include "hw/char/dw8250.h"
+#include "hw/cpu/cluster.h"
 #include "hw/riscv/riscv_hart.h"
 
 #define TYPE_TT_ATLANTIS_MACHINE MACHINE_TYPE_NAME("tt-atlantis")
@@ -40,6 +41,7 @@ struct TTAscalonClusterState {
     MemoryRegion memory;
 
     RISCVHartArrayState cpus;
+    CPUClusterState cluster;
     MemoryRegion bootrom;
 
     uint32_t num_harts;
-- 
2.43.0


