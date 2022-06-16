Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1fL4-0003ZZ-Hj
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 22:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1fL2-0003V7-CT; Wed, 15 Jun 2022 22:34:28 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1fKu-0004g3-0L; Wed, 15 Jun 2022 22:34:28 -0400
Received: by mail-pf1-x434.google.com with SMTP id x4so256808pfj.10;
 Wed, 15 Jun 2022 19:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X0p+wGRDd7PzrbcSR+4itNhstkJw1K172Q5t+13xp1I=;
 b=LqkA1P5x9xWXpkmF1gGixwClZz2u5Qz4D27Y9WzvnUC/EbZ4pqJiXDi5gj+Edjpv2P
 WRjWEMGC46CO52pbuuTxA8sTLZ8iI+3lOzr5RQamniZr+lS7EzFDCKD+i2uMYAhis30i
 i/il0M/L+mG8Wyqd+FyODRuTKS7AEsSjdR66u0QbvbR2OU/tSKejRdYixrLL00btZn29
 0RMnYUAVZil6UwV90mGQtjmbuvmsfrtQYEl5oBWzMUP43a0iMBT6QJYxTp6alNHfliWq
 Gen9jzCKRD+TAUGVWIkmGnH0i4NzdNOd2bIFjMlhd/jwV+/jQmUAL99oLI26Q37C+leV
 gPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X0p+wGRDd7PzrbcSR+4itNhstkJw1K172Q5t+13xp1I=;
 b=wat6qe4fEIA12+EFaIRNL3Q6YvsW1PcSrzEpSIEQgnODdpDUQO0HiQ4F1amhygv2eH
 tjtGKy+gKArF78umIIb8Gx16Kqao3fSVU67Mg/QpxAn4WU10HGzX2r1kzIdjZYcR6OSa
 uksUrfa6aHt3GBf4H16y3upkvblIBVfP1pZsK0ahPYo/PbDSIBsQT4iIQPzv0FPLag6y
 GLDG/8Z9nFxFS+CPxsAlWIxK0Z0SPPG19kcGGSp87RaKzfzOAGgLVPSMYULsgFjb4BwX
 9K+cwWyButtIw59FZfy41TyF2YYDHJPHJfq+U4ENlphTz4uGnP2ayBFCnSXnsS0Bib2D
 SHaw==
X-Gm-Message-State: AJIora/HjB+IlALcXjo5RB5RFjAHearEKimLdIjso4uvvp79v6HmHbve
 +bJFkGlPmbe8OFy1XsVYcYCmrBj5uoGclCtGAeA=
X-Google-Smtp-Source: AGRyM1vFToMtr0AoquCJvahFibByih0FDE4N8987wze6G5D5csDQnGJeSR9I+WL5tqGHn940xNcYZKHLNfVkM1Rxboc=
X-Received: by 2002:a65:5385:0:b0:3fa:52e3:6468 with SMTP id
 x5-20020a655385000000b003fa52e36468mr2501461pgq.366.1655346857826; Wed, 15
 Jun 2022 19:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220609010724.104033-1-bmeng.cn@gmail.com>
 <CAKmqyKPOj2YesmskC5q9Xai3D0edb6TzvxkfzdkK7tork3QAPw@mail.gmail.com>
 <CAEUhbmVakz7sKACQgYO77mw7kw3WtAcxy4=0++BHfQyaCHCJ3Q@mail.gmail.com>
In-Reply-To: <CAEUhbmVakz7sKACQgYO77mw7kw3WtAcxy4=0++BHfQyaCHCJ3Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Jun 2022 12:33:51 +1000
Message-ID: <CAKmqyKOJ5W4Z_sqx=NLkB4UmmhbpC9-nvGMR7yh9XoNJa03=Ug@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: Remove the redundant initialization of
 env->misa_mxl
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 16 Jun 2022 02:34:28 -0000

On Mon, Jun 13, 2022 at 10:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Jun 13, 2022 at 8:33 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Thu, Jun 9, 2022 at 11:08 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > env->misa_mxl was already set in the RISC-V cpu init routine, and
> > > validated at the beginning of riscv_cpu_realize(). There is no need
> > > to do a redundant initialization later.
> > >
> > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > > ---
> > >
> > >  target/riscv/cpu.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index a91253d4bd..61d1737741 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -752,7 +752,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> > >              ext |= RVJ;
> > >          }
> > >
> > > -        set_misa(env, env->misa_mxl, ext);
> > > +        env->misa_ext_mask = env->misa_ext = ext;
> >
> > You're right that we don't need to set `misa_mxl`, but isn't it
> > cleaner calling the helper function here instead of manually assigning
> > it?
> >
>
> There is no helper for assigning misa_ext only. Do you want a new
> helper for that?

No, I don't think we need a new helper. I mean, is there any harm in
just calling `set_misa()` even if that means we are performing a
redundant operation?

Alistair

>
> Regards,
> Bin

