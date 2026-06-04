Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE8FCD6E57
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 10:32:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV5NB-0007s3-Is; Thu, 04 Jun 2026 06:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV5N4-0007hJ-3p
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 06:32:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV5N1-0001qL-FR
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 06:32:17 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654A9cM23234473
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 10:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kcoYFesn4CUliLj5oo105SmiNe62ojOiMqdnqrtBJZA=; b=aVLWm9EASXmg3V8V
 DD4hJ2CkhOgH0P1m3EoZKR/19KwNXd8NlTppwzo2ShcKMvWOOIlcibAiYazNQ3pU
 NaDsscj9D/3N6F5hOx7rztTD4xK7ygiACHLfuiiDJHyO3T4CLvUZNNmbyQ0mEa9X
 PdvgI2Trdr2q3v+6PheCnZLzoK9iNVJx/qmV3bBk1pjcdXGJeyyoaWM0rLr7xip/
 IZdVMX39bS8qccpQI9cYxjUsC9ogx6R7YOFnotlRn04la4iOaK/F9qyRmAlkS+DI
 0400NKVirzNYxWWmVFEEQNobGj29MDkzZ+NdekA5Ql6G63aJbF+FX0UJf6inKXK6
 XVjp2A==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s38xy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 10:32:13 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-660575c74f1so873325d50.3
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 03:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780569133; x=1781173933; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kcoYFesn4CUliLj5oo105SmiNe62ojOiMqdnqrtBJZA=;
 b=LsgdALmvJvIag8WywMviqgQbq1ujtEDGOCK9N/vbVjrutzINqAhDBn/WSYpL4iTe1p
 nlzWBX3vqkQZyQ1soUYa8a/sa066Xq6fXcj6/S6DtfzEhs1uDR/0jrrMXzvQn4/1/GyM
 GXZSbqSl7WzJGMZx4F4ZVYrJYqg5iczmerLImuCP3kJJ9WiPqirpaPQkxI9Sw7mHUi9/
 hcNb21H6wbcOvFl+3Vm2S3MMLckTnar0TocysQdFK6T5BwguqBz4NsTs+lU/NjlYW3FW
 NqP/xD3FviEeY5+BHovUBpd4CIO88LLF6hbNtNRp8j739Wv2bJ9/fh6ua21s/iTcQVHC
 2Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780569133; x=1781173933;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kcoYFesn4CUliLj5oo105SmiNe62ojOiMqdnqrtBJZA=;
 b=ZRYnWhZvVqH2UztsW5AXag1D5+0ifJyYGleP1NLCGlVl9KglOphj7c6b99BsGQaU+s
 3EvTxWn9w0UdCNGHt3BEIc4j4uT6HIHzoDuPJS5Wz61QOdoTiqFSMWZ5VFjG8ipnW62j
 2LVU41OyX6m5RjACeHY1Ysrq+xHOPj3DPMkKWLjotjWqVvlBNN4eB4SfsMxD4QhOCuLn
 qKKQXpT4EBH0sDpk1UAG6ujeLFzSoYL9+wbTq7mo6ND/V1lK68Fx6OiTgXe9PfICn4fh
 JnGD9fT9hvFI99MlVpqBMj+EbZaJKs7+hCldflftopkDXRl6190Aof1TIMN6iaKQwJiq
 kgfA==
X-Forwarded-Encrypted: i=1;
 AFNElJ980wfe62gugDxBxfabPRGs22N3TCuvl9nUr11d7yEB+A1EBye/HPOxEIg0dHCTZOwjRTfUwwketAam@nongnu.org
X-Gm-Message-State: AOJu0YzwMEEHI7phoDrlmxclOIrBDSWVJNSWlMd6T6Xn1Isf9GCo+s9b
 gz31NfIwLa+yMOxQWbEPurnZKWvNGwE8F08/GgcpWg/r8ofjb4uqoJIeNVJ1YsW+GogzmjSpToX
 5kFdmbJGmg7v+IZhOqTY1j5qGStTClq9eZk7C4Ge3lr/DFFpO8R03+JL2xA==
X-Gm-Gg: Acq92OEgl4HWWml0SSo0g8UeW0eLvW2rwyQSypUHWG/Twz8JJGHUNIb+NO487yQHrOw
 VJBS+3LesVIym4kGMayRW3utoZlecX0imd8eis+JnzaBzhBfVIYIHUVWDyoxardv9/5w52ZxDh2
 5QDhUyfizzo5rYG++YmafwtkBEjWjvBrtSVRRICPIPJK2+Y/wjQIGYPamSyQElZHtFQ69cQhjgf
 DadctwRu1TjcMPYHEqC6sQkdZ5eW5HaSDIvf+BxV0+jYh6x+wKdz26i4CVegu//y8y5wdvzHrtU
 +eS+4nWQmDQMOU1PsjkyI7wdRlGmsn56EWKiKXsk+q2YFZ7sxE99B0u8lsV4XQhrjj2HOq3dH5k
 I9ow/tzfGW7bfnlpAvFZr7ZQhlFmmYW+zBme+dGPg1+r0sq9sJgUAikTtGHwpiWDH7+i4
X-Received: by 2002:a05:690e:169e:b0:660:7460:f913 with SMTP id
 956f58d0204a3-660dc0515cemr5905157d50.26.1780569132712; 
 Thu, 04 Jun 2026 03:32:12 -0700 (PDT)
X-Received: by 2002:a05:690e:169e:b0:660:7460:f913 with SMTP id
 956f58d0204a3-660dc0515cemr5905127d50.26.1780569132131; 
 Thu, 04 Jun 2026 03:32:12 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-660d62046efsm3561371d50.11.2026.06.04.03.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 03:32:11 -0700 (PDT)
Message-ID: <3db409c9-65ff-4556-be69-7026ef3dc637@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 07:32:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/25] target/riscv/debug: Maintain itrigger_enabled
 in helper_itrigger_match()
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, Alvin Chang <alvinga@andestech.com>,
 Yu-Ming Chang <yumin686@andestech.com>, Joel Stanley <joel@jms.id.au>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-11-npiggin@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260114044701.1173347-11-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kF6g-VCUGJGkr7HjFIuodOpZqmBKHwSx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEwMSBTYWx0ZWRfX7Cc4oGeEDtth
 1f2yN7KRVzPn7NEx+nuj7BQxC9pr7eYgxvU7wz1Fz19qCxQvSgnOvrVfgd08WGoUJ5cNnPbtbIH
 3kdYIE9BA2gkddzwN8e6LruFwezIiKwI5JGq4NbHBkXnwLHfA9Ae2/KObZz0rW61fPWyXAPPk/0
 ZlgFrrVQQLgtNya5XhuTsu3QwMT6CgPBR4jflzaChIO69G/yrMlOSKBMDVkYqCK7v4PVjXfAmYm
 G5H+IuIlFONXrf1Kxj+h8DccjOzqeMmhx75CUNPVvKGGaYFazBB+512jenG92uNanFwXs0vMMFu
 1vPMgU/6mcH0LGIXhpPhoLrsHJlQlwIdCrLJyQRHGNRdZWJY+fF4z1zmkgkMmH5d2wpZQPPYc0S
 ZcEzoEtlaYwmARwkf9SmMNjsyV1EAceFp6dCzVq+dFy2igykIn4qctf/o8Vo3xnIMEJcId5viIR
 vdjqHhFebpeY9YrX0eQ==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a21542d cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ftf0STVcFXjSZnxUVb0A:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: kF6g-VCUGJGkr7HjFIuodOpZqmBKHwSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040101
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
> helper_itrigger_match() iterates over all triggers so it can maintain
> itrigger_enabled rather than calling riscv_itrigger_enabled() which
> becomes O(N^2) where N is the number of icount triggers.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/debug.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index d835c0e79a..7ae02fe2d2 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -693,9 +693,18 @@ bool riscv_itrigger_enabled(CPURISCVState *env)
>       return false;
>   }
>   
> +/*
> + * This is called by TCG when an instruction completes.
> + * TCG runs in single-step mode when itrigger_enabled = true, so
> + * it can call after each insn.
> + */
>   void helper_itrigger_match(CPURISCVState *env)
>   {
>       int count;
> +    bool enabled = false;
> +
> +    g_assert(env->itrigger_enabled);
> +
>       for (int i = 0; i < RV_MAX_TRIGGERS; i++) {
>           if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
>               continue;
> @@ -709,10 +718,12 @@ void helper_itrigger_match(CPURISCVState *env)
>           }
>           itrigger_set_count(env, i, count--);
>           if (!count) {
> -            env->itrigger_enabled = riscv_itrigger_enabled(env);
>               do_trigger_action(env, i);
> +        } else {
> +            enabled = true;
>           }
>       }
> +    env->itrigger_enabled = enabled;
>   }
>   
>   static void riscv_itrigger_update_count(CPURISCVState *env)


