Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F827CD6E6B
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 12:53:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV7Zc-00073z-6B; Thu, 04 Jun 2026 08:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV7ZS-00072d-Lq
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 08:53:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV7ZR-0007oG-8M
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 08:53:14 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6549v1aY3233931
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 12:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 07m9DuwL8xVfy60vNdRqdkwDwFOMrb3lvoHMo3UNbU4=; b=iT2P3UDrWE5TLh3s
 CFpo9v9OomnMeoduuevR0nrTafc5vIiMLDZqHQ0/CHbEbQKY1MIG2sARdZIbbTIN
 LiEnUyQFgsl+glDs/8YWBxLzmmYXa68Ok8BS1/ZyI0GzmeJnAPe79H+yudRlorTw
 qzCgCd6TwaIKPYW/QUhFQY+4sGNP41gm0tqb+u92sllYopPySNdDrk32WukEnLia
 Sz6afmCnlcrBwNhyXtPjWZKXWBvYbqou0CwtstgO0QEj3JyMWaJC89zmG3Ii/ZaQ
 q5/t/u8YPD2tggD5p0e2dDqAGJl1bE2+BnI5irFTxhJKitG6rSPoTDkvhc9V050r
 UN2WUg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s3sn9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 12:53:11 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-7e0533b7d8aso10123297b3.2
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 05:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780577591; x=1781182391; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=07m9DuwL8xVfy60vNdRqdkwDwFOMrb3lvoHMo3UNbU4=;
 b=dQv+u5XlXWQXFN5dr3q46DDS0rOu1OOG+66UGDuq3zkQyDimBp4eHS/cnMoitw8J2b
 GCogREVi14kejbJ8P/ZdSbOptkgverMyNXVjV41l3ymu3/ta4FC+zeeN5RHfhXVV/opI
 h3y8ctT/iBbdLk47RIlgywbCzsvqqKyGefwwKy4LA/LX9hfA6cFF1S1xmV2h3p4LnK7T
 NOFV8jKYDPsfvTx71vomhGjlYUPaAEx/tOUz+HFyqW2wK+z9YqEOmuf7FJDZIa73/RwQ
 JyTsUHJO1edgvmw9hY+4JcHv+LH/x1k0Gf7KfnBXwWCTZ2hAQjBI2DvSlTKh10fi8asl
 YRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780577591; x=1781182391;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=07m9DuwL8xVfy60vNdRqdkwDwFOMrb3lvoHMo3UNbU4=;
 b=oLOCUm7AVIVM5HFBKi/suzAUfWViYuola2T+97GOnR8yjez1Ez/AnpZkxEseSWjeEC
 UkjC+U3nQCFl7JDToPWPePdvLTNzejx7l/dh4ePlQazT2xJVgcn5xi92z6hGGuOsLnSr
 PcUOyggRFl0460SjiwUr0h1nsLrccsIuii4nhZSdkJKhG7S/jqZJI/ZscrItjOtnWIlT
 LYl5GdE8Zifv8qkvs2ZCht6gmzwL3R0aeYiEz8LhGUjunzpZ9bZ4H7j6lo4MQgSnJMth
 djoHCxO5DZ4jn2PgO8M8X96R+1W6gWxR+r5PS1axY1UK0q9pgcTy0XeX8ytO6b7XEMtd
 tzCg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9E0Fccx2ReOn/5+dhEFbS52B71yljwe1PpfFPiLBFQE9gspDpiAREt+lMsPZpUdGtjB3cZdibVn/jZ@nongnu.org
X-Gm-Message-State: AOJu0YwM0GRrXlohUTh2terHlOEUdQdWl1Sc5tsIbFVb5z3GXTXAwMm5
 zzw7TGpBHg0OK9DjOJGLBPtZcrXeZf1O5we5SHm+RhVJ4rstcLgNP7e5hHbN5TNSQ/KBlOQa8aD
 2Q3JNVlZJ/GdLer96t8uoUEiYUj7iNuiJgw+u5VeG61yWZBhx6YQsFcX1zg==
X-Gm-Gg: Acq92OFc3qgaTWlC5r9Ae49UFOoc+U1drO5tkh8Whh696UnEEI8H5kI3lgdBlog2GxB
 UP1bQEf1CDmEWckAmLiEwh7CHk0DlSmTtUMKPvpfrFzU8r178UeIROG2HJe29rhjPFQpthCa2wF
 2CK+KE5ftK7uqWpVkwb8XAoRqQTDh0QXHKzImlbne9VUhOsNlMwfenQymD2RZhsjQ1CGAvRewV4
 7PVja0nXC69+k/xjZ3T0EBJEMqTSF+gcKi3pRCO70+p6uS6HF1lfnSd5oJ0fjE12hjU6eLIMk/2
 dWPYoVpkakM7xes/jEWuL0z5DaPiD6TubM7C96JAznSWe/7hwNzzFkH4vAM7K1b4hBSHemCJ9pk
 Nv0mGBWrW53ZXfvHh3VS1tPo9pGJDczrYC0yQakBkeQnIg4gn6B6cbo/IXghsFMjR8R3M
X-Received: by 2002:a05:690c:9a8b:b0:7dc:7764:3e86 with SMTP id
 00721157ae682-7ea46d26ab1mr76717197b3.1.1780577591449; 
 Thu, 04 Jun 2026 05:53:11 -0700 (PDT)
X-Received: by 2002:a05:690c:9a8b:b0:7dc:7764:3e86 with SMTP id
 00721157ae682-7ea46d26ab1mr76716967b3.1.1780577590984; 
 Thu, 04 Jun 2026 05:53:10 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7ea23a9a421sm32921287b3.39.2026.06.04.05.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 05:53:10 -0700 (PDT)
Message-ID: <d1992267-9254-49ef-95c3-9960bd36de61@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 09:53:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 15/25] target/riscv/debug: Insert breakpoints after
 migration
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, Alvin Chang <alvinga@andestech.com>,
 Yu-Ming Chang <yumin686@andestech.com>, Joel Stanley <joel@jms.id.au>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-16-npiggin@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260114044701.1173347-16-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _GSXIgdHJX49K5vgcLh__HrLDyfU9ZuM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfX+JOJP2wXi59u
 s0TJwgV5UGIeDFxAUxoeRIuwe++pKg/BbJyILQ6tqnIexJRSK7gJdSrVVefLhE0RaDgd8h95oL9
 7DeyXtdMlth1H/UiD79013ZcgdZnVz370fyFBAF74+3w2SA3DDmQPH/Y0Vqs7zy9XOBdvdCKKWJ
 R0HoI2VKVoKVW+aElkMy6w6cgY6dCPMAwxd1VZkNGG8TvO4PxD/Ly1arooR4NKnkPdWS97MGR9E
 ud3mC1hztR2/lLg5jQ3450wDXtswLXXUEk0VdSUj7JviV4q8BEUBdDBu0JzbVtUXsRIX4Kb+fDa
 MjJ7xKJLxTuPfObXWurJQhZMRD5JXHRpEhJQ8pJX/1Sh+PfKkroNCKBZc7rNgIZYacZ2WV/pow8
 Lw8LZOZEiEGn0W9V4Lyst8M1nERsTS+3wjuflqWYOHFvPnCEP2ZlnCHfFUyDXZLPrJ9f/Cfie/r
 WB/Ke36YdVK+W2U3eVg==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a217537 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=dy0gJUagH36xpVJTeUYA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: _GSXIgdHJX49K5vgcLh__HrLDyfU9ZuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040124
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
> After migration, TCG breakpoints should be re-established based
> on debug register state.
> 
> icount trigger timer in the icount_enabled() path is also missing,
> but that path will be removed subsequently so don't bother to fix
> it.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/debug.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 24161fd46b..a30b345b25 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -1126,6 +1126,20 @@ void riscv_cpu_debug_change_priv(CPURISCVState *env)
>   
>   void riscv_cpu_debug_post_load(CPURISCVState *env)
>   {
> +    for (int i = 0; i < RV_MAX_TRIGGERS; i++) {
> +        int trigger_type = get_trigger_type(env, i);
> +
> +        switch (trigger_type) {
> +        case TRIGGER_TYPE_AD_MATCH:
> +            type2_breakpoint_insert(env, i);
> +            break;
> +        case TRIGGER_TYPE_AD_MATCH6:
> +            type6_breakpoint_insert(env, i);
> +            break;
> +        default:
> +            break;
> +        }
> +    }
>       if (!icount_enabled()) {
>           env->itrigger_enabled = riscv_itrigger_enabled(env);
>       }


