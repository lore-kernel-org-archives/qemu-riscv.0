Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D19606D801
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 11:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwF43Cuh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R3vU4FIN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOCvV-0000pM-Qv; Tue, 03 Nov 2026 06:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xOCvU-0000ov-8Y
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 06:43:40 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xOCvS-0007u2-Hm
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 06:43:40 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A3ABYIq2002763
 for <qemu-riscv@nongnu.org>; Tue, 3 Nov 2026 11:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lUpj1XyIUcdWcYKTf8w/ZWxcgNOAaWqvUmuMHKh8QNs=; b=NwF43CuhqeO/E4ge
 vIS6rj5mAmQiUkXkgnMucFyiTa7KvYUCyhil2KHVHuCpmFMRgtjVm5BOB/Da6cI7
 Wh1m1Xb7VqqqbNOLz6NbWTNGilgg/7TzsNnJn3+lAyUlWfmWNX+c9Bsy/ADSQZnQ
 08fhZ5+jqFOHZVkj56TUrb5BdUljyjcRe7IWWT2mophHdBuZpX7LQYttWxzaq0WZ
 LXORIK9IsDbAfPL7Ee6t5zdvvoc5w4TZ5krZd5ZsdhPYvksCXv81fgq5sE151u/Z
 anmHlByNt9wC5u5HF/sEowjHf4okt+yVfOAegzALSV4mDFAB8q2TFVwqEuHchS2M
 3Zg1pg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycsth4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2026 11:43:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9441113670dso913715585a.0
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2026 03:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793706216; x=1794311016; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lUpj1XyIUcdWcYKTf8w/ZWxcgNOAaWqvUmuMHKh8QNs=;
 b=R3vU4FINuW+fqOQGe+HRXVJuCKrsDfEqTLN8ysylclCnOFWaMM8WWI5sAZuoHzJIcA
 1hGT+phIRf1zuewWn8AkrFGgkjtjAE1yWANu2Xh3SChNKXvWxRwF061/rAaa0N84RnP7
 C6kVG8BNWeVqWe4hFWPZaIRM9vP8qmQevNi5gHUwCqfJxOQezqsTm/GvQK1aYvAGWsgo
 mQkKEiT9dLBRE/Kflm7CJIi5MwCZKzjbwBcTQ+QMW9AU6cLaHtvrkMUc/TJFPr3E9GRe
 ZylcGT3gLV+H3UIpdZzLNiPq72gOd9CISw3eFsqVV6ISW1Ihc+fnNcksXMVkSVZ2HMmZ
 VX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793706216; x=1794311016;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lUpj1XyIUcdWcYKTf8w/ZWxcgNOAaWqvUmuMHKh8QNs=;
 b=vx4QTfwuXx0BSrnJZmLeOgAE92HsYEiZZuYrsFKv6qAmnkE/tbcZXaq6ke5n5uEVu+
 Gcsw29TAxGyJ5TZPeJvIu//I3ji6ERLt2SubTxq6VnVk+86sJWWe6st3vCAE1+a58BzL
 FoFakJxlr8OEIn1ZE+hmtUVBggunQHb33XURN1a+aQVRiE1CoDcbV6z44WS61Ue4lpxX
 SFwchseEY6+OP8LXl0jJiFohAbdIoug5ShsFuXXVGiVCTVK2Yu47FWG0moBqc84NSe+b
 xF88pUHuo0yjHeYb0TQqyyib5TTMUhvyr8HI8W/LwWYsibTjk9WaNQwVVjzPdFKhTxgc
 IFWg==
X-Gm-Message-State: APuU4Z+EeKP0mCqhi8ZS94ONEd7IAzGo/aSodsKiayPFlpFfF8M4RkST
 8e9A7j8Plm7s2o3ARqYGD4abqJlFpn7mZrGNIDz4ImGi7Ti5JeXJaOyO5jkA/qmBXTra4RVcKqD
 3LNqArnTQ3sPovRYje8/ZC0BliAOslVGRFRKtOlompkaDzA+yuCtnWqcBdQ==
X-Gm-Gg: AYBFou1917NF2CFI3/hwNTdl6BTd5x+DboCPoWwacCyZXjHFvI5v0Gx4sF9yULRjFBQ
 22cyzPmTbucolAEiJ6pb8r5ee2KHipOZ2SQ8dgIbQ9/AQKNJIBq+BB6eNXf3bI8VQN4NcAjSJ9a
 tuZGys89rpjFx3a7uoSzJsqqFTVd2OD/PMfJ83x2cBKPJquE6Cko1vzAcVNoj8zKwicpg//tTk3
 TX7SdADJKJ1Ol8Jj4p17OLyFaYmQ8Z+eo4OV9ZQLbwGK/0vuuQG5UxYRKc1j3t18CRjnVjbNQyF
 PWKjtc+EddxvVrMRtHeSk4AEWV9yBDBOuSvRxj5ObCRoiu41Z9gx0ks9PnY0CeqZ0lzXL7Fxjgk
 J9mG37PbYchYIAZomVumkaXb0r7lm5n3FWZKx+XXGbJ/GMQHvF1yC/h/yyYKVRcMJMhD2uRqOuC
 FYQLXOyw==
X-Received: by 2002:a05:620a:404c:b0:93e:c12c:f149 with SMTP id
 af79cd13be357-9442183db3amr2059460985a.83.1793706215901; 
 Tue, 03 Nov 2026 03:43:35 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:93e:c12c:f149 with SMTP id
 af79cd13be357-9442183db3amr2059458585a.83.1793706215511; 
 Tue, 03 Nov 2026 03:43:35 -0800 (PST)
Received: from [192.168.15.12] ([187.56.223.122])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ca80887acsm114546156d6.45.2026.11.03.03.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 03:43:35 -0800 (PST)
Message-ID: <a84eb5d4-9542-4eaf-b3bd-96f2ade046db@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 08:43:32 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] hw/riscv: Build device-common only for its users
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, pbonzini@redhat.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com
References: <20261101031547.125591-1-tanchi25@mails.ucas.ac.cn>
 <20261101031547.125591-3-tanchi25@mails.ucas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261101031547.125591-3-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae9c8e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=bus90iwuyia7r0C3gDGjVg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tKkgsBWQpxOD88fezzIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 8ZY0VwzIAe_k4KZXA8KHT7O2oYCDGCWO
X-Proofpoint-GUID: 8ZY0VwzIAe_k4KZXA8KHT7O2oYCDGCWO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfXx+VScd5f5EMA
 l/ZiyHBFhMEux7vSsQfqC3uRCPJk6xLqcQK03vUUmWnEHsOgSmdKFgOv04V0oPmmz7L/toTrube
 ngX8nS3YqZJ/0EpDaKq9xnNeHG0OZ6r/2KI1Nn2yM+5l0S8UvksbnAVkFWFkI6DZt0pwm4gtACm
 OVJ6TIaa/5J999aAUxLQuXFkKGa1zGNmMke+3UYpxEYxaDZ7vQODTB4bqjZThXqeEGqrHDMuNwH
 I7c/eRFt65d8CsfuBx79a9i3sTxQl5WX9n/S/rjFrCY6s6DaY9i5th3zO0ShvYZCmlX1ahCU6/H
 IvVe1JwvPr2ues1hH/sjqKicDhVX2YU7U0nsXkKXVM3FPSmBlPmb57O9oKxdv9i2AlExDzOqlPs
 38+Z/++/yoGnQLjauL0x7Fk6QWlKAW+g85SLGk9MCiTaQ9u5pCeQEh1DdKq3/gXuxwcjmHPKSLF
 P/EYAkESHs8A9X0YlTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX+vcP9hCc1v2z
 zealhHvV1pLeozF+rRdLHQ9BailCboW6oZxYII5n5IsDL58efKjafJ6hFI/SAzh4cQRUkkftL0s
 EWKv1NuKirEwNBqMHETdin9i5bHatpM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030046
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
> hw/riscv/device-common.c is built unconditionally, although its
> helpers are only used by the virt and server reference machines.
> 
> In minimal builds without these machines, device-common.c can
> reference device implementations that are not built, resulting
> in an undefined reference to gpex_set_irq_num().
> 
> Introduce CONFIG_RISCV_DEVICE_COMMON and select it from the two
> machines that use these helpers. Build device-common.c only
> when this option is enabled.
> 
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/Kconfig     | 5 +++++
>   hw/riscv/meson.build | 2 +-
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index fb05031228..27f03b687c 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -7,6 +7,9 @@ config RISCV_NUMA
>   config IBEX
>       bool
>   
> +config RISCV_DEVICE_COMMON
> +    bool
> +
>   # RISC-V machines in alphabetical order
>   
>   config MICROCHIP_PFSOC
> @@ -68,6 +71,7 @@ config RISCV_VIRT
>       select PLATFORM_BUS
>       select ACPI
>       select ACPI_PCI
> +    select RISCV_DEVICE_COMMON
>   
>   config RISCV_SERVER_PLATFORM_REF
>       bool
> @@ -85,6 +89,7 @@ config RISCV_SERVER_PLATFORM_REF
>       select RISCV_IOMMU
>       select RISCV_NUMA
>       select SERIAL_MM
> +    select RISCV_DEVICE_COMMON
>   
>   config SHAKTI_C
>       bool
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index 957031c07d..b60108787d 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -2,7 +2,7 @@ riscv_ss = ss.source_set()
>   riscv_ss.add(when: ['CONFIG_RISCV_APLIC', 'CONFIG_RISCV_IMSIC'],
>                if_true: files('aia.c'))
>   riscv_ss.add(files('boot.c'))
> -riscv_ss.add(files('device-common.c'))
> +riscv_ss.add(when: 'CONFIG_RISCV_DEVICE_COMMON', if_true: files('device-common.c'))
>   riscv_ss.add(files('fdt-common.c'))
>   riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
>   riscv_ss.add(files('riscv_hart.c'))


