Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXN0j-0002PX-MU
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 09:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXN0J-00029O-SQ
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 09:00:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXN0I-0004hs-2V
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 09:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677679221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZMPg2vzbfIhfQIMUFLNqi15BK7bfFsNZbjqvT92SszM=;
 b=bKItOxyjcppquyZb3B9rIfMedSScHRmDdUIr/j1nmi/oKjN+wA5xSPoJcSWePH7xTBxYzc
 GEv7ZmisM1w4wNQIgDpCx+7LCv08raa3t4estGRqWO8i1YyYfAaNTo8nR9kUQwBVBUB0wx
 wf9OgciRGjT32dQAMV44OA760CMFNe0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-USFA3K4yNe-hwIVjvk0KTg-1; Wed, 01 Mar 2023 09:00:19 -0500
X-MC-Unique: USFA3K4yNe-hwIVjvk0KTg-1
Received: by mail-wm1-f71.google.com with SMTP id
 az39-20020a05600c602700b003e97eb80524so8383194wmb.4
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 06:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677679207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0XfL8l8xOmZhL3qiUmXQcaSM9ZF7jdaG3d9SDQXs/Ac=;
 b=Ir2vvPqfn64+TMb5NKxZpETY0E5il4cYSIQTdixDOigU10yteJ1sMDzGFfmcY9O0hz
 T3f5x5X0VWXaEUtUJ6F8o3uv3J20ct2SFyja3Ed1/UnDW8ezQ5A4FCo7xRbqK3pbdOSa
 5B5UD7NzvkOo94E9L3knzdaf8lS62XUjovex0xn40hOWxrG5fTW6NNlog+/k3/RLvAEG
 JsxlPfP0cMFun9ger55LwDAjFqjLfzSvsJG9Jz7W8KiXr5X9iyD8+9P3vyyZE6ebgE0G
 9eTBnQUgzYZyw6ZQSqQtTNn1DMUswHgCqVIKegGEKIpVQ2VLMS/MRi+sEsfKakMUl0/m
 Pvxw==
X-Gm-Message-State: AO0yUKVnHukLDYtTrJy22dWhHCyISyQioJkdSOqIEc4Iw+nng1Uf9GWB
 TbYRp9IQ8HvuWUFdF73epCM9mZYmrb06mpo7RDjc5nCTGPhVrgwwRQnIkQO7dmP2XfcM9fgoTfT
 h9uuJNO+IZDMBebg=
X-Received: by 2002:a05:600c:4da3:b0:3ea:e4f8:be09 with SMTP id
 v35-20020a05600c4da300b003eae4f8be09mr4919258wmp.30.1677679207308; 
 Wed, 01 Mar 2023 06:00:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+1ywRU8eCd6TpEb56crYdEkITcAgU5uL3cWcNQJokSkqc2XpSCeF2CrKAgAAsNAv4Vj06oqQ==
X-Received: by 2002:a05:600c:4da3:b0:3ea:e4f8:be09 with SMTP id
 v35-20020a05600c4da300b003eae4f8be09mr4919224wmp.30.1677679206908; 
 Wed, 01 Mar 2023 06:00:06 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a05600c3aca00b003eb369abd92sm14778057wms.2.2023.03.01.06.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 06:00:06 -0800 (PST)
Date: Wed, 1 Mar 2023 15:00:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, David
 Hildenbrand <david@redhat.com>, Xiao Guangrong
 <xiaoguangrong.eric@gmail.com>
Subject: Re: [RFC PATCH 12/19] hw/i386: Set QDev properties using QDev API
Message-ID: <20230301150004.11f486a6@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230203180914.49112-13-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
 <20230203180914.49112-13-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 01 Mar 2023 14:00:36 -0000

On Fri,  3 Feb 2023 19:09:07 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/i386/pc.c           |  8 +++-----
>  hw/i386/pc_q35.c       | 25 +++++++++++--------------
>  hw/i386/sgx.c          |  3 +--
>  hw/i386/x86.c          | 12 ++++--------
>  hw/mem/pc-dimm.c       |  5 ++---
>  target/i386/cpu.c      |  6 ++----
>  target/i386/host-cpu.c |  7 +++----
>  7 files changed, 26 insertions(+), 40 deletions(-)
>=20
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 6e592bd969..700fdefa12 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1236,8 +1236,7 @@ static void pc_superio_init(ISABus *isa_bus, bool c=
reate_fdctrl,
>          vmmouse =3D NULL;
>      }
>      if (vmmouse) {
> -        object_property_set_link(OBJECT(vmmouse), TYPE_I8042, OBJECT(i80=
42),
> -                                 &error_abort);
> +        qdev_prop_set_link(DEVICE(vmmouse), TYPE_I8042, OBJECT(i8042));
>          isa_realize_and_unref(vmmouse, isa_bus, &error_fatal);
>      }
>      port92 =3D isa_create_simple(isa_bus, TYPE_PORT92);
> @@ -1538,9 +1537,8 @@ static void pc_machine_device_pre_plug_cb(HotplugHa=
ndler *hotplug_dev,
>          char *resv_prop_str =3D g_strdup_printf("0xfee00000:0xfeefffff:%=
d",
>                                                VIRTIO_IOMMU_RESV_MEM_T_MS=
I);
> =20
> -        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1,=
 errp);
> -        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
> -                                resv_prop_str, errp);
> +        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> +        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);

this is wrong, you can do above only if failure is not expected (i.e. error=
_abort)


>          g_free(resv_prop_str);
>      }
> =20
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 66cd718b70..760efa62ca 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -118,7 +118,7 @@ static void pc_q35_init(MachineState *machine)
>      PCMachineState *pcms =3D PC_MACHINE(machine);
>      PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
>      X86MachineState *x86ms =3D X86_MACHINE(machine);
> -    Q35PCIHost *q35_host;
> +    DeviceState *q35_host;
>      PCIHostState *phb;
>      PCIBus *host_bus;
>      PCIDevice *lpc;
> @@ -206,7 +206,7 @@ static void pc_q35_init(MachineState *machine)
>      }
> =20
>      /* create pci host bus */
> -    q35_host =3D Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
> +    q35_host =3D qdev_new(TYPE_Q35_HOST_DEVICE);
> =20
>      if (pcmc->pci_enabled) {
>          pci_hole64_size =3D object_property_get_uint(OBJECT(q35_host),
> @@ -219,18 +219,15 @@ static void pc_q35_init(MachineState *machine)
>                     pci_hole64_size);
> =20
>      object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host=
));
> -    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
> -                             OBJECT(ram_memory), NULL);
> -    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
> -                             OBJECT(pci_memory), NULL);
> -    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_SYSTEM_MEM,
> -                             OBJECT(get_system_memory()), NULL);
> -    object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_IO_MEM,
> -                             OBJECT(system_io), NULL);
> -    object_property_set_int(OBJECT(q35_host), PCI_HOST_BELOW_4G_MEM_SIZE=
,
> -                            x86ms->below_4g_mem_size, NULL);
> -    object_property_set_int(OBJECT(q35_host), PCI_HOST_ABOVE_4G_MEM_SIZE=
,
> -                            x86ms->above_4g_mem_size, NULL);
> +    qdev_prop_set_link(q35_host, MCH_HOST_PROP_RAM_MEM, OBJECT(ram_memor=
y));
> +    qdev_prop_set_link(q35_host, MCH_HOST_PROP_PCI_MEM, OBJECT(pci_memor=
y));
> +    qdev_prop_set_link(q35_host, MCH_HOST_PROP_IO_MEM, OBJECT(system_io)=
);
> +    qdev_prop_set_link(q35_host, MCH_HOST_PROP_SYSTEM_MEM,
> +                       OBJECT(get_system_memory()));
> +    qdev_prop_set_uint64(q35_host, PCI_HOST_BELOW_4G_MEM_SIZE,
> +                         x86ms->below_4g_mem_size);
> +    qdev_prop_set_uint64(q35_host, PCI_HOST_ABOVE_4G_MEM_SIZE,
> +                         x86ms->above_4g_mem_size);
>      /* pci */
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(q35_host), &error_fatal);
>      phb =3D PCI_HOST_BRIDGE(q35_host);
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index 6a729bff94..196fa5afee 100644
> --- a/hw/i386/sgx.c
> +++ b/hw/i386/sgx.c
> @@ -304,8 +304,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>          object_property_parse(OBJECT(dev), SGX_EPC_MEMDEV_PROP,
>                                list->value->memdev, &error_fatal);
>          /* set the numa node property for sgx epc object */
> -        object_property_set_uint(OBJECT(dev), SGX_EPC_NUMA_NODE_PROP,
> -                                 list->value->node, &error_fatal);
> +        qdev_prop_set_uint32(dev, SGX_EPC_NUMA_NODE_PROP, list->value->n=
ode);
>          qdev_realize_and_unref(dev, NULL, &error_fatal);
>      }
> =20
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index eaff4227bd..191a8c36ee 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -43,6 +43,7 @@
>  #include "sysemu/xen.h"
>  #include "trace.h"
> =20
> +#include "hw/qdev-properties.h"
>  #include "hw/i386/x86.h"
>  #include "target/i386/cpu.h"
>  #include "hw/i386/topology.h"
> @@ -96,15 +97,10 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *=
x86ms,
> =20
>  void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
>  {
> -    Object *cpu =3D object_new(MACHINE(x86ms)->cpu_type);
> +    DeviceState *cpu =3D DEVICE(object_new(MACHINE(x86ms)->cpu_type));
> =20
> -    if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
> -        goto out;
> -    }
> -    qdev_realize(DEVICE(cpu), NULL, errp);
> -
> -out:
> -    object_unref(cpu);
you are loosing reference here

> +    qdev_prop_set_uint32(cpu, "apic-id", apic_id);

broken

> +    qdev_realize(cpu, NULL, errp);
>  }

I'd drop this whole hunk, as unnecessary
=20
> =20
>  void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 50ef83215c..d6e0c8b680 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -66,8 +66,7 @@ void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState =
*machine,
>          error_propagate(errp, local_err);
>          return;
>      }
> -    object_property_set_int(OBJECT(dimm), PC_DIMM_SLOT_PROP, slot,
> -                            &error_abort);
> +    qdev_prop_set_int32(DEVICE(dimm), PC_DIMM_SLOT_PROP, slot);
>      trace_mhp_pc_dimm_assigned_slot(slot);
> =20
>      memory_device_pre_plug(MEMORY_DEVICE(dimm), machine, legacy_align,
> @@ -234,7 +233,7 @@ static uint64_t pc_dimm_md_get_addr(const MemoryDevic=
eState *md)
>  static void pc_dimm_md_set_addr(MemoryDeviceState *md, uint64_t addr,
>                                  Error **errp)
>  {
> -    object_property_set_uint(OBJECT(md), PC_DIMM_ADDR_PROP, addr, errp);
> +    qdev_prop_set_uint64(DEVICE(md), PC_DIMM_ADDR_PROP, addr);
ditto

>  }
> =20
>  static MemoryRegion *pc_dimm_md_get_memory_region(MemoryDeviceState *md,
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 4d2b8d0444..5532cd42c5 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5073,10 +5073,8 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPU=
Model *model)
>       */
> =20
>      /* CPU models only set _minimum_ values for level/xlevel: */
> -    object_property_set_uint(OBJECT(cpu), "min-level", def->level,
> -                             &error_abort);
> -    object_property_set_uint(OBJECT(cpu), "min-xlevel", def->xlevel,
> -                             &error_abort);
> +    qdev_prop_set_uint32(DEVICE(cpu), "min-level", def->level);
> +    qdev_prop_set_uint32(DEVICE(cpu), "min-xlevel", def->xlevel);
> =20
>      object_property_set_int(OBJECT(cpu), "family", def->family, &error_a=
bort);
>      object_property_set_int(OBJECT(cpu), "model", def->model, &error_abo=
rt);
> diff --git a/target/i386/host-cpu.c b/target/i386/host-cpu.c
> index 10f8aba86e..0307eaa208 100644
> --- a/target/i386/host-cpu.c
> +++ b/target/i386/host-cpu.c
> @@ -158,7 +158,7 @@ void host_cpu_instance_init(X86CPU *cpu)
> =20
>          host_cpuid(0, 0, NULL, &ebx, &ecx, &edx);
>          x86_cpu_vendor_words2str(vendor, ebx, edx, ecx);
> -        object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_ab=
ort);
> +        qdev_prop_set_string(DEVICE(cpu), "vendor", vendor);
>      }
>  }
> =20
> @@ -174,13 +174,12 @@ void host_cpu_max_instance_init(X86CPU *cpu)
>      host_cpu_vendor_fms(vendor, &family, &model, &stepping);
>      host_cpu_fill_model_id(model_id);
> =20
> -    object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_abort)=
;
> +    qdev_prop_set_string(DEVICE(cpu), "vendor", vendor);
^^^

>      object_property_set_int(OBJECT(cpu), "family", family, &error_abort)=
;
>      object_property_set_int(OBJECT(cpu), "model", model, &error_abort);
>      object_property_set_int(OBJECT(cpu), "stepping", stepping,
>                              &error_abort);
if you do above then do it consistently, I dislike that end result is
a mix of old and new styles.

> -    object_property_set_str(OBJECT(cpu), "model-id", model_id,
> -                            &error_abort);
> +    qdev_prop_set_string(DEVICE(cpu), "model-id", model_id);
>  }
> =20
>  static void host_cpu_class_init(ObjectClass *oc, void *data)


