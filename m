Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D197C61DC6
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 10:56:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzXls-0003U6-KQ; Thu, 27 Aug 2026 06:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzXlq-0003TI-Bf
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 06:55:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzXlo-0002ro-F3
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 06:55:46 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R9Hh3p3524148
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 10:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KBJPDc/62a7jiY080oygW50ZOAl0PZ8y0OIixkS/R60=; b=PJXN9Xz55DzOop8N
 tVBNa0IzZn2J5WpMJvcGYTJ8Pp9fMRBKjMlDfpdYozDaQNcy3RA+E4m9WPAWjO6Y
 428IF89qO48Itq4LOMBC+iXuSjCSCkC4D6V+aNFDUG9IfdMTo6y5/uiq53fe2pMG
 6nv/kjd6k1HBONxtRy8s+7gYRvJoGeVL+dom4yHifhNAGsMugrvn4ORRCkvdfyWE
 JQRTNuq0mFrCOPyO8QaPnuX43Wfy+3IOU/HmqKLdBZbtzxNeYIsgzUMHg8Fu6XEf
 3rrYs2DbYLtIE31ZLaWStX1B/bz4kOx/qQuDhunqpsiXNTgcvSd2l4INAbRuoX1L
 hdLBNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gagjfrvvy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 10:55:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-934956beec8so337898085a.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 03:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787828142; x=1788432942; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KBJPDc/62a7jiY080oygW50ZOAl0PZ8y0OIixkS/R60=;
 b=iuL9m0sAJZGBaSnq9sdTOQEzLsCJndLaghl8/0Q/ZoIaIGAObInGRV2qz0jLjZmmMT
 Jc32Vy0zNaC7YDJBQgNt5YE8TEnhgFlOxOpR3xaGQ0wJUsPInMbJz3wviLjl+qFJjDNY
 qHHSh44zG6oJfknBWl3EE9JLYTIN2SyH9/9uWn3bHsnSmicFVu0FbxQ0gRnSXwgfvNG8
 ri0wqoqylA8slkldxaF/YaN2E44xdNZQe4lxYnljfryNsQgzGwgjJNSwF/MNI4Exz//o
 mOcRBdgkzChDncpb+S8+iYlgB0rHXlsD5ONr/iuKr57su7iT3swvDKvSVpWJ1xJixaHe
 Lv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787828142; x=1788432942;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KBJPDc/62a7jiY080oygW50ZOAl0PZ8y0OIixkS/R60=;
 b=nGBbTs0raKMAZ6i9ZxqQMyq1r/exCDuK4vXPAFrjP8ytjmhI6aCOuuPU3p0bUHFGd8
 eBnXrnLa5kR7yRNGu6dtzYlvunAfD+hWiJBVoUQ0ZN2p6gWv7sRU50k7wR/OXMS72Vtv
 +CwkjWIci5AfY6H1zmPIz7izzTPZOwfLuDe7vS38KDzSISz43ZEEK7FYV/Uav5HLjCT3
 U+T6SIGmiYwaLmuPjErSgUvKh55mWGpzSEWbGJqP857rM6SF1AkL7qKWlSSa6WGbA9jv
 S7y1R9Olrx5aeDD6rYiU2JKGjZLdm2fjjrPlOwqFRsoxc4dHcHQXAZcgAt43+zv8Iu7n
 xvAQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpif8tynYx+mhV4S+eaDVDOhchRDN0qNbIXZXrVg5PEGQetcGFieUOetAQPCk4adTtUFHM/sEe63maK@nongnu.org
X-Gm-Message-State: AFuF++n6qbyRN9gGAJSVEX9yK+dd8nwuMtzb1IAIa0J2eQANF/SVIekV
 AB/R7FAtIYvO/6JArOo63VKcLb+Dtf8AhHsroxK9G8kktHvJM2BWZ1AdTiR1RDp4n6UMs8gxcJS
 oTcAPhR5D5/Bbi3//OPOwOV9RE+eJiDhwntMioO1lC3e+OnbzFLUFHJw4Pg==
X-Gm-Gg: AR+sD12K9VaHeiqmJ0zSfv4II212uIMukibPk8l+bUU10wKJkw4CYvQlNi+6C81Y0tK
 TAiAu+3zG9vg9HTy8TgDEymkoJWGmUu1kkxVS0QDvE2wqa2KsgxSdE/lKXie5o+tr3e1+AxV8lh
 bNtZSgm178JwYZa+oAAwCY7216n64M2WrLSMn/MlpT3YWqIe7y17DunrOAxaNWspeu+8IfFaswf
 S9x4NERBlnBT3Ovkt4cFRo8frgm3MxtI5pZAAVds6q6jCdq+johdbdVRROVUOhYgmnts1nFRLbO
 gJK15UH+vsU9E4oBQxO0zTzGr4CrXIMVDHfh3Eibjp/zVeYswLJEevUFMAQVyIUnW4XfXIXYl3n
 DkgqS/UoxA8mRrdP7jmNOC1oDZxXbRVfUi4CL
X-Received: by 2002:a05:620a:4725:b0:934:81ae:6d1b with SMTP id
 af79cd13be357-93780490d62mr1280664485a.22.1787828142299; 
 Thu, 27 Aug 2026 03:55:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:934:81ae:6d1b with SMTP id
 af79cd13be357-93780490d62mr1280660285a.22.1787828141863; 
 Thu, 27 Aug 2026 03:55:41 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93785a15ef3sm326438285a.40.2026.08.27.03.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 03:55:41 -0700 (PDT)
Message-ID: <4e4a712a-51cd-4880-8895-b3f0f2883b0c@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 07:55:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] hw/intc/riscv_imsic: Take a MemoryRegion for the
 created device
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
 <20260826220528.54516-4-joel@jms.id.au>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826220528.54516-4-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TfTBXmefVFcPHoGqkB2qSY9kr6klgoal
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5MCBTYWx0ZWRfX/c3N69JQ0UzO
 RJIiK9Gy9mp5UNgGD+wqYo14KfV2N50LduWvIiSd6ODlCWTkdaB7z9cN2JCGSf337dFwKN06+xZ
 AS9WCikbqDGNoFs1m/0osNib5xDynpQfmDzOVmi26ds0RWjSEilJ5F2WkiO+51WFcKMPYP736AJ
 rg9UrYYncZ09zSw/g0d6yXtrnEnpa3FY2hCX3F92y6U7A/xGcNWwOOyEDLOkdK8s++/gZSgCSjc
 XJQV+Humm6XbZf8Z2YYQQDP1r6+GdeeCNduhx/RcOlTaXEKK7GLugLYzh6W6oWs6iP5LpjWoMBP
 ruWtpR/0BKNMwYarwJSLoho6Z6IIIdU6rKA2wOkahYoP52cBvmU1eE2qzFH+WaxJh53UEvqwULV
 gI+G+/gfcGVlu/wbwJ2JgkjYXlssKmcCDvqlkqPzl5YwFtYPyQPO4a+7J++Vo1KWWNBO68D+Lzr
 XahzTdfgbGxQu0g303Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5MCBTYWx0ZWRfXxIoyKzptsGn3
 8Ong7AdJAYIqnyfHAwTzAXISHbKlYxr86XQLoqp+me9UhVKLKUJEjGCkko4vw5jHLhGNpQJKm8H
 +LP8xYKKjWZA6zRb7z43/z2INmJZjMU=
X-Proofpoint-GUID: TfTBXmefVFcPHoGqkB2qSY9kr6klgoal
X-Authority-Analysis: v=2.4 cv=dd+wG3Xe c=1 sm=1 tr=0 ts=6a9017ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2b0TUu-kZssljZTJo2oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270090
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 8/26/2026 7:05 PM, Joel Stanley wrote:
> riscv_imsic_create() maps the device it creates into system_memory,
> which prevents its use by SoCs that map devices into their own memory
> container.
> 
> Add a MemoryRegion parameter and map the device into it instead of
> calling sysbus_mmio_map(). All callers pass system_memory, so there is
> no change in behaviour.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   include/hw/intc/riscv_imsic.h | 3 ++-
>   hw/intc/riscv_imsic.c         | 6 ++++--
>   hw/riscv/aia.c                | 6 ++++--
>   hw/riscv/xiangshan_kmh.c      | 5 +++--
>   4 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/intc/riscv_imsic.h b/include/hw/intc/riscv_imsic.h
> index fae999731dff..8295b1f14452 100644
> --- a/include/hw/intc/riscv_imsic.h
> +++ b/include/hw/intc/riscv_imsic.h
> @@ -62,7 +62,8 @@ struct RISCVIMSICState {
>       uint32_t num_irqs;
>   };
>   
> -DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
> +DeviceState *riscv_imsic_create(MemoryRegion *mr, hwaddr addr,
> +                                uint32_t hartid, bool mmode,
>                                   uint32_t num_pages, uint32_t num_ids);
>   
>   #endif
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index d6b46cdca220..26dd10a0462c 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -495,7 +495,8 @@ type_init(riscv_imsic_register_types)
>   /*
>    * Create IMSIC device.
>    */
> -DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
> +DeviceState *riscv_imsic_create(MemoryRegion *mr, hwaddr addr,
> +                                uint32_t hartid, bool mmode,
>                                   uint32_t num_pages, uint32_t num_ids)
>   {
>       DeviceState *dev = qdev_new(TYPE_RISCV_IMSIC);
> @@ -518,7 +519,8 @@ DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
>       qdev_prop_set_uint32(dev, "num-irqs", num_ids + 1);
>   
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> +    memory_region_add_subregion(mr, addr,
> +        sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
>   
>       if (!kvm_irqchip_in_kernel()) {
>           for (i = 0; i < num_pages; i++) {
> diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
> index 651552c8f970..49cb14349f00 100644
> --- a/hw/riscv/aia.c
> +++ b/hw/riscv/aia.c
> @@ -52,7 +52,8 @@ DeviceState *riscv_create_aia(MemoryRegion *mr, bool msimode, int aia_guests,
>               /* Per-socket M-level IMSICs */
>               addr = imsic_m->base + socket * (1U << IMSIC_MMIO_GROUP_MIN_SHIFT);
>               for (i = 0; i < hart_count; i++) {
> -                riscv_imsic_create(addr + i * m_imsic_stride,
> +                riscv_imsic_create(mr,
> +                                   addr + i * m_imsic_stride,
>                                      base_hartid + i, true, 1,
>                                      num_msis);
>               }
> @@ -61,7 +62,8 @@ DeviceState *riscv_create_aia(MemoryRegion *mr, bool msimode, int aia_guests,
>           /* Per-socket S-level IMSICs */
>           addr = imsic_s->base + socket * (1U << IMSIC_MMIO_GROUP_MIN_SHIFT);
>           for (i = 0; i < hart_count; i++) {
> -            riscv_imsic_create(addr + i * s_imsic_stride,
> +            riscv_imsic_create(mr,
> +                               addr + i * s_imsic_stride,
>                                  base_hartid + i, false, 1 + aia_guests,
>                                  num_msis);
>           }
> diff --git a/hw/riscv/xiangshan_kmh.c b/hw/riscv/xiangshan_kmh.c
> index 94f9d02a00b9..9eb608f8c578 100644
> --- a/hw/riscv/xiangshan_kmh.c
> +++ b/hw/riscv/xiangshan_kmh.c
> @@ -65,14 +65,15 @@ static DeviceState *xiangshan_kmh_create_aia(uint32_t num_harts)
>       /* M-level IMSICs */
>       addr = memmap[XIANGSHAN_KMH_IMSIC_M].base;
>       for (i = 0; i < num_harts; i++) {
> -        riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0), i, true,
> +        riscv_imsic_create(get_system_memory(),
> +                           addr + i * IMSIC_HART_SIZE(0), i, true,
>                              1, XIANGSHAN_KMH_IMSIC_NUM_IDS);
>       }
>   
>       /* S-level IMSICs */
>       addr = memmap[XIANGSHAN_KMH_IMSIC_S].base;
>       for (i = 0; i < num_harts; i++) {
> -        riscv_imsic_create(addr +
> +        riscv_imsic_create(get_system_memory(), addr +
>                              i * IMSIC_HART_SIZE(XIANGSHAN_KMH_IMSIC_GUEST_BITS),
>                              i, false, 1 + XIANGSHAN_KMH_IMSIC_GUEST_BITS,
>                              XIANGSHAN_KMH_IMSIC_NUM_IDS);


