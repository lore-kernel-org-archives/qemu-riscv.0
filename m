Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835BCC25B67
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:15:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw24d-0004T1-Pc; Thu, 26 Oct 2023 11:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qw24c-0004S2-A4
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:15:02 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qw24Y-0004sk-Bk
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:15:01 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40891d38e3fso7679975e9.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 08:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698333296; x=1698938096; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RpAQ4FzMjSQUl+BEUvIFmQ3xEE0yqE3SoJjU63c1E8s=;
 b=LrGgqGR6Z4TqVAQy1avgk1hgzGdccjzCqUCBul+TVHFhulo++gmOjuiUB1xo1q8G4Y
 A5mbVtELisZBf3LT4pFxDMzdDYrZuVgGESNurE2djm38Lqndj6d5uhOs0aaJw6JXW7kM
 Tz54R+Kw9HmQQDhK2zRObbUUcTs0as1RCZ7OavGPg2tafs0XuxqTp6KCSwlLHlHtcvTu
 jnyXLuXwHoP7h5k/QGm/gUgvrmO3cfB2si1tu+YXDhXEEnWqOy8GJDPQpAe/Vgqadgx9
 hHDBLc4rBffwQoicjgvA0P5hplgFPhtn3i6CLvxfnfyZ+3303FMxoYuG+Xdp4tcimgmZ
 Mwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698333296; x=1698938096;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RpAQ4FzMjSQUl+BEUvIFmQ3xEE0yqE3SoJjU63c1E8s=;
 b=erqGQY1IEcBIfldJhpYAM7mezvDvJ/UupoKXDsZKYzs0VJIafSL+Q1GDKKRDXX6J2t
 YeOD4ejySzzwKAM+Ty7UFtMnEpWZzGbyY4kpaGamEnNI9a6WslJHjupybgFY2JQr5Fvm
 Up+tV0rccm+iFuIrs1kPe+DJW9q22cbCbCG/j/XoKXWu1DnVHhLyT4l+5Jd0UkkwyIsP
 rt8jPKCSYvmQtsHDEv1fFHYMeG3/ZlWw8S67u2VPjUdfwZOd22GygLzTXDY7JFvHq34k
 3uK27Ey75YnmQJKeikj0yXzQZlemTw4ZdC6bly2bpyxulxjgxefsPR9AuBtjyjQhnRc0
 zvfg==
X-Gm-Message-State: AOJu0YzBGvvgtvJl5Ux3IK9zZCbwldeyfqnopRYVtSPjVq5gVd8ymQRK
 UwhDiOTuMHweywf8gKdZaqcoNg==
X-Google-Smtp-Source: AGHT+IGrH2O7Lgt6gq8wPfs/pCy23UJlCxgw+gVvM6UCeswPGctoOeoEe+y8CH/TMeauCbEXxv6obA==
X-Received: by 2002:a05:600c:350c:b0:405:3e5e:6698 with SMTP id
 h12-20020a05600c350c00b004053e5e6698mr75819wmq.27.1698333295989; 
 Thu, 26 Oct 2023 08:14:55 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c4ec700b004064ac107cfsm2864250wmq.39.2023.10.26.08.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:14:55 -0700 (PDT)
Date: Thu, 26 Oct 2023 17:14:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v3 3/6] target/riscv/tcg: add user flag for profile support
Message-ID: <20231026-c8c8065150673a1f48f41dd5@orel>
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
 <20231020223951.357513-4-dbarboza@ventanamicro.com>
 <20231023-2018025adea3ffaebbbefe23@orel>
 <0e66af36-bd36-4b42-b901-ed726af207b7@ventanamicro.com>
 <20231023-b0eb8f3478a61875a22de747@orel>
 <CABJz62MN5ha-JH=i+PAu=7hZspV8g85jeAc=hRam0Z1f4fPDEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62MN5ha-JH=i+PAu=7hZspV8g85jeAc=hRam0Z1f4fPDEg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32e.google.com
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

On Thu, Oct 26, 2023 at 07:36:21AM -0700, Andrea Bolognani wrote:
> On Mon, Oct 23, 2023 at 07:35:16PM +0200, Andrew Jones wrote:
> > On Mon, Oct 23, 2023 at 02:00:00PM -0300, Daniel Henrique Barboza wrote:
> > > On 10/23/23 05:16, Andrew Jones wrote:
> > > > Hmm, I'm not sure I agree with special-casing profiles like this. I think
> > > > the left-to-right processing should be consistent for all. I'm also not
> > > > sure we should always warn when disabling a profile. For example, if a
> > > > user does
> > > >
> > > >   -cpu rv64,rva22u64=true,rva22u64=false
> > > >
> > > > then they'll get a warning, even though all they're doing is restoring the
> > > > cpu model. While that looks like an odd thing to do, a script may be
> > > > adding the rva22u64=true and the rva22u64=false is the user input which
> > > > undoes what the script did.
> > >
> > > QEMU options do not work with a "the user enabled then disabled the same option,
> > > thus it'll count as nothing happened" logic. The last instance of the option will
> > > overwrite all previous instances. In the example you mentioned above the user would
> > > disable all mandatory extensions of rva22u64 in the CPU, doesn't matter if the
> > > same profile was enabled beforehand.
> >
> > Yup, I'm aware, but I keep thinking that we'll only be using profiles with
> > a base cpu type. If you start with nothing (a base) and then add a profile
> > and take the same one away, you shouldn't be taking away anything else. I
> > agree that if you use a profile on some cpu type that already enabled a
> > bunch of stuff itself, then disabling a profile would potentially remove
> > some of those too, but mixing cpu types that have their own extensions and
> > profiles seems like a great way to confuse oneself as to what extensions
> > will be present.  IOW, we should be adding a base cpu type at the same
> > time we're adding these profiles.
> 
> The question that keep bouncing around my head is: why would we even
> allow disabling profiles?
> 
> It seems to me that it only makes things more complicated, and I
> really can't see the use case for it.
> 
> Enabling additional features on top of a profile? There's obvious
> value in that, so that you can model hardware that implements
> optional and proprietary extensions. Enabling multiple profiles?
> You've convinced me that it's useful. But disabling profiles, I just
> don't see it. I believe Alistair was similarly unconvinced.

The only value I see in allowing a profile to be disabled is to undo the
enabling of the profile by specifying the profile as 'off' to the right of
it being specified as 'on'. That may seem pointless, but scripts take
advantage of being able to do that. Besides that one possible use case,
there isn't much use in disabling profiles, but treating profile
properties like every other boolean property makes the UI consistent and
should actually simplify the code.

> 
> > > > As far as warnings go, it'd be nice to warn when mandatory profile
> > > > extensions are disabled from an enabled profile. Doing that might be
> > > > useful for debug, but users which do it without being aware they're
> > > > "breaking" the profile may learn from that warning. Note, the warning
> > > > should only come when the profile is actually enabled and when the
> > > > extension would actually be disabled, i.e.
> > > >
> > > >   -cpu rv64,rva22u64=true,c=off
> > > >
> > > > should warn
> > > >
> > > >   -cpu rv64,c=off,rva22u64=true
> > > >
> > > > should not warn (rva22u64 overrides c=off since it's to the right)
> > > >
> > > >   -cpu rv64,rva22u64=true,rva22u64=false,c=off
> > > >
> > > > should not warn (rva22u64 is not enabled)
> 
> I think these should be hard errors, not warnings.
> 
> If you're enabling a profile and then disabling an extension that's
> mandatory for that profile, you've invalidated the profile. You've
> asked for a configuration that doesn't make any sense: you can't have
> a CPU that both implements a profile and lacks one of its mandatory
> extensions.
> 

Given a platform which implements a profile which mandates extension E and
a need to debug E or test behavior where E is [incorrectly] absent, you'll
need to expand the profile first, listing each of the other extensions
manually. It'd be much faster to specify the profile, take away the
extension, and ignore the warning.

> QEMU users could easily miss the warning. libvirt users won't see it
> at all. It's a user error and it needs to be treated as such IMO.

I do agree with the concern that warnings will be missed/ignored. Maybe
QEMU needs something like -Werror for stuff like this, i.e.

 -cpu rv64,error-on-extension-warnings=on,profile-A=on,extension-of-A=off

would error out, but, without the special property, just warn. Or, flip
the default behavior around with

 -cpu rv64,ignore-extension-errors=on,profile-A=on,extension-of-A=off

which would either silently proceed or just warn, but, without the
special property, error out. libvirt would default to the error out
case, whichever that one is, but also provide an element to turn off
erroring-out.

Thanks,
drew

