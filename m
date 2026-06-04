Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7734CD6E57
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 10:32:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV5NO-0000FJ-1P; Thu, 04 Jun 2026 06:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV5NN-0000AS-4h
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 06:32:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV5NL-00024J-GO
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 06:32:36 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6545Phdl994551
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 10:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s2bm0soveXyDcdRVU3mWv7kc4r4tWQMK5ADnOjZAu8g=; b=oaQ/RyiEw342T1rP
 euuUSWFCxtEei8FODLafx4HLQwUj04uvoQM+pLF/fkw2XjKPjIlehd+l0F18GVz8
 mHjvyvSzilAze0fjn5LsneBAkQPBQ+JekMszCp5Bi3hb6qqXPSHvMtdkyXLwdrWZ
 mQtoYicsa3pjlDHGHmvGbDtXz/32iexZdEchC7UAuSS51Kut0Prm1SL8hsMfRsWo
 PggF1gWWsOWFBABfmqhr5Olqqm0sXnf8bvzxlKRofQGrXMWix2mjfPMsi2qdY2Si
 IxUt9XrY1J97/IqGi1uT34i5iM3ALjFeGmmgdUiz2NW7qzyuYU95VzY94kgBHl8J
 cSHtnA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek374s376-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 10:32:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-91565f8c589so90433685a.0
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 03:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780569153; x=1781173953; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s2bm0soveXyDcdRVU3mWv7kc4r4tWQMK5ADnOjZAu8g=;
 b=a4nJuYeY7ZMJenSJcoQ/6z+8HYpPkp3zjzYdA1RDmyFheVnJxbmOx+zcjzbKED1AL5
 Dtlexnc9iw2XMSdN9FiqdcDyIloqrzpK74T/8pDz/JyZp+3zkCQDy5yCbU1A0yzmUOoi
 VZCH9xnnt9dAyOG97KYngzP8ORraE63JIsXKVoOREfQGf9hP04HYknOqTZhi04RUxwVm
 F8ILwSk65oKNRJTkG4nb2P/aD+xi4qUsKivdelUv/6qp3odvpBMJUpfKRr2UKVxQceAB
 521fzgamGjukbdRlNmMGtL4ccBQmT60hNqx54/5OErk41AUl1A+gHoQ1gf0hB+iwUD4Z
 mNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780569153; x=1781173953;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s2bm0soveXyDcdRVU3mWv7kc4r4tWQMK5ADnOjZAu8g=;
 b=hJOA+r4sJ3Oe5mpC77GtdMReuRL/bJ/AVw8WWsBTA4y9JZhgIlAy1dvgZwkyok3F9q
 vymyl/GPJQkMKPVcLA2csz10AEqBGKUIMneD+4Dfj2L3k9y+cRJG3gfHaCmY3p6oqvD1
 NR6ADsJqhUaab2uBH6WeaYUhEbAGiPK4F9kLCkkc9/MUKXa18PjkKGw3/BytJ1tRUBgq
 aMJN6ejnw3/bN6vMtqTlkaJ12wCeUPKzmsJYsF4OXkJ8KhTaYUbopt5P1QH5LOrqiDKu
 GBNP/7HaZAlsKcNFd/71HRG2KHI1HdNC0F1xXwly1f9uJV15aGDstd+Va0nlFcx2KOmo
 dk/A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9UwE/DVW/Rt/12HmfGJVLgwthA0zcoOrim71pOJ8ITYmBwoX278S1TeILb0LXewlSdles4NkWU4pqo@nongnu.org
X-Gm-Message-State: AOJu0YzGn3Al/St4M577/c9KUz/rHip7hUg0adqZHFF3ZAdLcBXFCspc
 Yw41X2oYIZBZ8/pwEJgXCMuNslD4RIBIMe588YQGd9gIClTPE/prji/mj8JWHJrdd+v0tfvEAvR
 ynexwuZY2/0E7u7ZxkQXzl7A6xWDx6qJixwFRcpz01MWpY209vtyLSTA1KA==
X-Gm-Gg: Acq92OHZpYr/17NL6iPQCyCuKVB5EAKdwVGCZwvk/nTYpw5HWhhm6WnHPecA6N5lPP/
 8sHfPyzTxhXW80reRfmzRhZtoIl+RpAfAnvRCa+8jrrSv4wvnSncQohIXfXHVIbrSNX4E3QKzAL
 mqApxiOdIjS7n1FLoo56hKlpS3ElZ16q/8OOj67LOTba/7WxtFVaRrrPFBxX9IGPuLOAsju5Oi8
 4kjyIcfVLXhM70xFTn3docGeadJdx8W4oEA/vU3UucXpgwPgQsbW4uW8ixCdG2fbeOdqdLpq9pd
 pGsgLLUCQE6S9WH2VYq12xeFIDvLqRf1SR9RQMkHxZPfSObZPx7z0+BUEIVjOOXZGHjtPilr9xn
 0Ck6XcHA1GuAlfkpYm8OlCQ+98m9egZWulF/3nopFwCNe8XVLTnQlkN/US7vYeVFYxUgY
X-Received: by 2002:a05:620a:6192:b0:915:8a4e:768a with SMTP id
 af79cd13be357-9159aed266dmr435384885a.14.1780569152833; 
 Thu, 04 Jun 2026 03:32:32 -0700 (PDT)
X-Received: by 2002:a05:620a:6192:b0:915:8a4e:768a with SMTP id
 af79cd13be357-9159aed266dmr435379685a.14.1780569152153; 
 Thu, 04 Jun 2026 03:32:32 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9158a3c2492sm581303785a.34.2026.06.04.03.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 03:32:31 -0700 (PDT)
Message-ID: <3e4fba18-0620-4951-bedb-e3c962175dac@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 07:32:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 25/25] target/riscv/debug: Fix minor comment typos
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, Alvin Chang <alvinga@andestech.com>,
 Yu-Ming Chang <yumin686@andestech.com>, Joel Stanley <joel@jms.id.au>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-26-npiggin@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260114044701.1173347-26-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEwMSBTYWx0ZWRfX3c6sYMYm73zY
 dYiT89EnuR4PraLYbb/wdUyNWnkJgwhL4KCCt3mlF5jHbw4iMiVM7BW1FmWZM59VC82QZph00E3
 zX6bTV/SXhu8PDdcxhm1oCXbVFbxJYQ+wQZNe/7bUWrl5gUurD8PNJOVIJlMuWZLigedFRBIk41
 /1Qtax6T08Jyv/Np6Aayf40hbFpg2QoXpxnK4KxrmikWr1c9NtC5dh5odCu9G9+Z0MKUPtsx/JE
 xKVkERSH+KdLqta8iHKkVVaS9twMmPvMDxIg31XIA0eI9GKu68fP2WaRY/ia24iBg1jvpkFbokF
 zVI/fe7s1DyHYFxzvBVvWzE6yvqfff1WteOMAVyeIlRs5VXKNHUEekykm3e4Rhq4Rsovc8wen+Y
 MWIMD9lzLi+7vTXpE5YVx2yPgww9qPYEKjEBaIdNuQO7rWnKaoMJpheWzI/9cxQABOsOSVjF+FF
 5UXudWeUHx92sgE9Gyw==
X-Proofpoint-GUID: 6_es_1b4a5QzApA_50IbQlt2IzBsGtPa
X-Proofpoint-ORIG-GUID: 6_es_1b4a5QzApA_50IbQlt2IzBsGtPa
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a215441 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JvLbQTfvwFkklDSfm4gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040101
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/debug.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index d7c171736f..32aa46262a 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -120,7 +120,7 @@ static trigger_action_t get_trigger_action(CPURISCVState *env,
>           break;
>       case TRIGGER_TYPE_NO_EXIST:
>       case TRIGGER_TYPE_UNAVAIL:
> -        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
> +        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exist\n",
>                         trigger_type);
>           break;
>       default:
> @@ -895,7 +895,7 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>                         trigger_type);
>           break;
>       case TRIGGER_TYPE_NO_EXIST:
> -        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
> +        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exist\n",
>                         trigger_type);
>           break;
>       default:


