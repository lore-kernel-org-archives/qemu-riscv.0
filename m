Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3B7C61DB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 11:48:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzYaS-0002QF-Jr; Thu, 27 Aug 2026 07:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzYaQ-0002Pc-Th
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:48:02 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzYaN-0002l8-Ms
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:48:02 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R9HjQJ3643614
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 11:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HDk+XIK2HdVYOwQgV4MTKp+dfnJDvwIAvMZmzSlt9Ac=; b=LSIUFDJAiHEN6DQa
 nSUOQKg+OlC6/v02caRFb5V3RfmJuLydt8csbRudsMqxiPWVHPMBy43E+3mWe+S+
 MbtwBqfkpqlgUNU9r6YIu2Q02OKllRCtQHNcNed32dDNXLoM7mDh4uqik/b38Xig
 N8ogxjcoFdNwuq3OzMv2emfntSwif/v/lU5e1G7R7nvalxVv0HclhQriARrgaagY
 zT5mryyapfPXHiMbXwP2fWgLUyKVqvB3wVJIv5xPmiKl14X/O68DroO9Vl+him3Z
 5UuXG7xrp2S/cIUXs3Fl+FF9hncAt3+f9FbE8XJi38+fiUvx+u22vlZRKNzER/fS
 JPliuQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4ecbhpb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 11:47:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-90c8da50f4fso18383336d6.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 04:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787831276; x=1788436076; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HDk+XIK2HdVYOwQgV4MTKp+dfnJDvwIAvMZmzSlt9Ac=;
 b=DoHFf6+7GQI/AE0Zd4kx+P85XGgd9FIETKJEwKCKc6yO2qEImJ8nvYR8pRza/aeQYr
 CE6bnbJz/DMqmCI4dpo0nP7oBm2mcnnhyXHPk27HFUOzFMhmR5DyMDOlXLcfkaDbwirA
 7fWxYqEPwaaMrUQClvdIeAIc/RQUv2sSTb2wwjT8jc/z7ZiSeG+xfdsYM6g8nk7hE/Mr
 udh13z4jALasTECFHgocskAW3Kv2sCHPMs+r7I5qbFSOtYFcAFQ6MuKz8nz3WbOS+fiz
 usgGEp0SDLZby92FADZxvhUfrRL6WQY5izVoiKin2JKrkxvPQUZQ+Lh7n/Z1RwlzzkJa
 yCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787831276; x=1788436076;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HDk+XIK2HdVYOwQgV4MTKp+dfnJDvwIAvMZmzSlt9Ac=;
 b=RwTHwh6B/To1LtJvvZwk2wxhskKpaIep2ojio52HXq9ugFG/3MZFcZT6RpgQjzGHVX
 gbqUGMJu9G8HamHAyclp/l1yhXOW+muo+ES93yXRyi2LTmwJBA+c93nbaza3rwJJwAcW
 +prVRyJ+OPkyKlO87Rf/8uzTzyV1YTYQC6AQ15rbW2y7kPI33DIAzeV3+rNDyri2Dm++
 Ycgd9qC4+adArUCvpWw6chS1JAXL8MVpXpmLLM317y7Oq2fpG1Miqv7KIVnfwi1FeIs7
 N4MsmUqU4A8M6BWc2KVuqpL2/k7SEMloHqTMTJbU5iQwsAPk7Q6H7pHcTIBJxCkYP9ZG
 +jeA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqSII0B47gH28CZFiJCEwe5IK9/Rv9eON8yuSfDW0BFE/GYOGC7vK0Jm4GF3IETCzGTtLndybzJrzc9@nongnu.org
X-Gm-Message-State: AFuF++kcDWey3N5X+YVjUs5wxJrwICQTgZVqNyY3/RtJcUVIDS0W1PWw
 6tAEjq1cdrWj3Zu/d69v1BXfklqkJR4GBdzC02Rc68MWVMoz5pMg2QkNF/6u4d1H2CFc3Tto8xa
 gMbq7VUztFj75MLaSZZvTTFb6taklrsiziaWVubBW40rtY268YIixy9fnLg==
X-Gm-Gg: AR+sD13zy1ufzeuQU47rF+Rzh5IAMfZznJ0LGulcoonnYb+MjtKucGF1WA0UUP1N2yC
 NEiDCFNYFksqrDnCAAJCcsSN1ZSjArFoUgoVDaq4kM56RjZYQXIDmqxRTQgl4HM3aRgMBJ9JVLh
 jMlKHbdhZmKuKeNUMf2RGQYAqVFNWzDU4VBVzyDpj8LH8T45KFlmqTDF3pdJsG40bVZU7prPaK4
 dEOnFFYmx0LUiSkoeB50PoAx6EpJd72TZlyznJQHbfaxWfJ1sE5VCEpsm2Ts3bozOSgwGwV70L3
 bt1R3lt5TzPpQN6cWz+ovhExQmCvDegyHz5YwjI6/rydXL7wue13n+BDyNjptADaiai7il4VREZ
 VJaToJFK4F2SVN52RLCITnS6xsogbMaHX4PTi
X-Received: by 2002:a05:6214:20aa:b0:907:52e3:1c63 with SMTP id
 6a1803df08f44-90cc78eb5e4mr147151586d6.20.1787831276304; 
 Thu, 27 Aug 2026 04:47:56 -0700 (PDT)
X-Received: by 2002:a05:6214:20aa:b0:907:52e3:1c63 with SMTP id
 6a1803df08f44-90cc78eb5e4mr147151056d6.20.1787831275828; 
 Thu, 27 Aug 2026 04:47:55 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cd73fc984sm14752106d6.39.2026.08.27.04.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 04:47:55 -0700 (PDT)
Message-ID: <86984aeb-a2d7-4640-bbec-ed510174df34@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 08:47:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] hw/riscv/atlantis: Rework device tree creation
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260826220528.54516-1-joel@jms.id.au>
 <20260826221154.54577-1-joel@jms.id.au>
 <20260826221154.54577-2-joel@jms.id.au>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826221154.54577-2-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KIBqylFo c=1 sm=1 tr=0 ts=6a9023ed cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XQfE3cC_Y_RKJagnLmUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: lZ32mOjyLkDANe4Dxspwe8ZS6NsUJ5fU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5OCBTYWx0ZWRfX2Jgdbaksnq3c
 UxcIu64AMkqoPy2UyBJJmTBCiYqqJ2xAwrCpfiRTsvrYL5bR/Wtil+m5F3ag9yWwQEHgYANtEWe
 wdBfBOaZ3IPyFc38AwMeucDHph6quMoMFHNVQqtjcPU+XYWbffwxJSVKbXb0ccWWgdhM9J/7Vnz
 YlzLgJGRnH+ionAg6XFA1mtpmLsJGXRxAmHUGnHdJMjBckNl4XWIbDDmFzbgQcO3X9j2SSzpsm0
 lhzS8NuVtraT9W9wLc42libdjSGWX9E2b7ymsuq2KBsh7IscsFS7N5rCDC4Q2+y5WLGcNeF8vfm
 yLxhJVDIP/w0DWIf5IAq/NH2a3Q2TTOu+NkIqkkGkZHvk4CWgwpG+9NQN9ClyTPTuqwSNq70EJb
 807nmc8bFqvX2/GUvq7jhYJRAeFTJIJMSZg3Orf5Tq3Yit857KGCOc5gFJGBE2T6S0mTM/FJ6wO
 S6YK2BTLS0PP/mISaJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5OCBTYWx0ZWRfX3+VXf4t8ckbK
 yTbjVP08B1T29Va2XRHUKhUNJB6IPMv9UMQy2etnB77Ict2n6nGsSC/1UUn3oQeqKt0/chWF/zG
 DjN1090X1s6JOSXM9ILMmWUDBygGrqQ=
X-Proofpoint-GUID: lZ32mOjyLkDANe4Dxspwe8ZS6NsUJ5fU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270098
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 8/26/2026 7:11 PM, Joel Stanley wrote:
> Remove the direct use of MachineState from the device tree creation to
> allow separation between the SoC (TTAtlantisState) and the QEMU
> MachineState.
> 
> Fix this for the device tree pointer by passing it directly to the
> functions that use it, instead of casting the TTAtlantisState to a
> MachineState.
> 
> MachineState::smp.cpus is replaced with TTAtlantisState::cpus.num_harts,
> as these are equivalent after tt_atlantis_machine_init.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/tt_atlantis.c | 51 +++++++++++++++++++-----------------------
>   1 file changed, 23 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> index 35b3be072a06..c471c7cebf12 100644
> --- a/hw/riscv/tt_atlantis.c
> +++ b/hw/riscv/tt_atlantis.c
> @@ -80,9 +80,8 @@ static uint32_t next_phandle(void)
>       return fdt_phandle++;
>   }
>   
> -static void create_fdt_memory(TTAtlantisState *s)
> +static void create_fdt_memory(void *fdt, TTAtlantisState *s)
>   {
> -    void *fdt = MACHINE(s)->fdt;
>       hwaddr size_lo = MACHINE(s)->ram_size;
>       hwaddr size_hi = 0;
>   
> @@ -104,9 +103,9 @@ static void create_fdt_memory(TTAtlantisState *s)
>       }
>   }
>   
> -static void create_fdt_aclint(TTAtlantisState *s, uint32_t *intc_phandles)
> +static void create_fdt_aclint(void *fdt, TTAtlantisState *s,
> +                              uint32_t *intc_phandles)
>   {
> -    void *fdt = MACHINE(s)->fdt;
>       g_autofree char *name = NULL;
>       g_autofree uint32_t *aclint_mtimer_cells = NULL;
>       uint32_t aclint_cells_size;
> @@ -206,10 +205,9 @@ static void create_fdt_one_aplic(void *fdt,
>       qemu_fdt_setprop_cell(fdt, name, "phandle", aplic_phandle);
>   }
>   
> -static void create_fdt_pmu(TTAtlantisState *s)
> +static void create_fdt_pmu(void *fdt, TTAtlantisState *s)
>   {
>       char pmu_name[] = "/pmu";
> -    void *fdt = MACHINE(s)->fdt;
>       RISCVCPU *hart = &s->cpus.harts[0];
>   
>       qemu_fdt_add_subnode(fdt, pmu_name);
> @@ -217,32 +215,29 @@ static void create_fdt_pmu(TTAtlantisState *s)
>       riscv_pmu_generate_fdt_node(fdt, hart->pmu_avail_ctrs, pmu_name);
>   }
>   
> -static void create_fdt_cpu(TTAtlantisState *s, const MemMapEntry *memmap,
> +static void create_fdt_cpu(void *fdt, TTAtlantisState *s,
>                              uint32_t aplic_s_phandle,
>                              uint32_t imsic_s_phandle)
>   {
> -    MachineState *ms = MACHINE(s);
> -    void *fdt = MACHINE(s)->fdt;
> -    g_autofree uint32_t *intc_phandles = g_new0(uint32_t, ms->smp.cpus);
> +    g_autofree uint32_t *intc_phandles = g_new0(uint32_t, s->cpus.num_harts);
> +    int num_harts = s->cpus.num_harts;
>   
>       fdt_create_cpu_socket_subnode(fdt, TT_ACLINT_TIMEBASE_FREQ);
>   
> -    create_fdt_socket_cpus(fdt, s->cpus.harts, 0, s->cpus.num_harts,
> +    create_fdt_socket_cpus(fdt, s->cpus.harts, 0, num_harts,
>                              s->cpus.hartid_base, &fdt_phandle, intc_phandles,
>                              false, false);
>   
> -    create_fdt_memory(s);
> -
> -    create_fdt_aclint(s, intc_phandles);
> +    create_fdt_aclint(fdt, s, intc_phandles);
>   
>       /* M-level IMSIC node */
>       uint32_t msi_m_phandle = next_phandle();
> -    create_fdt_one_imsic(fdt, &s->memmap[TT_ATL_MIMSIC], ms->smp.cpus,
> +    create_fdt_one_imsic(fdt, &s->memmap[TT_ATL_MIMSIC], num_harts,
>                            intc_phandles, msi_m_phandle,
>                            IRQ_M_EXT, TT_IMSIC_GUEST_BITS);
>   
>       /* S-level IMSIC node */
> -    create_fdt_one_imsic(fdt, &s->memmap[TT_ATL_SIMSIC], ms->smp.cpus,
> +    create_fdt_one_imsic(fdt, &s->memmap[TT_ATL_SIMSIC], num_harts,
>                            intc_phandles, imsic_s_phandle,
>                            IRQ_S_EXT, TT_IMSIC_GUEST_BITS);
>   
> @@ -252,13 +247,13 @@ static void create_fdt_cpu(TTAtlantisState *s, const MemMapEntry *memmap,
>       create_fdt_one_aplic(fdt, &s->memmap[TT_ATL_MAPLIC],
>                            msi_m_phandle, intc_phandles,
>                            aplic_m_phandle, aplic_s_phandle,
> -                         IRQ_M_EXT, s->cpus.num_harts);
> +                         IRQ_M_EXT, num_harts);
>   
>       /* S-level APLIC node */
>       create_fdt_one_aplic(fdt, &s->memmap[TT_ATL_SAPLIC],
>                            imsic_s_phandle, intc_phandles,
>                            aplic_s_phandle, 0,
> -                         IRQ_S_EXT, s->cpus.num_harts);
> +                         IRQ_S_EXT, num_harts);
>   }
>   
>   static void create_fdt_uart(void *fdt, const MemMapEntry *mem, int irq,
> @@ -317,10 +312,9 @@ static void create_fdt_i2c(void *fdt, const MemMapEntry *mem, uint32_t irq,
>       qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0);
>   }
>   
> -static void create_fdt_i2c_device(TTAtlantisState *s, int bus,
> +static void create_fdt_i2c_device(void *fdt, TTAtlantisState *s, int bus,
>                                     const char *compat, int addr)
>   {
> -    void *fdt = MACHINE(s)->fdt;
>       hwaddr base = s->memmap[TT_ATL_I2C0 + bus].base;
>       g_autofree char *name = g_strdup_printf("/soc/i2c@%"HWADDR_PRIX"/sensor@%x",
>                                               base, addr);
> @@ -330,14 +324,15 @@ static void create_fdt_i2c_device(TTAtlantisState *s, int bus,
>       qemu_fdt_setprop_cell(fdt, name, "reg", addr);
>   }
>   
> -static void finalize_fdt(TTAtlantisState *s)
> +static void finalize_fdt(void *fdt, TTAtlantisState *s)
>   {
>       uint32_t aplic_s_phandle = next_phandle();
>       uint32_t imsic_s_phandle = next_phandle();
>       uint32_t periph_clk_phandle = next_phandle();
> -    void *fdt = MACHINE(s)->fdt;
>   
> -    create_fdt_cpu(s, s->memmap, aplic_s_phandle, imsic_s_phandle);
> +    create_fdt_cpu(fdt, s, aplic_s_phandle, imsic_s_phandle);
> +
> +    create_fdt_memory(fdt, s);
>   
>       /*
>        * We want to do this, but the Linux aplic driver was broken before v6.16
> @@ -359,8 +354,8 @@ static void finalize_fdt(TTAtlantisState *s)
>       }
>   
>       /* I2C peripherals: qemu specific */
> -    create_fdt_i2c_device(s, 0, "dallas,ds1338", 0x6f);
> -    create_fdt_i2c_device(s, 4, "ti,tmp105", 0x48);
> +    create_fdt_i2c_device(fdt, s, 0, "dallas,ds1338", 0x6f);
> +    create_fdt_i2c_device(fdt, s, 4, "ti,tmp105", 0x48);
>   }
>   
>   static void create_fdt(TTAtlantisState *s)
> @@ -377,7 +372,7 @@ static void create_fdt(TTAtlantisState *s)
>   
>       qemu_fdt_add_subnode(ms->fdt, "/aliases");
>   
> -    create_fdt_pmu(s);
> +    create_fdt_pmu(ms->fdt, s);
>   }
>   
>   static void load_fdt(TTAtlantisState *s)
> @@ -408,7 +403,7 @@ static void load_fdt(TTAtlantisState *s)
>           g_strfreev(node_path);
>       }
>   
> -    create_fdt_memory(s);
> +    create_fdt_memory(ms->fdt, s);
>   }
>   
>   static void mmio_map_unimplemented(MemoryRegion *memory, SysBusDevice *dev,
> @@ -439,7 +434,7 @@ static void tt_atlantis_machine_done(Notifier *notifier, void *data)
>        * dynamic sysbus devices. Our FDT needs to be finalized.
>        */
>       if (machine->dtb == NULL) {
> -        finalize_fdt(s);
> +        finalize_fdt(machine->fdt, s);
>       }
>   
>       mem_size = machine->ram_size;


