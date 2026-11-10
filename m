Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE4B60A2600
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 20:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nEGV9h2o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ay/FBfsZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQsj2-0000wq-Fl; Tue, 10 Nov 2026 15:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQsiz-0000vQ-Tr
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 15:45:49 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQsix-0006c3-VL
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 15:45:49 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AAIolVG3893719
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 20:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +KhSgRSJ4vtC/hqJOuzHF05zcZQpUJaPggCQ7ReBLp8=; b=nEGV9h2oichc8Xop
 yhnL4Lt6SSrVS1Zg4NLNmSWbnIKqyQOInfterS+MDKiobPSK38Z0+l56xdbTCr51
 JcvZKTPxEC3xuX885CNTx5s2Uk7WyxesS1mp+0yZum8OLa/3phVzaxZxFTMg9Wgl
 mGBBCAqm9b/JpY5VgD9DhZpLE9p/G0GJCrWnWkb3AdHRZSEfG8iJMlLrgeo6hiQ/
 gUldR07IcZFdS/N2gy3U523HEs8s2Au8MVr3PEpfh2YSQNaWS6neDt7OkHKofb/n
 PVfQXwoK3XI70udWUWXi23pY9vqMXETrNgPNT16HxuDzVrBi+hrMkxtWA+rdTA/w
 +hhovw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84b8xd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 20:45:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5363b06bcb2so52399271cf.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 12:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794343544; x=1794948344; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+KhSgRSJ4vtC/hqJOuzHF05zcZQpUJaPggCQ7ReBLp8=;
 b=ay/FBfsZaY2bo7SE6xu1k2sk6Z16Pqqpnzim/7umEvETxqRyrqaVNNseCqXzuioyD1
 SXAqAL9q740mSUYvF1ejQAChw/WmSg1u6UuUu4Kbg7dpEr7MLONGwu0lYnRm9C2bHety
 0e+Tgb7vzlSR9+iRF5mc9OSV/BqB4QTF9xUZl/FkUqkylenmOp8n+Lk2I8YKZ9BMPjWQ
 rWfJiJhQcYUmGDrDCFIomH+0wgrFvYjEhmQ/sx10zISuIQFnHWYaJPA6T9WEKP+OAu1m
 B/kM8Zl+5uY1rpb+hp1i9jVsUgbBDEwldXjxGyB1Nx7118kyHXSOrlZ/cqQeWb5hzqX6
 Ja1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794343544; x=1794948344;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+KhSgRSJ4vtC/hqJOuzHF05zcZQpUJaPggCQ7ReBLp8=;
 b=huKaoug27bdeBBGp/Y9WIIwTCrBHJNtjISaiTWNvAVKmYFEwI59w8uU6GFeY+4D9u3
 XvQ8ICzbmJxeg6RvjSH25Fe5GfF1dz87kIUYLoysTUly8IJHGiUED6UXa3JaexfqElYz
 PEJQPweIgxMihjv5A55zC1BV/B6UrQ/ldU8E0XSzRjnGDuijVfGQ8Ag7j6SQyytE3gnH
 ZPYfYYmi0Mr9g2UQnk+AwrjlpjrvTOni+GjeHurUw7QxxJA6RPBNaY/GTpOh8lE9IoYQ
 dmh7iOZbfqNnpTx2MS9uTx5p+GZJ+pp8NpzwCReZnd45f40nFiTdNewaMpcyklqDqeo8
 hcgw==
X-Forwarded-Encrypted: i=1;
 AL+hErE33Qtg6VqjYDkfJM7nuMhyJ8Z4kq7R9Hz6/K8v3v+/75ndfat/sIccElXVePQgCjJ52Vd7QtkQLqR3@nongnu.org
X-Gm-Message-State: APuU4Z/hUdFIZseGbF7ZcotA0B0jJ2otpspf4eJck6O80bPrNtEUs9di
 saJeWyjEkf2ZDk3puyurt1nDBX5+imPvFklBP7WTADhxkt6J4xSnWR0Ki9sQl+7v7VuX9crsw19
 +C/+mvcFntGoGPc20Cug3evfEqIiFc+Uax9v61rIagnQ8qd0vfLrQRhxbjQ==
X-Gm-Gg: AYBFou0EjdJ63ok0iTDP8ppNtaY0qRjQ0UARaHAKzSa9kKzwTrgCyqJ0LapmHJDr5QU
 mLMIp7a5dAnoucfOvHyZLndxo+oGyeI//Gzbwo5PVoljzOHY3WyeBjPWEPnp2EZ6pzgLMb924fY
 CytfpZN4wcXa7CBiN5VGvlZVmVFZmfKZY0phmCPTn6JSuDX8NZ06m4umHj5imRchjW5tHw8sPPR
 Kw/ERQfqvDzILmTgig5sTfvPtTM1NY2bxG8CuMIP5hJ1Q1gOayLyJoAIPNlS3+WPPNIrXi0/0Wf
 wmFJ64LsJWiDJRou/L+91ow9JjaWfCsT3dnpCW1klaK15H/T2o2lR9syD9MxoyAW+6o/UuOkgVs
 HYziggQDwHSv/SlTXL/PSFOQb5jfndnhRqzhQ5t8wCL7B3I4ivgFg443kDUcPTPaS4d/VOmb8qf
 9cSlrIeznnNg==
X-Received: by 2002:a05:622a:5592:b0:533:3bd5:b6e0 with SMTP id
 d75a77b69052e-556c1679e58mr157411cf.59.1794343544240; 
 Tue, 10 Nov 2026 12:45:44 -0800 (PST)
X-Received: by 2002:a05:622a:5592:b0:533:3bd5:b6e0 with SMTP id
 d75a77b69052e-556c1679e58mr156841cf.59.1794343543591; 
 Tue, 10 Nov 2026 12:45:43 -0800 (PST)
Received: from [192.168.68.105] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5550b93ee00sm32683691cf.16.2026.11.10.12.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 12:45:43 -0800 (PST)
Message-ID: <589e2dda-a1ab-44cb-8185-d3661d7c8f8d@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 17:45:40 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/26] docs/system/riscv: pfsoc: Document CLINT
 topology for direct Linux boot
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Conor Dooley <conor@kernel.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Sebastian Huber <sebastian.huber@embedded-brains.de>, qemu-riscv@nongnu.org
References: <20261104154207.641511-1-bin.meng@processmission.com>
 <20261104154207.641511-24-bin.meng@processmission.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104154207.641511-24-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4MiBTYWx0ZWRfXw5YXS80Vp3X1
 phkz2tOZY6f8OFWCABk+m1hIXmgKresNqfcTjFjq5X7gSoURW6BEJE0zMv2GjmkPlxvlRFeUnB+
 uRrjoLJN5nRnCKmpDJVuzc+Hw2TiPmJ4vnhXSCcq77QXZNGx7TgXQlIFxfd7sMbSkI5HllJzKB6
 LvpzVy9/Xmk4W7oFMj1+txtuNRSnNzp3/kgCQmYnuVgYxq+IXRmnELFBxZSZRLYqs/eUkxB9ybW
 ZdJkMcvbIrctwt3jE02PKOVOu8BH5bYaYy9jBaeUponacS7DE4hI2wn1rvy8+trLYa8fkFQQx+z
 peotYEOsps1RYDV5zgYrAJZ5JUNNcwoIjcTNIqEfL2rv6faoqtl/AdYw8iK+27CfEHuXeENhX2t
 ZZUwFFolwn3ZlHbaM+MYKvn0psY5cWQFhwcKgp4AgaLhTsxOXvlZUklTNJ+pVDpDe+glag3Tjnh
 n+kFPdUBqZ7/ZXfHYDw==
X-Proofpoint-GUID: J4CNszY9msgw4T651a_jY_4OylgOcwfa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4MiBTYWx0ZWRfX0PkSLP8O9ygn
 vGzEAWAY5TetKtzmuRzOKGencJOrc3NgoCfgXxhnSK/u1dqMMHNvwvPYgFjDvdde2AWZDAegtr0
 geApkskA58QOOEnrgKJ8rDTV5mvKDY0=
X-Proofpoint-ORIG-GUID: J4CNszY9msgw4T651a_jY_4OylgOcwfa
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af38279 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=FRSEYCzRAAAA:8 a=EUspDBNiAAAA:8 a=6BHc50qNE0_AG4K3w0MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100082
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 12:41 PM, Bin Meng wrote:
> The generic OpenSBI platform derives the CLINT first hart and register
> slot count from interrupts-extended.  Some S-mode-only MPFS device trees
> mask the E51 M-mode interrupt entries with 0xffffffff, which shifts the
> MSIP and MTIMECMP slots when the same DTB is used for direct boot.
> 
> Document the complete five-hart CLINT node. Require interrupts 3 and 7
> for hart 0 as well as the U54 harts.
> 
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> 
> ---
> 

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> (no changes since v3)
> 
> Changes in v3:
> - Explain how reduced hart topologies change the CLINT DTB tuples
> 
>   docs/system/riscv/microchip-icicle-kit.rst | 26 +++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
> index 2159e8e461..038ea7221f 100644
> --- a/docs/system/riscv/microchip-icicle-kit.rst
> +++ b/docs/system/riscv/microchip-icicle-kit.rst
> @@ -66,7 +66,31 @@ should meet the following requirements:
>     option.
>   
>   * It should contain a node for the CLINT device with a compatible string
> -  "riscv,clint0".
> +  "riscv,clint0" or "sifive,clint0".  Its ``interrupts-extended`` property
> +  must describe the M-mode software interrupt (3) and timer interrupt (7) for
> +  every hart, including the E51 hart 0.
> +
> +For example, the default five-hart Icicle Kit CLINT node can be described as:
> +
> +.. code-block:: none
> +
> +    clint: clint@2000000 {
> +        compatible = "sifive,fu540-c000-clint", "sifive,clint0";
> +        reg = <0x0 0x2000000 0x0 0xc000>;
> +        interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> +                              <&cpu1_intc 3>, <&cpu1_intc 7>,
> +                              <&cpu2_intc 3>, <&cpu2_intc 7>,
> +                              <&cpu3_intc 3>, <&cpu3_intc 7>,
> +                              <&cpu4_intc 3>, <&cpu4_intc 7>;
> +    };
> +
> +When selecting fewer harts with ``-smp``, remove the absent hart nodes and their
> +CLINT interrupt tuples from the DTB while retaining the E51 hart 0 entries.
> +
> +Do not replace the hart 0 interrupt numbers with ``0xffffffff`` when the same
> +DTB is used to initialize the generic OpenSBI platform.  OpenSBI derives the
> +first hart and the number of CLINT register slots from these interrupt tuples;
> +masking hart 0 would shift the per-hart MSIP and MTIMECMP register mappings.
>   
>   When ``-bios`` is not specified or set to ``default``, the OpenSBI
>   ``fw_dynamic`` BIOS image for the ``generic`` platform is used to boot an


