Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36A9CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 11:38:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV6PH-0001kT-RE; Thu, 04 Jun 2026 07:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV6PG-0001gp-7u
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 07:38:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV6PE-0000XM-N1
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 07:38:37 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654BAmbR994784
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 11:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lM/zJzIOjsjTZLWW7UipFa6yGWRw1RZ9nBhwHuBNwhA=; b=Q6Erl/AfoJIeSEWB
 xkrMqC5ena7of77RG93RMfe5g+y19dHrE18ubdXE7sAhdNIIWT5HwqBWDTfpgCWu
 B9VHFZkDM/g1rVnj/J93+FiEDPhaOHwA5wKbw6Lek95yvvY2UV1y1mAN72wyiJzj
 BuO8Uq7GRbNjJaXOc25CD3LJAbh6m6BfbKTHMlcJuhBRFLEcT0QS0OYfCWUStqMb
 d8qx5Lut1Axqf3XxTrnv1srwYzIRXw4h/t3SCB8IsROhbaSAy9+X02SdpuiEsRqo
 IHrUMFkiiFhAEdRzp0u8GcojMz0X08YnbaNpBZxMpH6kSDXdP0BtnOQhEpYclGa/
 4q5UJA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek374sac4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 11:38:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-59d595bfd94so313513e0c.3
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 04:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780573114; x=1781177914; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lM/zJzIOjsjTZLWW7UipFa6yGWRw1RZ9nBhwHuBNwhA=;
 b=gok3O6HcjqamkqGdYaNFQRjzbrX/g3iZVdOMjWrUGmZG/udrtx9qGDOwFNCdwwl94b
 anDsiMa61Ld/cNr/oQqk1SiLMcithF0hyqHcPsM3Kf3MBTYSE4i2nIXSCKO1C6Dj/PYU
 j+0Ik0DgVUeKwCBUae5XkOaCuC4RPyrW+M5622jRJProAmIdCpAkr2H2Ma+HciBnZM2C
 iq77dVt0JgRRGrXG6dS7osJzq2VxQCSX8f3+FVuONsCo8PUfX9mh3EE85kEpT4n9qXln
 sualgR1OQnAZqsrJpPxCP+oVoAOMy4hDNocoG/AlMCkcW2a6PNz6GGEVGj6OGzTIsX8W
 wA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780573114; x=1781177914;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lM/zJzIOjsjTZLWW7UipFa6yGWRw1RZ9nBhwHuBNwhA=;
 b=pefuQ1ly2SmEguIiIF+p4BxKyrFUuBnEVtBU+l9zQcjNVJKo81TwQBY/xnEJP6/eu9
 OTb0Zey1wpUy/QI6BTycP+A3UPhsOHF2JiEetlrD0YQAiHiSZoNNgpd2RmV2wMvNL3jg
 MGtdM17tv89kZfJwR8iBkSluf10U90jrrZqAHy3cVZv26pGEYyRUvcXNaMi4BihI2bS3
 A0rDxzyU8p4fca5e5On9WFM2kv865PEMDdzc7Pjwk7zDXqn9UeUm/2e5vuZHOmTnfAe3
 fZLxRqJAcdVRkIlDQrZonSRZbRSoqG0QdoHjvAAKXGIP/Kv6WfCGcinub7ziGtdUYx32
 QbAA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/HtUJGUZPnlh75mR4adDYjO3IKM+YvhQsLWOUitTVRr9jDSSIZYC1u6ufae6VEp3BgQ3rfWBd0g50S@nongnu.org
X-Gm-Message-State: AOJu0Ywuip2SZfYeQENQJgtEkp+RBoC7vasx/YqGEV/fpbcK+xc5QQ7c
 99Q49wkAn9H0nM8GY7Lv+uyBTT8MMGyEbcm1SR8495HCXc7iBxZD0nFuMhq0DNrzXhqMhRpt/SN
 wJQZHfU/XasT2ArtyE/DWUrvJe/nJ8aHEsBy/F3YRw3OUJeYHdWGIGOrcyQ==
X-Gm-Gg: Acq92OFdjYEka/nCbOvlZkytvVanoSZ3bIZiJwRCjMqa3rGDsdgmud72AfOEvnLw3Mp
 wb+9JIRlqRnWdwMWNwjcv/j10+/a54geQr5SfvVg02WiNLpGneP3ENR38gpck9ssWUcBTfQC56Z
 9A70aK3CDGpym5dC5SGiUffBq9Qs15T3oErt60GTpi+q2kdZjD4ogA0H0IJPYT+BHWY7MVnyXps
 gcjoisPOlhoTlKRFdRRcngObLzNyRDfy+Oe6tu/TnDPT7GsaBsRVtnWe1XVJuntbYLV4H1umVcw
 hLQdO2uzQLm0+JhM2Q1y1caMrZibtbnwiOWYKb8v5qeXYcgC8bJzQUdeVYaHEgsZMZxieM4K9sI
 kbGqQyA/MYQGgtTYGr/UJBlsO5NoasnX/XYF2BCJ67Bf265CLsbow9OVB+GK/ct7IGTrF
X-Received: by 2002:a05:6102:3051:b0:631:d3e4:efcb with SMTP id
 ada2fe7eead31-6ec4a210901mr4427752137.23.1780573113650; 
 Thu, 04 Jun 2026 04:38:33 -0700 (PDT)
X-Received: by 2002:a05:6102:3051:b0:631:d3e4:efcb with SMTP id
 ada2fe7eead31-6ec4a210901mr4427744137.23.1780573113239; 
 Thu, 04 Jun 2026 04:38:33 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-96413f91f2esm4214017241.4.2026.06.04.04.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 04:38:32 -0700 (PDT)
Message-ID: <7c6c49f6-8791-41b4-9dc5-edb531c7065a@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 08:38:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/25] target/riscv/debug: Remove breakpoints on reset
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, Alvin Chang <alvinga@andestech.com>,
 Yu-Ming Chang <yumin686@andestech.com>, Joel Stanley <joel@jms.id.au>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-14-npiggin@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260114044701.1173347-14-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExMiBTYWx0ZWRfX/pUhoyiSchHl
 InqKpN+o5kfJfr4oLgJ+hilRnRL3DMhcQ61HRv86rNC1/GRq+4iuvw95IeyGtEC2aaeKM/rox7/
 JZonHCxg00qsneqYD9lmlwsGjg76wz06LMeOMuBWe0U6u8HOyIAs68/PBZFCjvn8VqEB4F/CwpJ
 dYE43NBR9KrQIueIt1kBRPUoxN1aszRA+0W9QftDZY3V83J/yCzASLapHDssqAwY6OdiDdYHDl8
 1ZolHea6Ptd01YH/2i4LpmrYgAw7ClkWvJOKBSkeQui+2MH6wOC1c4bOhebFcIOaKnnK7ZlvjQF
 63CKQudV+DBAJyxM2WP3Rd6wgO9q6CA6p0T0CBZnmAT6QkrsHwQjP0kCNt2iXy1YeZZCVsR2jnz
 EwKauWDfSSEBExMFBekhRuee1+dUOAiSRIYq1tSsOFtinzk2RMU+3YwdZ378mPN/jpeCwkNz4Cc
 yUhqdina5Q2sLgklsBg==
X-Proofpoint-GUID: ZZRd4oGUh-3CYqq_v8pSBYgGH270H1L8
X-Proofpoint-ORIG-GUID: ZZRd4oGUh-3CYqq_v8pSBYgGH270H1L8
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a2163bb cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JvLbQTfvwFkklDSfm4gA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040112
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



On 1/14/2026 1:46 AM, Nicholas Piggin wrote:
> Remove TCG breakpoints/watchpoints when the CPU is reset.
> Currently they get lost.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/debug.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 19c45fb13c..973de3b2e2 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -1131,6 +1131,19 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
>   
>       /* init to type 2 triggers */
>       for (i = 0; i < RV_MAX_TRIGGERS; i++) {
> +        int trigger_type = get_trigger_type(env, i);
> +
> +        switch (trigger_type) {
> +        case TRIGGER_TYPE_AD_MATCH:
> +            type2_breakpoint_remove(env, i);
> +            break;
> +        case TRIGGER_TYPE_AD_MATCH6:
> +            type6_breakpoint_remove(env, i);
> +            break;
> +        default:
> +            break;
> +        }
> +
>           /*
>            * type = TRIGGER_TYPE_AD_MATCH
>            * dmode = 0 (both debug and M-mode can write tdata)
> @@ -1147,8 +1160,6 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
>           env->tdata1[i] = tdata1;
>           env->tdata2[i] = 0;
>           env->tdata3[i] = 0;
> -        env->cpu_breakpoint[i] = NULL;
> -        env->cpu_watchpoint[i] = NULL;
>           timer_del(env->itrigger_timer[i]);
>       }
>   


