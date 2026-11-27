Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3F0606A31E
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 04:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ctHJ3Jo0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JGbhR657
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWo0Y-0005Hv-8M; Thu, 26 Nov 2026 23:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xWo0W-0005Hc-VQ
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 23:56:25 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xWo0V-0005it-8q
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 23:56:24 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJw8kj2354100
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 04:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KgES7stjCStHq7uzssoSmcS7FGkb1+AuaMkKx+YWwnk=; b=ctHJ3Jo0upXMCpiO
 /Ql1U9x00LZ+FWURorh/XcW22U8bwn1S18xyFTgj/ssdYMrEDhlw2MsbxhM/K7Ir
 WDLS2pwLWZkI0hPSAx7zFtYcXyeaeOUGdiixdw9SOMbMEN/+xafDBJKzY9FlNhMb
 uGk7jwltQXWzLvMNIJ3VmwPVRmpF6WcI2b8f8jEIE3oniKtIBj4VeSIAon9D+VVa
 4OrvAsoc+p8TS7dFtHNeHeyyTZ35sCGfpOAkZUN0Bvt81EOc02w96QpX6NvFbLNp
 mjeYdhzPNUVorcQVwMARPhWx9CP9jDxQSK/N8lhzLE90yLu/zc76oj5SRuU3DRv+
 B+XAvw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7uu2t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 04:56:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-386a65fca25so6764059eec.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 20:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795755380; x=1796360180; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KgES7stjCStHq7uzssoSmcS7FGkb1+AuaMkKx+YWwnk=;
 b=JGbhR657W3Na20Ekv6sDVpdroEZkOIdekBTKMYfCD3WjmOHUVygdSeU2/1U8kjQqrK
 3f9QlKSNvb0/+zKMTAJr4FixF2HUK/a44saPPnht/uOgPK0O4Uf3wpw3rCus+K9Q0FDW
 W0XpBBsLiDcp5013aiVcr8h39/7FGPGUvi+frhdx4wph/MUtRGzs7KQIFccqCYwU03+t
 cy65Scd1jdg3Y2c/naAg6cVWEcQoHtxAGYJ1iaAfJodIPts+6QNW8McylSoqKDyoIATc
 QG1Vl+7VWqt/xtYXSu6fp1VyRHkOQ4iecSX6mjNpl6NG1lImV8ooNmTKIUQjUBHW7b79
 76LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795755380; x=1796360180;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KgES7stjCStHq7uzssoSmcS7FGkb1+AuaMkKx+YWwnk=;
 b=n+utZ0fBtxGEro3A1ztKMFJ8X1OGpDfXcoV1duJCutRXSZGp3u96llcewBdOkQSV9i
 UctKGkFQomhB4ZToZNRjJ2J9xkbiUOPDJkLWr13/jP/Qw/F3E5uGykVoPdhlbUBQSHX2
 ztRb/t3OqMuvNDeQv82BX8UZgQHhP9TlqGygWH0S7/kQqxn4p+ixOwEEe9xQL7JpYeyU
 Ef+nsATQhMQ6UI4XWEan3ByMSxmZxgJAYXkehfP9xBSWJJTNaatKom9zryACmASEcTU+
 NTUZSLxLpr1BeFljPQfbxhk8jjCqWK6/PrY2Z96wE59EMwzhc6LxcEex6VgBZ+LO+UCf
 d0YA==
X-Forwarded-Encrypted: i=1;
 AL+hErF7H8UeGehzGsrT+8eblebanGyKjNBUNwjBpeKeyzct6kXTgKxu6uJztwrw1c63oD06XJocAuXTpPil@nongnu.org
X-Gm-Message-State: APuU4Z8q/ONi/btJy1sTKtN5MWgDoilrb73R6CpRxi5aKJpXNcbLmUMh
 qtKw2QgdGtqnTFiHBJkRCxX1JiTZpvTQPlVhppKGLBT0iKGRQ1dLMJbLac14LBNs1UQhjk1YmyO
 8gTN70phgqQOKYSZnncMqHI6mhnNTKdsJ0qOGnFF84yxj28Tnl/KRVAcYIQ==
X-Gm-Gg: AZFdTZdd0Oy51I176uGaNunj8hAH1HrxssqJOmvHnayMfvcE9fJdz/5PHcUgLl7B/xF
 MgckZ9lwzDGZcwb4Q5/ag9i/Ex4pyG5A4H5Sy0R1xSYyS7j3VNTpHHUj7HMPdlaLmuDk8N5ccuP
 ygo6TF7UYBHBCpHWtQylaMzjO059r8u3qV9WFvPIHn2aCgx+nNrqrOwdsb9u573MtwrurO0yyaa
 JxY2Ff41ZliULf6nE1QuplgDpAixSIoMMzep8nPg9SxqMS1YsXeUYRmomuurz45enIUO3/wVfZG
 rCOVwOtsiZ41kFhOwK+qQrYfLMqMP9NC4UJYTLHsq5zevlAJfy/wGFYv3/t+ZInZ4Tf61xHMuw/
 7wsfYYUaQ8cDASh4O48/5+LrFBFmpNV6xZwCUxNogmfK1ZKxTXkmfqk/Y8suHH5cRlkYoQCYnE1
 R71CIuabJJ3lJ4DSQNvEIvF3aJDkrm1WkrENjnEtFrgBldlmIU6d5u
X-Received: by 2002:a05:693c:88db:20b0:386:1920:ea0c with SMTP id
 5a478bee46e88-3861920f023mr20514942eec.37.1795755379670; 
 Thu, 26 Nov 2026 20:56:19 -0800 (PST)
X-Received: by 2002:a05:693c:88db:20b0:386:1920:ea0c with SMTP id
 5a478bee46e88-3861920f023mr20514912eec.37.1795755378953; 
 Thu, 26 Nov 2026 20:56:18 -0800 (PST)
Received: from [192.168.1.199] (104-54-226-75.lightspeed.austtx.sbcglobal.net.
 [104.54.226.75]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3866f299d0bsm59193210eec.19.2026.11.26.20.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 20:56:18 -0800 (PST)
Message-ID: <2bf0721e-ff25-4703-ab0d-760c65c5d064@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 22:56:17 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/24] target/hexagon: Use 64-bit TB flags
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
 <20261126233604.67722-8-philmd@oss.qualcomm.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20261126233604.67722-8-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxOSBTYWx0ZWRfX4paUOr9vQ1I2
 DisEJTOvG2xsW4KDDr74QjYGYmJR9ZPIG2mc5mEGEdP+ph3T3D/pChVw8PQ/dPlTlBOHyDl6MXk
 nmBvNvm65SostQKXcsJRtvLAY7AXg+4=
X-Proofpoint-GUID: Ov490vrf5LmOndqFpSqFo3V2F7l4RYu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxOSBTYWx0ZWRfXxNuMs16UpONc
 7o5HjqUhXQEZbklVVp2AQ/YAzfSOk2KjTqOvRUIWu1g3VGnhpZhG3pkUoSCVzgi804k6+erbbEn
 LoqhqxDsa5SF8wPKYO5n3oTBdS1zEw2UdKuUqKzLld8Tv+wtrIb8opWm7KfW8wBUvBem2TcyW7r
 UK9rnMkhEcwgUJ5POYfWG/hXLkN0LIToAspK8Vyc2+YFGAvOMwnP5iNKIAlyTPTc1E8S8Dtr8Mk
 3iTdFecHew833YVu9dA/sU79l7l1ViedXsO6asPjWyFghayOkMJshRqaUhxndepc+i8J6xppIzI
 rTTLpbm3tOrh83V0EDBuz+ImPgPIl+zJsMToFinq27+ImDnb9KDY3sC8ycC49anYm91u4cMDJIV
 Ju/zO0qP1ms6+nkvsuWeDjYKY5BZrnR0MYWsZ3BFjxR7hRjziuDR939R+eVI5dvPPJoHphXIUut
 Z1G1R5WrEN5y7EJ434w==
X-Proofpoint-ORIG-GUID: Ov490vrf5LmOndqFpSqFo3V2F7l4RYu-
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b090d74 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=x6rl1zRT+JsLSO7OGbGBKQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UZhefMT0_0haQvO7-pQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270019
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/26/2026 5:35 PM, Philippe Mathieu-Daudé wrote:
> TranslationBlock::flags and TCGTBCPUState::flags are now
> 64-bit, use matching types for the values derived from them.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   target/hexagon/cpu.c       | 16 ++++++++--------
>   target/hexagon/translate.c | 14 +++++++-------
>   2 files changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>



