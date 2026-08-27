Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3EFC61DB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 11:49:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzYbL-0002rO-Uk; Thu, 27 Aug 2026 07:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzYbK-0002qZ-GE
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:48:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzYbI-0002vq-NF
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:48:58 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RBUhnm3293578
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 11:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +2q8mqyy7nE8qe/hYW3htXuUCBRyV5gYP1oqhE7pMWU=; b=e8/NDXc807MkAgGf
 g0bu/RqYryifpjienYxQb8Y4MolnFhCPVI/HCrs/iJxDfPTT/4QKOaDSSkYEoNy3
 /r9Ybwo8GSFNdGjSBDZnIBk0xq/+9dIEMaCvCJaqjpOvx6P9MB9DO7TKCyC3D8ny
 HnznD/bhz4Sx86DK8k/ufgzFljNrdl04f7o106EW/fB3zSCrGAwMVnocY9u3iaUd
 DHoR9F6PYeBll8PAzASPOO3lR9hbV58XCi7CbAjCQhS1ISgyXoLR+OF2/EWH2Sz7
 ikvYNj+nX0BrFCTNIoVcqI1UALlGU/sntB8Oj1hGU8hwdQyT3vLRhnRkS0C5U9rC
 J22eGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7r1w5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 11:48:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e538afe65so79184485a.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 04:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787831334; x=1788436134; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+2q8mqyy7nE8qe/hYW3htXuUCBRyV5gYP1oqhE7pMWU=;
 b=SqpEE9vnM4gglnYBv7YbqQ/tfIcB8Lf+0cz0yFljDj6lyvo4e+4jc/xcmh/qIl3jRd
 CH7DYWLACMT0tjg1UmtZK2RVb2kohDr6BbgC6NSx0sSD2SL1FMxoG7O9Qy9y9LTQKSwa
 SwMmYOGaHBUZ1y5Ctev4FwoutXNvKiNIOCKhQx1geLFcc2CvWtpQ2tU/87kVxzn77MAF
 VhVQNf/ZHA0+DMZr1ecMtpg0hrMHpgLXcgYNzHIkpbtd0+uXTcevc1JGJp+S0nUZ6yF6
 GQyFFYmNnHEVdNQPPfZcghSSA9hQwMFoUg9tsZuwDHR22mvsP1ZvHUSOGSOte2dm+Zsu
 9LQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787831334; x=1788436134;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+2q8mqyy7nE8qe/hYW3htXuUCBRyV5gYP1oqhE7pMWU=;
 b=p7JxAm/A135Iz5pMt9cOZX5nAUzPPeceT7/y9sFjgqgZfs6ntTYYUxjCp0V2tQften
 RPpdqz4spiDDtv++bNVDMBmiCld6B9RL+xYiXnzf/2ajN/b+2akJcQGQ4hrMYs8W+04W
 oz5bBD6wO8ph94XpB5cwLhIyUVP3tRPQ9q81a0IKVFKno65UUsGJDUeL5ks/2ZZbimDa
 AJwH4vHFKJy81ZF7Ixyu4bALWikxGntkYs88KnFKsVJS40xITfT5SR1pmElj/95XV2Jn
 PBNRV9zLhHWV+MfZA/hvDfEGY5fqc5XhgBuMcDmlYRraQ53YoBWUbPMzxvoTRB8k+e8j
 wiQA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr3BWOmTn2M1ZbJoesfUKlwDYesNOLx3PGdJAixI6g+q4fe6h50wbbytATlfzzrIn6lX3s3OrwIjBhp@nongnu.org
X-Gm-Message-State: AFuF++kMF2yIaDADOD4bpEfocy3SFwCMJC06yVgqTcsS8ILT1srO5b4p
 7OrnCiIOB+8OQCTlgePjTAmbvKBXQD/RP2+pOs9QE/bb+0gZ4hJ0zegLda1sLs9iD/bGEQu6xsW
 2deyRndPPZvfskRtBruz3Ge20TJBEv8G8oyvRghsqiHapYWC1PTudQkKSjA==
X-Gm-Gg: AR+sD11Jenhg/3R2tINuDrzqAJtQXOnfwiD71FAb/BvHuP1R8+/ed/KR1HZJHFCjd7Y
 iXr9ojdsLuA8HW0KiAhfK4c/+ChjZ5+wEyTmWFp/uGfM6Mpl7TuY/mkFUP7AAOu24+mgi2IyV86
 6QSFmu7uEqi+vdFnjbo425ohpT/HTtIo70f5oyQX/56DxCdPyeQmGeAibPC2hKUsxhMZvoEGI7G
 q1bUXoUeHrXz1qvN86B3E/A+b7IexMjaU/fTbqFqbz9M8G/A16d/2NcLAmSLhzxZHXpJAn4FAUs
 TH8GBxQNLEl3UyPeNhlu+QI+tpG5r0URwf8ULMaYy8yC+vpc3Ognz68VbnIFfeEIPc5/QPnya06
 71kZPnYGlLmf8Isxj1Gys/9HABBIB2qPfFHrR
X-Received: by 2002:a05:620a:8ac9:b0:92e:76a1:96cd with SMTP id
 af79cd13be357-93780165715mr1051307785a.13.1787831334275; 
 Thu, 27 Aug 2026 04:48:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8ac9:b0:92e:76a1:96cd with SMTP id
 af79cd13be357-93780165715mr1051304385a.13.1787831333826; 
 Thu, 27 Aug 2026 04:48:53 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9377e615a51sm423061085a.24.2026.08.27.04.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 04:48:53 -0700 (PDT)
Message-ID: <4450441d-1afb-41cd-aca8-abd3a1c34b82@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 08:48:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] hw/riscv/atlantis: Use local reference for system
 memory
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
 <20260826221154.54577-3-joel@jms.id.au>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826221154.54577-3-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5OCBTYWx0ZWRfXxi2ywpNPoNo5
 j8QdjHpc6wgNyRzx9vM9+Q126J3iUcONMLe1ZIIW1980OfqF8ayLezjayEvRNaqzjMbbbC3Bmun
 jiFUv65c2LZtlYh1bWKotVchGVQNotcQpZ2GdoRdzThylB2ClD0uMMdt+fC9UPGwz2S3CCstp5h
 +QaV8t6cOamYaf62Q5yR666A5j4ZZyhYqAWuShmNJbGPpSdAihQIAJOgZbkhG4eNFduYttFubZ/
 Yb4Ge+4kMVTUvHYBtlR9jiKKIoOZPV3BSeLOt8jiC9/nTLnz9tcerc9kVJQFxDlitvgzWyKQ4EC
 6L1GHjW/eBSlS493JGTaKMlw0vnygny5TwE3dFp97+TtQdcNHG7Of/orQ7vw6O53n985XrJWTEK
 dURF5/VjPdrremEqD6Du0Vx8OLiY+fxNAn69125ovnFVaarZ6ZJqHwn7jfCztrtiDwrT7otr9Xw
 frYs6YET4qU55mO1cOg==
X-Proofpoint-GUID: wwy7cYYEh0jvtiTFnAhOJ2aa0dUNXxhO
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a902427 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xQOczflb7_0DwEsGZi4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: wwy7cYYEh0jvtiTFnAhOJ2aa0dUNXxhO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5OCBTYWx0ZWRfX6t2/crf/8kQm
 QBUZtyr9q2qukRtHHFBpTbzbXJl20kFFXua1nXTT68H4RF2Mi8c7VXNjco2UVXXxFVQWVCHW75/
 fS7SLHsm2T+LHf3btbauj/KTLLK2Nak=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
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



On 8/26/2026 7:11 PM, Joel Stanley wrote:
> Instead of system_memory, attach devices to TTAtlantisState::memory in
> preparation for the ->memory becoming a container.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   include/hw/riscv/tt_atlantis.h |  1 +
>   hw/riscv/tt_atlantis.c         | 19 ++++++++++---------
>   2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
> index 642490d21743..a29c67c1cfcf 100644
> --- a/include/hw/riscv/tt_atlantis.h
> +++ b/include/hw/riscv/tt_atlantis.h
> @@ -29,6 +29,7 @@ struct TTAtlantisState {
>       Notifier machine_done;
>       const MemMapEntry *memmap;
>   
> +    MemoryRegion *memory;
>       RISCVHartArrayState cpus;
>       DeviceState *irqchip;
>       DesignWareI2CState i2c[TT_ATL_NUM_I2C];
> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> index c471c7cebf12..1c75fb5d8d57 100644
> --- a/hw/riscv/tt_atlantis.c
> +++ b/hw/riscv/tt_atlantis.c
> @@ -482,13 +482,14 @@ static void tt_atlantis_machine_init(MachineState *machine)
>   {
>       TTAtlantisState *s = TT_ATLANTIS_MACHINE(machine);
>   
> -    MemoryRegion *system_memory = get_system_memory();
>       MemoryRegion *ram_hi = g_new(MemoryRegion, 1);
>       MemoryRegion *ram_lo = g_new(MemoryRegion, 1);
>       MemoryRegion *bootrom = g_new(MemoryRegion, 1);
>       ram_addr_t lo_ram_size;
>       int hart_count = machine->smp.cpus;
>   
> +    s->memory = get_system_memory();
> +
>       s->memmap = tt_atlantis_memmap;
>   
>       object_initialize_child(OBJECT(machine), "soc", &s->cpus,
> @@ -504,7 +505,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
>                               &error_abort);
>       sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
>   
> -    s->irqchip = riscv_create_aia(system_memory,
> +    s->irqchip = riscv_create_aia(s->memory,
>                                     true, TT_IMSIC_GUESTS,
>                                     TT_IMSIC_STRIDE,
>                                     TT_IMSIC_STRIDE,
> @@ -517,7 +518,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
>                                     TT_IRQCHIP_NUM_MSIS,
>                                     TT_IRQCHIP_NUM_PRIO_BITS);
>   
> -    riscv_aclint_mtimer_create(system_memory,
> +    riscv_aclint_mtimer_create(s->memory,
>               s->memmap[TT_ATL_ACLINT].base,
>               TT_ACLINT_MTIME_SIZE,
>               0, hart_count,
> @@ -540,23 +541,23 @@ static void tt_atlantis_machine_init(MachineState *machine)
>   
>       memory_region_init_alias(ram_hi, OBJECT(machine), "ram.high", machine->ram,
>                                0, machine->ram_size);
> -    memory_region_add_subregion(system_memory,
> +    memory_region_add_subregion(s->memory,
>                                   s->memmap[TT_ATL_DDR_HI].base, ram_hi);
>   
>       lo_ram_size = MIN(machine->ram_size, s->memmap[TT_ATL_DDR_LO].size);
>       memory_region_init_alias(ram_lo, OBJECT(machine), "ram.low", machine->ram,
>                                0, lo_ram_size);
> -    memory_region_add_subregion(system_memory,
> +    memory_region_add_subregion(s->memory,
>                                   s->memmap[TT_ATL_DDR_LO].base, ram_lo);
>   
>       /* Boot ROM */
>       memory_region_init_rom(bootrom, NULL, "tt-atlantis.bootrom",
>                              s->memmap[TT_ATL_BOOTROM].size, &error_fatal);
> -    memory_region_add_subregion(system_memory, s->memmap[TT_ATL_BOOTROM].base,
> +    memory_region_add_subregion(s->memory, s->memmap[TT_ATL_BOOTROM].base,
>                                   bootrom);
>   
>       /* UART1, the soc console (UART0 is for the boot microcontroller) */
> -    serial_mm_init(system_memory, s->memmap[TT_ATL_UART1].base, 2,
> +    serial_mm_init(s->memory, s->memmap[TT_ATL_UART1].base, 2,
>                      qdev_get_gpio_in(s->irqchip, TT_ATL_UART1_IRQ),
>                      115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>       /*
> @@ -570,7 +571,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
>        */
>       object_initialize_child(OBJECT(s), "uart1", &s->uart1,
>                               TYPE_UNIMPLEMENTED_DEVICE);
> -    mmio_map_unimplemented(system_memory, SYS_BUS_DEVICE(&s->uart1),
> +    mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->uart1),
>                              "tt-atlantis.uart1", s->memmap[TT_ATL_UART1].base,
>                              s->memmap[TT_ATL_UART1].size);
>   
> @@ -582,7 +583,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
>                                   TYPE_DESIGNWARE_I2C);
>           sbd = SYS_BUS_DEVICE(&s->i2c[i]);
>           sysbus_realize(sbd, &error_fatal);
> -        memory_region_add_subregion(system_memory,
> +        memory_region_add_subregion(s->memory,
>                                       s->memmap[TT_ATL_I2C0 + i].base,
>                                       sysbus_mmio_get_region(sbd, 0));
>           sysbus_connect_irq(sbd, 0,


