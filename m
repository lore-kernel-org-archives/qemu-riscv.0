Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A81FCA5FF0
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 13:07:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xDiOp-0001Xt-7U; Mon, 05 Oct 2026 09:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDiOa-0001UY-Br
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 09:06:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDiOX-0002s3-KX
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 09:06:20 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695CFORh2225503
 for <qemu-riscv@nongnu.org>; Mon, 5 Oct 2026 13:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 68/MEj2aCnTszQcG+42MXKwOQtnPqyWZO3EspYwBapY=; b=dpawgZD59/svzDvA
 5eyEAYiHv2bphtiWRdbm98p0zG4ASH7l9aodoZmPfNdd9tJZXy1OgTlyU/IBuDZI
 HMoU5QtoRKm4WWYYjGkRVIu1onMT3aNaKjFdeORaxQ9KGGWvk7g8jZ5eG9bQcg6l
 Gf3TSvWV7AFgw+CAeYalbTi18XoYO/gSdKTdMkfUR2S0/S8AGWtKTTWzthENpTrd
 LqOcWwW73dMW5+BZ2mOf3MWnIBjri23EfBFOfeg9ZkxvyelGJkDLQekPerJpZoBv
 v7glvw/Dat37P7uQkZJALSWGl7jvLJKVjZetBltp5/j/4JRQq2KXoeQ15N3aX1xq
 ar9oeg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg06wj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 05 Oct 2026 13:06:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7bf45382794so1685062137.1
 for <qemu-riscv@nongnu.org>; Mon, 05 Oct 2026 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791205573; x=1791810373; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=68/MEj2aCnTszQcG+42MXKwOQtnPqyWZO3EspYwBapY=;
 b=YNfkTJXuZTltwI3KiK11X8yPOxdvNsvB9Eb/ta55eh1L3M4dZVrvHIPl0xZfoM2KdI
 cDisZbnu0aO1pMTEbN+Ln/02g4OzNROCDlABb8qtDttHfWoTvGtE4rKhz1J1mv8PNpDj
 QO7zeMMDn3BKpS88tJfnMEoz9JRChF4Hc13iR110H80iqc1pay+ZAztcReYlKeZUSmGd
 46h6DoCso8an85e8zBMZ+Xq7MJp8/Ql8WhaQ1ZmsyolKdhVqT8wNUMSCY0/ksFp24cmc
 n/NWQFQhxt90iFt5IYVwdCfVLxdCC/+FgaOeOFu4pXnSy/DEIlVagR+e9rXRSAi8er+y
 HxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791205573; x=1791810373;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=68/MEj2aCnTszQcG+42MXKwOQtnPqyWZO3EspYwBapY=;
 b=jlu4FJZIuuI2h6eRqqgJDCnHIEUwLRGYF8OFLNnwK3ceT6PK83txwTS4tmY/9DpU7r
 ZWMrsgoWLEWF8N39I5NAJS3bqy6HVOzOC5FXzhE5bJdDhvkGFat9Ac/bEbSCWJVZVx2C
 U3OWh1xILfVzcXs9K225c/WNa4EeTjtzz2cGXpa/KiyoR0FQ7oZdr427vS4Ui7shWdvT
 zKONBMLdSVnkWbezekKs4nlz7Y2WqbaoWaKVRNKYXdRDDTwY9HUUZ7cQevJlTAbvZMlB
 8bJmCCE50vnDUMFCbLxLj94iv8kUxj/E39xhep8AD8NmmP4Q4At1wy7GdGiQyOScXRhN
 weCw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzPou4oHQEDtTZpuuBTMHOhlTyjUgwUX6ebIlk4tHJtKh8znTR3ifCvvbXn9UJDk2z5nIOYxY1h2i8W@nongnu.org
X-Gm-Message-State: AFq9FYLwBLxZye5rXYe1bZ7KbmRF4RmqGK+9oS0Yskrm/75YSLjGh9xs
 JEUQ8qgmg5GOJ38pTsMyJggE+8ymMz3ukp3f7zwq38dAMfBJspt5iBBXFOXEA2TbC3AmcX70b6Q
 HARuUm2Yjgy3Hog/0xFXONa8M7Rmp5EtcZKICWziLwlKyojXuGI2WPDK2BYqqcdxKn7V1
X-Gm-Gg: AYBFou1zTkv0d+2hQZHEOoVMQC+Tq+9kq0UoCfhjexK2nrto8l+V+fQx0KuXvzjokzy
 KeTbHgbaTS87zZ294xQYn4h2Fyre6bltmGj3gYomwOfMX5HUNfH8/GL7H+EoXZpDXrCgrTz4YiC
 dzbdFktnMU9k9EQ92YX4zDbhOB1RYsjHuECq9s9QakbX2uh9DEucRRhU54z2+H7olUGDcaD0aAk
 1i6FeXXy7yFDgJE8PaJ1TU1TEuBBm6X5Bd+UP7ps1BuPcNAO6QeLVvl2Ag4MYoBKHBeeOKFb/yK
 q9Z32UYmjOmoqLsrrFHgBGcjfurehCT9M3k6XwXwMD7tFRUGNy0ByoX4BByzV73YShKOEOvEy3b
 sS/VJKfZGbqFIMfL9I2GrmbBPtqXQ3TJSsg==
X-Received: by 2002:a05:6102:148c:b0:7bc:696f:a5fb with SMTP id
 ada2fe7eead31-7c0f5baadd7mr2929685137.29.1791205572710; 
 Mon, 05 Oct 2026 06:06:12 -0700 (PDT)
X-Received: by 2002:a05:6102:148c:b0:7bc:696f:a5fb with SMTP id
 ada2fe7eead31-7c0f5baadd7mr2929564137.29.1791205570734; 
 Mon, 05 Oct 2026 06:06:10 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6229ce17sm3389247f8f.29.2026.10.05.06.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 06:06:10 -0700 (PDT)
Message-ID: <f1481bad-4dbb-414c-801e-aa24a6977b18@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/28] hw: mark secure machines for x86, s390, ppc, arm,
 loonarch, riscv
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260911143627.2743803-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: j3tPVQiPTbocpuRx614IS1WGPHlbC0Ym
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac3a0c7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=tVdpVsJRxwjYG60tULUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MSBTYWx0ZWRfX3WgokNQtXthx
 sTz9k8Du/OAsPnebH76ThOzOn6kdV7+ifkCXbmv9tt/mpeUz2eLL/jD0l0ZrOI7l3XhyWnaxMlt
 vk4XTV7UhFQjzDUJvbrMH+uvcKqMkYQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MSBTYWx0ZWRfXxLQxVJ76K1jb
 vpIJ/BaLDGD/RpHntlw5tIr8a2t+ny5cctSdjIU0Zu2jbekGapV9Oq/tTPC/pYO4K5LLGfocY0K
 SFH4UyRr+8C+IOJ+EfNb7/4nMKKleVnw5KT4RMWPc4qXcX39YyfG0ABKFHlXnw6moSv2atzGNaR
 APxlo2vMlJ/jkg/TQ1aRoghVpGB2wtpwBunHnFPo1J4wfL4gs6UnOpMnlRpEeKvXbVHm/POmQIf
 IX9QcXFK8m8d8A/9vfiTovtzRqzRpuG8Ushz0sgXq/DncSsEP/1B2qKXtp5zGzG2STO56C/LWWz
 MOEeNluiw66iwgUH7XRr3KwsPaU2zeg703bQVyiBE68TgJE1TesCab6qVapZPukR/abOfP1UQ/u
 NtJ2ZFNGwuNdaD7CM+ujKfQpBByZ5CoLeaW2Dw09r24FYaG66dj9xLNLlD2Uj8J23PaRxvBNt11
 J8pOZaYB7kHURyZkBaQ==
X-Proofpoint-GUID: j3tPVQiPTbocpuRx614IS1WGPHlbC0Ym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050051
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Hi,

On 11/9/26 16:36, Daniel P. BerrangÃ© wrote:
> The versioned machine types are typically present for use in
> virtualization use cases and can be expected to provide a security
> barrier. The only exceptions are the m68k versioned machine types
> which are only used with TCG. There are also a handful of other
> machines declared secure in docs/system/security.rst, notably
> the Xen machine variants and microvm.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/arm/virt.c              | 1 +
>   hw/arm/xen-pvh.c           | 1 +
>   hw/i386/microvm.c          | 1 +
>   hw/i386/pc_piix.c          | 4 ++--
>   hw/i386/xen/xen-pvh.c      | 1 +
>   hw/loongarch/virt.c        | 2 ++
>   hw/ppc/spapr.c             | 1 +
>   hw/riscv/virt.c            | 1 +
>   hw/s390x/s390-virtio-ccw.c | 1 +
>   hw/xen/xen-pvh-common.c    | 1 +
>   hw/xenpv/xen_machine_pv.c  | 2 +-
>   include/hw/i386/pc.h       | 1 +
>   12 files changed, 14 insertions(+), 3 deletions(-)

This patch should be split per machine / area of maintenance,
so maintainers can officially Ack their commitment to security
boundary for their machine.

I'm not sure LoongArch / RISCV / PPC are. If this was previously
discussed, then pointer to the public discussions should be listed
in the patch description.

Regards,

Phil.

