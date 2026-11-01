Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AA7606A324
	for <qemu-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VcyaMjyW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJadysbQ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNRwK-0002gm-5l; Sun, 01 Nov 2026 04:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xNRwI-0002aq-A5
 for qemu-riscv@nongnu.org; Sun, 01 Nov 2026 04:33:22 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xNRwG-0005rC-Oc
 for qemu-riscv@nongnu.org; Sun, 01 Nov 2026 04:33:22 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A18K6ja350105
 for <qemu-riscv@nongnu.org>; Sun, 1 Nov 2026 09:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vjSB4LDeJALQzuED1orO75o4jl26Cu3LHV5FBo6NDr0=; b=VcyaMjyW/18XhyKJ
 42NB+Eo+PSaq16N2g1Z/ssRxe+i+ajvayrQYDi1JmSwRTO/VRgOxoLusXbhhn8n0
 xsjzl2BfgoE8TJdFdGBHnso7Sbd08fef8nxpsE7EcW/JE4GS6GtSnyVPO+ftmfBt
 7a9kjQNXEaN0ajy0Y5xDa6816m47WOjJvTyK82+YY976tN7WzWfk/L2MHzCimgZs
 G9undzSQDPwkDX/kH1IARh4fM0e3tNiUp2+03X4Qf8Rhx7U+0IkhRWeunG9eGh1m
 vhkUHFkO7De+qtXkBbt/Ye60NBpF47H0EQPWQuvXjjBbcXlypnGBmz3NnP+AWc0/
 EpRr8A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkkfak-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 01 Nov 2026 09:33:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91c71966998so26841066d6.1
 for <qemu-riscv@nongnu.org>; Sun, 01 Nov 2026 01:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793525599; x=1794130399; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vjSB4LDeJALQzuED1orO75o4jl26Cu3LHV5FBo6NDr0=;
 b=AJadysbQ2lqy5es8xP0yTc/xUaLxDMN9J9974WxpC4SRM2RWWtRJ9Ghbxnn4U2DjSI
 N+NAmfHrha2uo9gG+nqgHM40fD2EfKZoQecUY4Qkex7SLKOJoB0QJj14yHyF3qiYKNP1
 /DcIBHhcVdlJMQX3ZcVGwWPRKgZQbDgjQ/7zYStu65vVd2l7pPwRHxWYRbMcAAMZ6JAk
 7fCpRMYDvVWXIZ9fMLJfDbZGxRM4sysapQiijcA3u9Dq3H9ZgVrMPoYvw3YTq3ri7AbY
 tsIapCRRgimK3/oljCQMODlb9J9pWXWAF5S6vSb+FUaXKc1/TD1tzpoa8WbEBiTEcKLP
 gJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793525599; x=1794130399;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vjSB4LDeJALQzuED1orO75o4jl26Cu3LHV5FBo6NDr0=;
 b=qQlJW/kCMjnRkVY/UP+PrXWjAno4qpYFot1i/5hW+nF4VqP3zAx3vhq6/RvQnrxetT
 n+vvsxUaybB1PA2rWNAwkv/fVi0DQbr/fP8E1K/bntICdq7Mu9YtS8X4do79vkBp5Ip/
 cgdXvFjQOKqPFkmCWpWn/qpO/5pErpWGFKTxglqvnA2SVLsASwf65VgpOSB+LYkpZp85
 oAB5wvynGijTTRYyg/QJ0DPOs9JuDJknwxHTwTyepU13+WRO+utLhVJrmE5/eQBoKmLR
 M7SNaYyeWUj6RwivfceUAFh+SDHEq1SS9W/jfN3wvBEg0wtQWxONNIXZErb56TTj2EGG
 U4EA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzhahJCkMmLjx3wf1CIijfWWvJ34sVUlVgH2T+YC18PlQ8X+ucTMIqdz6abYocfwMmV9aCcgSAbrFhF@nongnu.org
X-Gm-Message-State: APuU4Z+AW5i0aMQA8bcWYMTbTBpFfjHHIn2f5uo+tsjotLcKbQTgeFis
 cQRmmoNbJ/rLBLS3+xPraVZ8rVxL5wACGKapc9ySP2SrQQEg21fqj/iRuKB496LRwkm0O4lPMyW
 rbfqOPZpATGeA6JwnbB9zOwOTCqBNw3ZQQ6O4S8Lj/7ycw4FQEBlHrxwbpg==
X-Gm-Gg: AYBFou1F0m/DPQ3iJPh9qqz2o/hu3cb/PB9iZCGM82ygCx3rVzVPk5nt71qeZAH/s+y
 G+j+5eZbcaxFxYEMYNUiDMV6At85OGoWlGc7gnw8YhHRhTw1UbrLVnn5gElDujKnLs4TFmXFJHn
 icO4+kgfA1aa++iDF3cxLf5D9qYVHjlmx0xlht5f2uBaBG7v/5syE/ktbYm53R0cGZ3dE3MyeGD
 P+EgtZsS1H1y+hePY1Sgf9AfXQ5OQFonXvdNs3FyzOhO6cuL7jJp9f++l+HkJUUi3TBdOdmDK+8
 kYaKUFm6GtGa8A/IMwoaNpnJz2rdGqk9J2p/MLZPIYvLdiVtRWd1QQMiqtpQbL6OLvcaxKMDnWc
 Os2MzKSmyYMwWVX+9CGBA6BdT2dzhz11unYxv9UQ+SccFHDBZ166JXu/HrULo0tBVGNgo8iHl7W
 Kixywuf6FF
X-Received: by 2002:a05:6214:cc5:b0:917:8783:341 with SMTP id
 6a1803df08f44-91ca4b9a559mr103086926d6.45.1793525599058; 
 Sun, 01 Nov 2026 01:33:19 -0800 (PST)
X-Received: by 2002:a05:6214:cc5:b0:917:8783:341 with SMTP id
 6a1803df08f44-91ca4b9a559mr103086786d6.45.1793525598563; 
 Sun, 01 Nov 2026 01:33:18 -0800 (PST)
Received: from [192.168.68.102] ([152.234.122.251])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ca7f4767asm62614196d6.21.2026.11.01.01.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2026 01:33:18 -0800 (PST)
Message-ID: <2dc56262-8580-4612-9c80-8aff6cf56078@oss.qualcomm.com>
Date: Sun, 1 Nov 2026 06:33:14 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/27] hw/riscv: pfsoc: Enable 64-bit SDHCI system bus
 support
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chao Liu <chao.liu@processmission.com>, Conor Dooley <conor@kernel.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org
References: <20261014012323.322790-1-bin.meng@processmission.com>
 <20261014012323.322790-14-bin.meng@processmission.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261014012323.322790-14-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: biVXTYy9iBzNyM_o5KLQlo3mdRJpEuOJ
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae7075f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=QOY8BskYDu05dfarAz2gNQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=FRSEYCzRAAAA:8 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=X6nEVRAShBcqs7oysRMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=H4N_Y-AU75W7NKDNhZlT:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAzNyBTYWx0ZWRfX1MEAKaxftcqP
 GpiKU/DzL2epIUgQY9YMWHbuyy+GaO1v/HqWpG17NfvOloQ8pk7XA7Y1NkIyVNpwGnwPAT7sfVq
 jXmXQ7ZiKgqJ5ZI84aYruKzgiNBJDjg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAzNyBTYWx0ZWRfXw02M7VrNBb1p
 uPPYfqUld+84OWQR2K6ZcH/bhnCBSsiCp1brmspsMZ9/xZypOISfa1f3frt9G4AiZkZMiyvVsSk
 ZxK/7fQuiQQ41FkPuOdeTAXr+nUn7IsmJygw6Rl6nanUjIne03bP9EzT0c0HbZtZ60yi2B0YMkK
 DwYL/zpgko4x7FyURvZKen2GEMpTMHRRjha4cRDENtKaQlBTrIfHAcr67r96F7gId4Mmsnv3p8M
 DhH34Zr76h1i9VOEUYY3GPO4uBtpHIQYaSsnKz6GnwqUH1ZfD8PiWm66mBS2+KLB6mG33ubUPap
 esutxk4xa6wSxYa7k0Ar30PJtoDuCCPgh/QkIdrSjTgmV97HQPzmwAh5DIoYZJXyGoLxMan6nVJ
 ffRxsCBi+PCy3ZzwnImSag7VfPLOHRJX/tBKSFJCkQez483QsdyjL+1Gu0UPBmOtLxN+hUifgL6
 lJEhZMfTQmVv8vt5T1A==
X-Proofpoint-ORIG-GUID: biVXTYy9iBzNyM_o5KLQlo3mdRJpEuOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611010037
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



On 10/13/2026 10:22 PM, Bin Meng wrote:
> PolarFire SoC software selects 64-bit ADMA descriptors for the Cadence
> SDHCI controller. The controller supports those descriptors, but the
> Cadence property remains disabled by default for other integrations.
> 
> Enable the bus64bit property from the PolarFire SoC so the generic
> SDHCI descriptor engine can execute 64-bit ADMA transfers.
> 
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> 
> (no changes since v2)
> 
> Changes in v2:
> - New
> 
>   hw/riscv/microchip_pfsoc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index d0d8c8f84c..3d1b3246db 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -193,6 +193,8 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
>   
>       object_initialize_child(obj, "sd-controller", &s->sdhci,
>                               TYPE_CADENCE_SDHCI);
> +    object_property_set_bool(OBJECT(&s->sdhci), "bus64bit", true,
> +                             &error_abort);
>   
>       object_initialize_child(obj, "ioscb", &s->ioscb, TYPE_MCHP_PFSOC_IOSCB);
>   }


