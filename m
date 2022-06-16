Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1y09-0002NM-1y
	for mharc-qemu-riscv@gnu.org; Thu, 16 Jun 2022 18:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1y07-0002M8-1L; Thu, 16 Jun 2022 18:30:07 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1y03-00071w-Mm; Thu, 16 Jun 2022 18:30:06 -0400
Received: by mail-pg1-x529.google.com with SMTP id q140so2459639pgq.6;
 Thu, 16 Jun 2022 15:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gpt1p+FJTQmpPoV5Zh/pGJap/xMtpXm+bfF2VpiyGjs=;
 b=q7wcdMsWqYuVpkpTQC5Zu10xttg4fooCpRwV3uF2qwd3M8lhIJ2W8rRE6NvrtsV1m0
 hqkIAoQh5ZbWeLK+EybUrb5gLm422+M3XBK+rqYtEPwGcEMHprPYUyvKCf/vIOEAKm7P
 IArGCnxht6Q8j3yinDZZGWStpj3LZTzXrqtNovlZNdy02cdVqkYwglJUPdUvL+Mq61xI
 DONCXY0VJ9//0/n7tzQzpb/VEqA2hsvrV6QsrNzs14xYgbY4hbqtRem/K9iTnk5l6WQ8
 eKPqPxO5qj1KxcrK7dp7BighHbKVit4BUJf6w2CrQR1Pj0Sl+K8PI8wSJpssV3YnTzW4
 QNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gpt1p+FJTQmpPoV5Zh/pGJap/xMtpXm+bfF2VpiyGjs=;
 b=2e1l5OiWMTm1YCLtq49XAvVcecB5NbNHZGBvO/UkxlAaclICUnFiPJc8TTiQIn5zGB
 7q1KKGXsUFE89ud3oMyh95HE3DoPfmwQvsgaDDRr/1kfYe9gCjS+L0bnzH207GBNk8TJ
 +Uzcbe0NYTXqhymbFhnzWUdpjUhmH+0AWkbWiCb1bOJIjF2IkBrFnLJD2jAv8HTimZBC
 gPeNl/fbaivGXQty3WoAYXQgoQts7PqAJxEoc+K/6cqWwfW5Po68LwAU2SnJ3XOGSWeX
 SPheg+RcXdRQcmOwjGHQgBzqymg85XKkOfyinDeTqd51UM6sseM3j9D0Ljti5VbViQa/
 oHZA==
X-Gm-Message-State: AJIora/8FH7nVPhWH/9Xf7UfQ4KI0pb1GlaXbwYVWPwLZV2S3V0XvxVG
 gFsRXRbzG85tMgfPJOlRukJSKpAIY3LiZ4kYIh8=
X-Google-Smtp-Source: AGRyM1uj8D0x2mpGCNW5NSR1WmmCBDvogrz18BHq2BfNgZGoNVNTdZgpzZNCoo8i7d2vPY3DPhqM6J2hSv3UBv8FXPk=
X-Received: by 2002:a65:5385:0:b0:3fa:52e3:6468 with SMTP id
 x5-20020a655385000000b003fa52e36468mr6389850pgq.366.1655418601662; Thu, 16
 Jun 2022 15:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <3oq0sqs1-67o0-145-5n1s-453o118804q@syhkavp.arg>
 <CAKmqyKPJ2Pxn8nG3Lwu2rLGuTZyTmGvjWOqbty8C6ayhtd0wqw@mail.gmail.com>
 <o8p9829n-58n8-o38o-r533-p2q056pq65p@syhkavp.arg>
In-Reply-To: <o8p9829n-58n8-o38o-r533-p2q056pq65p@syhkavp.arg>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Jun 2022 08:29:34 +1000
Message-ID: <CAKmqyKNBhJdRZfGWFFZmNYxHw9TCtaZ563g2501CqRz2Ct7nOg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/pmp: guard against PMP ranges with a
 negative size
To: Nicolas Pitre <nico@fluxnic.net>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Thu, 16 Jun 2022 22:30:07 -0000

On Thu, Jun 16, 2022 at 10:20 PM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Thu, 16 Jun 2022, Alistair Francis wrote:
>
> > On Thu, Jun 16, 2022 at 7:12 AM Nicolas Pitre <nico@fluxnic.net> wrote:
> > >
> > > For a TOR entry to match, the stard address must be lower than the en=
d
> > > address. Normally this is always the case, but correct code might sti=
ll
> > > run into the following scenario:
> > >
> > > Initial state:
> > >
> > >         pmpaddr3 =3D 0x2000       pmp3cfg =3D OFF
> > >         pmpaddr4 =3D 0x3000       pmp4cfg =3D TOR
> > >
> > > Execution:
> > >
> > >         1. write 0x40ff to pmpaddr3
> > >         2. write 0x32ff to pmpaddr4
> >
> > Hey, thanks for that patch!
> >
> > So, at this point we have a PMP region enforcing
> >
> > 0x40ff <=3D addr < 0x32ff
> >
> > which is going to be wrong as that isn't valid. But this is also
> > partially a guest bug. If a guest sets invalid PMP regions we should
> > be throwing exceptions (if the PMP region is enabled and enforced in
> > the current mode)
>
> The guest cannot change all the relevant PMP registers for a single PMP
> entry atomically. This is why you normally update the PMP configuration
> in m-mode with MPRV unset for invalid but transient PMP states to have
> no adverse effects.
>
> > >         3. set pmp3cfg to NAPOT with a read-modify-write on pmpcfg0
> > >         4. set pmp4cfg to NAPOT with a read-modify-write on pmpcfg1
> > >
> > > When (2) is emulated, a call to pmp_update_rule() creates a negative
> > > range for pmp4 as pmp4cfg is still set to TOR. And when (3) is emulat=
ed,
> >
> > I don't see where the negative comes from. From what I can tell we
> > should just set `sa` and `ea` to the values specified by the guest.
>
> Eventually that is the case i.e. when the type is changed from TOR to
> NAPOT in (4), at which point everything is well and sane. But that can't
> happen atomically as I said. Yet QEMU does interpret the intermediate
> state although it shouldn't.
>
> > > a call to tlb_flush() is performed, causing pmp_get_tlb_size() to ret=
urn
> > > a very creatively large TLB size for pmp4. This, in turn, may result =
in
> >
> > Hmm.. pmp_get_tlb_size() assumes pmp_ea > pmp_sa. Maybe we should add
> > a check in there?
>
> It is more efficient to prevent sa > ea in the first place as
> pmp_get_tlb_size() is called way more often than pmp_update_rule_addr().
>
> Let's not forget that those sa/ea are simplified representations of the
> hardware and not what the guest can see. The original register content
> written by the guest is preserved.
>
> > > accesses to non-existent/unitialized memory regions and a fault, so t=
hat
> > > (4) ends up never being executed.
> > >
> > > This is in m-mode with MPRV unset, meaning that unlocked PMP entries
> > > should have no effect. Therefore such a behavior based on PMP content
> > > is very unexpected.
> >
> > Ok, this part is a QEMU bug. If we aren't enforcing PMP regions we
> > should not be throwing PMP errors.
>
> Right. But this is not a PMP error. It is QEMU screwing up its internal
> state. It does even segfault when this condition occur if -d cpu is
> provided.
>
> > get_physical_address_pmp() should give us full permissions though in
> > this case, so I don't see where the failure is.
>
> And it does. That's not where the problem is.
>
> > Can you include some more details?
>
> As I said, in the middle of updating the pmpcfg registers in (3),
> tlb_flush() is invoked which causes the core to revalidate its memory
> TLB cache down through pmp_get_tlb_size() where bad answers are
> returned. This causes the core to assume a different memory area which
> doesn't exist and the next memory access ends up calling
> unassigned_mem_accepts() where false is unconditionally returned. And I
> suspect this is also the result of a buffer overflow as the address
> logged in memory_region_access_valid() is sometimes complete garbage
> too, and the occasional QEMU segfault.
>
> > > Make sure no negative PMP range can be created, whether explicitly by
> > > the emulated code or implicitly like the above.
> > >
> > > Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> > >
> > > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > > index 151da3fa08..ea2b67d947 100644
> > > --- a/target/riscv/pmp.c
> > > +++ b/target/riscv/pmp.c
> > > @@ -167,6 +167,9 @@ void pmp_update_rule_addr(CPURISCVState *env, uin=
t32_t pmp_index)
> > >      case PMP_AMATCH_TOR:
> > >          sa =3D prev_addr << 2; /* shift up from [xx:0] to [xx+2:2] *=
/
> > >          ea =3D (this_addr << 2) - 1u;
> > > +        if (sa > ea) {
> > > +            sa =3D ea =3D 0u;
> > > +        }
> >
> > This doesn't seem right though.
> >
> > Image if a guest sets the values you have above, then jumps to user
> > mode. The spec doesn't seem to say what should happen with invalid PMP
> > ranges, but I feel like we should throw exceptions instead of just
> > ignoring the config.
>
> The spec says that a given memory access has to be >=3D the bottom
> boundary and < the top boundary for a PMP entry to match. So an invalid
> PMP entry should simply not match. That's what a hardware comparator
> would do: it would just not match. Furthermore, you cannot tell if the
> guest is in the middle of updating its PMP configuration which are split
> across several registers as illustrated above, therefore transient
> invalid states are unavoidable.

Good point, also I just found this in the spec:

"If pmpaddri=E2=88=921 =E2=89=A5 pmpaddri and pmpcfgi .A=3DTOR, then PMP en=
try i matches
no addresses." so it clearly should not match then.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
>
> Nicolas

