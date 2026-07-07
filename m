Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5263BC44500
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 13:57:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wh6Id-0004y6-7K; Tue, 07 Jul 2026 09:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh6Ib-0004mY-Ls
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 09:57:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh6Ia-0000Ji-7T
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 09:57:21 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 667C8ZL13783376
 for <qemu-riscv@nongnu.org>; Tue, 7 Jul 2026 13:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XbQmfUPbDeiiKIAiqY/LG68gAdMRWI1U39cpYvkzZ78=; b=JZ4um1dVygcTRr45
 ucsYeOlGcQLOFmNyTvYkdV5V3pY5uYz9gLtHLAUq7Pm5qKkJ4kEwTruW8G4GG27I
 gwWK3Dvj23jclJxk9eQZh2bb40sEO6Cb881t9jXk3RNxWKSwrq/I470484sEElgC
 kuVDMmfbQJdiANlW51/rDQW5WCGYrNOA49jNvFJYNkNbhVyiFsn3b7OzH94Lf2B1
 WYy/qNA6o9WkzBQ82XKOENzVxjcx22jb7IExJYyE1ojeWEe35u/XsdOuhvy8z//Y
 MN9LUozamI4NBJaumQCWw56l/p5IzH9DcUai+xe5+Fl0jHHwQaDpAIF+TX6T4RMr
 jwYv6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11sh4g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 13:57:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51a8c689b5fso43895241cf.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 06:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783432638; x=1784037438; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XbQmfUPbDeiiKIAiqY/LG68gAdMRWI1U39cpYvkzZ78=;
 b=HgwyGITVLRL1+c8m8/5dPVXsKU2XcwZen9g13aXgp021lBPKBINLbpDaYLyNTZdlX2
 2h3vD0z5EcGGc9TF70iK26ieBlji8i+vecjyooXx5F5imVcBGSTkTO59eLcdro1AHcJ3
 y4mOZNQpt9mLwmoumMWBSTkKwAymX3yhjbOZr88KZz2Uo9O1ef6ORP7E1TwWJR7XXlEn
 Kn0cLGASJoXhb+cL7SMMFYvi5e7RR5vFCUoDkdDcvf+CbMyyfUpOTv1YSqSBXJtMGRqn
 CucuI+wAbWC27G2ZIUzYQvv3RNb5MyxvVyoc6eJ7C8z+wVv6NCWBeerVmo/ON8WtHyh3
 Emsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783432638; x=1784037438;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XbQmfUPbDeiiKIAiqY/LG68gAdMRWI1U39cpYvkzZ78=;
 b=NFcC47jcGDETLvXXUB0OeESRG/dfUBc8G9IcfkZ9WXdtCbdlVAPFQYBPs+6AkBu0Zj
 XHFiBzH8j/rHdtPyKvnntEL4gDMAZnQA05eLMUy56qW7uKcGB3Qk+d/gnN5dF+lyCkok
 H6nuZZeQD6yc8xwvCPZdbq26zoFuqC6AAlj9f4YW2VK1pNwn3FTnB04soHHcd7NTgieX
 d73exMmkdPUKOaFyclVTEycMmV3UH2P5zhaB5trHFw2uqFY74l8yMVSlxL6VCVN0B4e3
 wVmSX034dEm6HAWADa5D+i3O69pAYMGT065FUiV+OQUZFY6qfy/v9fbXTcC3T4EUAdh8
 cjag==
X-Forwarded-Encrypted: i=1;
 AHgh+RrR1MIrLO4Td/qIkTEqM/xcuAS78UNOz5J44fV08LxyCyRxBJSjbsQXZUZgvG86QvkVDTL2V/oqTt3V@nongnu.org
X-Gm-Message-State: AOJu0YwMrI4VvBLAEHMTXNIkHSKBpWLWdNbtB2HuDnXultL99hHt+E5D
 i+RHQRkTlZiafVtdPdWe2SAyuxFauVGHsUtphaXrTjo7CVJoRsTxjA59g3g44p0G0ntK9wGjojc
 IKs8SVh6Fv7I4dY3pPZgu3F+7JF2mxbW/AEPVfnmbiL8C7ZftfjcscD2b5w==
X-Gm-Gg: AfdE7cni33XbY0JkZ21ZeE5ngGNMmM+3o7S1ebYWEA6XN6GPlc7o2gBJnA77Qo4KYS1
 jh1UAAzSH0HeTCHnh3SgQMoGTo4FvvjmB5AuvU8NbrDVqVg1GWy419Dl0yu9DyizgEKFFH+vpV1
 xTNrKSLo21/uBTnJbbG1FWnw/GhBJSt1uG5q7lnTYfzPpgoqlNtcyoUHg97o8uNtkC6v0Rs1o0x
 UiQd/idRBQ0oZ9ppH0WnNHifn9CVYRLeO0HKOTLlp/EJDXzpK+T+C4XwA3RquOByTDlhgLK7OIg
 VBuYi/JPs1UYlNMJYjawn9ZFpqfE+jz+zUUEdPvt31596swnpebvb7yWFta8XXA+w9fK43yiB6t
 gIdOkeqABiy39w+7l0uXyFgtl/DuEwZ5CI0UtPGm/7kB947b9+YekVO+8TST8VQ==
X-Received: by 2002:a05:622a:4d0a:b0:517:59a1:82cb with SMTP id
 d75a77b69052e-51c748ecdecmr59102001cf.48.1783432637696; 
 Tue, 07 Jul 2026 06:57:17 -0700 (PDT)
X-Received: by 2002:a05:622a:4d0a:b0:517:59a1:82cb with SMTP id
 d75a77b69052e-51c748ecdecmr59101651cf.48.1783432637258; 
 Tue, 07 Jul 2026 06:57:17 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15ad84483csm148991566b.17.2026.07.07.06.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 06:57:16 -0700 (PDT)
Message-ID: <0605b7ab-9d82-455b-af3f-d136be23a9c3@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 15:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: update Chao Liu's email address
Content-Language: en-US
To: Chao Liu <chao.liu@processmission.com>, alistair.francis@wdc.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Thomas Huth <thuth@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, kai.liu@processmission.com, 
 bin.meng@processmission.com
References: <20260707132701.71164-1-chao.liu@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707132701.71164-1-chao.liu@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4d05be cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=FRSEYCzRAAAA:8 a=wBMkrUD_mxg2Je2A1FsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-GUID: JZTMN_l9XYd9e5Jj_xbF6ReLCxpWPo68
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfXydhHnY71kvej
 bMPpVgrrqJJagq8xoSNpR1IyQSO+EJJ8naP47HtSTUz8UCG+8O1smInByYR0whWYG8smtj94eBJ
 rITb5xNJb5zDWa+XNtU5nfXBg5BHb4A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfX5PgRWyDQBY8O
 fNk6MK2nveMQjd9QcDMeTt87nDWUQ+x7a3ynxnuQV7EsilLtRVW2E1lsHyWT4YWAtrcq2SMelEm
 8rcXbKaeSGL5KFvX8vQQ8rBwOfCp0FOa+PLKqei8gsnX/gtBS8fryCKmxwg4wobyTCGf49BxqpQ
 D1ggYV9mXuczMyGc+tkpfzXXsxhzhHYpXX1cIDiu9OU6wLXJi3Tvjc69DBwYELebyYdkPbwYtsP
 VGbE4JNuXHETeJhXmtWtL6ON0rI17tYRQeqw0jUKCI1TCIcKlV9PLTWDOu7vEEM+GdRH4TBl9FX
 73MCxiAowXuCQ5i5NWV0sRRJVkrw0gqF94HSNoi4zZqWLfTabB/STE05FoqVbdcGpmKubNaRyTz
 M7qgBGcvwQ4D3L/fWwqj/bQIka3LAMdgX70W+7sR8iq1Ev8JB8DgRnms02HEgSGLJWVKWMu4m70
 Ibe4gOTNRT5RKt8uSvg==
X-Proofpoint-ORIG-GUID: JZTMN_l9XYd9e5Jj_xbF6ReLCxpWPo68
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070136
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

On 7/7/26 15:27, Chao Liu wrote:
> I joined Process Mission over a month ago and have verified that sending
> patches from my new email address works as expected.
> 
> Update my MAINTAINERS entries to use the new address for future upstream
> contributions.
> 
> Signed-off-by: Chao Liu <chao.liu@processmission.com>
> ---
>   MAINTAINERS | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Cool :)


