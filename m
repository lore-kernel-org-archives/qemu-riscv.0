Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i9UFe-0003mH-Ka
	for mharc-qemu-riscv@gnu.org; Sun, 15 Sep 2019 09:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54950)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i9UFc-0003kV-Cq
 for qemu-riscv@nongnu.org; Sun, 15 Sep 2019 09:07:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i9UFb-0005qJ-9U
 for qemu-riscv@nongnu.org; Sun, 15 Sep 2019 09:07:36 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:45723)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i9UFY-0005o8-Jr; Sun, 15 Sep 2019 09:07:32 -0400
Received: by mail-ed1-x541.google.com with SMTP id h33so1935191edh.12;
 Sun, 15 Sep 2019 06:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AVP7OSBRaLdJWrvwWF/ouV9Y/nHnjN9t5Cz1jlAivjw=;
 b=RsEXgQn1R8KQISEOiARiFLR+P2avb87vUwLOA6IBe8vDfIJmxvdmz/AYCP5GYApD7Q
 p80A49qHcEY/yxNqIX4Z6p6bJmyyUuog4CODRNcA1mjGlt8RgStH0tUcakvhnYeO5y1Q
 9p+BLomN/ONsvuXc/T3JkcElhUmtKsf05A3ukp+vtNokNJsFM178CqG31N1QGT0t3I5R
 h49NdZM1nB1xgSFvVNOEGTmERO594WDvduEDaA70doXTkTc12zxFajlhl3CxrTICxpEE
 c8CHaQZA3vGZsrP11o76yB9VLxsT55fiRW0awVUF5Z9MhBZT8IostuRw85NOQe98XiYh
 9siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AVP7OSBRaLdJWrvwWF/ouV9Y/nHnjN9t5Cz1jlAivjw=;
 b=q4xFO882vhjR0bnDxpAmuGzxfFZubw8Z3BjSV2CHEqx+VNVaAYK17aB+9eakMhN8vA
 i2c58yHUClhZKwkXcBKrO6aAD+yDCkUKQ24sbGaGcu6yuHpSblahRjvnvxgvrLdD/oBH
 bNJ5ylI7rP8GXeVOW7GCv6NujSq4HzZmW6mxYRm/LwPM2DsByy2zSkP6hMSQny+v5Mk8
 IuW/HB0JmjsXIAuzMBr0UG0jTiTEVv1i0SbaZjjYE2E/x8wapgUE/0VqZ7MA8E1/J+qF
 FC5EVKqEERMqvwKUHhG8RNpXp2zg4qQzXwl/L4iFPPYSp2PVsVodrURt6OCLOnEaKWlt
 hRCQ==
X-Gm-Message-State: APjAAAWk1bVABnf8LRWcwub66laWrvvQr0vQMRhdrBgcVneQuqs35mX3
 A0UNMSWbHv7zKTlGJI2NuOGHtv6LRPF6WiFGqQ8=
X-Google-Smtp-Source: APXvYqw8GpHkJou3vTo51/RTV9mhLgR/hb3RWSMq5/MRbhEAOuk8YpJw17JPuVqhNjzq1THdUchXs3PaDBriuMZRgdU=
X-Received: by 2002:a50:95c1:: with SMTP id x1mr8820617eda.180.1568552850253; 
 Sun, 15 Sep 2019 06:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmUksfEiGLZ0qzsWkaDOaocTvkEYefiSUmGZT7TftYfmEg@mail.gmail.com>
 <mhng-165ebd8f-3595-48d3-a614-79f52d81c14c@palmer-si-x1e>
In-Reply-To: <mhng-165ebd8f-3595-48d3-a614-79f52d81c14c@palmer-si-x1e>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 15 Sep 2019 21:07:18 +0800
Message-ID: <CAEUhbmV=v62a0CAHe2mt1Qzz0n+fESgVYDtjdoXfyhH6_j5zFw@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-riscv] [PATCH v8 18/32] riscv: sifive_u: Set the minimum
 number of cpus to 2
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
X-List-Received-Date: Sun, 15 Sep 2019 13:07:37 -0000

Hi Palmer,

On Sun, Sep 15, 2019 at 3:00 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Fri, 13 Sep 2019 08:25:21 PDT (-0700), bmeng.cn@gmail.com wrote:
> > Hi Palmer,
> >
> > On Fri, Sep 13, 2019 at 10:33 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> >>
> >> On Fri, 06 Sep 2019 09:20:05 PDT (-0700), bmeng.cn@gmail.com wrote:
> >> > It is not useful if we only have one management CPU.
> >> >
> >> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >> >
> >> > ---
> >> >
> >> > Changes in v8: None
> >> > Changes in v7: None
> >> > Changes in v6: None
> >> > Changes in v5: None
> >> > Changes in v4: None
> >> > Changes in v3:
> >> > - use management cpu count + 1 for the min_cpus
> >> >
> >> > Changes in v2:
> >> > - update the file header to indicate at least 2 harts are created
> >> >
> >> >  hw/riscv/sifive_u.c         | 4 +++-
> >> >  include/hw/riscv/sifive_u.h | 2 ++
> >> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> >> > index 2947e06..2023b71 100644
> >> > --- a/hw/riscv/sifive_u.c
> >> > +++ b/hw/riscv/sifive_u.c
> >> > @@ -10,7 +10,8 @@
> >> >   * 1) CLINT (Core Level Interruptor)
> >> >   * 2) PLIC (Platform Level Interrupt Controller)
> >> >   *
> >> > - * This board currently uses a hardcoded devicetree that indicates one hart.
> >> > + * This board currently generates devicetree dynamically that indicates at least
> >> > + * two harts.
> >> >   *
> >> >   * This program is free software; you can redistribute it and/or modify it
> >> >   * under the terms and conditions of the GNU General Public License,
> >> > @@ -433,6 +434,7 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
> >> >       * management CPU.
> >> >       */
> >> >      mc->max_cpus = 4;
> >> > +    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
> >> >  }
> >> >
> >> >  DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
> >> > diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> >> > index f25bad8..6d22741 100644
> >> > --- a/include/hw/riscv/sifive_u.h
> >> > +++ b/include/hw/riscv/sifive_u.h
> >> > @@ -69,6 +69,8 @@ enum {
> >> >      SIFIVE_U_GEM_CLOCK_FREQ = 125000000
> >> >  };
> >> >
> >> > +#define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
> >> > +
> >> >  #define SIFIVE_U_PLIC_HART_CONFIG "MS"
> >> >  #define SIFIVE_U_PLIC_NUM_SOURCES 54
> >> >  #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
> >>
> >> This fails "make check", so I'm going to squash in this
> >>
> >> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> >> index ca9f7fea41..adecbf1dd9 100644
> >> --- a/hw/riscv/sifive_u.c
> >> +++ b/hw/riscv/sifive_u.c
> >> @@ -528,6 +528,7 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
> >>      mc->init = riscv_sifive_u_init;
> >>      mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
> >>      mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
> >> +    mc->default_cpus = mc->max_cpus;
> >
> > Thank you for fixing the 'make check'. Shouldn't it be:
> >
> > mc->default_cpus = mc->min_cpus;
>
> We have 5 harts on the board that this matches, so I figured that'd be the
> better default.
>

Per my understanding mc->default_cpus is used when invoking QEMU
without passing '-smp n' (that's what 'make check' uses), and with the
updated sifive_u machine, '-smp 2' is the actual useful configuration
to boot Linux. For consistency with user experience on other machines,
without '-smp' means we want a uni-processor machine hence I would
suggest we set "mc->default_cpus = mc->min_cpus".

Regards,
Bin

