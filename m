Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B1EC61DBD
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 17:01:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzzwv-0007uH-Qk; Fri, 28 Aug 2026 13:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzzwq-0007u0-70
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 13:01:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzzwo-0002Ov-EZ
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 13:00:59 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SGKAsK2969460
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 17:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TL/BG/MYwltrNZlgDX0CFVkaGxm9u+tfoFMlN0nioHM=; b=Eh6CP/aVGaiVVsxG
 naagbh1dGUs70lvjDkg/hf+kdw/eezvalMkSfNkdT7y8ZxmM9fGFgaXEWq8o0arB
 kZFXjqDMWdf4Ibhk+9XN+BhSbPFkmRtZbdQsoBbPvyurFm6xT2XDxhBYx0JwiukB
 cpgisnL5m3+Uvtnvlu7bSux11pggYMNo1W8TTBU0azo2Nxx0lLewjpKjUuC60nzt
 eK/grjvBbyw5I2ZzawvlkG04/hqLURO+o4EM5ZFGt/NbGNGFwthLin1nidrUt2r/
 cJGFm7Kl+YShEOHOW9RMZQA+SGPghFtr5hwBqMJu3YADOk2VupwxtKlVPxDrn0PX
 898rUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42raqyn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 17:00:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52f64c48bf2so25199371cf.0
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 10:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787936456; x=1788541256; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TL/BG/MYwltrNZlgDX0CFVkaGxm9u+tfoFMlN0nioHM=;
 b=C2VC9BpnijOVgn2gDtFtbMSvW8mGHJXaDkwWjofrs6jHnk0DgC8LBtcsE2oNPAg/pY
 1nAgXkmBhD83npZNNZ6JaT/tZFQ1x+dBJmRwb9wPc200Pmu6DHE/MtzJcgIHkNp2b+OQ
 i+WH8q250vcNDw+872IF09E0DtTBxEwICNNBHjkyh4dR3N46MCT+JHjnIBvbJ9zmB2pa
 b0+FkWlInxM262cPwSQdh4kyf9lpszROiQ54kMBERF0lQtd4UmPt4aPpXt920kx1SNcW
 QqJwfRUnP7Zp4DctP90gvHp4B0cl28ChIVuHJKlarrSOoo+JJX6NC5A4qYzU8gTntr4p
 iHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787936456; x=1788541256;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TL/BG/MYwltrNZlgDX0CFVkaGxm9u+tfoFMlN0nioHM=;
 b=GAD+UVgTPRLON/+4t020Yo59mexRqjSGQJ8LBjAxINmEAj54pt8pinfC+Tx5oHikFR
 Ug3oTHVQnIWlZhz0BjLb9rej3/KFwNejagXtHIuo3XLre56rleI31bdvfcvEGv5RW+QV
 BWJFUlnLFlG+vvFq7PX5S3SWyiq1GGTioQ0CxblIcA6bwZMwQtMpa5hQnT92nq+2pKxW
 QqvmfqFiBF9yfATiBpE23JwT1cQiar+43pcJAv/94n4UsHMbn0U5Vd1c0rXMeUhbVZ89
 hsZTw0hQqEXXfk4XJ7FaVpzLO3hGq/1lOW/Pd8qJsL+oZhMKDtAw5rR2L2ZyFiwq9vJl
 76FQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpRQNBr8e05+NvK2/FVMBen6Hpwwodrj0ov8t9AqKPkKtIY/Ec9hjvy6Pj61UsH7RcssVk8OR4vNWNc@nongnu.org
X-Gm-Message-State: AFuF++kwZDzlND9MVQ1qRKdYKb9XaAyjR+dpnJD6yeB2UhsSC5pjfNsh
 aSnau32UmyPj7vsbDzxbPXEwpWqpG19d7omKt0zvfBkgP/kGQwK86vMFgj04TTDCZidFch/V0Ov
 GNiiflzODDDz/J+k41pQVEavBk1Wk9umcLRCC39wglcwbfs9im+pMPbuOXg==
X-Gm-Gg: AR+sD12Olo8Pl/sRBgpDpbOYbeHelpfXw0Y7SjRCauiti0V7/vgVXxbHq14iiw05h9A
 e3uF9GtWYPrEp+jFpGQKh3Z0CT5jhOwykmW3aRnwOxHIcayA8fvyPLT1qPrN2VCoEy62Xz+1mYj
 YmG+iMXp8emzZWU4Fm2Hyo+w3/3bMC+2C0vVu1Iz8y+LGhF63DbQS35vm3YG2lVtDn2zXPWf1uN
 1IAR30ZuWQd36R6s90Q5NHW6f0gHVzjRLt/I0i7HJCRf7q20EmLAfnXFtF4UaS9cdXEE3M2cT9v
 axp2IXUf+y5K1SsSYqfbktyjE5x0LrtSoqWLg6MJYufj49u2Rd57+RCaNb0gKSlqLWsfSqQejk3
 B/prlfSC2ci14CTFYeZpQ+6x8nRPn+sA8kA==
X-Received: by 2002:a05:622a:e14f:10b0:52f:e60e:70ca with SMTP id
 d75a77b69052e-52fe60e75b0mr34039581cf.29.1787936455811; 
 Fri, 28 Aug 2026 10:00:55 -0700 (PDT)
X-Received: by 2002:a05:622a:e14f:10b0:52f:e60e:70ca with SMTP id
 d75a77b69052e-52fe60e75b0mr34038441cf.29.1787936455254; 
 Fri, 28 Aug 2026 10:00:55 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f3asm5264579f8f.3.2026.08.28.10.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 10:00:54 -0700 (PDT)
Message-ID: <ebe27967-4926-4c03-b729-cb3987022b9f@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 19:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] hw/intc/sifive_plic: Take a MemoryRegion for the
 created device
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260826220528.54516-1-joel@jms.id.au>
 <20260826220528.54516-6-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826220528.54516-6-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Byl-UIMNnNx2yCXpcqq15bxCoQmqkjvq
X-Proofpoint-ORIG-GUID: Byl-UIMNnNx2yCXpcqq15bxCoQmqkjvq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE0NyBTYWx0ZWRfX9UgRhu5NzFtb
 UMvaR6W62bOZA61h6w6+uPpz7ZBKblJ6Ou1m1EQL6ynA6ZSLV98LiSh1p3PEDCr+qG337PHE7gr
 /oynIYeu5e2cqCDlD7S2Uohmnfpnqcadrtcg4+J5PCXUGO9yC4ZRxMkuoYSt5efla+hMTYXtoAR
 aA8S8FtB+DKoSfjr9mqg4DrXmEwwuYRjpE11nQQ92tbuCfQK7ktaIJV5wlWLmK/0S/y0aVIpeuS
 sOumkywdavwqNB76X8ZaVjUXDg0k1UKGTDGT9r/6xgX6LlliXvrWrbF364KBoGdLPd4pmpTmFF5
 kMlAM//3Q51VgBLQbA/krjTiXV2a+C5RNLjs6hLk9WIJkhXR3JnZcIOKUNxG35K2YRiwZAa78mG
 55OsDzXbB7FbUSP5n8Qs9u9Y5NOpSRb+ZCgHH6175z0AMwUAoZdmkmAYW/pYcx/qn8DgMSIjJM1
 b0pqzXl+q9fXZfNyQag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE0NyBTYWx0ZWRfXzpJN1ofqwK6O
 w9OFXBmSoiqnngReM7qZztU9O65MOxEx9cUPFWOCCpyFg9CaEYjAQplIH+/dEA/PnMAsHSOu9K4
 nhM8MDxrxDX7KPvl7AffI+KJEkF3mUc=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a91bec8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=khLHThV_XYJXy2OzJpEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280147
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

On 27/8/26 00:05, Joel Stanley wrote:
> sifive_plic_create() maps the device it creates into system_memory,
> which prevents its use by SoCs that map devices into their own memory
> container.

Correct. We'll need more of these refactor cleanups.
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> Add a MemoryRegion parameter and map the device into it instead of
> calling sysbus_mmio_map(). All callers pass system_memory, so there is
> no change in behaviour.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   include/hw/intc/sifive_plic.h | 3 ++-
>   hw/intc/sifive_plic.c         | 6 ++++--
>   hw/riscv/k230.c               | 3 ++-
>   hw/riscv/microchip_pfsoc.c    | 3 ++-
>   hw/riscv/shakti_c.c           | 3 ++-
>   hw/riscv/sifive_e.c           | 2 +-
>   hw/riscv/sifive_u.c           | 3 ++-
>   hw/riscv/virt.c               | 1 +
>   8 files changed, 16 insertions(+), 8 deletions(-)


