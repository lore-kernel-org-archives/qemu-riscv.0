Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osuLL-0000tF-FF
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 18:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osuLK-0000p8-6M
 for qemu-riscv@nongnu.org; Wed, 09 Nov 2022 18:18:50 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osuLI-0007hi-1C
 for qemu-riscv@nongnu.org; Wed, 09 Nov 2022 18:18:49 -0500
Received: by mail-wr1-x42c.google.com with SMTP id cl5so28074917wrb.9
 for <qemu-riscv@nongnu.org>; Wed, 09 Nov 2022 15:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Z0VD6BlSiTBx28CLGg60j5M+TbeL+/X3PnEJb0NTk4=;
 b=btHRxyGmp+t/ReM7JjDa4dGDl+ZfeJDj2H66BI/PRuXxXQ7OiOepYwicz4OluNllhw
 qnYHR+EPgn4QF+OY7KLp8Yswh1lvqBlhObEazBkMdF8ozeguBjs9FIFCS1p93yWw1Jyr
 Q1cjWe+Xs+E5kT5QeoeKuqTbie7fRl9yPr2IBN0HIVbjJgLXqMW9Q4/m8MyQql8orP+y
 3HIvK1fADxQR2curbDX3JUH4Xgivv3EL+0TLPac+ZQV1WWGx6f9jSvVhV6dy/TxssaFd
 2GN3RWK6dMgiT4KdGq5YbH0UtexgHfvtoKEMtnGRRmEaJGMPYmh4Vg5yR+tb34igrRoC
 GB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Z0VD6BlSiTBx28CLGg60j5M+TbeL+/X3PnEJb0NTk4=;
 b=sVedTId77BTsrNay/ffNo3BsihM8J9vzSeoDECIYOmk7a/NQYqt5Rle7A54oR/NjRf
 Q09hIXQzF+QRJ3LWnoa3g0EhLHWIKfE32tkFJGmjkYq93N7UgXo9SBFQckZ0KWKKwnZn
 DVAgQBjmf5EBrdBuzUNWQeu7fhiWIirly3d99bLoJQZnmuRQBIkU+b4M9dDZGut7TfqB
 FQo2wd2AyMGQlF2vWI592nFhihchdLmFjk5bSLRfI05J+IDf67Pat2zGLPsai/Jy/TQs
 HqUnMcrmWAf1PL9yjviI5tuyWdVqscghKPM4xaaJlW88HZ6atEmx0vWyEdOA02/nPDLX
 BEyg==
X-Gm-Message-State: ACrzQf2DfwliBZluLVVsUk9B8at9Wi9Tk9QB9jEDY2EyXwJYSi/H5mfR
 /SM4khDF8mn5XN5mNpUdlE0/UQ==
X-Google-Smtp-Source: AMsMyM6qDrvSQyiEpYady8rN1w1onJJxPbzw0/oysxodXA4QO4u87QUW/kHPjegw8FERFYefUob6QA==
X-Received: by 2002:a5d:58f1:0:b0:236:b588:1e07 with SMTP id
 f17-20020a5d58f1000000b00236b5881e07mr39465724wrd.612.1668035926224; 
 Wed, 09 Nov 2022 15:18:46 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 be6-20020a05600c1e8600b003cf78aafdd7sm3077767wmb.39.2022.11.09.15.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 15:18:45 -0800 (PST)
Message-ID: <84b8985a-6fab-ff76-7058-f702203474c0@linaro.org>
Date: Thu, 10 Nov 2022 00:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] hw/misc/pfsoc: add fabric clocks to ioscb
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20221109190849.1556711-1-conor@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109190849.1556711-1-conor@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 09 Nov 2022 23:18:50 -0000

Hi Conor,

On 9/11/22 20:08, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On PolarFire SoC, some peripherals (eg the PCI root port) are clocked by
> "Clock Conditioning Circuitry" in the FPGA. The specific clock depends
> on the FPGA bitstream & can be locked to one particular {D,P}LL - in the
> Icicle Kit Reference Design v2022.09 or later this is/will be the case.
> 
> Linux v6.1+ will have a driver for this peripheral and devicetrees that
> previously relied on "fixed-frequency" clock nodes have been switched
> over to clock-controller nodes. The IOSCB region is represented in QEMU,
> but the specific region of it that the CCCs occupy has not so v6.1-rcN
> kernels fail to boot in QEMU.
> 
> Add the regions as unimplemented so that the status-quo in terms of boot
> is maintained.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> The last line there is a white lie. v6.1-rcN has both v2022.09 and
> v2022.10 reference design changes. This patch only accounts for the
> v2022.09 changes. The FPGA design is a moving target and I am not
> really sure how to handle that in QEMU. For v2022.10 a bunch of stuff
> got changed, including the addresses that DDR lies at which I am not
> sure how to handle yet.
> 
> That puts my todo list of broken things to:
> - MMC (only direct kernel boot works), pre v2022.09 reference issue

How do you start without 'direct kernel boot'?

> - PCI root port address, address changed in v2022.09 but from a cursory
>    check, I didn't see any PCI support in the first place. It's connected
>    to a FIC, so I think it can just be made into an unimplemented region.
> - DDR address changes, 2022.10 issue. Looks like a straightforward
>    change to hw/riscv/pfsoc.c but I don't think it'll be backwards
>    compatible.
> - hwrng breaks boot. Tipping away at this one, hopefully I'll have a fix
>    for it soon. Need to implement the irq side of the mailbox for it.
> 
> I'll send some more patches as I work through them.
> 
>   hw/misc/mchp_pfsoc_ioscb.c         | 6 ++++++
>   include/hw/misc/mchp_pfsoc_ioscb.h | 1 +
>   2 files changed, 7 insertions(+)
> 
> diff --git a/hw/misc/mchp_pfsoc_ioscb.c b/hw/misc/mchp_pfsoc_ioscb.c
> index f4fd55a0e5..f976e42f72 100644
> --- a/hw/misc/mchp_pfsoc_ioscb.c
> +++ b/hw/misc/mchp_pfsoc_ioscb.c
> @@ -33,6 +33,7 @@
>    */
>   #define IOSCB_WHOLE_REG_SIZE        0x10000000
>   #define IOSCB_SUBMOD_REG_SIZE       0x1000
> +#define IOSCB_CCC_REG_SIZE          0x2000000
>   
>   /*
>    * There are many sub-modules in the IOSCB module.
> @@ -45,6 +46,7 @@
>   #define IOSCB_LANE23_BASE           0x06510000
>   #define IOSCB_CTRL_BASE             0x07020000
>   #define IOSCB_CFG_BASE              0x07080000
> +#define IOSCB_CCC_BASE              0x08000000
>   #define IOSCB_PLL_MSS_BASE          0x0E001000
>   #define IOSCB_CFM_MSS_BASE          0x0E002000
>   #define IOSCB_PLL_DDR_BASE          0x0E010000
> @@ -168,6 +170,10 @@ static void mchp_pfsoc_ioscb_realize(DeviceState *dev, Error **errp)
>                             "mchp.pfsoc.ioscb.cfg", IOSCB_SUBMOD_REG_SIZE);
>       memory_region_add_subregion(&s->container, IOSCB_CFG_BASE, &s->cfg);
>   
> +    memory_region_init_io(&s->ccc, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
> +                          "mchp.pfsoc.ioscb.ccc", IOSCB_CCC_REG_SIZE);
> +    memory_region_add_subregion(&s->container, IOSCB_CCC_BASE, &s->ccc);

Unrelated but using the TYPE_UNIMPLEMENTED_DEVICE would ease tracing all
these block accesses, as the block name would appear before the 
address/size. See for example aspeed_mmio_map_unimplemented();

Otherwise LGTM.

Regards,

Phil.

>       memory_region_init_io(&s->pll_mss, OBJECT(s), &mchp_pfsoc_pll_ops, s,
>                             "mchp.pfsoc.ioscb.pll_mss", IOSCB_SUBMOD_REG_SIZE);
>       memory_region_add_subregion(&s->container, IOSCB_PLL_MSS_BASE, &s->pll_mss);
> diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pfsoc_ioscb.h
> index 9235523e33..687b213742 100644
> --- a/include/hw/misc/mchp_pfsoc_ioscb.h
> +++ b/include/hw/misc/mchp_pfsoc_ioscb.h
> @@ -30,6 +30,7 @@ typedef struct MchpPfSoCIoscbState {
>       MemoryRegion lane23;
>       MemoryRegion ctrl;
>       MemoryRegion cfg;
> +    MemoryRegion ccc;
>       MemoryRegion pll_mss;
>       MemoryRegion cfm_mss;
>       MemoryRegion pll_ddr;


