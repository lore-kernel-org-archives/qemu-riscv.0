Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1202C5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 17:17:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzHFN-0006Ra-Sx; Wed, 26 Aug 2026 13:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzHFH-0006OO-B5
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 13:17:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzHFF-0008K8-2d
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 13:17:03 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QGucaS901431
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 17:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Tcgd9/KQi8HXXCH2Boxe4SOW3xZn848yrkNm1heB+ww=; b=LAavTr0KoGtoLUUa
 yfzvN7MZu0Kx88aJQiuYMV5s8cQBpjvp3Qq7Dan9USQ1r+vbVf3wYmLUiGfPJ35o
 JmbtTFR35GoVsY0jL5cBCT/ZmYn0jAHkYRMS1qqDISvb6qD7usgdtQ3WSOooKszy
 2Ciwo3Ll5gbDGPwGCh3f6zU8L/BZcV9ZBAyWs0pZwbu5ttjLID3mLvkkAAKYbMrN
 o6YtQntqeqknrvidCG+IkoLjHi0rq2OCP3IoVp/AWQ5gspudkRXVD+QMhNmXXTkf
 NdcZ6jBIF0tQdrAhogkWJ7ryfaKECARRlvkX+7x1c9GG5BFWaqLVNJZrLqZoO7nC
 d9qZDw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03u16x5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 17:16:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-90c8da50f8dso22019466d6.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787764618; x=1788369418; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Tcgd9/KQi8HXXCH2Boxe4SOW3xZn848yrkNm1heB+ww=;
 b=CC8YvnWkb5Q4qNYGDWKfQKTxP7LxRm3jItxzPKJe5YEeOAlp4OLo029aX4uM/Bdt00
 moOYQu9WYQjvSZyO11LsBSdvhwjnrEeVi9v51J+YmFeoERrMxuQAGh0Y/VxiKJc7Zb2z
 3w0Jn6g4omx57HQZ8R6ZKO6eAisTOvEpF/Czg5oqKgC8WlzLN+do2i/BhPNuqrpOCuYh
 566JJnQILKFXHYhDRSS1FjEqAOU3EA8ElayUkp7n8TZTcqzO7yhlRLFx1QXijj9f9kfl
 DbhA6cYYtz5myK4D3R3jzjtVPB2p5jV2p6xr2JeNc+tjaDFgV05UbuIYWdOW1nWGPpcM
 dSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787764618; x=1788369418;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Tcgd9/KQi8HXXCH2Boxe4SOW3xZn848yrkNm1heB+ww=;
 b=DZbF/IrljgVsM0/3IITmqsOtBC1WyD35LRi8zX6hhp1uzy05mhA/MpMaHV7mk3/fPs
 JMisD2oQ7vtVb8G7qQZ+q0+ZLhc9noFPeX6JBQYA8pBoBrefJuj3F1A3sHslADHncwY3
 im6hDY5NthFNkGxphJzN2t1FaVeudjxB40WWfZTC6mt3Jv4jS3/jqdJ1Gz0yioAyHaPR
 f5lWJ+bwEg0qDrsPtVfQOE6PjK6kwPHgXWypZ6/D7WeK82DwuQ0FhEMrNQ8wQrZEzQrl
 LkevmO2k2vzH+JLxA5ahy33Gsamcp3sLso6W6XctXVh2E5jROMXQZ5lWxMNVgjGT7SwN
 3+Jg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqXILM1aE8A+nLRY3o0q61zduqUMrNx1Loz5fyCofqTwXftjDchhs+8LbODfQciRa2isDpeEteEa73O@nongnu.org
X-Gm-Message-State: AFuF++nkrc/V3jebE/aRNCqVX45y0yxv0MIrG8TzNkhIlaLf4P9KKaOp
 RaHz9L7bkD+6Ock4bXfpQiTsGn0ns2aKdybmXagd9VDnZIKmv3j7GzLWPkpBH7Tnpyhd2zS+ChC
 Yi2coRfWMXxvqgJ5bbouX1zZzqGIivBm87Is6Nz/ecYEeaeu6XvYd7Ob7vA==
X-Gm-Gg: AR+sD12+efJZxnrul7/OQxlmOkbt8eNumUAmkUPRk4aCPyOZ5vFsqWDIzc0Gknubmap
 nUaNX8BOeEMrHKb2LAsZYHAiEUefnSv4xToGJ10Nj0vGFxFPAGGOSSf6x5PMRNslo5PUVptLVlk
 avRE11NOOFe2QUCWMRnkpV99poHmWxYlEI17BmYUoA7UA7rV/edYDjsmR8Q8XNsEpXFdKi7UjrL
 re9Q4VADLl6MWnE9ZZ+HJpggsAepPgdcSlPbwG/QYGFPcTJYKR6UEP+S7d3mPCDdVVx8+0pkTof
 OsHUvJVNkUBS+YYh2f1Bn6De+lq4XzAiRQs0NaCJfN9myQdxBIyovhqvtuIMWhxB3UTXxvZxWAX
 w4NTDj0pjpPKu+oKJCoCf8ZQQxMjUbfMSuLyYUwnXCvQ=
X-Received: by 2002:a05:622a:58cb:b0:51b:60f1:689a with SMTP id
 d75a77b69052e-52e422db063mr99383601cf.7.1787764617676; 
 Wed, 26 Aug 2026 10:16:57 -0700 (PDT)
X-Received: by 2002:a05:622a:58cb:b0:51b:60f1:689a with SMTP id
 d75a77b69052e-52e422db063mr99382561cf.7.1787764617087; 
 Wed, 26 Aug 2026 10:16:57 -0700 (PDT)
Received: from [10.254.188.74] (134.171.88.92.rev.sfr.net. [92.88.171.134])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9e96bdsm436939866b.55.2026.08.26.10.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 10:16:56 -0700 (PDT)
Message-ID: <524dfcb8-155d-4a29-a759-41e3891183f0@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:16:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] hw/riscv/device-common, virt.c: add
 gpex_pcie_init()
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
 <20260826164814.44335-13-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826164814.44335-13-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NCBTYWx0ZWRfX8owqDxrSIK15
 OIvd3Xm2TjLIOWjgDOm4G5/9j3F8vQWdw2NWDMibezFh5kPXuyNIZo4q0F1mRUjM5w3neI6fctY
 EnXim8JsA6pYzRq33HrUDRuHf2tqDdNv2/mbP2sC5MM3F3eKwJi01SZDYc/H4SF3qajwv6UUzg8
 IhFq4UQl78wF2527EwtXerCDfR1B/93HJQcq7XxZ1NHvhVZMQVdFsrPneRFSuiY/BKkheB2JISp
 yOhWzApnCbz12HOrSOGqcNcE2jGF4rcYBsgrqEpD721YUujFc5PHtJL+CWZjJvKgOR8lffWOncV
 s+l0DE2/LziD5MudBkDrBR22Ou9hc/6FGmpway5AxoBlIyGSDl9+VOE6SX0bRJCx3R/bL+klTh+
 9kPcgXCmkw0Vxt9DiEiM2Po/R6VM8gA6yTSfcsyOWHzzNZu38dEb8O7YNi+sXzFIOGnN02pQsdi
 03qVK/VmN26ba8CXMAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NCBTYWx0ZWRfX2ceMjOtOI5b3
 0DNei8ae/tPJvJ7N2YHJnkDW8Pn8L6XiiABs1hC01zod7T/TiQRGYNJDEj1jJqrhbtrwueeYFxH
 zZRFyVtOXGWuFPCSisG5aBEsYKtudTY=
X-Proofpoint-ORIG-GUID: PRIFgaHBpo1mXxO454HtUuWtyKRmVNUK
X-Authority-Analysis: v=2.4 cv=RcqgzVtv c=1 sm=1 tr=0 ts=6a8f1f8a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=o1isufRNksZXpKP+aqnsag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Md5pTmsaoyhSHvOzhqMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: PRIFgaHBpo1mXxO454HtUuWtyKRmVNUK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260144
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

On 26/8/26 18:48, Daniel Henrique Barboza wrote:
> The GPEX_HOST initialization in 'virt' can be moved to device-common.c
> and be re-used later for other boards, namely the future
> 'riscv-server-ref' emulation.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   hw/riscv/device-common.c         | 76 +++++++++++++++++++++++++++++++
>   hw/riscv/virt.c                  | 77 ++------------------------------
>   include/hw/riscv/device-common.h |  7 +++
>   3 files changed, 87 insertions(+), 73 deletions(-)


> diff --git a/include/hw/riscv/device-common.h b/include/hw/riscv/device-common.h
> index 1cdb8ab5cc..77760e082c 100644
> --- a/include/hw/riscv/device-common.h
> +++ b/include/hw/riscv/device-common.h
> @@ -22,4 +22,11 @@ PFlashCFI01 *riscv_flash_create(Object *parent, const char *name,
>                                   int flash_sector_size);
>   void riscv_init_flash_map(PFlashCFI01 *flash, hwaddr base, hwaddr size,
>                             MemoryRegion *sysmem, int flash_sector_size);
> +DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,

'riscv_' prefix please.

> +                            DeviceState *irqchip,
> +                            const MemMapEntry *pcie_ecam_mem,
> +                            const MemMapEntry *pcie_mmio_mem,
> +                            const MemMapEntry *high_pcie_mmio_mem,
> +                            const MemMapEntry *pcie_pio_mem,
> +                            int pcie_irq);
>   #endif


