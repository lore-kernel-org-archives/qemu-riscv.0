Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43618EE644B
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 09:26:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qh55q-0002Pj-Ek; Fri, 15 Sep 2023 05:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qh55o-0002PU-OD
 for qemu-riscv@nongnu.org; Fri, 15 Sep 2023 05:26:28 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qh55k-0005jk-SS
 for qemu-riscv@nongnu.org; Fri, 15 Sep 2023 05:26:27 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52a39a1c4d5so2247607a12.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Sep 2023 02:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694769983; x=1695374783; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fFuZJgTWG0ighedtstZZV23bqA+TREsFnImrB/oiemY=;
 b=JBicWhHO0baSfaYvTFKQyXjDqk0a9CIIn/2B9fMl/15jTZT92+09RVvaqHSboUmbeu
 jBe/V4DHupbmwwh/xf9J8cdke/Y/vEdUZnl/TYYbpR0ZPdKPiApx8D1nh/CZcXLIN6/h
 M/A3bEJ5mVOqu+WqBndGxa/bOmxIIdxwf0yhxIIogO94UT2z0hwS0ZMooDopM6NdFz0P
 siTHE9MagmOZZ5QFEya02CVD0LKpU18k9itJsXTgE9h4jUDsM1JBNClyrZHkZ4EgV70o
 uWSlDbnmWDD3phvQRnqMkHGaumatqM9TE0b0cZ53MbvdKTJB4qiwubwOMN2a3BJiu9sl
 bz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694769983; x=1695374783;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fFuZJgTWG0ighedtstZZV23bqA+TREsFnImrB/oiemY=;
 b=vssVNrICbRb3Zme3k6CwFV2+p9K3Ogy99yHHkHcxVSxiftqMngbRgOVgRVDaLSltgD
 joheIAaTyYkk8lgJoJWQLrzgbB84Q6dWs0hXnj0aDWaMpUvY1Isa+qOmQJZW/BMbeRKh
 mo5SLLrS/fLThWValUJrcUyoKENv2vqJdQCLFD6AuWF1n+0JX7YYlJykAGYa1/3VuAdN
 +AOqz90k6tpTSW/gls8iD+JB/qD9CrcgGdQGIVjye8JfMx8tMPKSJOWlvD9DxNT38DEx
 HxBf1mKdJ5VkU7cqiYPCa4g+tmCf3D4A1wdrloiS8kQUBmebwCbEnR29Ex7wrtuBhuwQ
 ZB2g==
X-Gm-Message-State: AOJu0Yy01SwlUKD7qv9BNzMf1yKh/GF7qb343Aa+WYJgNLysEuNCLrIe
 +Od+i5AmADAdE9yuppvAsKXDQg==
X-Google-Smtp-Source: AGHT+IHAFKUmx09ku8oOB4+Yf59XdrweBXx3SSDCW+kS9tqbqyB4MLhD0xYJaS65BcWLhijLZTKytA==
X-Received: by 2002:aa7:d394:0:b0:525:691c:cd50 with SMTP id
 x20-20020aa7d394000000b00525691ccd50mr1160485edq.24.1694769983205; 
 Fri, 15 Sep 2023 02:26:23 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 q18-20020aa7da92000000b0052cdc596652sm1997846eds.23.2023.09.15.02.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 02:26:22 -0700 (PDT)
Date: Fri, 15 Sep 2023 11:26:21 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: abologna@redhat.com, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
Message-ID: <20230915-9632639e255a239a2aff52a4@orel>
References: <20230914-bbac51e753252e830905edf1@orel>
 <mhng-a7562ccd-9a00-462f-9801-8c8c18b516e5@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mhng-a7562ccd-9a00-462f-9801-8c8c18b516e5@palmer-ri-x1c9a>
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x535.google.com
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

On Thu, Sep 14, 2023 at 11:09:57AM -0700, Palmer Dabbelt wrote:
> On Thu, 14 Sep 2023 08:08:40 PDT (-0700), ajones@ventanamicro.com wrote:
> > On Thu, Sep 14, 2023 at 07:52:10AM -0700, Andrea Bolognani wrote:
> >> On Mon, Sep 11, 2023 at 07:01:38PM -0300, Daniel Henrique Barboza wrote:
> >> > On 9/11/23 16:46, Daniel Henrique Barboza wrote:
> >> > > On 9/8/23 11:10, Andrew Jones wrote:
> >> > > > On Fri, Sep 08, 2023 at 03:28:12AM -0700, Andrea Bolognani wrote:
> >> > > > > Wouldn't that be exposed as a named vendor CPU rather than something
> >> > > > > that users have to assemble themselves by layering profiles?
> >> > > >
> >> > > > Combing multiple profiles should be considered as creating a union of the
> >> > > > mandatory extensions each profile represents, rather than as layering.
> >> > > >
> >> > > > Let's take the hypothetical case of C being dropped from rva24u64 as an
> >> > > > example. When specifying both rva22u64 and rva24u64
> >> > > > (-cpu min64,rva22u64=on,rva24u64=on) the user will get C enabled without
> >> > > > even having to know about it, whereas if the user could only select the
> >> > > > latest profile (-cpu rva24u64), C would not get enabled unless the user
> >> > > > was aware that it needed to be explicitly enabled (-cpu rva24u64,c=on).
> >>
> >> Right, that's what I had in mind when I was talking about layering.
> >> Using the term union is probably more appropriate though :)
> >>
> >> > > > > If you're working on defining a new CPU model and need fine-grained
> >> > > > > control over the exact set of extensions, then you can already do
> >> > > > > that by explicitly flipping each one of them on or off, and adding
> >> > > > > the ability to layer profiles doesn't add much value except possibly
> >> > > > > removing a bit of verbosity. Not particularly compelling IMO.
> >> > > >
> >> > > > I think it's compelling, because the extension lists that profiles provide
> >> > > > are long and mostly uninteresting. For example, how often do we want to
> >> > > > type and think about imafd_Zicsr_Zifencei? I think we'd mostly rather take
> >> > > > those for granted, and we can, because we just specify 'g' instead. Indeed
> >> > > > the profile spec even points out that using profiles as a way to deal with
> >> > > > "unwieldy" ISA strings is another motivation for them. A RISC-V QEMU CPU
> >> > > > command line is effectively an ISA string, so I think it's appropriate to
> >> > > > apply profiles to it as well.
> >>
> >> I'm not sure this will save a lot of typing unless you're enabling a
> >> lot of profiles which are possibly far apart from each other in terms
> >> of release year, but I also don't have a very strong opposition to
> >> the approach. As you say, we are already effectively implementing it
> >> with virtual extensions like "g", so extending the applicability
> >> further to cover profiles is not too much of a stretch.
> >>
> >> I think libvirt will probably need to learn what set of extensions
> >> each virtual extension/profile maps to, but since the definition will
> >> come directly from actual specifications that shouldn't be a big
> >> problem.
> >>
> >> > > > >    (This also gets really interesting when you start thinking about
> >> > > > >    extensions that are optional for the profile... Maybe we need
> >> > > > >    something like '-cpu rva23u64,optional-extensions=off' so that
> >> > > > >    testing against the baseline for a profile doesn't require combing
> >> > > > >    through the spec and disabling extensions manually?)
> >> > > >
> >> > > > I don't think the profiles (whether they are CPU virtual extensions or
> >> > > > CPU models) should enable the optional extensions by default. When
> >> > > > software targets a profile (or set of profiles with the virtual
> >> > > > extension approach) then it should never assume the optional extensions
> >> > > > will be present. Developers should need to consciously include those
> >> > > > extensions when creating the QEMU platform used for testing.
> >>
> >> Fair enough.
> >>
> >> Should there be a way to explicitly enable all possible optional
> >> extensions, then? To allow the developer to verify that the
> >> application works correctly on a minimal implementation of the
> >> profile, but also takes advantage of optional extensions if they are
> >> present? Or would that be achieved by enabling the relevant
> >> extensions manually? Or perhaps by using the max CPU model instead?
> >
> > We could add a variant of each profile which represents everything the
> > profile mentions. That could maybe be held off until the need arises,
> > though, since 'max' may satisfy most users which aren't concerned about
> > which extensions are mandatory vs. optional.
> 
> At the risk of adding to the bikeshedding here:  IMO we should start 
> with a small set of CPU types that we know are useful.  We're not going 
> to be able to cover everything, hence the options to turn on/off 
> extensions/features.  Anything we add needs to go through the 
> deprecation process if we remove it, though, so it's a bit of a 
> headache.
>

I agree. I think we need a 'max' since it'll be the one primarily used by
developers and CI. Then, we also need a way to build a specific cpu which
may not have a vendor name yet or ever be assigned one. That means we need
a "base", which we've tried out different names for (rv32/rv64,
min, rv32i/rv64i, ...), but they're all the same thing. The "base" cpu
type and the "max" cpu type should never need to be depreciated. We
may find it useful to introduce alias cpu types for particular uses of
them, e.g. max64 == 'max,xlen64=on', but we can wait and see before
introducing those.

Defining profiles as "virtual extensions", which represent collections of
extensions, avoids creating new cpu types for each of them. We just
create new properties. I wouldn't expect to ever need to deprecate those
properties, since they'd only be a list of extensions and a cpu finalize
function which validates that all the mandatory extensions remain enabled
and are compatible with everything else that got enabled.

Thanks,
drew

