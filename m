Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C825BC5DF8C
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 06:04:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyNmv-0004rG-S4; Mon, 24 Aug 2026 02:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyNmv-0004qv-0c
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 02:04:05 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyNmq-0005wV-Vv
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 02:04:04 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O5RCLG3066900
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 06:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Pwlf4GvdjN1EWQEQlDiy0bNjLgPXY9sg9hStWXQKkPc=; b=Dwpd4pxRDVG/ll8g
 91QqDhL2FEZdMNAfnwSeeaK7tfWoZBOf1oMqA4j4N+peVyaNVjQRQrfNWMkLS+vV
 xDCaYtbEXLEmUNiQHoHqBo7BuMY0ApUSipuRz01Gh3Q4gVoj1Yn7q3gzUx6xaZRK
 S+HxGou5/a736aJ4zTQ13XcTWyQcRjJO5THnpFQY9zlHajQoxWlXo42BnKGskZdo
 wdOXVuaCMxYJNygI6qMQ2XtFf7FAodHwkfsIfWCZQ2HHKfZlpF39K4lMIO7EMam6
 z2M/smTnnlGmG30e/21KmFByA33eSaJovMhkVfXwgz1fpeE4D2CeOJorfTGBIlyn
 /vaIxg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jph2hw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 06:03:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-744e7890eceso173856137.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 23:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787551437; x=1788156237; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Pwlf4GvdjN1EWQEQlDiy0bNjLgPXY9sg9hStWXQKkPc=;
 b=juKfRgYqOsalACLXtPfOy5UCLfRd3VCBzS0THQw4+JIOscf2P3ZE13i3YJo0Q4Emhs
 NU3CNlpgKtglkPzAkIyevMKkzdHWIq6UWnAXkPAL5wS22n2BHsstt/bXKh5/EsabqRZf
 7L7dlGpaoQ97fK2XE6G1/JhXBnlQm4r7dhYTN8iVLe2wCSF27mXA51JQ8VdqVsIiZat1
 Zgz2nryIwFoGhUGQBp4JUDXTwNXWP1B68YSpEln4n6FuJHV42rprMBvqfdzJiI2rYvVO
 Czc7EHETDNHT0eCUCcVWt9gK5q+USkhzvQS3ctaePlyGVC9mZqsCI9f8vKZ4na98UnCM
 Ribw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787551437; x=1788156237;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Pwlf4GvdjN1EWQEQlDiy0bNjLgPXY9sg9hStWXQKkPc=;
 b=ql8g5frBRFLiYaBN07Eb0rrqbR2911sT1OvVqfp59smqQFs2MMlnWHukN7wGpoxwj+
 OvLP4ytEQf6s5P2oOpXt+dmJ8/RrM40D4z9udDJvB6wXb7Bxxme6/DF734gD1mQ3Awuk
 36NEGVwIhdgvEs7TrPIFt42jJHH7TlQ78Z1efc0uusDqsyAJpRixZDDGtViFuL/2VGZV
 2haOIvCDlb1NVCCrnpmWvEOs4+pz5RAhz9szZnEKSDfe4hamDNQu2vuRN2lgAxEp8cxD
 5fLwTB06yYZk0/zYVoFxk5sMlizPl358AIY7CBuMyCKJPnltCJe6pPcePfBBcADJ1F3O
 D3Ow==
X-Forwarded-Encrypted: i=1;
 AHgh+RoVtoTIItVFsShqtI3NhvGOex35NvGKEH/VRHk7ZaAIlleFRpDp/XlCtTxJTs1bSxxuPdkpJ3PV9smW@nongnu.org
X-Gm-Message-State: AFuF++kmuunbQOi+a+2+Jv1P5HsQaC6RtRcvWc1WRdtmFf1JETlRdzs8
 M5GHEawBUF60uMdiWHlyJ2In/6eNbtAnt3tpCj8I/7vMANf+7dLQdVVl6iiFOy187OY9VUcGQEg
 7mblCyXCpAIHEvcuSCZEjg43/Mhc1CiOX+0Hlnp9Mj/Uanrsv9am/cIUEsg==
X-Gm-Gg: AR+sD13Xu9uczVjqNu/W9nNiEwFhJzLRICBUHGB8zNHN5LL/ROi1gM7Q9MwvTIw7NYm
 qgV6cVj5dJtqav742RCvIOF9ArYA/90k5aSLrKkLtQnNRFDaJwkVhbqUe/WDsjxIEWEjCHWPdZA
 9ln3qsB32hPFeSxGVcbXocLVYiE0cFWGYTynVlsE2Nlo964PqR/ApuUtxFa/QXZwvwuYaAUvXYf
 Bd1mWx8+FTw/XuZJjwpkt0jB/QgNDXZMAr0s52QiSPzbaWSa02YSG4xSbWQgp78NG7cHulnkZeS
 VaW77DomdpWGoJJHd0DYpT/wVOVSESuUpLH30+4eiTmY7iUDkApwMOBBe8vgYxAihw7yzuWUhtZ
 Z4q9Kgmv9pwhabE82Zjxdom64i3Oeixo7/lu43d8eV4YnNhuEMA==
X-Received: by 2002:a05:6102:442a:b0:779:78ae:9a94 with SMTP id
 ada2fe7eead31-77bd0ab7564mr4440977137.2.1787551436950; 
 Sun, 23 Aug 2026 23:03:56 -0700 (PDT)
X-Received: by 2002:a05:6102:442a:b0:779:78ae:9a94 with SMTP id
 ada2fe7eead31-77bd0ab7564mr4440959137.2.1787551436494; 
 Sun, 23 Aug 2026 23:03:56 -0700 (PDT)
Received: from [10.254.188.74] (241.170.88.92.rev.sfr.net. [92.88.170.241])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e1d741asm6512681a12.27.2026.08.23.23.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Aug 2026 23:03:55 -0700 (PDT)
Message-ID: <9327fe97-1a04-4542-aa3c-2caafdceac9b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tests/functional: Avoid unnecessary removal of
 scratch files
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20260824055642.41098-1-joel@jms.id.au>
 <20260824055642.41098-4-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260824055642.41098-4-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1MSBTYWx0ZWRfX/vHenn0/zKRX
 eoeQFwgVW0Q0ALPYrIJgrE/yHlbt1sDj5JJDbo1B0ymvHcgsLRD7obMsRMBfoJ3HiGlIet8JL4M
 a4foanXic3lPWn5qV4seb9SKtOop66m/tJv5hnu4nvQGHNwH0ZkNs1601DnZn/AobhYovoiIN4l
 rVlHHtQUC62UeV/NG26GfONKPZcWqiWwurJiDWKPMU1W5VLNt4rkvFlWPGK5COf8PRlgq62o4wC
 siIgXkl0DHqasSSHKBQxBZJ7kzeUbbp1XCqELVfFft1mnr19o/ByTSKVdbbVSTLreuavvCaZd4H
 DbnJy7c8Z7yvS3Z25/fcTfST7bQzVk7G1FW4yuXqw8vvIlPXFE7pM0+QviW18HdUxWEJAHjlPcp
 bgpUPgziGESUNe1WuPrv1kcqinxKjq2R10svLvI0ZaX5TVQ88hvQuS4lHuN/R9bhqtYiY1jo8AR
 6US4kJCmgJVfUXjE47Q==
X-Proofpoint-GUID: zHA9IBGZ3QbrMU5Y3_D3fjw8wS9HiDJk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1MSBTYWx0ZWRfX5jdr2Ay8AkAD
 HRkGS3VxsSJcqQaP5nGoozGID0bDM99sK+5Tk6gaf0hymk/A8dwDsIVao/ykSFR9cIi16VejA+V
 nyxTTEmk5Wv/noLenrKzmYsQ9cDMgOQ=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8bdece cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=+Tg70iCNDwYGP/1Xem9bLg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_42GJx7MB-dApGGGqoEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zHA9IBGZ3QbrMU5Y3_D3fjw8wS9HiDJk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240051
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

On 24/8/26 07:56, Joel Stanley wrote:
> Files written by uncompress() and archive_extract() are placed in a
> temporary directory that is cleaned up when the test exits, making
> os.remove() redundant. Drop it and the unused os import.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   tests/functional/arm/test_bpim2u.py       | 11 -----------
>   tests/functional/arm/test_orangepi.py     |  9 ---------
>   tests/functional/riscv64/test_sifive_u.py |  4 ----
>   3 files changed, 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

