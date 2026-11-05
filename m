Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4BE606A31B
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L6p5+31i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NEYCESXN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOt9b-0001IR-0u; Thu, 05 Nov 2026 03:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xOt9Z-0001IB-56
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 03:49:01 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xOt9X-0002fw-1e
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 03:49:00 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A56UcA73624953
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 08:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wjJ85LgyeqsJ8KDinz12ucUbYjwUnfQ/a7Y/maLZRrU=; b=L6p5+31iWBYxlSZV
 Exybqhv+aeWjwGyRcwrgz1BDveXUmTJS9sU4L1CH0DZ653lLj5y4/wOQISVCu0V6
 kSXEOgeVV7dsSDzRAUEkaK55JEjn5GZ7crIgonxIICEFCw0JCX5mBRq3X7t7hKno
 0xEtrkv8rsq7fMrS+Dz07bIEgpDmIsx+qX8nszJm+zLms+2/L8GdNpmJqBj22pkz
 6tHaUQEEKs3lur9bfqSyjiRy0kde9hglKShFjWpVpBRZ59xKWQILd9S1tjiiEp56
 v2lYos4juVRnHpBSVhBcBY/wLld9sy+Q9h/8Wqtgy3+/9d/+BW1dWO0XmhyocYaT
 Jahslg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br431c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 08:48:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-534f3fe0236so33542101cf.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 00:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793868534; x=1794473334; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wjJ85LgyeqsJ8KDinz12ucUbYjwUnfQ/a7Y/maLZRrU=;
 b=NEYCESXNRNBq2N8tIyJYBcuseO0qc78dPK20ihdF5h7r8pWY2nFpgbgSVoQ+FdUAX0
 Nh2lMgCrVzghWmCYBnPDovTY7HJ0Y4204bGa4W6wD9clSb7T4XhgEWp0wpn7T8yrV+4M
 sAUOdO2qaZpnSlGQzIEC3qydlSU4nk7a0vRVtSXP8JUnNFOUAUp9bne+WWcQq1/DBy/m
 4e37PDvTeVvAmDrN0ixzengpInMbjHCxXRxeKyl6W5EvvpvJGOhPf4iH/0JQJiITevsi
 nvnxQapjdvwCsDOheYjueGCIVu8o26ERcRDXkHfoFyTlHyqCdEWOgkibvF89ownxYFSQ
 TZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793868534; x=1794473334;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wjJ85LgyeqsJ8KDinz12ucUbYjwUnfQ/a7Y/maLZRrU=;
 b=vn2AwVLum3Lwz6sojyNAQ5Xj2vjEytbyMDGVvQyc0iyi8KvfszolbQqUBHVDIaJEnl
 StlVm1SAXVovmw0GOKEieuEhw+sMnsQWwCmoLhE2xiw/2DFESqHwSCT+sQsxli3EHjt6
 oS+DLlpHXu3Cn0gWWiCLuVa0+u5oR27ExiGWPSsdEkKQQu8j3MDyqXonDnPeo55NdE4I
 Efjib+xiNb9kOdUy3WrW6AIQnCsyaVLcIQYCEboPuVvV6zTMpMNbfAIqT746uumSBBOX
 TZlTkaiJxHjN/BHHkFRiveqwYG8B4IQamSeEj4ILdITF+RAlOyibTBQTgfqI5whzzYCL
 eNXA==
X-Gm-Message-State: APuU4Z+Gj5+mhH8+AtfBOKyYbfr/y0tPq5B3DARDbgWLw5IWSV8/FlSZ
 5d1bCRiQToewwZcSvMyganuRi3CRefq7vEbOuLWddwPFtvs3Q5yaYrdY7e4eP7meur97n2sN5Bz
 IByu1HAMaUIXdUwexssU/jZfYws6hnovZ4LUztWGzIXIp/jrSargNHrNCYQ==
X-Gm-Gg: AYBFou3NoLxFtctOtMZcYf1saQG+228ieTzsLtfHqSMia3xKBGK2eYfV6+0fNf2P8WH
 mbm8ZQalUm5p4cZmDCqAGyf2N4miGwogFjVduipxxvSWh65SkXuB2SmfR6ZjF20Nek1YcY9+pDR
 Xyr8Hx6wV5LEnKOp3ACoHNh5k75oo1hTvqPmRyLgRKZhlANkN0iYQuG+elFUrXpAamEwRZ3/jIA
 9BbsTBzpCXsFLWq6xxdnexusSVsW9C8PEgW6MpXlChK+3tKYyuul4nMS8Ivh4TypHw9XH2gsu5I
 PnQrGEBQTy2tkKPEdGU6tPzA9a6n9AmRRZmR5gCeEk5ehgTmIT5hsVd1TWpftuogewuJjzLprW4
 bfYc4VQaaAoC2m77UKsu63bxB4BFQpBX0JihtRPb0aYjnRqexM0772gsiF5MTHeQKfqgc9USVeT
 oWVqqTctpO
X-Received: by 2002:ac8:5d46:0:b0:537:5488:a6ea with SMTP id
 d75a77b69052e-542b7334c27mr330106431cf.46.1793868534202; 
 Thu, 05 Nov 2026 00:48:54 -0800 (PST)
X-Received: by 2002:ac8:5d46:0:b0:537:5488:a6ea with SMTP id
 d75a77b69052e-542b7334c27mr330106241cf.46.1793868533643; 
 Thu, 05 Nov 2026 00:48:53 -0800 (PST)
Received: from [192.168.68.102] ([152.234.122.253])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-54b10a6ca24sm47434901cf.14.2026.11.05.00.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:48:52 -0800 (PST)
Message-ID: <c5eb34c2-dfd4-49aa-96d0-9ac162d13204@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 05:48:48 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] hw/riscv: do not realize the device in
 riscv_create_iommu_sys()
To: Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "chao.liu@processmission.com" <chao.liu@processmission.com>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>,
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>
References: <20261023160913.24992-1-daniel.barboza@oss.qualcomm.com>
 <20261023160913.24992-2-daniel.barboza@oss.qualcomm.com>
 <3bdd1bbf2a30ce25c4019b0ac4f3f6ab95058715.camel@wdc.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3bdd1bbf2a30ce25c4019b0ac4f3f6ab95058715.camel@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfXxR6TsAmGp3Ya
 Yqx105C+xveoOZ73hOdfWQ5ZGzO0hk9l+8cQCOP9bIqMurtkIFGnF1T5yOV3EeC4G7yQB5KJ1ox
 qxrtv2gNDOzABv/2y2+oqRr0R8zszgdX6kQaM/5Z617JfewkGmpGBTJdMMp0RiqxYfe1rOLU0fN
 zv45981CTB1eQABRWuDCnGFJMYOPrnWAE2KKXTyAKBuSRUAOsHaYJ/+D05dHupQUxfBtJSgBk6Q
 eQBXX4qeY7MQQeqiasOCASBmlV5W5cpsL7yAieZiSHsJub9p2nuS508Hf/xqIV+iM5TFiMyGqGE
 oRswLI5+hF3skuS2HKLdE3G9T8+NLiGvjAcmWaOVxC2Zf9ejQ1AZRNgK8mpsp/+GlKwpwf4h+tr
 sgFKZEInp7tcWcjJ3UdYXAoQdPOsnnoDIQce8I+0LpL5T3PMHHMo/YJfjNajRg4ixKqS3SR8YDi
 JIaW54p+Lhqo6USP0Og==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX3qoxibHHfM5Y
 DHBug8ZgQMUX/PkAGvT5ZEcsk3ruqPtgJN9tqdiEdqv734fZDts3fD1D42yuDIkBIXjTOuNLAZO
 /1s3yobU3lSTkJj26bgL0yC9o/MQq58=
X-Proofpoint-GUID: xP1lCeOAtJM-KvOdFqsNVkUbVC11Prxf
X-Proofpoint-ORIG-GUID: xP1lCeOAtJM-KvOdFqsNVkUbVC11Prxf
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aec42f7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=LQvE5zGBNe+6ot3hfEwogQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hPZfh_vYXEPJFLOR3nUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050034
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/5/2026 1:58 AM, Alistair Francis wrote:
> On Fri, 2026-10-23 at 13:09 -0300, Daniel Henrique Barboza wrote:
>> The riscv-iommu-sys device inherits all properties from its
>> associated
>> riscv-iommu device via qdev_alias_all_properties() during sys_init().
>>
>> We're also providing riscv_create_iommu_sys(), a helper to
>> instantiate
>> the device and avoid duplicating code between boards.  In its current
>> state the helper is realizing the device before returning it to the
>> caller, prevents any additional setup of the device (we can't change
>> device props after realize).
>>
>> Split the realization code from the helper and make the boards
>> realize
>> the device manually.  It's a small inconvenience to pay to be able to
>> config the iommu-sys device.
>>
>> Signed-off-by: Daniel Henrique Barboza
>> <daniel.barboza@oss.qualcomm.com>
>> ---
>>   hw/riscv/riscv-iommu-sys.c     | 3 +--
>>   hw/riscv/server_platform_ref.c | 7 +++++--
>>   hw/riscv/virt.c                | 9 +++++++--
>>   3 files changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/riscv/riscv-iommu-sys.c b/hw/riscv/riscv-iommu-sys.c
>> index 258c171efd..190ab0b646 100644
>> --- a/hw/riscv/riscv-iommu-sys.c
>> +++ b/hw/riscv/riscv-iommu-sys.c
>> @@ -217,6 +217,7 @@ static void riscv_iommu_sys_init(Object *obj)
>>       riscv_iommu_set_cap_igs(iommu, RISCV_IOMMU_CAP_IGS_BOTH);
>>   }
>>   
>> +/* Note: the returned iommu_sys device needs to be realized.  */
> 
> Is this really necessary just to set hpm-counters?
> 
> It seems like this is a bit brittle for one property

If we want to just set 'hpm_counters' we can add a parameter in riscv_create_iommu_sys()
and be done with it.  In case we have the need to set other things in the future we can
add additional parameters, even an 'IOMMUProps' struct like we do with the FDT stuff.

Or we can do what we're doing here and let the board set whatever they want by splitting
init() and realize() of the device.  Both are fine to me.


Thanks,
Daniel

> 
> Alistair
> 
>>   DeviceState *riscv_create_iommu_sys(DeviceState *mmio_irqchip,
>>                                       hwaddr addr, int base_irq,
>>                                       bool is_32_bit)
>> @@ -237,8 +238,6 @@ DeviceState *riscv_create_iommu_sys(DeviceState
>> *mmio_irqchip,
>>                                is_32_bit ? 34 : 56,
>>                                &error_fatal);
>>   
>> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu_sys),
>> &error_fatal);
>> -
>>       return iommu_sys;
>>   }
>>   
>> diff --git a/hw/riscv/server_platform_ref.c
>> b/hw/riscv/server_platform_ref.c
>> index 5f485b1c79..e9536515da 100644
>> --- a/hw/riscv/server_platform_ref.c
>> +++ b/hw/riscv/server_platform_ref.c
>> @@ -481,6 +481,7 @@ static void
>> rvserver_ref_machine_init(MachineState *machine)
>>       MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>>       MemoryRegion *reset_syscon_io = g_new(MemoryRegion, 1);
>>       DeviceState *mmio_irqchip, *pcie_irqchip;
>> +    DeviceState *iommu_sys;
>>       int i, base_hartid, hart_count;
>>       int socket_count = riscv_socket_count(machine);
>>       int imsic_bits;
>> @@ -635,8 +636,10 @@ static void
>> rvserver_ref_machine_init(MachineState *machine)
>>           create_fdt(s, memmap);
>>       }
>>   
>> -    riscv_create_iommu_sys(mmio_irqchip, s-
>>> memmap[RVSERVER_IOMMU_SYS].base,
>> -                           IOMMU_SYS_IRQ, false);
>> +    iommu_sys = riscv_create_iommu_sys(mmio_irqchip,
>> +                                       s-
>>> memmap[RVSERVER_IOMMU_SYS].base,
>> +                                       IOMMU_SYS_IRQ, false);
>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu_sys),
>> &error_fatal);
>>   
>>       s->machine_done.notify = rvserver_ref_machine_done;
>>       qemu_add_machine_init_done_notifier(&s->machine_done);
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index d4b501802f..39381cb21d 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -940,8 +940,13 @@ static void virt_machine_init(MachineState
>> *machine)
>>       }
>>   
>>       if (virt_is_iommu_sys_enabled(s)) {
>> -        riscv_create_iommu_sys(mmio_irqchip, s-
>>> memmap[VIRT_IOMMU_SYS].base,
>> -                               IOMMU_SYS_IRQ, riscv_is_32bit(&s-
>>> soc[0]));
>> +        DeviceState *iommu_sys;
>> +
>> +        iommu_sys = riscv_create_iommu_sys(mmio_irqchip,
>> +                                           s-
>>> memmap[VIRT_IOMMU_SYS].base,
>> +                                           IOMMU_SYS_IRQ,
>> +                                           riscv_is_32bit(&s-
>>> soc[0]));
>> +        sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu_sys),
>> &error_fatal);
>>       }
>>   
>>       s->machine_done.notify = virt_machine_done;


