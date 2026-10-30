Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64767606A31D
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 04:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=CYwBZqP6
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMdsq-0002Va-Gv; Fri, 30 Oct 2026 00:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xMdsX-0002In-D8
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 00:06:10 -0400
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xMdsV-0004qG-J2
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 00:06:09 -0400
Received: by mail-dy1-x1331.google.com with SMTP id
 5a478bee46e88-36a1c464349so49417eec.3
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 21:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1793333166; x=1793937966; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Wr9vjAONdB2Syx/BR14BaJmjjUk/LAtxCkr5p3ncKuY=;
 b=CYwBZqP6bkB2WdLSI9tkEs5SfnGeex0835lsgZLTDlL/CNx0y9gVA6LxKgkq2BRWmY
 DfE65gqsq6R+RbAT3zBjqQ+uSKcxnDg6zkBOJ83hEDRl5wS/KAzqxk601on5D0iQwhUA
 MgiuC2aqfgNGk30gJ1Vu2wCO2PvPGMRVi73DECzkQvhWFyWGNqXdpuF6P1LBnMIC47se
 /dTHI3V79PLcOT59teYV4f3OnLXB8ddQCKuONTwVmi0ZApyDV+ZLmxEcqpwvdIWYdfrT
 FJ1ESFfhHH5msXZXMGdJvvsffGsg6OZJJzAArwYCWyaTHsilwxYCXy/D4G5lEqSkTeSg
 Jcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793333166; x=1793937966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Wr9vjAONdB2Syx/BR14BaJmjjUk/LAtxCkr5p3ncKuY=;
 b=TSlNvS2Afu7YJvIxODCkMrifig0Oqq9Es+qWy4ou0mwsuIjVItAdA/mnKcQpw6uhCR
 /+rpa//RuzXYYj4cCVI0yjc9/hD+3aaiaWtxtZQGcV5ZpMObFVNhpJYmObkjoo+HmjCv
 AcP0RT//TieEor10XNDZNu2SjrKkgfl1nBNb8oMyVV/6n75m2YrUtYSRC0u0U2aoKRXB
 XSAKJSBjvd7LUhH7eFtIRTnsWLgbY8HoXc6fO1bVPKNMOBbXzxbDAssr/dcs3GEK79XX
 PAVqmB6OtNd0sGbjuVvJbbmyKj+WYvkvjfJiYzIAnx7wY44b8y14xQTgmrMEEOGCkmbT
 4vQw==
X-Forwarded-Encrypted: i=1;
 AKwUvBySgeoIrKLUdjW9G/dGKlgknPUc44ukTgWWcpWWJn97zd9sZNMZCwdlCZ8RlPgaIg7OoDdiBUC+paXT@nongnu.org
X-Gm-Message-State: AFq9FYKo6/sUmHM2/X70VPYxnjw7j+7oEUZmSnYw4GVzrlfTiHGhfVgC
 4OZbuO5SJk2QiGneJkeckP8kjfK8NIhyKzmE15iOklFoSrxrSyb40/0Xf9E0mWU0Kmo=
X-Gm-Gg: AYBFou2uHbtYXZmohDq6AjT6qM8GbNs/Mg2Pe3eWxnCcQeOBK/1dva+bUyko34LLV6v
 7Umd8HsDhdikeMdqf2QKJO0771hIby6Bx6yUArsHRc/qPmQ7b8gBWUgHo1hUCiA/B5516nvgfY3
 FGjmjXrv6EN2spuVBuBiQXBWIAGJliJK1rDPsBr19DDZGwX0ewULV5o/VtWa7JxrbGmbMZDkICH
 OhcFEO3q177AGuE+PHc0PmdRQjr9HUfdMDU2GoAXsW7nPmKmvZj7alZoPLyXUrq6MUwbISX1KsQ
 j8X51i2LvjedmyCEHhzRlMQW+nil7+fJ1y4iiCVs/M8K3K+wXfFqZq6pxhgP1pTk0rd1Jvj8e75
 D4LIcMhJ+HiecZRBZIrOCzM6lR5F+SmS0C1PQEg9S03aT2EtpQyraay7zrA34OFU0VO6VPpBKea
 Xi94hN7OPmkwEM10GjrJlmCnvcmtq+w2n1TYmBbBfLSH1z9ADGO/eiUSKmXsx8GZYskamjrT8hw
 Ztw8aKjHUqGPJyjk+Di26VHDA+OB/UH7SMihljQcduHO/un1OLR8xO3UZ9wdbitoRSxouVqZnvS
 Bln8b4uO1fV/GvD08gDBHDt+Px2OF96AUqUJb7MGfB0ut4fX6JaMAS/b5Bw9Kt2L1GGbhQDpCU3
 7NZTugvL5KWKgJTiIoYpePxGF
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a4235ceddmr2980596eec.2.1793333166005; 
 Thu, 29 Oct 2026 21:06:06 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a428af1easm2957687eec.5.2026.10.29.21.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 21:06:05 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 Michael Ellerman <mpe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Zhao Liu <zhao1.liu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v3 7/9] hw/riscv/atlantis: Load the RCPU bootrom
Date: Fri, 30 Oct 2026 14:05:13 +1000
Message-ID: <20261030040516.853444-8-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030040516.853444-1-portias@oss.tenstorrent.com>
References: <20261030040516.853444-1-portias@oss.tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1331;
 envelope-from=portias@tenstorrent.com; helo=mail-dy1-x1331.google.com
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update tt-atlantis to, when the RCPU is enabled and bootrom binary is
provided, load the provided bootrom binary for the RCPU to execute.

This adds a tt-atlantis machine property 'bootrom' that takes a file
name. qemu_find_file() tries the filename before the search path, so both
full file paths and filenames relative to -L work:

    -M tt-atlantis,rcpu=on,bootrom=out/bootrom.bin

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 hw/riscv/tt_atlantis.c         | 63 ++++++++++++++++++++++++++++++++--
 include/hw/riscv/tt_atlantis.h |  4 +++
 2 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index f778091e91..f3e35c63ea 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
+#include "qemu/datadir.h"
 #include "qemu/error-report.h"
 #include "qemu/guest-random.h"
 #include "qemu/units.h"
@@ -663,15 +664,36 @@ static void tt_rcpu_cluster_realize(DeviceState *dev, Error **errp)
 
     create_unimplemented_devices(OBJECT(rc), &rc->memory, rcpu_unimp_dev);
 
-    /* no bootrom image is provided, don't let the core run */
-    CPU(&rc->cpus.harts[0])->start_powered_off = true;
+    if (rc->bootrom_image) {
+        ssize_t rom_size;
+
+        g_autofree char *rom_file = qemu_find_file(QEMU_FILE_TYPE_BIOS, rc->bootrom_image);
+        if (!rom_file) {
+            error_setg(errp, "could not find bootrom image '%s'", rc->bootrom_image);
+            return;
+        }
+
+        rom_size = load_image_mr(rom_file, &rc->bootrom);
+        if (rom_size <= 0) {
+            error_setg(errp, "could not load bootrom image '%s'", rc->bootrom_image);
+            return;
+        }
+    } else {
+        /* no bootrom image is provided, don't let the core run */
+        CPU(&rc->cpus.harts[0])->start_powered_off = true;
+    }
 }
 
+static const Property tt_rcpu_cluster_props[] = {
+    DEFINE_PROP_STRING("bootrom-name", TTRCPUClusterState, bootrom_image),
+};
+
 static void tt_rcpu_cluster_class_init(ObjectClass *oc, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = tt_rcpu_cluster_realize;
+    device_class_set_props(dc, tt_rcpu_cluster_props);
     /* The cluster must be instantiated by a machine or SoC */
     dc->user_creatable = false;
 }
@@ -830,6 +852,13 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
     if (s->has_rcpu) {
         /* Only create the RCPU if it is enabled */
         object_initialize_child(OBJECT(s), "rcpu", &s->rcpu, TYPE_TT_RCPU_CLUSTER);
+
+        if (s->rcpu_bootrom_image) {
+            object_property_set_str(OBJECT(rc), "bootrom-name",
+                                    s->rcpu_bootrom_image,
+                                    &error_abort);
+        }
+
         if (!qdev_realize(DEVICE(&s->rcpu), NULL, errp)) {
             return;
         }
@@ -1008,7 +1037,8 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
 static const Property tt_atlantis_soc_props[] = {
     DEFINE_PROP_LINK("dram", TTAtlantisSoCState, dram,
                      TYPE_MEMORY_REGION, MemoryRegion *),
-    DEFINE_PROP_BOOL("has-rcpu", TTAtlantisSoCState, has_rcpu, false)
+    DEFINE_PROP_BOOL("has-rcpu", TTAtlantisSoCState, has_rcpu, false),
+    DEFINE_PROP_STRING("bootrom-name", TTAtlantisSoCState, rcpu_bootrom_image)
 };
 
 static void tt_atlantis_soc_class_init(ObjectClass *oc, const void *data)
@@ -1060,6 +1090,13 @@ static void tt_atlantis_machine_init(MachineState *machine)
                             num_asc_harts,
                             &error_abort);
 
+    if (ams->has_rcpu && ams->rcpu_bootrom_image) {
+        /* Set the RCPU bootrom file name provided on the command line */
+        object_property_set_str(OBJECT(s), "bootrom-name",
+                                ams->rcpu_bootrom_image,
+                                &error_abort);
+    }
+
     object_property_set_link(OBJECT(s), "dram", OBJECT(machine->ram),
                              &error_abort);
     object_property_set_bool(OBJECT(&ams->soc), "has-rcpu", ams->has_rcpu,
@@ -1096,6 +1133,22 @@ static void tt_atlantis_machine_set_rcpu(Object *obj, bool value, Error **errp)
     s->has_rcpu = value;
 }
 
+static char *tt_atlantis_get_bootrom(Object *obj, Error **errp)
+{
+    TTAtlantisState *s = TT_ATLANTIS_MACHINE(obj);
+
+    return g_strdup(s->rcpu_bootrom_image);
+}
+
+static void tt_atlantis_set_bootrom(Object *obj, const char *value,
+                                   Error **errp)
+{
+    TTAtlantisState *s = TT_ATLANTIS_MACHINE(obj);
+
+    g_free(s->rcpu_bootrom_image);
+    s->rcpu_bootrom_image = g_strdup(value);
+}
+
 static void tt_atlantis_machine_class_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1123,6 +1176,10 @@ static void tt_atlantis_machine_class_init(ObjectClass *oc, const void *data)
                                           "Set to enable/disable modeling the RCPU.");
     object_property_set_default_bool(prop, false);
 
+    object_class_property_add_str(oc, "bootrom",
+                                  tt_atlantis_get_bootrom,
+                                  tt_atlantis_set_bootrom);
+    object_class_property_set_description(oc, "bootrom", "RCPU bootrom image");
 }
 
 static const TypeInfo tt_atlantis_types[] = {
diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index 5a200410f3..e9cc147060 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -64,6 +64,8 @@ struct TTRCPUClusterState {
     CPUClusterState cluster;
     MemoryRegion bootrom;
     MemoryRegion sram;
+
+    char *bootrom_image;
 };
 
 struct TTAtlantisSoCState {
@@ -84,6 +86,7 @@ struct TTAtlantisSoCState {
     TTAtlantisPRCMState prcm[TT_ATL_NUM_PRCM];
 
     bool has_rcpu;              /* Enable RCPU */
+    char *rcpu_bootrom_image;    /* RCPU boot ROM image */
 };
 
 struct TTAtlantisState {
@@ -96,6 +99,7 @@ struct TTAtlantisState {
     TTAtlantisSoCState soc;
 
     bool has_rcpu;              /* Enable RCPU */
+    char *rcpu_bootrom_image;    /* RCPU boot ROM image */
 };
 
 enum {
-- 
2.43.0


