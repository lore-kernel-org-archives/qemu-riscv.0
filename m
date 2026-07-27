Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3742C531FC
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 06:27:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1woEnz-0004lX-HC; Mon, 27 Jul 2026 02:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1woEnx-0004l7-HH
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 02:27:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1woEnv-0008ES-W2
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 02:27:13 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66R1gmKw2177217
 for <qemu-riscv@nongnu.org>; Mon, 27 Jul 2026 06:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tUvZ0eUlMImlDP3VdoMDLwTadd2TsCsWJdNGa+7f8J8=; b=TzMMfE1w5R38ZAcm
 LVWKxMlNXLFzCx4lTHty0HIX5JB1PoFS4D/VqofhgxzReL+FXDI/aDJQEAI117tm
 bSgwKOYYRvYkJ+FaXdMvjYh7y7Yty0Ci3uHcJ4m7vBVjv8NoHb1yxJaJwKoJGaig
 uDgfM9albv1mal/QUz0U8V2s6aQewNC3yCbIwyr2CAx9lYWpptDuREPGUTWWPajz
 mGY+NyggGIjnhIe+sB5MAD4iXC6SEqiWjabAb0LPCBTam+vX0wqdVBAWuQc1Gviv
 J4AM0W4BuRzqHUcNb/JLn3xoDBEXe0YO09JYLQr2xS4yzxCgLdVnwvIkcxXiTXIf
 OSZlVw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnwevn3h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 27 Jul 2026 06:27:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c19493ac2so36529351cf.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Jul 2026 23:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785133628; x=1785738428; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tUvZ0eUlMImlDP3VdoMDLwTadd2TsCsWJdNGa+7f8J8=;
 b=E9Ohvs9gDNDL4sUduyTHgW1J/0p+nj9Z3ZKRNfjGc8ns74o4BeVcJfPWIAVllHBri6
 6pMpgTdnmznupz2aQGLiEhUgiahXucwq//LL1Kc/5814NFU4yek6IyrtRM9PHT+FQVxN
 58hmX3dYQXALm2dslp1/PBBBchGlWk3Qf0XOWoX50XwgMh4ieNs3w4ag1rZSvWX1uuLK
 PZSccmssWBGp02joD4vOJQHr2bcmOrEGGq5ALsRQKrVtNwDe0HcacmZy4xLDPkfxqErB
 6FNZGO17EGDY1+jggbYcnaK7953Z0PGCbOt5o+bu+NM4yNkoCuZRkZ76gsdyy6AD4vGL
 RbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785133628; x=1785738428;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tUvZ0eUlMImlDP3VdoMDLwTadd2TsCsWJdNGa+7f8J8=;
 b=IMGVaLxQhKf2sFoSdopCp/shqcYAvsto0SGYRRwqg5PmLQxd4vS5upgYKl1g3kjw9G
 lZOgKbCoPEdHC347EseTn9bonRRZNTbn0fKHBf7dBRK9H84Nomw2eNtR90I3QZ1vSwMG
 fAhcqWspNQY/HhSKunHNKwqOH2N+RC7kGNUJd4daOGWLWakjpogzAL3qBoCWHvVtq1xv
 FNtae7pGxGv1aH1HoNXnWXfX1RJZN6kkIVWdckJroy4SjPNQvcTW39nX5s6k8mdkgDz+
 5QeF45few0PX0Ch6VkHURagrTVLNfwiM6iOl5fUoGGnErJzXK4pwefLInDE6X5whazzD
 2TdA==
X-Gm-Message-State: AOJu0Yz2JKtFOcBjhqUZ/EE81W3LqMwdxt0+Lr6CjaqnyPISk3ykkcgV
 M/HrFkWcYXrvBvAy8I9ffttE7SaZz2eaaSo548XoCoFtbUMCZxqBG2f2FXUqQU8a5PXsCUj9Xan
 bZvfSMYcN1IfYNQ4/9XE7/VOCaooTzaoG5NROxlXUy632y4Aacn82u25UuQ==
X-Gm-Gg: AR+sD11PdP7T4uY8bOb/EuKgfgC896KJ3gsTEBKuRiXzG42047YXBQNFHiDqzl4JdQf
 ApD5lS/VVlrbZFOqRZiDgnbWfpdIly5GPa8eLsO+I1TmpDgAyIhVX+SgKIyMnUxYHn9edtOFZNE
 nN/PCpYU1P0fqeFdVeXLWvmZK648g9hgO9hIDPr67WxZPrBlE2LVbYCqozRmEAFHY68bS94w3V+
 7f17tWdPsfbYTal6kRfRFBxsmMjS59QYPmipNyCZNXMbbiPnrefwf+gs4qAd3i32B4dRj5Djlhy
 6CDPKUXkT9RH28pRbftBvubENX6hkLs4xpPSYE5rMTyioIL/W7gh+7qYXVvumMDBn6SMGFd+X4O
 ClwG7YFf4zbuhTUtuHxn1IyY9uGiHsca41hWG4IfjlAbtmqkM60s=
X-Received: by 2002:a05:622a:386:b0:51c:25da:903e with SMTP id
 d75a77b69052e-529a86f41fdmr73277201cf.58.1785133628559; 
 Sun, 26 Jul 2026 23:27:08 -0700 (PDT)
X-Received: by 2002:a05:622a:386:b0:51c:25da:903e with SMTP id
 d75a77b69052e-529a86f41fdmr73277101cf.58.1785133628155; 
 Sun, 26 Jul 2026 23:27:08 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c63bd3sm45980724f8f.27.2026.07.26.23.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jul 2026 23:27:07 -0700 (PDT)
Message-ID: <c972ac12-20cc-4f01-bb49-fd09491265c4@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 08:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] hw/intc: resample level IRQ on PLIC completion
Content-Language: en-US
To: lanxiaoyun <dubdublan1987@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com
References: <cover.1784966571.git.dubdublan1987@gmail.com>
 <b946a6859040243e973622b7f038a19c2021db95.1784966571.git.dubdublan1987@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <b946a6859040243e973622b7f038a19c2021db95.1784966571.git.dubdublan1987@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2MiBTYWx0ZWRfX+6PgH4xKtVaI
 vfaVvhKpYZvrzyCL+oY0jyTTXoaKW+C04j2KjHN12Oy5PgE48Drh9LmP8tdvQQltANGwmBaDOjK
 aD6//pMQersuLyd4HX0EMtW795RObpu+CFIgzDeuxs3krVNI7KRGjNVWLBqz1ITMH5Vxs4Ka/yy
 +7WWxoQyuKKVgM7/hlaDpr02xQk4+NSxZIMk3kMg6gdCu+o9juRj1vYPCarDEPoVVtYYv18yCEM
 jJmOlhNXQAJddr2nOhfGCzMk2Ln9pooVs06CobujPEEhRmeZFk+aL4UlccPJRQCmnxZ7jIv+fcQ
 irar+qqNR1YCrKiwc7UwWu4SNHmHK1n2dVF7ATk6XqQLhwpWq2AyPM7mTOyxfJFw1QoFHm5RMfo
 u/HBqm2mvv3GAelwgxhBgp4IiR/0izhewZrVh9ZBntAwF/jPAr2TtZPbV5BSATQmGli7+CIb+u6
 Utw5rTWYk3tLXgN0Zxw==
X-Proofpoint-GUID: Cb5ZuhBxxain9lL2KYq88p0_jN5VBihN
X-Authority-Analysis: v=2.4 cv=S77pBosP c=1 sm=1 tr=0 ts=6a66fa3d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=_q44DS1WNQBOSQMTb2QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Cb5ZuhBxxain9lL2KYq88p0_jN5VBihN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2MiBTYWx0ZWRfX8kfSS5lfK+GK
 BFJuGnyG3l111fQBKNaxwNUDDQ+Uk7aF1Xh1NYTmWF1ufwbE/eBawhtGCJ0L589i8weu0yiTryK
 j7Xozsgu0OQtPj1LQ9McGKb8DAM7C8E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270062
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

Hi,

On 25/7/26 18:51, lanxiaoyun wrote:
> From: lanxiaoyun1 <dubdublan1987@gmail.com>
> 
> When an interrupt completion message is received, if the interrupt is
> level-triggered and still asserted, forward a new interrupt request to
> the PLIC core.
> 
> This updates the SiFive PLIC IRQ handling so completion rechecks the
> current source level and reasserts pending state when the input remains
> high, matching the RISC-V PLIC specification.
> 
> Signed-off-by: lanxiaoyun1 <dubdublan1987@gmail.com>
> ---
>   hw/intc/sifive_plic.c         | 4 +++-
>   include/hw/intc/sifive_plic.h | 1 +
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 9c84ff06a9..43f235e329 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -246,6 +246,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
>           } else if (contextid == 4) {
>               if (value < plic->num_sources) {
>                   sifive_plic_set_claimed(plic, value, false);
> +                sifive_plic_set_pending(plic, value, !!plic->source[value]);
>                   sifive_plic_update(plic);
>               }
>           } else {
> @@ -276,6 +277,7 @@ static void sifive_plic_reset(DeviceState *dev)
>       int i;
>   
>       memset(s->source_priority, 0, sizeof(uint32_t) * s->num_sources);
> +    memset(s->source, 0, sizeof(uint32_t) * s->num_sources);
>       memset(s->target_priority, 0, sizeof(uint32_t) * s->num_addrs);
>       memset(s->pending, 0, sizeof(uint32_t) * s->bitfield_words);
>       memset(s->claimed, 0, sizeof(uint32_t) * s->bitfield_words);
> @@ -353,7 +355,7 @@ static void parse_hart_config(SiFivePLICState *plic)
>   static void sifive_plic_irq_request(void *opaque, int irq, int level)
>   {
>       SiFivePLICState *s = opaque;
> -
> +    s->source[irq] = !!level;
>       if (level > 0) {
>           sifive_plic_set_pending(s, irq, true);
>           sifive_plic_update(s);
> diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.h
> index 32973dbf28..627a418ba1 100644
> --- a/include/hw/intc/sifive_plic.h
> +++ b/include/hw/intc/sifive_plic.h
> @@ -54,6 +54,7 @@ struct SiFivePLICState {
>       uint32_t num_enables;
>       PLICAddr *addr_config;
>       uint32_t *source_priority;
> +    uint32_t *source;
>       uint32_t *target_priority;
>       uint32_t *pending;
>       uint32_t *claimed;

Where is this array initialized?

