Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO0W0-0000Jh-Da
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Vy-0000DQ-CT
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:22 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Vw-000089-5r
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:22 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o36so4515179wms.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 10:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yfuxLaxqk4mVFu2bySSXnIQtU3kYxIWtg5zFBO+Mz50=;
 b=a2cDbtTf1yr0JSUgmzqfVrifho6NBGr2pv81vlACziRCKZCTMcADLVsZJDsq3vATV6
 klOQ2aBUa1HXDnb8ozL6nsNUcfzLYATGpd3nVVsTG5JzygjH4Dp5MVkGMv7lci2uhe+4
 bxlvmiKr7/Subg2UBF7qvFlHYLDghmwQch0p/eT/5w707ixfpZz/Aed+p9rZn7BME7iC
 e01GIBk0gIV/SN2xrETgiu51gAB/k4nQlMFPJkQad9MZLZt/zIXIUOUUHy+7SscZHlLX
 NyMH9k4cVzPi+f0HdK+Ja0CKviXmM6X4M+xWiIMwFCCDTHygdoqY/4EQvOfyQZVL89Hy
 s0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yfuxLaxqk4mVFu2bySSXnIQtU3kYxIWtg5zFBO+Mz50=;
 b=lYXpIeDpaktt+fPAaIBw3TcnbFQzKcIYn0TAM2Cdp0dBYK2fKOY3rSlM0qA+JAyJ2F
 Dt7ldUJ/QgusNw96Oq1YXYhVgZ9+jmpkzG1eWi/YlSN5KG1GFZYYHPS0ekgqNpr5F9sE
 1PnH4LYd60mmGIE+eFFZXhImq1yv1oR5T3EfxhgzoDhjY7lprILXi9C9jhKAUb8fPEyl
 X966aL8XNorK+x6PlZDgd9uosBU1iNCpj2i4mgBGS0K2yjzc+29GdpkE2n466GttJxSz
 0MnrnkAqPgmxY+PDTcgT8Xtn3mDFCD7jCckc+HdSQnFEjuBhCRJkYZvHur5NvECfaYaa
 7X4A==
X-Gm-Message-State: AO0yUKVGnaF0y0FIFM/JXIsvSQQljrP2IGJPwdwXzR/xEFz+yTOQtqcC
 lF4pYpMuHCY/aTY7qXMz1BO+yA==
X-Google-Smtp-Source: AK7set8pGePFrz7QezpMto3RsCMpIJFTm8pBFGrnEFlp+HT5v9w4+7AT81PD0MKjcKUhegpIrrMgTA==
X-Received: by 2002:a05:600c:4fcb:b0:3dd:e38b:a12f with SMTP id
 o11-20020a05600c4fcb00b003dde38ba12fmr5088912wmq.40.1675447818832; 
 Fri, 03 Feb 2023 10:10:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c00c100b003a3442f1229sm8356415wmm.29.2023.02.03.10.10.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Subject: [RFC PATCH 12/19] hw/i386: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:07 +0100
Message-Id: <20230203180914.49112-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 18:10:22 -0000

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c           |  8 +++-----
 hw/i386/pc_q35.c       | 25 +++++++++++--------------
 hw/i386/sgx.c          |  3 +--
 hw/i386/x86.c          | 12 ++++--------
 hw/mem/pc-dimm.c       |  5 ++---
 target/i386/cpu.c      |  6 ++----
 target/i386/host-cpu.c |  7 +++----
 7 files changed, 26 insertions(+), 40 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6e592bd969..700fdefa12 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1236,8 +1236,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
         vmmouse = NULL;
     }
     if (vmmouse) {
-        object_property_set_link(OBJECT(vmmouse), TYPE_I8042, OBJECT(i8042),
-                                 &error_abort);
+        qdev_prop_set_link(DEVICE(vmmouse), TYPE_I8042, OBJECT(i8042));
         isa_realize_and_unref(vmmouse, isa_bus, &error_fatal);
     }
     port92 = isa_create_simple(isa_bus, TYPE_PORT92);
@@ -1538,9 +1537,8 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
                                               VIRTIO_IOMMU_RESV_MEM_T_MSI);
 
-        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1, errp);
-        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
-                                resv_prop_str, errp);
+        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
+        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
         g_free(resv_prop_str);
     }
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 66cd718b70..760efa62ca 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -118,7 +118,7 @@ static void pc_q35_init(MachineState *machine)
     PCMachineState *pcms = PC_MACHINE(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(machine);
-    Q35PCIHost *q35_host;
+    DeviceState *q35_host;
     PCIHostState *phb;
     PCIBus *host_bus;
     PCIDevice *lpc;
@@ -206,7 +206,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* create pci host bus */
-    q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
+    q35_host = qdev_new(TYPE_Q35_HOST_DEVICE);
 
     if (pcmc->pci_enabled) {
         pci_hole64_size = object_property_get_uint(OBJECT(q35_host),
@@ -219,18 +219,15 @@ static void pc_q35_init(MachineState *machine)
                    pci_hole64_size);
 
     object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
-                             OBJECT(ram_memory), NULL);
-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
-                             OBJECT(pci_memory), NULL);
-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_SYSTEM_MEM,
-                             OBJECT(get_system_memory()), NULL);
-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_IO_MEM,
-                             OBJECT(system_io), NULL);
-    object_property_set_int(OBJECT(q35_host), PCI_HOST_BELOW_4G_MEM_SIZE,
-                            x86ms->below_4g_mem_size, NULL);
-    object_property_set_int(OBJECT(q35_host), PCI_HOST_ABOVE_4G_MEM_SIZE,
-                            x86ms->above_4g_mem_size, NULL);
+    qdev_prop_set_link(q35_host, MCH_HOST_PROP_RAM_MEM, OBJECT(ram_memory));
+    qdev_prop_set_link(q35_host, MCH_HOST_PROP_PCI_MEM, OBJECT(pci_memory));
+    qdev_prop_set_link(q35_host, MCH_HOST_PROP_IO_MEM, OBJECT(system_io));
+    qdev_prop_set_link(q35_host, MCH_HOST_PROP_SYSTEM_MEM,
+                       OBJECT(get_system_memory()));
+    qdev_prop_set_uint64(q35_host, PCI_HOST_BELOW_4G_MEM_SIZE,
+                         x86ms->below_4g_mem_size);
+    qdev_prop_set_uint64(q35_host, PCI_HOST_ABOVE_4G_MEM_SIZE,
+                         x86ms->above_4g_mem_size);
     /* pci */
     sysbus_realize_and_unref(SYS_BUS_DEVICE(q35_host), &error_fatal);
     phb = PCI_HOST_BRIDGE(q35_host);
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 6a729bff94..196fa5afee 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -304,8 +304,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
         object_property_parse(OBJECT(dev), SGX_EPC_MEMDEV_PROP,
                               list->value->memdev, &error_fatal);
         /* set the numa node property for sgx epc object */
-        object_property_set_uint(OBJECT(dev), SGX_EPC_NUMA_NODE_PROP,
-                                 list->value->node, &error_fatal);
+        qdev_prop_set_uint32(dev, SGX_EPC_NUMA_NODE_PROP, list->value->node);
         qdev_realize_and_unref(dev, NULL, &error_fatal);
     }
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index eaff4227bd..191a8c36ee 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -43,6 +43,7 @@
 #include "sysemu/xen.h"
 #include "trace.h"
 
+#include "hw/qdev-properties.h"
 #include "hw/i386/x86.h"
 #include "target/i386/cpu.h"
 #include "hw/i386/topology.h"
@@ -96,15 +97,10 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
 
 void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
 {
-    Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
+    DeviceState *cpu = DEVICE(object_new(MACHINE(x86ms)->cpu_type));
 
-    if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
-        goto out;
-    }
-    qdev_realize(DEVICE(cpu), NULL, errp);
-
-out:
-    object_unref(cpu);
+    qdev_prop_set_uint32(cpu, "apic-id", apic_id);
+    qdev_realize(cpu, NULL, errp);
 }
 
 void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 50ef83215c..d6e0c8b680 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -66,8 +66,7 @@ void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
         error_propagate(errp, local_err);
         return;
     }
-    object_property_set_int(OBJECT(dimm), PC_DIMM_SLOT_PROP, slot,
-                            &error_abort);
+    qdev_prop_set_int32(DEVICE(dimm), PC_DIMM_SLOT_PROP, slot);
     trace_mhp_pc_dimm_assigned_slot(slot);
 
     memory_device_pre_plug(MEMORY_DEVICE(dimm), machine, legacy_align,
@@ -234,7 +233,7 @@ static uint64_t pc_dimm_md_get_addr(const MemoryDeviceState *md)
 static void pc_dimm_md_set_addr(MemoryDeviceState *md, uint64_t addr,
                                 Error **errp)
 {
-    object_property_set_uint(OBJECT(md), PC_DIMM_ADDR_PROP, addr, errp);
+    qdev_prop_set_uint64(DEVICE(md), PC_DIMM_ADDR_PROP, addr);
 }
 
 static MemoryRegion *pc_dimm_md_get_memory_region(MemoryDeviceState *md,
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4d2b8d0444..5532cd42c5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5073,10 +5073,8 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
      */
 
     /* CPU models only set _minimum_ values for level/xlevel: */
-    object_property_set_uint(OBJECT(cpu), "min-level", def->level,
-                             &error_abort);
-    object_property_set_uint(OBJECT(cpu), "min-xlevel", def->xlevel,
-                             &error_abort);
+    qdev_prop_set_uint32(DEVICE(cpu), "min-level", def->level);
+    qdev_prop_set_uint32(DEVICE(cpu), "min-xlevel", def->xlevel);
 
     object_property_set_int(OBJECT(cpu), "family", def->family, &error_abort);
     object_property_set_int(OBJECT(cpu), "model", def->model, &error_abort);
diff --git a/target/i386/host-cpu.c b/target/i386/host-cpu.c
index 10f8aba86e..0307eaa208 100644
--- a/target/i386/host-cpu.c
+++ b/target/i386/host-cpu.c
@@ -158,7 +158,7 @@ void host_cpu_instance_init(X86CPU *cpu)
 
         host_cpuid(0, 0, NULL, &ebx, &ecx, &edx);
         x86_cpu_vendor_words2str(vendor, ebx, edx, ecx);
-        object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_abort);
+        qdev_prop_set_string(DEVICE(cpu), "vendor", vendor);
     }
 }
 
@@ -174,13 +174,12 @@ void host_cpu_max_instance_init(X86CPU *cpu)
     host_cpu_vendor_fms(vendor, &family, &model, &stepping);
     host_cpu_fill_model_id(model_id);
 
-    object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_abort);
+    qdev_prop_set_string(DEVICE(cpu), "vendor", vendor);
     object_property_set_int(OBJECT(cpu), "family", family, &error_abort);
     object_property_set_int(OBJECT(cpu), "model", model, &error_abort);
     object_property_set_int(OBJECT(cpu), "stepping", stepping,
                             &error_abort);
-    object_property_set_str(OBJECT(cpu), "model-id", model_id,
-                            &error_abort);
+    qdev_prop_set_string(DEVICE(cpu), "model-id", model_id);
 }
 
 static void host_cpu_class_init(ObjectClass *oc, void *data)
-- 
2.38.1


