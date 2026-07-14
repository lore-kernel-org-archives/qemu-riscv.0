Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F321C43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 09:28:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjZQn-0001ja-7T; Tue, 14 Jul 2026 05:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjZQk-0001ii-Dp
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 05:27:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjZQi-0008KY-Tv
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 05:27:58 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66E6SdWe3887371
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 09:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YsjEJp6DYQzK2zaLDLP3O83HT20ISI+a2E8CpMG8dm8=; b=FMYyNUPt2ASQ8iU4
 QS9XstVQssDjm5fsZ6EQfNuKvPYSS0fcVP9jseMS656DY5ot+QXDFmdLFj5+fOd5
 Hu/cdnzmGVJZjm1LyAUdIxZWOZG0CwzNSPVghtWKcMBih/VZRaPs8sKfpTbZLEmY
 4bih0niZ8YBcX6ZArfQ+lFOL/QF9zDQLZuIUP8J5XFiTvlT1hsNAbwWYc3tGPLtp
 q8TA6LnOYD2b5V/6fdbWHielUd5TuAffxVckYvdtUTNgvthid610aaKtMDwmm4vQ
 XtfbTQt6nsQURFWbcah1ZLjDJQTWilzS8mxfj1/tNNj9uGrGFqlJEDGEz4Kf6oup
 Gc4QMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr49jr4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 09:27:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1a97644aso78321611cf.2
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 02:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784021274; x=1784626074; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YsjEJp6DYQzK2zaLDLP3O83HT20ISI+a2E8CpMG8dm8=;
 b=S5Z7HURhk9OWGJMPKNrbU4sh7xeuLqgAM3SvFTQBVd8IP8bXAayV76p2Kh0GaTzc1F
 qiI+LNyYnrbjIHXvVqLxOfdi76nHPtKu3ks7cmp38uRmA8fuCX7TVDNlAS4lrhPwtl23
 vEo1H50LF4AZImMLuoxKUn389uSBLztkWRXtZIL0n4meKc/CBZP6ymrLxGQZoOo6vjO/
 YhvCuSDwR0gtLF0BYuoJvkVaxCLgXrZ3wez5Rt2ozkXO4kxgkWJT3n49SZUE4u/XxR2B
 GbslHGijepkK1V9fcsSuth9YusPjz9pWiw5ZgCHs9FgQdfS4GrechDfZoVYA8sc/7iC1
 63+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784021274; x=1784626074;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YsjEJp6DYQzK2zaLDLP3O83HT20ISI+a2E8CpMG8dm8=;
 b=ecLWqaWko/UoBgZwc5oJN4sTnpMRCiai+hLYDYXN3GEeYhxVFIBsGMocKyA/kCq0+f
 58gdLjIdc2j3iKuJ7PShJ/u4EnjxDtDqpogJaC+5iJMeDswh067/ReuncNoYn0he4XDO
 WTO4rdUI7H0aiumT7Th7RoKKW0P/Vw7JO+n+tQ7RsA6poNT/RmjZnlPEpvLYxfqtRkcE
 LfuXEvaKS/iBEnJ+F5bZjDY35lr4ScnGDyxdjjG8awx8YQtGNJqiVGkS8UGLYGNXrdJj
 vuTXs4Xjh3dOfFX2s5BQVVjQ2Y4RjD/dtpLwNmNHMon52u/1QBOsBdDpGn7auKv02mgX
 X37A==
X-Forwarded-Encrypted: i=1;
 AHgh+Roc+Ht1ONP30RcQjx32Rh/aa8cGiicr+PzFWL/H25tdefHjBvJbx5EAzE4S7v1gU3+TANrxJqt9C7T5@nongnu.org
X-Gm-Message-State: AOJu0YwC6N4RT+rRtBwjUUDT3WbeX9NtsWHzUS2OGLBteqDyM2szBt6+
 bSmMHX2uAIajd8hG6/RTlpoGVHQZwq0FFAVZZOEEIlfYiYoX1im4XZlRx9gxifN4sbMcG2W0Kj7
 t7H5rRy1llS5xFoXGUnVPhbZMi8HTWhsbTgYTR+7Drc0eoz+BCVgehdfUeg==
X-Gm-Gg: AfdE7ckp8PdMd9r0yWDilYA/hgGzthiTSCUsfDuasPft5LB/uFixo+hJCUPMxq/ZSsy
 RHvcXLzeesFg75tfVibOMSSXuTA32/WkFBkwp9eT/WHcH+SHhDIdZ8RrHQNabPp9efaae/r7jDn
 gVk+RK5/E42YrvwzbR+dPj/veAwkG9pCP2Brvs2Yo1kHvqDUE/Yz74AalB5GX1wget5pKppcHjn
 lKmiXm52VctSBgaxX/G25U68rj8d8YMIk43nAW90iK2cuuBxJ6WMUCM22+Onhaw8ZMutfo0pMeQ
 jXzexhyvWAbx6KlVX8hUYmnljxR5JhokkvRlt+Gz4C5JqY6ycSLhp+Z1kbb2Z8ixbs+wfj1RN4N
 u20/9ALDggXGWJRw5u6wthvX3bcBgpvkDgJqL511tHIUwwrpAYfPWLBPjceCv6w==
X-Received: by 2002:ac8:7f92:0:b0:51c:a7e:4cc2 with SMTP id
 d75a77b69052e-51e42393b4dmr10506431cf.20.1784021274412; 
 Tue, 14 Jul 2026 02:27:54 -0700 (PDT)
X-Received: by 2002:ac8:7f92:0:b0:51c:a7e:4cc2 with SMTP id
 d75a77b69052e-51e42393b4dmr10506241cf.20.1784021274021; 
 Tue, 14 Jul 2026 02:27:54 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c165d5b2e0dsm109557166b.57.2026.07.14.02.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 02:27:53 -0700 (PDT)
Message-ID: <4bd00c71-9a3e-4fd3-916f-fa9c79c78d7c@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv/virt: Add optional UART1
Content-Language: en-US
To: Yanfeng Liu <yfliu2008@qq.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "sunilvl@ventanamicro.com" <sunilvl@ventanamicro.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "daniel.barboza@oss.qualcomm.com" <daniel.barboza@oss.qualcomm.com>,
 "chao.liu.zevorn@gmail.com" <chao.liu.zevorn@gmail.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>,
 "pierrick.bouvier@oss.qualcomm.com" <pierrick.bouvier@oss.qualcomm.com>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>
References: <tencent_06551FAEA44CD75E915AE611FCA0C99CDD09@qq.com>
 <f3999d13e4cf6e470d7761be01d1291944ae0e9b.camel@wdc.com>
 <tencent_75E11E56A40ED70491B2E653FCEAC9FEDD09@qq.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <tencent_75E11E56A40ED70491B2E653FCEAC9FEDD09@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NhPOkusfORJ9SjNSog2bdYfPvbDGBqLZ
X-Proofpoint-ORIG-GUID: NhPOkusfORJ9SjNSog2bdYfPvbDGBqLZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA5NyBTYWx0ZWRfX38YeM7gDpRpi
 qR0BT5s9jagA9uRHbobskegc1uHhYkq9Q2X2HFYTgPRn6KDoVPE0J/g1qqW5wHyVmIXmj+2uD8B
 kw8EbxOvwpEicWFsX+MpdwGWzwSxQ0UBWGZft5sXkgq3zGfvsIU9930GSQhYAVUYs7QqjuVD8PZ
 TbDDWTIjuls/cIv1c4JiaBwNC7zupbi45zabjGUK1/mIesSUgZ24S2TfS5EJyY3dRq2Ts7/kzjs
 NxQ4xyvqsS68dSkaaGJhkAA7q3Nk3lYkgUhfZUWz5sRDncZSObsLjKMc1JxmX4L0Hwb2uEo+Z/w
 9BtkNPK3aHmDNyE6upDmxdV3tbv+5O6ocdMctMSNX0jh9q7QY9Tfc7I/dhmJ0eiCzAs4IOrqh+6
 Q4lCiMN2khaOKU1PzHfl7lyMwZQ0Qs4OhGwtSgzW2M965ljMxfWDiTBO+uEBDgLz9qg23B2wPy4
 hz7AzjAtguUYgj8B9Sg==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a56011b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=dZbOZ2KzAAAA:8 a=JF9118EUAAAA:8 a=D_RgE4d47K6sYyuMCyQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA5NyBTYWx0ZWRfX1TACD/hQTJEU
 JUV0/3x9qidymY7b2Pfm1ZXnJvt+TH6E0HOKvRHMmIQF8gqnTxGJflHCi3K31vvITiZTa/nuLfw
 hrSIs2klgl4FAgIUuCoueSaHye5jNBc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140097
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Hi,

On 14/7/26 05:40, Yanfeng Liu wrote:
> Alistair,
> 
> 
> I was using  0x10000100 at first but soon noticed it is in the same MMU
> page as UART0, which is difficult for pass-through hypervisor guests.
> So current approach seems a little more flexible?

(please do not top-post on technical mailing lists)

It would have be clearer if you precised that ...

> 
> Regards,
> yanfeng
> 
> 
> On Tue, 2026-07-14 at 01:13 +0000, Alistair Francis wrote:
>> On Fri, 2026-07-03 at 12:24 +0800, Yanfeng Liu wrote:
>>> This adds optional UART1 to RiscV virt board if required at
>>> runtime to simplify multicore development.
>>>
>>> Note that UART0 remains default serial_hd(0) and it is:
>>>
>>> - the lowest address UART
>>> - first serial in DTB
>>> - behind /aliases/serial0 in DTB
>>> - the /chosen/stdout-path in DTB

... here [*] ...

>>>
>>> Signed-off-by: Yanfeng Liu <yfliu2008@qq.com>
>>> ---
>>>   docs/system/riscv/virt.rst |  5 ++++-
>>>   hw/riscv/virt-acpi-build.c | 12 ++++++++----
>>>   hw/riscv/virt.c            | 39 ++++++++++++++++++++++++++++------


>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>> index 33775a61fd..9a112ccdef 100644
>>> --- a/hw/riscv/virt.c
>>> +++ b/hw/riscv/virt.c

... and added a hint comment about alignment here.

>>> @@ -96,6 +96,7 @@ static const MemMapEntry virt_memmap[] = {
>>>       [VIRT_APLIC_S] =      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX)
>>> },
>>>       [VIRT_UART0] =        { 0x10000000,         0x100 },
>>>       [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
>>> +    [VIRT_UART1] =        { 0x1000a000,         0x100 },
>>
>> This could be at address 0x10000100 instead and squish up against
>> UART0.
>>
>> Otherwise:
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>
>> Alistair
>>
>>>       [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
>>>       [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
>>>       [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },


