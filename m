Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A941FC5DF81
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 07:20:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyOxr-0007bO-OE; Mon, 24 Aug 2026 03:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyOxp-0007a8-RG
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 03:19:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyOxo-00005o-0F
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 03:19:25 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O5R4L72392044
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 07:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rvD4kbR4BOxXs/bYTdT22LMJM1/PuQlBnVz0osNgaHM=; b=klCGbBFIFGAVFjUA
 /A0GTC2IJQ+FFXM5qexENa2i3zB51x36yNP58DT9cwA+Dhws2CvlekeiTA9MtdPM
 FC1DiWCk8ar2GR3Y5oKD6HalcM0/gjfzFATyM7J3fEg/DOXRltdcTgtb1AjXu64o
 72NIHFtjKLtGA+bnlGPXT9sLuctplWX/vkXWCwmee3aSKJUPoaimTQ6rcUKVxFmA
 4VvZte0CxOnSBa6raji3yydwALVOlxOeYxEpjLJvA7DBYo3Ajz1NvNuYaonUvLU1
 pKmzHokHTvuVw8rry826M9K60QBwoGL43KsfD2ZZBPUuyt6D47p7HI0Jzams1C/h
 Jdg+IA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740a60q1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 07:19:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c26012cd0so31133451cf.0
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 00:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787555962; x=1788160762; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rvD4kbR4BOxXs/bYTdT22LMJM1/PuQlBnVz0osNgaHM=;
 b=NwvJ/wEu1MeHgbCG7SV/IVy6K0sYhN2dfC6h9fn2hJLoykJbpJiGB9HFFTwAJ4vIq1
 DlgFNvIR+S9OXQNiEsuXK/5R+wgL1RFMSZWKRHoGWCKbpbkIgLFUDyYBovIpbYfwM+sv
 O/VQ0BlbQk32aEZ1dAtaliF1B7iOyFfuVDhi1zZq0MsdMUS/xrh5oZ/aqFZQmj0JHDUd
 U2/G2zXEU7KWmVMb8EYOdE9Ji5aX3EIlXUh8WkgDlIlH8pt5DRGodenpmjmoqKD+2pVq
 0QFDPXpfR7tPIIxOTVH/ISwoW97UltFqzu8uavIgmQk9CBhdpud+WjDbiR3aq1uRVcHN
 eylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787555962; x=1788160762;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rvD4kbR4BOxXs/bYTdT22LMJM1/PuQlBnVz0osNgaHM=;
 b=mB6ayydge81EY/pM9/ekqYKuI6CM7rzTvsXVm6jS9s91UPCZ+q4QjUIUjNHBGqGMel
 tQRzxLsjCok/+eiowG/tulbaKZx0RHT0r3U02gZhP8JzqUzRGvJXD4+2mTPRHnhiZDCL
 b5qrk5d/Q7xF9n+cyfEkYDeDgtybUk6tC6OeniX8u6SDeqIq2l8YkPo3VPLfO4s5GcwT
 T5xVT3LaJZodNWdQXOSP3Rft/EF8TgHQN7ThmV1y2sQxzMscAq4NlVLpS7zSh2EkME9Z
 0NG2H4TWAldLDsJOpXBawBPkxph1NVfQMmo5AFjOa2Exena9VaPZmmSVFiORnVrfhyma
 /vIw==
X-Forwarded-Encrypted: i=1;
 AHgh+Roxk4ZYReP5VyU+YQdOnIOjUNftcgdeaAUwD2nii2RZIxN3R0mEf4DzSbAoHCwPG770Ug3qpx0vEtFg@nongnu.org
X-Gm-Message-State: AFuF++kuWuh7mCYYTPbGW1CEyxZieyL018O/GKSnH6/cUrQhQ1yyG5lO
 PMA1Fdw+mi76c6j9UaAlkioO1JilmI4fDCMCbcuq0+LwScMaqjURTSI9UbYmxhZmm4A2fB2qbpN
 Mx0cfgq1sT5X0fD8jO82vhtvecsUYymnIcJWNED2fG26U9OkxrQOZ5sERiQ==
X-Gm-Gg: AR+sD11AfGV70D3oL4JHCzuYCk8qwwj9f8l71TzzUjbQUKlSMFhKXLfAKsto1XYkic5
 JwsniDu1xhm4F/ZT5YkRKrFwuzSFyPL37Gi1v4Eca8s/UuNlJO/DNgv/Ej76aFwQrH/CueX0lE6
 pbL/Zbol+RoLgydk9diBLDtFCH/b3zN59Rv4CWEqVk+v5ykdPdmO1ZhGWkS39E+rGiMeohdisvO
 zdrmYqj94wa4E8SVYgTDjRzddCdDGHX5D9+yetysdOfIUFs2/Rq85gEAYBBCxgdjoocrLd5qItF
 QTeWhH7dIU1jR82XyrEU3uWOTl3bsjT11LcsY6QlVgwKs6H2JcZlaiO7Dxi71ftJfi9DdJyiItl
 dueC/UrmotoN1GQx/1h+5cqowb5ogLZg02foDzGy+GeSO
X-Received: by 2002:ac8:5845:0:b0:52d:771a:23c5 with SMTP id
 d75a77b69052e-52e09bb317amr155710271cf.15.1787555962493; 
 Mon, 24 Aug 2026 00:19:22 -0700 (PDT)
X-Received: by 2002:ac8:5845:0:b0:52d:771a:23c5 with SMTP id
 d75a77b69052e-52e09bb317amr155709571cf.15.1787555962020; 
 Mon, 24 Aug 2026 00:19:22 -0700 (PDT)
Received: from [10.254.188.74] (132.170.88.92.rev.sfr.net. [92.88.170.132])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606b208sm1051565966b.10.2026.08.24.00.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 00:19:21 -0700 (PDT)
Message-ID: <d5ce0fa2-fc40-4882-a08e-6c6e73e486b3@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 09:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] hw/riscv/virt: prefix ACPI helpers with riscv_virt_
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <20260823150731.896-6-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260823150731.896-6-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2MiBTYWx0ZWRfXzB2wMiLEuVde
 sSQLTFC/BCnvEja7bp7KUNCdzNtSD50XPa7pmsJgUEVrTzOZ/DedZ7nQxODYFKGGJgHNn0C5UoE
 o4RW8TLyZlNg92oMLm5KCQunoPG/tjt2S8YlG8MA+yGIr53MOzI3hY6LTCi/eIH4WgrWCw3qVYK
 Vy2zGpmcx5xkqgR0d3HNrvygAl35WPsr+0g4veM58uEqvsPS6CJ1u6H5GGPwi9JwyJM2tpMRBRq
 6umezPOXkf4WYXPYw16ajPq1Xq81luffvyGRXN0jGemthK13RYhTuxj5IeVlFZKerMbHxA0LTBT
 t6kocBrJbf8nw5Z8yS4rAUN5VILBzWxSlbod7HiYUCIAOJk/Y4v/49J77ZZKHKFzvnKCMniu4Bn
 oK9fxkpdq7j9u/FK1PQfIfP5eQrcLPb5A8Za/fsP1wVAhc2oFw1By/xsKAZKBvsqPC3sVJgDK0t
 6JeoHpC7mCS62vEitCQ==
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a8bf07b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=k3i2zbviP8V9/5wfVjyM+Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=WBReKDAIcjdK1pW09f0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 5SjNPOwPuhgcoybGhxFS27rsQftFEvWe
X-Proofpoint-GUID: 5SjNPOwPuhgcoybGhxFS27rsQftFEvWe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2MiBTYWx0ZWRfX0FI8UY9aGgPO
 E8R9+Xg/x99CJV9qJUqNRFll3uMFYExFkMmDpMHqSxL5ck3hw/z8CxheH39oQZ3UOnA/ixfbTVF
 VB1h913WgnMPpHjp9RmbEdQjH6UMi8Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240062
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

On 23/8/26 17:07, Yonggang Luo wrote:
> - virt_acpi_setup and virt_is_acpi_enabled collide with ARM virt when
>    both architectures are linked into one qemu-system binary.
> - Rename the RISC-V helpers to riscv_virt_acpi_setup and
>    riscv_virt_is_acpi_enabled. Leave file-local virt_acpi_build* names
>    unchanged.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   hw/riscv/virt-acpi-build.c | 2 +-
>   hw/riscv/virt.c            | 6 +++---
>   include/hw/riscv/virt.h    | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

