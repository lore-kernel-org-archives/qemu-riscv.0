Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iChTI-0002Aq-1x
	for mharc-qemu-riscv@gnu.org; Tue, 24 Sep 2019 05:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iChTA-00027p-Hw
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 05:50:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iChT8-0003lp-Uy
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 05:50:52 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39573)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iChT3-0003kI-Ii
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 05:50:47 -0400
Received: by mail-ot1-x343.google.com with SMTP id s22so913386otr.6
 for <qemu-riscv@nongnu.org>; Tue, 24 Sep 2019 02:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rb/CI/UDcICyJhhVG9b3e0movg5c/F1agPe9IRth4mg=;
 b=j4tKQdc8ubJZe35qvKYdF+zyW0JCXvpyBMloHkE0upAoEXgZSrQoYEHdFox/j3/Wjx
 WmcG6edaV4Aupt/IfpAWRK8d1G4CCEm8r0cuyliYLtP/AcB7ZlNiRL9t5mV4wDv0w9fL
 VJqzakgI8lDyCchdviDPH6CCL/X0tOhUts2XEkUggh47PZrYGtK/mMVGILxzkRD5fAzx
 ujn0i+LcWoSz7GfSzmIczFJUBAlOIrKs4DoA/XHTKvTRs79KuC63PClFLdMxJho1VXyx
 RNO+myMAYbF9mXKgMcww+cRQwKKxanOFgST0w+Ko2WzsXsYOrOwQ989tWxdq0WUXBla+
 Z3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rb/CI/UDcICyJhhVG9b3e0movg5c/F1agPe9IRth4mg=;
 b=elRsCjsdk4DQYWHTY40XF5TW9QZ+n+mPQ4GnW8r5JHj4uoULLVKIY5J2dvHqdrcC69
 YPL8noqNvLZ4dQoYesX859sEdWTbDMKg1X38ngPPk6m3UvL9oeowvNvDua8SlZCfGM0Q
 EZ+xUkhSIEFvwsuz5vg8DMTD8KARCfC5raMAL4J0P47z+Lvj4HCya1MR2Nkqa1VZACYP
 jktC30MTnczUM2FWnpD+cyDGsS7oHxF+WAA9o+JpMAS/2ijS/XwWIbDGjJPC2P/6z2M+
 0uI0xVkwkG8mld2mcEccbWxwmzxnjUVzzIezzXJIJxg3QwVZT73sXjnegqkZoVN9Ff7c
 hddA==
X-Gm-Message-State: APjAAAWweoJOWUPPOGrFvEQs2jPFyYwa75TD65N1Y8UMi5NBYZR1duz+
 ABdD50++gcbDEZ4H9Ff4tviLxnBeNHJsCQby3zgEag==
X-Google-Smtp-Source: APXvYqx/yryZboylnU7k25e3/vfd7dzpCdQnivzpgn2VC8wmXwLIYDgiOsNWsx00vCanIO7wmnVmje0eTfIiyCK1aHU=
X-Received: by 2002:a9d:4615:: with SMTP id y21mr1023464ote.97.1569318642069; 
 Tue, 24 Sep 2019 02:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190924084201.107958-1-anup.patel@wdc.com>
 <20190924084201.107958-2-anup.patel@wdc.com>
In-Reply-To: <20190924084201.107958-2-anup.patel@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Sep 2019 10:50:31 +0100
Message-ID: <CAFEAcA-cm2GaKHg7_VcSb-OHp8GA9KuWiyWbc6r3F1p7tLc35A@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw: timer: Add Goldfish RTC device
To: Anup Patel <Anup.Patel@wdc.com>
Cc: Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Atish Patra <Atish.Patra@wdc.com>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2019 09:50:55 -0000

On Tue, 24 Sep 2019 at 09:45, Anup Patel <Anup.Patel@wdc.com> wrote:
>
> This patch adds model for Google Goldfish virtual platform RTC device.
>
> We will be adding Goldfish RTC device to the QEMU RISC-V virt machine
> for providing real date-time to Guest Linux. The corresponding Linux
> driver for Goldfish RTC device is already available in upstream Linux.
>
> For now, VM migration support is not available for Goldfish RTC device
> but it will be added later when we implement VM migration for KVM RISC-V.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
> +
> +static Property goldfish_rtc_properties[] = {
> +    DEFINE_PROP_UINT64("tick-offset", GoldfishRTCState, tick_offset, 0),
> +    DEFINE_PROP_UINT64("alarm-next", GoldfishRTCState, alarm_next, 0),
> +    DEFINE_PROP_UINT32("alarm-running", GoldfishRTCState, alarm_running, 0),
> +    DEFINE_PROP_UINT32("irq-pending", GoldfishRTCState, irq_pending, 0),
> +    DEFINE_PROP_UINT32("irq-enabled", GoldfishRTCState, irq_enabled, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};

What are all these properties trying to do ?

> +
> +static void goldfish_rtc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    dc->props = goldfish_rtc_properties;

Missing reset function.

If you don't want to implement migration support now
you should at least put in something that block migration.
(Personally I prefer to just write the vmstate, it's as
easy as writing the code to block migrations.)

thanks
-- PMM

