Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418FBC44536
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 20:09:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wmdFS-0001qM-L8; Wed, 22 Jul 2026 16:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wmdFQ-0001pR-Ep
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2026 16:08:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wmdFO-00024B-LS
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2026 16:08:56 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66MHrBBo1650294
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2026 20:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v3ezydXYj9GGlHb8jCl9yBGu3CqqujQa1077tE/OmLc=; b=kWtpfJ72ADikA/kV
 tchgtAfkFYmXy3oa4Y5VoavZXRiibWR4b7IG9XJTzfmCbHUn1K4FPYNktGWFjC+S
 /z/8Y8X35LAGeVZCAsONdhSkzqqhleVkUHvkFnDcyTj2s5DX5YO2n9QganuFCS4Q
 Ek+coTKYgUcyo3UiytwM1pCD7AUJYtTxCIy09WuTrnAog+Yux7w7zJUwvMAJBMNX
 5mUyxFBAZN0eY9fE+36irBgcjzOtXkQVedh5G4igf4LedYUDoAC6RaJlqRkaXhf0
 p6QjE/IqFycbAlV35tQn8j14c6S1DRrPcLByrBJk6wNmnxk1Hsd3f8B7BA63W0us
 tjptsg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdktkw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2026 20:08:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8efe7db1c42so240343086d6.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2026 13:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784750933; x=1785355733; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=v3ezydXYj9GGlHb8jCl9yBGu3CqqujQa1077tE/OmLc=;
 b=VMz+evIKq3thqZn9obLsQh+gUXaU4yugxXtks0zREUSKpKs/CjQUysAg3UMI7DaPFB
 7ORomR3vzBw1onqITHX9gguv9ni4Im5UiNnzmoiB9wW05BZebE2RFX8lyFk0CI5VLWcg
 v4YpmiHEE11mW6jQF1j6sb/wD1MOoom+UrXA3PmuqDt/k7t1Nyc0Nuk59EPA9jCMouJ9
 UsJ2+dwMwfsjutmDtMlcOTm6oBtutKhL6GMn3M2Q5wCoPGgbvSDpxzYGwUm2yHhnFlwp
 B3ZyMNUPdKYCHzdmP6FeNzmoQBxf7ZnyzF10bpNvr78dzfzlSGh0oU9OeXJq8s4iUoNW
 +JBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784750933; x=1785355733;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v3ezydXYj9GGlHb8jCl9yBGu3CqqujQa1077tE/OmLc=;
 b=L1eT8qyOoZv/c1p8k+BQg/gCyW8qWm3graz0mo0wKJx2HmbkaFtuNifI98NsT7KCO8
 jOG8YUejrL2QPh/xh8EeBLyrRedZ1srSS2vwiArrMOJfo/NvXJZb6FaXJsu5+mPKg8i/
 q9+1NxqJeoQefAf8KiR3gBXBfpb1ffEs3nwsmgtzPlb91fbWyaRBZ76LclZqcyDovha/
 hvBU6eFbVJIpeNAD4x6dkl+82L0S4iXmAbWuUC6vETWKRbAjBvcS69rJXuHiu4XV0HG9
 vi7+2Mo/zujDEuSiokBV3/5GybbQ2ruRQhDPSiSXgRLy05H4oh2U9j4OXSxNqnDCL6FX
 fstA==
X-Gm-Message-State: AOJu0YzDcXHyAcFolStuSkMEKxpOVd4hAccLA6oiRKXwrYpygBP8/NQ8
 Mr1r67XwrfR/FJnTkWG0n5hjYJ+441+yz+6AcESKHVwqtf/VSta8bmDHDEWh8DqkvSXXeuqUCpZ
 G6jtQxC7UR9i5EQxPY7k1jhotQVKFaNevBdMfNmeLTNWCFTZ1wz818kxpiZzf1OUCWQ==
X-Gm-Gg: AR+sD12y7fqZvPzKRylD6PL/6xsoz2aZS0QVxalB4/c9yyisP9Y5rskPZgmEr1794Uf
 th1yWxon2k1OKtHU33LDPX03pvDkXENyEGdAHFb7ZsQWQbnIALq9WXQmoccAynexU2XIeEhhIKC
 pgC+uKsuHmL9u+kmt1TeXDPIyhH9eK03I1paybu8ICYNXGMenDq+uDjAyGEiAa4rSOHQSXHjkvR
 y4cdIpSLlSzv/o6R/ruRi4eCveTkysg2JjR6YJHtKQyukCgtAWs0l1XP36dVxHpAKyv75vH/BdF
 x+00RTVkuYHE3Dx0oZPJPFaBSER4/UkfNDQ1r3P+SgOyG+RNJThhkx2BV7L+2ej1n2ob1E4d1Ul
 SyWdkMmWk7cPVlNYsI2f3+TxBKhxCVbN+7D7+Bw==
X-Received: by 2002:a05:6214:469d:b0:8df:1814:3a1d with SMTP id
 6a1803df08f44-907ca5734b8mr4345786d6.22.1784750932481; 
 Wed, 22 Jul 2026 13:08:52 -0700 (PDT)
X-Received: by 2002:a05:6214:469d:b0:8df:1814:3a1d with SMTP id
 6a1803df08f44-907ca5734b8mr4345216d6.22.1784750931821; 
 Wed, 22 Jul 2026 13:08:51 -0700 (PDT)
Received: from [192.168.68.107] ([152.234.122.204])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-907ba8b5f6esm28481326d6.5.2026.07.22.13.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2026 13:08:51 -0700 (PDT)
Message-ID: <4288473d-e741-449b-bfab-573db154ae7e@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 17:08:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hw/riscv: Connect K230 DDR controller and PHY models
To: Junze Cao <caojunze424@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, farosas@suse.de, lvivier@redhat.com,
 pbonzini@redhat.com
References: <20260716132423.931427-1-caojunze424@gmail.com>
 <20260716132423.931427-3-caojunze424@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260716132423.931427-3-caojunze424@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE5OCBTYWx0ZWRfX8lI6hzTN6OPi
 0fgFbyD91B7znEtpqgLa3HYw9NIdMNUXdBXczwLZ/YepY9IbhV6kaHiX5541zIs2G074vnBEHsT
 +/WWYdUTc2I2ZEElVps07V9TXmsbRixAJWEUQntCwTqkprfuF+KTmE7I+pc6svEQT6G3SJHUhsI
 FM5NPQNNaLPn/QQVlx3c0qnV7/RLc76rboK1HdJezNSG/RRcMBLU6ZT3kDSiSTXlATv2pMbsJK1
 VK7RgKEQ3ZO4gjqeABe1iJzQGs2+ELkOiY9cBXEUNPvPAnNc5UaJvHGuUijEcv23isN230FRe68
 pPTnygXOjjYAgd5JuW3sDNpBFPnZWmNaha/bwjrouRlA2ni90qpd79EMXB+8MW5XsEG2GhAI6uR
 cj+Hs1kfhzkjLhNxda9mLJLtuOfFELnkfIYZ4v4VYy7nA2FQt8kbR4jluzopPhnfrI8/j4IxDIS
 5E+BN/A7JRSgr/l9ydw==
X-Proofpoint-GUID: TQbvtdN-1phu-qoX__GEyNpH4kNfmuZv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE5OCBTYWx0ZWRfX3TcouOoNeDwQ
 mpiewk1iylnWcIMQnVY8PluD4vRqYcz06WBCfDwj1FZfH/LMyD0deKNLY/HDUto8/Mx/ekL8ld7
 82n/PoYXGXx8jVGHJ0Pcamv+FZptFNo=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a612355 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=J0RmenBMOwS19r/fhzI3tQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wxDdFtoxzKiW3rREV3YA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: TQbvtdN-1phu-qoX__GEyNpH4kNfmuZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220198
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 7/16/2026 10:24 AM, Junze Cao wrote:
> Replace the unimplemented K230 DDR configuration region with the DDRC
> model and map the PHY model at 0x9a000000.
> 
> Connect the controller to the PHY so DFI status reflects PHY training and
> initialization state.
> 
> Signed-off-by: Junze Cao <caojunze424@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   docs/system/riscv/k230.rst |  4 ++++
>   hw/riscv/k230.c            | 19 ++++++++++++++++---
>   include/hw/riscv/k230.h    |  4 ++++
>   3 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/system/riscv/k230.rst b/docs/system/riscv/k230.rst
> index cea8202e55..06a819fbdb 100644
> --- a/docs/system/riscv/k230.rst
> +++ b/docs/system/riscv/k230.rst
> @@ -20,12 +20,16 @@ The ``k230`` machine supports the following devices:
>   * Platform-Level Interrupt Controller (PLIC)
>   * 2 K230 Watchdog Timer
>   * 5 UART
> +* K230 DDRC CFG and DDR PHY
>   
>   Boot options
>   ------------
>   The ``k230`` machine supports K230 SDK boot through M-mode U-Boot, which then
>   starts OpenSBI/Linux with ``bootm``. It also supports direct Linux boot.
>   
> +The DDRC CFG and DDR PHY models allow the K230 SDK U-Boot SPL to complete DDR
> +initialization before loading the next boot stage.
> +
>   K230 SDK Linux kernels use T-HEAD C9xx private MAEE page table attributes. QEMU
>   does not implement MAEE in the generic RISC-V MMU, so such kernels need to be
>   built with standard RISC-V PTE bits before they can boot under QEMU.
> diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
> index 656f28190c..627150b463 100644
> --- a/hw/riscv/k230.c
> +++ b/hw/riscv/k230.c
> @@ -97,6 +97,7 @@ static const MemMapEntry memmap[] = {
>       [K230_DEV_SPI] =          { 0x91584000,  0x00001000 },
>       [K230_DEV_HI_SYS_CFG] =   { 0x91585000,  0x00000400 },
>       [K230_DEV_DDRC_CFG] =     { 0x98000000,  0x02000000 },
> +    [K230_DEV_DDR_PHY] =      { 0x9A000000,  0x00400000 },
>       [K230_DEV_FLASH] =        { 0xC0000000,  0x08000000 },
>       [K230_DEV_PLIC] =         { 0xF00000000, 0x00400000 },
>       [K230_DEV_CLINT] =        { 0xF04000000, 0x00400000 },
> @@ -108,6 +109,11 @@ static void k230_soc_init(Object *obj)
>       RISCVHartArrayState *cpu0 = &s->c908_cpu;
>   
>       object_initialize_child(obj, "c908-cpu", cpu0, TYPE_RISCV_HART_ARRAY);
> +    object_initialize_child(obj, "ddr-cfg", &s->ddr_cfg,
> +                            TYPE_K230_DDR_CFG);
> +    object_initialize_child(obj, "ddr-phy", &s->ddr_phy,
> +                            TYPE_K230_DDR_PHY);
> +    s->ddr_cfg.phy = &s->ddr_phy;
>       object_initialize_child(obj, "k230-wdt0", &s->wdt[0], TYPE_K230_WDT);
>       object_initialize_child(obj, "k230-wdt1", &s->wdt[1], TYPE_K230_WDT);
>   
> @@ -158,6 +164,16 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
>       int c908_cpus;
>   
>       sysbus_realize(SYS_BUS_DEVICE(&s->c908_cpu), &error_fatal);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ddr_cfg), errp)) {
> +        return;
> +    }
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ddr_phy), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ddr_cfg), 0,
> +                    memmap[K230_DEV_DDRC_CFG].base);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ddr_phy), 0,
> +                    memmap[K230_DEV_DDR_PHY].base);
>   
>       c908_cpus = s->c908_cpu.num_harts;
>   
> @@ -361,9 +377,6 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
>       create_unimplemented_device("hi_sys_cfg", memmap[K230_DEV_HI_SYS_CFG].base,
>                                   memmap[K230_DEV_HI_SYS_CFG].size);
>   
> -    create_unimplemented_device("ddrc_cfg", memmap[K230_DEV_DDRC_CFG].base,
> -                                memmap[K230_DEV_DDRC_CFG].size);
> -
>       create_unimplemented_device("flash", memmap[K230_DEV_FLASH].base,
>                                   memmap[K230_DEV_FLASH].size);
>   }
> diff --git a/include/hw/riscv/k230.h b/include/hw/riscv/k230.h
> index 592e1c26bf..80ca16338c 100644
> --- a/include/hw/riscv/k230.h
> +++ b/include/hw/riscv/k230.h
> @@ -16,6 +16,7 @@
>   #define HW_K230_H
>   
>   #include "hw/core/boards.h"
> +#include "hw/misc/k230_ddr.h"
>   #include "hw/riscv/riscv_hart.h"
>   #include "hw/watchdog/k230_wdt.h"
>   
> @@ -32,6 +33,8 @@ typedef struct K230SoCState {
>       /*< public >*/
>       RISCVHartArrayState c908_cpu; /* Small core */
>   
> +    K230DDRCfgState ddr_cfg;
> +    K230DDRPhyState ddr_phy;
>       K230WdtState wdt[2];
>       MemoryRegion sram;
>       MemoryRegion bootrom;
> @@ -112,6 +115,7 @@ enum {
>       K230_DEV_SPI,
>       K230_DEV_HI_SYS_CFG,
>       K230_DEV_DDRC_CFG,
> +    K230_DEV_DDR_PHY,
>       K230_DEV_FLASH,
>       K230_DEV_PLIC,
>       K230_DEV_CLINT,


