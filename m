Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED68606A324
	for <qemu-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgveBur9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FuXlnFKM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNRxT-0003RM-RZ; Sun, 01 Nov 2026 04:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xNRxS-0003QC-ES
 for qemu-riscv@nongnu.org; Sun, 01 Nov 2026 04:34:34 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xNRxQ-0005u6-H4
 for qemu-riscv@nongnu.org; Sun, 01 Nov 2026 04:34:34 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A18Jvb0341421
 for <qemu-riscv@nongnu.org>; Sun, 1 Nov 2026 09:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5q5X5sebZv4uCqvkSFfeVqudf7kKDA65y3myxtNMNbg=; b=QgveBur9KfbpxuL7
 j7tKb/Gn7aGJlb6MLEOTHDuZ8X7vdJHls2sbMPikeHrDbhhvd2+YwWP7UtNvQpzs
 CdduyntQW72KUB/8DQzeIoOqzXa1kCbYeumf4Td3NC21y5JvNj9eYyOGPx/vczDC
 lWw/S955FipAyV1eAmnDbWn7geErgzYl0IN8tgZ2aEVLChL3xxjbERB8F/jOKK/V
 qEOIEjRMoKGXa9ZEs6n4mws3mdcB/E5CQgqOAFk1Sk44cDbj8XdN/bZoOADfTpEN
 /1MYJGfo8JqIO5ECWxH0B3kuBtBEOaWlWqH7rwZxH3/E8WToOP6TibcYn1fY/1fn
 65WPpA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8dub27c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 01 Nov 2026 09:34:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91b937ecbb4so39366646d6.2
 for <qemu-riscv@nongnu.org>; Sun, 01 Nov 2026 01:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793525670; x=1794130470; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5q5X5sebZv4uCqvkSFfeVqudf7kKDA65y3myxtNMNbg=;
 b=FuXlnFKMVypcIlXSrmwj+NCzG0Z1rG5yrsKDfuwUwswf+ae4oahJ3Vu7ssFdLQGdoY
 PTGVSKXEFYkmgXiwu3EwmDJaoi4vaA1gYoUc38VboOAoGtX1VWlfToo2bdwvPknKESKF
 7BpcoLv+l9pdWhT6Um2lZhsP0wqKYqJh5EEzHlC2By4p6APrpRU8CRAvaGNkdvyIxW6I
 KMSCQ4tybAwxcF/ugc015T4UmQt2oUB0wV2PaVAhUBjeNvrvul3xGnYLRfip1KXda2Mr
 Vf/m7+piWgzZoV5becLpycic+hTf6TaFbcLbRbiuUTxiXMHdOzTd+ZjsQW6famlnPzcJ
 IKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793525670; x=1794130470;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5q5X5sebZv4uCqvkSFfeVqudf7kKDA65y3myxtNMNbg=;
 b=qv66MX2P8d5ukHUYB/X8rTXI7Q9FmKs5BZMM97AnzizqBqcMqV4uRRxMPEMa9NLfmr
 pPJITIi8ZNccgy/pAajLXkWhuR1/+9eci3cjgAVUsw/YW7mXAXQ5VBzCcIrbGhMcmaRk
 EOPHCB7Z54lP9kDZoRKvxcFPc3E7twSMX/6XWOxGVgqRgf6F6yIZgVq1Hpzr1WStfu3v
 VtE4R5FxXZJcEYRkLvdeaklt8q578caKgwkUNSxQ7YNtCmrZ/fLnc/+4GRE9sfcjrhtc
 tMJnfyu1YHeJGKRbz+DEr25C7qP4J3Yc/w+S5z7nOAqaL0wGcfrMpUuY5uZ8yasLYEkS
 awCA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEXGvrTWFTUuHL7mH4xe535s2eSqIOrpwq5Zho2dc9bRHqJzPTtZbSjf5oP8fZX8Z1+gYiF24FhUbM@nongnu.org
X-Gm-Message-State: AFq9FYJhcpHJnaD77uduHdyZv0SQoPJG7Zw/Gt9qlVvNV5Gv0YyM+E6x
 MonhPeTlvYHPdqhXG5ap5P3RXygqF1zFBXoqtq2aNGC0PdCSUnM5HPJQghosqTVWI33ZHS6qe2U
 yHnIdIwXP9/c3853a+dIG+Bk7Tn+rCB22GdmUJqzwjsjExgd/XpPu4Ax+yg==
X-Gm-Gg: AYBFou3UzJ/AYm+TxcV4vC1xwM5rPXraaNtbsFKfSI0txGgXLruP6zOUwenGJIYLJIx
 KGSqyK9tBQmG0KgtWXGPNqFMAGMZdPNJcSYGWpJ+YyuKYQ8shUC8mnJXhSZkuRA9K2ZA23UutyJ
 Cr4mwiftuFAs9MNHyxbSuPKIC1zIxL0jXTl/WDPK0yB82bpaGUQC/D6c+ayMAEu1PCqpR8iQ/pU
 6kSiybpc1ZaJ1ygIkK7zDNd2yjq4+fvCwsLYtpC3mdDE7dQIwx352wId8PKeQDQXwFUHgqXyJjU
 M021RqHBIOg7YCiNYLIxXbhrkfTcjgQsKLcPpInDbDIuE+gSy1imo8Pf1uUvLYsMKCfZSJV19ai
 bLOAohedMfcwm440JtsGDkIBn9i13kRv5SZGweLKM6rWTR378fgSd8bxzEAbCWJYhTznBt+OzZb
 Lc5NCYB2cB
X-Received: by 2002:a05:6214:d49:b0:91c:6386:eca5 with SMTP id
 6a1803df08f44-91ca4b2a6c9mr115450916d6.30.1793525669833; 
 Sun, 01 Nov 2026 01:34:29 -0800 (PST)
X-Received: by 2002:a05:6214:d49:b0:91c:6386:eca5 with SMTP id
 6a1803df08f44-91ca4b2a6c9mr115450786d6.30.1793525669386; 
 Sun, 01 Nov 2026 01:34:29 -0800 (PST)
Received: from [192.168.68.102] ([152.234.122.251])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ca8068ca8sm62740556d6.36.2026.11.01.01.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2026 01:34:28 -0800 (PST)
Message-ID: <547da4dc-c434-41ef-bf3d-24c419c28b7c@oss.qualcomm.com>
Date: Sun, 1 Nov 2026 06:34:25 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/27] hw/riscv: pfsoc: Default Icicle Kit to five harts
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chao Liu <chao.liu@processmission.com>, Conor Dooley <conor@kernel.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org
References: <20261014012323.322790-1-bin.meng@processmission.com>
 <20261014012323.322790-23-bin.meng@processmission.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261014012323.322790-23-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae707a7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=QOY8BskYDu05dfarAz2gNQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=FRSEYCzRAAAA:8 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=I3NZUf3FJzrWW2FUEREA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=H4N_Y-AU75W7NKDNhZlT:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: 4asDFQgWtdfXKZgwby6Fj_MkvXn0gpnZ
X-Proofpoint-GUID: 4asDFQgWtdfXKZgwby6Fj_MkvXn0gpnZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAzNyBTYWx0ZWRfXxLwVmMpeE9Vz
 TGhAZoam8UNqWc5oHntVtLRVlg/HydYFap5oTSroK8owK+6a3+T/Q39RQz1U34yfYT2Y1snwAxR
 rPwQbgZDSFNV7Dvmn99iRrUNvUFTjoyvt8Gq/vrBn+iIrTJZNvz7prmsiBDG2Hl1/z4Yw/dd5X4
 lueovA6CRSfG2ICb2td9esmhQdug7wK8g4GbT1kkd0cSpA3CQ2qR7w3GYrK7pRLln0XCrWRfcV9
 S+mrrCTDjEzGY4UwI5G7xa+C7bK4UFY8Z0P7kkkBb/rrUK8JxvqrIT5VIpt95eh9lDKEfcwz82f
 VW0/E3CntKWRCBIOOSs8tG1H7bQWPI2Pw55YOu8u2pq7mWCnbX2XRqYi924RpXjr7LUxeJyGdAE
 K+uuU+DVpXYJhe/S/l+0h9AlU1NH/otQiIukCxhkJLqob3dm+e3f+7UuLPpUkzdJkjYyUJrye6d
 Cid8LzMiU5lcmiqmmWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAzNyBTYWx0ZWRfXxQKvUGVnXHNX
 6RdadmwNbQAFkR/E0yV/cTiJwCw2LNJQbmnEHvs2aDA4MKceHmYYPE0YhgAuyIu4tP5uDk440Rz
 znrxwlPkan4oiNIWnp//BEPvm+/OcJ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010037
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 10/13/2026 10:23 PM, Bin Meng wrote:
> The Icicle Kit contains one E51 management hart and four U54 application
> harts. Defaulting to two harts can accidentally boot firmware and a
> device tree that expect the full five-hart topology.
> 
> Default to all five harts, while retaining the existing two-to-five
> range for users intentionally configuring fewer application harts.
> Document that firmware and device trees must match the selected count.
> 
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> 
> (no changes since v3)
> 
> Changes in v3:
> - Change only the default hart count and retain the minimum of two
> - Document reduced topologies and matching firmware requirements
> 
>   docs/system/riscv/microchip-icicle-kit.rst | 3 +++
>   hw/riscv/microchip_pfsoc.c                 | 2 +-
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
> index b0ad24f174..138289a913 100644
> --- a/docs/system/riscv/microchip-icicle-kit.rst
> +++ b/docs/system/riscv/microchip-icicle-kit.rst
> @@ -27,6 +27,9 @@ The ``microchip-icicle-kit`` machine supports the following devices:
>   * 1 SDHC storage controller
>   
>   The machine has a fixed 2 GiB of RAM. Other memory sizes are rejected.
> +The machine defaults to all five harts. ``-smp`` may select two to five harts,
> +with one E51 and one to four U54 cores. The firmware and device tree must match
> +the selected topology; the HSS boot flow below uses all five harts.
>   
>   Boot options
>   ------------
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 855c719f76..9d8e5916e7 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -752,7 +752,7 @@ static void microchip_icicle_kit_machine_class_init(ObjectClass *oc,
>       mc->max_cpus = MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT +
>                      MICROCHIP_PFSOC_COMPUTE_CPU_COUNT;
>       mc->min_cpus = MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT + 1;
> -    mc->default_cpus = mc->min_cpus;
> +    mc->default_cpus = mc->max_cpus;
>       mc->default_ram_id = "microchip.icicle.kit.ram";
>       mc->auto_create_sdcard = true;
>   


