Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C53ACD6E57
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 10:13:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV54X-000745-Ag; Thu, 04 Jun 2026 06:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV54V-00073J-6r
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 06:13:07 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV54T-00037E-EF
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 06:13:06 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6548eppe140473
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 10:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Xm03tST9fzT9MyJQpSMYrjwQGbFrj0REQ+IKEH8HfhI=; b=dq2B6BySvsUV/W1A
 QwqhyrBGV0v2wbTdOGHpisqf+63u5JeM8ATMfQhXZ6Ax0+hn8h2P0vCUOu8a4868
 QNWvirqpBemeW1zQtPJr2pmLAiYDAef0/QK7OM3CqhuBRs/tTGLCtp7DxxzY+fNA
 cmHkRIV5W8IOHfDPN/CEPy/clnXCNHMYiBlmyq+xaKzVOKMphbhAeN1yrWv8XBy3
 5KCrwXkz5s4zsHuI6coYo7rUOHOsPUJ7TvlbYCgsyDgfKlBBP9EEkvV68FRpuQ4M
 J7Z/Zkf6w8cLOYU+o4k8T2EsIkOwf4U0I1XL07hQb/KiY1h5OAtzxeXL3T0ExqbC
 mq4jNw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen9t12-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 10:13:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-59eba324559so232255e0c.1
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780567983; x=1781172783; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xm03tST9fzT9MyJQpSMYrjwQGbFrj0REQ+IKEH8HfhI=;
 b=iYLRXIMqFfKFSZ6nB4QTOktDahNYESJAt/qOcVZjDCuKKZBZFDLat6aVLNQPRmiDCT
 /ZXAb96QZO7wvdqvkYckubN0vU8/86RYOPHsTpMd70uv6fvryT+Udj4+0Zg/oUoEOZeU
 HIiepx4lXde6ZjTWxrwHwbN/kte4I1Qa4d+l7thj0B1iuLVQ42kky7RH+BxwyR9aR1YO
 3fKSXiRcD898HSw+zhs3YJxF4ifnME9Le6H9wKmdJLW1p9rlDi6xgmTHzsSUAO6fcBzQ
 76SWFT2PRo87bym45yFmJaHfaN8hDNK52lH5UvnYNan8yCSJIrfipgoFTbEU6nVwxLkr
 JC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780567983; x=1781172783;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xm03tST9fzT9MyJQpSMYrjwQGbFrj0REQ+IKEH8HfhI=;
 b=Lt1hDDKdP/AWERK89CmSxopDXK1ahv0ka76gnyPkiw8t+zRc5TpCQL2j5vRk/EujGh
 bZaggbJSSivWhpYVA/qAJHa7Op1BdEsegtYwffOjJICVHuEt/4vtqh4P6HDyfiMLV6EJ
 TOeA3ADeQfDWQ9GWAPcni2i1qZz2PKJG/FAaUtL4yA5bQ8FCPyj+9sXZgm79d4F6cBkM
 HF+Jk/BZUkH6qcYIIxdUkUOgJFYxLc3c1eR3u10cXlo+nm9gCiyZR1aqH9UMcahEdaXu
 Re9ZjpNZ9OU36/YAvMw4iaDNmxGLXVH3lzuNn076BV0j2I4k80ajkJ1X60UIXXMtnD9j
 U0QA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/B2qgS3YV7uZvTLSnWQHrDkne9qPaZt6yy4sYXQi9rg1dhhTCbcODeojyTRFOFiCGdwnz9vG91AHng@nongnu.org
X-Gm-Message-State: AOJu0YwoX7V0cJKAndLlYSISCrPUwIuXx+TO9VIyt6pQWKvA8PvgWfRb
 26D/fg3V2wD7+VkWwnc7EGNZhEzf1kBfA1sN0Hu0/9+rmHs71s3/iqgTo1wAwnqJNfbq4yC3+UK
 mMDVWHpZ0JZxPn2Pb7n7cnzQ8FzPJNJ55tF4rgwput0y1u3SIKJDQl81owQ==
X-Gm-Gg: Acq92OGnWyuVyeIKTERdQ5zM/PC/lKhMrWhb0nyYBENjmQOmY852zek6jxiRuumppwF
 wD90CGHdQP/pUiNiIwMs+nhFqcFZA/8ANK6IiJNtgGN6UzIGUf1/TnCmfIZyXhcKCcg8wSZYzYj
 Vir/2FFXn1hlU6NyQTFnCny6toAQ+fNA8igK1bcjr7nVMutxRcXBAoLt2UE1CNZ6dBS0Rc3UaJt
 /3sHUwlaMwfh1LeQMdbPEpjO5iJNxbP/XML5BfMVkHTizY2jk7WcNjPq3WXK8mwsCFSc89OzR+b
 jCVazTZup6cFg4PqiUh05n0bJ1SpP4n0c6Qqqg9oYuJQZ8vcOmoZtWMm/7dZxwXWBxcsvIZvcV1
 CxkOXLDYJoQy42mKBGfKmaYIGhlvvL9x21CE/PzunBr/K0ZfAqaQHplsZmSV2loSihcyc
X-Received: by 2002:a05:6102:4411:b0:6a2:b2a1:f16a with SMTP id
 ada2fe7eead31-6ec2a219b09mr3968680137.2.1780567983052; 
 Thu, 04 Jun 2026 03:13:03 -0700 (PDT)
X-Received: by 2002:a05:6102:4411:b0:6a2:b2a1:f16a with SMTP id
 ada2fe7eead31-6ec2a219b09mr3968671137.2.1780567982640; 
 Thu, 04 Jun 2026 03:13:02 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-6eb649b5513sm4534555137.8.2026.06.04.03.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 03:13:01 -0700 (PDT)
Message-ID: <5f487cb8-df3f-4692-bb1b-ff3360338429@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 07:12:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/25] target/riscv/debug: Fix icount trigger
 privilege check
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, Alvin Chang <alvinga@andestech.com>,
 Yu-Ming Chang <yumin686@andestech.com>, Joel Stanley <joel@jms.id.au>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-5-npiggin@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260114044701.1173347-5-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a214faf cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=yd05MXNDD4I3yKd55G4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: 0xSfNb0Lk5Hl2VdNvqaMvbd6MxwDdY1C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5OCBTYWx0ZWRfX3ANAzHGWmK4Z
 oHn6ROoZIFvVrh5NQ60Du7RfIAijqPDSY4JAslJIA0b3kDy25WAP8iMmEuqKJR3z4NfmZpkUSMd
 qJsEzPuCfGbeOACkXi5va+ADoDR13Rw+7BCwFr72eCqQcwENVXK7lsC36wBZfjOPfPRR+OUmW2l
 d/ZTqgJvFzccpc53U6XT4zfMigRwVE4CMjStjTdzzHOHido0Xs0XCYg6xlsVPOjMbwqrS9nwRSE
 9+skc0aa+/wuh3vpK+9I6Ja1B3ot0dHOTPu82WhAfrK7WH8h4/pBvSfAeoMq5J6MaAx4wVn8Vrp
 V8ZL6scMj2yLN7CQfZUhiO5TT67bE5sJRHu0WswylqACkKWbutZAWaYQeNNKTYJf5M4zHOOUVtE
 Ys63xETFOvot6N5osxu9RDHlAe3ivo+0YK5sKNJHGDVGLJw1yBkmbu2lcw1aIAgt7e/dlMS0Pn6
 E874dAa2Yc9vGZGZW7w==
X-Proofpoint-GUID: 0xSfNb0Lk5Hl2VdNvqaMvbd6MxwDdY1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040098
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



On 1/14/2026 1:46 AM, Nicholas Piggin wrote:
> The check_itrigger_priv() did not check privilege bits properly. Move
> all priv checks into functions and have the icount check follow the same
> form as the others.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/debug.c | 82 ++++++++++++++++++++------------------------
>   1 file changed, 37 insertions(+), 45 deletions(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index c92bd9860e..2effbb49af 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -306,48 +306,50 @@ static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
>    * Check the privilege level of specific trigger matches CPU's current privilege
>    * level.
>    */
> +static bool type2_priv_match(CPURISCVState *env, target_ulong tdata1)
> +{
> +    /* type 2 trigger cannot be fired in VU/VS mode */
> +    if (env->virt_enabled) {
> +        return false;
> +    }
> +    /* check U/S/M bit against current privilege level */
> +    return (((tdata1 >> 3) & 0b1011) & BIT(env->priv));
> +}
> +
> +static bool type6_priv_match(CPURISCVState *env, target_ulong tdata1)
> +{
> +    if (env->virt_enabled) {
> +        /* check VU/VS bit against current privilege level */
> +        return (((tdata1 >> 23) & 0b11) & BIT(env->priv));
> +    } else {
> +        /* check U/S/M bit against current privilege level */
> +        return (((tdata1 >> 3) & 0b1011) & BIT(env->priv));
> +    }
> +}
> +
> +static bool icount_priv_match(CPURISCVState *env, target_ulong tdata1)
> +{
> +    if (env->virt_enabled) {
> +        /* check VU/VS bit against current privilege level */
> +        return (((tdata1 >> 25) & 0b11) & BIT(env->priv));
> +    } else {
> +        /* check U/S/M bit against current privilege level */
> +        return (((tdata1 >> 6) & 0b1011) & BIT(env->priv));
> +    }
> +}
> +
>   static bool trigger_priv_match(CPURISCVState *env, trigger_type_t type,
>                                  int trigger_index)
>   {
> -    target_ulong ctrl = env->tdata1[trigger_index];
> +    target_ulong tdata1 = env->tdata1[trigger_index];
>   
>       switch (type) {
>       case TRIGGER_TYPE_AD_MATCH:
> -        /* type 2 trigger cannot be fired in VU/VS mode */
> -        if (env->virt_enabled) {
> -            return false;
> -        }
> -        /* check U/S/M bit against current privilege level */
> -        if ((ctrl >> 3) & BIT(env->priv)) {
> -            return true;
> -        }
> -        break;
> +        return type2_priv_match(env, tdata1);
>       case TRIGGER_TYPE_AD_MATCH6:
> -        if (env->virt_enabled) {
> -            /* check VU/VS bit against current privilege level */
> -            if ((ctrl >> 23) & BIT(env->priv)) {
> -                return true;
> -            }
> -        } else {
> -            /* check U/S/M bit against current privilege level */
> -            if ((ctrl >> 3) & BIT(env->priv)) {
> -                return true;
> -            }
> -        }
> -        break;
> +        return type6_priv_match(env, tdata1);
>       case TRIGGER_TYPE_INST_CNT:
> -        if (env->virt_enabled) {
> -            /* check VU/VS bit against current privilege level */
> -            if ((ctrl >> 25) & BIT(env->priv)) {
> -                return true;
> -            }
> -        } else {
> -            /* check U/S/M bit against current privilege level */
> -            if ((ctrl >> 6) & BIT(env->priv)) {
> -                return true;
> -            }
> -        }
> -        break;
> +        return icount_priv_match(env, tdata1);
>       case TRIGGER_TYPE_INT:
>       case TRIGGER_TYPE_EXCP:
>       case TRIGGER_TYPE_EXT_SRC:
> @@ -665,17 +667,7 @@ itrigger_set_count(CPURISCVState *env, int index, int value)
>   
>   static bool check_itrigger_priv(CPURISCVState *env, int index)
>   {
> -    target_ulong tdata1 = env->tdata1[index];
> -    if (env->virt_enabled) {
> -        /* check VU/VS bit against current privilege level */
> -        return (get_field(tdata1, ITRIGGER_VS) == env->priv) ||
> -               (get_field(tdata1, ITRIGGER_VU) == env->priv);
> -    } else {
> -        /* check U/S/M bit against current privilege level */
> -        return (get_field(tdata1, ITRIGGER_M) == env->priv) ||
> -               (get_field(tdata1, ITRIGGER_S) == env->priv) ||
> -               (get_field(tdata1, ITRIGGER_U) == env->priv);
> -    }
> +    return icount_priv_match(env, index);
>   }
>   
>   bool riscv_itrigger_enabled(CPURISCVState *env)


