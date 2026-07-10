Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4BBC43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 22:19:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJZH-0004xY-2n; Fri, 10 Jul 2026 18:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJZD-0004w7-7k
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 18:19:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJZA-0005FL-Fx
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 18:19:30 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3BDS1891828
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 22:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9FP4t3RBgLTor+Cjcn8Dnut9fM4NzStxUlgVMrdmBvc=; b=pAZnoo9j4f/Bi6pF
 3fw6dD/VrC6Q2Kqhn25Fvdp86mqRsoHT21HASx5Zqs7sd9CbqJiOrRvKE2+ib07U
 2tV/Vv7xL9xdAZ+ru6aSlf3ozoxWEzjEZd5FHLbAocEFhxCAXPeyJ4YFAdn2q7MC
 AQcaZ1k4ostsZKLw0tai9IHzhp87toAb78QTTsllOTm+Yl3bUEeL1QQFgb5p3T3f
 HV6PA2gnTQTXkyYrVqDkCO5lkVWlZSa6MZr2BlmsiEgv0ZUjdBaIn1LZq2szjgnT
 j25J75FuFDW6/G9ksHde+9EHLjFLE2TZFNJBGGRW74hu1Y9elx49uC67/pCFAQHE
 WFT0+g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xvs5pe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 22:19:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5174a236220so14871331cf.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 15:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783721965; x=1784326765; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9FP4t3RBgLTor+Cjcn8Dnut9fM4NzStxUlgVMrdmBvc=;
 b=ENTLSyvvaj/2NewZSv6IfSTyvYwlsnHKHh5SjAfH0hOeKTLpcHSGt1CY/LrDwRBWoC
 AtItikerBrHO2q8Yuq1ayF5ydEXAfRaR9UyGvl31wCwMVXEgxgul4eMiY/AM9p3NnZDU
 Z4SU+4qpjSoqARAgfbnuoyFtmSSGL5EA7iVK3Iw747+RA1vxNKUwM0jtPOijdeYkWVqn
 GznLuRAsN9dHWqjnPVvZ4pxXusx1/yn9pbGHp49zsoSTSV08727YM8lIYoInbU6crxOd
 25/7sXiEsfphvE37iz05eIKuhkQwZ9SajVBIqOfFPTzVEmFWnuFuTyrWSUMuoqZzq5Yj
 tDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783721965; x=1784326765;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9FP4t3RBgLTor+Cjcn8Dnut9fM4NzStxUlgVMrdmBvc=;
 b=MVEV+XPyHpGHtiYoZyOWEiH/RuqsX/MRRbHmq5z4FnHW+y2NMCgk2sPHYg6/GXC+Gb
 myVp7KEmo5Wt0JhVdiLWSRPCjBIlGV+cWkeiGwT3asq7QM+S52YN1K1B3fkbR+VNH2wa
 YLTekbNu/WPOKoVFoxgL5HK8DZljX7Ujgkn5RBPDwzpB/2QiK6CGmr8KQFQikUlgMURD
 CHRurLWcomvrYC5nU5IFcRwp43c0Pb2/YPTjbqGikH3L65EJl4l3V0TO/vr8ihFUcxvx
 +C2NkaQr1go+KZ3FChA2CdFep2BFmyrLd6EFVk31lCPNRL/vbgSHNkaqSLio2I6jit5L
 jReg==
X-Forwarded-Encrypted: i=1;
 AHgh+RowAUgr8nj51fkuZTaTqFjsMrqD1nOBDuqy/kjQBP2izJgm/7Ju3t4oGE8l+KaPvXktgKE0fzTu3jD9@nongnu.org
X-Gm-Message-State: AOJu0Yy+35LO/Me6+bnZ8o1EGd71WlMGM9WURHjAEfMO+QRfXhZOGNn8
 KAE9HsIVMMzSAndUSR8MolzgxrWyhg+eBoOvMZBUNKXogmFiw+mqSYYIxKsKwmicxfgky4ilPzg
 6T6y1BCxUkw/LjxfLoccnHzUIMlTz8fqfokW1Ceaeh3uaKEIuDrNgqSWTzg==
X-Gm-Gg: AfdE7cngdjXap0RN7KfDAufaWhWzf7yva0yL1FuGPgwfc1JaUqvzVypdH6csTTDvVF2
 4o1Xf6Tr0StyOZc+LhKbFwDDVNXvQPdLPXRk7YtQlL7gBHACtwpUaMweThaQHIMiSgnShcD40Tr
 XbUL7snRGQKaEtkVXUtz7R69+TIXWf0/OvtMVr2+eliWEWuk9wXlNc4dWQSPNbAXskGXvf3QfVN
 MhplfEO84/J19w27qNN6uQLsOYKOX1lx2LFbDdmO7QbQyJt5ALiT9iw2e2gFt4l6+PSa1akKTbH
 HjPDOTzxD6JDRxB3dollP8bw9dXWc2Nxc7yKfdXRiy9mCV6HThU/u1U4vQuhwLzTcyKqU6ZzFGh
 wlE5HAzyNg5WsYi7i+djc4B+i+qOQFg5OrdbMwcnYbTgDYq8ItY3Tq7hSkvQ+4A==
X-Received: by 2002:a05:622a:1928:b0:51c:7b13:62f3 with SMTP id
 d75a77b69052e-51cbf30dcfbmr8099581cf.73.1783721965157; 
 Fri, 10 Jul 2026 15:19:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1928:b0:51c:7b13:62f3 with SMTP id
 d75a77b69052e-51cbf30dcfbmr8099341cf.73.1783721964748; 
 Fri, 10 Jul 2026 15:19:24 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d83bdsm63071820f8f.13.2026.07.10.15.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 15:19:24 -0700 (PDT)
Message-ID: <a0210af0-f92b-4939-8fb9-90672d156b82@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 00:19:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-11.1 v3 48/51] target/arm: Be more defensive for
 invalid tlbi_aa64_get_range
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, qemu-stable@nongnu.org
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-49-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-49-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7L1x2tFnwTN5CtCR6LJjOD8R6z-JBnDW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyNCBTYWx0ZWRfX2Rj0ZRbDH7wJ
 zqcPh4QnHW33nuF6Czha5Fv6QrAYvNqqRXMfaxlJmiP80f1p+B5V3/repW6D6KC88u+LbFCE4n/
 0pj9S2QsoRAx2fJKgTzDJPCqcP41J6lOajKPa7DwsfKS3mO7AIrG3w/K6svvcRyxWKNncSXXsAU
 XoNYWH/EetbWQxy4QjAuBz/V+c/j7NwNv8BTSRyFnE4UZdKgeRGm3ytUAeSrtKj2WG51LEe8Did
 Z4MYjgItmooXDZBvhuuc2Yqsqv4OMMM9vEJT6YtzxAXci9owmThIWRyg9QyVBYq45BiC7g++bq6
 J4/QcV3UUdhF8J/4pcl7OrbBK6l5cyqj0sb0zqS4LgNq71Bo44jh+kfJ7DIwMd50OI7ZDVPzMQU
 tbvdbLGBbjPevDLncGbV7ahObmu5Aok7F4tOwzi1XXAIeF3tZCHudECCkaeKjk5eNaJKIYucsi+
 BWptFUpyV6GNoZpvzQw==
X-Proofpoint-GUID: 7L1x2tFnwTN5CtCR6LJjOD8R6z-JBnDW
X-Authority-Analysis: v=2.4 cv=HInz0Itv c=1 sm=1 tr=0 ts=6a516fee cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=69wJf7TsAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VM2QREBHC_YskJq0tasA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Fg1AiH1G6rFz08G2ETeA:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyNCBTYWx0ZWRfX1PnHxZTH6B/d
 Hn8fk/zm/iSRH3MQRr3g4lpugqRQ5TTgX2g+bPb27VOpJBUA2pS3Z7y4kB5TM0kxzrA03zYGEXd
 Hucm6nllHoLgxJn+rZW7WMZxpzeANZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100224
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 10/7/26 22:53, Richard Henderson wrote:
> It's possible to program TCR_ELx with an invalid granule size,
> which could match passing an invalid granule size to TLBI RVA,
> which would then fall through to assert in arm_granule_bits.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 3c003f7029e ("target/arm: Use ARMGranuleSize in ARMVAParameters")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/tlb-insns.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
> index 1a0a332583..b24eb57788 100644
> --- a/target/arm/tcg/tlb-insns.c
> +++ b/target/arm/tcg/tlb-insns.c
> @@ -854,7 +854,7 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
>       gran = tlbi_range_tg_to_gran_size(page_size_granule);
>   
>       /* The granule encoded in value must match the granule in use. */
> -    if (gran != param.gran) {
> +    if (gran != param.gran || gran == GranInvalid) {
>           qemu_log_mask(LOG_GUEST_ERROR, "Invalid tlbi page size granule %d\n",
>                         page_size_granule);
>           return ret;

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


