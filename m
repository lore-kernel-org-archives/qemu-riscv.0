Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995A6C531CB
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 11:13:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wmrMV-00057r-BV; Thu, 23 Jul 2026 07:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wmrMQ-00057Q-Vd
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2026 07:13:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wmrMO-0004DK-2R
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2026 07:13:06 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66N8qX1J3044796
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 11:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qLmqx/qzHQSf++rK7BlvdfnI6uRSd9Z25dCIQExYcgc=; b=VVidWoWwWcTIvsdY
 zwNA3bOYEakdWzOKHKkqw3Se19fUxQlk3NYb83xxA0RU8Q11/81QIIMXGK6VP90h
 Gc+1w/l857EKTlfm5JEOer9TVIzJBEna/7hiYXzkKY/ToxFAdrL1gRSBLVSojTjH
 JbVHj+jF5jnnqY/SYH2zWKM+HUMb9s92c8oWB9P21/Qz9kwbJRPxPSkWDJ9JC8pg
 j5tjtVKnT2gDoGyXfy9JxDiGGlggdP8QtMSBJ3pRRp/5xCUFfNMDMgimHeSLUbYE
 +EdQpC3LzqLjhBRQF0+bogKQfvqWpjBbvaSVSfeiZXR4l0tsez9dO2ljiGw64e4g
 3cX9DQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq8skt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 11:12:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e5fc4c7e9so62379685a.3
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 04:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784805178; x=1785409978; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qLmqx/qzHQSf++rK7BlvdfnI6uRSd9Z25dCIQExYcgc=;
 b=QO6FSShzIMyGQmfPG+y8a90eJKriX+G12vMuSDJBEgApPZQEZYYAMSlcC3sMIj7NHJ
 E4t71/ngcJqsxan5wFe69TIl28vvPZZSrba6PKwk6P8wJiOSB6DdyuhYJB0cLtzo8frV
 uoN1dDNURUZeSOk4UnYs1zMmAcVZw1oB0DsfpvxZ3c2EyFBvr8D7Tm7IZj/ae8FpmQJn
 y/IFh0fBUNg8irot+ngJkKA9eqyh8Pz79E1S31n3hvMeEVt1Y3jyr0stJLXxjpW8fKXG
 xveeD0XvAN1S0f7uUs4rdwLe+P8ONErB6Vc46zkwlP6PHYQAfq9Ddi1AvVwcxaHDYYIP
 8wYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784805178; x=1785409978;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qLmqx/qzHQSf++rK7BlvdfnI6uRSd9Z25dCIQExYcgc=;
 b=CivFRZHmdpgEmWWzaq3JiTq0Ylx2DJu6tNiCUUc2W3fsbIwr3QntctIpjEy14hxPu4
 7LO30LDbtaG2/yO+cpO6HtvVreLeQ2eb13pAJa6UiRus7WzVNaHVw5Upu2L/AFTvWv1K
 xuSRc+T832j67bpnxlQXdwQLA/ITsF5SsYupAB37vE71oz2zNGhE8Y9F/TMPXfYlV+Ol
 ZqlD6CNn/OC27Ht0Q2OJ4QeLijfCTd32VJH2sO87MFlnoOpPVlgGneyOIuSvKu3pwAqK
 FURw43DvMHHDn7wvU6DSRs6urtV1cNmYwGhkjVSzlH7ukqS6tuKKIdwJ0CPYaS4jzAxz
 Innw==
X-Gm-Message-State: AOJu0YzUsR6mYHJWrK4ogqOxuqgPBGxLKn4nkuDjdXyo05Yq4WQ6OxTF
 aEZw1pb3DFVDjyAf0ZciSS576GxczQXm/7qyNKdHC2L6XZ8kSonftjkYzJ5gpr0T/+Geam4P3LY
 n2P+mNOsvJqiGdGQhBrHJIyw0mj2p11HtLhQVOU7PZAZ1loRBMyihZHKhog==
X-Gm-Gg: AR+sD139GFxP7Xpu4/XGDMcDDf1Ls31YtgqUSNUbtiXKjR9f1SFG4lgtukuKHBgxWct
 BsOyeNTfa+MuZTdU9NTrCuycy1JLqXdoLqSmGA/6h0wHFsmF1Zh06hI9On71BcvfFyFUv7SOgI/
 t4R+NkIsIUBgKKwIt/1EKZZy7emzjyrTU/qQ+Z3jOa/SmJ/cHSZim6UywVm33/TaE5aqdfrEhMD
 aLx8zQ1PnbDsDI6LNWuNsWztGzmrxqy8eNx9Q+toCit+dFIMqNT7hpO03NZ7m/TL8JOwSD2Zfpq
 kob060/fWx23JzqITdEZY4cAu9+kl6jb+7A3B7RiqoSl0vs90wayMRFPHPtzdqWPckpjUTGVmXB
 /ArUcoGuc9oTn9qqnAT3/yE03CRU7T0O57zMuSg==
X-Received: by 2002:a05:620a:4625:b0:92e:5259:1154 with SMTP id
 af79cd13be357-9310363595amr274550385a.39.1784805177827; 
 Thu, 23 Jul 2026 04:12:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4625:b0:92e:5259:1154 with SMTP id
 af79cd13be357-9310363595amr274547085a.39.1784805177343; 
 Thu, 23 Jul 2026 04:12:57 -0700 (PDT)
Received: from [192.168.68.107] ([152.234.122.204])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-930f6a88b88sm388862185a.42.2026.07.23.04.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 04:12:56 -0700 (PDT)
Message-ID: <0d68a8df-d742-497c-a59a-aab6cda454c5@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 08:12:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix memory leak in riscv_trigger_unrealize()
To: Zeng Chi <zeng_chi911@163.com>, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, zengchi@kylinos.cn
References: <20260723095911.3951185-1-zeng_chi911@163.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723095911.3951185-1-zeng_chi911@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExMCBTYWx0ZWRfX9gjcpR1lDW5K
 TEtAs91vS9Q31A4kPsLkGRzHe4oWVeM+hKbPq7V22kbD72BT+W/2AN4DRNmV0uySs0WFOFbAKLg
 NrS0aW/FtP/vzUQLPmiqT3XSVTwJSUI=
X-Proofpoint-ORIG-GUID: 3X7GTWJVVDwcZWgDXi8lj6XbVV5ldiDb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExMCBTYWx0ZWRfXxRdsvwBgIwck
 HCibpLZQgTIOc+GTHaxTxFtNCKBCtkso5MdKO2z6tzu1gf06WvepocBHylz96bwdXtd2nNbtAVy
 ciVzIldhqMXGX4sok77r25QrP59x6FO0r5TiK9h/wAMXyIsakHqMbWpZTOmhRoGQnJrrY7bGGMx
 rLEKKJKFOLKgt5TRlQAU7ZsW8bV7oD132yQpZwd72ylBeWQnrsfwBAbTFtAo0+mLF2FtMnOhE9L
 jbq+nZ1yqswmjSdyi6GCoKEd9OHLwFlBkrkKJdrvXuf6EUCBQjbBPZG9JZiG79j18Y4pHakqqQ4
 aDNm7Sj+jTJJEc3ScLNfmuHnNcK12+51cwcWduVEXqTPK1TxHg4k1N22qqWWjNy1dNQQBdI3Hi3
 SgtOQt7AlG5R57x+J+2jd7+kKU9/+Wx9Y/sb7lf6xxOP1q/FJ2fTWi5sh2bO2AEtq6+mLy3/xxA
 9XKDbN8A+2NpQ2BTXJg==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61f73b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=J0RmenBMOwS19r/fhzI3tQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wZvz4ChZffczwv6EFa0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3X7GTWJVVDwcZWgDXi8lj6XbVV5ldiDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230110
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



On 7/23/2026 6:59 AM, Zeng Chi wrote:
> From: Zeng Chi <zengchi@kylinos.cn>
> 
> In riscv_trigger_unrealize(), the per-trigger QEMUTimer objects are
> created in riscv_trigger_realize() using timer_new_ns().  However,
> unrealize only calls timer_del() to cancel them, but never frees the
> timer objects themselves. This results in a memory leak every time a
> CPU instance is unrealized (e.g., during hot-unplug or machine teardown).
> 
> Fix it by calling timer_free() for each timer after timer_del().

I made the assumption that timer_del() calls g_free() under the hood.  Seems
like the best assumption is always to not make assumptions ...

> 
> Fixes: 820552a92e32 ("target/riscv: dynamic alloc of debug trigger arrays")
> Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/debug.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
> index 3c0fe70101..ffbdc17023 100644
> --- a/target/riscv/tcg/debug.c
> +++ b/target/riscv/tcg/debug.c
> @@ -1081,6 +1081,7 @@ void riscv_trigger_unrealize(CPURISCVState *env)
>   
>       for (int i = 0; i < env->num_triggers; i++) {
>           timer_del(env->itrigger_timer[i]);
> +        timer_free(env->itrigger_timer[i]);
>       }
>       g_free(env->itrigger_timer);
>   }


