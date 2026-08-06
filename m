Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BDFC56208
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 21:07:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ws5JM-0007vs-Nv; Thu, 06 Aug 2026 17:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1ws5JL-0007vd-OR
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 17:07:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1ws5JK-0002lC-6y
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 17:07:31 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 676L0sxw3118426
 for <qemu-riscv@nongnu.org>; Thu, 6 Aug 2026 21:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uHXy1pbc1PNHLG3fSiVtqkHVOq7fkZnX4vegx0USJe4=; b=DZPW3Bb4KxJlOrjL
 75agRDsnxr1MewzvrYZQSCndI9kKyXDWege0Xqmvu6zSk+I/K2e3mFP3suwbnFYs
 gaYXJWBYYT5djGn8XUpVer8s/LElb/yRvkxbxSUGrdgKEdhqJ2JiBXmOQ8dpPzc3
 2DFvHe9fPu5OT+2Y2IGXCaaIF3sqy5gLdIi/2uER3+ke6thZmHsAUQke/3MdgUbF
 3OaqR1n7Hil9YL13vPuSbsloGDi4/eIiKCF0KOKN54dv1xUuFTF9MPUPsEszvJ3L
 A2y4HjLBDt3NCU9mzVY6n+G8p/nmu2USCn0lTt5fhphe4OZob4wCimgZmSVthYLQ
 T+5UOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6frtqv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 21:07:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e5e38fbc5so309549485a.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 14:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786050448; x=1786655248; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uHXy1pbc1PNHLG3fSiVtqkHVOq7fkZnX4vegx0USJe4=;
 b=JkK0pTnZI78d7r+pWmq17whKdFiNWP42Wkm0AQp2RnckhCzlOafLfcGLsHVFCyMNJK
 YEvmF3fhCFpHAmmTuUuQtC8TfGH8598efuAyKChAIfScJuz+qQSCs+h/bHl9Lh13IHdl
 QiODSU2rI5rvgVMKJ7TTReVMiv4AJJC7JKKmoGswbmwhFWIlmrc54dq2bhwVv7joprzM
 n2pG7YLTNVpk6oXf9q9m4SyxBvWHVLV06DN4O7pybv7Pdw2Fbli1xf/RSm5ByLVX7+0U
 EdgkwrP60DXnDpQojSOOSHZsteGcYB5KtbcNn61o4ypQu30paeZUVbqpff8AJCcVFP1x
 K9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786050448; x=1786655248;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uHXy1pbc1PNHLG3fSiVtqkHVOq7fkZnX4vegx0USJe4=;
 b=dimuDjyoGaIHMrRlUpQnnldH4Ei4IkNt83xXPS8EWADvRKRy3NLCBMd92BB7+9ViYW
 +VtcB4Xat1Ts+J5a9h+oWi4/iEGoBhz8NeqmpibEuIdCh5AXMq/vVmGr8393dgrhkcEJ
 f1V43QYrlVM+nOol9CGtoYuiddjgtzQwVYNuATPBEcIS85nlKxrjmOiAzkgddlhAu1ed
 g+W8IeQ1UXmBDdy9gRLxRw2+yC8QJcuwU+xCaxDOWOst6KHfqaJQQcc370e+Kwn8Di1i
 LvTzO6woxMH/hd1lxHwS+lvismX1DwekulY7mVyuRRO/KxtE3F489RKevmYX2BlnOv4k
 4yAg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr/hjEQKMv0xfwWIkyTj2G1JtNAumaNyi2Z+KRuMKx0Nj8HoF/X31lw5Xnz40/YWEYcFjUVFiz7Ymmk@nongnu.org
X-Gm-Message-State: AOJu0Yx9+sVYnsO4KHU7FpMm1rFOI/fmuZnKyngR8QJXjp3SjuPLlOpK
 txMMeiD9+/4G5qsjdWKSpmJslKdt7Y21Teyoo/H074SkUdjGMcwf8VQy/UpjG37MVMCXVC1TQN8
 7GtQg1a5mFETKyaqaDQsOchKf5OMOh9UyzikMJg7FHC2lnX1n5hYVBosp+Q==
X-Gm-Gg: AR+sD10BxQU8u+4RAHHyo1+mPn6ReCN3YC+xhY/ecmYedJ8RTXZB/Xsj1YORT3CUYoJ
 HMeLdbqvBW3979daf65+hpDIfR8zHNTtHwEABSf24OnGJZQHjJZuwkMhVidYyWTl2q9DzAWyZEx
 t+lqPZa4mTgocIQvmy4Bmvk4GCeI70lqq3Av9+KK+kLlRi0vHkIni8aKNIStMo9IDvlLFcFuKIG
 slHw93gI04txtA/LMJKyjWeq3XHCy6PmQIXaWD2WplxvOhj3udVd6vI7Sr+1m7e97lpGtelqqiR
 zlB9GSge9PZN/AXGOGSrIwMIuDRs1K+w4trsRXPy1utSv6QojpjEwrpugfjlIN5ENUXIOxelCuf
 Zz9CHRhnS2g3mvijgOwua1nuWyyALPQ0RhIJO
X-Received: by 2002:a05:620a:29c2:b0:92e:f101:5dd6 with SMTP id
 af79cd13be357-93648fc72bdmr1462650185a.6.1786050447715; 
 Thu, 06 Aug 2026 14:07:27 -0700 (PDT)
X-Received: by 2002:a05:620a:29c2:b0:92e:f101:5dd6 with SMTP id
 af79cd13be357-93648fc72bdmr1462644985a.6.1786050447221; 
 Thu, 06 Aug 2026 14:07:27 -0700 (PDT)
Received: from [192.168.68.103] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9364a59552esm503660985a.42.2026.08.06.14.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 14:07:26 -0700 (PDT)
Message-ID: <0a052a0c-ab06-410a-a163-4ca6e8b7211f@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 18:07:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] target/riscv: Add SiFive custom int8 matmul extension
 implied rules
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Frank Chang <frank.chang@sifive.com>
References: <20260721122034.1567146-1-max.chou@sifive.com>
 <20260721122034.1567146-3-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721122034.1567146-3-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE2MyBTYWx0ZWRfX3Di8sNNqTSu2
 ipCV+lhGVpJeLAhHArGpj0FrwBwR7w20c9iF2FkP2i4I5Gyw5ZDczsrZp3fvKvbonMY7BnitxtU
 h7Hi4vuPovfQ1EgDBy8HArQMT7SSMUPVk6CRIfhR2BIKjDCUaPsfhon+28zzsJy1niIOm7GT1ut
 Shwz1/cFg4/4eCyb7pPIoaViiCkJJL2xl8VuwAiLFojQ/TmOKxgXUfoDSBc2JQSDsLTL8r7Y2Zf
 KLwmJYQX0WvGLZ1UE6x6PcyGAbnoGv/IJCHLSmdPufLC8DYEOPj7SI/Yk4KgVsO4evde5MPbqHq
 zO/or+0nd/69UdKuqOFQL+hY+wRDBUS9z0sTZ3/+xIBw+6gEnHc9vtaFp3Ivrh5VEraIiXi8O3i
 0PkdRuELtu/Uxgak3XVyDznqWraITQ+b0UKNcwK7lcjYrYG+Nw6xRMdO2wkje20aDnXRD6rptHJ
 ugQSQypK6rEJeG6dacA==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a74f790 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=QtYS9pm54BT3p82qaUkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: p8p9VcbT7UJ04QWViCK-W4G3oPerDISp
X-Proofpoint-GUID: p8p9VcbT7UJ04QWViCK-W4G3oPerDISp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE2MyBTYWx0ZWRfX1xvYR79jS226
 jXvNi4TLIAhDwSbJgieXByUGiUU1R5tzhWAO5kFNmA5QvFM8pReVMDrdxEJ2dwVL0hURv3R8/nQ
 BKOY1PYNZ8QGuK4zq4ZGLt7iixPPr9A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060163
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



On 7/21/2026 9:20 AM, Max Chou wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add SiFive custom int8 matmul extension implied rules to enable the
> implied extensions of SiFive custom int8 matmul extension recursively.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---
>   target/riscv/cpu.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e643d7c7af..70baa054f9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2811,6 +2811,24 @@ static RISCVCPUImpliedExtsRule ZVFBFA_IMPLIED = {
>       },
>   };
>   
> +static RISCVCPUImpliedExtsRule XSFVQMACCDOD_IMPLIED = {
> +    .ext = CPU_CFG_OFFSET(ext_xsfvqmaccdod),
> +    .implied_multi_exts = {
> +        CPU_CFG_OFFSET(ext_zve32x),
> +
> +        RISCV_IMPLIED_EXTS_RULE_END
> +    },
> +};
> +
> +static RISCVCPUImpliedExtsRule XSFVQMACCQOQ_IMPLIED = {
> +    .ext = CPU_CFG_OFFSET(ext_xsfvqmaccqoq),
> +    .implied_multi_exts = {
> +        CPU_CFG_OFFSET(ext_zve32x),
> +
> +        RISCV_IMPLIED_EXTS_RULE_END
> +    },
> +};
> +
>   RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
>       &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
>       &RVM_IMPLIED, &RVV_IMPLIED, &RVG_IMPLIED,
> @@ -2832,6 +2850,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
>       &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED, &SHA_IMPLIED,
>       &SSCFG_IMPLIED, &SUPM_IMPLIED, &SSPM_IMPLIED, &SMCTR_IMPLIED,
>       &SSCTR_IMPLIED, &SSSTATEEN_IMPLIED,
> +    &XSFVQMACCDOD_IMPLIED, &XSFVQMACCQOQ_IMPLIED,

Not related to this patch but I wonder if we should put one rule per line
in this array.  Every once in a while we have to add a rule that is
in a line that already has a lot of stuff, then we need to change multiple
lines to accommodate the new rule.


As for the patch:



Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>





>       NULL
>   };
>   


