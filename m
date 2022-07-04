Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8CAF-0007EZ-6d
	for mharc-qemu-riscv@gnu.org; Sun, 03 Jul 2022 22:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o8CAE-0007EP-J7
 for qemu-riscv@nongnu.org; Sun, 03 Jul 2022 22:50:18 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:42785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o8CAB-0006jj-Uz
 for qemu-riscv@nongnu.org; Sun, 03 Jul 2022 22:50:18 -0400
Received: by mail-lf1-x129.google.com with SMTP id y16so13479814lfb.9
 for <qemu-riscv@nongnu.org>; Sun, 03 Jul 2022 19:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cApzcqFSJGGr159Dn/wuU/Q6cCNx66DVHb7zVnm3mkc=;
 b=HstQickokC+hA8FgySGkQLY1IGgaBJ9Y+8D13cEHrORGYAhjmSKmXaOZaeuhGR6DDd
 U8dbOhb73ISsAunLr8uUvpVfOLqXeh3k3jb6kjiBxkxlaUWKV58nwo01epJi7dlGSz2N
 Jrds3i56/Nq5ZLdv5Z84zUvlPSkjBaem8BFg93YSJJRpVpBX1zvAPgZUOLthi+Vrv5mR
 jOt3Lb+DH0O7sBrvY0HWrQRNeOfevB2V0+rKN5g8JFa0Sf8SLDs1bmLgtVLNpVa5dWuW
 CLYkyXftauqGkX4k49ORY8vRQ+BNMGUAy0Q37RrHuUcYVt3j982PzuzwYH5wrdvU/6xd
 CEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cApzcqFSJGGr159Dn/wuU/Q6cCNx66DVHb7zVnm3mkc=;
 b=D+mHOBvp0400J+7qqWkU7YA3WF88oRVDpy1ViKR35epp9vg7fbRQEhGFjgeJt1SDyQ
 Ky2B9nu9WLdXjUAZLcqSERjaAwyiYDahJPAAfjypnWc+TdRqFNN2k2dXHuEXnMKnMWIu
 QyldolBRvaoePPCMNd/R9Jl9do+K+3pXtERKtV1iz92xpc2wiQG3pRnOePKQgCNlMX4A
 hXAjOXXANwaogrEbdcqofob+JvYY3Vnrd811KDQ+CBmt2keneIAf/XGpIweMf0rwofgi
 g2CsS+AvpgnB+EKyXE/p9HcUQghKvugwOnT/P7qkj2kwanFDoqRCpgtx4ZDNXCjSg2Yc
 uY8g==
X-Gm-Message-State: AJIora/7G25g/H0FwcxMYNfX/AL1jjLRQh1rpZJe1vJKfIQTxNQMZFtc
 MhyG8auh2LiS+BG67K2ByYZMHLeM5a420GZ1dWFzVg==
X-Google-Smtp-Source: AGRyM1tpgmtMM9w6THrPCFKjvSOkrSL0x3kTikBD160yKkEVsrehYx/Jo30fdR9FOozZDhY97/kBB0h8DDJarU72irM=
X-Received: by 2002:a05:6512:3b22:b0:47f:6756:143 with SMTP id
 f34-20020a0565123b2200b0047f67560143mr16954227lfv.419.1656903013611; Sun, 03
 Jul 2022 19:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-4-shorne@gmail.com>
In-Reply-To: <20220703212823.10067-4-shorne@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 4 Jul 2022 08:20:02 +0530
Message-ID: <CAK9=C2WxQkPqbVvy+9saLSzVRKy58099p8Wff_3VaN+Ee3oWkw@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] goldfish_rtc: Add endianness property
To: Stafford Horne <shorne@gmail.com>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 Laurent Vivier <lvivier@redhat.com>, Anup Patel <anup.patel@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:Goldfish RTC" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=apatel@ventanamicro.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 04 Jul 2022 02:50:18 -0000

On Mon, Jul 4, 2022 at 2:59 AM Stafford Horne <shorne@gmail.com> wrote:
>
> Add an endianness property to allow configuring the RTC as either
> native, little or big endian.
>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Stafford Horne <shorne@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  hw/rtc/goldfish_rtc.c         | 46 ++++++++++++++++++++++++++++-------
>  include/hw/rtc/goldfish_rtc.h |  2 ++
>  2 files changed, 39 insertions(+), 9 deletions(-)
>
> diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
> index 35e493be31..24f6587086 100644
> --- a/hw/rtc/goldfish_rtc.c
> +++ b/hw/rtc/goldfish_rtc.c
> @@ -216,14 +216,34 @@ static int goldfish_rtc_post_load(void *opaque, int version_id)
>      return 0;
>  }
>
> -static const MemoryRegionOps goldfish_rtc_ops = {
> -    .read = goldfish_rtc_read,
> -    .write = goldfish_rtc_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> -    .valid = {
> -        .min_access_size = 4,
> -        .max_access_size = 4
> -    }
> +static const MemoryRegionOps goldfish_rtc_ops[3] = {
> +    [DEVICE_NATIVE_ENDIAN] = {
> +        .read = goldfish_rtc_read,
> +        .write = goldfish_rtc_write,
> +        .endianness = DEVICE_NATIVE_ENDIAN,
> +        .valid = {
> +            .min_access_size = 4,
> +            .max_access_size = 4
> +        }
> +    },
> +    [DEVICE_LITTLE_ENDIAN] = {
> +        .read = goldfish_rtc_read,
> +        .write = goldfish_rtc_write,
> +        .endianness = DEVICE_LITTLE_ENDIAN,
> +        .valid = {
> +            .min_access_size = 4,
> +            .max_access_size = 4
> +        }
> +    },
> +    [DEVICE_BIG_ENDIAN] = {
> +        .read = goldfish_rtc_read,
> +        .write = goldfish_rtc_write,
> +        .endianness = DEVICE_BIG_ENDIAN,
> +        .valid = {
> +            .min_access_size = 4,
> +            .max_access_size = 4
> +        }
> +    },
>  };
>
>  static const VMStateDescription goldfish_rtc_vmstate = {
> @@ -265,7 +285,8 @@ static void goldfish_rtc_realize(DeviceState *d, Error **errp)
>      SysBusDevice *dev = SYS_BUS_DEVICE(d);
>      GoldfishRTCState *s = GOLDFISH_RTC(d);
>
> -    memory_region_init_io(&s->iomem, OBJECT(s), &goldfish_rtc_ops, s,
> +    memory_region_init_io(&s->iomem, OBJECT(s),
> +                          &goldfish_rtc_ops[s->endianness], s,
>                            "goldfish_rtc", 0x24);
>      sysbus_init_mmio(dev, &s->iomem);
>
> @@ -274,10 +295,17 @@ static void goldfish_rtc_realize(DeviceState *d, Error **errp)
>      s->timer = timer_new_ns(rtc_clock, goldfish_rtc_interrupt, s);
>  }
>
> +static Property goldfish_rtc_properties[] = {
> +    DEFINE_PROP_UINT8("endianness", GoldfishRTCState, endianness,
> +                      DEVICE_NATIVE_ENDIAN),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void goldfish_rtc_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>
> +    device_class_set_props(dc, goldfish_rtc_properties);
>      dc->realize = goldfish_rtc_realize;
>      dc->reset = goldfish_rtc_reset;
>      dc->vmsd = &goldfish_rtc_vmstate;
> diff --git a/include/hw/rtc/goldfish_rtc.h b/include/hw/rtc/goldfish_rtc.h
> index 79ca7daf5d..8e1aeb85e3 100644
> --- a/include/hw/rtc/goldfish_rtc.h
> +++ b/include/hw/rtc/goldfish_rtc.h
> @@ -42,6 +42,8 @@ struct GoldfishRTCState {
>      uint32_t irq_pending;
>      uint32_t irq_enabled;
>      uint32_t time_high;
> +
> +    uint8_t endianness;
>  };
>
>  #endif
> --
> 2.36.1
>
>

