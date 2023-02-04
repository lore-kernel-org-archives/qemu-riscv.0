Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOIWA-0000q6-LC
	for mharc-qemu-riscv@gnu.org; Sat, 04 Feb 2023 08:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOIVz-0000p8-RI; Sat, 04 Feb 2023 08:23:39 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOIVx-0004zZ-Ji; Sat, 04 Feb 2023 08:23:35 -0500
Received: by mail-ej1-x633.google.com with SMTP id gr7so22468134ejb.5;
 Sat, 04 Feb 2023 05:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFW15eM3QQLDoctzjP7iof9x9B0/XTXmd5jsJMhpTvE=;
 b=XkzRXjxXC1NobaLkQ1nuAuulFXOeww2JdUHCdZJa52tyS9borQLsVFuEFkFSdcUU0b
 zRIROs2Sa0bZfJf3DpjWZ/TS5O26BzUPoJQ1+I3eD6ylkXEmLUG2r3htK2jSFeAnPhv8
 jXigCnHut6Q18rRIn+JocgxGTxWo+rc0kjJLYO463Mh4EpyXnbPGiS/dHdtIr0S4WGxG
 Rk9Vbxxdm7XU6A0s8rPo034RsA/w43RWPCOym+RUhm66i+goFe+CTk7RwAoq5n5e66qR
 U8JBNcj1ZVuYQajsPcy3VOZZLirlTHN6R7VyAOmbg7BpCJqhtrkiw0dB3YQyjU/J1WG5
 h0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nFW15eM3QQLDoctzjP7iof9x9B0/XTXmd5jsJMhpTvE=;
 b=d+g5FBycCiYO8zwQDETVDAwnDeTka5f6OBDAwLhh4cWgtYclMmsWhqbxLxq1toyAmt
 wOhVYfWtKqFZqJaXZiQrnsJnnANGGIC9PgXMI74MpXWJgzMR74er9WTJMAoQ/z9LJtLE
 ibITS0GUSyyh4ZxQ+w5dtaxLTL+bEZpUzom4Mz4nMFlyauRFJXAAvrdyxfDBpsJDTyqd
 lZxFXPgLSLZgD5M13f7UVQAQUPFiJIzaQnTjlel4Ax6nR332NQe8DbmJNjuoYQeiZ/JA
 6vLjiuLrgZsDmfWOHwQOnUsdS980a7p6fyncbDgQVyAnjQPaqfreTZf3OcX/PS8ed9mu
 eE1A==
X-Gm-Message-State: AO0yUKWIMywtY5TAt7vecCkgU6CHy1aGlwL4SGJ4Vdkj6A3aRXefqyAl
 CXJFCd2F70nxaHrt3RlXN3s/Gx5WrRA=
X-Google-Smtp-Source: AK7set/sa3AKYxk+FL3zG4IRGCIVEnZ2g4fN1uU53SQ9Dzwqdegrdqdo5AWvNyWnIX+euBJBylSAXQ==
X-Received: by 2002:a17:907:8a04:b0:885:23bc:3174 with SMTP id
 sc4-20020a1709078a0400b0088523bc3174mr19244568ejc.70.1675517010332; 
 Sat, 04 Feb 2023 05:23:30 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-077-083.77.183.pool.telefonica.de.
 [77.183.77.83]) by smtp.gmail.com with ESMTPSA id
 p15-20020a1709060e8f00b0088bd01105eesm2810582ejf.188.2023.02.04.05.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Feb 2023 05:23:29 -0800 (PST)
Date: Sat, 04 Feb 2023 13:23:21 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Subject: Re: [RFC PATCH 12/19] hw/i386: Set QDev properties using QDev API
In-Reply-To: <20230203180914.49112-13-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
 <20230203180914.49112-13-philmd@linaro.org>
Message-ID: <D0F3AEC0-FC01-426E-ABA3-08CA806E966E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 04 Feb 2023 13:23:44 -0000



Am 3=2E Februar 2023 18:09:07 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>No need to use the low-level QOM API when an object
>inherits from QDev=2E Directly use the QDev API to set
>its properties=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/i386/pc=2Ec           |  8 +++-----
> hw/i386/pc_q35=2Ec       | 25 +++++++++++--------------
> hw/i386/sgx=2Ec          |  3 +--
> hw/i386/x86=2Ec          | 12 ++++--------
> hw/mem/pc-dimm=2Ec       |  5 ++---
> target/i386/cpu=2Ec      |  6 ++----
> target/i386/host-cpu=2Ec |  7 +++----
> 7 files changed, 26 insertions(+), 40 deletions(-)
>
>diff --git a/hw/i386/pc=2Ec b/hw/i386/pc=2Ec
>index 6e592bd969=2E=2E700fdefa12 100644
>--- a/hw/i386/pc=2Ec
>+++ b/hw/i386/pc=2Ec
>@@ -1236,8 +1236,7 @@ static void pc_superio_init(ISABus *isa_bus, bool c=
reate_fdctrl,
>         vmmouse =3D NULL;
>     }
>     if (vmmouse) {
>-        object_property_set_link(OBJECT(vmmouse), TYPE_I8042, OBJECT(i80=
42),
>-                                 &error_abort);
>+        qdev_prop_set_link(DEVICE(vmmouse), TYPE_I8042, OBJECT(i8042));
>         isa_realize_and_unref(vmmouse, isa_bus, &error_fatal);
>     }
>     port92 =3D isa_create_simple(isa_bus, TYPE_PORT92);
>@@ -1538,9 +1537,8 @@ static void pc_machine_device_pre_plug_cb(HotplugHa=
ndler *hotplug_dev,
>         char *resv_prop_str =3D g_strdup_printf("0xfee00000:0xfeefffff:%=
d",
>                                               VIRTIO_IOMMU_RESV_MEM_T_MS=
I);
>=20
>-        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1,=
 errp);
>-        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
>-                                resv_prop_str, errp);
>+        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
>+        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
>         g_free(resv_prop_str);
>     }
>=20
>diff --git a/hw/i386/pc_q35=2Ec b/hw/i386/pc_q35=2Ec
>index 66cd718b70=2E=2E760efa62ca 100644
>--- a/hw/i386/pc_q35=2Ec
>+++ b/hw/i386/pc_q35=2Ec
>@@ -118,7 +118,7 @@ static void pc_q35_init(MachineState *machine)
>     PCMachineState *pcms =3D PC_MACHINE(machine);
>     PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
>     X86MachineState *x86ms =3D X86_MACHINE(machine);
>-    Q35PCIHost *q35_host;
>+    DeviceState *q35_host;
>     PCIHostState *phb;

While at it, you could incorporate this change: https://lore=2Ekernel=2Eor=
g/qemu-devel/20230131115326=2E12454-5-shentey@gmail=2Ecom/ , i=2Ee=2E resol=
ve the now redundant q35_host variable and use phb instead as DeviceState=
=2E

I'll drop the patch from my series in favor of yours=2E

Best regards,
Bernhard

>     PCIBus *host_bus;
>     PCIDevice *lpc;
>@@ -206,7 +206,7 @@ static void pc_q35_init(MachineState *machine)
>     }
>=20
>     /* create pci host bus */
>-    q35_host =3D Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
>+    q35_host =3D qdev_new(TYPE_Q35_HOST_DEVICE);
>=20
>     if (pcmc->pci_enabled) {
>         pci_hole64_size =3D object_property_get_uint(OBJECT(q35_host),
>@@ -219,18 +219,15 @@ static void pc_q35_init(MachineState *machine)
>                    pci_hole64_size);
>=20
>     object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host=
));
>-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>-                             OBJECT(ram_memory), NULL);
>-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
>-                             OBJECT(pci_memory), NULL);
>-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_SYSTEM_MEM,
>-                             OBJECT(get_system_memory()), NULL);
>-    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_IO_MEM,
>-                             OBJECT(system_io), NULL);
>-    object_property_set_int(OBJECT(q35_host), PCI_HOST_BELOW_4G_MEM_SIZE=
,
>-                            x86ms->below_4g_mem_size, NULL);
>-    object_property_set_int(OBJECT(q35_host), PCI_HOST_ABOVE_4G_MEM_SIZE=
,
>-                            x86ms->above_4g_mem_size, NULL);
>+    qdev_prop_set_link(q35_host, MCH_HOST_PROP_RAM_MEM, OBJECT(ram_memor=
y));
>+    qdev_prop_set_link(q35_host, MCH_HOST_PROP_PCI_MEM, OBJECT(pci_memor=
y));
>+    qdev_prop_set_link(q35_host, MCH_HOST_PROP_IO_MEM, OBJECT(system_io)=
);
>+    qdev_prop_set_link(q35_host, MCH_HOST_PROP_SYSTEM_MEM,
>+                       OBJECT(get_system_memory()));
>+    qdev_prop_set_uint64(q35_host, PCI_HOST_BELOW_4G_MEM_SIZE,
>+                         x86ms->below_4g_mem_size);
>+    qdev_prop_set_uint64(q35_host, PCI_HOST_ABOVE_4G_MEM_SIZE,
>+                         x86ms->above_4g_mem_size);
>     /* pci */
>     sysbus_realize_and_unref(SYS_BUS_DEVICE(q35_host), &error_fatal);
>     phb =3D PCI_HOST_BRIDGE(q35_host);
>diff --git a/hw/i386/sgx=2Ec b/hw/i386/sgx=2Ec
>index 6a729bff94=2E=2E196fa5afee 100644
>--- a/hw/i386/sgx=2Ec
>+++ b/hw/i386/sgx=2Ec
>@@ -304,8 +304,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>         object_property_parse(OBJECT(dev), SGX_EPC_MEMDEV_PROP,
>                               list->value->memdev, &error_fatal);
>         /* set the numa node property for sgx epc object */
>-        object_property_set_uint(OBJECT(dev), SGX_EPC_NUMA_NODE_PROP,
>-                                 list->value->node, &error_fatal);
>+        qdev_prop_set_uint32(dev, SGX_EPC_NUMA_NODE_PROP, list->value->n=
ode);
>         qdev_realize_and_unref(dev, NULL, &error_fatal);
>     }
>=20
>diff --git a/hw/i386/x86=2Ec b/hw/i386/x86=2Ec
>index eaff4227bd=2E=2E191a8c36ee 100644
>--- a/hw/i386/x86=2Ec
>+++ b/hw/i386/x86=2Ec
>@@ -43,6 +43,7 @@
> #include "sysemu/xen=2Eh"
> #include "trace=2Eh"
>=20
>+#include "hw/qdev-properties=2Eh"
> #include "hw/i386/x86=2Eh"
> #include "target/i386/cpu=2Eh"
> #include "hw/i386/topology=2Eh"
>@@ -96,15 +97,10 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *=
x86ms,
>=20
> void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
> {
>-    Object *cpu =3D object_new(MACHINE(x86ms)->cpu_type);
>+    DeviceState *cpu =3D DEVICE(object_new(MACHINE(x86ms)->cpu_type));
>=20
>-    if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
>-        goto out;
>-    }
>-    qdev_realize(DEVICE(cpu), NULL, errp);
>-
>-out:
>-    object_unref(cpu);
>+    qdev_prop_set_uint32(cpu, "apic-id", apic_id);
>+    qdev_realize(cpu, NULL, errp);
> }
>=20
> void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
>diff --git a/hw/mem/pc-dimm=2Ec b/hw/mem/pc-dimm=2Ec
>index 50ef83215c=2E=2Ed6e0c8b680 100644
>--- a/hw/mem/pc-dimm=2Ec
>+++ b/hw/mem/pc-dimm=2Ec
>@@ -66,8 +66,7 @@ void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState =
*machine,
>         error_propagate(errp, local_err);
>         return;
>     }
>-    object_property_set_int(OBJECT(dimm), PC_DIMM_SLOT_PROP, slot,
>-                            &error_abort);
>+    qdev_prop_set_int32(DEVICE(dimm), PC_DIMM_SLOT_PROP, slot);
>     trace_mhp_pc_dimm_assigned_slot(slot);
>=20
>     memory_device_pre_plug(MEMORY_DEVICE(dimm), machine, legacy_align,
>@@ -234,7 +233,7 @@ static uint64_t pc_dimm_md_get_addr(const MemoryDevic=
eState *md)
> static void pc_dimm_md_set_addr(MemoryDeviceState *md, uint64_t addr,
>                                 Error **errp)
> {
>-    object_property_set_uint(OBJECT(md), PC_DIMM_ADDR_PROP, addr, errp);
>+    qdev_prop_set_uint64(DEVICE(md), PC_DIMM_ADDR_PROP, addr);
> }
>=20
> static MemoryRegion *pc_dimm_md_get_memory_region(MemoryDeviceState *md,
>diff --git a/target/i386/cpu=2Ec b/target/i386/cpu=2Ec
>index 4d2b8d0444=2E=2E5532cd42c5 100644
>--- a/target/i386/cpu=2Ec
>+++ b/target/i386/cpu=2Ec
>@@ -5073,10 +5073,8 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPU=
Model *model)
>      */
>=20
>     /* CPU models only set _minimum_ values for level/xlevel: */
>-    object_property_set_uint(OBJECT(cpu), "min-level", def->level,
>-                             &error_abort);
>-    object_property_set_uint(OBJECT(cpu), "min-xlevel", def->xlevel,
>-                             &error_abort);
>+    qdev_prop_set_uint32(DEVICE(cpu), "min-level", def->level);
>+    qdev_prop_set_uint32(DEVICE(cpu), "min-xlevel", def->xlevel);
>=20
>     object_property_set_int(OBJECT(cpu), "family", def->family, &error_a=
bort);
>     object_property_set_int(OBJECT(cpu), "model", def->model, &error_abo=
rt);
>diff --git a/target/i386/host-cpu=2Ec b/target/i386/host-cpu=2Ec
>index 10f8aba86e=2E=2E0307eaa208 100644
>--- a/target/i386/host-cpu=2Ec
>+++ b/target/i386/host-cpu=2Ec
>@@ -158,7 +158,7 @@ void host_cpu_instance_init(X86CPU *cpu)
>=20
>         host_cpuid(0, 0, NULL, &ebx, &ecx, &edx);
>         x86_cpu_vendor_words2str(vendor, ebx, edx, ecx);
>-        object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_ab=
ort);
>+        qdev_prop_set_string(DEVICE(cpu), "vendor", vendor);
>     }
> }
>=20
>@@ -174,13 +174,12 @@ void host_cpu_max_instance_init(X86CPU *cpu)
>     host_cpu_vendor_fms(vendor, &family, &model, &stepping);
>     host_cpu_fill_model_id(model_id);
>=20
>-    object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_abort)=
;
>+    qdev_prop_set_string(DEVICE(cpu), "vendor", vendor);
>     object_property_set_int(OBJECT(cpu), "family", family, &error_abort)=
;
>     object_property_set_int(OBJECT(cpu), "model", model, &error_abort);
>     object_property_set_int(OBJECT(cpu), "stepping", stepping,
>                             &error_abort);
>-    object_property_set_str(OBJECT(cpu), "model-id", model_id,
>-                            &error_abort);
>+    qdev_prop_set_string(DEVICE(cpu), "model-id", model_id);
> }
>=20
> static void host_cpu_class_init(ObjectClass *oc, void *data)

