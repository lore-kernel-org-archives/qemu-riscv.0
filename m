Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOQvu-0000XS-Pl
	for mharc-qemu-riscv@gnu.org; Mon, 22 Mar 2021 16:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOQvr-0000TC-H2
 for qemu-riscv@nongnu.org; Mon, 22 Mar 2021 16:13:48 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:47096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOQvl-0003ju-Ki
 for qemu-riscv@nongnu.org; Mon, 22 Mar 2021 16:13:47 -0400
Received: by mail-wr1-x442.google.com with SMTP id v4so18491040wrp.13
 for <qemu-riscv@nongnu.org>; Mon, 22 Mar 2021 13:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VRN75fiZq3z0KsQUrseR+n6u9jCms7lasgObIRtwiok=;
 b=r4dR3MBOpVmKBR+8fSZcoMzu2dgyUoK3HFccRcnWoQ50uKFwhgY0TuttELxN+QhBAG
 tjPC8kuaPop+3jl5xR3lAHgWxcfl3mJ4PXrCElWUPMRhIwHj497UBKHZ31M3f/a+biBp
 T3TSG3fjhLMcu7gYiInhcRNazQ+umDYIF58SlpjVXT2lGjciewzA2irKVRhuxwYa2Jtx
 2gjngSFOmWi7yQlo1cii5KWRicJOWu54m/lc9zwmZ0y82/ZBCLW+oSdFVq55fKWskNM7
 pMkju6A++2ts2rJH2WyaY3cHWRKJtAcjxpipc/EVUj2Stdlj/YkuFqtHHYtlHvDacfno
 glUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VRN75fiZq3z0KsQUrseR+n6u9jCms7lasgObIRtwiok=;
 b=D19qLtQhMZyFPI1cCv5Jm5p++2xeg1QXoquqHbKlY8m+jkYsrK64aV/G3FMfHC4rlu
 rCwABDnSf9SmMtf7bx1GXTefbrPMhh6KE7ONNK5efMxajRvD6zyXlUKYbxmLhFNeVree
 MAonCH6ywOufknSQw3xjOL8sUrXUtwUIbPvoNZPu6+FSAlGItNMOorjB5u0ZxMEn+E2c
 MdIw7TlCYDnVtjjQKbh7XIQbr8MrENsXOzP5twqbUUAureQXVu14f2dWQlqsAONH0+ga
 VLVC9t9niH4BT+Pz0cRFxtj/XWznCJizEpVjtfQyFdGXubJ5fSOfXKfMrl7btNcAhD7l
 2DZg==
X-Gm-Message-State: AOAM5312WLDwr59WYVAh+Ix2CZcybVfRWPwcmwfj41PTU8YZa0ZgSTkP
 dooH5kexff37CWSBYpO2ZOzIxg==
X-Google-Smtp-Source: ABdhPJzkP0IPwo6bOiyP11H38QjB34BsAu320k+R1ahZ6nrP+ybblj8oyBYxZVfdOV0LeioZHwLdfg==
X-Received: by 2002:adf:8151:: with SMTP id 75mr323008wrm.152.1616444019883;
 Mon, 22 Mar 2021 13:13:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u15sm419548wmq.4.2021.03.22.13.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 13:13:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Dmitry Vyukov <dvyukov@google.com>,
 Arnd Bergmann <arnd@arndb.de>, qemu-riscv@nongnu.org
Subject: [PATCH] hw/pci-host/gpex: Don't fault for unmapped parts of MMIO and
 PIO windows
Date: Mon, 22 Mar 2021 20:13:36 +0000
Message-Id: <20210322201336.9539-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
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
X-List-Received-Date: Mon, 22 Mar 2021 20:13:48 -0000

Currently the gpex PCI controller implements no special behaviour for
guest accesses to areas of the PIO and MMIO where it has not mapped
any PCI devices, which means that for Arm you end up with a CPU
exception due to a data abort.

Most host OSes expect "like an x86 PC" behaviour, where bad accesses
like this return -1 for reads and ignore writes.  In the interests of
not being surprising, make host CPU accesses to these windows behave
as -1/discard where there's no mapped PCI device.

Reported-by: Dmitry Vyukov <dvyukov@google.com>
Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not convinced that this is 6.0 material, because IMHO the
kernel shouldn't be doing this in the first place.
Do we need to have the property machinery so that old
virt-5.2 etc retain the previous behaviour ?
---
 include/hw/pci-host/gpex.h |  2 ++
 hw/pci-host/gpex.c         | 37 +++++++++++++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index d48a020a952..ad876ecd209 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -49,6 +49,8 @@ struct GPEXHost {
 
     MemoryRegion io_ioport;
     MemoryRegion io_mmio;
+    MemoryRegion io_ioport_window;
+    MemoryRegion io_mmio_window;
     qemu_irq irq[GPEX_NUM_IRQS];
     int irq_num[GPEX_NUM_IRQS];
 };
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 2bdbe7b4561..1f48c89ac6a 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -82,13 +82,46 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
     PCIExpressHost *pex = PCIE_HOST_BRIDGE(dev);
     int i;
 
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
     pcie_host_mmcfg_init(pex, PCIE_MMCFG_SIZE_MAX);
     memory_region_init(&s->io_mmio, OBJECT(s), "gpex_mmio", UINT64_MAX);
     memory_region_init(&s->io_ioport, OBJECT(s), "gpex_ioport", 64 * 1024);
 
+    memory_region_init_io(&s->io_mmio_window, OBJECT(s),
+                          &unassigned_io_ops, OBJECT(s),
+                          "gpex_mmio_window", UINT64_MAX);
+    memory_region_init_io(&s->io_ioport_window, OBJECT(s),
+                          &unassigned_io_ops, OBJECT(s),
+                          "gpex_ioport_window", 64 * 1024);
+
+    memory_region_add_subregion(&s->io_mmio_window, 0, &s->io_mmio);
+    memory_region_add_subregion(&s->io_ioport_window, 0, &s->io_ioport);
+
     sysbus_init_mmio(sbd, &pex->mmio);
-    sysbus_init_mmio(sbd, &s->io_mmio);
-    sysbus_init_mmio(sbd, &s->io_ioport);
+    sysbus_init_mmio(sbd, &s->io_mmio_window);
+    sysbus_init_mmio(sbd, &s->io_ioport_window);
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
         sysbus_init_irq(sbd, &s->irq[i]);
         s->irq_num[i] = -1;
-- 
2.20.1


