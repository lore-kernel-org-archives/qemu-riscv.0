Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7FDC07545
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:43:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvg1m-0003GV-8j; Wed, 25 Oct 2023 11:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvg1j-0003D5-QJ
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:42:35 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvg1g-0000X9-8w
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:42:35 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c9fa869a63so39165515ad.0
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 08:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698248551; x=1698853351; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pHBwe3N98CTxQYgA0OpqzFBkPW8+uhBzLc9xXUB5YP4=;
 b=le++0LCqqrMepzSApm/zfAQQfbv7NL/UOBcNEXUuGEVvBd3Ob9VU2hILzsVInf5lpb
 xhFZSgHBsPj3YX0Dp3XwouNLuvXoken3wqavKFMkoZM/+1datZs1V+HrUAy3utuaz5rC
 fOy1QKogEy8J011J8bpE5pcX+y1guv8ErfJQDpFulqdG9Sydmnui7JYxHbi3sh0NqeKy
 o6goJO5XLAhr2WT0MUHvTLH1bHw0rtzQL9SZoa6bXrgyw8gMqvG4bNId0NO5oSkSOvlG
 ck1/LITGjBypn6e5CJucgAz1H9S+TRXx032+hdO3DafSjEA2vxT2boc2tiLFuc750e0n
 IiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698248551; x=1698853351;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pHBwe3N98CTxQYgA0OpqzFBkPW8+uhBzLc9xXUB5YP4=;
 b=AgO1PPCZ6rE7RKzO74xf2UYNK2Pvp12lH9MJp1/xwirS3avfWwdiTetywYA5MR/AuS
 nNlCNahZik565uQvroFNoRUqYi0Jp+ekmGMK9UKnK4h/3hF4EzlNDxyTksZGSEoSuYbn
 uKtPNzTfLtdMnzrgFxEARDHjHV3361N/vAHgiJM2JpS1rAiXcQFMLheKwLVlwX0TP9fV
 5IGbihiQYFjz7twk23nNQJCW+6vTBOCqvTKjMWCTFGOi0fJ/hkOui8EonFXBGkX2TH97
 2Wa5V/xu7rOJc0871ths7BLU9Bkd/0JvFo13lrS61/kS4kyjIWYkC7T9IjsMoJWwhYgl
 aG0A==
X-Gm-Message-State: AOJu0YwfX2KgBLfPP5CDy83POeAYQcBmyiR7XYpoDaP2cSxUQ1NyNcae
 5F82b95z+29twoXR2usbuXWHcw==
X-Google-Smtp-Source: AGHT+IHJv4yxw/7RDDq5T6r69uf5jnSvBXyabkpSOPUwReisWw3qMAHCPGLn0urLortt90MAwLpouA==
X-Received: by 2002:a17:902:d904:b0:1c9:e68a:1b58 with SMTP id
 c4-20020a170902d90400b001c9e68a1b58mr10283255plz.54.1698248550870; 
 Wed, 25 Oct 2023 08:42:30 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.2.33])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a170902da8600b001bf6ea340a9sm9386306plx.159.2023.10.25.08.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 08:42:30 -0700 (PDT)
Message-ID: <c18da34b-56ae-4c9c-86a8-379e7b0fc759@ventanamicro.com>
Date: Wed, 25 Oct 2023 12:42:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 38/45] hw/riscv: use qemu_configure_nic_device()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao
 <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20231022155200.436340-1-dwmw2@infradead.org>
 <20231022155200.436340-39-dwmw2@infradead.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231022155200.436340-39-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 10/22/23 12:51, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/riscv/microchip_pfsoc.c | 13 ++-----------
>   hw/riscv/sifive_u.c        |  7 +------
>   2 files changed, 3 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index b775aa8946..8e0e3aa20c 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -411,17 +411,8 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>           memmap[MICROCHIP_PFSOC_USB].size);
>   
>       /* GEMs */

I believe you forgot to remove the 'nd' variable. Building with this patch (applying
patches 1 to 4 first) fails with:


../hw/riscv/microchip_pfsoc.c: In function ‘microchip_pfsoc_soc_realize’:
../hw/riscv/microchip_pfsoc.c:205:14: error: unused variable ‘nd’ [-Werror=unused-variable]
   205 |     NICInfo *nd;
       |              ^~
cc1: all warnings being treated as errors


Patch looks good otherwise. Thanks,

Daniel

> -
> -    nd = &nd_table[0];
> -    if (nd->used) {
> -        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
> -        qdev_set_nic_properties(DEVICE(&s->gem0), nd);
> -    }
> -    nd = &nd_table[1];
> -    if (nd->used) {
> -        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
> -        qdev_set_nic_properties(DEVICE(&s->gem1), nd);
> -    }
> +    qemu_configure_nic_device(DEVICE(&s->gem0), true, NULL);
> +    qemu_configure_nic_device(DEVICE(&s->gem1), true, NULL);
>   
>       object_property_set_int(OBJECT(&s->gem0), "revision", GEM_REVISION, errp);
>       object_property_set_int(OBJECT(&s->gem0), "phy-addr", 8, errp);
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ec76dce6c9..5207ec1fa5 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -789,7 +789,6 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>       MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
>       char *plic_hart_config;
>       int i, j;
> -    NICInfo *nd = &nd_table[0];
>   
>       qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
>       qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
> @@ -893,11 +892,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>       }
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_DEV_OTP].base);
>   
> -    /* FIXME use qdev NIC properties instead of nd_table[] */
> -    if (nd->used) {
> -        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
> -        qdev_set_nic_properties(DEVICE(&s->gem), nd);
> -    }
> +    qemu_configure_nic_device(DEVICE(&s->gem), true, NULL);
>       object_property_set_int(OBJECT(&s->gem), "revision", GEM_REVISION,
>                               &error_abort);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gem), errp)) {

