Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrZFX-0008AQ-4Y
	for mharc-qemu-riscv@gnu.org; Fri, 11 Jun 2021 00:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1lrZFV-00088u-L0
 for qemu-riscv@nongnu.org; Fri, 11 Jun 2021 00:58:29 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1lrZFT-0001a3-26
 for qemu-riscv@nongnu.org; Fri, 11 Jun 2021 00:58:29 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so7380963wmq.1
 for <qemu-riscv@nongnu.org>; Thu, 10 Jun 2021 21:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g33IntimCDVfnGstKmtjsEch5gJ/9wxopUYb9GOeWnY=;
 b=EYpLMEBHVSrzlPpNEnbPFOAd6aWUaE8eYwem6LUXUsqVrrVydJaL19G78h+YOpT0An
 pYYxs8Rl8VJ7dven1Qpq+m8J5anmDkMF8c0M8jw7a/rTSA3GH7/Al5+kWeVHFihUx7WW
 3dE+xusgz4XXnkJhqJcSY1wm9F1kcVMjefcBF9GWbOC5nR/YOodxw4SFeV/iZwhTQ1VH
 Xmf6uI3zs2wEfpTlVaIoPYn1qW2clus4KP/eqgIRPAMMMGxB/xdvLoa8PuVr92l7Y4dX
 Cj53QPYKGxuhI7MdGgPHOc63hifjUt05fEanUb5VIgfcHR/SkFf4t0N5wFE1MIgVaZhf
 e4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g33IntimCDVfnGstKmtjsEch5gJ/9wxopUYb9GOeWnY=;
 b=XBtORzfosxVnLA+5zr+zUoANS4qyrt1xpONngrcS2tTYg2plghm29688Nir/Bw1jok
 S88+uzQPUsKYc9EtpzgdwpHRRTLr+NyK0kRHyS3dPV3G2Tx6ctF+olMEibu4bYRXcQMR
 B9pH2BA5gDh+B8Aj6EHw7IL3S9cRQKPW+I1NPZFq4REdSd+g7al64LNT8Oggc0RreWOB
 FM8cYR/t5s523vaRom9HQLU3MJQrVwE7wWUN86CFdtOiRqZ7uxhvWk1pNFw8PM1THToy
 l/h4Wd9nIw9favjXUm351yJiKRZaJEdUEaq6nJcvWHBdMxgpQhbVlZlQVwH71yhkCO2i
 OS/g==
X-Gm-Message-State: AOAM533g7L7ss9RxoyCIKCoMTBY/hZ2nEURI6p0oay34mF6bXERQHhT+
 PMeF56mFZAOyz4LOKl6PDcm/qtAM+bnOecedpTqL0g==
X-Google-Smtp-Source: ABdhPJzi9uqPm8H4rdK1P57s1Kx6FFglUpxzrMI9a6ghqE/YF+FR+pMoDbbPglitRsmJyx9dA5n8LZJKwtmFzoEfLhI=
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr2004353wmj.134.1623387504257; 
 Thu, 10 Jun 2021 21:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210514143242.377645-1-anup.patel@wdc.com>
 <20210514143242.377645-3-anup.patel@wdc.com>
 <CAKmqyKNRJaOoWEPkxc1Xc7wJAiAZ8uokZ3UCQEnoShavxohWXA@mail.gmail.com>
In-Reply-To: <CAKmqyKNRJaOoWEPkxc1Xc7wJAiAZ8uokZ3UCQEnoShavxohWXA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Jun 2021 10:28:08 +0530
Message-ID: <CAAhSdy0-kMgSvxQ0FdCKsNjF67-dLTB_T5DSfdgJrVWc=py+Pg@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/riscv: Add CPU feature for AIA CSRs
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::32c;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 11 Jun 2021 04:58:29 -0000

On Fri, Jun 11, 2021 at 4:46 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, May 15, 2021 at 12:35 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We add experimental CPU feature to enable AIA CSRs. This experimental
> > feature can be enabled by setting "x-aia=true" for CPU in the QEMU
> > command-line parameters.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/cpu.c | 5 +++++
> >  target/riscv/cpu.h | 4 +++-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 7d6ed80f6b..f3702111ae 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -414,6 +414,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >          set_feature(env, RISCV_FEATURE_PMP);
> >      }
> >
> > +    if (cpu->cfg.aia) {
> > +        set_feature(env, RISCV_FEATURE_AIA);
> > +    }
> > +
> >      set_resetvec(env, cpu->cfg.resetvec);
> >
> >      /* If only XLEN is set for misa, then set misa from properties */
> > @@ -554,6 +558,7 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> >      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> >      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> > +    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>
> This line should be a seperate patch at the end of the series.
>
> The idea is that we don't allow users to enable the feature until it
> has been fully implemented.

Okay, I will move this into a separate patch towards the end of the series.

Regards,
Anup

>
> Alistair
>
> >      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 0a33d387ba..f00c60c840 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -80,7 +80,8 @@
> >  enum {
> >      RISCV_FEATURE_MMU,
> >      RISCV_FEATURE_PMP,
> > -    RISCV_FEATURE_MISA
> > +    RISCV_FEATURE_MISA,
> > +    RISCV_FEATURE_AIA
> >  };
> >
> >  #define PRIV_VERSION_1_10_0 0x00011000
> > @@ -303,6 +304,7 @@ struct RISCVCPU {
> >          uint16_t elen;
> >          bool mmu;
> >          bool pmp;
> > +        bool aia;
> >          uint64_t resetvec;
> >      } cfg;
> >  };
> > --
> > 2.25.1
> >
> >

