Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD16C43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 09:51:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjZmo-00023j-Du; Tue, 14 Jul 2026 05:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wjZmm-000234-Kf
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 05:50:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wjZmi-00035e-AK
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 05:50:44 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66E6Sjg63862218
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 09:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /9jRxHddWr5/69MwxIKP3gBixQB7Iwg53DvuHHUn6gk=; b=f6B07DamNdb9Opm1
 xvMCLDTokXjakwYkRCa2KHDla6l8YQ35dFO9He1jpQyIT86sx4hAGkvzNr91DSwl
 aBIIhCeTnNPjsKKsfBjYnKNcrvAPpGQH+EEUwprcbSC8aQi+r3xoQLJklxHXADDM
 G3hp5RTu84/9ZnsdORUn7jCt+u1/xwKc4rVBqndicoaCoPJQacAc7Gndohw9HyLe
 wlhFoSxk0SFbd6f99Tc1XSJblN0kJT0OQ3NAxErouthNu9Il4CWibUcSCW6+TJul
 Hs/q1Z3A70rvW5YTctpq+ZZbMSiSb+r1lTrMD7YySeaFleaEq4jUnNMVhXq2bMwV
 S5slqA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44j3622-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 09:50:28 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-81e735bcceaso16079837b3.3
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 02:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784022628; x=1784627428; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/9jRxHddWr5/69MwxIKP3gBixQB7Iwg53DvuHHUn6gk=;
 b=a6zCOmleA+Vq2jt6Z/Ktl8FHkUrIpNDfbF001M2TyTNvk8qTdrETaZZqGGBClKfNcB
 HNWztRUvV0IF0ESqNzB9Y5Z8YPoYpYAwWReif2u8SRqCr4Shj293cWV4WtEmQop1FUtl
 vIPZ9rtxryZI1We4DeeiXEIYuRCSySITHZA1+Q0sRJCeZeE9FV6ieboJhySk3rnw9fBr
 E3LruQLVF9Z4Tj9gwtWUOfrOm9U0e/rduSnhO24TLqsnHe3RCRzvR8Je840DL/rXT0ym
 GjRIv+rx672zuR7LLS8RMWMzVKpTMUIC0G7GFJK4ofbDWHsIubzBG5+foM1iqdLUt6Qd
 0PNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784022628; x=1784627428;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/9jRxHddWr5/69MwxIKP3gBixQB7Iwg53DvuHHUn6gk=;
 b=Uj6CTcV38J1XnO6s5l5OaV0/l6ekCYLYQRo/IKss4gV3ZCxdVGis8dFWM7K7hamnUw
 h18aCW+H1658a8nxgB86pi0mB4V2JTqYzuzh0Y0Iy9Fok252ydq7qPjzJM1yBBnyGYNA
 kq5Kh9o4+uIWTD5l4k9FaB2r7s6Pv9HNFgsyBEGrJSOA8o8SupDaojVJKA267vIXDsYY
 ZXH5w9KHXxco/2/hJuJfm+9axfq4sS07c8SNa8Ztm1Af4ujajQV+jMqEO1BPec2HznfG
 TtvIrAlHyDOHrKHNkjqOtClzRKbjcYLcRdiJ/uVkfxpmrTABlJ0B5eZRdmBwaUyj4Yqh
 yLKA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoQyZLWfgSbM5nG4YcUt4282+IFHgifCVh6Dt4wsa2aTxuxUdJfSWqHyauTt7Xe0N6u8GG10ZQy2Taq@nongnu.org
X-Gm-Message-State: AOJu0Yznm8tDHsQogmQH/mbyH0UZZ/Aslxcz96c+XWCdSIwLFsjUBrVe
 DeJW3oX8m23U7m6o2o2IiwAVVJy0+QyAr87nXhwNsFRkKlV35oVSaxSAkD6YubFuNRWXA6GrsgD
 6FdmJS2erricqjMsSJhfw09l3RFycefodqPRtl+ghBRubMpIpMYXIdxVOjA==
X-Gm-Gg: AfdE7clC3G0ICCRQFn31nZsZiYfluM+ejqDLbvBz08p2AHhimABbHIDBikq0tNwml8j
 fjhjF7Esr4itGKu04HJhPKcSsqpzhR1mIKeIjKnkqVnOndLCQrqVIQM24cnptUynE/YZNCKxHXf
 wkckQA2UAwQ0CrR+wBfxxgR7fL60f/e/hJ9cqDGGhT8naQfdyZS2M444a2+VZQPyPGJCAg6A7a9
 T7WBKc1lChmzoXU1b/vTAjGABahlY5uqCSxXYAoSjWSnxl4ki8B9w6Ms3YT19YKeJ6uOoOSN5u+
 Kufn5GZEvZCyEi+G4XXSPiex5NXD41YGVV39abhodi/pg5/4VSkCJJmlZyr8YTj/vshSLGQu7qf
 WXJL3wgZZubP9rMj7yuciarxWnW5xdPrY/oTrpJ/ppGvb
X-Received: by 2002:a05:690c:9a8d:b0:80d:f9bb:3d3c with SMTP id
 00721157ae682-81e90139c81mr89895227b3.36.1784022628186; 
 Tue, 14 Jul 2026 02:50:28 -0700 (PDT)
X-Received: by 2002:a05:690c:9a8d:b0:80d:f9bb:3d3c with SMTP id
 00721157ae682-81e90139c81mr89894917b3.36.1784022627451; 
 Tue, 14 Jul 2026 02:50:27 -0700 (PDT)
Received: from [192.168.68.105] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-81e6bc4285asm137628877b3.0.2026.07.14.02.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 02:50:26 -0700 (PDT)
Message-ID: <fa72c68a-141e-4b8a-9445-4131dd83f353@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 06:50:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] semihosting: add callback to set error
To: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: brian.cain@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 marco.liebel@oss.qualcomm.com, philmd@oss.qualcomm.com, ale@rev.ng,
 anjo@rev.ng, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1783973054.git.matheus.bernardino@oss.qualcomm.com>
 <df1607f5ee373a1ecaa6f88bb56fc64101d818f8.1783973054.git.matheus.bernardino@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <df1607f5ee373a1ecaa6f88bb56fc64101d818f8.1783973054.git.matheus.bernardino@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwMiBTYWx0ZWRfX3dUa9YwH5gNC
 JEpOv9baYCUbEIdFop5fq0y4YbklM8tpjBrgXo9hrFvvU5JqrrJlVJmHDhbXMiUqArg6dpCMfz9
 UdiG4z8+LPYuDqM6PGc6CIUTC9SA9yY=
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a560664 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kPOZBpqBqiv7Ng3vFtoA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: kkauOTyqx7TbB23Cp_SzFQ7eyKVjn9Je
X-Proofpoint-ORIG-GUID: kkauOTyqx7TbB23Cp_SzFQ7eyKVjn9Je
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwMiBTYWx0ZWRfXzAL1aV4PVrgq
 jWdc55hTB3XCPDkzyXBRCFFb+MENqyJOioLn3pJAwreG09nKhwWZtl6F1x5nVI6Mnw6JGmdlVxD
 is6LYMKKb9j/2olMgdDh2uRGPYW9Ddnq229eNmoJwgwFDpF45wO7xahSYJvBM9vD7ZQAcXwhYk7
 77NgoO5bCgyX0BurzolcMvE1R6/rj84ZuhxxEmd/Gok3tdeB40Tt1xHPnJ0iNAS3LTXFEeFZZxW
 6oCmPESfpHoMGMyzMv7yp6TIiKDwp6wFPM+e3wp72JkyRUK2j+w8VU2k/T+JW1YqLA8ToCs+8dQ
 7icMMRLPaDpsHTfXVU6BIxgZar9lcY8Z0qAy0oG1n391+JJil8dR3s+DoRmukShzK4cWfwMT2q5
 l0jnH5cMBG4T//Uy46jrQ2xsU1EaCmdbZmicENQB4LhbDgsay3uLGueR6y2dPrVBGqRJ1aiqnlq
 aNe0O7FlKOz2e71Y5og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140102
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



On 7/13/2026 5:07 PM, Matheus Tavares Bernardino wrote:
> This is currently unused by existing semihosting targets, but it will be
> used by hexagon.
> 
> Signed-off-by: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
> ---

I suggest making it patch 06 in the series, right before you use in patch 7.  You
can even mention "next patch will use it" in the commit msg for extra clarity.

As for the code:

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   include/semihosting/common-semi.h | 1 +
>   semihosting/arm-compat-semi.c     | 1 +
>   target/arm/common-semi-target.c   | 4 ++++
>   target/riscv/common-semi-target.c | 4 ++++
>   4 files changed, 10 insertions(+)
> 
> diff --git a/include/semihosting/common-semi.h b/include/semihosting/common-semi.h
> index aa511a46f42..a11905ef4ef 100644
> --- a/include/semihosting/common-semi.h
> +++ b/include/semihosting/common-semi.h
> @@ -37,6 +37,7 @@
>   void do_common_semihosting(CPUState *cs);
>   uint64_t common_semi_arg(CPUState *cs, int argno);
>   void common_semi_set_ret(CPUState *cs, uint64_t ret);
> +void common_semi_set_err(CPUState *cs, int err);
>   bool is_64bit_semihosting(CPUArchState *env);
>   bool common_semi_sys_exit_is_extended(CPUState *cs);
>   uint64_t common_semi_stack_bottom(CPUState *cs);
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 5e5f181b908..c54753f696f 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -237,6 +237,7 @@ static void common_semi_cb(CPUState *cs, uint64_t ret, int err)
>           ts->swi_errno = err;
>   #else
>           syscall_err = err;
> +        common_semi_set_err(cs, err);
>   #endif
>       }
>       common_semi_set_ret(cs, ret);
> diff --git a/target/arm/common-semi-target.c b/target/arm/common-semi-target.c
> index 2b77ce9c17b..38d52deb3d6 100644
> --- a/target/arm/common-semi-target.c
> +++ b/target/arm/common-semi-target.c
> @@ -34,6 +34,10 @@ void common_semi_set_ret(CPUState *cs, uint64_t ret)
>       }
>   }
>   
> +void common_semi_set_err(CPUState *cs, int err)
> +{
> +}
> +
>   bool common_semi_sys_exit_is_extended(CPUState *cs)
>   {
>       return is_a64(cpu_env(cs));
> diff --git a/target/riscv/common-semi-target.c b/target/riscv/common-semi-target.c
> index aeaeb88d536..38a00e160c3 100644
> --- a/target/riscv/common-semi-target.c
> +++ b/target/riscv/common-semi-target.c
> @@ -26,6 +26,10 @@ void common_semi_set_ret(CPUState *cs, uint64_t ret)
>       env->gpr[xA0] = ret;
>   }
>   
> +void common_semi_set_err(CPUState *cs, int err)
> +{
> +}
> +
>   bool is_64bit_semihosting(CPUArchState *env)
>   {
>       return riscv_cpu_mxl(env) != MXL_RV32;


