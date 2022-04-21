Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhKSu-0002Ik-7d
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 20:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhKSr-0002HV-LA; Wed, 20 Apr 2022 20:14:29 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:35560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhKSp-0005Z8-TT; Wed, 20 Apr 2022 20:14:29 -0400
Received: by mail-io1-xd2b.google.com with SMTP id q22so3672673iod.2;
 Wed, 20 Apr 2022 17:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2cuC+98Wz/R5zt/7ow58bEEKSyaXaZsCkiMl8OCprkE=;
 b=Kx0EjmMhIEX1c/2lmb5pHZh7ktggtz7lHJXSTDW0H4tGTTJtSiQhq+EGdFgWoKl4DU
 1bkFQamtbG7OaQ0zR36w8kbN9MqYT4kuLMTZbMUy1oFHkEVkltD3mm6oj87f1ioV0v/i
 6CprTsVJMUHMIJiLaeHTNlChkrOOAAhLwL9PP8G0MMcpEL5ZmA1TRJ/iBHIrQ6DL+ZrD
 7yj36xaryTMMUbk7IpLmybRr0MomKxPCRud1v4hVKxc6c+aLvorB80y8/QfjgmwavUYr
 hW7yCH8Ptmhd2pqmnpKSfMCTmuCGHhVkRwYq6/kyHLccN+AOHfENlEt8uvzZRL7Hkg61
 sqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2cuC+98Wz/R5zt/7ow58bEEKSyaXaZsCkiMl8OCprkE=;
 b=Znh+y2Aaq81lQmPJR2o0Yt5c5wOHKgSZ83AIcK6tGttCxACBFdZDPPRtU1owcKyLLr
 C9lAMzyGYDKTAzUUYwHN1y68qHrm3sPsCQjWEJ/UODSCw7N7aRuOyjUTUJJW3XH+3f2P
 jZFVEki4wJ2ZmiMJaEfV8zHFu2W7YSJYALtAuXJ5xLrBIqj8bV2YGCqv7CGzDti27mk5
 c1XxcTGHFu/MIbmfHFrXzGR1nUv4b6wBuIqA4nLxnnxA876As12aruOC701i5OFe/giO
 gKCxoALlGMN2ctDPMqIBlm7GpX+D3l7P36ynmfisUw8B7dDogv851Qg7HzGG22lcYR5w
 DXZA==
X-Gm-Message-State: AOAM533h0edMV6tmQ19L+lPZ+FmMvnjQuSD1ikEAVV/3q56xFrdtMDh4
 wlPQPal+3YDtVCk3WuvYDLSNxXrWsSV7uIgED5Y=
X-Google-Smtp-Source: ABdhPJy71AiIShdMpx+l46Nc23kuqAJNjaR7Xrh6Oy6bBXCPUrQX2siVh2ONo++YPMSAGx/ZDUQFV44lAQxxEXhUwfM=
X-Received: by 2002:a05:6602:1c6:b0:657:2c41:7d0 with SMTP id
 w6-20020a05660201c600b006572c4107d0mr1316200iot.31.1650500065239; Wed, 20 Apr
 2022 17:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
 <20220315065529.62198-3-bmeng.cn@gmail.com>
 <CAKmqyKMoRqbfSsUNM1O1cQGHaL9rc6fsCqJxEktQNrgrLCimgA@mail.gmail.com>
 <CAEUhbmX0SdEcD8UWJUmmPm2SubT6gd991jNMAZJA8WFbRsdoaQ@mail.gmail.com>
 <CAEUhbmVrUMS638bbA+pnoHgeQdRc9KkBGb21wXD+2A8=RHbqwA@mail.gmail.com>
 <CAKmqyKMUP8QL=D781FnOjDrLXBxor5Qz5uG35cCw=C7aOLh2Ww@mail.gmail.com>
 <CAEUhbmV5xDOYFUp=FidQnR8rOU9pM1=5Zo3TDKgEyOUDFeu2LQ@mail.gmail.com>
In-Reply-To: <CAEUhbmV5xDOYFUp=FidQnR8rOU9pM1=5Zo3TDKgEyOUDFeu2LQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Apr 2022 10:13:59 +1000
Message-ID: <CAKmqyKNmU6wMwHHPEQKotVTOub+DVcQd4LNFiV2npCKMn182ew@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] target/riscv: machine: Add debug state description
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Thu, 21 Apr 2022 00:14:30 -0000

On Thu, Apr 21, 2022 at 9:47 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Thu, Apr 21, 2022 at 6:45 AM Alistair Francis <alistair23@gmail.com> w=
rote:
> >
> > On Wed, Apr 20, 2022 at 7:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi Alistair,
> > >
> > > On Wed, Apr 20, 2022 at 3:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > On Wed, Apr 20, 2022 at 3:31 PM Alistair Francis <alistair23@gmail.=
com> wrote:
> > > > >
> > > > > On Tue, Mar 15, 2022 at 5:17 PM Bin Meng <bmeng.cn@gmail.com> wro=
te:
> > > > > >
> > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > >
> > > > > > Add a subsection to machine.c to migrate debug CSR state.
> > > > > >
> > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > ---
> > > > > >
> > > > > > (no changes since v2)
> > > > > >
> > > > > > Changes in v2:
> > > > > > - new patch: add debug state description
> > > > > >
> > > > > >  target/riscv/machine.c | 32 ++++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 32 insertions(+)
> > > > > >
> > > > > > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > > > > > index 5178b3fec9..4921dad09d 100644
> > > > > > --- a/target/riscv/machine.c
> > > > > > +++ b/target/riscv/machine.c
> > > > > > @@ -216,7 +216,38 @@ static const VMStateDescription vmstate_kv=
mtimer =3D {
> > > > > >          VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> > > > > >          VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> > > > > >          VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> > > > > > +        VMSTATE_END_OF_LIST()
> > > > > > +    }
> > > > > > +};
> > > > > > +
> > > > > > +static bool debug_needed(void *opaque)
> > > > > > +{
> > > > > > +    RISCVCPU *cpu =3D opaque;
> > > > > > +    CPURISCVState *env =3D &cpu->env;
> > > > > > +
> > > > > > +    return riscv_feature(env, RISCV_FEATURE_DEBUG);
> > > > >
> > > > > This fails to build:
> > > > >
> > > > > ../target/riscv/machine.c: In function =E2=80=98debug_needed=E2=
=80=99:
> > > > > ../target/riscv/machine.c:228:31: error: =E2=80=98RISCV_FEATURE_D=
EBUG=E2=80=99
> > > > > undeclared (first use in this function); did you mean
> > > > > =E2=80=98RISCV_FEATURE_EPMP=E2=80=99?
> > > > >  228 |     return riscv_feature(env, RISCV_FEATURE_DEBUG);
> > > > >      |                               ^~~~~~~~~~~~~~~~~~~
> > > > >      |                               RISCV_FEATURE_EPMP
> > > > > ../target/riscv/machine.c:228:31: note: each undeclared identifie=
r is
> > > > > reported only once for each function it appears in
> > > > > ../target/riscv/machine.c:229:1: warning: control reaches end of
> > > > > non-void function [-Wreturn-type]
> > > > >  229 | }
> > > > >      | ^
> > > >
> > > > That's weird. Maybe it's out of sync or merge conflict? I will take=
 a look.
> > > >
> > >
> > > I rebased the v4 series on top of your riscv-to-apply.next branch,
> > > indeed there is a merge conflict of target/riscv/machine.c. After I
> > > resolved the conflict, the build succeeded.
> >
> > Looking at this patch series RISCV_FEATURE_DEBUG is only defined in
> > patch 4, it doesn't currently exist in the tree. I'm not sure how this
> > can build.
>
> Ah, it looks like I should adjust the patch order to have patch 4 come fi=
rst.
>
> >
> > Are you sure you looked at just this patch and not the entire series?
>
> I see. I was looking at the series not this patch.
>
> It seems you were trying to build every commit for bisectabliity? Is
> there an easy way to do such automatically?

Yep, I build test every patch.

I do this automatically with an internal Jenkins server, unfortunately
I can't really share it publically

Alistair

>
> >
> > >
> > > I suspect you missed something during your handling of the merge conf=
lict?
> >
> > That's entirely possible. Can you send a rebased version please
>
> Regards,
> Bin

