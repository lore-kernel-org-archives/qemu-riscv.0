Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D51BCD98E4
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 12:26:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZpLV-0003NP-7x; Wed, 17 Jun 2026 08:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZpLU-0003Mw-AR
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 08:26:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZpLR-000423-Lk
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 08:26:16 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65H8UkXG1607933
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 12:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AxfZE1gPfb3A2rKqi8N+u+RT9xFooihvlI/FiUXZhrY=; b=cdJCcZ2RpEz9jImy
 k3fOTMgRyM3EjaYQADmKRKcl5O6GWb6XHdkTs5CQuRwPcLok09aiI8C27y6hHPvS
 NRmHFK2ssU/L2PKhQOn/10N5OIgabuV6fLOywP7wMvPinjyMgEb7pSUHTorysVwA
 vgIpAoU4NnC4mSujFm92uxsbAqsgKpzoYFJzTPAOCmS83i2s1QaoomjWA8jwOMT2
 AMDYV9kXIKPuipjmhzdqlyU9YE5p4OmBAhEsQgTSWOgGuz+xW4QLDHg9fRa0Fh+i
 QGEh8xYZN9vJwgaL8tSXlDMERGgZEJ9i1hw09o2xAr+GESRKq5EdOKDfnNrRakIz
 zFM4yg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef23227-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 12:26:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-91e59716176so64523985a.1
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 05:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781699171; x=1782303971; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AxfZE1gPfb3A2rKqi8N+u+RT9xFooihvlI/FiUXZhrY=;
 b=M2vNtX7z4QQ5h8Un5NnWL/Sfj+xVkVL0Tn7EfT5llmVS+M1imPv/ezspIFyQdVpsgW
 vmbN8woQ7NdvPs31Nun+dsv+Q9RwXGbe8BAJqDcgyqltOdc4DH7J5+ekJKQWCSEfF40a
 qyuWm/rSnOuu5XsZ65DeU+kwgp5C0OrchTUNbEFGqC5EMKzEUC/YVY3/KQ+4IlKHb6lI
 b9BkzurLufNN6vkCwMtA2WYZNzypXJiF2r4uKnT37FbF38r5WGjZBq4T8+upLX/ytWbx
 3vwnTeY8yhBGrr0x4dYpKuWsa0yWj4vVB89uJbMQnOibIjqKKv2fzSvZJc7vn3afnwuu
 94xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781699171; x=1782303971;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AxfZE1gPfb3A2rKqi8N+u+RT9xFooihvlI/FiUXZhrY=;
 b=q/nZiZzUzdEvoh2GebBMJ0lRvm4tBIpJooZGIQMnMIMg0fWl8l/LNC7LZvo8J4v8n3
 /SudtT4wXz0zV14kjzWFnCfLkDQ3iBzIbod2ZmUBqHemC1cZvtlAvlgh9x+/BOtj+ve/
 SPclIELdr9MrfdK6BepkWrr5zOwixIy4IiOL1UNZa//PrMDPDUsGPv6YVCcEm+yYoB4Z
 qLmpk7ctnFRhctYfCzmPjTIDhM9Y3NWoKFx5Cq+lBW1Ux9wUkmIBdUOJjDnMB4nTFq7G
 Yc73cbk/+PE+YwpG0iU12Tin+FZyFJYHJtAM7pvqP268HtRQ5B1VXZLt370MjzbamY9Z
 f7sw==
X-Gm-Message-State: AOJu0YxsoOtjt9b0+UCY489TISOPrRkJzjmrPdS87PBS0kgj6bdfznJ0
 l1kaUc51Vpd2id9634mIQn+iGIQqLYVdCyRMpSJcucz5UpoopWml13xatNwBnZdcGkiMNssgLQi
 40/S5QdjaD8QKtNrTVsKpS/EM1807PLSD57fYNV0FYimXKO/nF28fZNLiFw==
X-Gm-Gg: Acq92OGgGTx0R0iF9vF6p5vXs5lWWQHi44H+Ad4Hplwi6Ty3E4hnn0ZRgwSuQdgBTT+
 8kP/5ori3Yux1TQaDXjjtBdYXJg95gjiYGZJA5eDOVedGdmwEXUxuWnM9StQYw2OcQxcVvt1mzk
 bMbH8qz5j6UIkTgWmGzEXf9vxR5riY9vqhBtrzf2RwPlSH2Otu7R+b0R/Wt4PQGwwkgp1T3p4Qz
 xVAs+w+A7WTLg9douBZ03M/KoZnPDyQFyPAmZjBxJ5ZTp5JS33xLjYHpNAAIIIJBVYfBqC7+N/6
 6iK5eRxevd9jo5J6Ij6+KiCxcLgynfGWM0KLKGHc1P5/QXKraRO16BrjdPxKVSvB5Rvi8RdUUpQ
 RVBGc9X6Z1r8vv7uLxHFCfhFJOiFYcRY7u3EJmSMDiJqvKTI=
X-Received: by 2002:a05:620a:4586:b0:915:8c48:497c with SMTP id
 af79cd13be357-91d8afcb0d4mr677449385a.28.1781699170477; 
 Wed, 17 Jun 2026 05:26:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4586:b0:915:8c48:497c with SMTP id
 af79cd13be357-91d8afcb0d4mr677441285a.28.1781699170013; 
 Wed, 17 Jun 2026 05:26:10 -0700 (PDT)
Received: from [192.168.68.103] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9161a00ad75sm1765234485a.25.2026.06.17.05.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 05:26:09 -0700 (PDT)
Message-ID: <40422567-4917-429f-9fe7-b7fd8e987afa@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 09:26:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] target/riscv: Avoid NULL deref in IMSIC CSR write
To: Joel Stanley <joel@jms.id.au>, alistair.francis@wdc.com,
 Anton Johansson <anjo@rev.ng>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260617054034.1020724-1-joel@jms.id.au>
 <20260617054034.1020724-2-joel@jms.id.au>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260617054034.1020724-2-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExOCBTYWx0ZWRfX9IhBGxuFc7n6
 4PQcW4as/ardoqCX9MNYIt7Eyy6k3Ry5XI0THI51zecOs9HZVDE42NfqtC65EILqf/S83dlyJSz
 2ThSqqRjTFED/ZL7BLub00LeC/2kfXA=
X-Proofpoint-ORIG-GUID: ih28QlxcrJIkwLSRt4C3Bze8cqpmmnVe
X-Proofpoint-GUID: ih28QlxcrJIkwLSRt4C3Bze8cqpmmnVe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExOCBTYWx0ZWRfX6MnpapQZduVx
 SM6x1ipiQC5wda79vw2LFHqeCAG+0eL2D4CUGOCbcBFdwJLwrOZL+kJzDwZQQFwrTU1zqJx49NK
 UjIwY+yz78/kKxPhPU04zlINQqM7GI0yY/6xoknZm7KjkJAkN2Ci4Shq2Y7jNqSh8Asp3TnLETN
 FDeaNqHuU1lv+MXDdOsnyyhjlFh7ELzRYt0tJFCcY3ea5M9nCUVt1hRxYK6XSrwJ6AcrHd57SJH
 YAd6QhwrsZGBP9t/i8hs+er0NIk1eSXb+/eFj5klwZ4x8IG81UYOR5zsD9jPCrMRJ6rtLpxZySb
 TTSca6Ccc58t7ZrfE8t+FDskrgSWhXT6tWKlpHRweDAI0vGKUmVPLnyjfv0SJeFx3j8JR9gRjy3
 mJTXFBcZjHzpfc1TQKuSMib1o2pBOWferavbjYy9zZtqvrAdPKwJ1WI0RIReYbz7qaurWaN4d1A
 /dv2OpmusTx7/Px3KGg==
X-Authority-Analysis: v=2.4 cv=acpRWxot c=1 sm=1 tr=0 ts=6a329263 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hClRAUHGN4GkA8EATyIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170118
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



On 6/17/2026 2:39 AM, Joel Stanley wrote:
> rmw_xireg_aia() and rmw_xtopei() were changed to store the IMSIC
> callback's value in a local before passing it back to the caller.
> For write only CSR accesses that pointer is NULL, causing a crash when
> guest programs write to xireg or xtopei, such as when the guest sets up
> the IMSIC.
> 
> This only happens when setting aia=aplic-imsic so none of the existing
> boot tests caught it.
> 
> Fix it by guarding the pointer dereference as done for other CSRs.
> 
> Fixes: 63469ad75dcc ("target/riscv: Fix arguments to board IMSIC emulation callbacks")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/csr.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ec931a8c3ddf..4502f2ab4788 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2732,7 +2732,9 @@ static RISCVException rmw_xireg_aia(CPURISCVState *env, int csrno,
>                                       AIA_MAKE_IREG(isel, priv, virt, vgein,
>                                                     riscv_cpu_mxl_bits(env)),
>                                       &wide_val, new_val, wr_mask);
> -            *val = wide_val;
> +            if (val) {
> +                *val = wide_val;
> +            }
>           }
>       } else {
>           isel_reserved = true;
> @@ -3008,7 +3010,9 @@ static RISCVException rmw_xtopei(CPURISCVState *env, int csrno,
>                       AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, priv, virt, vgein,
>                                     riscv_cpu_mxl_bits(env)),
>                       &wide_val, new_val, wr_mask);
> -    *val = wide_val;
> +    if (val) {
> +        *val = wide_val;
> +    }
>   
>   done:
>       if (ret) {


