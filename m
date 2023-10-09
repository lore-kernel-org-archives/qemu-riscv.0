Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817BBE95A8E
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 02:33:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpg5F-00086l-G1; Sun, 08 Oct 2023 22:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpg5B-00086K-3D; Sun, 08 Oct 2023 22:33:21 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpg57-0005cK-3A; Sun, 08 Oct 2023 22:33:20 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-4577c37392eso171285137.2; 
 Sun, 08 Oct 2023 19:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696818794; x=1697423594; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U6BZPHpxBs8qgIIhZvatgKvhEGa0HTqWhIQeB99lFqI=;
 b=PiBGIoEc16CjVbMJTYt3E440+VD226TmIFe4FvWJkIJwd6GtEGr/jxzHNJNfpUtI6B
 xz2yUrKSc/7CDH0HYK6SREz3TutKILb8C7Zy1bPENdVG7n78YhxFBCufOF34rRWHsU8C
 OMnjWnnUQK6sNOwANhUxxUD/mA7r2fskNUUppnvfRpL1iq/LGdwlFAxMtvSit9wnErEd
 lZAIv+tdhXXq/nOPrCHV2cj6C8d8WScV7ul3yjclcIAUR/AGmKVme05BdG3cdvRj/kut
 FilmUBbmlGR98KyrCF7/TwB5nZIGN/seXD3Tg+XvmYlWsqy6R9tBqTzL6eIJi6f+JLF/
 gB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696818794; x=1697423594;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U6BZPHpxBs8qgIIhZvatgKvhEGa0HTqWhIQeB99lFqI=;
 b=O0UYJCYrfVVWor18l0ahGA+jU790wcGjx3u+PBOWZawbVvnrw9Uc0J4oSG4gU2Jfr7
 PqG+fb66EeonvebAi4kEDni+EMckCMgPph+KZ97jn7CVZt0MksuLDMHe9wnx8JFwDUge
 mwICTClv3pTB0sWTqUeYRoZBMwXj+Au/dOpAwwFFlRDaYR+NhLslZo5+3WPia8wtJN1n
 ZypCf3TKyzNSQoXGmGmi42GclAIL4xuOjQDVfWPrBw9vVsy8L7jHijxV3JeQ20Ln4cjf
 hl9ZW/crt0vJGRF7deNL2gsGBiulNUwIvBWahKjVfvuE5KDASEBop8UN10W61gX6Qybc
 UmPQ==
X-Gm-Message-State: AOJu0Ywk5REQwmaqVzsmoQ+NfFGOBz4UFCyaHiuZS97tnn5zAyQ1I1pt
 jwq7soPFMFcnKBPJxXoWrjWZc2+6aLemfNoARkk=
X-Google-Smtp-Source: AGHT+IGaZ0ABzWW3+Vkg40COkuO8LvzrmqYXON0JcK6K58zRsUKfMNo17JMi0xT83FjmV+3bjCjoPOGjC+CeL3FfvX4=
X-Received: by 2002:a67:f117:0:b0:452:cfeb:1607 with SMTP id
 n23-20020a67f117000000b00452cfeb1607mr12566007vsk.5.1696818794536; Sun, 08
 Oct 2023 19:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230926194951.183767-1-dbarboza@ventanamicro.com>
 <ZRarBuEeBi7WkS6K@redhat.com>
 <e5342929-506a-ce75-34fa-204ad0970ee2@ventanamicro.com>
 <ZRa7O67ZTukOq5GL@redhat.com>
 <b6256c0e-5000-2af1-5ffa-caae55d9f694@ventanamicro.com>
 <ZRbIqHuefKCBNudv@redhat.com>
In-Reply-To: <ZRbIqHuefKCBNudv@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Oct 2023 12:32:47 +1000
Message-ID: <CAKmqyKP9_rogNwRW2bY_skL8=-=nO5oHe=yyN1NvxxhRr9QCig@mail.gmail.com>
Subject: Re: [PATCH 0/6] riscv: RVA22U64 profile support
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Sep 29, 2023 at 10:54=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
>
> On Fri, Sep 29, 2023 at 09:49:47AM -0300, Daniel Henrique Barboza wrote:
> >
> >
> > On 9/29/23 08:55, Daniel P. Berrang=C3=A9 wrote:
> > > On Fri, Sep 29, 2023 at 08:29:08AM -0300, Daniel Henrique Barboza wro=
te:
> > > >
> > > >
> > > > On 9/29/23 07:46, Daniel P. Berrang=C3=A9 wrote:
> > > > > On Tue, Sep 26, 2023 at 04:49:44PM -0300, Daniel Henrique Barboza=
 wrote:
> > > > > > Based-on: 20230926183109.165878-1-dbarboza@ventanamicro.com
> > > > > > ("[PATCH 0/2] riscv: add extension properties for all cpus")
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > These patches implements the base profile support for qemu-risc=
v and the
> > > > > > first profile, RVA22U64.
> > > > > >
> > > > > > As discussed in this thread [1] we're aiming for a flag that en=
ables all
> > > > > > mandatory extensions of a profile. Optional extensions were lef=
t behind
> > > > > > and must be enabled by hand if desired. Since this is the first=
 profile
> > > > > > we're adding, we'll need to add the base framework as well.
> > > > > >
> > > > > > The RVA22U64 profile was chosen because qemu-riscv implements a=
ll its
> > > > > > extensions, both mandatory and optional. That includes 'zicntr'=
 and
> > > > > > 'zihpm', which we support for awhile but aren't adverting to us=
erspace.
> > > > > >
> > > > > > Other design decisions made:
> > > > > >
> > > > > > - disabling a profile flag does nothing, i.e. we won't mass dis=
able
> > > > > >     mandatory extensions of the rva22U64 profile if the user se=
ts
> > > > > >     rva22u64=3Dfalse;
> > > > >
> > > > > Why shouldn't this be allowed ?
> > > > >
> > > > > IIUC, a profile is syntactic sugar for a group of features. If
> > > > > we can disable individual features explicitly, why should we
> > > > > not allow use of the profile as sugar to disable them en-mass ?
> > > >
> > > > In theory there's no harm in allowing mass disabling of extensions =
but, given
> > > > it's a whole profile, we would end up disabling most/all CPU extens=
ions and
> > > > the guest would do nothing.
> > >
> > > True, that is just user error though.  They could disable a profile
> > > and then manually re-enable individual features, and thus get a
> > > working system.
> > >
> > > > There is a thread in the ML:
> > > >
> > > > https://lore.kernel.org/qemu-riscv/CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxj=
UFHHWjmoQEP6unRrHNA@mail.gmail.com/
> > > >
> > > > Where we discussed the possibility of having a minimal CPU extensio=
n set. We didn't
> > > > reach a consensus because the definition of "minimal CPU extension =
set" vary between
> > > > OSes (Linux requires IMAFD, FreeBSD might require something differ)=
.
> > > >
> > > > Assuming we reach a consensus on what a minimal set is, we could al=
low disabling mass
> > > > extensions via probile but keeping this minimal set, for example. A=
t very least we
> > > > shouldn't allow users to disable 'I' because that would kill the CP=
U, so RV64I is
> > > > the minimum set that I would assume for now.
> > >
> > > I'd probably just call that user error too.
> > >
> > > > >
> > > > > TL;DR: feature groups are pretty error prone if more than
> > > > > one is listed by the user, or they're combined with individual
> > > > > features.
> > > > >
> > > > > >
> > > > > > - profile support for vendor CPUs consists into checking if the=
 CPU
> > > > > >     happens to have the mandatory extensions required for it. I=
n case it
> > > > > >     doesn't we'll error out. This is done to follow the same pr=
erogative
> > > > > >     we always had of not allowing extensions being enabled for =
vendor
> > > > > >     CPUs;
> > > > >
> > > > > Why shouldn't this be allowed ?
> > > >
> > > > There's no technical reason to not allow it. The reason it's forbid=
 is to be
> > > > closer to what the real hardware would do. E.g. the real hardware d=
oesn't allow
> > > > users to enable Vector if the hardware doesn't support it. Vendor C=
PUs also has
> > > > a privileged spec restriction as well, so if a CPU is running in an=
 older spec
> > > > it can't enable extensions that were added later.
> > >
> > > Real hardware is constrained in not being able to invent arbitrary
> > > new features on chip. Virtual machines  are not constrained, so
> > > I don't think the inability of hardware todo this, is an especially
> > > strong reason to limit software emulation.

I think exposing flexibility in vendor CPUs just creates confusion.

As a user if I start QEMU with "-cpu company-cpu" then I am expecting
to get an emulation of company-cpu.

> > >
> > > What I don't like about this, is that (IIUC) the '$profile=3Don' opti=
on
> > > now has different semantics depending on what CPU it is used with.
> > >
> > > ie  using it with a vendor CPU,   $profile=3Don  becomes an assertion
> > > that the vendor CPU contains all the features needed to satisfy
> > > $profile. It won't enable/disable anything, just check it is present.
> > >
> > > With a non-vendor CPU, using $profile=3Don becomes a mechanism to for=
ce
> > > enable all the features needed to satisfy $profile, there is no
> > > mechanism to just check for presence.
> > >
> > > Having two different semantics for the same syntax is generally consi=
dered
> > > bad design practice.
> > >
> > > This points towards supporting a tri-state, not boolean. $profile=3Dc=
heck
> > > for validation only, and $profile=3Don for force enablement.
> >
> > This would leave us with:
> >
> > - $profile=3Doff =3D> disable all extensions. Let users hit themselves =
in the foot if they
> > don't enable any other extensions. Note that disabling a profile and en=
abling extensions
> > on top of it is very sensitive to left-to-right ordering, so it would b=
e good to have
> > a way to enforce this ordering somehow (feature groups always first);
>
> It is also order sensitive if 2 profiles have overlap in the
> extensions they represent. So might also require an ordering
> of profiles themselves to be defined if you permit multiple
> profiles.
>
> If we dont want to think about this immediately that, then
> we should make $profile=3Doff into a fatal error rather than
> silently ignoring it

I think that makes sense.

I think we can be pretty strict on profiles options. To me it seems
reasonable to say a user can enable **one** profile. Once that profile
is enabled they get all of those extensions.

If possible/simple we can then allow them to manually enable and/or
disable extensions on top of that. I don't see any use in allowing
users to turn profiles "off" though. I'm not even clear what that
means.

Alistair

>
> > - $profile=3Don =3D> only valid for generic CPUs;
> >
> > - $profile=3Dcheck -> valid for all CPUs, would only check if the CPU i=
mplements the profile.
> >
> >
> > I think this is fine. Drew, care to weight in?
>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>
>

