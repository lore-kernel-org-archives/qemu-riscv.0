Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh4qP-0000iT-GD
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 03:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nh4qJ-0000f9-JS; Wed, 20 Apr 2022 03:33:43 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:39636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nh4qH-00046J-N5; Wed, 20 Apr 2022 03:33:39 -0400
Received: by mail-yb1-xb30.google.com with SMTP id r189so1338008ybr.6;
 Wed, 20 Apr 2022 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YUIwBqUGCfZ8p/na+o142cAmo/cc9Ag1XD0pLHfJFhk=;
 b=kugsItNQu0NgOG9akD1z5JK+ihqLs3TSBt/ro0PcByhYD2huyp9CqASIWxH56mAt6D
 sjzDSkMpKY2l7PUebI7zbKnl/GQuWJnmXbSclVJ2t2iRy/CTWwrYPBEBp9ME4CcGTrCN
 g0ifT3VvCuIll6IjalouB4O57TPOX3PcT5P1NOj3l3qGe7ttAltGQYKibQbnGNLV62ne
 xpMefoyBrX1vWieK9syS65QVAC8DYoTVuA48xvbCWOPwbbMLx7oBI0zGzeL7qGB3v0+l
 JnxXpniUEPYB7BHWoKrrztLkhee3l8tyY9Ao/dual8dqFXbvC0jk+UgzE6ljjfzPVE37
 uwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YUIwBqUGCfZ8p/na+o142cAmo/cc9Ag1XD0pLHfJFhk=;
 b=gSyq5lXieBw5CGFCBVlBI7MQeOf8fi0LYQTbwgr+ZRoKhYqr2DSbta6vXi9I0ytLhp
 N23oKm0wMsZv5zi8FuDn8QjesD0tnjVHVCxqYl8q8RmZsT+A9vjZTEk9CurCl11/LF7t
 cO18hBAbSPz+GrMAybF1lkSakVb09yAhADzXpzv8/zVowvPB+SJDtiOXktHkuD5CacoK
 jLCWE2C2xA4JtU7FaTYdewYW81rUO6rEsqGF+vC88MKu5B0DCHkvP7cH9zPEl/BqRP6Y
 YZSbqzEHXsfAvwqpRZBi3UTOT/HrVvP9ozczKVvuyQo9KseokWUoKD65jOLVg9L90sYl
 4yYw==
X-Gm-Message-State: AOAM533CjwBj+3NF54negn6nAhWyECi1VC3fZw3H9qZc5ejN/D+w7i9m
 4bCNWA3V5fdmmyXpbWk1Ln76Lk7OqRJymWASaqLy+ZFg
X-Google-Smtp-Source: ABdhPJy7SCo/NVVbXF1KCoUbbktXfylEGunJ3H2gihlxaM8aG4HgYD13ukeIwcCpnuO6qJGfpm+Upt0+MsNWcFHizyI=
X-Received: by 2002:a05:6902:1109:b0:645:58e:a373 with SMTP id
 o9-20020a056902110900b00645058ea373mr13946576ybu.231.1650440016077; Wed, 20
 Apr 2022 00:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
 <20220315065529.62198-3-bmeng.cn@gmail.com>
 <CAKmqyKMoRqbfSsUNM1O1cQGHaL9rc6fsCqJxEktQNrgrLCimgA@mail.gmail.com>
In-Reply-To: <CAKmqyKMoRqbfSsUNM1O1cQGHaL9rc6fsCqJxEktQNrgrLCimgA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 20 Apr 2022 15:33:24 +0800
Message-ID: <CAEUhbmX0SdEcD8UWJUmmPm2SubT6gd991jNMAZJA8WFbRsdoaQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] target/riscv: machine: Add debug state description
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
X-List-Received-Date: Wed, 20 Apr 2022 07:33:43 -0000

On Wed, Apr 20, 2022 at 3:31 PM Alistair Francis <alistair23@gmail.com> wro=
te:
>
> On Tue, Mar 15, 2022 at 5:17 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Add a subsection to machine.c to migrate debug CSR state.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >
> > (no changes since v2)
> >
> > Changes in v2:
> > - new patch: add debug state description
> >
> >  target/riscv/machine.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index 5178b3fec9..4921dad09d 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -216,7 +216,38 @@ static const VMStateDescription vmstate_kvmtimer =
=3D {
> >          VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> >          VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> >          VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static bool debug_needed(void *opaque)
> > +{
> > +    RISCVCPU *cpu =3D opaque;
> > +    CPURISCVState *env =3D &cpu->env;
> > +
> > +    return riscv_feature(env, RISCV_FEATURE_DEBUG);
>
> This fails to build:
>
> ../target/riscv/machine.c: In function =E2=80=98debug_needed=E2=80=99:
> ../target/riscv/machine.c:228:31: error: =E2=80=98RISCV_FEATURE_DEBUG=E2=
=80=99
> undeclared (first use in this function); did you mean
> =E2=80=98RISCV_FEATURE_EPMP=E2=80=99?
>  228 |     return riscv_feature(env, RISCV_FEATURE_DEBUG);
>      |                               ^~~~~~~~~~~~~~~~~~~
>      |                               RISCV_FEATURE_EPMP
> ../target/riscv/machine.c:228:31: note: each undeclared identifier is
> reported only once for each function it appears in
> ../target/riscv/machine.c:229:1: warning: control reaches end of
> non-void function [-Wreturn-type]
>  229 | }
>      | ^

That's weird. Maybe it's out of sync or merge conflict? I will take a look.

Regards,
Bin

