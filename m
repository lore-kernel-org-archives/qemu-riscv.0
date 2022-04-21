Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhKYJ-0004aU-7C
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 20:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKYH-0004Zi-P3; Wed, 20 Apr 2022 20:20:05 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:33345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKYG-0006JZ-3U; Wed, 20 Apr 2022 20:20:05 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2eba37104a2so36347967b3.0; 
 Wed, 20 Apr 2022 17:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CtwenFUMAFCKApghsj/U8E4TbVKd1rxwthz554o9TrU=;
 b=SCH09url5UE3m7r1t6k5pKis+ENp2ZlfJAEZEqwIewWB7jR5QQoEajYrT6eeJbod3X
 MGblAVp5wBbZqp7B/PkWbOueu3qnoCU1h7/85aY6v/jAu1vbQTnUyQ8ry3eoiVBR+25e
 +9vdm96KsE+erIPkj0IRev29LpxE72euvpZpZddubhl3/v44YL/q5z/GH5lKtUGNlkom
 tGwtp5WVDK6ldKYpawEvKzXQvP4jFCPUw+YFKDUwDNPD6PB5d6fbzgEFojG02GCa1HX5
 C1OtIMsNMK3Ab7hORbG/f+sHuERmZmBYZwEM4NwHdkINLHGIGue2YMhcyw0Ywyf8JlHC
 gVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CtwenFUMAFCKApghsj/U8E4TbVKd1rxwthz554o9TrU=;
 b=GWxAcJ4i7LqAXMbmCjS0iF044DX7mgpmj0Z06YeH+ttmfIOcD6Kld42sGqYGlorccd
 wDvBGN2C8W0zE+trDML78cd1MyDPd19Iscjc80ey1pkTL8B2/Z4D7tgvyWMlCZgwBCbh
 Jnq119nQTLiTd2bAo+IYSlFLMFizVGDqMh+0mHPKhiYT/qZ0byVKgIss0Exm1Due58hQ
 OQTSjDiT/M/3CeckaWvjbnL66AiVtsFQFAcwDtr4KeVGmevm9LV9N0upCvBs6ZIso2Ww
 UGkS7NwlM3RhDXaMpvzI2e7gSfWNVRN7n9digrg1cqCPMYKBfdcYP1Swryjtf33shAaK
 /DMA==
X-Gm-Message-State: AOAM5313Xzf5sYpcslz2YqfrtfjKxOOAWmPS6MtOE7Pf1eDgnlvZ53Ik
 ZTnVgppkHpr7R+EXdR7RJaPRTpBqmnVc4BD8CBw=
X-Google-Smtp-Source: ABdhPJwt+MOggH6G7jgoNP4bIg44lcpfzStFM4YTu+sHux5n/DmBAUOu194q4Bg8GZ07kHb47VJ+1lPYXFPJd61GGQY=
X-Received: by 2002:a81:1bc3:0:b0:2e3:aa1:f553 with SMTP id
 b186-20020a811bc3000000b002e30aa1f553mr23069717ywb.491.1650500402377; Wed, 20
 Apr 2022 17:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
 <20220315065529.62198-3-bmeng.cn@gmail.com>
 <CAKmqyKMoRqbfSsUNM1O1cQGHaL9rc6fsCqJxEktQNrgrLCimgA@mail.gmail.com>
 <CAEUhbmX0SdEcD8UWJUmmPm2SubT6gd991jNMAZJA8WFbRsdoaQ@mail.gmail.com>
 <CAEUhbmVrUMS638bbA+pnoHgeQdRc9KkBGb21wXD+2A8=RHbqwA@mail.gmail.com>
 <CAKmqyKMUP8QL=D781FnOjDrLXBxor5Qz5uG35cCw=C7aOLh2Ww@mail.gmail.com>
 <CAEUhbmV5xDOYFUp=FidQnR8rOU9pM1=5Zo3TDKgEyOUDFeu2LQ@mail.gmail.com>
 <CAKmqyKNmU6wMwHHPEQKotVTOub+DVcQd4LNFiV2npCKMn182ew@mail.gmail.com>
In-Reply-To: <CAKmqyKNmU6wMwHHPEQKotVTOub+DVcQd4LNFiV2npCKMn182ew@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Apr 2022 08:19:50 +0800
Message-ID: <CAEUhbmVbWUQpKkmqVXXaQ_qo_X5pkMwhSi4t=WV4ORDMu2PSew@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] target/riscv: machine: Add debug state description
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 21 Apr 2022 00:20:06 -0000

On Thu, Apr 21, 2022 at 8:14 AM Alistair Francis <alistair23@gmail.com> wro=
te:
>
> On Thu, Apr 21, 2022 at 9:47 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Alistair,
> >
> > On Thu, Apr 21, 2022 at 6:45 AM Alistair Francis <alistair23@gmail.com>=
 wrote:
> > >
> > > On Wed, Apr 20, 2022 at 7:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > Hi Alistair,
> > > >
> > > > On Wed, Apr 20, 2022 at 3:33 PM Bin Meng <bmeng.cn@gmail.com> wrote=
:
> > > > >
> > > > > On Wed, Apr 20, 2022 at 3:31 PM Alistair Francis <alistair23@gmai=
l.com> wrote:
> > > > > >
> > > > > > On Tue, Mar 15, 2022 at 5:17 PM Bin Meng <bmeng.cn@gmail.com> w=
rote:
> > > > > > >
> > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > >
> > > > > > > Add a subsection to machine.c to migrate debug CSR state.
> > > > > > >
> > > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > > ---
> > > > > > >
> > > > > > > (no changes since v2)
> > > > > > >
> > > > > > > Changes in v2:
> > > > > > > - new patch: add debug state description
> > > > > > >
> > > > > > >  target/riscv/machine.c | 32 ++++++++++++++++++++++++++++++++
> > > > > > >  1 file changed, 32 insertions(+)
> > > > > > >
> > > > > > > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > > > > > > index 5178b3fec9..4921dad09d 100644
> > > > > > > --- a/target/riscv/machine.c
> > > > > > > +++ b/target/riscv/machine.c
> > > > > > > @@ -216,7 +216,38 @@ static const VMStateDescription vmstate_=
kvmtimer =3D {
> > > > > > >          VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> > > > > > >          VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> > > > > > >          VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> > > > > > > +        VMSTATE_END_OF_LIST()
> > > > > > > +    }
> > > > > > > +};
> > > > > > > +
> > > > > > > +static bool debug_needed(void *opaque)
> > > > > > > +{
> > > > > > > +    RISCVCPU *cpu =3D opaque;
> > > > > > > +    CPURISCVState *env =3D &cpu->env;
> > > > > > > +
> > > > > > > +    return riscv_feature(env, RISCV_FEATURE_DEBUG);
> > > > > >
> > > > > > This fails to build:
> > > > > >
> > > > > > ../target/riscv/machine.c: In function =E2=80=98debug_needed=E2=
=80=99:
> > > > > > ../target/riscv/machine.c:228:31: error: =E2=80=98RISCV_FEATURE=
_DEBUG=E2=80=99
> > > > > > undeclared (first use in this function); did you mean
> > > > > > =E2=80=98RISCV_FEATURE_EPMP=E2=80=99?
> > > > > >  228 |     return riscv_feature(env, RISCV_FEATURE_DEBUG);
> > > > > >      |                               ^~~~~~~~~~~~~~~~~~~
> > > > > >      |                               RISCV_FEATURE_EPMP
> > > > > > ../target/riscv/machine.c:228:31: note: each undeclared identif=
ier is
> > > > > > reported only once for each function it appears in
> > > > > > ../target/riscv/machine.c:229:1: warning: control reaches end o=
f
> > > > > > non-void function [-Wreturn-type]
> > > > > >  229 | }
> > > > > >      | ^
> > > > >
> > > > > That's weird. Maybe it's out of sync or merge conflict? I will ta=
ke a look.
> > > > >
> > > >
> > > > I rebased the v4 series on top of your riscv-to-apply.next branch,
> > > > indeed there is a merge conflict of target/riscv/machine.c. After I
> > > > resolved the conflict, the build succeeded.
> > >
> > > Looking at this patch series RISCV_FEATURE_DEBUG is only defined in
> > > patch 4, it doesn't currently exist in the tree. I'm not sure how thi=
s
> > > can build.
> >
> > Ah, it looks like I should adjust the patch order to have patch 4 come =
first.
> >
> > >
> > > Are you sure you looked at just this patch and not the entire series?
> >
> > I see. I was looking at the series not this patch.
> >
> > It seems you were trying to build every commit for bisectabliity? Is
> > there an easy way to do such automatically?
>
> Yep, I build test every patch.
>
> I do this automatically with an internal Jenkins server, unfortunately
> I can't really share it publically
>

Okay, I will send a rebased version, plus fixing the patch order.

Regards,
Bin

