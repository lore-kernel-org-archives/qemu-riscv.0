Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E69CD6E57
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 10:30:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV5LW-0005Xb-Ha; Thu, 04 Jun 2026 06:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV5LV-0005U6-II
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 06:30:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV5LT-0001D0-Bp
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 06:30:41 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6549QNNU2260700
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 10:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rJ5GhClRxXOOsPIriWVFHhOpYV2R2uN6Wj1UleCX5a8=; b=Na6zpWDZJCMVx12v
 705aWkcR4vQE5+dpVedTfVhV0h8CqwiIAeX/Bq4GE5uyUcHaSGOIC/WRtDQ9JxRa
 94QXvER6RTigG038b+nSPSLevC+4ZMsgLVBUWKYujNffl8tfXoIWfri7i9QIcHFP
 ZDlt0FD6WzK5w0IfcPCRCUGan1PIhJxX35Kmq3PzkPwf2IX+WJu3h/1YQlHFw+tm
 Y9IjuANbkydpihAQt64Gs1UyNHzd7rqrpBIxgCPxz0QimK4eKh/WSEpqnAokYhhu
 xiR6NMDBryCnOCmV0vh452LCeP9WbvCylp1OPnHb/qS29rhun6WZNxFwfWBIBC6J
 xW6PLQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejr2mkmex-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 10:30:37 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-7e2f76639dbso7029557b3.1
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 03:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780569037; x=1781173837; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rJ5GhClRxXOOsPIriWVFHhOpYV2R2uN6Wj1UleCX5a8=;
 b=SpQwfnn5T0z67cYj/d6Su7V1IGI7LKztGm88pASJ+IQ8YD3jOwAM5BkAhEP8twKTxQ
 CeW6nzJX1AWp5hxhY7Tl+yVCnzxyRfN8cxLO0G7yXvgmhVrfIP1Ate3qvqH+fvylyAjz
 Qf48yHZU+QUykSQ1I7i7RItVFGFnO2i6FELwmlhmZ7KChdlNhzcArrG3ljQgFRKEbHPS
 QteDv3cUxYfxKZvFx8W0jvp7+cRRmfAghkQni2+M3Og4Yx8H7J54xb/hDJG+xaUmo/Cb
 EhhWBveW6XIar/QeBU77SHww327l2IKqG7IcmGbY4lKvxfJF8MKf6j9EK1TjZG0xXQg8
 dZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780569037; x=1781173837;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rJ5GhClRxXOOsPIriWVFHhOpYV2R2uN6Wj1UleCX5a8=;
 b=sZsRZqTuckjxVMtyDDaHj81uaDTJ6jGOMudefRzYN3mEamyxROYBycIjuuXO4kF+sl
 4N0P93ae2CUp2U8J6KKY6vnAI1rVZ89opcka3ifVpiCH0EG6HDlSZO2kpfhTavhtzTom
 8/n4FWbu0MuxzA/cXy60iosFCauELR04H5sQZG/vFGeiYnlrtXwRDBW+mSf50RfNQ0JE
 1rxmoatKtiSnXBvn/tIQ0JKbXVAp+K3n4gfsEtWUfJldB/cdmBNXXxRI8GO/DpuQNMk4
 84xne3BC6JsLcgD8LfHXjzABTm/trbLQBA+/zoSGuwuaNa+uyinpw4CJZkY0l3ViGM1j
 q/LQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/owdX3xv6dU9zRw1BGjiU4jqkrTaKFwQ7DVGCgLfssPbp99M7SNXl8Ha1FqnPIbUmc+QoGQpJpgPZz@nongnu.org
X-Gm-Message-State: AOJu0YwprvOk9x/d4LF2AqFFwyeOeW2H7vozGM2CHNUQSmS0sin5H5Ri
 VJW4lsvhnmI71rd+a36/WuPwa14kh6fmK+gxcKUWQT+ZqiA1kqIC/OLaO2HmJYCR/I+vviDKEGC
 1Fhami08CW+i+PN0lcQIcJXgvnsReLMi0AoqSoun9KMrG6Tec+LRpxefy6qWrzUsuUw==
X-Gm-Gg: Acq92OHoNPRWLCIipMifNwrh482Yrc2CypJFCJbBcltc4Yp4JfkFkYb/pSDDzONMrsH
 jFWWAcHZfYS0xoKK2tk3EF4u/01pHd3IGrIyBHoZJYeoY4lA9W844BhyA8yLeXFAvk8O3AIrSzd
 InxsxouvqO6h2qTKlTlDbWqYhLQda+K3AlHhBYnjfVdf8dsG1oUIhtHhJMG5xO3f/RYryOtfyJ/
 iXX/8IHH1D3aLL35d2ZrALr+GEcjj4t5MU7ytjghsxmISU3to1yaYCPzoNA+YZtxnXqgxvATraq
 nnVCnqyHZ64z/xsuexY4kNa+SUO5Nvj7D+/bPbK330H3ShSe2a88pk/2Eb90Itpio5DFSkIElhx
 Y/KbyKzJXfPCvQXBItmMjJrDay3XGtQBfPPGVqTAp5lfL7cB9jqStD2m4Afo5/+0m0KHl
X-Received: by 2002:a05:690c:6ac9:b0:7ba:f3a2:551d with SMTP id
 00721157ae682-7ea4a2575f5mr62455027b3.15.1780569036768; 
 Thu, 04 Jun 2026 03:30:36 -0700 (PDT)
X-Received: by 2002:a05:690c:6ac9:b0:7ba:f3a2:551d with SMTP id
 00721157ae682-7ea4a2575f5mr62454777b3.15.1780569036358; 
 Thu, 04 Jun 2026 03:30:36 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7ea215825dfsm31443437b3.15.2026.06.04.03.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 03:30:35 -0700 (PDT)
Message-ID: <50b16245-dcfa-4574-9a50-c5e0819562bb@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 07:30:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/25] target/riscv/debug: Fix icount privilege
 matching icount_enabled() test
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, Alvin Chang <alvinga@andestech.com>,
 Yu-Ming Chang <yumin686@andestech.com>, Joel Stanley <joel@jms.id.au>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-9-npiggin@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260114044701.1173347-9-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BJEhRCSG0_esZujbpUhG7CVJBNZzGaJY
X-Proofpoint-ORIG-GUID: BJEhRCSG0_esZujbpUhG7CVJBNZzGaJY
X-Authority-Analysis: v=2.4 cv=A91c+aWG c=1 sm=1 tr=0 ts=6a2153cd cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=aLERe-55eW_5Fbas3b4A:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEwMSBTYWx0ZWRfXyQMiYUJQ6+yR
 nsUPaQXBhChRFqAE3Q9T6B3eL9zVWrTurqmfElfNpox2f150e7+byVAR7evVqTxDFRWQY62g0Pz
 N25Kl1vhSAmK+GkbJGJ6uvB4HZCHtnjHENnRgqBjU8ai6eSDk2u1d6KPTtK1KkM7j7BsAswMTZ/
 1qUT+ZmNOTqDayAi+ZaZXIU04bQREWjCIIipqd2fr/GineocXpjCWzI7MKDNJt5Mi5Azw/H7BWa
 sy3uzq7P/M0R7mBBnEcuHbTAzpadQTWKf88iwML6vFJtxlw7zX0WSdWxzT3jDtp7Wpvrf+4seDZ
 hAMHK8z5RMH4g6rMrByPYjJ9wZjufRP5gGJpTRiekSnspeQFufacmN1xGD98A/vF2M52YUe+Clz
 JV62CdnVPaDttPwbVTcXjmaR+KljGMLYVqBo6iEpMwdt9PHN49KB4t1M7turUCaSbRsKQN/Cx2R
 /O4sxZLJYMyFmAF+Inw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040101
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
> itrigger_enabled should be set if the privilege does match. The test is
> inverted.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/debug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index af9c4e37cd..ecedffd3b9 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -679,7 +679,7 @@ bool riscv_itrigger_enabled(CPURISCVState *env)
>           if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
>               continue;
>           }
> -        if (check_itrigger_priv(env, i)) {
> +        if (!check_itrigger_priv(env, i)) {
>               continue;
>           }
>           count = itrigger_get_count(env, i);


