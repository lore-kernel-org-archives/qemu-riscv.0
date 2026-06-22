Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B323CDB475
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 21:13:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wblxQ-00032R-Th; Mon, 22 Jun 2026 17:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblxP-0002zn-Az
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:13:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblxN-0003zw-T3
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:13:27 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MJbN7x2122921
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k8/XBQ6YPEYj57lJe49ypWv+orav3G+3B8zjEHIvY2c=; b=h3LezXFfIfvvAMMh
 nbOLA6a4eQRaKi2yQZ7M8eSqyMJhTsMm3Zua3UNEMDqi0TbsFyPyf95saqipMQjP
 FeO4m17Wew3m0IodtLSTitHaaJWK8y/1m6PTH58Xe7ODhC+3OI9ntj0ilELmefaB
 UgzoMI/mW9aZFzCBBo8PKXSNAjWom9tjBDpLubNhH/eN6GEM+Yj6hQ04ce5dVMEb
 CSKUOSM2LstH7hfBdzPEf7F+7SIV+v2f40e7dW6RnWSS/YItb3zdY0IwEabvOfUp
 TaJ5JM621QuB/FVrbr+VVGtaFaCJw3BB58YW5Y9a9X4Eb2VyT+05C8slD7yrrPlY
 AfOjAg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n41qs7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:13:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8dcfdbe9da2so64447916d6.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 14:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782162804; x=1782767604; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k8/XBQ6YPEYj57lJe49ypWv+orav3G+3B8zjEHIvY2c=;
 b=PmIWfjPGbs2BxX7trVAHxeKCAK4RBUIeV30We16YtGQKHliplVS0hdBkMX92YMSv4G
 iyJnEnTtWGjxNQr2fyZkyKCtd39kXibwGQz7HpKP07KsLlyILEyfgAZVRG9/JMG1nxfK
 UCXurHmP+omQmNoqzEx/1zsnwq81WcfAeQFDU+f8i6a2cZiz3zVT/nIer5+kK2aIwKdN
 NEX6HRU0vqvpknry2//bSC0b1fX4QIhhodyj1U8ob6EK4NrJkob3XFTTj1GVC8fwTHkJ
 Piezbqmb5j0pMnYAn/5Wc5YqptZ19jU5MT0S0bl7m6s6yUZJOgdanJIpfxzD+DyV3S7v
 JskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782162804; x=1782767604;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k8/XBQ6YPEYj57lJe49ypWv+orav3G+3B8zjEHIvY2c=;
 b=TRm06fCJ6rbt3tTXD/I2tMqsIfFyQJ5qx5kpfAzu+JepWtsPfTYlF5MfmhM8b86NCI
 eYr7TvnEc5pZ5g70WDdTlJHkSPzJV9dN6qU9CUuosy/8wgXmmiEf104rADI8KX15rkDT
 XI/8K7m63zmF9ZKcApQdTYp8BhyihmjeU5DRRXZc4BckrMRGpCvzTtJ3S2GN+2b3I3mM
 VZxp3x+vHzEkfTRwNO9UHZFRvw+q8MJSRAgQ3xFw51nlsu0axw749keftkX5eEP+oTFK
 Bs1RlIYGV3gjFLiXVzlzOQ57Li4O7zAkPytv8L9wN5fHNJ47He082f6HZn0OpiJcIbpN
 COiw==
X-Gm-Message-State: AOJu0YxgA50fIyVigpBHcodxwg+Y0gPOCLzyYaIxP4FcF3SN0NQAoy53
 x0zJykPqCUs0JILQMPmyBeYtQ2WSxjLH4N+CNGysY26+//JqJXDzrGusyt7mqcZ+nAEYugrvVY4
 ZaLb9oJkeAGo2XD5YzlE0ysCv33bJx7I20BGQ0vOcz048p2/5hqTIf4VEYg==
X-Gm-Gg: AfdE7cmt54qyu2co7YdeN7JxwUzeEiMnc6rGXyGBlOZJJYGa1/nqfAe6myPvvOnFUaA
 bqm24+fsAxChA/bPcpnmeuqYk1CjYHbB5AuUdqg+x15aoM+5HY1/iwYiXmtZjDBrJ3f3Ux2IqsG
 uhqn5d0BjQO1AA/+B+wUevqB2Wi2TIR7gr9wsic82vk1sZnB/uEMN7BCsJYDLzSZp+KrQH6O8pV
 LxfX5sGOZ8erM3WS11UaPoJOga5tXiwgHYEL7J7qKfC5X7ssy1m9qnhH7SivxomHWP734mJAyJ1
 tP3BVBGAubjcYeETCa8GKg6jHOisVzFUfScHlrMve+Z6Bl4qoUV1AdyyPyx+6Y8H+OyYL5blB6s
 vGhlrOycBxAkx2X+8RRUu28oKMBGKOH6inicn5qafEdIk8swvZA7SqoGyeIqoRA==
X-Received: by 2002:a05:620a:294c:b0:915:c7ad:8bc5 with SMTP id
 af79cd13be357-920913996d2mr2665723485a.31.1782162803800; 
 Mon, 22 Jun 2026 14:13:23 -0700 (PDT)
X-Received: by 2002:a05:620a:294c:b0:915:c7ad:8bc5 with SMTP id
 af79cd13be357-920913996d2mr2665717885a.31.1782162803353; 
 Mon, 22 Jun 2026 14:13:23 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd1fa34sm365048635e9.5.2026.06.22.14.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 14:13:22 -0700 (PDT)
Message-ID: <dfcdd6dd-ed02-4225-8238-f9a78636057d@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 23:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] target/riscv/cpu.c: filter TCG only bits in
 riscv_cpu_reset_hold()
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-18-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260622193141.1449724-18-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIwNCBTYWx0ZWRfX1MXWhE8lAgQm
 32V6CiGFqLP12wguy0KdjuDRKegoUqVH73FZ5oINTfHfN/YkZf96PAK+TsgUvkwgxKEqq1rvu7B
 IboNekpEOacPUgi2+Ww+REzdEGHeprQ=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a39a574 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: xdv00qCCYp6u0i9McmbbeRxl3BGJSPMS
X-Proofpoint-GUID: xdv00qCCYp6u0i9McmbbeRxl3BGJSPMS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIwNCBTYWx0ZWRfX1jHMN2/g7siz
 U16vA7O3AFU2tEkbY+mv417cIzt3zTE8qpQfpD/e3YqJoAOWvgQggZKVyLIOk2wBmwG2VA0WjRW
 llP8GHj7KrOqZ19e/Ca8S66CFLEFQEI1H11L7arrQysgXdw4In+tP9yFVgbAihQqc1xemI4uau8
 4yoyd5aNnAiUtqxJS25n0n5Avy5ERnQ/ZqIY77tL7tUFRHIlihkUp9W111Wcvao/D89Pas9Ezcp
 r7XyXLx75EXiZMtQW9nUM5jDi2FbNzCx8XXuJRxda8vQWgJJGKHiICP6VFQ1bTs4miPbtaSmjEW
 fdRN2jRoDDusGCpI/u/QWb3rA3tEjhAr60nVNwLqpShdIeCy0ZGBGnsHwGINm9CLI3d1iQozXxw
 lWJj/SXKMUOwPuz+3HIwWZraHF3khjvQsLBSJPw5tFJo70DrDqGxdUVxO+TULF5C15njuqgw+Ci
 MtyRSuNirva7xDOLJUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220204
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 22/6/26 21:31, Daniel Henrique Barboza wrote:
> We have a lot of TCG only initialization in the common cpu_reset_hold
> callback that prevents --disable-tcg to work.
> 
> Put a CONFIG_TCG ifdef around those bits to make the build work.
> Eventually we'll create a TCG specific reset function in tcg-cpu.c but
> for now this suffices.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/cpu.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)


> @@ -1013,6 +1009,10 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>                       MENVCFG_ADUE : 0);
>       env->henvcfg = 0;
>   
> +#ifdef CONFIG_TCG
> +    uint8_t iprio;
> +    int i, irq, rdzero;
> +
>       /* Initialized default priorities of local interrupts. */
>       for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
>           iprio = riscv_cpu_default_priority(i);
> @@ -1050,11 +1050,12 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>       }
>   
>       pmp_unlock_entries(env);
> +#endif /* ifdef CONFIG_TCG */
>   #else
>       env->priv = PRV_U;
>       env->senvcfg = 0;
>       env->menvcfg = 0;
> -#endif
> +#endif /* ifndef CONFIG_USER_ONLY */

   /* !CONFIG_USER_ONLY */

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


