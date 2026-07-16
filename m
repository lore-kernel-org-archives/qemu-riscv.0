Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C35C4450A
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 13:21:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkM1j-00041P-Ji; Thu, 16 Jul 2026 09:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkM1i-00041D-BL
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 09:21:22 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkM1g-0004ja-Rs
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 09:21:22 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GDJc7o2946535
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 13:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Y0MCf5pW4xNNdIkgT1T1KQEaBjldhwFlgVHv9j2llvE=; b=phTpw5g3+KdocmP9
 dpkAKYIR8A2KlMx2adDlmMM3um+ZbuNLxlekKmFiA8MvKYgFAz9FA7tyQyQ8fY3m
 pNBIGJVkbT4Btga1aPkIBMToy+CE0XDX+uiXUDugv+MBBLkSnPEvlbNaBYTwjf0L
 gjgvOBqdfDmK8h7eZCnKY7+ua/wSyidww7Coj120M/awrjctm9QIvOO0PknQ0NI5
 oTTF226Y7sdYgCMC7n3hUhaQLynsiUK71SuvMtDo5HFsSwjnq4v2PhToniuOVMgd
 FkFOl6N+ERft5ViAeROt7GPNk4PpNpLoETzT5rfErfGeaOX6Akiz8SwX+3k4sxpe
 apvxYg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wakgf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 13:21:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-90410c668adso117993886d6.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784208078; x=1784812878; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Y0MCf5pW4xNNdIkgT1T1KQEaBjldhwFlgVHv9j2llvE=;
 b=XjqOFRwlKPNuytCeE57GYFkqr+NpGFA4YaRGOpgTFEIgzuYpwqabfA5EA8jeVDvP+m
 VtSaDdCkyHs7lZvqZNp8KaIomy9A5Cbz38X04U8b+J8WPRR8Ros3h8OEj1ti5YcfmjRx
 7LAJAj56avTooJkbbMS4kHCDdE1sE09tcu91Hogu8rJ94p5+mmtzfzjNjJdNtvq1r5Jw
 r/dLEB16TbMYdtqTCvt+DnIio78fyr8IVw3XOkzO/392IMsyB3Bdsn6M1LI09K4pReAK
 KktTfP0uL37r7BZ0VzFvn0oZZ5VZP7MUcP66czYpMthoAgBu7yUSTBJ+GGHGGLlxBUAl
 374w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784208078; x=1784812878;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Y0MCf5pW4xNNdIkgT1T1KQEaBjldhwFlgVHv9j2llvE=;
 b=NdezotawI/HBVwqmPqET22LbSVktlp3drRm7H6v1mh52D/K+L2qz++Ho4gkxDvM2I0
 NAAoim0gJKWdjq1CtkufRlUDQh1cmUfFPdnaCqNuWg/JU7voIxFZyZObGRmPphfzHTUg
 wak6f9suimvZqcDhVaXb9BtN3ldnkOAU+C8vzXvxpXYa1lzExUUgRgTVVnlWHYDwQzoR
 kG/f/TUC+sBX78NJcF9S3wdBDfuwAD3rcAx27OFE/9uefn+YSOxcGo4HUTWKMzHsJjjN
 AhoLYMDf4J7v405Y7DCrvxXu6wyWfv6E20GERfpIZY+TXOysZJ/ZC5h6IxFEkGRYtUWT
 cCwg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoL6zaXNvOdk/i+6V/adBnJCvUrgcaX7QUI280WLcmKXODgxdhsEYYmXR54bDl33FZ0KrEfT0dvfOux@nongnu.org
X-Gm-Message-State: AOJu0YwhqznNmrnNPMY//3iTu1SkqA+lpMuDJOyVeVYiWH59UqFODnL6
 qsWUWWzCNLvyFV9xzXwbW/IOd5AbCht1aDxqFxyavbq2zV4/1gpudVcveQARpK10A3i4Ozv687V
 TV+ktw8T8BGO+741ofg4pnAvwZU5tEdjnbLDK2m/gQO0a6ATwe+of3dsQ/Pd5krG9JQ==
X-Gm-Gg: AfdE7cn/n7vUfSUuA+sdftFHvlkQzSmuQMV/ulrHYl3+JSA1Tp+16lpQ5nRx9+rIDIK
 fisI+Z4gWSh+ft99dmkaRyBQS3kjKMaxi7ivCrxW8xMINDbS0l1fCr4uJrvegg52mb7cLtfJwf8
 9UMI2E0N8rZHU8R9GD4FXNBBoFiguZ7X/DTViZkDnHrQIUxZ6Jjo0sphBimxj4wx6OOZNMegvJm
 JFF1N2bPAOL5Fs6h+YSQeSsbSuQZOX49sDw5QCoejuzA4GZiqyLyPwa7LKodGcs+2A91OSiKhtO
 hiJFvtz8uCYPatud5ID5WtL2yK5d8PEb17/YL3dKW6/lXF5a0U0EVvzyqgDSRcKY3ZAWzjeUbGi
 G9zW2/mml3+5WTU718DsRhiwymU9bi1nGxw==
X-Received: by 2002:ac8:5805:0:b0:51c:12bf:d4a3 with SMTP id
 d75a77b69052e-51e3c2cc193mr125319071cf.52.1784208078239; 
 Thu, 16 Jul 2026 06:21:18 -0700 (PDT)
X-Received: by 2002:ac8:5805:0:b0:51c:12bf:d4a3 with SMTP id
 d75a77b69052e-51e3c2cc193mr125318501cf.52.1784208077597; 
 Thu, 16 Jul 2026 06:21:17 -0700 (PDT)
Received: from [192.168.68.105] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51caab6e9f4sm158122921cf.2.2026.07.16.06.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 06:21:17 -0700 (PDT)
Message-ID: <c06253bf-6e56-4ef8-9fd0-43d8a062190e@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:21:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] disas/riscv.c: Correct indent for checkpatch
To: frederic.petrot@univ-grenoble-alpes.fr, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: julien.thillard@univ-grenoble-alpes.fr
References: <20260715190737.1381701-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20260715190737.1381701-4-frederic.petrot@univ-grenoble-alpes.fr>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260715190737.1381701-4-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58dacf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=a4YAP2N2y8i5vXA3XgsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: am5ZpUUD_aKkR4ujuL8YSBayXlC627Qt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEzNyBTYWx0ZWRfX0hk7pc6oVYi1
 pTWF6WFQcBoJ6f71EoLgM0X1CuGlGT3u77iXZOMLF7W/XaQrNvmnN5dr64wB2I++f3LMGSasmpb
 KjFAni6QX850DvYQeyvhXPguY/v03WU=
X-Proofpoint-ORIG-GUID: am5ZpUUD_aKkR4ujuL8YSBayXlC627Qt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEzNyBTYWx0ZWRfX7fOU9SA7/z1+
 AVy0gGMY8Bk98JxZVbyTqaf1Rv7VpeSgB4PRWHehJ5Hn8fc0bvKAnyvb6x74TOL0YZA8Xo3fZki
 +8zuOZ6QndJHny7gjbbjw10/F/A5o/2UC69B10PIsgzE/AD/MucboMDlCcrjAWFjlKT0Lla7uI6
 icUL8IkHvYvxAzDZhb4QpanODEDXgPsYuAQIRJ79BKYnHTdFb/fLoUxQchIxpXqHHNyD5oB46bs
 5YaJz8nvvUvYi6d4pn+C9nYV8eIQI9Y4ihU25SOkv4e6NwLiXyH4sC5RvprRM3oVlwFe1rEC0Yy
 aV2qGkiGKp/DgH/Y2bR11oETln0NWYlpvJ+x+lYmisFS+8SfMXTlWyjHEv0Q17eAlPyB6yyWb++
 IjZKepBi1CKJEh79TVREfZc+b+LxJAuRwVw3MbcDGzHquCt0uY97OGnHFe0BR2NdmtliQCZRUgx
 rFLQXM9eoqVF8Gfij+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160137
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



On 7/15/2026 4:07 PM, frederic.petrot@univ-grenoble-alpes.fr wrote:
> From: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> 
> Trival indentation patch on the cbo/lq relevant code.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---

As I said in patch 2 this patch is fixing style issues that patch 2 itself
is introducing.  We want this patch squashed into patch 2.


Thanks,
Daniel

>   disas/riscv.c | 38 +++++++++++++++++++-------------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 831ff526ad..27bf4d9954 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2887,25 +2887,25 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               case 0: op = rv_op_fence; break;
>               case 1: op = rv_op_fence_i; break;
>               case 2:
> -               /*
> -                * 'lq' shares the "(...) 010 ..... 0001111" opcode space
> -                * with 'cbo' insns, but assumes rd != 0.
> -                *
> -                * cbo_inval  0000000 00000 ..... 010 00000 0001111
> -                * cbo_clean  0000000 00001 ..... 010 00000 0001111
> -                * cbo_flush  0000000 00010 ..... 010 00000 0001111
> -                * cbo_zero   0000000 00100 ..... 010 00000 0001111
> -                */
> -               if ((inst >> 7) & 0b11111) {
> -                  op = rv_op_lq;
> -               } else {
> -                  switch (inst >> 20) {
> -                  case 0: op = rv_op_cbo_inval; break;
> -                  case 1: op = rv_op_cbo_clean; break;
> -                  case 2: op = rv_op_cbo_flush; break;
> -                  case 4: op = rv_op_cbo_zero; break;
> -                  }
> -               }
> +                /*
> +                 * 'lq' shares the "(...) 010 ..... 0001111" opcode space
> +                 * with 'cbo' insns, but assumes rd != 0.
> +                 *
> +                 * cbo_inval  0000000 00000 ..... 010 00000 0001111
> +                 * cbo_clean  0000000 00001 ..... 010 00000 0001111
> +                 * cbo_flush  0000000 00010 ..... 010 00000 0001111
> +                 * cbo_zero   0000000 00100 ..... 010 00000 0001111
> +                 */
> +                if ((inst >> 7) & 0b11111) {
> +                    op = rv_op_lq;
> +                } else {
> +                    switch (inst >> 20) {
> +                    case 0: op = rv_op_cbo_inval; break;
> +                    case 1: op = rv_op_cbo_clean; break;
> +                    case 2: op = rv_op_cbo_flush; break;
> +                    case 4: op = rv_op_cbo_zero; break;
> +                    }
> +                }
>               }
>               break;
>           case 4:


