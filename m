Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouinV-0007pA-Ku
	for mharc-qemu-riscv@gnu.org; Mon, 14 Nov 2022 18:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ouihg-0001Aq-0p; Mon, 14 Nov 2022 18:17:25 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ouP0D-0005cr-DD; Sun, 13 Nov 2022 21:15:14 -0500
Received: by mail-vk1-xa35.google.com with SMTP id v81so4317997vkv.5;
 Sun, 13 Nov 2022 18:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wIK4EKBYOnAOkvfsA2K7F8yA53ppsHYH5Nkah3Njc8w=;
 b=BUspBmsKf84eDHO9BXYMtx9+leQNWeCls1ToX7ht+0mLV5JVc0euN1S1iGWqGgYEcJ
 utQB20i1+zR3d42Pp/jbajCYBeLwoYaaMYNWa2Nmd/qJgabOXHdi3I2GrmvmGlz2pG74
 Y3+DacietWUcmreotcABa7wE18i4DT6VMBtckjiY2FyUP0lvjPzq8j4vMvnosX2gAn4Z
 89BJBJENld7CSQxiR8Mi9q8BbbiZETO71ZT5plkc6zhP7qmGeOoiXr++jUtqxsDat5JL
 TZ2C+/u6fWLditxbCMSsIjyNUOZct+wLiIl1HJwPRM83ZLe1WT/ATvS9fVEurJCMXR/T
 2EWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wIK4EKBYOnAOkvfsA2K7F8yA53ppsHYH5Nkah3Njc8w=;
 b=n2xPjqUNrsZ+WYgK+Ugn2s+ZCINAGlzhwXeccdyQ+AmOM30f1jfH5SYFmXljYyuI72
 9U3A1PgRnT1KKOa3MN/aCGYpzDz1atH/mqTe++4wwc9efNDn7WbxyHNahRfWRqro3h/+
 et/OLUjEfYTuARxlIrtsG4EmKXEdYKzS1TgnlWrzeM6XbE+1VFSesWLhOhbS5z4Ctiun
 f2Ttm4Gcgf4bQ0P1VyclzY1Z4IxV1oic52peFIC8A0Zt3BJy9CNbkR79yVTJ9muCzi7J
 NGWxByO4sE+M606nV+cwqU1iRCIiljWiSRKYdw6MBHUlUN4Q9TX1WNAR6HWHSQt6Z6tt
 lQJA==
X-Gm-Message-State: ANoB5plkhTt4CVXR7zmAyi+2hA0WPoTNdUjQUZ/IU51a0tjOFXk31jxw
 OwAobb2RQG50YbtMYgGz57q2J1NFVBqIk9+mK2Q=
X-Google-Smtp-Source: AA0mqf6sNlBOwqP2kQC/DVQWi/p/nnAq34AWQOpoUItOAMNrb701IiBQXWQIF9/MlsUH8GG3Q3syDyIrypYIePcqSw0=
X-Received: by 2002:a05:6122:912:b0:3b5:f865:d6b8 with SMTP id
 j18-20020a056122091200b003b5f865d6b8mr5361303vka.7.1668392112041; Sun, 13 Nov
 2022 18:15:12 -0800 (PST)
MIME-Version: 1.0
References: <20221112133414.262448-1-conor@kernel.org>
 <20221112133414.262448-2-conor@kernel.org>
In-Reply-To: <20221112133414.262448-2-conor@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 14 Nov 2022 12:14:45 +1000
Message-ID: <CAKmqyKOp70SSNAF_bBFvPVgVuFkWJJv_OB81fQX_b_ZJERG45A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/misc/pfsoc: add fabric clocks to ioscb
To: Conor Dooley <conor@kernel.org>
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 14 Nov 2022 23:17:26 -0000

On Sat, Nov 12, 2022 at 11:36 PM Conor Dooley <conor@kernel.org> wrote:
>
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

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/misc/mchp_pfsoc_ioscb.c         | 6 ++++++
>  include/hw/misc/mchp_pfsoc_ioscb.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/hw/misc/mchp_pfsoc_ioscb.c b/hw/misc/mchp_pfsoc_ioscb.c
> index f4fd55a0e5..f976e42f72 100644
> --- a/hw/misc/mchp_pfsoc_ioscb.c
> +++ b/hw/misc/mchp_pfsoc_ioscb.c
> @@ -33,6 +33,7 @@
>   */
>  #define IOSCB_WHOLE_REG_SIZE        0x10000000
>  #define IOSCB_SUBMOD_REG_SIZE       0x1000
> +#define IOSCB_CCC_REG_SIZE          0x2000000
>
>  /*
>   * There are many sub-modules in the IOSCB module.
> @@ -45,6 +46,7 @@
>  #define IOSCB_LANE23_BASE           0x06510000
>  #define IOSCB_CTRL_BASE             0x07020000
>  #define IOSCB_CFG_BASE              0x07080000
> +#define IOSCB_CCC_BASE              0x08000000
>  #define IOSCB_PLL_MSS_BASE          0x0E001000
>  #define IOSCB_CFM_MSS_BASE          0x0E002000
>  #define IOSCB_PLL_DDR_BASE          0x0E010000
> @@ -168,6 +170,10 @@ static void mchp_pfsoc_ioscb_realize(DeviceState *dev, Error **errp)
>                            "mchp.pfsoc.ioscb.cfg", IOSCB_SUBMOD_REG_SIZE);
>      memory_region_add_subregion(&s->container, IOSCB_CFG_BASE, &s->cfg);
>
> +    memory_region_init_io(&s->ccc, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
> +                          "mchp.pfsoc.ioscb.ccc", IOSCB_CCC_REG_SIZE);
> +    memory_region_add_subregion(&s->container, IOSCB_CCC_BASE, &s->ccc);
> +
>      memory_region_init_io(&s->pll_mss, OBJECT(s), &mchp_pfsoc_pll_ops, s,
>                            "mchp.pfsoc.ioscb.pll_mss", IOSCB_SUBMOD_REG_SIZE);
>      memory_region_add_subregion(&s->container, IOSCB_PLL_MSS_BASE, &s->pll_mss);
> diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pfsoc_ioscb.h
> index 9235523e33..687b213742 100644
> --- a/include/hw/misc/mchp_pfsoc_ioscb.h
> +++ b/include/hw/misc/mchp_pfsoc_ioscb.h
> @@ -30,6 +30,7 @@ typedef struct MchpPfSoCIoscbState {
>      MemoryRegion lane23;
>      MemoryRegion ctrl;
>      MemoryRegion cfg;
> +    MemoryRegion ccc;
>      MemoryRegion pll_mss;
>      MemoryRegion cfm_mss;
>      MemoryRegion pll_ddr;
> --
> 2.37.2
>
>

