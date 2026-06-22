Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F151CD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 20:54:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbled-0004fV-9S; Mon, 22 Jun 2026 16:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbleb-0004f9-RR
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 16:54:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblea-0007VM-F2
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 16:54:01 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MJawhY1902551
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 20:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mubbeLuNvHzWTjuopSsGGDHxdDc6q8WAh6XOPWlu+qc=; b=Y1mr09CNjuxKk10f
 xfIBkCxTwPCGr03nkyhCl2HDAUDAW29vaukVx5rp/3xBzpdPEnvCu8AdvjyiBRr3
 fiy/gMJ/U7bgD5PWb3PG7Ama2rj/VJ16CyV5ofAAKlpv36lryT5WCQ8Ibhwedus3
 VAxLbv0AhQhIgJQjGSDI4ldGC3/B8jWzWALUneJIZNCNEiIYM3dqoamfioj/d6ej
 n0Lpa7TkmQQ3SgxV4Q4G33BnARgW4OOhzNW8aBH0QPZXP5ORv4whnbsT2ASfUmXP
 78wsEaB55DImVRJmNbtYIVRkVvrceCcdM00jN4Gup0ze75J16jsNYMQaR7YVnbCT
 lQTx5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1uaep-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 20:53:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-91e59716176so812958385a.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 13:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782161639; x=1782766439; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mubbeLuNvHzWTjuopSsGGDHxdDc6q8WAh6XOPWlu+qc=;
 b=Qg/nnbcRm66ToF+vTvR8wygDIr0D5S6Jqs1lDN54zaXsx8KautMQPT940X2v5Vzi5G
 b9UaEnIa7QFLvFYNKNwUOXMhJ0zzKSXnEr2UY0GROf1+WLxahv7XPa2l0F6xeN6ugKRE
 GjNmcJSTpwBobEo9gdpdwQntFqC82Rch8CpjbX6CDLcfBLB78b/xQOyceSo0OzAcF89R
 gm3y2SkBA2e93DRPNtn6uxvadJUKwZ4Phib+81BFg1tCT1I0FyD0Ml9L8CVLHBR8WHLW
 FvZRahtvzv3hTKmyzD5kGkKX85qcymjM/i4L6Xl1O2mN13Jhn7lCoeINWs8JBZBIN+Lu
 XuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782161639; x=1782766439;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mubbeLuNvHzWTjuopSsGGDHxdDc6q8WAh6XOPWlu+qc=;
 b=a2YKascQxhzBRoFA0dJXX8IzPmq4mKjt2TK8eF+AyqC92i5espSWwzIipbiJDVbhRt
 tjoTBZbz8RUt1SBsTA4IdtAuJLamkB85jVxFGvVouruBJNjXEYu/wZSk1IEyVUS7kMxk
 rTgfoiPJJHwk7hpKuJYA/NASLAiCg5Zq1sj8uSHqp8QXy0VYjJO46V9BHLZCZzBhq7zY
 sbG4eHA4oRA/lf16nuWgu2k2FMmGOLOX9nlnhzwx6h/RgOptJtl1FW/9Rw4wKvBLMkuN
 ksMEq13sjK1YPHP/0XQ6KAFHwCdWDjuphlD7jVGk2sm3a7KQzJ0Z6bGi5s8w3UVqrRAl
 luow==
X-Gm-Message-State: AOJu0Yw95suH+ceaP/M+XbAy9THgNnp7HTlpvj79MejY61j/gUseIN6J
 iU3NZPlKYyikV5xp9Oo1Dy/Zw3v5p1xArnUSW3TaIocJURrzyaaL4gZd36V+f+NzbpsdVRkcopx
 r74KYuMIZ1+y9A1HQcuekMAF1sV3CgoKMg2w/lH4GPqkYyJp0n6rSBBgGwA==
X-Gm-Gg: AfdE7clbzoBekSiXYhyzlQxDpMa3ncpvkovklY7XWi8J/Q2RUQrTDz5bRQ7Bb9SB/BM
 DDpr+lnjkBHaXGhrBJxYCUs+eWVCTTGVGdldh8kPU5Yfp+t+IpppJy78SE4fa9ISxxyPgUyArrz
 caMxfkhgcOXg4B1vCQCoEyM9GygJqAU4lrD94pHjK58Ou+45+Ghfbct/0ifXJcV1bKXEQzDjKke
 b2/T3KaTN+PoP74nAVEfKwwkPBFd9KcpSxgSD33j1u27vw8RCzoSA0dtV0FmLG7ISmqmVAJE83G
 /kj0GEfduUjoCB2JAZiyudz8nQBHWUAOxGEv0PTQoT+e+Jlk/3UK8U//ja4K2Do8hQhoCFkowRx
 lNskL4nYLtBKUrEl5RyG+SeTbzBaoBacHAodoD+7eTASNvxdD8fRZ2mAW53A31Q==
X-Received: by 2002:a05:620a:4720:b0:920:946c:45eb with SMTP id
 af79cd13be357-921d0b36169mr1929512985a.3.1782161638877; 
 Mon, 22 Jun 2026 13:53:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4720:b0:920:946c:45eb with SMTP id
 af79cd13be357-921d0b36169mr1929507885a.3.1782161638371; 
 Mon, 22 Jun 2026 13:53:58 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49240084928sm336145105e9.15.2026.06.22.13.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 13:53:57 -0700 (PDT)
Message-ID: <dde1c145-3c4f-4ed7-a975-e5e154827514@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 22:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] target/riscv: move pmp files to tcg subdir
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-5-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260622193141.1449724-5-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZNFd3z5Z9aGZLcM0Qeo17xczyI_wJJH9
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a39a0e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIwMiBTYWx0ZWRfXzKQdSnXl6sgB
 +0wD+s1XYD9SYVH603ge8vgFh4RfVxqWqrYbB0jtCvplHcOY5U0bBuroqdQKZpqTdFYp2GAUpRY
 WRwusJVtPd2hYVEK+VgkxwO1d1k4O80=
X-Proofpoint-ORIG-GUID: ZNFd3z5Z9aGZLcM0Qeo17xczyI_wJJH9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIwMiBTYWx0ZWRfX0VTU/k1jag8z
 uMesRvGr56aLSUN12gb+RUTibRB1qceQAJs4zbtvpii1VD4nYgJb/KEBVkw78RTtZyMHRKbCd+2
 /z1QFngM2xAcmcO6yZ8l5BaFftSUNS93PCo2JoEDWBD4gaGbK9rbCDqypkU48U5X6mhpanqkCZQ
 t+vR2JQqeAFzSU8zIwcG5Y9+CCwfzLicV/48FttJLuOuzT2/UlVcuY8q2tHAj22661ST72tYvAN
 mHtS+NIReRWy2VLzYfOttUrEsOo1aoYnkJzB/knl/XMIW7WLLYrJiWTXBdPim+Wtzy9fbmn/IWd
 cY9b7WxSlYYu2F2j8jpcKc7s8wK7ris5MsPTMqUp1xpyGjdqCDvQD6AxgaAALyTTdNnbO0mzcaz
 z8issu0eqDQo3MwNFTOKYfV5PUdRBIEoBlT6XjTNi4gIRUqr4qImDVe9csKZVv5U2pj0K7XDl7G
 532Qogd5GGduIcZ5qRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220202
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
> A trivial header change is required too.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/cpu.h           | 2 +-
>   target/riscv/meson.build     | 1 -
>   target/riscv/tcg/meson.build | 1 +
>   target/riscv/{ => tcg}/pmp.c | 0
>   target/riscv/{ => tcg}/pmp.h | 0
>   5 files changed, 2 insertions(+), 2 deletions(-)
>   rename target/riscv/{ => tcg}/pmp.c (100%)
>   rename target/riscv/{ => tcg}/pmp.h (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

