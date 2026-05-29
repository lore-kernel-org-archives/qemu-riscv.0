Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7EECD6E51
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 13:04:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSwt0-0006xN-EW; Fri, 29 May 2026 09:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wSwsx-0006wK-Lr
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 09:04:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wSwsv-0001SI-U0
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 09:04:23 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64T6gCo01386545
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 13:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sOJN/2ghV06s4eA2fKXwh+hFAUNvo7YOjP82Ff9YpYo=; b=bB/kTwd3fjlZaiG9
 Jsts5l8BRMP3i9EQ9O8K4XyiUgiYl4LvrljwuZtFfBX1Oz+wREh1a3CNiDH0Fy5l
 QPxqfhxZKmE5Z7ZiBnqqq5K9j3tfiCUgmgKhw0fnzdFaRvhb0UK7o7oL/s1aI0l3
 Up0ZPKnXclSAY9yNQv49pEXPM7z1oaTjRMLXoVbbJ2PdMjO2kyvSO4gqIIeZeng4
 olysJuh5kmmjh1uRrVZTFMru3cdH35d7aPg8K9S1YSOrukWo+wD18mgiXBeUhDWh
 ZYyuG/josCaEtf3hdiendFo8lACd2ISH4koh+R5MArWBGp45BfFGBZ33fdUFLt15
 nowBNA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumukjx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 13:04:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-304ea1eea05so2071072eec.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780059860; x=1780664660; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sOJN/2ghV06s4eA2fKXwh+hFAUNvo7YOjP82Ff9YpYo=;
 b=fKWb4ws7c+GnGNhKvVGm2iRKR/drU1RvuRZkcTCzaaPLj3aKP28ePnFtZBEK5eiDux
 2N2D6pebGe+cW7W4PqxyzbTnl3QGu46yqr+UzfogrH4vcX8XERHVFaElVzyiJ83d1NjQ
 V0geurFdh3X2inxDDTd+DnjTO8/cXQRltk7pGOKl0i4kHgCpl8k0Jwbe5UIq3nQsFQP5
 2PUikMEufmAp3MnuS/1FRIOP+613wGqv0aJRSnJzjz/hIFkW/twAoIBn+jA54iNIKsTa
 UKDJQHK+ZG/2Z+tgyCz9JxTMruOFHFQIg+jOWDooHQg9l6fBWPay1mtePq3cJKKPd/I9
 8nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780059860; x=1780664660;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sOJN/2ghV06s4eA2fKXwh+hFAUNvo7YOjP82Ff9YpYo=;
 b=Y2bxV5i3yg4/+ZSczlG/7wXAFQgjU9fv5sPS9AEbDpBzuuowYTgWu4iSAda4vepOvC
 bb8di/1JQqZ1kbdOmQ3yKHlTOHXuGbD+TBaJ7WtIWolaVZ902ICOvOpUkCBiFvBCl+o1
 wPDrDuahnoJj4H1aUyp0wszwNcUByHHYCVTRa00MhDOzMeYvVoc613OkMuAus+blPbuN
 K46YdxWLtADBOyBVJVIlAdiDSDALeSugDWqSjPJn5mnTG4p7GHG/frJB5o8oLDjsYQXu
 bkBGXSz5+/Mr6JhmLgAbdsCPGBkiG0Wk6GFGW2RjcM+JfH/vq4E9NWd/ueTCmNMPu6Nd
 KRBw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+i9tC188CiFiHj8TMRB6XYwO48xV6C4KP4krcnV8R+xNrxkOiQ/GVBUFfKIe9NHo3AdiqSauFRzTbu@nongnu.org
X-Gm-Message-State: AOJu0Yyz/NTWV4kz9ShD+yDbzXJWvWmeV7w0YMfDZSkoHDYyxdyfZnJH
 oV+mdJpK4tAKv4qSBsqcQaCk1n1pMHP7QRbvqH6E+1OFvG9EoTQdaIqoOlG9uB9t96d7SMxdFVc
 jzIbCVuFxx0jXxuqrg1qWuQWqpFjnoRG7CsYYiuhtUcjWA2FODfhzfJi63w==
X-Gm-Gg: Acq92OFPe/+C/YmSOcxVARQbw/7bHuyfadbBwTXQE/ZqWFY+sIyY9vXFRtpZltxymCN
 9FVqK21wbPKvUynkWz80EdEKU0deo949zzUCPiNRwfRG/Y2ujOC1xwX1M2XMBTy3QrWITAZJp1n
 L6XdPUeTtmj7899MHXZp5dvP9RiD8D7ZywmTDAcx8O4PXeGoJQduZCl71SEcUQ2NYx1qYQaIlOc
 wqbk5kOluJkdI4EIVhTl3WbZYD+rXd8jqaK7NUWNmGfChaZBKw5sRVKamvY9dByPL29qtEOYhL4
 rS82amC/T6hKQyHf8xlGm3VWpEfsJ5DaT7tcu68Hr4UxoxHkk2AEtsGfORyDK8zLlp9jjLOZt9P
 Q6itUcyxclx++08TpnM4F5K4SVucU1TDXhgUiUJpN0qmZ2v1qUbYCMOFinq1/CkuvzMRW
X-Received: by 2002:a05:7300:cb11:b0:2de:c5ca:c1f3 with SMTP id
 5a478bee46e88-304eb105720mr1285110eec.4.1780059859571; 
 Fri, 29 May 2026 06:04:19 -0700 (PDT)
X-Received: by 2002:a05:7300:cb11:b0:2de:c5ca:c1f3 with SMTP id
 5a478bee46e88-304eb105720mr1284999eec.4.1780059858087; 
 Fri, 29 May 2026 06:04:18 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed5f6426sm1306978eec.31.2026.05.29.06.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 06:04:17 -0700 (PDT)
Message-ID: <346d051e-5cb4-4238-b32c-1d2b85e02e08@oss.qualcomm.com>
Date: Fri, 29 May 2026 10:04:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv: Print privilege level and ELP in
 riscv_cpu_dump_state
To: Anton Blanchard <antonb@tenstorrent.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
References: <20260529053519.1224019-1-antonb@tenstorrent.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529053519.1224019-1-antonb@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r4CdfMKA5xoD8403UDeoF6Axpke4uOij
X-Proofpoint-ORIG-GUID: r4CdfMKA5xoD8403UDeoF6Axpke4uOij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEzMCBTYWx0ZWRfX5Jeu7YDuUxuO
 eDuAmnh8IWydYDp+1VqK36rXJ2qLEsRN358mISvHb3JmV8jO7Am7/pw0YFmeGAtIcG5K3fv7rDl
 qhi/optQ9eGSxHpX4oebZ3g9fo5mwEesobPkjNodV8xsLoTvdjDHurL/de8+2fxw7C4LP6/28dl
 CF/zOUmw7FbXisW1GjfpOyYqlAEbnwBc7OY0JlNocr6MsNnaHZNH4ddyLL/L8UZUEjEhL0ccaXD
 cIXGfc/bcZBfp8Y9XuasMKVB6I+hQ2CLb/oYGZSu6VkH092sY4+YvYPxs7w3sebt2B64JGiDhcD
 /TEOKfqAvRYfsrKfQgbZOCRBg1zdSemxZjo5MLDBmOrrEOwlaC++0UM6owxkXK0oVw70KBzLQYd
 Er78gDIU+xpkjqTMcTp/l0BiZ4ZBGivatLRHSRQHraBDG9gdFRXlgYAFaZkcEGHtPP5+WSLCZDk
 aCbXhc9cGF/srY5hoMg==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a198ed4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=NBj_7myW6Vghhd7hPxYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290130
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



On 5/29/2026 2:35 AM, Anton Blanchard wrote:
> The privilege level and ELP are implicit state (like virt), so print them
> out.
> 
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 952e34fdf5..b38ddc39ea 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -580,6 +580,22 @@ static void riscv_dump_csr(CPURISCVState *env, int csrno, FILE *f)
>       }
>   }
>   
> +#if !defined(CONFIG_USER_ONLY)
> +static const char *riscv_priv_str(uint32_t priv)
> +{
> +    switch (priv) {
> +    case PRV_M:
> +        return "M";
> +    case PRV_S:
> +        return "S";
> +    case PRV_U:
> +        return "U";
> +    }
> +
> +    return "?";
> +}
> +#endif
> +
>   static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>   {
>       RISCVCPU *cpu = RISCV_CPU(cs);
> @@ -588,9 +604,15 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>       uint8_t *p;
>   
>   #if !defined(CONFIG_USER_ONLY)
> +    qemu_fprintf(f, " %s %s\n", "priv   =  ", riscv_priv_str(env->priv));
> +
>       if (riscv_has_ext(env, RVH)) {
>           qemu_fprintf(f, " %s %d\n", "V      =  ", env->virt_enabled);
>       }
> +
> +    if (cpu->cfg.ext_zicfilp) {
> +        qemu_fprintf(f, " %s %d\n", "elp    =  ", env->elp);
> +    }
>   #endif
>       qemu_fprintf(f, " %s %" PRIx64 "\n", "pc      ", env->pc);
>   #ifndef CONFIG_USER_ONLY


