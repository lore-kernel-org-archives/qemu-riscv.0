Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6640C44515
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 10:57:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wllgC-0008UG-TY; Mon, 20 Jul 2026 06:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wllgB-0008T0-AH
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 06:56:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wllg9-0002Bk-Er
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 06:56:59 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66K9vTOH3295680
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 10:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nDrEoawgct2wult/B9vVFm6sozr36X4stSAAekays60=; b=mbBIc32fZKCJcfpz
 7M7aU/rBkQ0OYd9F7j+mMgf3Fw0Gtz1jHzVvsd3CGOtFvYcKVgQsLc0WO8s6JFHZ
 QhBSe4s5MGJW3jarp+EG5+WFnRz2n1shjAp2vYHU+Vio2x9RNFMVToMJ+rCUO7Yw
 QbpEXPw0igJj8CeJk5qyQKLFXLiSO+9VvHDVAvQXW3Zq4ZEMIJMj1VpKArZR1YAS
 0taO0u8qMn+LekyeJ4h8xkpnKE9Xo4zfUN8GHA7Y2zkEnKcRBAX1R5Hdrzdv8aaf
 VHYUaDT0VM28C6WWYIbvS97LHHvBm3akLO6gCqLoNyV/XuYXRQ0+9WKJslxfnz94
 6BRJLg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg0ssw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 10:56:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1a97644aso268678241cf.2
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784545015; x=1785149815; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nDrEoawgct2wult/B9vVFm6sozr36X4stSAAekays60=;
 b=EqCOyVJr9h3K35CcaPGXESNh+a6gOrg8QU9EsCyAbr4mFAqhvM9mTxJLemsTvahQe0
 xQDEmaO70pHn5NkL3gLfYjZHKCtf0h2Yx6lcqluzjS1Xh93Qre+77o3PcRVBVa4DFnKu
 UNBdx/oyQRTTOrobWsK5ubhJv/0prSEgbbdz2w/ia1ViIhN9zYUhTQGtIenPQ8ZCHlPu
 aD3BxxfdsJI0au+pZv5skwgBnF3SqNczyUEJLEkSJRRxWkc6TuGyglTwjP9Zoh/WtZEG
 nh5TiLs/cYeYLu5SnNdNRVDvpZCzB9Exp4Nv6k3oZ1hZNouZ+OMy1VfNLRJ32x7zu1qa
 3tWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784545015; x=1785149815;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nDrEoawgct2wult/B9vVFm6sozr36X4stSAAekays60=;
 b=KthnNHGKK4KyqIAN4dZR5LvnGgu/L3UgWmUQ+G0aGzkKFgbSeWHCsY+nZU9006xn+N
 sytNUNmChvcUD2+19Rmnrcx17rjMoU//67qvRYJXSJQ5Ne4BqB3T9EaVISuuolFPTeJk
 u+FESesVrfAgPmEXLliOf5VZKXD95R4sxwtkU3UeiBWyhFTl9c+VPhzcLL61NyjMaExu
 2z7cg9L8V/h13xH3XJ3oHMS+FbtMsIbtQYoHol2sgVW9SDj8cjt5PdR/NMTfkQBeYDjp
 yyUXwSdgYdW4OOrR1JhlKmN+DN26nO4nYuNjFE+PNfx6q3VNanUpWPahO6Gbq74lOSd8
 L+Ag==
X-Forwarded-Encrypted: i=1;
 AHgh+RridWWfy8NUhD5Ie8KzEqFNEoncZek6r+VvQpofHm8z8yD76zag11ETaFNkv4xvYoR9JZIAmpsZt81e@nongnu.org
X-Gm-Message-State: AOJu0YyzwBae+QEIRx7+/b18jJ8CK5qg8Qg4tweRzXO9uDFCL7mB019v
 9Mz8AHVuncsv9N2cIZSH1A5vi77bfFvDC51dqOK+w1TvU9UBV1OxITmI2CxA6GnZ6LEbC66lSRc
 ZAlY6Msve+bG2LwnI6RiVtija0bZfawMCidHo3MTDi6E3xv2WcdMv6aAQPA==
X-Gm-Gg: AfdE7clJ/gM427CM6uMgDxfqLz5Yl4c/yyYf8ro7uzjcp7eC5AlXbNnWVLjsC7gGM4D
 MNu53F4efRQpmt55WnCBvpop8WLnCk+uQfbeyjsKki6QsRvTyDoTDG5GZ1bRxtALsOjjFGzcpG/
 hLPSbG6uSoveVB0CzrYU1UAQ/+adNuPdFfhdiGjZjwpWWkFex/N6wr1sJVTrgwTLDRmHi12LnwW
 c6tuhb6LJzZ1Yrb0bseyYtpl3g7ikGmVZ9mjebe45Mn4avYQ22Moy/83yNZvNYSGz31PrnSPsUi
 xWFfPsjF9hA6yFkgghOBvf9xVXJgfvrYkY+SpbCM8uoYWfotDk7zTrgp9Wl9CrUV7zyP4JzHsGp
 I6YSQ/NbvKTBV2HGoszohLByA7VbNk/6IFY5SObGWXjm25G2jCF4=
X-Received: by 2002:a05:622a:11d5:b0:51c:7b11:41ae with SMTP id
 d75a77b69052e-5213ed76974mr121068491cf.74.1784545014516; 
 Mon, 20 Jul 2026 03:56:54 -0700 (PDT)
X-Received: by 2002:a05:622a:11d5:b0:51c:7b11:41ae with SMTP id
 d75a77b69052e-5213ed76974mr121068271cf.74.1784545013973; 
 Mon, 20 Jul 2026 03:56:53 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954c0a81f7sm185177445e9.1.2026.07.20.03.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 03:56:50 -0700 (PDT)
Message-ID: <3118a11c-a5b5-4d03-8059-c8c66bd9b89a@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 12:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] hw/riscv/virt: add opt-in RPMI base support
Content-Language: en-US
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20260714075659.2258023-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260714075659.2258023-5-subrahmanya.lingappa@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260714075659.2258023-5-subrahmanya.lingappa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMSBTYWx0ZWRfX4kQoL00XpvZc
 SKV+zYzlg/9llQHF15Z+CfL/u7qI+B0I2ZRYBcDBkNbiPVJ+++f9vM/mVIar2NfvDRe4ZbkLd23
 0jmcEWs07qayCch0STPL/qTbBOSbz4w=
X-Proofpoint-GUID: mNaHdxukMBKco2_UXoWdHMSmV5AvB-jW
X-Proofpoint-ORIG-GUID: mNaHdxukMBKco2_UXoWdHMSmV5AvB-jW
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5dfef7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UxDOYudmPUsJcct1o5oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMSBTYWx0ZWRfX/auNH8pYXkys
 iri+Y7fcadn1FHYr9zFONStz5Fi0Gpx5fhh+FHAMAZ7CkLgumPld1UTFETjQlVNZMD4VSt8MRqg
 tTLjls478ykEnNBoNf7JAXpkJhktvn0v/ahkzJ8iVBGYy9K5nB86qE9pLm64ZPFW4iB3+49cCkt
 M6NACXT5fBMLG6gVkZIEWL/gSlrUIwyr9JJglSrt/Mk9sfSwRA05RLEhT5xyQ4Q/4geUiMqxuGN
 Ch97+TKTWzbhMPvsm8LZhGQlM1p2kJzJU6A1vTkuxxueSl8q7vWB71ge5Zf5PB6/JuS2GniVk5J
 hCRrtdMIQXplKEmJrlAhE0vjwD+laxQCOgmhcKJvhqlk353DrFQvd7oTl1G1f9KuRfXhRRCVMdB
 aheqSOfvmFF8bPjsDG1pKIXY/dczdFjTS1uoTfPDZvSHQNdPFShDnLXoiFj8p0KKGxkzF25iTj7
 wvFvWyxUTC3EjieDkIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200121
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 14/7/26 09:56, Subrahmanya Lingappa wrote:
> Add the virt machine rpmi=on/off option and wire the initial RPMI Base
> transport into machine realization.
> 
> The option remains disabled by default and requires TCG plus librpmi.
> Invalid accelerator/build combinations fail during machine
> initialization. When enabled, virt allocates the RPMI shared-memory
> transport, creates the RPMI device, configures Base service metadata,
> and emits the corresponding device-tree nodes for firmware discovery.
> 
> Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> ---
>   hw/riscv/Kconfig             |  1 +
>   hw/riscv/virt.c              | 96 ++++++++++++++++++++++++++++++++++++
>   include/hw/misc/riscv_rpmi.h | 10 ++++
>   include/hw/riscv/virt.h      |  3 ++
>   4 files changed, 110 insertions(+)


> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 33775a61fd..e52ccfae1f 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c


> @@ -1410,6 +1452,18 @@ static void virt_machine_init(MachineState *machine)
>           exit(1);
>       }
>   
> +
> +    if (s->have_rpmi) {
> +#ifndef CONFIG_LIBRPMI
> +        error_report("RISC-V RPMI support is not compiled in");
> +        exit(1);
> +#else
> +        if (kvm_enabled()) {
> +            error_report("RISC-V RPMI support is not available with KVM");
> +            exit(1);
> +        }
> +#endif
> +    }


> diff --git a/include/hw/misc/riscv_rpmi.h b/include/hw/misc/riscv_rpmi.h
> index cb2658e57e..b5d8a32f9b 100644
> --- a/include/hw/misc/riscv_rpmi.h
> +++ b/include/hw/misc/riscv_rpmi.h
> @@ -85,6 +85,16 @@ struct RiscvRpmiState {
>       bool has_shmem;
>   };
>   
> +#ifdef CONFIG_LIBRPMI
>   DeviceState *riscv_rpmi_create(const RiscvRpmiConfig *cfg, Error **errp);
> +#else
> +static inline DeviceState *riscv_rpmi_create(const RiscvRpmiConfig *cfg,
> +                                             Error **errp)
> +{
> +    (void)cfg;
> +    (void)errp;
> +    return NULL;
> +}
> +#endif

Could we use a stub file instead?

