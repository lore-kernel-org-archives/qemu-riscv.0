Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D82CAC5B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 01:25:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3P7X-0001E4-Sd; Mon, 29 Sep 2025 21:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v3P7W-0001Dk-JJ
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 21:25:34 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v3P7Q-0007tn-R9
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 21:25:33 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b3f5e0e2bf7so271351666b.3
 for <qemu-riscv@nongnu.org>; Mon, 29 Sep 2025 18:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759195524; x=1759800324; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WU0MNbAshOj9OjjSUqtsVQeDvnLZ1R4YqvGgUR1bv5w=;
 b=T0vdvrzz2m5eIEgSprvR9QRlGyohvrlW0mZUld+YjFtXlpE+iE5DQFMgCzcJp1tERX
 hI0O8TAxqc0sf+rGTNozZoZCok3kAwUyP7m5gFNLLngvOTGTI5JGOnoGFtmBMKJE/4Q8
 A0F6G+OIrWv1ctw1lEqgh043rRgkpxeWQuLuFxV7EQcZTJlYwD1St+wF2RBCvsQh6tUL
 1bS+LHkzQb60pg9nSEaxG1LfHdoT8pi64lhl6wVKxJTWiV3tWXhoT3LZGb5aLlYNUezS
 BlVd6QuJ6HxTALZp93bj2RlJjWJAyyonVVcNIUcZJQwVVo6mNYQsD98Z7SIkz0Qz4e9J
 bYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759195524; x=1759800324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WU0MNbAshOj9OjjSUqtsVQeDvnLZ1R4YqvGgUR1bv5w=;
 b=vJwBFY1mscrUWWqqb45t20LA+NERFTCXN4th2uDJal9Arz4/byX06sge6Cp1ppPU4J
 rhjWzCK1+ipjlv8ROH/NTHqqENmamee+wlthUWkt/fgcmSx9ofqCKMI7wf+T/VIef8/3
 XPe1OiwKEEDNTRAL2zrZSli3WCVisLDsVfAEhFsrQO6pmTGBSWCiWR53ZBn8c6cWJxvc
 On7qp7avWt4RJ0uSxlyMB4p2bFzsiWwsYUbc4Hv6g0iMIHHQ89VhawSXWnxbTuEF/QTM
 sjTOwGihzqT8uElPcTv+4N6bFwQsVON26y7nUmidofJtUzBWi1d8y34MqrcjCoBAVtyP
 +FKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGFRjN83Zkzmknsd7QbpvkgoLICdOiIA6YEwaM94o663D6WgnAnC8Rj4gi05pg5O3qqACJFv/jBflQ@nongnu.org
X-Gm-Message-State: AOJu0YxEAFtXp3sCAmGWqCciTU9NijMqDmqz6+OFlFvivztkxUQmnjjn
 nyJbdjxYTzVMvUN9+sBwXuxOmF9W+gOnqb0KzAp05OvEWzz6SEW/otq3p285Sf2261QkDHY3Z23
 4QoAx2ItEy/O2VuKPMwZh3liqyPOnuWc=
X-Gm-Gg: ASbGncvdkhbFjo3B5VZpN6RSDLiXncTzEJrH/jBVlzUIXJ+9pDkqVk1IXn17XXew1VG
 mHO8FG8AdqwcuRDz2H5CbPI+n9eB4HwLNOe1dcEtn2AttL7gdG1jcdOz2xWk72SilS7BoQDOHiv
 J4tTKcU2HJu9UgO07RGjn38Ye/27FhtPYCmlBPQ0M/2KUOf5z4u/en1qw8pMRWuD3rbf/WFz2N1
 6Wqa47lj//0C8gHLvhQheJtGwsJRO0aABjQuIT62HOws5eP
X-Google-Smtp-Source: AGHT+IF9TwELt/FcW5G+bs7Al8xHMC7+Ds/lxsCyPY6PBeUVvaTbRjMpOM59PR4cw7Ul3pNob+V9dJPlDEOoDTK3RiI=
X-Received: by 2002:a17:906:6a18:b0:b45:1063:fb65 with SMTP id
 a640c23a62f3a-b451073517emr18224966b.39.1759195524517; Mon, 29 Sep 2025
 18:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250924091746.1882125-1-djordje.todorovic@htecgroup.com>
 <20250924091746.1882125-10-djordje.todorovic@htecgroup.com>
In-Reply-To: <20250924091746.1882125-10-djordje.todorovic@htecgroup.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Sep 2025 11:24:57 +1000
X-Gm-Features: AS18NWBmxygDP0yIjEKsojjm75foWYU3W7-zKmVriMbdOHIT4OYoEZirw9civ7I
Message-ID: <CAKmqyKPBN+R5B4x-XtM_Lu3QFuZUtgG_4mw9-ZH4UG+KaHmozA@mail.gmail.com>
Subject: Re: [PATCH v8 09/14] hw/misc: Add RISC-V CPC device implementation
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>, 
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>, 
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "philmd@linaro.org" <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Sep 24, 2025 at 7:21=E2=80=AFPM Djordje Todorovic
<Djordje.Todorovic@htecgroup.com> wrote:
>
> Add RISC-V implementation of the Cluster Power Controller (CPC) device.
> It is based on the existing MIPS CPC implementations but adapted for
> RISC-V systems.
>
> The CPC device manages power control for CPU clusters in RISC-V
> systems.
>
> This is needed for the MIPS BOSTON AIA board.
>
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/misc/Kconfig             |   4 +
>  hw/misc/meson.build         |   1 +
>  hw/misc/riscv_cpc.c         | 263 ++++++++++++++++++++++++++++++++++++
>  include/hw/misc/riscv_cpc.h |  64 +++++++++
>  4 files changed, 332 insertions(+)
>  create mode 100644 hw/misc/riscv_cpc.c
>  create mode 100644 include/hw/misc/riscv_cpc.h
>
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index c72927c3ff..1e35bcd443 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -124,11 +124,15 @@ config MIPS_ITU
>  config RISCV_CMGCR
>      bool
>
> +config RISCV_CPC

This name implies this is a RISC-V device, but it's just a MIPS thing.
It should be renamed to indicate it's MIPS vendor specific IP

> +    bool
> +
>  config MIPS_BOSTON_AIA
>      bool
>      default y
>      depends on RISCV64
>      select RISCV_CMGCR
> +    select RISCV_CPC
>
>  config MPS2_FPGAIO
>      bool
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index ef891e465b..1f9945755f 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -158,6 +158,7 @@ specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: fil=
es('mips_cmgcr.c', 'mips_cp
>  specific_ss.add(when: 'CONFIG_MIPS_ITU', if_true: files('mips_itu.c'))
>
>  specific_ss.add(when: 'CONFIG_RISCV_CMGCR', if_true: files('riscv_cmgcr.=
c'))
> +specific_ss.add(when: 'CONFIG_RISCV_CPC', if_true: files('riscv_cpc.c'))
>
>  system_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
>
> diff --git a/hw/misc/riscv_cpc.c b/hw/misc/riscv_cpc.c
> new file mode 100644
> index 0000000000..f3168a79da
> --- /dev/null
> +++ b/hw/misc/riscv_cpc.c
> @@ -0,0 +1,263 @@
> +/*
> + * Cluster Power Controller emulation
> + *
> + * Copyright (c) 2016 Imagination Technologies
> + *
> + * Copyright (c) 2025 MIPS
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later

Docs please

Alistair

> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "cpu.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/timer.h"
> +#include "qemu/bitops.h"
> +#include "hw/sysbus.h"
> +#include "migration/vmstate.h"
> +
> +#include "hw/misc/riscv_cpc.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/intc/riscv_aclint.h"
> +#include "hw/resettable.h"
> +
> +static inline uint64_t cpc_vp_run_mask(RISCVCPCState *cpc)
> +{
> +    return MAKE_64BIT_MASK(0, cpc->num_vp);
> +}
> +
> +static void riscv_cpu_reset_async_work(CPUState *cs, run_on_cpu_data dat=
a)
> +{
> +    RISCVCPCState *cpc =3D (RISCVCPCState *) data.host_ptr;
> +    int i;
> +
> +    cpu_reset(cs);
> +    cs->halted =3D 0;
> +
> +    /* Find this CPU's index in the CPC's CPU array */
> +    for (i =3D 0; i < cpc->num_vp; i++) {
> +        if (cpc->cpus[i] =3D=3D cs) {
> +            cpc->vps_running_mask |=3D BIT_ULL(i);
> +            break;
> +        }
> +    }
> +}
> +
> +static void cpc_run_vp(RISCVCPCState *cpc, uint64_t vps_run_mask)
> +{
> +    int vp;
> +
> +    for (vp =3D 0; vp < cpc->num_vp; vp++) {
> +        CPUState *cs =3D cpc->cpus[vp];
> +
> +        if (!extract64(vps_run_mask, vp, 1)) {
> +            continue;
> +        }
> +
> +        if (extract64(cpc->vps_running_mask, vp, 1)) {
> +            continue;
> +        }
> +
> +        /*
> +         * To avoid racing with a CPU we are just kicking off.
> +         * We do the final bit of preparation for the work in
> +         * the target CPUs context.
> +         */
> +        async_safe_run_on_cpu(cs, riscv_cpu_reset_async_work,
> +                              RUN_ON_CPU_HOST_PTR(cpc));
> +    }
> +}
> +
> +static void cpc_stop_vp(RISCVCPCState *cpc, uint64_t vps_stop_mask)
> +{
> +    int vp;
> +
> +    for (vp =3D 0; vp < cpc->num_vp; vp++) {
> +        CPUState *cs =3D cpc->cpus[vp];
> +
> +        if (!extract64(vps_stop_mask, vp, 1)) {
> +            continue;
> +        }
> +
> +        if (!extract64(cpc->vps_running_mask, vp, 1)) {
> +            continue;
> +        }
> +
> +        cpu_interrupt(cs, CPU_INTERRUPT_HALT);
> +        cpc->vps_running_mask &=3D ~BIT_ULL(vp);
> +    }
> +}
> +
> +static void cpc_write(void *opaque, hwaddr offset, uint64_t data,
> +                      unsigned size)
> +{
> +    RISCVCPCState *s =3D opaque;
> +    int cpu_index, c;
> +
> +    for (c =3D 0; c < s->num_core; c++) {
> +        cpu_index =3D c * s->num_hart +
> +                    s->cluster_id * s->num_core * s->num_hart;
> +        if (offset =3D=3D
> +            CPC_CL_BASE_OFS + CPC_VP_RUN_OFS + c * CPC_CORE_REG_STRIDE) =
{
> +            cpc_run_vp(s, (data << cpu_index) & cpc_vp_run_mask(s));
> +            return;
> +        }
> +        if (offset =3D=3D
> +            CPC_CL_BASE_OFS + CPC_VP_STOP_OFS + c * CPC_CORE_REG_STRIDE)=
 {
> +            cpc_stop_vp(s, (data << cpu_index) & cpc_vp_run_mask(s));
> +            return;
> +        }
> +    }
> +
> +    switch (offset) {
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: Bad offset 0x%x\n",  __func__, (int)offset);
> +        break;
> +    }
> +
> +    return;
> +}
> +
> +static uint64_t cpc_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    RISCVCPCState *s =3D opaque;
> +    int c;
> +
> +    for (c =3D 0; c < s->num_core; c++) {
> +        if (offset =3D=3D
> +            CPC_CL_BASE_OFS + CPC_STAT_CONF_OFS + c * CPC_CORE_REG_STRID=
E) {
> +            /* Return the state as U6. */
> +            return CPC_Cx_STAT_CONF_SEQ_STATE_U6;
> +        }
> +    }
> +
> +    switch (offset) {
> +    case CPC_CM_STAT_CONF_OFS:
> +        return CPC_Cx_STAT_CONF_SEQ_STATE_U5;
> +    case CPC_MTIME_REG_OFS:
> +        return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ,
> +                        NANOSECONDS_PER_SECOND);
> +        return 0;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: Bad offset 0x%x\n",  __func__, (int)offset);
> +        return 0;
> +    }
> +}
> +
> +static const MemoryRegionOps cpc_ops =3D {
> +    .read =3D cpc_read,
> +    .write =3D cpc_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .impl =3D {
> +        .min_access_size =3D 8,
> +    },
> +};
> +
> +static void riscv_cpc_init(Object *obj)
> +{
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> +    RISCVCPCState *s =3D RISCV_CPC(obj);
> +    int i;
> +
> +    memory_region_init_io(&s->mr, OBJECT(s), &cpc_ops, s, "xmips-cpc",
> +                          CPC_ADDRSPACE_SZ);
> +    sysbus_init_mmio(sbd, &s->mr);
> +
> +    /* Allocate CPU array */
> +    s->cpus =3D g_new0(CPUState *, CPC_MAX_VPS);
> +
> +    /* Create link properties for each possible CPU slot */
> +    for (i =3D 0; i < CPC_MAX_VPS; i++) {
> +        char *propname =3D g_strdup_printf("cpu[%d]", i);
> +        object_property_add_link(obj, propname, TYPE_CPU,
> +                                 (Object **)&s->cpus[i],
> +                                 qdev_prop_allow_set_link_before_realize=
,
> +                                 OBJ_PROP_LINK_STRONG);
> +        g_free(propname);
> +    }
> +}
> +
> +static void riscv_cpc_realize(DeviceState *dev, Error **errp)
> +{
> +    RISCVCPCState *s =3D RISCV_CPC(dev);
> +    int i;
> +
> +    if (s->vps_start_running_mask & ~cpc_vp_run_mask(s)) {
> +        error_setg(errp,
> +                   "incorrect vps-start-running-mask 0x%" PRIx64
> +                   " for num_vp =3D %d",
> +                   s->vps_start_running_mask, s->num_vp);
> +        return;
> +    }
> +
> +    /* Verify that required CPUs have been linked */
> +    for (i =3D 0; i < s->num_vp; i++) {
> +        if (!s->cpus[i]) {
> +            error_setg(errp, "CPU %d has not been linked", i);
> +            return;
> +        }
> +    }
> +}
> +
> +static void riscv_cpc_reset_hold(Object *obj, ResetType type)
> +{
> +    RISCVCPCState *s =3D RISCV_CPC(obj);
> +
> +    /* Reflect the fact that all VPs are halted on reset */
> +    s->vps_running_mask =3D 0;
> +
> +    /* Put selected VPs into run state */
> +    cpc_run_vp(s, s->vps_start_running_mask);
> +}
> +
> +static const VMStateDescription vmstate_riscv_cpc =3D {
> +    .name =3D "xmips-cpc",
> +    .version_id =3D 0,
> +    .minimum_version_id =3D 0,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT64(vps_running_mask, RISCVCPCState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static const Property riscv_cpc_properties[] =3D {
> +    DEFINE_PROP_UINT32("cluster-id", RISCVCPCState, cluster_id, 0x0),
> +    DEFINE_PROP_UINT32("num-vp", RISCVCPCState, num_vp, 0x1),
> +    DEFINE_PROP_UINT32("num-hart", RISCVCPCState, num_hart, 0x1),
> +    DEFINE_PROP_UINT32("num-core", RISCVCPCState, num_core, 0x1),
> +    DEFINE_PROP_UINT64("vps-start-running-mask", RISCVCPCState,
> +                       vps_start_running_mask, 0x1),
> +};
> +
> +static void riscv_cpc_class_init(ObjectClass *klass, const void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> +
> +    dc->realize =3D riscv_cpc_realize;
> +    rc->phases.hold =3D riscv_cpc_reset_hold;
> +    dc->vmsd =3D &vmstate_riscv_cpc;
> +    device_class_set_props(dc, riscv_cpc_properties);
> +    dc->user_creatable =3D false;
> +}
> +
> +static const TypeInfo riscv_cpc_info =3D {
> +    .name          =3D TYPE_RISCV_CPC,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(RISCVCPCState),
> +    .instance_init =3D riscv_cpc_init,
> +    .class_init    =3D riscv_cpc_class_init,
> +};
> +
> +static void riscv_cpc_register_types(void)
> +{
> +    type_register_static(&riscv_cpc_info);
> +}
> +
> +type_init(riscv_cpc_register_types)
> diff --git a/include/hw/misc/riscv_cpc.h b/include/hw/misc/riscv_cpc.h
> new file mode 100644
> index 0000000000..713455eb83
> --- /dev/null
> +++ b/include/hw/misc/riscv_cpc.h
> @@ -0,0 +1,64 @@
> +/*
> + * Cluster Power Controller emulation
> + *
> + * Copyright (c) 2016 Imagination Technologies
> + *
> + * Copyright (c) 2025 MIPS
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + */
> +
> +#ifndef RISCV_CPC_H
> +#define RISCV_CPC_H
> +
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +
> +#define CPC_ADDRSPACE_SZ    0x6000
> +
> +/* CPC global register offsets relative to base address */
> +#define CPC_MTIME_REG_OFS   0x50
> +
> +#define CPC_CM_STAT_CONF_OFS   0x1008
> +
> +/* CPC blocks offsets relative to base address */
> +#define CPC_CL_BASE_OFS     0x2000
> +#define CPC_CORE_REG_STRIDE 0x100 /* Stride between core-specific regist=
ers */
> +
> +/* CPC register offsets relative to block offsets */
> +#define CPC_STAT_CONF_OFS   0x08
> +#define CPC_VP_STOP_OFS     0x20
> +#define CPC_VP_RUN_OFS      0x28
> +#define CPC_VP_RUNNING_OFS  0x30
> +
> +#define SEQ_STATE_BIT       19
> +#define SEQ_STATE_U5        0x6
> +#define SEQ_STATE_U6        0x7
> +#define CPC_Cx_STAT_CONF_SEQ_STATE_U5      (SEQ_STATE_U5 << SEQ_STATE_BI=
T)
> +#define CPC_Cx_STAT_CONF_SEQ_STATE_U6      (SEQ_STATE_U6 << SEQ_STATE_BI=
T)
> +
> +#define TYPE_RISCV_CPC "xmips-cpc"
> +OBJECT_DECLARE_SIMPLE_TYPE(RISCVCPCState, RISCV_CPC)
> +
> +typedef struct RISCVCPCState {
> +    SysBusDevice parent_obj;
> +
> +    uint32_t cluster_id;
> +    uint32_t num_vp;
> +    uint32_t num_hart;
> +    uint32_t num_core;
> +    /* VPs running from restart mask */
> +    uint64_t vps_start_running_mask;
> +
> +    MemoryRegion mr;
> +    /* Indicates which VPs are in the run state mask */
> +    uint64_t vps_running_mask;
> +
> +    /* Array of CPUs managed by this CPC */
> +    CPUState **cpus;
> +} RISCVCPCState;
> +
> +#define CPC_MAX_VPS 64  /* Maximum number of VPs supported */
> +
> +#endif /* RISCV_CPC_H */
> --
> 2.34.1
>

