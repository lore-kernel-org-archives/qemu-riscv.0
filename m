Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhJ5F-0001Gx-JW
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 18:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhJ5E-0001GO-Dz; Wed, 20 Apr 2022 18:46:00 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:34801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhJ5C-0001nx-OP; Wed, 20 Apr 2022 18:46:00 -0400
Received: by mail-io1-xd36.google.com with SMTP id i196so3494034ioa.1;
 Wed, 20 Apr 2022 15:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sQF5B/sx/UK8NNmSdSdi1tJIT4cDUaQcK7OnkqBFnRE=;
 b=Sgq+DvumlkXYYIgbbOGJMRR8lFWU9VP98Tqfs2g8e/BxU0F5g6YgdBEfquTvZOW7yH
 /z7iAH5WkmltbEWI12Djdc9LqQyFisw4PCgqYaun2I3zulGdleFTscxb26MxBSc8+TDU
 Cd4oO9H5Dn94i/KcNuAb9VsNE1Lb7Eiw9a/7IzR5vCmLZ7/0iccNDpIt8hatu+Vn7gxu
 lmNE/B6/1yJEfzVn6BQQK4oyIbqATSa0Pz273r4O/6nis4gQV/atyb2s66UK83gjo3mw
 g89SBZE5QW3N60gHKbqeOEIdoeFtCwbqTimfNj/3BUQu2/V3i4SPNSrYZ5kXyYn0CPxJ
 pQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sQF5B/sx/UK8NNmSdSdi1tJIT4cDUaQcK7OnkqBFnRE=;
 b=kJXXeXcrH8ITK7ePniPAvXFa7cJ8sVs+eXTr0BkTABCNvncP1tYYAsR047vAdVmrcO
 FajMnvI4uXuZ/lZe0I5lh3+FjEEhXoxLjJx84La2R46FdX9yLxajL7OOdQi3Bvy9jXq0
 VyYHEU1q2mUHFS5WyN1A5aEdaivdBzUU1t3EdRJGY6YsVNKse3PPq/pW8dWLyn/phYkL
 l5uOx7Vc23alLw+0WBOLso+V8NPkH9qOreEsOA5uLOhaMeVxX4ByvZg5hs4EvDXLBibX
 t+AxQw0SOskZ/HmmWTFwy+c50kRzoFfT6mXGvtouZTJcanhcgxW8I5Zi8l0ECDclrbT9
 M/cQ==
X-Gm-Message-State: AOAM532QFJ87pNIC5ESFDZE1szR5Af7wf0KzcEp72+90LsF8hpTzjD4z
 LXjhOLCLr4T08zibb9kcAyLWtujanM+0c3BAB0ha9W0H320E93iC
X-Google-Smtp-Source: ABdhPJylZEppHjuTPKJNCfjZdZJ4IZ4vrIfAHIAh7Fip7eZo0nL4lCAnkfdMo61TYzjAgW7aAZ7zFuE/5qNMyehJ/lY=
X-Received: by 2002:a5d:948a:0:b0:64d:23a4:9afa with SMTP id
 v10-20020a5d948a000000b0064d23a49afamr9860294ioj.114.1650494757231; Wed, 20
 Apr 2022 15:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
 <20220315065529.62198-3-bmeng.cn@gmail.com>
 <CAKmqyKMoRqbfSsUNM1O1cQGHaL9rc6fsCqJxEktQNrgrLCimgA@mail.gmail.com>
 <CAEUhbmX0SdEcD8UWJUmmPm2SubT6gd991jNMAZJA8WFbRsdoaQ@mail.gmail.com>
 <CAEUhbmVrUMS638bbA+pnoHgeQdRc9KkBGb21wXD+2A8=RHbqwA@mail.gmail.com>
In-Reply-To: <CAEUhbmVrUMS638bbA+pnoHgeQdRc9KkBGb21wXD+2A8=RHbqwA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Apr 2022 08:45:31 +1000
Message-ID: <CAKmqyKMUP8QL=D781FnOjDrLXBxor5Qz5uG35cCw=C7aOLh2Ww@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] target/riscv: machine: Add debug state description
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Wed, 20 Apr 2022 22:46:00 -0000

On Wed, Apr 20, 2022 at 7:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Wed, Apr 20, 2022 at 3:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Wed, Apr 20, 2022 at 3:31 PM Alistair Francis <alistair23@gmail.com>=
 wrote:
> > >
> > > On Tue, Mar 15, 2022 at 5:17 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > Add a subsection to machine.c to migrate debug CSR state.
> > > >
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >
> > > > (no changes since v2)
> > > >
> > > > Changes in v2:
> > > > - new patch: add debug state description
> > > >
> > > >  target/riscv/machine.c | 32 ++++++++++++++++++++++++++++++++
> > > >  1 file changed, 32 insertions(+)
> > > >
> > > > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > > > index 5178b3fec9..4921dad09d 100644
> > > > --- a/target/riscv/machine.c
> > > > +++ b/target/riscv/machine.c
> > > > @@ -216,7 +216,38 @@ static const VMStateDescription vmstate_kvmtim=
er =3D {
> > > >          VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> > > >          VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> > > >          VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> > > > +        VMSTATE_END_OF_LIST()
> > > > +    }
> > > > +};
> > > > +
> > > > +static bool debug_needed(void *opaque)
> > > > +{
> > > > +    RISCVCPU *cpu =3D opaque;
> > > > +    CPURISCVState *env =3D &cpu->env;
> > > > +
> > > > +    return riscv_feature(env, RISCV_FEATURE_DEBUG);
> > >
> > > This fails to build:
> > >
> > > ../target/riscv/machine.c: In function =E2=80=98debug_needed=E2=80=99=
:
> > > ../target/riscv/machine.c:228:31: error: =E2=80=98RISCV_FEATURE_DEBUG=
=E2=80=99
> > > undeclared (first use in this function); did you mean
> > > =E2=80=98RISCV_FEATURE_EPMP=E2=80=99?
> > >  228 |     return riscv_feature(env, RISCV_FEATURE_DEBUG);
> > >      |                               ^~~~~~~~~~~~~~~~~~~
> > >      |                               RISCV_FEATURE_EPMP
> > > ../target/riscv/machine.c:228:31: note: each undeclared identifier is
> > > reported only once for each function it appears in
> > > ../target/riscv/machine.c:229:1: warning: control reaches end of
> > > non-void function [-Wreturn-type]
> > >  229 | }
> > >      | ^
> >
> > That's weird. Maybe it's out of sync or merge conflict? I will take a l=
ook.
> >
>
> I rebased the v4 series on top of your riscv-to-apply.next branch,
> indeed there is a merge conflict of target/riscv/machine.c. After I
> resolved the conflict, the build succeeded.

Looking at this patch series RISCV_FEATURE_DEBUG is only defined in
patch 4, it doesn't currently exist in the tree. I'm not sure how this
can build.

Are you sure you looked at just this patch and not the entire series?

>
> I suspect you missed something during your handling of the merge conflict=
?

That's entirely possible. Can you send a rebased version please

Alistair

>
> Regards,
> Bin

