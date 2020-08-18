Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7uwA-0007E1-6F
	for mharc-qemu-riscv@gnu.org; Tue, 18 Aug 2020 02:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1k7uw8-0007BP-6K
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2020 02:17:32 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1k7uw5-0003dU-UD
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2020 02:17:31 -0400
Received: by mail-wr1-x444.google.com with SMTP id r4so17059440wrx.9
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 23:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIdWO3COCqNdq9aMAydiJRPmw8ayq0kdGOqoDuJJjbk=;
 b=gN5EDQ1y2F3iKrhn8Mzh/7lqjhxrwUIINxNyR7KvPMMKhWe77LozxTnwKM1qzKJKgG
 UcNdokP++rJbAlLNcm7VikdLZwidRMKX06VWFdiHXJkuNKMmQpglHWxTPs50zTE6Dchs
 WLgtivoofLTi1V2Db2i/lXFOR/XPKrzlbohTZDjGwi0bvUFRG5tC5yyMmdHbXK2itaw3
 sbdxRUdpeiGNA7xhXcldaBUe5jgR2aC5qvqx0icemPzSQDjb++VVQl0Tt9+lW8uE+7gO
 TKjym0rKD3BRJNDUDBcIz/KaC9PgxXwsafbkLHO/9GE+6pO9Zo74CQQiYOhu3BbGD1UO
 ohTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIdWO3COCqNdq9aMAydiJRPmw8ayq0kdGOqoDuJJjbk=;
 b=BQ51dVEZ9HbG4BL//hPxhefIWcz6618r10fmMBjfEVERiFXywDjkMl/k3EJzbJvP6N
 IFTHSq86Q6PL/8G2/MVTh2MBxFhy8wdYYHjLMbFVAYGMNWLISzOYuvF+6MXnK6PRwAvc
 vnG2kXdz84L9uy93iyRggvVqnR10XZgaqVKlaYMdTpumAESqNjzqOpbJq6uCH3jtXFzF
 r9MCsELtju5lXEioSZgoUg3712TOLpjFgy7lyoh75qyFcNu4SKLjVUQgYYwYgw58nCRc
 g+dNDag3gYNrZ8k44EHqt9X8yASb1QBEbouLbI3Tb/7EbDDntevtD2XGjKYx7L/EIydz
 uqbA==
X-Gm-Message-State: AOAM530kRqbaQFomu1YyoJzUIDnTjDCY2GgB1Ss4R3nX5d4oLsE2Vk07
 aNQBqMfUuqoiBxOeXA/GW11KgGRNB6/yrFrJMhp9bg==
X-Google-Smtp-Source: ABdhPJyymyoSdwLNSZAXB/cVgy+M4WNK6BiXsZOPS1Y6uWbR3YKi9cmxZbTh9kvnDZIZsUAt65hP4QaOA8uOi8dF6OU=
X-Received: by 2002:adf:f247:: with SMTP id b7mr19606082wrp.128.1597731447614; 
 Mon, 17 Aug 2020 23:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
 <CAAhSdy2D=TcENAJDja4r6pnhz0LRi-T+A9k3Btrs_EuB4x0e4w@mail.gmail.com>
 <CAEUhbmV5=B5xKhYqMj1MQb61nt5cNUJG1MXT++C1w1YMYTfLCQ@mail.gmail.com>
 <202949f7-c9d5-4d4d-3ebe-53727f4fa169@microchip.com>
 <CAKmqyKM3nm0rhxgDvWKWfO+4b23ZLSkHW2TzmcVZ_ZFy4L7MRg@mail.gmail.com>
 <d3f61c2c-a489-887e-0143-4d9a1e66e6f2@microchip.com>
In-Reply-To: <d3f61c2c-a489-887e-0143-4d9a1e66e6f2@microchip.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Aug 2020 11:47:15 +0530
Message-ID: <CAAhSdy32owLO0KytyYsg-zH6JyyfNfGofa4vanqTFJLntPq0=g@mail.gmail.com>
Subject: Re: [PATCH 00/18] hw/riscv: Add Microchip PolarFire SoC Icicle Kit
 board support
To: Cyril.Jean@microchip.com
Cc: Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, qemu-block@nongnu.org, 
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::444;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 18 Aug 2020 06:17:32 -0000

On Tue, Aug 18, 2020 at 1:23 AM <Cyril.Jean@microchip.com> wrote:
>
> On 8/17/20 8:28 PM, Alistair Francis wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Mon, Aug 17, 2020 at 11:12 AM via <qemu-devel@nongnu.org> wrote:
> >> Hi Anup,
> >>
> >> On 8/17/20 11:30 AM, Bin Meng wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> Hi Anup,
> >>>
> >>> On Sat, Aug 15, 2020 at 1:44 AM Anup Patel <anup@brainfault.org> wrote:
> >>>> On Fri, Aug 14, 2020 at 10:12 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>>> From: Bin Meng <bin.meng@windriver.com>
> >>>>>
> >>>>> This adds support for Microchip PolarFire SoC Icicle Kit board.
> >>>>> The Icicle Kit board integrates a PolarFire SoC, with one SiFive's
> >>>>> E51 plus four U54 cores and many on-chip peripherals and an FPGA.
> >>>> Nice Work !!! This is very helpful.
> >>> Thanks!
> >>>
> >>>> The Microchip HSS is quite convoluted. It has:
> >>>> 1. DDR Init
> >>>> 2. Boot device support
> >>>> 3. SBI support using OpenSBI as library
> >>>> 4. Simple TEE support
> >>>>
> >>>> I think point 1) and 2) above should be part of U-Boot SPL.
> >>>> The point 3) can be OpenSBI FW_DYNAMIC.
> >>>>
> >>>> Lastly,for point 4), we are working on a new OpenSBI feature using
> >>>> which we can run independent Secure OS and Non-Secure OS using
> >>>> U-Boot_SPL+OpenSBI (for both SiFive Unleashed and Microchip
> >>>> PolarFire).
> >>>>
> >>>> Do you have plans for adding U-Boot SPL support for this board ??
> >>> + Cyril Jean from Microchip
> >>>
> >>> I will have to leave this question to Cyril to comment.
> >>>
> >> I currently do not have a plan to support U-Boot SPL. The idea of the
> >> HSS is to contain all the silicon specific initialization and
> >> configuration code within the HSS before jumping to U-Boot S-mode. I
> >> would rather keep all this within the HSS for the time being. I would
> >> wait until we reach production silicon before attempting to move this to
> >> U-Boot SPL as the HSS is likely to contain some opaque silicon related
> >> changes for another while.
> > That is unfortunate, a lot of work has gone into making the boot flow
> > simple and easy to use.
> >
> > QEMU now includes OpenSBI by default to make it easy for users to boot
> > Linux. The Icicle Kit board is now the most difficult QEMU board to
> > boot Linux on. Not to mention it makes it hard to impossible to
> > support it in standard tool flows such as meta-riscv.
> >
> > Alistair
>
> If it is such a problem we can add a U-Boot SPL stage and the HSS can be
> treated as standard SoC ROM code.

It's not mandatory for U-Boot SPL to have stable DRAM calibration settings
from the start itself. The initial U-Boot SPL support for most
platforms (accross
architectures) usually include basic working DRAM calibration settings which
is later on updated with separate patches. Also, we don't need all U-Boot
drivers to be upstreamed in one-go as this can be done in phases.

The advantage we have with PolarFire SoC Icicle board is that we already
have a U-Boot S-mode. and we believe the OpenSBI generic platform will
work fine for PolarFire SoC Icicle board so the only thing missing right now
is the U-Boot SPL support for OpenSource boot-flow.

It will certainly accelerate open-source development if we have boot-flow
U-Boot_SPL => OpenSBI (FW_DYNAMIC) => U-Boot_S-mode working
on PolarFire SoC Icicle board. Initially, we just need DRAM, SD/eMMC,
and Serial port support for U-Boot SPL and U-Boot S-mode. Later on,
more patches can add ethernet and other booting device drivers to U-Boot.

Regarding security services of HSS, we are working on a OpenSBI
feature which will allow HSS security services to run as independent
binary in M-mode (not linked to OpenSBI) and OpenSBI FW_DYNAMIC
will be a separate binary acting as a secure monitor.

Regards,
Anup

