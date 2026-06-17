Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F7ECD98F0
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 12:32:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZpR4-0005ZR-02; Wed, 17 Jun 2026 08:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZpR2-0005Yt-L8
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 08:32:00 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZpR0-0005gO-UN
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 08:32:00 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65H8UlZl1607946
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 12:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AFYfMjwsRokFqUxRgWzBBhSsTEbDjcrHtwfj44iF3oU=; b=oHWwuPT30KQu2Ceo
 BMP0pxNARVtl9ENM24kZwV9Yon4DpRVoXW7w97QppQrVYAQDLuS7jpdXW0IvjZ/z
 7HyoHswZP0icPYLy5LCNxHi9geNcbPVG3AO3YoOXbVUusIH2BfYJ85UqZLdnkLfF
 KcV1m1RmlRXx1G+7nlqef6GIh/q95RnrWU8JqzNnkzYD4um7RrD0qSp8/l8i+Qir
 4XcYoHT4tJYZ9D0N1JaKXTwPw7nnVxbc2Za9Hd1uUWurljv5xtM3E3f1rUhBAUFK
 zBKoikfNyUV8Kjmo7cmrxyxygJK+DwPNPItHLkrVmGREmtqnAkSLTMMOv6cnmS5H
 65ldiw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef232nx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 12:31:57 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-59bdafdbcbaso3702393e0c.0
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 05:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781699516; x=1782304316; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AFYfMjwsRokFqUxRgWzBBhSsTEbDjcrHtwfj44iF3oU=;
 b=JacXpNWxJp3YOc3FpnLDzpal981pzQYGWSz4uTvuuCisyHlNEtJqAifocB+x+ligFH
 rvJSCfW9qBciSaNtPCAyeRLh981D7gSh70KRpfbu6O36L0PXvfqq5Ycq0CpoK/ZA+X3f
 Tgw11xywc9qBZyzlpaYOsPrmjAIDc1BkjenjmvfJjiaekmnSBEUKNRX0UD5vzhXtOJtN
 X4UKAgvTbivadHa7u6R9pGnLRy+KfqWd3FU+xzeM/WJOpR4/lwg0ts3BDYV3IdZqkeEX
 ip8Vrsi94jbHk2s0Bg3tyhLxeZJzx2A8UA/GPRd1JmSLQCFfMS1kCBlUk6PcMO+VvNlc
 NlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781699516; x=1782304316;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AFYfMjwsRokFqUxRgWzBBhSsTEbDjcrHtwfj44iF3oU=;
 b=DJ0XOFcV0iJKEyJoiPeeT2qQ2RoEliMRunMHNNWXGp2hz84wwKOLL7IQ2zjaAgpY2o
 bT1v4IvD00YxZFTUE4K6DC5phLvMScYlrbnw8O1Qw+e7wLhI/sphIpqYpPobQVN8eZT3
 nFGpavMnYIrmL5Lf/iwg/oNHgUr4nu1pptMrFvGOV35Exn6Xj87dJljrdTkHhqBJxH+h
 6b5pGDoeph/Ia1Rcnanzv8txHtSpLZud15c5TpoTjnxWlMAZ3BmvRwsnqQLBKIWpULVX
 mouw71bFvkZamANmKJ1sosZ0WqEeK2BduNn/Z7bk0z75ietQDbNsbJDWZjF4PdEqepBz
 s8SQ==
X-Gm-Message-State: AOJu0Ywiq81V0vl9f0OU0BEoL8PiNugtFp8ytSSCV72n7cnYrBJRc4lP
 ADFPa5doz1sQ4+v+YQLZvWfXOz68w6rh2tUZBIBQSEDTsFMa0quMnL3SFcCR9tUqsVAwgHM/5YT
 IXDjJhQf2Cfo/7SyPQAPoG99ZmrK3HVP1n0NyhZm9noCZQyxVZJ55fPXdlQ==
X-Gm-Gg: AfdE7cl4E5XGv2v65/VxuukMShOTrO4xC9pgXr8fQfJ20khCCIJIIt40imeFRMF2yTM
 uZoS6vY3LisH13Nzr038cRfITRbgHT2k/S0CttdHpJcOJv7FK3vksH7OB5Lx7Q5u3gH02LVVTHb
 lgd5uexkQHaw+0uVwHVH5epJvoz/Tl/LmpBlU1S+9kCOOr3wNiT2R7ypUvUh7d09TDoHZtt5YxU
 qvc/XZwlCVy5ia04+7RtkfeRhXqMZj5ttUO0/2pKJjJUyAWRB3EEg3cG4Id5TziQVhFSs8AVLsO
 agMlzWMUEgFfL9aXmlnCdesInq1zFxe9q1iSLXCFARbjAMzGv83qsiBEIM/rcXNOc/XxjLQnYcK
 EPjGnwNgihehnKLi33gQQc8Db3pKugEFx0I2WFX8rpVVhZmU=
X-Received: by 2002:a05:6122:320b:b0:5a0:9ad4:7016 with SMTP id
 71dfb90a1353d-5bbc0d20fa8mr1076981e0c.10.1781699515999; 
 Wed, 17 Jun 2026 05:31:55 -0700 (PDT)
X-Received: by 2002:a05:6122:320b:b0:5a0:9ad4:7016 with SMTP id
 71dfb90a1353d-5bbc0d20fa8mr1076913e0c.10.1781699515517; 
 Wed, 17 Jun 2026 05:31:55 -0700 (PDT)
Received: from [192.168.68.103] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f14168f0sm68807586d6.6.2026.06.17.05.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 05:31:55 -0700 (PDT)
Message-ID: <e8371068-7fdb-4a00-b56f-35bd671f0e42@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 09:31:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] tests/functional/riscv64: Use newer kernel for tuxrun
 boot
To: Joel Stanley <joel@jms.id.au>, alistair.francis@wdc.com,
 Anton Johansson <anjo@rev.ng>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260617054034.1020724-1-joel@jms.id.au>
 <20260617054034.1020724-3-joel@jms.id.au>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260617054034.1020724-3-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExOSBTYWx0ZWRfX7N8mZArCQkIy
 tHrPZLi7ZTWg1DWR9B62owoNsC0os3T7ObnYJPBHeidhZOZMWMbAH2+XcsOVuA6Jg9k8+cuwf/2
 2IDDiL0tkOJw3sWBQV7/lL07qn0WlbM=
X-Proofpoint-ORIG-GUID: I0PaRDJtvNSattN_rN144sKcCYAl5du0
X-Proofpoint-GUID: I0PaRDJtvNSattN_rN144sKcCYAl5du0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExOSBTYWx0ZWRfX5Acypeqz/fAT
 y6+40k899lMIxxnOhqX9gGmlZMrEMFQxcO0KHQxc18fQiz90G2K/8SIKc3WpaakWDwokx4pFa+9
 Yv/oIyYIpJ6bDQlg/cg8gcl8TbRAUsSqJOtFH+mMMGwFpZRvmQdOK3DghqpJRvjPu2vEKjz0sM0
 lziwLW2244eazEoKFnWQIqb3XOyu9TAbXOPaLPKZ2lTmLCzst1Rnuv0ioN3WH4gJwYk19E6hze3
 IFRjG8IsnsjQ1lupUYgz2ptxsxgxA6MpL8zXCjXjeDWUez5U0R0EnBRNQnXuP/P3i1mCvKghE05
 kFPrykupCmM3+AZspfsi2iLb4vl/Bqpkpsb0yTP6N5W0RVvUa/3w7cFz6LEmRITPy+5AqTWZTLs
 iLtg0mffGwIr4fdj0l6x8zCJBINN4qWPWnxgnucsB4Zi9Wsph6zGTo4B0kajzAvFJcJF/8/jeUJ
 stbSIkXctvqxm0Qv/hg==
X-Authority-Analysis: v=2.4 cv=acpRWxot c=1 sm=1 tr=0 ts=6a3293bd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=tZD6s3AVAAAA:8 a=EUspDBNiAAAA:8 a=PDEseUOtsgyrhBDX7TgA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=DklORoM8RNzucgFJxVk_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170119
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



On 6/17/2026 2:39 AM, Joel Stanley wrote:
> The published tuxrun kernel is 6.4 which predates the introduction of
> AIA support in Linux. Update it to a 6.11 kernel, the newest build
> on the tuxrun site.
> 
> Boot times on a laptop are slightly longer but still reasonable:
> 
>                         | v6.4.16 | v6.11.9
>    ---------------------|---------|--------
>     test_riscv64        | 4.82s   | 5.56s
>    ---------------------|---------|--------
>     test_riscv64_maxcpu | 4.94s   | 5.30s
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>


And thanks for that PR on that qemu-machine-boot repo I'm using for the riscv-server-ref
too btw!

>   tests/functional/riscv64/test_tuxrun.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/functional/riscv64/test_tuxrun.py b/tests/functional/riscv64/test_tuxrun.py
> index 0d8de36204a3..43d1242be52b 100755
> --- a/tests/functional/riscv64/test_tuxrun.py
> +++ b/tests/functional/riscv64/test_tuxrun.py
> @@ -17,8 +17,8 @@
>   class TuxRunRiscV64Test(TuxRunBaselineTest):
>   
>       ASSET_RISCV64_KERNEL = Asset(
> -        'https://storage.tuxboot.com/buildroot/20241119/riscv64/Image',
> -        '2bd8132a3bf21570290042324fff48c987f42f2a00c08de979f43f0662ebadba')
> +        'https://storage.tuxboot.com/kernels/6.11.9/riscv64/Image',
> +        '174f8bb87f08961e54fa3fcd954a8e31f4645f6d6af4dd43983d5e9841490fb0')
>       ASSET_RISCV64_ROOTFS = Asset(
>           'https://storage.tuxboot.com/buildroot/20241119/riscv64/rootfs.ext4.zst',
>           'aa4736a9872651dfc0d95e709465eedf1134fd19d42b8cb305bfd776f9801004')


