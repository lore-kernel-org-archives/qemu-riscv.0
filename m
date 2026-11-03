Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12341606A326
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 18:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJsshXX3
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOIwP-0008St-Dj; Tue, 03 Nov 2026 13:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOIwN-0008S0-KL
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 13:08:59 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOIwL-0001gl-9p
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 13:08:59 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6b1afcd2d23so6537366a12.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2026 10:08:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793729335; cv=none;
 d=google.com; s=arc-20260327;
 b=b0iLrfVIymdQgctNyuQ1vYDpWuT44X5YTgXS4YILceBVO5xlkBxsI+fhSwrSJM6B+F
 kZtnYl3SgYbeI6uYaHBswp4dOAWhMXGl0Na/asBkB+zXU3OOJpX5TvAtnCqruHGUNiGJ
 jN1XpvLEnx1l9b0ooSAzPvhWrNJ7vjvGsIc3j2eA9gi2tKW4hZfsaAp74xf58EobzYYY
 Db+J8HJrDVqmWjjQrlZv+icSmN9txOn1mhlKph/DCppZ9HyVb5WyF1QHITq6kG5xNTJ/
 iMksUCUrmoDP4VuREMOirPVU0sNkDE92F6JmjOIA5dx1Bl2yNhdWMZ7m+naVVWc355Vh
 2MwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=BJey1qLpGncca5aTW0VYBYvYOxSWgotKBUYp0cXl14Y=;
 fh=Y6AtDLtz9pl5Z32/Fk6qb8D9+i7bX5pJj8z5lcIwibA=;
 b=LJyLiJasiarUN1BL4ELB15kPgoUkSTK0CnaNGYXebYUe+mol7kyjEI6PPIjRhYdtL+
 5Oc82vBeee++CaEsMhcw/3QajT1csSnROwr5G5GSptv4EAkOmogWacMIYgWq0RZM0GWk
 0Zcv7zh9O/PrE+UKGFcS3GSltL3kA0vN0d2HJ4sWCHw3HjIVxeZa0thJ9BFV1DyM0ymV
 Kkk/Ik9R+wlz9bTlcKSVn5QcDuWD2ctMAQ844yViUJv7ckJSBpWA/P2BLuTdzQvNOc++
 firABOAuv45wx3NGouNYZyrWu5muuYqm6MllrGrR8dohfteXhTAiAsnxt+TjQWBjtudm
 5MEw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793729335; x=1794334135; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=BJey1qLpGncca5aTW0VYBYvYOxSWgotKBUYp0cXl14Y=;
 b=rJsshXX34x3MmE48v1NSvwaM0bNZEm4m4Z4rrxcW7caqLmS/w52tvfcimiPFTgkrwt
 LrTQ4+4vJIQHld7jc0Fohgc/z2Kx6JaE/l/Us9TvPOp1pdCYz8zEgLc3OyGKs4ra6PHt
 mN2KpsYU/gv/2u590gDM12KXPNYb+vtofHFPyjZHS2Ty/UdJHxuCJrgJ80TTjREZUedh
 7n1e2E1OBvWJdefUDdf3wjiToLsmNqC/B9XgbHTsnmlC2DrH0uWh2VG7Vf8JvI51cFaK
 2LoWkRAnDlTltyX+VGeGfMXsKQwWPQKwvaegQrYibzLsqf0JczyF05CxE1NjcWROzdbW
 7EwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793729335; x=1794334135;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BJey1qLpGncca5aTW0VYBYvYOxSWgotKBUYp0cXl14Y=;
 b=iKXbhZVm66ZeTJQ+yXhQgd9gDePPHk/er3YpfrhUIisiVujmaYT9yapFTdIAKeCXGG
 cqcrTwCR15m900VEhJ4xe+uWbL6GCjwveEp5OWuuF6y9sKfyc1I7gtt8LgXAqcOpgMzO
 rL8nYt5422KSK0HdIKmf0FnizyvtOFOwci0qTD1qf4L8DzEjV948jHkKAGu19L1V1BWN
 ja93fWLm5z0Q/Ino+Vgc/qpNc4+SvO8vy5tPr+aaJVkhD7HkuwFHa7sg+IKHGJcwQb/U
 g/wetA7k6aybp4AnzbETi+JKv5cZ9a8qpHpnnAnKxPztsnufPNHdWNd1EuB6D6gPqgUN
 f95A==
X-Forwarded-Encrypted: i=1;
 AKwUvBws7PTbPQbq3fz1U1bw8TGnP2Jx+x/yBwLx/1bYTXxeVn9MR5Yu5WzocVvU8KVrDVJhn4A142qMBbhQ@nongnu.org
X-Gm-Message-State: APuU4Z9P19JuA3dimcG3ODhgbFyQDO8hY6VcVOxKICEjRN9N4H4jI0Bd
 X1pqUK58nzGyf2jGOOIvIMJUmvuNFmieWhosauL+JDT+fUDLtNTJ4lnYAtYYZSrxxgr5GTmzquo
 jwqGWwApgohR4vmkYamh5lZ4gbQT0XOs=
X-Gm-Gg: AYBFou0sxybcdzpYMQwLrXzycx0zyw/W7u8BxGzzrzL91+vpD7O3KYHYAu80ktEtDqB
 NSvooqz8TgPoVlmAEYANDsXqqtpRYDBp/RxkyJXsl9+fvFQ75jjWyw4Ky4+NIdw6MJ6sPJLWnDJ
 ZwdTBShfS+YIdijCjg3vw3QXsE44S+AufyBQbSYEBJfWqx1JJxMR2xNac90MwJ4aRSIxGknv/t2
 gEQgnprEFCwXEnn3xEMIjZmYGhwmS1+HegOUfAxq2rORJNpcT8HTDNFrFXUPzE2Gg8k8Kc1ZL17
 c8G2LWp6wYc74FT82NLyfMMxjzSkXTuc37E2DF6zDZqvBzE7r2k2mKFQ93R1qFsKqkc9IzQcJ1g
 8mQZ/frjhWJlvw/0Vrr+6p1p7FW5etVFvJSQNbg==
X-Received: by 2002:a05:6402:5009:b0:6b4:d731:4bf3 with SMTP id
 4fb4d7f45d1cf-6b4d7315217mr10362792a12.41.1793729335335; Tue, 03 Nov 2026
 10:08:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
 <aumYOBw-nKQAWdYK@redhat.com>
 <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
 <54851326-3627-2b86-57d6-c338ed4e4b50@eik.bme.hu>
 <CAE2XoE_P2mZAT8wZwzFsTqJTK8nxNSSqJRrOM2T-AJkQjwJHBw@mail.gmail.com>
 <aunnuwhsx9ZOOXBX@redhat.com>
In-Reply-To: <aunnuwhsx9ZOOXBX@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 4 Nov 2026 02:08:41 +0800
X-Gm-Features: AclHuK8P6bHHgBWP0bpAQALyo5aHjtSP7ofvKj-lRIfhjZfCfQMKs0HHJgLdFgo
Message-ID: <CAE2XoE9Kj+C3JLvWMzuGLbBsaFY4KQMhxnwLNwAAhzRmZAFj9w@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org, 
 Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, 
 Antony Pavlov <antonynpavlov@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org, 
 Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 9:55=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Tue, Nov 03, 2026 at 09:48:44PM +0800, Yonggang Luo wrote:
> > On Tue, Nov 3, 2026 at 9:23=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.=
hu> wrote:
> > >
> > > On Tue, 3 Nov 2026, Yonggang Luo wrote:
> > > > On Tue, Nov 3, 2026 at 4:16=E2=80=AFPM Daniel P. Berrang=C3=A9 <ber=
range@redhat.com> wrote:
> > > >>
> > > >> On Fri, Oct 30, 2026 at 05:51:44PM -0800, Pierrick Bouvier wrote:
> > > >>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> > > >>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
> > > >>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo an=
d the
> > > >>>>> type_init
> > > >>>>> function that calls type_register_static(). A later change need=
s to
> > > >>>>> pass a
> > > >>>>
> > > >>>> That's the point of the macro to hide the boiler plate code.
> > > >>>>
> > > >>>>> target mask into that registration, and the macros have no para=
meter
> > > >>>>> for it.
> > > >>>>
> > > >>>> Couldn't you just change the macros to take that parameter inste=
ad of
> > > >>>> expanding it everywhere?
> > > >>>>
> > > >>>
> > > >>> Problem of macros is that they don't have default parameters, so =
you
> > > >>> need variants for everything:
> > > >>>
> > > >>> DEFINE_MACHINE
> > > >>> DEFINE_MACHINE_EXTENDED
> > > >>> DEFINE_MACHINE_WITH_INTERFACES
> > > >>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> > > >>> and now would need a new variant, with variant for other existing=
 ones.
> > > >>>
> > > >>> In the end, it's just simpler to remove this and add the boilerpl=
ate.
> > > >>> It's written once and never modified, so using a macro just save =
typing
> > > >>> those lines once.
> > > >>
> > > >> For each machine, it is only written once, but we add machines
> > > >> over time, and every time a new machine is added the code style
> > > >> is slightly different. We introduced all the variuos DEFINE_*
> > > >> macros for QOM to better ensure consistent style and usage as
> > > >> new code is added over time.
> > > >
> > > > I understand that the DEFINE_* macros are bloating because of this.
> > > > Indeed currently the only two macros used are "DEFINE_MACHINE" and
> > > > "DEFINE_MACHINE_EXTENDED"
> > >
> > > There are a few machines using some others but these are the most use=
d.
> > > That suggests maybe we should change the convenience wrappers to matc=
h
> > > what machines need but DEFINE_MACHINE_EXTENDED is meant to be the one=
 that
> > > allows all parameters which should be rarely needed.
> > >
> > > > ; each time people want to add a new attribute, the macros is twice=
d.
> > >
> > > Not necessarily. The SECURE parameter did that to preserve previous
> > > behaviour but if you add new parameter changing all callers (which is=
 the
> > > same as expanding the macro that would also change all callers) then =
it's
> > > just a new parameter added not changing the number of DEFINE_MACHINE*
> > > wrappers. Rearranging the wrappers to make DEFINE_MACHINE_EXTENDED us=
ed
> > > less is an independent change.
> > >
> > > > And the usage of DEFINE_MACHINE_EXTENDED is rare and can be replace=
d
> > > > with DEFINE_TYPES or TypeInfo
> > > > and be more explicit. When we used as macro parameter, we need thin=
k
> > >
> > > But that defies the purpose of hiding the QOM boiler plate as much as
> > > possible. New people are confused by QOM and it's easier for them to =
look
> > > up documentation on the DEFINE_MACHINE* macros to see what parameter =
is
> > > what and not care about how it's stored in QOM TypeInfo or what is th=
at
> > > at all.
> > >
> > > > what's that parameter means, and for
> > > > TypeInfo, we can directly know what that member is about(because we
> > > > are assigned with the member name).
> > >
> > > The parameter also has a name and documentation so it's not simpler t=
o
> > > look up TypeInfo than look at the macro definition or docs. In fact i=
t's
> > > harder to guess from TypeInfo as then you also need to get into QOM.
> > >
> > > > That's why I suggest keeping a single DEFINE_MACHINE, just like
> > > > DEFINE_TYPES; as they are the most
> > > > used macros(and simple enough), and won't suffer from changes much.
> > >
> > > That means exposing all the boiler plate for all machines other than =
the
> > > simplest case. I think it would be better to keep DEFINE_MACHINE_EXTE=
NDED
> > > but maybe rethink the existing wrappers and drop unused ones and mayb=
e add
> > > new ones that reduce the usage of DEFINE_MACHINE_EXTENDED but still k=
eep
> > > the boiler plate hidden.
> >
> > Thanks, I'll go this way, remove unused macros, and keep DEFINE_MACHINE=
_EXTENDED
> > and extend both DEFINE_MACHINE_EXTENDED DEFINE_MACHINE supports
> > "targets" or "arch_mask" parameter.
>
> Given that we don't need to do general per-arch type filtering in
> QOM, we could just move 'is_available' out of TypeInfo, and into the

Hi Daniel,
The "is_available" is used for dealing with the QOM name conflict,
that is before the calling
to MachineClass call or any other class_init.

> MachineClass, so it is a regular class level property, which can be
> set in the class_init methods, and thus avoid any changes to the
> DEFINE_MACHINE macros.
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

