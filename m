Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhK2Q-00020s-I2
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 19:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhK2L-0001yN-IL; Wed, 20 Apr 2022 19:47:05 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhK2J-0001lf-Sw; Wed, 20 Apr 2022 19:47:05 -0400
Received: by mail-ej1-x62d.google.com with SMTP id u15so6602228ejf.11;
 Wed, 20 Apr 2022 16:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+IuklTWAe4KIRGkQnRPNx8wWZMoXKb83LVk0re0NJSo=;
 b=QRwjfD5Sl/+FzFtiAkaq2knavsd+K701v7spEU8Y/GmhJ0RzLY/ihNArWjeZKfz6k9
 KtW3WQFs3hxjKwJ1anSLIyJHom3QnIjLwnel+vqK9JVwFmVpBvyLchxEw7MyEMDTkkSg
 VXhGzbxo1JHOGqm5/OI4P/Fp13W/BVnUu//hTT9W4xmX8SqQ/Z2R28QSI7yPYcuWMWdS
 7Pnlp3zCC6CL20FBRLaY8shmmDIPTksC2Xiz2U95XYaE9me1jK7ZpDXUZ79QKgD50J+m
 DDEUIFAam3R7YHRek1P1c7xag1TcHnR/P1hwYEqeQTw8TIbvtGqyrF8IEmVeIZdGic4Y
 UaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+IuklTWAe4KIRGkQnRPNx8wWZMoXKb83LVk0re0NJSo=;
 b=v+rz8ifoy/hEKKj1D6MtCuYke8/4veTi7nqbpySaoSUjukYWX3o0Z+Fx1C34ZA69AR
 P8MlSJR2qJeskxkGPMT8vBZbwfEpHpzrYgEe0JXmUg7oS8LnIvpiX8HyRNruzydTdkht
 y8WDsY3HlqFdrCKdvBF7dTK0/x2izrs+mW0wsV77LowjFIkkgR9s+H8CXEGH4W/IwQvT
 WZr/uyxmb3Jh1pXHVxYhCxLnioFLUy+5JlO1GzSfel6gAK4hh4PUsup+t9fCKUoah0F5
 +fzXDLfbO7vZOH1kFumqAF6zmXNMmS6FAFz4a8fM5+4QX1xpVS2rCAeWN4SVk2Wsj6Z6
 2MPA==
X-Gm-Message-State: AOAM531yPsKW4H2Cp+lspo7KAh+Q090202xwmEvLYJOuY5jgsQGuTGNc
 3zGOMP5AcFf2RazDC4a2J3kIGktU8uRGlU7EWpU=
X-Google-Smtp-Source: ABdhPJxKXsISPztDQKZu4sUePBhRzgPcjzYKwvBuMpHbPhYsdJn1BU8zigXM61gSXEZ+D383AsJUUGQ0T7uSinEezEE=
X-Received: by 2002:a17:906:2e8d:b0:6e4:b5fc:e8e6 with SMTP id
 o13-20020a1709062e8d00b006e4b5fce8e6mr8630132eji.215.1650498421451; Wed, 20
 Apr 2022 16:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
 <20220315065529.62198-3-bmeng.cn@gmail.com>
 <CAKmqyKMoRqbfSsUNM1O1cQGHaL9rc6fsCqJxEktQNrgrLCimgA@mail.gmail.com>
 <CAEUhbmX0SdEcD8UWJUmmPm2SubT6gd991jNMAZJA8WFbRsdoaQ@mail.gmail.com>
 <CAEUhbmVrUMS638bbA+pnoHgeQdRc9KkBGb21wXD+2A8=RHbqwA@mail.gmail.com>
 <CAKmqyKMUP8QL=D781FnOjDrLXBxor5Qz5uG35cCw=C7aOLh2Ww@mail.gmail.com>
In-Reply-To: <CAKmqyKMUP8QL=D781FnOjDrLXBxor5Qz5uG35cCw=C7aOLh2Ww@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Apr 2022 07:46:48 +0800
Message-ID: <CAEUhbmV5xDOYFUp=FidQnR8rOU9pM1=5Zo3TDKgEyOUDFeu2LQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] target/riscv: machine: Add debug state description
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62d.google.com
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
X-List-Received-Date: Wed, 20 Apr 2022 23:47:07 -0000

Hi Alistair,

On Thu, Apr 21, 2022 at 6:45 AM Alistair Francis <alistair23@gmail.com> wro=
te:
>
> On Wed, Apr 20, 2022 at 7:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Alistair,
> >
> > On Wed, Apr 20, 2022 at 3:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Wed, Apr 20, 2022 at 3:31 PM Alistair Francis <alistair23@gmail.co=
m> wrote:
> > > >
> > > > On Tue, Mar 15, 2022 at 5:17 PM Bin Meng <bmeng.cn@gmail.com> wrote=
:
> > > > >
> > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > >
> > > > > Add a subsection to machine.c to migrate debug CSR state.
> > > > >
> > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > ---
> > > > >
> > > > > (no changes since v2)
> > > > >
> > > > > Changes in v2:
> > > > > - new patch: add debug state description
> > > > >
> > > > >  target/riscv/machine.c | 32 ++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 32 insertions(+)
> > > > >
> > > > > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > > > > index 5178b3fec9..4921dad09d 100644
> > > > > --- a/target/riscv/machine.c
> > > > > +++ b/target/riscv/machine.c
> > > > > @@ -216,7 +216,38 @@ static const VMStateDescription vmstate_kvmt=
imer =3D {
> > > > >          VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> > > > >          VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> > > > >          VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> > > > > +        VMSTATE_END_OF_LIST()
> > > > > +    }
> > > > > +};
> > > > > +
> > > > > +static bool debug_needed(void *opaque)
> > > > > +{
> > > > > +    RISCVCPU *cpu =3D opaque;
> > > > > +    CPURISCVState *env =3D &cpu->env;
> > > > > +
> > > > > +    return riscv_feature(env, RISCV_FEATURE_DEBUG);
> > > >
> > > > This fails to build:
> > > >
> > > > ../target/riscv/machine.c: In function =E2=80=98debug_needed=E2=80=
=99:
> > > > ../target/riscv/machine.c:228:31: error: =E2=80=98RISCV_FEATURE_DEB=
UG=E2=80=99
> > > > undeclared (first use in this function); did you mean
> > > > =E2=80=98RISCV_FEATURE_EPMP=E2=80=99?
> > > >  228 |     return riscv_feature(env, RISCV_FEATURE_DEBUG);
> > > >      |                               ^~~~~~~~~~~~~~~~~~~
> > > >      |                               RISCV_FEATURE_EPMP
> > > > ../target/riscv/machine.c:228:31: note: each undeclared identifier =
is
> > > > reported only once for each function it appears in
> > > > ../target/riscv/machine.c:229:1: warning: control reaches end of
> > > > non-void function [-Wreturn-type]
> > > >  229 | }
> > > >      | ^
> > >
> > > That's weird. Maybe it's out of sync or merge conflict? I will take a=
 look.
> > >
> >
> > I rebased the v4 series on top of your riscv-to-apply.next branch,
> > indeed there is a merge conflict of target/riscv/machine.c. After I
> > resolved the conflict, the build succeeded.
>
> Looking at this patch series RISCV_FEATURE_DEBUG is only defined in
> patch 4, it doesn't currently exist in the tree. I'm not sure how this
> can build.

Ah, it looks like I should adjust the patch order to have patch 4 come firs=
t.

>
> Are you sure you looked at just this patch and not the entire series?

I see. I was looking at the series not this patch.

It seems you were trying to build every commit for bisectabliity? Is
there an easy way to do such automatically?

>
> >
> > I suspect you missed something during your handling of the merge confli=
ct?
>
> That's entirely possible. Can you send a rebased version please

Regards,
Bin

