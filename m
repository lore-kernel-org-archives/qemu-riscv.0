Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lPSvI-00069N-CD
	for mharc-qemu-riscv@gnu.org; Thu, 25 Mar 2021 12:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPSvG-00067D-84
 for qemu-riscv@nongnu.org; Thu, 25 Mar 2021 12:33:26 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPSvB-0003ui-EB
 for qemu-riscv@nongnu.org; Thu, 25 Mar 2021 12:33:25 -0400
Received: by mail-wm1-x343.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so3462369wml.2
 for <qemu-riscv@nongnu.org>; Thu, 25 Mar 2021 09:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DKeVcoHdrGWQXLe7BiJjwqwzRYmaI2JkcCfSkfd7wjs=;
 b=t1hZGrSNzLoH/KNRSrictlHway6Wq87li3aytSbOQjHOYQHBaSgOO3xJwq6XMzYPGp
 QIqrDlKycXBjdA5uT41Es3akNvpWPmqQiLtLANUlHRaRt/qEcZp7Jq4JtkYzdIlZkA1B
 8nnv5JNv33DAtyUnghMgGTihyXNaRR85A46P8Qy8zq4WBCHscpOOGyjSe0eByW/SiM/K
 tLbV7/oxZPPJ+cw7M7Vt+bnQehURqQwygE652AXehAlD5VV0HctO/+d7sh92Oa0rUqa3
 wQrikBxZrWdzMfJL5cZBrQsUEhcBJB5s+cEEkOzRym6WHRKy4p94tlaPAuR01hoCFNnd
 PvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DKeVcoHdrGWQXLe7BiJjwqwzRYmaI2JkcCfSkfd7wjs=;
 b=ATo9yOHlWD2fAoAaf64lGJsxdLLb+H7InFMPYH4qVpe7JCz/S75TpcOJC8gdxcVUQ2
 8MrRN85TnuJSwpQtQIZxLplvidaZnqtkwBSh+QsyuX9HwSbOffWw2oliy7Optxd+D9Ea
 4jkiqNmc6eyNFMmtKW83H/JsTkmRwSYhVq7i7LQhk5QIU2uQBw6FZHDP2m/i7cyUa8xw
 uFZdVrAb95Kpe5pu9Q29EbV+DRQRo6KkCuStO4bz1558YG08dvxGraS3ByYL2dLYkqmV
 PR/nHmWoDSamxeOZKs6tVwD8CLpwXYz1sTAB7iDbqDaC7///dgB6Qpp60zcLwxkfvWjt
 HWyQ==
X-Gm-Message-State: AOAM531iAAd6F+hPOI9uOCa+4LJJYig+wOa+SyG9shHnhLgja8W1pnqv
 twwCuvzggbr9nLzgDSCtBUbS7Q==
X-Google-Smtp-Source: ABdhPJx5Fd0yJhK3EEw4gJsejk7xkVp4gFItq4g2q3u3EvR6NBcUknOkm4S0zgUJI+Wj/ckqoIydpA==
X-Received: by 2002:a7b:c214:: with SMTP id x20mr8971547wmi.186.1616689998297; 
 Thu, 25 Mar 2021 09:33:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i11sm8167130wro.53.2021.03.25.09.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 09:33:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Dmitry Vyukov <dvyukov@google.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped parts
 of MMIO and PIO windows
Date: Thu, 25 Mar 2021 16:33:15 +0000
Message-Id: <20210325163315.27724-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Mar 2021 16:33:26 -0000

Currently the gpex PCI controller implements no special behaviour for
guest accesses to areas of the PIO and MMIO where it has not mapped
any PCI devices, which means that for Arm you end up with a CPU
exception due to a data abort.

Most host OSes expect "like an x86 PC" behaviour, where bad accesses
like this return -1 for reads and ignore writes.  In the interests of
not being surprising, make host CPU accesses to these windows behave
as -1/discard where there's no mapped PCI device.

The old behaviour generally didn't cause any problems, because
almost always the guest OS will map the PCI devices and then only
access where it has mapped them. One corner case where you will see
this kind of access is if Linux attempts to probe legacy ISA
devices via a PIO window access. So far the only case where we've
seen this has been via the syzkaller fuzzer.

Reported-by: Dmitry Vyukov <dvyukov@google.com>
Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2 changes: put in the hw_compat machinery.

Still not sure if I want to put this in 6.0 or not.

 include/hw/pci-host/gpex.h |  4 +++
 hw/core/machine.c          |  1 +
 hw/pci-host/gpex.c         | 56 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index d48a020a952..fcf8b638200 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -49,8 +49,12 @@ struct GPEXHost {
 
     MemoryRegion io_ioport;
     MemoryRegion io_mmio;
+    MemoryRegion io_ioport_window;
+    MemoryRegion io_mmio_window;
     qemu_irq irq[GPEX_NUM_IRQS];
     int irq_num[GPEX_NUM_IRQS];
+
+    bool allow_unmapped_accesses;
 };
 
 struct GPEXConfig {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 257a664ea2e..9750fad7435 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -41,6 +41,7 @@ GlobalProperty hw_compat_5_2[] = {
     { "PIIX4_PM", "smm-compat", "on"},
     { "virtio-blk-device", "report-discard-granularity", "off" },
     { "virtio-net-pci", "vectors", "3"},
+    { "gpex-pcihost", "allow-unmapped-accesses", "false" },
 };
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 2bdbe7b4561..a6752fac5e8 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -83,12 +83,51 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
     int i;
 
     pcie_host_mmcfg_init(pex, PCIE_MMCFG_SIZE_MAX);
+    sysbus_init_mmio(sbd, &pex->mmio);
+
+    /*
+     * Note that the MemoryRegions io_mmio and io_ioport that we pass
+     * to pci_register_root_bus() are not the same as the
+     * MemoryRegions io_mmio_window and io_ioport_window that we
+     * expose as SysBus MRs. The difference is in the behaviour of
+     * accesses to addresses where no PCI device has been mapped.
+     *
+     * io_mmio and io_ioport are the underlying PCI view of the PCI
+     * address space, and when a PCI device does a bus master access
+     * to a bad address this is reported back to it as a transaction
+     * failure.
+     *
+     * io_mmio_window and io_ioport_window implement "unmapped
+     * addresses read as -1 and ignore writes"; this is traditional
+     * x86 PC behaviour, which is not mandated by the PCI spec proper
+     * but expected by much PCI-using guest software, including Linux.
+     *
+     * In the interests of not being unnecessarily surprising, we
+     * implement it in the gpex PCI host controller, by providing the
+     * _window MRs, which are containers with io ops that implement
+     * the 'background' behaviour and which hold the real PCI MRs as
+     * subregions.
+     */
     memory_region_init(&s->io_mmio, OBJECT(s), "gpex_mmio", UINT64_MAX);
     memory_region_init(&s->io_ioport, OBJECT(s), "gpex_ioport", 64 * 1024);
 
-    sysbus_init_mmio(sbd, &pex->mmio);
-    sysbus_init_mmio(sbd, &s->io_mmio);
-    sysbus_init_mmio(sbd, &s->io_ioport);
+    if (s->allow_unmapped_accesses) {
+        memory_region_init_io(&s->io_mmio_window, OBJECT(s),
+                              &unassigned_io_ops, OBJECT(s),
+                              "gpex_mmio_window", UINT64_MAX);
+        memory_region_init_io(&s->io_ioport_window, OBJECT(s),
+                              &unassigned_io_ops, OBJECT(s),
+                              "gpex_ioport_window", 64 * 1024);
+
+        memory_region_add_subregion(&s->io_mmio_window, 0, &s->io_mmio);
+        memory_region_add_subregion(&s->io_ioport_window, 0, &s->io_ioport);
+        sysbus_init_mmio(sbd, &s->io_mmio_window);
+        sysbus_init_mmio(sbd, &s->io_ioport_window);
+    } else {
+        sysbus_init_mmio(sbd, &s->io_mmio);
+        sysbus_init_mmio(sbd, &s->io_ioport);
+    }
+
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
         sysbus_init_irq(sbd, &s->irq[i]);
         s->irq_num[i] = -1;
@@ -108,6 +147,16 @@ static const char *gpex_host_root_bus_path(PCIHostState *host_bridge,
     return "0000:00";
 }
 
+static Property gpex_host_properties[] = {
+    /*
+     * Permit CPU accesses to unmapped areas of the PIO and MMIO windows
+     * (discarding writes and returning -1 for reads) rather than aborting.
+     */
+    DEFINE_PROP_BOOL("allow-unmapped-accesses", GPEXHost,
+                     allow_unmapped_accesses, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void gpex_host_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -117,6 +166,7 @@ static void gpex_host_class_init(ObjectClass *klass, void *data)
     dc->realize = gpex_host_realize;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->fw_name = "pci";
+    device_class_set_props(dc, gpex_host_properties);
 }
 
 static void gpex_host_initfn(Object *obj)
-- 
2.20.1


