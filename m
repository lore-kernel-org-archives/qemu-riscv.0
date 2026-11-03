Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3B6608363B
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 11:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CLMnIMgG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O1nNbiBP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOCvE-0000my-Lf; Tue, 03 Nov 2026 06:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xOCvD-0000mW-DO
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 06:43:23 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xOCvB-0007sM-En
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 06:43:22 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A3AA3Hq3577887
 for <qemu-riscv@nongnu.org>; Tue, 3 Nov 2026 11:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vKC2xs9863faPo3Qmxah03wlBdHW7frgSrK4TWHpsms=; b=CLMnIMgGfdtCD/Ln
 a2J7GIWfumTQie1u+8jue15Nhhy1I9+xzBcHe+51lfx0yrO6vQ6e364NrfqA+lGR
 jpvldwebbw2m7a1yIMp4fAqhRrjs2egm3BhyK8ac+/zz9aewR92MS+qnqWR/nqEv
 CPQFaO4llBxukEAUGGO1gTkjky+ECxdXgBFT4swDTS8zjs4pnkdjyWP5YAbIzdJX
 P7GJIn14bCXHs4wMjWjJuQT+rg3oZ04E5g+BJNLF8PK6Soj1iyDrEHTLoOwvnwzx
 rv/exXtM4WIlMZH5jg+TWJ8nLv4HZfmXLKRKc/JGxQ8r+s2WBGuMcBTDPP83aupJ
 jEmh7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d9xc7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2026 11:43:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f5844e383so664302485a.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2026 03:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793706198; x=1794310998; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vKC2xs9863faPo3Qmxah03wlBdHW7frgSrK4TWHpsms=;
 b=O1nNbiBPX1utqAHliq1KBxCL7hBx10RtSeC7p0HBX35MrGD0j9ZKDtxR9Pb5OuYW5U
 Z3upuafZ6Lzu7eCZHeq/giQCtRvVB6EG3CO7pG75N9kF5ieZABcIYaj0kct+0siNnU8k
 57HBe7FsHx7vQE+x+cgDsyFSOn3CauE98SBRqebOjHaPQeCY3PJsBzJ7kKE1hqCicRFR
 B4/oKZmsmNJoHV1rxxklADoqZG70ssQrWpEZ9MTkg8bAqPgh8C4BynvQThdSK0Rtp2mp
 /rMyf1jm+7Pu2v2TzEmIBUrKnwyEoJ/6lSPleqWtq2kMStFMpHPs5lfrGWiFnvYsJJQB
 R8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793706198; x=1794310998;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vKC2xs9863faPo3Qmxah03wlBdHW7frgSrK4TWHpsms=;
 b=c28XGtiKKvx1q7Fxsiu2wkhHpDRulj32HihJMowsUY/cdmSWx3Ie3zA21Ijc7PN6HZ
 +lioZhedRrYzxcQWgU2ieDh4tgg1257b1ppRMK7s6j+0hd0Zap6xAMuoq97/sm230pCY
 9qGNuu9l3xs96dLwQUYavi4DoS5AVnonyRPzhH2+WJuxHxDa7KPefaiq+FtmonAE4lU2
 c55ezz7l7CykSAC6qqeimRHgysfAM6jsSzL+lMrSgPH7+YmwPw9ecHVrlrmi8AjoNuTn
 wbRg3673Newp0VSBWI89sDt/6WPZIuslrC2JTRlil0Nov1ptIydkHOpt5kKzurB45Uua
 mdtA==
X-Gm-Message-State: APuU4Z83RehMxZOkKcq0TehGoBg5hVMGHqJM/crW2g8YcDtDJUTtfOQx
 5bIw/NeHEf2hAMoc4yCJeDu3ZMXvF5zNvhaZni2kcydnMvTegb8dKMyynTi1MV9PG7OgQHJPD0i
 ftvk5kjjlj3AvcJXMCwIalw8WsF6H1L7fqHldrektCGIHjo/CcPxecCTRSQ==
X-Gm-Gg: AYBFou2kr5yAT8JTmhn/keRZSk1JRaQ23DbNfZ6O/4y8vSZeaOmFfjWkN1RZrQd6fGU
 QC47SJuRxDMR2ZxJEEho6VatJOAVcU8Xc6td+xDKr0uoJ3cw7yGlcCdQf/h1ahne7vWCj4i7wxZ
 DaQHgzcwRK8mSi9lH3ndGBCEKldrNS0pkmJFuKU//Zw1DsCCxGyI0jlgqSXGu/VVelF6iMuTIU8
 R1GULS9SNIRdiA5DmMBiGpK6guiHxBHRipIsseLYtjDGFUwrzbHXYauS0cbE+XQq0f/Pzl173ao
 4sakXW2XDDmNEGuIikcAQFzuOm0f7x4Y0NCqTDytoIiPGcCjz+UUh5G7pXrcm9oOX78Ey43DcIU
 9056P1zmLEcIZ3uW9gciQ0gip1ZzhK0v1tpL1aH6cFv/xfM2Y1Aws3n2Cso+kXk4C+W5VslYESD
 +eoBKUFg==
X-Received: by 2002:a05:620a:1a10:b0:944:d79:c02 with SMTP id
 af79cd13be357-944214d0cdamr1895981685a.10.1793706197928; 
 Tue, 03 Nov 2026 03:43:17 -0800 (PST)
X-Received: by 2002:a05:620a:1a10:b0:944:d79:c02 with SMTP id
 af79cd13be357-944214d0cdamr1895979085a.10.1793706197464; 
 Tue, 03 Nov 2026 03:43:17 -0800 (PST)
Received: from [192.168.15.12] ([187.56.223.122])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9442581b2d2sm1063905985a.15.2026.11.03.03.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 03:43:16 -0800 (PST)
Message-ID: <93aed951-a31c-4af5-97bc-192d8bb72221@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 08:43:12 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hw/riscv: Build AIA glue only with APLIC and IMSIC
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, pbonzini@redhat.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com
References: <20261101031547.125591-1-tanchi25@mails.ucas.ac.cn>
 <20261101031547.125591-2-tanchi25@mails.ucas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261101031547.125591-2-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9c8d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=bus90iwuyia7r0C3gDGjVg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ImKtm-EYQEa7FqKTv5sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX+dyzkVj8lzNR
 rLYFJWqDCRhq96nejXEUZGUUaV5jhWYBPQPaTAj9hLH5GhYiXffMjcTTEk0jFgAkfH1NyXrBGwW
 P9qE6gA92R0qsAQptd/vyxtIXndCuG8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfXw4c0tv19B6Xf
 mWOQ/uI2aHj0mffE6SbTjDJ+9hq1B7mELYFxF8Nw9rYQwc+YOIu2J/OrMJOabb+rp4ZXC87GNNO
 P1R5AwpzDHM6Iou1LwbKsuV3pBHzFSbm3EHnduHWPJXlGGW1ebUNZQxDTDGxePFQbiZMT77y7nD
 CW3lSHfGVKlpazfnUMBtyi/y6+JGQkKhaKMPl+VdBWHxYjIcJXxd6JPWn23E7HXZlbiOA2OG4V/
 D/k+S4CYbtSttWnTVw4Cug7vHDBz7Huc4q0VfRrtC2oET9RWH8z6UROOhCB0/3jxnG0yJLgYSpw
 KEs8REkTRe4Uc0DqFRf+06+DvIizT54V/tQe1T/mW7cFXQQCCt8SfQ8ciig+AJkU3qZzg0YIj/d
 SmitIxUGAp86hJ5bzrdN6Gi7ygJO9SiFgIEhcf9ljfMbFXonG4i7MUTLiMCis0kblZkkJw3S/5F
 0tMDZmnWw1ps7JKYarA==
X-Proofpoint-GUID: vOE8RSwFn8q_BzJ7vFsTZxsBr4T3mysp
X-Proofpoint-ORIG-GUID: vOE8RSwFn8q_BzJ7vFsTZxsBr4T3mysp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030046
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



On 11/1/2026 12:15 AM, Tan Chi wrote:
> hw/riscv/aia.c is built unconditionally, but riscv_create_aia()
> references the APLIC and IMSIC device implementations, which are
> only built when their respective Kconfig options are enabled.
> 
> This causes undefined references to riscv_aplic_create() in
> minimal RISC-V builds that do not include APLIC.
> 
> Build aia.c only when both CONFIG_RISCV_APLIC and
> CONFIG_RISCV_IMSIC are enabled. Move imsic_num_bits() to aia.h
> as a static inline helper, since it is also used by FDT and
> ACPI code independently of the AIA device creation helper.
> 
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/aia.c       | 11 -----------
>   hw/riscv/aia.h       | 12 +++++++++++-
>   hw/riscv/meson.build |  3 ++-
>   3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
> index 56fc064533..4463ea2be8 100644
> --- a/hw/riscv/aia.c
> +++ b/hw/riscv/aia.c
> @@ -13,17 +13,6 @@
>   
>   #include "aia.h"
>   
> -uint32_t imsic_num_bits(uint32_t count)
> -{
> -    uint32_t ret = 0;
> -
> -    while (BIT(ret) < count) {
> -        ret++;
> -    }
> -
> -    return ret;
> -}
> -
>   DeviceState *riscv_create_aia(MemoryRegion *container,
>                                bool msimode, int aia_guests,
>                                uint32_t m_imsic_stride,
> diff --git a/hw/riscv/aia.h b/hw/riscv/aia.h
> index 5df3292610..e4dcc5aae0 100644
> --- a/hw/riscv/aia.h
> +++ b/hw/riscv/aia.h
> @@ -10,8 +10,18 @@
>   #define HW_RISCV_AIA_H
>   
>   #include "exec/hwaddr.h"
> +#include "qemu/bitops.h"
>   
> -uint32_t imsic_num_bits(uint32_t count);
> +static inline uint32_t imsic_num_bits(uint32_t count)
> +{
> +    uint32_t ret = 0;
> +
> +    while (BIT(ret) < count) {
> +        ret++;
> +    }
> +
> +    return ret;
> +}
>   
>   DeviceState *riscv_create_aia(MemoryRegion *container,
>                                bool msimode, int aia_guests,
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index 6bdabb9544..957031c07d 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -1,5 +1,6 @@
>   riscv_ss = ss.source_set()
> -riscv_ss.add(files('aia.c'))
> +riscv_ss.add(when: ['CONFIG_RISCV_APLIC', 'CONFIG_RISCV_IMSIC'],
> +             if_true: files('aia.c'))
>   riscv_ss.add(files('boot.c'))
>   riscv_ss.add(files('device-common.c'))
>   riscv_ss.add(files('fdt-common.c'))


