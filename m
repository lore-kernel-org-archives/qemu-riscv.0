Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8213DC001B0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 11:27:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTKrq-0008E7-OH; Tue, 08 Aug 2023 07:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qTKrn-0008Da-Ck
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 07:27:12 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qTKrl-0002mA-1k
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 07:27:11 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1bb717ece50so4143761fac.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 04:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691494026; x=1692098826;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xl8lDxK06Lljb2MPNr4JvzNIafp4+zNxVOOp4JhlZF0=;
 b=ZDXoJcuMLfaBjR4U46Jn0jt5wfr1yK8TJH+e0fI5WlwXzEAn/4G6TLuHGpZxiKoaZ9
 pD8mrWOBnAQzxw5o5clFutuhPTgssJICJXzN03nzxNDDhDi0ejbMrvl4vMIi0QISrY3e
 d7SUJjU/BrAh9IMBE0khDpAyIeFGxxyM6DyNMF8O7lR5K0zMs4u6u1B13V8r/BKDhr/J
 wpHN1PJI3rSKgXRPGmNWyVyVRMW2pgw11Q9f7iVWK4k0BllcmhZovVE3D8Rd+8qzRIPB
 eSbiUCDQZn5v81Vj9s31HePLmnPYzZdOmzyxQNOSZqGw16bJ5SjQgFcmb8Zb6RTS4Xhr
 ikWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691494026; x=1692098826;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xl8lDxK06Lljb2MPNr4JvzNIafp4+zNxVOOp4JhlZF0=;
 b=j132YVUHSwBQ5nSD849TEnFiSPJBjuw91mhcgyz471oz+LCFYD4ILv0OL/99N1pOKp
 bwOC+NmwzmQdaCSPTASfSNsEJB66dvK+W+PLQaQVZMfwcOsaZf2hBOiRz/YXqLRTlmzV
 8bQGUEPxlzmI5RjdlLos9j9Huo6tBiTjvHWMbJmez13X1CG2oDxo+bVjcOIxh7xPQzo6
 9Z0wNthmStMk07c9eg3/ISxPmHr2l/pQFeuWCjE5sOL3NGusvUZJCTHx5IKs7zrfCBbS
 6ecpDlPqzLt5J5dPkBurpCj1GZd20R+K2UUkmtKghr4+q0vSlfLtdGRoGSFaJB4mnZr7
 8/Mg==
X-Gm-Message-State: AOJu0YxKJq7/A2ublFvm1yul1URxpqA6DXCqlGshl+atJMYXbrgPtzMI
 mZPbLKCaRbmqBKvx8jk8WNPktQ==
X-Google-Smtp-Source: AGHT+IGhbm2Wq1j3kg0Idmu2EM7Ts0FLI3rOpVKl+/lRXneAp8CozxzEcUt1fAAtmlmHfzuawykCrw==
X-Received: by 2002:a05:6870:f154:b0:1be:def0:2e6 with SMTP id
 l20-20020a056870f15400b001bedef002e6mr15573048oac.55.1691494026057; 
 Tue, 08 Aug 2023 04:27:06 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59?
 ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 125-20020a4a1183000000b00565fcfabab8sm5687410ooc.21.2023.08.08.04.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 04:27:05 -0700 (PDT)
Message-ID: <2442909f-eb00-999b-d989-5d4c4f1b0b3c@ventanamicro.com>
Date: Tue, 8 Aug 2023 08:27:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] hw/riscv: hart: allow other cpu instance
To: Nikita Shubin <nikita.shubin@maquefel.me>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Cc: Nikita Shubin <n.shubin@yadro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230727080545.7908-1-nikita.shubin@maquefel.me>
 <43c6120f-ed43-d45c-a3a5-a3bf22fd8f67@ventanamicro.com>
 <c60d90c8c17a876b9e976416e2259ddc92ffdd9f.camel@maquefel.me>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <c60d90c8c17a876b9e976416e2259ddc92ffdd9f.camel@maquefel.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.14,
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



On 8/8/23 04:56, Nikita Shubin wrote:
> Hello Deniel!
> 
> On Mon, 2023-07-31 at 11:12 -0300, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 7/27/23 05:05, Nikita Shubin wrote:
>>>>> From: Nikita Shubin <n.shubin@yadro.com>
>>>>>
>>>>> Allow using instances derivative from RISCVCPU
>>>>>
>>>>> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
>>>>> ---
>>>>> Currently it is not possible to overload instance of RISCVCPU,
>>>>> i.e. something like this:
>>>>>
>>>>> static const TypeInfo riscv_cpu_type_infos[] = {
>>>>>        {
>>>>>           .name = TYPE_ANOTHER_RISCV_CPU,
>>>>>           .parent = TYPE_RISCV_CPU,
>>>>>           .instance_size = sizeof(MyCPUState),
>>>>>           .instance_init = riscv_my_cpu_init,
>>>>>       }
>>>>> };
>>>>>
>>>>> Because we have RISCVHartArrayState.harts with exactly
>>>>> the size of RISCVCPU.
>>>>>
>>>>> Using own instances can be used to store some internal hart
>>>>> state.
>>>>> ---
>>>>>    hw/riscv/boot.c               |  5 +++--
>>>>>    hw/riscv/riscv_hart.c         | 20 ++++++++++++--------
>>>>>    hw/riscv/sifive_u.c           |  7 +++++--
>>>>>    hw/riscv/spike.c              |  4 +++-
>>>>>    hw/riscv/virt-acpi-build.c    |  2 +-
>>>>>    hw/riscv/virt.c               |  6 +++---
>>>>>    include/hw/riscv/riscv_hart.h | 18 +++++++++++++++++-
>>>>>    7 files changed, 44 insertions(+), 18 deletions(-)
>>>>>
>>>>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>>>>> index 52bf8e67de..c0456dcc2e 100644
>>>>> --- a/hw/riscv/boot.c
>>>>> +++ b/hw/riscv/boot.c
>>>>> @@ -36,7 +36,8 @@
>>>>>    
>>>>>    bool riscv_is_32bit(RISCVHartArrayState *harts)
>>>>>    {
>>>>> -    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
>>>>> +    RISCVCPU *hart = riscv_array_get_hart(harts, 0);
>>>>> +    return hart->env.misa_mxl_max == MXL_RV32;
>>>>>    }
>>>>>    
>>>>>    /*
>>>>> @@ -414,7 +415,7 @@ void riscv_setup_rom_reset_vec(MachineState
>>>>> *machine, RISCVHartArrayState *harts
>>>>>            reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0)
>>>>> */
>>>>>        }
>>>>>    
>>>>> -    if (!harts->harts[0].cfg.ext_icsr) {
>>>>> +    if (!riscv_array_get_hart(harts, 0)->cfg.ext_icsr) {
>>>>>            /*
>>>>>             * The Zicsr extension has been disabled, so let's
>>>>> ensure
>>>>> we don't
>>>>>             * run the CSR instruction. Let's fill the address
>>>>> with a
>>>>> non
>>>>> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
>>>>> index 613ea2aaa0..74fc10ef48 100644
>>>>> --- a/hw/riscv/riscv_hart.c
>>>>> +++ b/hw/riscv/riscv_hart.c
>>>>> @@ -43,24 +43,28 @@ static void riscv_harts_cpu_reset(void
>>>>> *opaque)
>>>>>    }
>>>>>    
>>>>>    static bool riscv_hart_realize(RISCVHartArrayState *s, int
>>>>> idx,
>>>>> -                               char *cpu_type, Error **errp)
>>>>> +                               char *cpu_type, size_t size,
>>>>> Error
>>>>> **errp)
>>>>>    {
>>>>> -    object_initialize_child(OBJECT(s), "harts[*]", &s-
>>>>>> harts[idx],
>>>>> cpu_type);
>>>>> -    qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec",
>>>>> s->resetvec);
>>>>> -    s->harts[idx].env.mhartid = s->hartid_base + idx;
>>>>> -    qemu_register_reset(riscv_harts_cpu_reset, &s-
>>>>>> harts[idx]);
>>>>> -    return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
>>>>> +    RISCVCPU *hart = riscv_array_get_hart(s, idx);
>>>>> +    object_initialize_child_internal(OBJECT(s), "harts[*]",
>>>>> +                                    hart, size, cpu_type);
>>>>> +    qdev_prop_set_uint64(DEVICE(hart), "resetvec", s-
>>>>>> resetvec);
>>>>> +    hart->env.mhartid = s->hartid_base + idx;
>>>>> +    qemu_register_reset(riscv_harts_cpu_reset, hart);
>>>>> +    return qdev_realize(DEVICE(hart), NULL, errp);
>>>>>    }
>>>>>    
>>>>>    static void riscv_harts_realize(DeviceState *dev, Error
>>>>> **errp)
>>>>>    {
>>>>>        RISCVHartArrayState *s = RISCV_HART_ARRAY(dev);
>>>>> +    size_t size = object_type_get_instance_size(s->cpu_type);
>>>>>        int n;
>>>>>    
>>>>> -    s->harts = g_new0(RISCVCPU, s->num_harts);
>>>>> +    s->harts = g_new0(RISCVCPU *, s->num_harts);
>>>>>    
>>>>>        for (n = 0; n < s->num_harts; n++) {
>>>>> -        if (!riscv_hart_realize(s, n, s->cpu_type, errp)) {
>>>>> +        s->harts[n] = RISCV_CPU(object_new(s->cpu_type));
>>>>> +        if (!riscv_hart_realize(s, n, s->cpu_type, size,
>>>>> errp)) {
>>>>>                return;
>>>
>>> Not an issue with this patch but riscv_hart_realize() can use some
>>> review. I
>>> I think that we're doing stuff in the wrong place. Perhaps I'll
>>> look
>>> into it.
> 
> Shoudn't allocation and mhartid assignment happen earlier in
> instance_init() ?

Usually we use instance_init() to validate properties that the device will use later on
during realize(). We're not doing any validation ATM so we can live without instance_init().

What's out of place is the way we're doing with riscv_hart_realize(). For starters, we're
passing a RISCVCPUHartState to it because of resetvec while at the same time we're passing
cpu_type as a separate parameter, but both can be derived from RISCVCPUHartState. There's
also object_initialize_child() which is an initializer but is called under a function
named realize(), which is weird. Last but not the least we already have a realize() function
for each hart - it's riscv_cpu_realize(), from target/riscv/cpu.c, and we're calling it
via "qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);".

It seems to me that the code would be clearer if we get rid of riscv_hart_realize() and just
open code it in the body of riscv_harts_realize().


> 
>>>
>>>
>>>>>            }
>>>>>        }
>>>>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>>>>> index 35a335b8d0..b8a54db81b 100644
>>>>> --- a/hw/riscv/sifive_u.c
>>>>> +++ b/hw/riscv/sifive_u.c
>>>>> @@ -104,6 +104,7 @@ static void create_fdt(SiFiveUState *s,
>>>>> const
>>>>> MemMapEntry *memmap,
>>>>>        char *nodename;
>>>>>        uint32_t plic_phandle, prci_phandle, gpio_phandle,
>>>>> phandle =
>>>>> 1;
>>>>>        uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
>>>>> +    RISCVCPU *hart;
>>>>>        static const char * const ethclk_names[2] = { "pclk",
>>>>> "hclk"
>>>>> };
>>>>>        static const char * const clint_compat[2] = {
>>>>>            "sifive,clint0", "riscv,clint0"
>>>>> @@ -180,9 +181,11 @@ static void create_fdt(SiFiveUState *s,
>>>>> const
>>>>> MemMapEntry *memmap,
>>>>>                } else {
>>>>>                    qemu_fdt_setprop_string(fdt, nodename,
>>>>> "mmu-type", "riscv,sv48");
>>>>>                }
>>>>> -            isa = riscv_isa_string(&s->soc.u_cpus.harts[cpu -
>>>>> 1]);
>>>>> +            hart = riscv_array_get_hart(&s->soc.u_cpus, cpu -
>>>>> 1);
>>>>> +            isa = riscv_isa_string(hart);
>>>>>            } else {
>>>>> -            isa = riscv_isa_string(&s->soc.e_cpus.harts[0]);
>>>>> +            hart = riscv_array_get_hart(&s->soc.e_cpus, 0);
>>>>> +            isa = riscv_isa_string(hart);
>>>>>            }
>>>>>            qemu_fdt_setprop_string(fdt, nodename, "riscv,isa",
>>>>> isa);
>>>>>            qemu_fdt_setprop_string(fdt, nodename, "compatible",
>>>>> "riscv");
>>>>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>>>>> index 81f7e53aed..85b7568dad 100644
>>>>> --- a/hw/riscv/spike.c
>>>>> +++ b/hw/riscv/spike.c
>>>>> @@ -61,6 +61,7 @@ static void create_fdt(SpikeState *s, const
>>>>> MemMapEntry *memmap,
>>>>>        uint32_t cpu_phandle, intc_phandle, phandle = 1;
>>>>>        char *name, *mem_name, *clint_name, *clust_name;
>>>>>        char *core_name, *cpu_name, *intc_name;
>>>>> +    RISCVCPU *hart;
>>>>>        static const char * const clint_compat[2] = {
>>>>>            "sifive,clint0", "riscv,clint0"
>>>>>        };
>>>>> @@ -103,6 +104,7 @@ static void create_fdt(SpikeState *s, const
>>>>> MemMapEntry *memmap,
>>>>>            clint_cells =  g_new0(uint32_t, s-
>>>>>> soc[socket].num_harts
>>>>> * 4);
>>>>>    
>>>>>            for (cpu = s->soc[socket].num_harts - 1; cpu >= 0;
>>>>> cpu--)
>>>>> {
>>>>> +            hart = riscv_array_get_hart(&s->soc[socket], cpu);
>>>>>                cpu_phandle = phandle++;
>>>>>    
>>>>>                cpu_name = g_strdup_printf("/cpus/cpu@%d",
>>>>> @@ -113,7 +115,7 @@ static void create_fdt(SpikeState *s, const
>>>>> MemMapEntry *memmap,
>>>>>                } else {
>>>>>                    qemu_fdt_setprop_string(fdt, cpu_name,
>>>>> "mmu-type", "riscv,sv48");
>>>>>                }
>>>>> -            name = riscv_isa_string(&s-
>>>>>> soc[socket].harts[cpu]);
>>>>> +            name = riscv_isa_string(hart);
>>>>>                qemu_fdt_setprop_string(fdt, cpu_name,
>>>>> "riscv,isa",
>>>>> name);
>>>>>                g_free(name);
>>>>>                qemu_fdt_setprop_string(fdt, cpu_name,
>>>>> "compatible",
>>>>> "riscv");
>>>>> diff --git a/hw/riscv/virt-acpi-build.c
>>>>> b/hw/riscv/virt-acpi-build.c
>>>>> index 7331248f59..7cff4e4baf 100644
>>>>> --- a/hw/riscv/virt-acpi-build.c
>>>>> +++ b/hw/riscv/virt-acpi-build.c
>>>>> @@ -158,7 +158,7 @@ static void build_rhct(GArray *table_data,
>>>>>        isa_offset = table_data->len - table.table_offset;
>>>>>        build_append_int_noprefix(table_data, 0, 2);   /* Type 0
>>>>> */
>>>>>    
>>>>> -    cpu = &s->soc[0].harts[0];
>>>>> +    cpu = riscv_array_get_hart(&s->soc[0], 0);
>>>>>        isa = riscv_isa_string(cpu);
>>>>>        len = 8 + strlen(isa) + 1;
>>>>>        aligned_len = (len % 2) ? (len + 1) : len;
>>>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>>>> index d90286dc46..59b42cc5e4 100644
>>>>> --- a/hw/riscv/virt.c
>>>>> +++ b/hw/riscv/virt.c
>>>>> @@ -236,7 +236,7 @@ static void
>>>>> create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>>>>>        uint8_t satp_mode_max;
>>>>>    
>>>>>        for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--)
>>>>> {
>>>>> -        RISCVCPU *cpu_ptr = &s->soc[socket].harts[cpu];
>>>>> +        RISCVCPU *cpu_ptr = riscv_array_get_hart(&s-
>>>>>> soc[socket],
>>>>> cpu);
>>>>>    
>>>>>            cpu_phandle = (*phandle)++;
>>>>>    
>>>>> @@ -730,12 +730,12 @@ static void create_fdt_pmu(RISCVVirtState
>>>>> *s)
>>>>>    {
>>>>>        char *pmu_name;
>>>>>        MachineState *ms = MACHINE(s);
>>>>> -    RISCVCPU hart = s->soc[0].harts[0];
>>>>> +    RISCVCPU *hart = riscv_array_get_hart(&s->soc[0], 0);
>>>>>    
>>>>>        pmu_name = g_strdup_printf("/soc/pmu");
>>>>>        qemu_fdt_add_subnode(ms->fdt, pmu_name);
>>>>>        qemu_fdt_setprop_string(ms->fdt, pmu_name, "compatible",
>>>>> "riscv,pmu");
>>>>> -    riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.pmu_num,
>>>>> pmu_name);
>>>>> +    riscv_pmu_generate_fdt_node(ms->fdt, hart->cfg.pmu_num,
>>>>> pmu_name);
>>>>>    
>>>>>        g_free(pmu_name);
>>>>>    }
>>>>> diff --git a/include/hw/riscv/riscv_hart.h
>>>>> b/include/hw/riscv/riscv_hart.h
>>>>> index bbc21cdc9a..a5393c361b 100644
>>>>> --- a/include/hw/riscv/riscv_hart.h
>>>>> +++ b/include/hw/riscv/riscv_hart.h
>>>>> @@ -38,7 +38,23 @@ struct RISCVHartArrayState {
>>>>>        uint32_t hartid_base;
>>>>>        char *cpu_type;
>>>>>        uint64_t resetvec;
>>>>> -    RISCVCPU *harts;
>>>>> +    RISCVCPU **harts;
>>>>>    };
>>>>>    
>>>>> +/**
>>>>> + * riscv_array_get_hart:
>>>>> + */
>>>>> +static inline RISCVCPU
>>>>> *riscv_array_get_hart(RISCVHartArrayState
>>>>> *harts, int i)
>>>>> +{
>>>>> +    return harts->harts[i];
>>>>> +}
>>>
>>> I don't see too much gain in this API because you'll still need a
> 
> 
> Indeed the API itself looks the same annoying, but the goal was
> allowing instance overload, the most horrifying part is adding props to
> cpu currently.
> 
>>> RISCVHartArrayState
>>> instance anyways, which is the most annoying part. E.g:
> 
> Do you think getting rid of RISCVHartArrayState might be a good idea ?
> 
> Currently only microchip_pfsoc and sifive_u use a pair of
> RISCVHartArrayState for separate cpu_types.
> 

Not necessarily get rid of it but it would be good to re-evaluate its usage. In the example you
just mentioned it I'm not sure if we need different array states for different CPU types, but
this would need to be verified on a board to board basis.


Thanks,


Daniel


>>>
>>>>> -    cpu = &s->soc[0].harts[0];
>>>>> +    cpu = riscv_array_get_hart(&s->soc[0], 0);
>>>
>>>
>>>
>>>>> +
>>>>> +/**
>>>>> + * riscv_array_get_num_harts:
>>>>> + */
>>>>> +static inline unsigned
>>>>> riscv_array_get_num_harts(RISCVHartArrayState *harts)
>>>>> +{
>>>>> +    return harts->num_harts;
>>>>> +}
>>>
>>> Same with this API, which you didn't end up using in this patch.
>>> Thanks,
>>>
>>>
>>> Daniel
>>>
>>>>> +
>>>>>    #endif
> 
> 

