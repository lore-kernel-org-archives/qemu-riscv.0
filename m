Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE8FEEAA50
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 15:09:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qgnxW-0004cq-Lg; Thu, 14 Sep 2023 11:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qgnxV-0004bh-4v
 for qemu-riscv@nongnu.org; Thu, 14 Sep 2023 11:08:45 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qgnxT-0006te-DJ
 for qemu-riscv@nongnu.org; Thu, 14 Sep 2023 11:08:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31c65820134so917670f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 14 Sep 2023 08:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694704121; x=1695308921; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mYLgcWyH70jy9glklirnMjnLckhS4NbzP9nSv9krZuc=;
 b=D/j1N0EWLIx8SXfLHY+ZAT4a6z7IOcelCv9ClVpzae7QPtpcGNH8FfFvc50mIZQJGz
 u2Dxtyhm1wq82qZVlVyMWxtR1kwOqHM4sJcsx9qWlzeVTyGRisZgv3/63WJfLdBF1dhq
 eSufqJCbOzwCkfxCz7OgeUvhn+H/Kk5BjT9j9BoihBAlYdV+fAJywtvuftwDZsQHbuUv
 dNsE9XbTJIkZDFv54VcBagknTSiSQ+53b2PSw5tSMLJZyZfNxmrBQ66Y57xEWFvdPtts
 CCDHmub2563Zzan/sCqY7lBEtkBFQujy3Rc694OFqkEUYV7fhKk0RVrBg2QGcI9uZdG8
 WgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694704121; x=1695308921;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mYLgcWyH70jy9glklirnMjnLckhS4NbzP9nSv9krZuc=;
 b=Um0D8VJXQXsMTflltjD58DltY/WKlBRZXWM+C4JBFaBiRdbx1y9ELWI1G8YUxsFjhe
 DKZUeUvqkoa67aNzDqAxpxAy28qB8uyDZ4lDWYKN5xpRT5lJ6aWwJ+W9xn71/4kUHiK6
 7oI2cW7l+3kMfWD5bs/PNUW/rQiXWXai9efxfa/ptFvjjgKHFX/ejXssQ1A9mMBvxKwr
 nW2F8CphVjaAzchyknjhzV6tvf1re+3EM4yTjaIsBV/ax1mWWClm8MmNe8rCE1r25O/X
 GOcU5QuHTfFBA0G+ThJNLjQvWDYHjYXrZsnxZvHIhzatU58vXy/sMg3XKl5P8nn47Ms5
 Ga9w==
X-Gm-Message-State: AOJu0YyrNwAhX90sCJfCz7j4RqJZreTaEcX5j8cSkgiwYi+jDLDKuRkD
 xGZ/ikT/bB2t0bBzBqPtcBvHDg==
X-Google-Smtp-Source: AGHT+IHks3/WPXM387oQjT34xSQ2X5WGQR0SQOwGq9T6FM0/FkK85hIlXudOBRIU0VhMcm1qvuRGUg==
X-Received: by 2002:a5d:440d:0:b0:31a:ea7d:49d9 with SMTP id
 z13-20020a5d440d000000b0031aea7d49d9mr5626460wrq.53.1694704121323; 
 Thu, 14 Sep 2023 08:08:41 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a5d4ccd000000b0030fd03e3d25sm1987805wrt.75.2023.09.14.08.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 08:08:40 -0700 (PDT)
Date: Thu, 14 Sep 2023 17:08:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 qemu-riscv <qemu-riscv@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
Message-ID: <20230914-bbac51e753252e830905edf1@orel>
References: <CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com>
 <f08254a6-e251-b920-9a09-39f2dfc2cdde@ventanamicro.com>
 <CABJz62PzGr1Frou3AkpPudQa6MjS+HJs6f=B1T1gDa4Da5gpTg@mail.gmail.com>
 <20230908-5d71b8701d6efed371138954@orel>
 <20230908-5a7f4c1da93e556147100a70@orel>
 <CABJz62NP6COZVJQT8p3t1Lx4BWGbEUdMatVeZaRSvuEJjW6h5A@mail.gmail.com>
 <20230908-fc90cf18948effff759d1b9d@orel>
 <d023da43-cb72-73bd-019b-c3070074a163@ventanamicro.com>
 <478778e1-db73-5b41-e00e-3de8b6dcd340@ventanamicro.com>
 <CABJz62M4xQwdp_8NJRex=Ne9XeiqSw3JZZ0Pfd8fQdvoDESxDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABJz62M4xQwdp_8NJRex=Ne9XeiqSw3JZZ0Pfd8fQdvoDESxDA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42a.google.com
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

On Thu, Sep 14, 2023 at 07:52:10AM -0700, Andrea Bolognani wrote:
> On Mon, Sep 11, 2023 at 07:01:38PM -0300, Daniel Henrique Barboza wrote:
> > On 9/11/23 16:46, Daniel Henrique Barboza wrote:
> > > On 9/8/23 11:10, Andrew Jones wrote:
> > > > On Fri, Sep 08, 2023 at 03:28:12AM -0700, Andrea Bolognani wrote:
> > > > > Wouldn't that be exposed as a named vendor CPU rather than something
> > > > > that users have to assemble themselves by layering profiles?
> > > >
> > > > Combing multiple profiles should be considered as creating a union of the
> > > > mandatory extensions each profile represents, rather than as layering.
> > > >
> > > > Let's take the hypothetical case of C being dropped from rva24u64 as an
> > > > example. When specifying both rva22u64 and rva24u64
> > > > (-cpu min64,rva22u64=on,rva24u64=on) the user will get C enabled without
> > > > even having to know about it, whereas if the user could only select the
> > > > latest profile (-cpu rva24u64), C would not get enabled unless the user
> > > > was aware that it needed to be explicitly enabled (-cpu rva24u64,c=on).
> 
> Right, that's what I had in mind when I was talking about layering.
> Using the term union is probably more appropriate though :)
> 
> > > > > If you're working on defining a new CPU model and need fine-grained
> > > > > control over the exact set of extensions, then you can already do
> > > > > that by explicitly flipping each one of them on or off, and adding
> > > > > the ability to layer profiles doesn't add much value except possibly
> > > > > removing a bit of verbosity. Not particularly compelling IMO.
> > > >
> > > > I think it's compelling, because the extension lists that profiles provide
> > > > are long and mostly uninteresting. For example, how often do we want to
> > > > type and think about imafd_Zicsr_Zifencei? I think we'd mostly rather take
> > > > those for granted, and we can, because we just specify 'g' instead. Indeed
> > > > the profile spec even points out that using profiles as a way to deal with
> > > > "unwieldy" ISA strings is another motivation for them. A RISC-V QEMU CPU
> > > > command line is effectively an ISA string, so I think it's appropriate to
> > > > apply profiles to it as well.
> 
> I'm not sure this will save a lot of typing unless you're enabling a
> lot of profiles which are possibly far apart from each other in terms
> of release year, but I also don't have a very strong opposition to
> the approach. As you say, we are already effectively implementing it
> with virtual extensions like "g", so extending the applicability
> further to cover profiles is not too much of a stretch.
> 
> I think libvirt will probably need to learn what set of extensions
> each virtual extension/profile maps to, but since the definition will
> come directly from actual specifications that shouldn't be a big
> problem.
> 
> > > > >    (This also gets really interesting when you start thinking about
> > > > >    extensions that are optional for the profile... Maybe we need
> > > > >    something like '-cpu rva23u64,optional-extensions=off' so that
> > > > >    testing against the baseline for a profile doesn't require combing
> > > > >    through the spec and disabling extensions manually?)
> > > >
> > > > I don't think the profiles (whether they are CPU virtual extensions or
> > > > CPU models) should enable the optional extensions by default. When
> > > > software targets a profile (or set of profiles with the virtual
> > > > extension approach) then it should never assume the optional extensions
> > > > will be present. Developers should need to consciously include those
> > > > extensions when creating the QEMU platform used for testing.
> 
> Fair enough.
> 
> Should there be a way to explicitly enable all possible optional
> extensions, then? To allow the developer to verify that the
> application works correctly on a minimal implementation of the
> profile, but also takes advantage of optional extensions if they are
> present? Or would that be achieved by enabling the relevant
> extensions manually? Or perhaps by using the max CPU model instead?

We could add a variant of each profile which represents everything the
profile mentions. That could maybe be held off until the need arises,
though, since 'max' may satisfy most users which aren't concerned about
which extensions are mandatory vs. optional.

Thanks,
drew

