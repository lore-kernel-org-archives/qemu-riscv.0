Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892C0EE6447
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 09:07:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qh4nZ-0006kC-TV; Fri, 15 Sep 2023 05:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qh4nX-0006aY-6g
 for qemu-riscv@nongnu.org; Fri, 15 Sep 2023 05:07:35 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qh4nU-0001No-P9
 for qemu-riscv@nongnu.org; Fri, 15 Sep 2023 05:07:34 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4c0so4232037a12.0
 for <qemu-riscv@nongnu.org>; Fri, 15 Sep 2023 02:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694768851; x=1695373651; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=c3w+BKjVFNANGzgdmoQuFarRuSYLZJsxNtd0/Zf1ukE=;
 b=nTFqt23qZGIXBmRHvsgDSL44rs+FANb/2d0VbZqy4nASEa4JM81gkxZYFGg0l/0CnY
 gnx7mYN5NFqBbZrD1NYlK8WB+PNbZXeGKqpX7W3o2TXaItlqUCYrOcPM0pqkjd8IbWxx
 mIJY4//A/UkchuxCyAann7hMEd5bTYP1BVpxEajeXeUfO3x4BsYFUmYx0T7/qamBG0o6
 4ufH4Wq3EmL4gIsrluVO493672arltos3zUUTaRZWQHBT2YVgflwvjqIFDmZugtoUSKf
 rd6bePtSx2y+zLeU6XRgz9EzTTuwyboUtF2ue4wkkGUzSNqnikxG0hs376UFSxU9PHaN
 1OyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694768851; x=1695373651;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c3w+BKjVFNANGzgdmoQuFarRuSYLZJsxNtd0/Zf1ukE=;
 b=Q5tB3nS+4TAHHqrb4d3dDM/bOBo1aanIrp2BoifFj7cb2tg47AGazY9N9Zky+80+ff
 i4GTt9sbpDueqc7FZGSOnug6+taTK5GI8kCAq+fYiqvwHhYzFfd2Bd9AMzVhsfHuso2Y
 EDXaaR29y1tRxH1GUOmOmdnbRpzXILKgepYzT3bIJ5ZELFfwbpYdnOnhtM8iK3/U7106
 tbgfJcW+r+n1DxKdv1nYsDi7gFRPcQ/bKLEqdiMXjpryQ4aeBgj1Pfcw2giq9x9c1o2U
 dtj0Ghkud1bHe2Z8lz/rk1iGsf0UtBP/KbNmNdQYhZNkolNnOmjHkbgUa84qPLUNU9ze
 kfWQ==
X-Gm-Message-State: AOJu0YxMGtSqL9kcdZ7pkBrerhQYaPUJQN25EpdHUmpccZGdIHpb6oRI
 ZNotNuQu/XHPWjRSxVqhUDjjiA==
X-Google-Smtp-Source: AGHT+IFi+ljrD9g0rhoUxzHPo76Dio5ebm9He3Nxl9cjtM4OyTBvveFWQKcQjrQRHNElHKiMljGIrw==
X-Received: by 2002:a05:6402:3549:b0:525:4696:336d with SMTP id
 f9-20020a056402354900b005254696336dmr6200060edd.8.1694768850847; 
 Fri, 15 Sep 2023 02:07:30 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a056402129500b0052c9f1d3cfasm1982422edv.84.2023.09.15.02.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 02:07:30 -0700 (PDT)
Date: Fri, 15 Sep 2023 11:07:29 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Andrea Bolognani <abologna@redhat.com>, 
 qemu-riscv <qemu-riscv@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
Message-ID: <20230915-1b277fc23679aafa529856d8@orel>
References: <CABJz62PzGr1Frou3AkpPudQa6MjS+HJs6f=B1T1gDa4Da5gpTg@mail.gmail.com>
 <20230908-5d71b8701d6efed371138954@orel>
 <20230908-5a7f4c1da93e556147100a70@orel>
 <CABJz62NP6COZVJQT8p3t1Lx4BWGbEUdMatVeZaRSvuEJjW6h5A@mail.gmail.com>
 <20230908-fc90cf18948effff759d1b9d@orel>
 <d023da43-cb72-73bd-019b-c3070074a163@ventanamicro.com>
 <478778e1-db73-5b41-e00e-3de8b6dcd340@ventanamicro.com>
 <CABJz62M4xQwdp_8NJRex=Ne9XeiqSw3JZZ0Pfd8fQdvoDESxDA@mail.gmail.com>
 <20230914-bbac51e753252e830905edf1@orel>
 <5d47b0f1-4950-81ee-9e0f-d135658152e5@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d47b0f1-4950-81ee-9e0f-d135658152e5@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Sep 14, 2023 at 06:11:49PM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 9/14/23 12:08, Andrew Jones wrote:
> > On Thu, Sep 14, 2023 at 07:52:10AM -0700, Andrea Bolognani wrote:
> > > On Mon, Sep 11, 2023 at 07:01:38PM -0300, Daniel Henrique Barboza wrote:
> > > > On 9/11/23 16:46, Daniel Henrique Barboza wrote:
> > > > > On 9/8/23 11:10, Andrew Jones wrote:
> > > > > > On Fri, Sep 08, 2023 at 03:28:12AM -0700, Andrea Bolognani wrote:
> > > > > > > Wouldn't that be exposed as a named vendor CPU rather than something
> > > > > > > that users have to assemble themselves by layering profiles?
> > > > > > 
> > > > > > Combing multiple profiles should be considered as creating a union of the
> > > > > > mandatory extensions each profile represents, rather than as layering.
> > > > > > 
> > > > > > Let's take the hypothetical case of C being dropped from rva24u64 as an
> > > > > > example. When specifying both rva22u64 and rva24u64
> > > > > > (-cpu min64,rva22u64=on,rva24u64=on) the user will get C enabled without
> > > > > > even having to know about it, whereas if the user could only select the
> > > > > > latest profile (-cpu rva24u64), C would not get enabled unless the user
> > > > > > was aware that it needed to be explicitly enabled (-cpu rva24u64,c=on).
> > > 
> > > Right, that's what I had in mind when I was talking about layering.
> > > Using the term union is probably more appropriate though :)
> > > 
> > > > > > > If you're working on defining a new CPU model and need fine-grained
> > > > > > > control over the exact set of extensions, then you can already do
> > > > > > > that by explicitly flipping each one of them on or off, and adding
> > > > > > > the ability to layer profiles doesn't add much value except possibly
> > > > > > > removing a bit of verbosity. Not particularly compelling IMO.
> > > > > > 
> > > > > > I think it's compelling, because the extension lists that profiles provide
> > > > > > are long and mostly uninteresting. For example, how often do we want to
> > > > > > type and think about imafd_Zicsr_Zifencei? I think we'd mostly rather take
> > > > > > those for granted, and we can, because we just specify 'g' instead. Indeed
> > > > > > the profile spec even points out that using profiles as a way to deal with
> > > > > > "unwieldy" ISA strings is another motivation for them. A RISC-V QEMU CPU
> > > > > > command line is effectively an ISA string, so I think it's appropriate to
> > > > > > apply profiles to it as well.
> > > 
> > > I'm not sure this will save a lot of typing unless you're enabling a
> > > lot of profiles which are possibly far apart from each other in terms
> > > of release year, but I also don't have a very strong opposition to
> > > the approach. As you say, we are already effectively implementing it
> > > with virtual extensions like "g", so extending the applicability
> > > further to cover profiles is not too much of a stretch.
> > > 
> > > I think libvirt will probably need to learn what set of extensions
> > > each virtual extension/profile maps to, but since the definition will
> > > come directly from actual specifications that shouldn't be a big
> > > problem.
> > > 
> > > > > > >     (This also gets really interesting when you start thinking about
> > > > > > >     extensions that are optional for the profile... Maybe we need
> > > > > > >     something like '-cpu rva23u64,optional-extensions=off' so that
> > > > > > >     testing against the baseline for a profile doesn't require combing
> > > > > > >     through the spec and disabling extensions manually?)
> > > > > > 
> > > > > > I don't think the profiles (whether they are CPU virtual extensions or
> > > > > > CPU models) should enable the optional extensions by default. When
> > > > > > software targets a profile (or set of profiles with the virtual
> > > > > > extension approach) then it should never assume the optional extensions
> > > > > > will be present. Developers should need to consciously include those
> > > > > > extensions when creating the QEMU platform used for testing.
> > > 
> > > Fair enough.
> > > 
> > > Should there be a way to explicitly enable all possible optional
> > > extensions, then? To allow the developer to verify that the
> > > application works correctly on a minimal implementation of the
> > > profile, but also takes advantage of optional extensions if they are
> > > present? Or would that be achieved by enabling the relevant
> > > extensions manually? Or perhaps by using the max CPU model instead?
> > 
> > We could add a variant of each profile which represents everything the
> > profile mentions. That could maybe be held off until the need arises,
> > though, since 'max' may satisfy most users which aren't concerned about
> > which extensions are mandatory vs. optional.
> 
> 
> In my current prototype (not yet sent upstream, hopefully this month) I'm enabling
> all possible extensions, both mandatory and optional, with 'rva22u64=true'. Perhaps
> we should limit that to enable mandatory exts only, and then add a 'rva22u64-max'
> or similar to enable all possible extensions QEMU supports for that profile.

Yes, I would only enable mandatory extensions, otherwise the concept of
the profile becomes less useful. Most users will want to use a base cpu
type and profiles to remove extensions which they would get with the 'max'
cpu type (i.e. they would use profiles to create a platform with a known
set of extensions). Optional extensions are not generally known to be on a
platform. Users should enable those extensions themselves when they know
the specific platform they're modeling has them.

Whether or not we also offer a profile variant that includes the optional
extensions is debatable. I'd probably defer their creation for now. We
can always define them later.

Thanks,
drew

