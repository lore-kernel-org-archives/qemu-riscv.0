Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F41C77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 12:06:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q29iu-0007sf-KJ; Thu, 25 May 2023 08:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q29ir-0007p4-TB
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 08:05:39 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q29iq-0008Vx-1T
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 08:05:37 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3093eb8cd1fso1414696f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685016334; x=1687608334;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1VT8D+1qTtwceXxG41J2CQeYmmAgAGRK7J0zx1X4uUY=;
 b=kxegAE2+ZkfoJuB2FeRHxXSWA2I+dHP21mdDthtsXJsiYLy7c4SHnFKESP1n+5jUcQ
 tqe7RSeKekW7pWlP2ASXRP5xZYYewIaGrwzAPSjDhlkfjT2Q+RQf4hB2e4SKEAQ4UjVx
 SX4IRji5Vp5r4eIy/cm3XUMa7GowOHmRxWq1FKfzRKCE0oWepNcT6dVxyrI1ZYq6YEAT
 MRg8jA/vsVhHctXFOqUcqq8BfjBMJLMehUuyqovl6eakUx+TsStxS9p6Du52ZbONByCB
 0Kgixdjrb5I9xUrKP97mIEJYhfxpduuBphkNj7F3SPMl3enyyIGQiJ+FrDs+MoKI1VAL
 9ItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685016334; x=1687608334;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1VT8D+1qTtwceXxG41J2CQeYmmAgAGRK7J0zx1X4uUY=;
 b=HnNj9Lb0sQsaCBgtVP55EqanRHvseTIX4RgXdlKHvB67Ai6Z+c0B/wM2JzEFO/8f86
 hSPzpaYcNqXbmyfrv7h/kRxzIObXJzpDeGnSMzQ0i0scpjV4KN1AAqeCnOFomD9bRchF
 PsW1B/MF7ch+6vFI/2d2AsMSfzJ7Ionzgv0o1arudTmNU/5SkT27EQY1oO2UTBEDaO7s
 uY3PIInUyr8zym7g75ICD0Kmx+nNASI3uZ+uuYDcU/u6E+p3zuZ5DsNtcE4VybGqXdaT
 PMvddaCBtc2TLXE2OJH47V9yC/BUGMC5OZR2ZXs90+CotDxL8CvtJiGcVjzxXgqK/w70
 YAaQ==
X-Gm-Message-State: AC+VfDw8cBE2UYKrZdD2uCjcoUcY8hUgO+e6jODWDIAFM5BxPeoMOqlI
 0sLFl0NOs5GiK1JNkbVovXnQKA==
X-Google-Smtp-Source: ACHHUZ56IS0xIXsNxsCdgrfp4KdhuwZ7WC1/XAj6iiPp8fYLCGaxviahD6uROwM+qMGQxCg+6Hl4lw==
X-Received: by 2002:a05:6000:1246:b0:309:49e3:efb4 with SMTP id
 j6-20020a056000124600b0030949e3efb4mr2041076wrx.63.1685016333944; 
 Thu, 25 May 2023 05:05:33 -0700 (PDT)
Received: from [192.168.69.115] (cor91-h02-176-184-30-254.dsl.sta.abo.bbox.fr.
 [176.184.30.254]) by smtp.gmail.com with ESMTPSA id
 q2-20020adff502000000b003062c0ef959sm1607079wro.69.2023.05.25.05.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 05:05:33 -0700 (PDT)
Message-ID: <e9ab4620-2878-45c1-264b-305c41958213@linaro.org>
Date: Thu, 25 May 2023 14:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/3] hw/misc: sifive_e_aon: Support the watchdog timer
 of HiFive 1 rev b.
Content-Language: en-US
To: Tommy Wu <tommy.wu@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, thuth@redhat.com,
 liweiwei@iscas.ac.cn
References: <20230523084910.304679-1-tommy.wu@sifive.com>
 <20230523084910.304679-2-tommy.wu@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230523084910.304679-2-tommy.wu@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Tommy,

On 23/5/23 10:49, Tommy Wu wrote:
> The watchdog timer is in the always-on domain device of HiFive 1 rev b,
> so this patch added the AON device to the sifive_e machine. This patch
> only implemented the functionality of the watchdog timer.
> 
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   hw/misc/Kconfig                |   3 +
>   hw/misc/meson.build            |   1 +
>   hw/misc/sifive_e_aon.c         | 326 +++++++++++++++++++++++++++++++++
>   include/hw/misc/sifive_e_aon.h |  60 ++++++
>   4 files changed, 390 insertions(+)
>   create mode 100644 hw/misc/sifive_e_aon.c
>   create mode 100644 include/hw/misc/sifive_e_aon.h


> +REG32(AON_WDT_WDOGCFG, 0x0)
> +    FIELD(AON_WDT_WDOGCFG, SCALE, 0, 4)
> +    FIELD(AON_WDT_WDOGCFG, RSVD0, 4, 4)
> +    FIELD(AON_WDT_WDOGCFG, RSTEN, 8, 1)
> +    FIELD(AON_WDT_WDOGCFG, ZEROCMP, 9, 1)
> +    FIELD(AON_WDT_WDOGCFG, RSVD1, 10, 2)
> +    FIELD(AON_WDT_WDOGCFG, EN_ALWAYS, 12, 1)
> +    FIELD(AON_WDT_WDOGCFG, EN_CORE_AWAKE, 13, 1)
> +    FIELD(AON_WDT_WDOGCFG, RSVD2, 14, 14)
> +    FIELD(AON_WDT_WDOGCFG, IP0, 28, 1)
> +    FIELD(AON_WDT_WDOGCFG, RSVD3, 29, 3)
> +REG32(AON_WDT_WDOGCOUNT, 0x8)

Adding:

        FIELD(AON_WDT_WDOGCOUNT, VALUE, 0, 31)

...

> +REG32(AON_WDT_WDOGS, 0x10)
> +REG32(AON_WDT_WDOGFEED, 0x18)
> +REG32(AON_WDT_WDOGKEY, 0x1c)
> +REG32(AON_WDT_WDOGCMP0, 0x20)
> +
> +static void sifive_e_aon_wdt_update_wdogcount(SiFiveEAONState *r)
> +{
> +    int64_t now;
> +    if (0 == FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_ALWAYS) &&
> +        0 == FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE)) {
> +        return;
> +    }
> +
> +    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    r->wdogcount += muldiv64(now - r->wdog_restart_time,
> +                             r->wdogclk_freq, NANOSECONDS_PER_SECOND);
> +
> +    /* Clean the most significant bit. */
> +    r->wdogcount = ((r->wdogcount << 1) >> 1);

... you could use:

        r->wdogcount &= R_AON_WDT_WDOGCOUNT_VALUE_MASK

> +    r->wdog_restart_time = now;
> +}
> +
> +static void sifive_e_aon_wdt_update_state(SiFiveEAONState *r)
> +{
> +    uint16_t wdogs;
> +    bool cmp_signal = false;
> +    sifive_e_aon_wdt_update_wdogcount(r);
> +    wdogs = (uint16_t)(r->wdogcount >>
> +                           FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, SCALE));
> +
> +    if (wdogs >= r->wdogcmp0) {
> +        cmp_signal = true;
> +        if (1 == FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, ZEROCMP)) {
> +            r->wdogcount = 0;
> +            wdogs = 0;
> +        }
> +    }
> +
> +    if (cmp_signal) {
> +        if (1 == FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, RSTEN)) {

You sometimes check bit equality, ...

> +            watchdog_perform_action();
> +        }
> +        r->wdogcfg = FIELD_DP32(r->wdogcfg, AON_WDT_WDOGCFG, IP0, 1);
> +    }
> +
> +    qemu_set_irq(r->wdog_irq, FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, IP0));
> +
> +    if (wdogs < r->wdogcmp0 &&
> +        (FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_ALWAYS) ||

... sometimes you don't. Code style consistency would be better.

(Also, most of QEMU code base check equality using constant value
on the right side of the comparaison).

> +         FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE))) {
> +        int64_t next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        next += muldiv64((r->wdogcmp0 - wdogs) <<
> +                         FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, SCALE),
> +                         NANOSECONDS_PER_SECOND, r->wdogclk_freq);
> +        timer_mod(r->wdog_timer, next);
> +    } else {
> +        timer_mod(r->wdog_timer, INT64_MAX);
> +    }
> +}

> +static void sifive_e_aon_init(Object *obj)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    SiFiveEAONState *r = SIFIVE_E_AON(obj);
> +
> +    memory_region_init_io(&r->mmio, OBJECT(r), &sifive_e_aon_ops, r,
> +                          TYPE_SIFIVE_E_AON, SIFIVE_E_AON_MAX);
> +    sysbus_init_mmio(sbd, &r->mmio);
> +
> +    /* watchdog timer */
> +    r->wdogclk_freq = SIFIVE_E_LFCLK_DEFAULT_FREQ;
> +    sysbus_init_irq(sbd, &r->wdog_irq);
> +}
> +
> +static void sifive_e_aon_realize(DeviceState *dev, Error **errp)
> +{
> +    SiFiveEAONState *r = SIFIVE_E_AON(dev);
> +
> +    /* watchdog timer */
> +    r->wdog_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                 sifive_e_aon_wdt_expired_cb, r);

You should be able to create the timer in sifive_e_aon_init().

> +}

Regards,

Phil.

