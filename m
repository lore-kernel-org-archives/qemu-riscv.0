Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F11C5B56A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 18:14:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuDSy-0000mQ-4z; Wed, 12 Aug 2026 14:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wuDSw-0000io-9p
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 14:14:14 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wuDSu-0006ep-KM
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 14:14:13 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67CI8gMJ918289
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 18:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gi+YmZUFhZ1/osyalKdvaj1XG5F24GPcrW5SATjvXfQ=; b=R7zFrwqjy2Npf4a9
 CLBuR30jJ+JOnsXKkxR1lNkP7/15/nxkohcIlx0/lYXeQb4KYF4LCv35OoAwILhn
 vEsf6Mfk6XCm04Te1MjGvHHDhb7UMqLhmPUvKiewh55sM3xAP5symywcF7LXURFl
 gyGJjopMoPjj4ZDLVXcbJOjL7AjeAz/XloDaCGO9sRNcVrD7BcFRVX/rh0ZnI5ok
 yZRrQI/KunDIpT1+Fxo0xd4CjFizn7UZeqUd2s3mo2iAS1XOe69YkuMlem1aMrIg
 cUTFPtDYx2B1xctPehD6uT4JCTJvKK18rOZo13V0w4qW0c9HrH2iDn8YDneGtewD
 Ennegg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0sk41g8u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 18:14:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8f08560ea44so13847166d6.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786558448; x=1787163248; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gi+YmZUFhZ1/osyalKdvaj1XG5F24GPcrW5SATjvXfQ=;
 b=KOXBjMzEvvwh2IXqSI5Tk5EuJ1JDJ78F+c7jM5+fwTBQEzHSAke2Em1MnjpuL/ZGT0
 R5NSjAZP9IKvN+WVsZdZUrLdvyOSv64Ez2kgzUL8IVcOQzMMzAxgisD2Auw4pM0T/Tu/
 VD2DVX6LNzGKkMzz+WqzI8Df/K0Nera0NTKwslfRR8/eV79G/KUTtMtxGHLaV1tNeMw0
 bQddItrEuzkYcCbNTukd39Q8rdEJR0poE7+tAWTQBSZI2ADpaXsRufmksa7/rMOtd5Zx
 MpPJrEITF7ZpnD78lBQBL2le8agmxeaWAbfGf19ZGmIdwfM+7bsZNahuJoNZkDU4JaxA
 BkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786558448; x=1787163248;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gi+YmZUFhZ1/osyalKdvaj1XG5F24GPcrW5SATjvXfQ=;
 b=AyCm9Yse6CKHLB1i15vBRymDQcq+BOm8ARrU+T4PkdPSVrMv0HjcwcLGxOhHWVuiez
 21y1JLkkyuLxA3ALsIr+bUUFPhiFGp/Sd4B2JZ+xytgMQetWvkTj8hh4dW4pF61OqNvX
 6MysPO4Woh25hv0hyAC+L5xmoYrwRbhRHAsSBsgX82Lp4/vTfhC5vCdm5bCy8qusU8H6
 qQvFYW3iJo3v+DcyRbGwXIYpCCktX/HMiy5hogiGFR4eZY3I6aXOzhAaP+IsvyvR16AV
 nt2vJbJ0W3jKfc1gM5k+HtGjA3z8VtLvSHwUOvAV4v3J4xFVBZAHevZ1DGSCAa8XdXXm
 4CGw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq+aDNMYPi5yrfil025zzSD8R31xC1C1/kxVxRKWaeK9Ms2ByvB8wqxRmSuRYfctrmZIFfe4r2JM5is@nongnu.org
X-Gm-Message-State: AOJu0YwK1zAsrZxXHFhDjFdxQWUJ/m+Hkb0a5e7HuWvYYSDnIUlOOusq
 sjvBcjtafP/EqCNgoI4USzS8yevvcxjurOSo99VzfmXhv0f2vL5OXd9OExs7qbM2uqx2MTdudYo
 E31cl7+y2XUgzjGdXO8FqbXAURaNdOFhmdWZztnSYctNoDxrKkTss2vXTOA==
X-Gm-Gg: AR+sD11Ux0s3+vZbJ6uYFIDjSmC80onLgKcLJMrdEAXGHX3epueqFuaqOUyiruUAS/7
 LbxWZs8V31N5yz5dDftjEsPFRmj0c+sOiN1qurMgZzPtWQqK3fC0c/bqKJOdSW2u7HVgZvGWOmW
 VzNNs16cpYfo6+6gH9DBHqES0rWxaz/GmRosaMXWpoGtseU63HJzQcES6InXRmkFjzo7oNS27Vh
 DweTebQEFQI8aF8oG7xj9SuPVB2nDyFuZ4zGg4xwEMszj3NMLEGAv/m0nOh7I1h0uiZ8V0f0bqX
 DLGkxWAgfeTFRMUwLyP6OGbswVE6PjQ6pQihnkEsEpdxrj+JvGmu5++SyHRjbwS5zYC7NzpkcBq
 H5sxPrInUqqGX2t7QxUzg5o7nOGuE++fizZoz
X-Received: by 2002:a05:622a:1aa3:b0:51c:1132:c80d with SMTP id
 d75a77b69052e-52d73d9227fmr398061cf.28.1786558447519; 
 Wed, 12 Aug 2026 11:14:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa3:b0:51c:1132:c80d with SMTP id
 d75a77b69052e-52d73d9227fmr397321cf.28.1786558446962; 
 Wed, 12 Aug 2026 11:14:06 -0700 (PDT)
Received: from [192.168.68.100] ([177.198.100.18])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-936b5f136a8sm182900385a.22.2026.08.12.11.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 11:14:06 -0700 (PDT)
Message-ID: <91247095-8bb1-4c0e-a27a-9419eddd7792@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 15:14:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] target/riscv/cpu: List one implied-ext rule per
 line
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20260812174417.2468981-1-max.chou@sifive.com>
 <20260812174417.2468981-3-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260812174417.2468981-3-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZpSRT1xStA7Aw9d_sFMSHrvgI4NCxgON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0NSBTYWx0ZWRfXwuQ+ITlU3U4q
 QLLjIS2ye75j8eloG+Dj1dMy7bHk9PMHROpvzbs5V6sdDqbixKl9+MwRs9aPB/lCvUHOomDZGc3
 9bBkpUKoWFZu1Zg8m/j6kCiSy9AUT7DHu1lE+9Y8Di+t4cOvlcXWSYM5mfzYFLy9yxSNDfuPi5Y
 W5DSKUJxtPIv6uDTZDZdy4VtBk4y0a3VftOzdqwhsAicmniOuYB9XNounTTl+0SudX8lT8xGCdh
 e6Ezh7Q+S9LxFJUe6Q9lNB8ChAqrX8hHZk20paCkFWmW3ERDrGPwtK/wuHNI07G+drOVXOGpRLX
 sUVLJS8tMvuAp+R3CYQklLwWb5hKHKoBefOpEM5yOjK0OiN34bewqg+uK9J966P9BpWuBmTXA/I
 RNUAa1oUmW52FZ0knJDKWYIDfIxWHcs8AKjaOnDol0AOlwYrALw0cH+n1C9w/kf5+x6brjR7mQu
 +V28fbkgLT0gFPHAygA==
X-Authority-Analysis: v=2.4 cv=E8n9Y6dl c=1 sm=1 tr=0 ts=6a7cb7f0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=el0UrXJS4K3zujXh0Vdy/w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pFyQfRViAAAA:8 a=3YQCPPdjfU7-w7EmfpgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0NSBTYWx0ZWRfX5kw6Yi0Hi6H6
 X7EDc2jDhyHxFePX4CC7FgqZ5jIMhVsiqxPflCtgVgHbmmTzhrXriWicYMo8xT15YBZh/5r5UFe
 thLBt+UHPj6S+5EV/Ww6/JjAI1hBLYY=
X-Proofpoint-ORIG-GUID: ZpSRT1xStA7Aw9d_sFMSHrvgI4NCxgON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120145
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=unavailable autolearn_force=no
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



On 8/12/2026 2:44 PM, Max Chou wrote:
> Every entry added to riscv_multi_ext_implied_rules[] currently has to
> reflow whatever line it lands on, since entries are packed several
> per line. List one rule per line instead so future additions are a
> pure append.
> 
> Suggested-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c | 58 +++++++++++++++++++++++++++++++++++-----------
>   1 file changed, 44 insertions(+), 14 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e643d7c7af7..fffb92ff110 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2818,20 +2818,50 @@ RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
>   };
>   
>   RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
> -    &ZCB_IMPLIED, &ZCD_IMPLIED, &ZCE_IMPLIED,
> -    &ZCF_IMPLIED, &ZCMP_IMPLIED, &ZCMT_IMPLIED,
> -    &ZDINX_IMPLIED, &ZFA_IMPLIED, &ZFBFMIN_IMPLIED,
> -    &ZFH_IMPLIED, &ZFHMIN_IMPLIED, &ZFINX_IMPLIED,
> -    &ZHINX_IMPLIED, &ZHINXMIN_IMPLIED, &ZICNTR_IMPLIED,
> -    &ZIHPM_IMPLIED, &ZK_IMPLIED, &ZKN_IMPLIED,
> -    &ZKS_IMPLIED, &ZVBB_IMPLIED, &ZVE32F_IMPLIED,
> -    &ZVE32X_IMPLIED, &ZVE64D_IMPLIED, &ZVE64F_IMPLIED, &ZVE64X_IMPLIED,
> -    &ZVFBFA_IMPLIED, &ZVFBFMIN_IMPLIED, &ZVFBFWMA_IMPLIED,
> -    &ZVFH_IMPLIED, &ZVFHMIN_IMPLIED, &ZVKN_IMPLIED,
> -    &ZVKNC_IMPLIED, &ZVKNG_IMPLIED, &ZVKNHB_IMPLIED,
> -    &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED, &SHA_IMPLIED,
> -    &SSCFG_IMPLIED, &SUPM_IMPLIED, &SSPM_IMPLIED, &SMCTR_IMPLIED,
> -    &SSCTR_IMPLIED, &SSSTATEEN_IMPLIED,
> +    &ZCB_IMPLIED,
> +    &ZCD_IMPLIED,
> +    &ZCE_IMPLIED,
> +    &ZCF_IMPLIED,
> +    &ZCMP_IMPLIED,
> +    &ZCMT_IMPLIED,
> +    &ZDINX_IMPLIED,
> +    &ZFA_IMPLIED,
> +    &ZFBFMIN_IMPLIED,
> +    &ZFH_IMPLIED,
> +    &ZFHMIN_IMPLIED,
> +    &ZFINX_IMPLIED,
> +    &ZHINX_IMPLIED,
> +    &ZHINXMIN_IMPLIED,
> +    &ZICNTR_IMPLIED,
> +    &ZIHPM_IMPLIED,
> +    &ZK_IMPLIED,
> +    &ZKN_IMPLIED,
> +    &ZKS_IMPLIED,
> +    &ZVBB_IMPLIED,
> +    &ZVE32F_IMPLIED,
> +    &ZVE32X_IMPLIED,
> +    &ZVE64D_IMPLIED,
> +    &ZVE64F_IMPLIED,
> +    &ZVE64X_IMPLIED,
> +    &ZVFBFA_IMPLIED,
> +    &ZVFBFMIN_IMPLIED,
> +    &ZVFBFWMA_IMPLIED,
> +    &ZVFH_IMPLIED,
> +    &ZVFHMIN_IMPLIED,
> +    &ZVKN_IMPLIED,
> +    &ZVKNC_IMPLIED,
> +    &ZVKNG_IMPLIED,
> +    &ZVKNHB_IMPLIED,
> +    &ZVKS_IMPLIED,
> +    &ZVKSC_IMPLIED,
> +    &ZVKSG_IMPLIED,
> +    &SHA_IMPLIED,
> +    &SSCFG_IMPLIED,
> +    &SUPM_IMPLIED,
> +    &SSPM_IMPLIED,
> +    &SMCTR_IMPLIED,
> +    &SSCTR_IMPLIED,
> +    &SSSTATEEN_IMPLIED,
>       NULL
>   };
>   


