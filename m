Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ECDEE8006
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 14:11:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qecCM-0002az-Qo; Fri, 08 Sep 2023 10:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qecCH-0002WA-6N
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 10:11:01 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qecC7-00079S-Lr
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 10:10:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-401da71b83cso23575665e9.2
 for <qemu-riscv@nongnu.org>; Fri, 08 Sep 2023 07:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694182244; x=1694787044; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nGItaf+AsVY3KRDkNNsc6XNjlmBxdXW2LZu+Uwu+5Zg=;
 b=jJh0/imyo8Z5ZHXIZTwroM2BBPqobyFKLwDBAwsVJbzGx9czGo1pZZSS6Rcy3afIPR
 /9zC7HXddZknne/TdeyHcBI2rEJB8yRMrHWuVEu/Ow7YH34DDQ/ZK+y9pW5BgAEwFE0p
 Nx+yzcdMO0woQkXyGXipk0TyG4+owrNxNY+dGvAV7WkVcKniPJkDDaWUd71hx1ALFDmV
 7SDB+t6HPulJ86Ft253K4hD7Jtw/IwftSR5QjXTk/dHuCaYvzRHjN47wZAGzMUUZEllw
 juwpGWhJlQFXgDrWruoMLJXv/v5q45YtuLaaS3QDRf3Udxk5VLOw5OU3ZpU0Yk55nJiX
 RgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694182244; x=1694787044;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nGItaf+AsVY3KRDkNNsc6XNjlmBxdXW2LZu+Uwu+5Zg=;
 b=V4P1+DDU6oNqvmD1Y3m0zgNWvlt2OhXwES2QCdcxt2ufB0J7faoJJHLJr8KXyVSr6e
 BPk85V3mt8dT16FEjGgpWNHsDD73u8n7I2mjt3qhoNxsKBrRnjCiEACsGfcudseZ1eQb
 tD326zw/w/4frBx2Da/coUHCxc5RsXvY35FwVgS/lonmzpK0ybNyMmd0XZwlRPXNwMrL
 M+fnGGMvw2nQy/cawPNKyhO94DDUT3j0YjU9mhp4b83+B6lGjArpobhnGSiYg34WyhNU
 rbhExDGFc4O/jI6mSOZYAu5+Ha8MQcFK4NGQKk/adKOp6DoJ5c0feULN+TD2ObhivdGV
 9u5A==
X-Gm-Message-State: AOJu0Yxj7R83Lx2+BPCK/xODbZKAXwvPVhHByHRcijJlkO4kZQC+QvB+
 zPr1m6N4cm4T6WGydNjiiokFaA==
X-Google-Smtp-Source: AGHT+IHeFstz8AEi9j+dNJLnbL06R4udvcKvE8Uxvp8AWrjs7RNQCkJ1JfHYR/KrKh2TbXiBHK6pZQ==
X-Received: by 2002:adf:e40e:0:b0:315:ad1a:5abc with SMTP id
 g14-20020adfe40e000000b00315ad1a5abcmr2312702wrm.5.1694182243922; 
 Fri, 08 Sep 2023 07:10:43 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 n6-20020adfe786000000b003197efd1e7bsm2187297wrm.114.2023.09.08.07.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 07:10:43 -0700 (PDT)
Date: Fri, 8 Sep 2023 16:10:37 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 qemu-riscv <qemu-riscv@nongnu.org>
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
Message-ID: <20230908-fc90cf18948effff759d1b9d@orel>
References: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
 <CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com>
 <f08254a6-e251-b920-9a09-39f2dfc2cdde@ventanamicro.com>
 <CABJz62PzGr1Frou3AkpPudQa6MjS+HJs6f=B1T1gDa4Da5gpTg@mail.gmail.com>
 <20230908-5d71b8701d6efed371138954@orel>
 <20230908-5a7f4c1da93e556147100a70@orel>
 <CABJz62NP6COZVJQT8p3t1Lx4BWGbEUdMatVeZaRSvuEJjW6h5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62NP6COZVJQT8p3t1Lx4BWGbEUdMatVeZaRSvuEJjW6h5A@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32a.google.com
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

On Fri, Sep 08, 2023 at 03:28:12AM -0700, Andrea Bolognani wrote:
> On Fri, Sep 08, 2023 at 11:13:54AM +0200, Andrew Jones wrote:
> > On Fri, Sep 08, 2023 at 10:39:45AM +0200, Andrew Jones wrote:
> > > On Thu, Sep 07, 2023 at 10:51:33AM -0500, Andrea Bolognani wrote:
> > > > So, why would I want to do something like
> > > >
> > > >   -cpu rv64,profile=rva20u64,profile=rva23u64
> > > >
> > > > when the latter is a superset of the former? It seems that it would
> > > > achieve exactly the same as
> > > >
> > > >   -cpu rv64,profile=rva23u64
> > > >
> > > > but with extra steps.
> > >
> > > I don't see anything in the profile spec that states we can count on later
> > > profiles being supersets of older profiles, which means we cannot.
> >
> > I just found a potential example of why we cannot. A recent mail thread[1]
> > stated some vendors are considering dropping support for the C extension
> > on "higher end" platforms. If this were to happen, then a profile may be
> > proposed where C is optional. In that case, platforms that still have C
> > could state they are compatible with the older profiles where it's
> > mandated and also the new profile where it's optional, whereas the
> > platforms that don't have C will only state the new profile.
> >
> > [1] https://groups.google.com/a/riscv.org/g/fw-exchange/c/qxnKKS4jhLk
> 
> I can't access the URL, but I get the gist. Point taken about
> profiles not necessarily being purely additive, though I don't think
> this invalidates my criticism of the approach.
> 
> > > Also,
> > > I'd guess vendors will want to implement as broad a set as possible of
> > > profiles and then list them all when advertising. So, IMO, something like
> > > '-cpu rv64,rva20u64=on,rva23u64=on' would be a more natural way to model a
> > > cpu which advertises being compatible with those two profiles.
> 
> Wouldn't that be exposed as a named vendor CPU rather than something

Probably eventually, but I think it'd be nice to translate a CPU
description to a QEMU command line without having to do anything other
than specify a base CPU model and a list of extensions, where most of the
extensions could get enabled through the selection of profiles without
even having to know which ones.

> that users have to assemble themselves by layering profiles?

Combing multiple profiles should be considered as creating a union of the
mandatory extensions each profile represents, rather than as layering.

Let's take the hypothetical case of C being dropped from rva24u64 as an
example. When specifying both rva22u64 and rva24u64
(-cpu min64,rva22u64=on,rva24u64=on) the user will get C enabled without
even having to know about it, whereas if the user could only select the
latest profile (-cpu rva24u64), C would not get enabled unless the user
was aware that it needed to be explicitly enabled (-cpu rva24u64,c=on).

(I changed the name of the base CPU type in the example above to 'min64'.
More on that below.)

> 
> Note that I have zero issues with the implementation of said named
> vendor CPU being, internally, handled effectively the same way as
> what you've just described. I'm simply unconvinced that we should
> expose this mechanism to users.
> 
> > > (I swapped the 'profile=' to a '=on' syntax, because I think each profile
> > > should be a boolean "virtual" extension.)
> 
> On one hand, I like this because it avoids having to invent a new
> mechanism. On the other, I dislike it because it overloads an
> existing mechanism O:-)
> 
> > > I'm also not sure of the benefits of using a cpu model vs. a base model
> > > and a bunch of virtual profile extensions. If it's because it's a hassle
> > > to collect extensions that should be enabled, then I think we'll have to
> > > live with that for unnamed riscv cpu models. Profiles will always lag new
> > > extensions which users will want to enable, so users will be adding plenty
> > > of cpu properties anyway. Of course users that don't care about being
> > > explicit have 'max' to avoid all that.
> 
> I feel that this validates my stance on the matter.
> 
> If you're working on defining a new CPU model and need fine-grained
> control over the exact set of extensions, then you can already do
> that by explicitly flipping each one of them on or off, and adding
> the ability to layer profiles doesn't add much value except possibly
> removing a bit of verbosity. Not particularly compelling IMO.

I think it's compelling, because the extension lists that profiles provide
are long and mostly uninteresting. For example, how often do we want to
type and think about imafd_Zicsr_Zifencei? I think we'd mostly rather take
those for granted, and we can, because we just specify 'g' instead. Indeed
the profile spec even points out that using profiles as a way to deal with
"unwieldy" ISA strings is another motivation for them. A RISC-V QEMU CPU
command line is effectively an ISA string, so I think it's appropriate to
apply profiles to it as well.

> 
> If you're testing an application and want to ensure it works fine on
> CPUs that implement a specific profile, e.g. rva20u64 because even
> older hardware should be able to run it, then you're not going to
> need or indeed want to layer additional profiles on top of that. So a
> regular named CPU model will work just fine.

This line of reasoning makes sense if profiles only layer, but, as I tried
to illustrate above, we should consider profile combining to be the
forming of extension unions, where even the older profiles can contribute
to the set.

> 
>   (This also gets really interesting when you start thinking about
>   extensions that are optional for the profile... Maybe we need
>   something like '-cpu rva23u64,optional-extensions=off' so that
>   testing against the baseline for a profile doesn't require combing
>   through the spec and disabling extensions manually?)

I don't think the profiles (whether they are CPU virtual extensions or
CPU models) should enable the optional extensions by default. When
software targets a profile (or set of profiles with the virtual
extension approach) then it should never assume the optional extensions
will be present. Developers should need to consciously include those
extensions when creating the QEMU platform used for testing.

> 
> If you're someone who just needs a RISC-V VM, then you're either
> going to be using 'max' or a named vendor CPU and profiles will not
> enter the picture at all.

I agree, but I think we need to ensure developers can easily build more
specific platforms too, including those that combine profiles.


Now somewhat switching topics...

Thinking about this more today, I think we should have two non-vendor CPU
models ('min' and 'max'). We also need to handle xlen, though, so I
suggest we have min32, min64, max32 and max64 (and someday min128 and
max128), but those would just be convenience CPU model names. The same
CPU models could be created with 'min,xlen32=on', 'min,xlen64=on',
'max,xlen32=on', and 'max,xlen64=on' instead (and one could replace xlen*
with both an mxlen* and an sxlen* when they don't match).

Besides the *xlen* boolean properties, 'min' and 'max', would both also
get 'version1', 'version2', ... boolean properties which map to the ISA
spec version(s) supported. (min32, min64, max32, and max64 would always
implement the latest version in order to remain useful shorthands.)

In the end users could choose between
 - vendor named models
 - min/max,xlen*,version* + profiles/extensions...
 - min32/max32/min64/max64 + profiles/extensions...
 - host (for KVM, and max/max32/max64 could all alias 'host')

'any', 'rv32', and 'rv64' get deprecated.

Thanks,
drew

