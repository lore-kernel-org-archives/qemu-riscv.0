Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D15CA5FE2
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 04:46:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xDab9-0004KM-V3; Mon, 05 Oct 2026 00:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xDab7-0004K3-OY
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 00:46:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xDab5-0007AK-9K
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 00:46:45 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695101LE4060495
 for <qemu-riscv@nongnu.org>; Mon, 5 Oct 2026 04:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K/Sq/USF2Hc6FErUGzaG1fl3qTzAHPxOPcN0N+n6wVk=; b=G0EGtTO6XSklxeV2
 ngqx6BB5xz/iC7SBVgg2wJkhnm8nrpAQVzNyB+/5zztnEkPFv43U4P8Qh6LDFmlq
 Jn3D7i5axFjyivM9qQsuByEsWGI5GdDQ9uZoVauBf5yDSV43gNd0JDjn6uBorFrM
 HEvmU1sMWgKcgdQGinIfzffTlKhKrQbuJot5+iDzvwGeU0OcqIeepGzyBkyhAWOm
 La/N6eUqIKwA9vN347ywBSjpwS5qHNGIRAdLB2nj+FsQJDsNI9wvV9NA8AakULuD
 qNx8QACMJq5DQ6t0a2hdFj032BSVLxYO3h0pwT24HGP/6CrGW9KAGC8bfA1vWfcW
 HQva8A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn8ean-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 05 Oct 2026 04:46:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5352a4bba0dso13593701cf.0
 for <qemu-riscv@nongnu.org>; Sun, 04 Oct 2026 21:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791175600; x=1791780400; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=K/Sq/USF2Hc6FErUGzaG1fl3qTzAHPxOPcN0N+n6wVk=;
 b=kaILdnyWy7oJeICTxMv3ZPGYU68A5pNy1+wMEH8bnRLF8qxGw27Aw/UjyBAytXqgKC
 ERhVUDQMP15kQ4Qx4g3fSS3GeYm+KpcSNsTeoOgxsop3M/A1h91rFMtphumueiV2t5cu
 /VIQZoB+bcDXOfWxImonnSqYWoI2QpbV8lsdZbqxoV0GJtcwqfBlj8G1qZcDjq/UWswg
 SK6G+c2SgGTLQxhLulWwMlkRO8HYmZe8UDQCurTFScxZfYxsD4l5ho4h4ApQBswvWnwb
 +ZFfuLQt5ALEXGwUEE/A8stCyf32vy8TzMuXqJ7W6fQiIfSAhKVi3ADaWDxM9voi7lNT
 RPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791175600; x=1791780400;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K/Sq/USF2Hc6FErUGzaG1fl3qTzAHPxOPcN0N+n6wVk=;
 b=tkpmFADspDJ6TJvxKLEK6mRFL0QrG4mX+bWA0Plddv/yayE7qgj1lYOBN/V2uFINVG
 ODijE8fcr0qtY97s27t5Zw0vnk7RH9MWdf+Y2lQWW6OJcBeeU+OxpQdvAX4K7HcaKkRJ
 OGZQGk4qjcei8ocmCivBBo3OdupeWYPAvKP0IwHRbnpVazcAm63AkCGKIBH9Jvkzj3Qc
 QrpIasvn9pzcoXH9T9tOnQ8gwnERMjttXk1adndzT0a3Ufx9FjB+FcoGngi7ZaunkMbV
 RSi6SKm+mNjZd8S9PpPA/VJh3ftqk1/snHUcweFTAeXi6mJFnRmZEvrsyMBcEDn4iVqc
 Mkpg==
X-Forwarded-Encrypted: i=1;
 AKwUvByPETpb8DVXvJGYIqi0AWxElAR/FDNoI44J7hgTS9hBZvFEIzywVjoSQ7JX7adw/jqj3hNM08vHKzy3@nongnu.org
X-Gm-Message-State: AFuF++kaLHXmTW074MDvLC5wcgAShMod7bcGFtUMcgGt0QS9d3P4USuT
 qOsxbea1xKYdSQj+k8gGjbqLhvtkn5o/A+htOhKyUl9nioWkgtylqbnqYMtNqKuWBDXDITWBdk6
 NEtjSgZjb4XhxBn9dvmOLm0KLU34LsTO1mp5cdbooP1KcSpIK7saSHvMCRw==
X-Gm-Gg: AYBFou0XtjlOOyCLPCIQUs4Cc2NjRePmTlg7g04zvhXD7SxukKepIeWhNndyxmUVK7z
 BQqvTFYRZEDEguoV2jr9tP+H36IoMXTI6drbhNo/L6S/c0FH4t3Dbtnuy8XCD+dPUwZ/37jr9bg
 RR+S+H+7aXldp3OQhbHgdc1E4sk9DbMuRQL3ykr32n6c1+OSLGFqvyN6piydiYsxN11I0RYyNtL
 8qLaSZa4st/t3FzHNzen+RFAjXwdqXnoL74PwCnGRjPlX8KqhuRT9AzHxk3rqz7b4ClD0nijEaU
 tRFBHaYbfFtt2Y1YGPwD1HocOnpqx3WaIEz2V/bjF0CdK9zNLD836JjH7H8vz4p5vAP1sW6SbTc
 Ym8Elm1kAgJi+zUb2JUXc30tf3S2dh3CmRncA
X-Received: by 2002:a05:622a:2509:b0:535:1fe4:64df with SMTP id
 d75a77b69052e-5351fe46f3bmr75954171cf.12.1791175600232; 
 Sun, 04 Oct 2026 21:46:40 -0700 (PDT)
X-Received: by 2002:a05:622a:2509:b0:535:1fe4:64df with SMTP id
 d75a77b69052e-5351fe46f3bmr75953981cf.12.1791175599722; 
 Sun, 04 Oct 2026 21:46:39 -0700 (PDT)
Received: from [192.168.10.208] ([185.243.168.149])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53398836341sm87549651cf.2.2026.10.04.21.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Oct 2026 21:46:39 -0700 (PDT)
Message-ID: <5f6c5195-edab-4e68-89be-31a52aeabde4@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 01:46:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hw/riscv/virt-acpi-build: Fix the UART register width
 in SPCR
To: Rick Richard <rick@sloservers.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>
References: <20261003161248.38903-1-rick@sloservers.com>
 <20261003161248.38903-3-rick@sloservers.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003161248.38903-3-rick@sloservers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jIzWuA6HSNloTSagUiCiE-iBqpkAiwBV
X-Proofpoint-GUID: jIzWuA6HSNloTSagUiCiE-iBqpkAiwBV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAxOCBTYWx0ZWRfX0JPH8gHzqweC
 HzimPa+9xeb42lsV0wpzbJuS7wUALunkU9yyMlDdaQR2dI87TwirRzEcfftAOe+vWdCNX+Zo+TP
 PY8jxOXHyO804fsRsVE8KLfUabi2xHnEwWBCx8ASgiYnOU86EqHMpFbPADqgOeGRj3IFi/VIcmn
 FtAJvipQPHeiChb15uwOLhIk/ibR+ePJoO5ZzVBeehxqt60zIYnmWsF/U+LSTnF/7wu01ep12y8
 v+hHH67J0R154xUqZbrZxJ36TTU116yWGZPljeDZcv4EzynAtCd3UY4jnUF37Mu7yd30S5Jnm93
 eBTjDAaK5pFUfEtn2NczZoEkvWbEVfZuWTLrQpf2Q/l7i3JcApxgJOE9CjHYjh63VGVspTSsj0K
 ks4dFi2rrCw+YHo+LYxFd0WseYXblOGoBRrGbQOu0mcVRyABnAeaCrrPjbUhPgzS+G/5cSyp9Xl
 /GTkf3njvuai4d7bmeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAxOCBTYWx0ZWRfX1FcumFjWi0LZ
 wlJ9jZNZBtxO4uX8m1siID2KA5yrVC2kMZ6Um/5j8WN8BL7cqPN5gwa7Dns2YQd/+bomzZ6bAOC
 Cl4tRSDdnNmSno7wHtOzJMhBiCXwwJI=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac32bb1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Adc43iEMMYzOb2FTIT2GVQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=F-tV29oOAAAA:8 a=BgJUQrm_WhOyRWVFy1MA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Y2dezMJzicAI2PZykhZh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050018
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 10/3/2026 1:12 PM, Rick Richard wrote:
> The riscv virt board uses a 16550 UART with an 8-bit register stride,
> but the SPCR table reports 32, which looks to have been copied from
> arm virt, whose PL011 has a 32-bit stride.  Change it to the correct
> stride for a 16550.

As you probably noticed qemu-riscv is very, very Linux centric.  Any work related
with making it compatible with other OSes is appreciated.

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> 
> Fixes: 3e6f1e61b4 ("hw/riscv/virt-acpi-build.c: Generate SPCR table")
> Signed-off-by: Rick Richard <rick@sloservers.com>
> ---
>   hw/riscv/virt-acpi-build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 8e516ec1..0475dcb5 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -246,7 +246,7 @@ spcr_setup(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
>       AcpiSpcrData serial = {
>           .interface_type = 0x12,       /* 16550 compatible */
>           .base_addr.id = AML_AS_SYSTEM_MEMORY,
> -        .base_addr.width = 32,
> +        .base_addr.width = 8,
>           .base_addr.offset = 0,
>           .base_addr.size = 1,
>           .base_addr.addr = s->memmap[VIRT_UART0].base,


