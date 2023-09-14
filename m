Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8745AEEAA4F
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:52:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qgnhd-0007kW-WC; Thu, 14 Sep 2023 10:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qgnhb-0007k8-0s
 for qemu-riscv@nongnu.org; Thu, 14 Sep 2023 10:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qgnhY-00033g-Ns
 for qemu-riscv@nongnu.org; Thu, 14 Sep 2023 10:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694703134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yiBzqCGW3nJ7W8ZIl5HIaO8FXzq3oahoaeJsqYkmqf8=;
 b=VPc1wnPSIKJHHcKhVdCPD7dK1T8tcyg7yknHRuLt+ZMgURemz1Hqg8MLwoVIdvW4pHuNqX
 rvt+d92FwTyxkzGwnCZt1kCavyMLkaHtor2tvlCDQILlJBNph+q3kN8Kw60DK8cooJ0y0a
 jHgsHlScWyy4ReB4CuCPSvj/MaV8Vrs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-Plp9L7k9MMSM54T3LIJEOA-1; Thu, 14 Sep 2023 10:52:13 -0400
X-MC-Unique: Plp9L7k9MMSM54T3LIJEOA-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-414f842870dso11474661cf.1
 for <qemu-riscv@nongnu.org>; Thu, 14 Sep 2023 07:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694703132; x=1695307932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yiBzqCGW3nJ7W8ZIl5HIaO8FXzq3oahoaeJsqYkmqf8=;
 b=ahUYMbD43txJjdpJ1uoVaN5g6jmrxi56dwKRenDYKVlTI8rtaeysVapY7hSM9Fd/HX
 aq67iaSxTQ9zY6dN4ffHnVbxdhMoLGRLvIl7jcikswrXclntKmCzWwf5+JfdAJemKQhn
 wvEJCBE7d3RHSE7JlpG08w93zZVEuKKGfNOoNJOAks8ZeJazmWAeLtW8WhbC4YkAxUX8
 TiNI8V5BJqQ4GvtyZfv7anYETJGh1MtUIg2cBJwqAIzfwWZWdL4JP7Q4cftv5Pu0eowX
 7z63zN6wGJF/UiNZqh7GG8ssIaYi0VkSEVqiLhtB4kRMm9khpUd4kJZtiIO+qEar8Ipf
 mX7g==
X-Gm-Message-State: AOJu0YxoparFFAGhMcQk+uy2Q4PzZSH1Z+RDtUN98c8BnCOTNi//YIzX
 LOONOz3HYvQeDgFHKjNvmGnkN5sTq5wj3pzt2I2tZ6INXZBTIeyhVjcYMtoC5GV1/+QeLrbZYqa
 ATNENlEaE+n6cc/0sOeY1yOgw9fStm6cqqil5Fj8=
X-Received: by 2002:a05:622a:148b:b0:410:7ba7:3820 with SMTP id
 t11-20020a05622a148b00b004107ba73820mr5940283qtx.13.1694703131974; 
 Thu, 14 Sep 2023 07:52:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuBIX4VAf09Bg1IOzgz4ENBdjG+eg3VN2wTn6bI9VzIZhBHLgnoJiT6UAA9XjLm7JnqGQOE8juKH7kNOpqnWc=
X-Received: by 2002:a05:622a:148b:b0:410:7ba7:3820 with SMTP id
 t11-20020a05622a148b00b004107ba73820mr5940269qtx.13.1694703131692; Thu, 14
 Sep 2023 07:52:11 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Sep 2023 07:52:10 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
 <CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com>
 <f08254a6-e251-b920-9a09-39f2dfc2cdde@ventanamicro.com>
 <CABJz62PzGr1Frou3AkpPudQa6MjS+HJs6f=B1T1gDa4Da5gpTg@mail.gmail.com>
 <20230908-5d71b8701d6efed371138954@orel>
 <20230908-5a7f4c1da93e556147100a70@orel>
 <CABJz62NP6COZVJQT8p3t1Lx4BWGbEUdMatVeZaRSvuEJjW6h5A@mail.gmail.com>
 <20230908-fc90cf18948effff759d1b9d@orel>
 <d023da43-cb72-73bd-019b-c3070074a163@ventanamicro.com>
 <478778e1-db73-5b41-e00e-3de8b6dcd340@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <478778e1-db73-5b41-e00e-3de8b6dcd340@ventanamicro.com>
Date: Thu, 14 Sep 2023 07:52:10 -0700
Message-ID: <CABJz62M4xQwdp_8NJRex=Ne9XeiqSw3JZZ0Pfd8fQdvoDESxDA@mail.gmail.com>
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, qemu-riscv <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Sep 11, 2023 at 07:01:38PM -0300, Daniel Henrique Barboza wrote:
> On 9/11/23 16:46, Daniel Henrique Barboza wrote:
> > On 9/8/23 11:10, Andrew Jones wrote:
> > > On Fri, Sep 08, 2023 at 03:28:12AM -0700, Andrea Bolognani wrote:
> > > > Wouldn't that be exposed as a named vendor CPU rather than somethin=
g
> > > > that users have to assemble themselves by layering profiles?
> > >
> > > Combing multiple profiles should be considered as creating a union of=
 the
> > > mandatory extensions each profile represents, rather than as layering=
.
> > >
> > > Let's take the hypothetical case of C being dropped from rva24u64 as =
an
> > > example. When specifying both rva22u64 and rva24u64
> > > (-cpu min64,rva22u64=3Don,rva24u64=3Don) the user will get C enabled =
without
> > > even having to know about it, whereas if the user could only select t=
he
> > > latest profile (-cpu rva24u64), C would not get enabled unless the us=
er
> > > was aware that it needed to be explicitly enabled (-cpu rva24u64,c=3D=
on).

Right, that's what I had in mind when I was talking about layering.
Using the term union is probably more appropriate though :)

> > > > If you're working on defining a new CPU model and need fine-grained
> > > > control over the exact set of extensions, then you can already do
> > > > that by explicitly flipping each one of them on or off, and adding
> > > > the ability to layer profiles doesn't add much value except possibl=
y
> > > > removing a bit of verbosity. Not particularly compelling IMO.
> > >
> > > I think it's compelling, because the extension lists that profiles pr=
ovide
> > > are long and mostly uninteresting. For example, how often do we want =
to
> > > type and think about imafd_Zicsr_Zifencei? I think we'd mostly rather=
 take
> > > those for granted, and we can, because we just specify 'g' instead. I=
ndeed
> > > the profile spec even points out that using profiles as a way to deal=
 with
> > > "unwieldy" ISA strings is another motivation for them. A RISC-V QEMU =
CPU
> > > command line is effectively an ISA string, so I think it's appropriat=
e to
> > > apply profiles to it as well.

I'm not sure this will save a lot of typing unless you're enabling a
lot of profiles which are possibly far apart from each other in terms
of release year, but I also don't have a very strong opposition to
the approach. As you say, we are already effectively implementing it
with virtual extensions like "g", so extending the applicability
further to cover profiles is not too much of a stretch.

I think libvirt will probably need to learn what set of extensions
each virtual extension/profile maps to, but since the definition will
come directly from actual specifications that shouldn't be a big
problem.

> > > > =C2=A0=C2=A0 (This also gets really interesting when you start thin=
king about
> > > > =C2=A0=C2=A0 extensions that are optional for the profile... Maybe =
we need
> > > > =C2=A0=C2=A0 something like '-cpu rva23u64,optional-extensions=3Dof=
f' so that
> > > > =C2=A0=C2=A0 testing against the baseline for a profile doesn't req=
uire combing
> > > > =C2=A0=C2=A0 through the spec and disabling extensions manually?)
> > >
> > > I don't think the profiles (whether they are CPU virtual extensions o=
r
> > > CPU models) should enable the optional extensions by default. When
> > > software targets a profile (or set of profiles with the virtual
> > > extension approach) then it should never assume the optional extensio=
ns
> > > will be present. Developers should need to consciously include those
> > > extensions when creating the QEMU platform used for testing.

Fair enough.

Should there be a way to explicitly enable all possible optional
extensions, then? To allow the developer to verify that the
application works correctly on a minimal implementation of the
profile, but also takes advantage of optional extensions if they are
present? Or would that be achieved by enabling the relevant
extensions manually? Or perhaps by using the max CPU model instead?

> > > Thinking about this more today, I think we should have two non-vendor=
 CPU
> > > models ('min' and 'max'). We also need to handle xlen, though, so I
> > > suggest we have min32, min64, max32 and max64 (and someday min128 and
> > > max128), but those would just be convenience CPU model names. The sam=
e
> > > CPU models could be created with 'min,xlen32=3Don', 'min,xlen64=3Don'=
,
> > > 'max,xlen32=3Don', and 'max,xlen64=3Don' instead (and one could repla=
ce xlen*
> > > with both an mxlen* and an sxlen* when they don't match).
> >
> > This makes sense when/if we unify the 32 and 64 bit binaries (CCing Ali=
stair for
> > context). Today we have 32 and 64 bit CPUs in their own binaries (riscv=
32 and
> > riscv64) and it's not possible to run a 32 bit CPU with qemu-system-ris=
cv64 because
> > we do not expose xlen or mxl to be set via command line.
> >
> >
> > As for the 'max' CPU I'm having second guesses about its name. We have =
'rv32' and
> > 'rv64', but 'max' can be either 32 or 64 bit depending on the binary us=
ed. This can
> > be considered an advantage now but it can be confusing if/when we decid=
e to merge
> > all CPUs in a single binary. I believe a better name would be rv32max/r=
v64max or
> > max32/max64. Any thoughts?
>
> Guess I'll answer my own question. Another thing with the 'max' CPU name =
is that all
> other archs uses the same CPU name for a similar concept. Use the same na=
me will spare
> libvirt and other tooling from having to deal with every other arch havin=
g a 'max' CPU
> and risc-v using another name.
>
> We might eventually have to deal with an unified binary with both 32 and =
64 bits CPUs
> and then 'max' will need to be disambiguated via max32/max64 aliases or x=
len properties.
> For now we should keep 'max' as is.

Agreed.

As you note, when the time comes this is something that all
architectures, not just RISC-V, will have to deal with.

--=20
Andrea Bolognani / Red Hat / Virtualization


