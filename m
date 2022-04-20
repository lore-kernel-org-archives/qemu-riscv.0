Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh70a-0001vm-CK
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 05:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nh70Y-0001sj-6E; Wed, 20 Apr 2022 05:52:22 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nh70W-0000JH-JS; Wed, 20 Apr 2022 05:52:21 -0400
Received: by mail-yb1-xb33.google.com with SMTP id s33so1837721ybi.12;
 Wed, 20 Apr 2022 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iBK2bOUxv5gHrSa+JvDoseXoWah8GcHSYbLTQK8S7Lk=;
 b=gy0FZCiZQ7aqJGQAqi5L+U9KBnzh1vAzDQSMEPYHX50HbKe8SYQSU0+txE6lnRpXHg
 jr/pVGRanFKIy/UIuLXljfnoZbi7su0MQLcmw21ugVgbOQPJaLrPQw0xrzV8+70LxBjC
 RGYzs11KaJeDDDkRFj37xwCTovPtSTaVAaAh9NX6i/zH3fVGutUBVqi+NGovggB1rAqL
 UnNRSDubnet+QEbzSZj7G5vvyFmRTxi5u2Tdtw2I6wDpEbgPTNxUpQTFIAtk0ocoffj0
 uYUmtWMqKjCAZfghp0uv2k9uJq8x/m3plaWEz+jNoAl24Pa7KSQN13kJpBExyCckfYLm
 x47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iBK2bOUxv5gHrSa+JvDoseXoWah8GcHSYbLTQK8S7Lk=;
 b=2q0K0l038F6vlphIQIE2Mx40ryQUexEzLXfBhh12vsuxzPSx6Sx/GwH9fo6549EbvQ
 RvjcHkUPPsUIRfI8bhbfwsz9a2r0AqdYAHye6X0V4z74+xDcUQOCvGpTEd55GXAaKQFP
 jOPndC4twG/SwRRiKkEsgZfx8dNINgxKvsbYoEY1MxWbuXQTh3u+wFdhwXIDVbXyMZN1
 oeXaZA71Zx6DXKagahtz0Q3p/0509OCTwhzIlC8b6M+KbGWMU6VYyPTZ0nqvSoIDccc0
 pI+D8lXFDTv9DWsSaGmUn27nIfu1Y+Ryv2AQUD6HsbeLVyl1PSbhsbuSrIWEZanj3xot
 w/+A==
X-Gm-Message-State: AOAM5309NDAZWf6nTSrVyDiabBL/6XxDX3qZimvLsoiwiAjCnPJdUcQ0
 KVKGT8gUhNePTcsrgFaoP5LP1VTk51MwACJr6fo=
X-Google-Smtp-Source: ABdhPJxgF6IPPm2zd5IIiW4RUXexBET3rah7VgIgdKkLJ1KesZPqVJF1OlTp7h1XJEWicSke3aZaRWon4HIjIrP+Qdg=
X-Received: by 2002:a05:6902:1503:b0:644:c443:887f with SMTP id
 q3-20020a056902150300b00644c443887fmr18664384ybu.104.1650448339280; Wed, 20
 Apr 2022 02:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
 <20220315065529.62198-3-bmeng.cn@gmail.com>
 <CAKmqyKMoRqbfSsUNM1O1cQGHaL9rc6fsCqJxEktQNrgrLCimgA@mail.gmail.com>
 <CAEUhbmX0SdEcD8UWJUmmPm2SubT6gd991jNMAZJA8WFbRsdoaQ@mail.gmail.com>
In-Reply-To: <CAEUhbmX0SdEcD8UWJUmmPm2SubT6gd991jNMAZJA8WFbRsdoaQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 20 Apr 2022 17:52:07 +0800
Message-ID: <CAEUhbmVrUMS638bbA+pnoHgeQdRc9KkBGb21wXD+2A8=RHbqwA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] target/riscv: machine: Add debug state description
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
X-List-Received-Date: Wed, 20 Apr 2022 09:52:22 -0000

Hi Alistair,

On Wed, Apr 20, 2022 at 3:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Apr 20, 2022 at 3:31 PM Alistair Francis <alistair23@gmail.com> w=
rote:
> >
> > On Tue, Mar 15, 2022 at 5:17 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Add a subsection to machine.c to migrate debug CSR state.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >
> > > (no changes since v2)
> > >
> > > Changes in v2:
> > > - new patch: add debug state description
> > >
> > >  target/riscv/machine.c | 32 ++++++++++++++++++++++++++++++++
> > >  1 file changed, 32 insertions(+)
> > >
> > > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > > index 5178b3fec9..4921dad09d 100644
> > > --- a/target/riscv/machine.c
> > > +++ b/target/riscv/machine.c
> > > @@ -216,7 +216,38 @@ static const VMStateDescription vmstate_kvmtimer=
 =3D {
> > >          VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> > >          VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> > >          VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> > > +        VMSTATE_END_OF_LIST()
> > > +    }
> > > +};
> > > +
> > > +static bool debug_needed(void *opaque)
> > > +{
> > > +    RISCVCPU *cpu =3D opaque;
> > > +    CPURISCVState *env =3D &cpu->env;
> > > +
> > > +    return riscv_feature(env, RISCV_FEATURE_DEBUG);
> >
> > This fails to build:
> >
> > ../target/riscv/machine.c: In function =E2=80=98debug_needed=E2=80=99:
> > ../target/riscv/machine.c:228:31: error: =E2=80=98RISCV_FEATURE_DEBUG=
=E2=80=99
> > undeclared (first use in this function); did you mean
> > =E2=80=98RISCV_FEATURE_EPMP=E2=80=99?
> >  228 |     return riscv_feature(env, RISCV_FEATURE_DEBUG);
> >      |                               ^~~~~~~~~~~~~~~~~~~
> >      |                               RISCV_FEATURE_EPMP
> > ../target/riscv/machine.c:228:31: note: each undeclared identifier is
> > reported only once for each function it appears in
> > ../target/riscv/machine.c:229:1: warning: control reaches end of
> > non-void function [-Wreturn-type]
> >  229 | }
> >      | ^
>
> That's weird. Maybe it's out of sync or merge conflict? I will take a loo=
k.
>

I rebased the v4 series on top of your riscv-to-apply.next branch,
indeed there is a merge conflict of target/riscv/machine.c. After I
resolved the conflict, the build succeeded.

I suspect you missed something during your handling of the merge conflict?

Regards,
Bin

