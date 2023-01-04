Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBvd-0002Om-CC
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBus-00023i-06
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:07:31 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBun-0008L6-MT
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:07:21 -0500
Received: by mail-ej1-x635.google.com with SMTP id jo4so86004901ejb.7
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c0SPEwXyflkiw42kdbQzUDTcTHzybkAd3cMquverKqA=;
 b=iQ8Bfh7ypySwtQudVdpmBFo9jAOECouo6v0Mm2PY8M8ncwvAFnh0Z64MiQzv8j3lfd
 InWICNpqEmN/un1I+jJEL4aBPj9w/WhIYmJcvSi5Jszhlvl6oINXPlhD6JFWwiT1uawz
 aDTiXb3hxPztUbUMNZ8MGoUdL3Y2s5jQ8VsOsguUkxqpqe5x64z2jkrYimbuNQee1iuT
 HiqJueIznICGSdND3aEIK7vgz3jFjolaThFq8Lspo5tcviRDOvTVDaCGgSvL/LaOLFiz
 3D2LZliMP+FpUTdTrBgiUO8J5TBHgRnCNTlOkaNcwFWaWY4aH15pg4fIBVsgZ/tgnNRC
 Th2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c0SPEwXyflkiw42kdbQzUDTcTHzybkAd3cMquverKqA=;
 b=uMtlxYqG2RsrUM2oXFLIqbriqXGNjY8UvRKT5TaZtH/iyAyWc4grpVpBGrMWhw30ye
 vYTMidlRFTe1uMA8GtBbB+CiTc6BkdHD6HcN9psJKPgQsKmMP0A37cf3GM+ucLHUg4Lb
 7AtXeo7HNX3buzsGgs2HsmIo8wHY6o7IbRD5aJhzlZ1JDG2wPHh0unG8uNRB8LN8FR3q
 5Dq7y3dCg2ilpBmKeeNiy8oUlRAV/9bFuWGXVwPXMDAibQ8U+n/2dflrdzj9IaCBsjPe
 bwQG4vUj2p72q0sSAEsB6woyzho7g6rxacToXjzFYVNNJ+QC9JLVh+uNB/COXAPD3BNv
 Dv+Q==
X-Gm-Message-State: AFqh2koSdq+UK6zQVHBmnmDWr122FBtiLzes06U0iv52UrwmTJpgSHOL
 dskc40zNfEIeV4J8IZ2sXgOyFw==
X-Google-Smtp-Source: AMrXdXuCq8Ftiv/kwTi77XpdmKSYh3K8X1mFkJsRvhMLrg6SAEkVwoXoTP8mAK74ujVXhfCq64oCvA==
X-Received: by 2002:a17:907:86a6:b0:7c0:fd1a:79f0 with SMTP id
 qa38-20020a17090786a600b007c0fd1a79f0mr59298049ejc.21.1672870030224; 
 Wed, 04 Jan 2023 14:07:10 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a1709063c0e00b00780b1979adesm15773759ejg.218.2023.01.04.14.07.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:07:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 16/20] hw/block: Factor pflash_cfi02_create() out of
 pflash_cfi02_register()
Date: Wed,  4 Jan 2023 23:04:45 +0100
Message-Id: <20230104220449.41337-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 04 Jan 2023 22:07:33 -0000

Currently pflash_cfi02_register():

 1/ creates a TYPE_PFLASH_CFI02 qdev instance
 2/ maps the first MMIO region to the system bus

The first minor issue is the implicit sysbus mapping is not
obvious (the function name could mention it), and the function
is not documented.

Another issue is we are forced to map on sysbus, thus code
wanting to simply instantiate this device are forced to open
code the qdev creation.

This is a problem in a heterogeneous system where not all cores
has access to the sysbus, or if we want to map the pflash on
different address spaces.

To clarify this API, extract the qdev creation in a new helper
named pflash_cfi02_create().

We don't document pflash_cfi02_register() because we are going
to remove it in a pair of commits.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi02.c  | 55 ++++++++++++++++++++++++++--------------
 include/hw/block/flash.h | 14 +++++++++-
 2 files changed, 49 insertions(+), 20 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 2a99b286b0..176f93b512 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -994,6 +994,37 @@ static void pflash_cfi02_register_types(void)
 
 type_init(pflash_cfi02_register_types)
 
+DeviceState *pflash_cfi02_create(const char *name, hwaddr size,
+                                 BlockBackend *blk, uint32_t sector_len,
+                                 int nb_mappings, int bank_width,
+                                 uint16_t id0, uint16_t id1,
+                                 uint16_t id2, uint16_t id3,
+                                 uint16_t unlock_addr0, uint16_t unlock_addr1,
+                                 int be)
+{
+    DeviceState *dev = qdev_new(TYPE_PFLASH_CFI02);
+
+    if (blk) {
+        qdev_prop_set_drive(dev, "drive", blk);
+    }
+    assert(QEMU_IS_ALIGNED(size, sector_len));
+    qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
+    qdev_prop_set_uint32(dev, "sector-length", sector_len);
+    qdev_prop_set_uint8(dev, "width", bank_width);
+    qdev_prop_set_uint8(dev, "mappings", nb_mappings);
+    qdev_prop_set_uint8(dev, "big-endian", !!be);
+    qdev_prop_set_uint16(dev, "id0", id0);
+    qdev_prop_set_uint16(dev, "id1", id1);
+    qdev_prop_set_uint16(dev, "id2", id2);
+    qdev_prop_set_uint16(dev, "id3", id3);
+    qdev_prop_set_uint16(dev, "unlock-addr0", unlock_addr0);
+    qdev_prop_set_uint16(dev, "unlock-addr1", unlock_addr1);
+    qdev_prop_set_string(dev, "name", name);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    return dev;
+}
+
 PFlashCFI02 *pflash_cfi02_register(hwaddr base,
                                    const char *name,
                                    hwaddr size,
@@ -1006,26 +1037,12 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
                                    uint16_t unlock_addr1,
                                    int be)
 {
-    DeviceState *dev = qdev_new(TYPE_PFLASH_CFI02);
-
-    if (blk) {
-        qdev_prop_set_drive(dev, "drive", blk);
-    }
-    assert(QEMU_IS_ALIGNED(size, sector_len));
-    qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
-    qdev_prop_set_uint32(dev, "sector-length", sector_len);
-    qdev_prop_set_uint8(dev, "width", width);
-    qdev_prop_set_uint8(dev, "mappings", nb_mappings);
-    qdev_prop_set_uint8(dev, "big-endian", !!be);
-    qdev_prop_set_uint16(dev, "id0", id0);
-    qdev_prop_set_uint16(dev, "id1", id1);
-    qdev_prop_set_uint16(dev, "id2", id2);
-    qdev_prop_set_uint16(dev, "id3", id3);
-    qdev_prop_set_uint16(dev, "unlock-addr0", unlock_addr0);
-    qdev_prop_set_uint16(dev, "unlock-addr1", unlock_addr1);
-    qdev_prop_set_string(dev, "name", name);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    DeviceState *dev;
 
+    dev = pflash_cfi02_create(name, size, blk, sector_len,
+                              nb_mappings, width, id0, id1, id2, id3,
+                              unlock_addr0, unlock_addr1, be);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
+
     return PFLASH_CFI02(dev);
 }
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 321aede8ef..78b078955e 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -32,7 +32,19 @@ void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo);
 #define TYPE_PFLASH_CFI02 "cfi.pflash02"
 OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI02, PFLASH_CFI02)
 
-
+/**
+ * Create and realize a parallel NOR flash (CFI type 2) on the heap.
+ *
+ * Create the device state structure, initialize it, and drop the
+ * reference to it (the device is realized).
+ */
+DeviceState *pflash_cfi02_create(const char *name, hwaddr size,
+                                 BlockBackend *blk, uint32_t sector_len,
+                                 int nb_mappings, int bank_width,
+                                 uint16_t id0, uint16_t id1,
+                                 uint16_t id2, uint16_t id3,
+                                 uint16_t unlock_addr0, uint16_t unlock_addr1,
+                                 int be);
 PFlashCFI02 *pflash_cfi02_register(hwaddr base,
                                    const char *name,
                                    hwaddr size,
-- 
2.38.1


