Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0A0606A321
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlMggtgg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kDyUYImy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQWBV-0002vX-Pk; Mon, 09 Nov 2026 15:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWBS-0002qo-TW
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:41:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWBR-0000H4-78
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:41:42 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHF4w370246
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V8LA1K2MhY3qSGqrMiwaC9cEb49HUeOpHVR3klfcxpQ=; b=YlMggtggOVqEmFBk
 R8/whBIbR7AH+BIAYspMI2wKNgUttysmezcwv2TmYLK8reDZxBcBfk15eqCTcAlv
 vdCt0iWfJKzdbVd9U0FjyOmt/M52aIETgq/e7OVB6hWloSrttU4LgyiHNpI0L7DP
 w10N3E65ZNOS3EcbuN7bhK/RZkVrZ0O4XIZGwQYm/ZClswf16SsyXiQ5KsPpA9yP
 jOJ+4uclMoTRryQnjgeHfJ9MI/Mye8JR58nKOIlEceXQlGpO2voIbLwalpVrjoWM
 qPlvgc1b8kW0i2l+c73GbgVN7r6Px6c1x86pHyyj02ZfnCDOO7q1p83C9W/JV1Un
 JmEj0Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58aq16-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:41:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-532f343a55bso23955651cf.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794256898; x=1794861698; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=V8LA1K2MhY3qSGqrMiwaC9cEb49HUeOpHVR3klfcxpQ=;
 b=kDyUYImyXFPs9kGnFshyMFA3/cxWzjg0Kwlqc9bXSumlVsB4bLLNavkLUwWTGa0E3r
 4GcotaJBXtVDVYwzFS7e7tM+3WuFA6hpCD0iIGPUMI1wY4Cqvwfles+egv7hupd/4NsG
 xlrbQfsMCskce94SMPai0rgkdpSp2A27m0SZAdVkkrUCuSzJtyO7HfUE0qVoZ/XM0Vst
 QHAFIUGgxH+iXbysUUCFZkrOU/nG4ap+b5bRUXRaCTYsypbwny+awL7GIJuSO9ve1T5d
 egJ923jZzzmLhV9jqQvARsfCUm6KUqRH2axjVTruqoUd6TpxqLO5+7s1f2cjniUbXfqr
 gRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794256898; x=1794861698;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=V8LA1K2MhY3qSGqrMiwaC9cEb49HUeOpHVR3klfcxpQ=;
 b=I3qhcnaXtSJg3HViRf4AHNR/c7BkGp9DzOA1C1f7TYLinMu+P0JLzwRn1dLOVTdxKI
 PHuFRq34UClVoRdxWstW54yd+1LNCbDx8yzagJ7wb+xrORxKl1Lodc3XU/qb0Hmhztkq
 hZMqHy4q+Zf3kd6Ck2vlK4BhqB8Zy3qggQO2Kk1tZZ21ZC/tFd7vgX1gh+UeNoeK1u9Y
 nO+AXTBwKE8m3JCP2VQQgMG3F/lpxzqNoXsY6Ao7wz7lYj/N+mjH6kJlUmpJcct9YQ/t
 UrYurO/azM0KLazEtz62mbtE4O0QzLWhDmJoWmo7whlADdCbKVyH0iZf0esROAjdM8Qv
 a2Nw==
X-Forwarded-Encrypted: i=1;
 AL+hErH6LRKhY4n4KB/YNt9eR4uLvCQ1dquqdsmXPtUd+OMHzcDdBL9mUITSzVK5cyHWGZxWMnu7ROJ5TOPF@nongnu.org
X-Gm-Message-State: APuU4Z9QRmkPm4HNWShLhVa84bqv9efBV47IUImuLZkGQ/3CTnY66z8e
 QJm7xykCSjGpf+CuHXG9AAbL9XJCzwrSkbRiWTHA8hmwx8ufNxOIsLLVPxKl9RjllICJkmp6v23
 DY7rL9+vvBpbeEA6Vg4/K2/y3V2N9hWU7zAMKryUg4Ooi1/nV/NuGP18k/g==
X-Gm-Gg: AYBFou35X0LbWXyi85NAfM4GmKfCWL8OAqMxRNxYElUCLdW6yvLkeke3b2AC++4OLQV
 ZmnUDx4Qh/Ka+lsSTWfo2YPTmCNauF1ETPULTVcOaZECjROlZpnbF9kd+0rBcbZnrigSAYjSduU
 1g1SxxrD37BdrA/fVz3yFrqOvSrJdS7lUs9pVH3id+AP+s0VaVSKLNP0zQRoI7cjWxtFkQjQloy
 ZdYZzEt1tB3ChAVDo7Bi9+BTEK5BI325rf1cE9KUv2ckq/eY0zALgdzVy1+6cmbNcGqTmpMWLVN
 4EsArY1088ZeuK53unI0TO6uey3Xehjug5YtO9Ua9XOWtayUsW8Uq1tuKLB2HZtPzpo7eT6cgzI
 Gq+7S2IzJXLlhm8C5jifx+ZmeA7qYyN03uaX+EoKL29FbjXUqMUSUDQgQdqC87RyQ0V6fiCrcbq
 9O0sVZsnJK
X-Received: by 2002:a05:622a:1aa8:b0:535:f9f0:19c1 with SMTP id
 d75a77b69052e-5552a45dfbbmr8061721cf.45.1794256898515; 
 Mon, 09 Nov 2026 12:41:38 -0800 (PST)
X-Received: by 2002:a05:622a:1aa8:b0:535:f9f0:19c1 with SMTP id
 d75a77b69052e-5552a45dfbbmr8061441cf.45.1794256897951; 
 Mon, 09 Nov 2026 12:41:37 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5550be2e592sm6195011cf.24.2026.11.09.12.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:41:37 -0800 (PST)
Message-ID: <ff22dc05-bf64-4d24-bc51-9b4cc38ba16f@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:41:34 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 31/38] target/riscv: Add implied rules for
 Zvfqwbdota8f extension
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
 <20261104194155.679241-32-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-32-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX4pW0MhF2W1Dp
 pQLCYUo13Ux+O5q0HrIyGoWEkw5S6tPaCnQscCsXvLd4YPmMdO6K7kRORqSbuJb4SDme5GYdz34
 rSqc1Pm4s3hd+UplMnUzkl5r9Bh/0emahK6qrJZqnl7C5VlhOhBqWmafbTEHoq+ia8uJSF3hQpM
 RkoKjl0IVWfwIdQM/uRMVxIEs82eUWHEDsHMFi10+vzcxAyFlRyv3Rxmubi/uWXxwfIz0umpp90
 bdYCNBaEB9JNL3TraLBz95ugzfRCFKuW+dVT9GwmDvrqhBzu1lxY1K00+fXhgtwEdM77vl+GfOL
 nnP87KLjSRhR3WBmLv/dAb4n7CiHanA8SLu8LHUxcJ1qayVhjy7sxyd/6OVtu8y19mUvnlxxzr1
 /FEQmgsSIYz+exLlz829mRjU9BHPg+jzg8sGi8zQON7cs1WeO+eFPT3BE7y/1/NYitQTRN1dmpV
 NwJt5YE6Cyt1tyDj6Wg==
X-Proofpoint-ORIG-GUID: 64V4sGKZwBKTabc9NtpDcPYxYrzii0qm
X-Proofpoint-GUID: 64V4sGKZwBKTabc9NtpDcPYxYrzii0qm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX7fIFwbRG+Tby
 TGncuPeB6h1veDQAbmPOZy+S/qs8ZbYPYQodEliq7AZRSNKhMj07ys9tfgJ2VjXy5yn/rJv66vX
 GEk0u3IuyHq8nzZWAjQjrh6Lmr39ZdQ=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af23003 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=XYTSCjYpITQbR8rEsFMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090082
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



On 11/4/2026 4:41 PM, Max Chou wrote:
> Add implied rules to enable the implied extensions of Zvfqwbdota8f
> extension recursively.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b4a9f2c3e30..0a35bc7c416 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2892,6 +2892,15 @@ static RISCVCPUImpliedExtsRule ZVFQWDOTA8F_IMPLIED = {
>       },
>   };
>   
> +static RISCVCPUImpliedExtsRule ZVFQWBDOTA8F_IMPLIED = {
> +    .ext = CPU_CFG_OFFSET(ext_zvfqwbdota8f),
> +    .implied_multi_exts = {
> +        CPU_CFG_OFFSET(ext_zve32f),
> +
> +        RISCV_IMPLIED_EXTS_RULE_END
> +    },
> +};
> +
>   static RISCVCPUImpliedExtsRule ZVFWBDOTA16BF_IMPLIED = {
>       .ext = CPU_CFG_OFFSET(ext_zvfwbdota16bf),
>       .implied_multi_exts = {
> @@ -3125,6 +3134,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
>       &ZVFBFWMA_IMPLIED,
>       &ZVFH_IMPLIED,
>       &ZVFHMIN_IMPLIED,
> +    &ZVFQWBDOTA8F_IMPLIED,
>       &ZVFQWDOTA8F_IMPLIED,
>       &ZVFWBDOTA16BF_IMPLIED,
>       &ZVFWDOTA16BF_IMPLIED,


