Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A88C61DC2
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 12:19:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzZ4x-0004EH-4m; Thu, 27 Aug 2026 08:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzZ4w-0004DN-0c
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 08:19:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzZ4u-0002E2-02
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 08:19:33 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RCBNei3379789
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 12:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lUjkJv58vdJeCIHzCj5lM+Uewxs/84SxegVIFeINWDM=; b=SeV9Cz+A7FTNz8px
 c9xhmSqZ5E9yHckyh+xEUik2cxYPP7xmMkP84BFC7orfTtA6G3QA5CTo3sFgL2ki
 H0wj2LYwfHAtlfdychZrWpKnCAPGMe3RHIP68ouAma43iefUCEOcW6SDyXrE7KT9
 ofd1meKRRjdHiWQzM/YX1sNnTDoYFO71zFnXqWHxP2ui0LAfnczpDSEg74z6A3Pm
 +o/lo0LJsXk2QNJNj4Q3ZBWhhz28vHKsZrVEIhCWb2iKCNJEYT7c70N+48VMzK/N
 0Ov1r7cseINSYawA3S7DpnBzATPZimdROdERNLerDmRQEALY5iUgROoSeOlusDTT
 yEFoUQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7r5n4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 12:19:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52ee59064d2so12220851cf.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 05:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787833169; x=1788437969; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lUjkJv58vdJeCIHzCj5lM+Uewxs/84SxegVIFeINWDM=;
 b=Idvkb57r+Or4BSfzW2yFWY2UahJeM/at8VldkT93pUtVJQwjUxAi/wOi/i3eK/0FxY
 EXUkOri3m0QHlThesA7KPfjFef+OY0GmSBJH5wxQoGSSnq7BHLAk0AEVDG32n9nf8cuI
 HNtGgSwqOCOWb+eWrTlkn3hNAms2Oi+MBTwPOJxt7qsjdevmwEo88RW2P3Vt3VCWm3Cu
 nubZiA20y1VIZJwuocA8lxJlHj+f/8Q1k30VBZXb30lWCpriuwnAHwnlaOYma4opPv8S
 XeIR+0RqKIxEJXme0gHYCCeBrOBKA/5SFdUFIXkHUxGBxMjAZfBevQ5FI8PXYulUDpfe
 uygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787833169; x=1788437969;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lUjkJv58vdJeCIHzCj5lM+Uewxs/84SxegVIFeINWDM=;
 b=Zx/8WgNpdNyzy9SDFMZ7GemlGQ2l1x64m2rmo4MxQ2XIcKpOHkIZ0MppH8sN3euJxR
 gXA97L3+1H/G/t4rf4Wr2fjUoXxpoOCeXr63Kkb/9JUKq9um3eHjpEJ2qZnOICYwFcmY
 eYzD6cF/6TYNdhbT37i8Zhei/lqmPB3BFJIFl72RdI+YiaAPOCWQCs5jOjByBsjA9Yk2
 q+4viYFshh1mZ440y1NsrLAmkw728dcv2soPi5mn3qAcPtZa9HCo7sZOcIOaJUO/htdI
 QSvZgNSDTpXvrD0oaPQ5WKcOAvcP6NjjcH9XSLlhcOb8tPnxktZMt+yuQbfiWYM6ytKk
 dBLQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqeGKEF0meD/eIwK/A88UCjVTiBsEbXFpdgzFLcRAesWG4s+p742vuboAf4FFxyA48dchy2uYEi2Y8g@nongnu.org
X-Gm-Message-State: AFuF++mhu4hkM/rB+ULed9XLC6OdKy5jYEtXmZkwqZWdRtbMfoMtsYP3
 rolTfPjJL6MuB/7LlPC7zJNE5dIxrL6WNU1mJ0qz40VxfJ+b8e3MLZv1V/slpEfeyZWZ2iu/qs+
 vZHvOI/12aObAGuh2C37bQPYl8fDbEawm5ANJHVZlDosQagxljSswnTOk7Q==
X-Gm-Gg: AR+sD11T/Qj8Kr0rk7E2+9XMQ5I6k64Bg2w7vYSawHLIy/ay0Q20/lpY5z3ERKA7qN3
 q7arkILGU/RcErB926Wh5Wa80Cj+bDNNTMR2i4M+lTrhCKQaOGJAMda24SdQ3NSIjSrZLqBkZzx
 3CvM5DrQgnrzSvC7g0tPdzn+5RTM+9zxEIimytkBRUIm6M7qXPaRm7q8OH3jiieHCIZR5m4rcLE
 FX717zxlQcpbSvhQrA/oF+ZO2zmE4xYiV3KuPM6R9DEA+1RB7y9DXJTjUaZns8AeUqth5/tmQu5
 F9I6ecXS8Bo1lfAYnQBLAr4DI4FDFSUsw8+VpIkYmb6OjrOWTTjc1kBPFj2R7YrXSQ2T98r+yMI
 a0f7sUqBKADqFFKWoPcaAqza5P7CF5PM82kmg
X-Received: by 2002:a05:622a:1654:b0:517:146d:2cb5 with SMTP id
 d75a77b69052e-52fa1dca862mr57807491cf.20.1787833169515; 
 Thu, 27 Aug 2026 05:19:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1654:b0:517:146d:2cb5 with SMTP id
 d75a77b69052e-52fa1dca862mr57806811cf.20.1787833169087; 
 Thu, 27 Aug 2026 05:19:29 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cd73e3ddcsm15491946d6.23.2026.08.27.05.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 05:19:28 -0700 (PDT)
Message-ID: <408d0ef4-3d1f-42a1-94fb-3d58d5cf4def@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 09:19:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] hw/riscv/atlantis: Map the SoC through a memory
 container
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
 <20260826221154.54577-8-joel@jms.id.au>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826221154.54577-8-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEwMSBTYWx0ZWRfX2rndX8DXTsIh
 jbDYZaZKZ3A060FF1b22xmXHxzOq41xx8Yds7+E4FTjZs29f7ZRJTRX6ePN+2djRj6PQF7bTTnz
 /rrlUmQDAb1bOnyjGXyTtTz74Z6F+FeN+GAP/uUkxXlYXkY1LXnNO0hft8rdAucBrnohZG/Ypvq
 gJDpL0SC0szVBEhwVvq+bb/n/fkwlHtlNpCv8F9eg7qKsyw3bVvnHKVwnwGjDEICamp4RmE6Vgg
 P4/Y8B87z3RLF16Xh+J4rnL011rwaLWUri2F+TGiAHxUYRCk65eIg05ZFPeoWIoWZx/VTbIPj3V
 FgLnBVnJQ8P4GYgIorJFnoUqzqF0+eJRK6Kx/BplWhZ5flKDSqOTJL1ePFecO1KnrugBXEvxYPb
 W2fM9WVUtRNPZKGydgWhlpkOU1WL4FyJgDjNCF8f0jmCmhqXqsVsoZjg451vRFK4YfKOealBSF1
 5uXAgklsSQmz/YlfRLQ==
X-Proofpoint-GUID: 6hw-eSLFwIsukpiR54FwGJo1YK5JMFsN
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a902b52 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EaHCLjwZbvpemRJ5OWoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 6hw-eSLFwIsukpiR54FwGJo1YK5JMFsN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEwMSBTYWx0ZWRfX413wwkRBYp/l
 5LozPSAmwS3RJ2Q/rm2MJ+C346H0Bz57qgGLv2YOhjB0ayUp415XCogPE/Gd+vqyPjjlyxYHHWu
 VGAxpIX3P0AEeYQtUL9N6ViRl0B56aM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270101
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
> Give the Atlantis SoC a 'memory' link property. The machine creates a
> container MemoryRegion, maps it at address 0 of system memory, and
> passes it to the SoC together with the machine RAM. The SoC maps devices
> into the 'memory' container instead of system memory, allowing
> TTAtlantisSoCState to be composed together with other SoCs in the
> future.
> 
> This prepares the machine for adding other microcontrollers that share
> the memory bus with the Ascalon complex (aka the Atlantis SoC), but with
> their own view of the address map.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   include/hw/riscv/tt_atlantis.h |  1 +
>   hw/riscv/tt_atlantis.c         | 17 +++++++++++++++--
>   2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
> index 5d4e4d133bd9..3923308b7c89 100644
> --- a/include/hw/riscv/tt_atlantis.h
> +++ b/include/hw/riscv/tt_atlantis.h
> @@ -53,6 +53,7 @@ struct TTAtlantisState {
>       /*< public >*/
>       Notifier machine_done;
>   
> +    MemoryRegion soc_memory;
>       TTAtlantisSoCState soc;
>   };
>   
> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> index d2b29ff1a477..b78b4a5ea31e 100644
> --- a/hw/riscv/tt_atlantis.c
> +++ b/hw/riscv/tt_atlantis.c
> @@ -503,8 +503,10 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
>       ram_addr_t lo_ram_size, ram_size;
>       int hart_count = s->num_harts;
>   
> -    s->memory = get_system_memory();
> -
> +    if (!s->memory) {
> +        error_setg(errp, "'memory' link is not set");
> +        return;
> +    }
>       if (!s->dram) {
>           error_setg(errp, "'dram' link is not set");
>           return;
> @@ -523,6 +525,8 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
>       object_property_set_int(OBJECT(&s->cpus), "resetvec",
>                               s->memmap[TT_ATL_BOOTROM].base,
>                               &error_abort);
> +    object_property_set_link(OBJECT(&s->cpus), "memory", OBJECT(s->memory),
> +                             &error_abort);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->cpus), errp)) {
>           return;
>       }
> @@ -614,6 +618,8 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
>   static const Property tt_atlantis_soc_props[] = {
>       DEFINE_PROP_STRING("cpu-type", TTAtlantisSoCState, cpu_type),
>       DEFINE_PROP_UINT32("num-harts", TTAtlantisSoCState, num_harts, 8),
> +    DEFINE_PROP_LINK("memory", TTAtlantisSoCState, memory,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
>       DEFINE_PROP_LINK("dram", TTAtlantisSoCState, dram,
>                        TYPE_MEMORY_REGION, MemoryRegion *),
>   };
> @@ -633,12 +639,19 @@ static void tt_atlantis_machine_init(MachineState *machine)
>       TTAtlantisState *ams = TT_ATLANTIS_MACHINE(machine);
>       TTAtlantisSoCState *s = &ams->soc;
>   
> +    memory_region_init(&ams->soc_memory, OBJECT(machine),
> +                       "tt-atlantis.soc-memory", UINT64_MAX);
> +    memory_region_add_subregion(get_system_memory(), 0, &ams->soc_memory);
> +
>       object_initialize_child(OBJECT(machine), "soc", &ams->soc,
>                               TYPE_TT_ATLANTIS_SOC);
>       object_property_set_str(OBJECT(&ams->soc), "cpu-type", machine->cpu_type,
>                               &error_abort);
>       object_property_set_int(OBJECT(&ams->soc), "num-harts", machine->smp.cpus,
>                               &error_abort);
> +
> +    object_property_set_link(OBJECT(&ams->soc), "memory",
> +                             OBJECT(&ams->soc_memory), &error_abort);
>       object_property_set_link(OBJECT(&ams->soc), "dram", OBJECT(machine->ram),
>                                &error_abort);
>       qdev_realize(DEVICE(&ams->soc), NULL, &error_fatal);


