Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697B2C0032E
	for <qemu-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 09:32:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qwffn-00024m-PD; Sat, 28 Oct 2023 05:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qwfff-000243-N3
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 05:31:58 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qwffd-0001qa-Bn
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 05:31:55 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5409bc907edso4370231a12.0
 for <qemu-riscv@nongnu.org>; Sat, 28 Oct 2023 02:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698485511; x=1699090311; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F27Y+XQWuE+0XG4+Ir0sOZuC8CIcyFLJ+MveAeQlWP4=;
 b=OfWTXhhZrOnUWX3WiN/10CPbratkem72n1ZeADj5hDutP3Jch02KKRBRBc88umH8Un
 M0in/8aUYHsbU+ZKxemLfYVBtFgy1QxVupcbKpXciNkL6C2RkpVF6zErsaabXii91zc9
 H7WCQsXYnAtJZ+GsMUP6eTop7rD8YUH997CZG4gckLb6NOiguje1Y3PcjkR+M8NK8cm2
 7FTDY0Nl+fR2JA6v259CsFrygg9tq05EgDiBPUNFkhPwHrBiXlwPOz+HpS2LXdJ+ao4G
 FfT7GabXaVgduUFZCSdgq+NvwJrJHpPdk3Ve5bW7yY0aEgixZS967PNgL9p8yffI5dbx
 1XBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698485511; x=1699090311;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F27Y+XQWuE+0XG4+Ir0sOZuC8CIcyFLJ+MveAeQlWP4=;
 b=q8o8FllazB3SiyJGpx+PKw5ldjeJLdYHoiBp/Scg2PV38/7oaoHX/FOO+NMSseZVtv
 uOVz7f4D92L8GKwuJ9aQQDTWah5/z+1Zio4soBllHatOqyOacWiWh3tTSCJVJcTxsLuT
 t5b4hn09KE3CNmJzkzPbOOODnN5Jds4nJJaqs0udK+IhEizyX1KPfR1KaMGFqq1/IzbH
 0siOwnUv9QDl/jRiLbJdqtODSYHPlWNv0/qTponVcRTWQpuYAoLTro0kVAlYFiMVjyUW
 uPgJNWSUvyWLqOLaWh/rOYUw/jkc8EfNNP/I4E5HK4oclBeVMI13CIprTUidp3cxW6Wk
 Qpyg==
X-Gm-Message-State: AOJu0Yw7jNovUZSvkerjHAbOEHQ8Ps5OZPh4M+hT8GjAiWCeUkFnTBPe
 eJridy4FdsJEtPRc9R7vhnLp8g==
X-Google-Smtp-Source: AGHT+IGHZZd/Amavj0QHGcyIaz8LpNpzVxbYh7bVrktY7Z6RcFr/XyBROkDj1btB5KqvrTcGuGXgZg==
X-Received: by 2002:a17:906:4fc7:b0:9be:30c2:b8ff with SMTP id
 i7-20020a1709064fc700b009be30c2b8ffmr4259972ejw.61.1698485511022; 
 Sat, 28 Oct 2023 02:31:51 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 fi23-20020a056402551700b00542d3e470f9sm946842edb.10.2023.10.28.02.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 02:31:50 -0700 (PDT)
Date: Sat, 28 Oct 2023 11:31:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Andrea Bolognani <abologna@redhat.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org, 
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH v3 3/6] target/riscv/tcg: add user flag for profile support
Message-ID: <20231028-b35b6d142ee8d06c1a39a516@orel>
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
 <20231020223951.357513-4-dbarboza@ventanamicro.com>
 <20231023-2018025adea3ffaebbbefe23@orel>
 <0e66af36-bd36-4b42-b901-ed726af207b7@ventanamicro.com>
 <20231023-b0eb8f3478a61875a22de747@orel>
 <CABJz62MN5ha-JH=i+PAu=7hZspV8g85jeAc=hRam0Z1f4fPDEg@mail.gmail.com>
 <20231026-c8c8065150673a1f48f41dd5@orel>
 <CABJz62N0D2x1kP+sPi7xrDMMyG080BesyeAR+6HsnVt0-yi=TQ@mail.gmail.com>
 <e3f53179-7f7e-42a9-8a13-a81bf1beeb89@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3f53179-7f7e-42a9-8a13-a81bf1beeb89@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52c.google.com
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

On Fri, Oct 27, 2023 at 02:52:38PM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 10/26/23 14:36, Andrea Bolognani wrote:
> > On Thu, Oct 26, 2023 at 05:14:49PM +0200, Andrew Jones wrote:
> > > On Thu, Oct 26, 2023 at 07:36:21AM -0700, Andrea Bolognani wrote:
> > > > On Mon, Oct 23, 2023 at 07:35:16PM +0200, Andrew Jones wrote:
> > > > > On Mon, Oct 23, 2023 at 02:00:00PM -0300, Daniel Henrique Barboza wrote:
> > > > > > On 10/23/23 05:16, Andrew Jones wrote:
> > > > > > > Hmm, I'm not sure I agree with special-casing profiles like this. I think
> > > > > > > the left-to-right processing should be consistent for all. I'm also not
> > > > > > > sure we should always warn when disabling a profile. For example, if a
> > > > > > > user does
> > > > > > > 
> > > > > > >    -cpu rv64,rva22u64=true,rva22u64=false
> > > > > > > 
> > > > > > > then they'll get a warning, even though all they're doing is restoring the
> > > > > > > cpu model. While that looks like an odd thing to do, a script may be
> > > > > > > adding the rva22u64=true and the rva22u64=false is the user input which
> > > > > > > undoes what the script did.
> > > > > > 
> > > > > > QEMU options do not work with a "the user enabled then disabled the same option,
> > > > > > thus it'll count as nothing happened" logic. The last instance of the option will
> > > > > > overwrite all previous instances. In the example you mentioned above the user would
> > > > > > disable all mandatory extensions of rva22u64 in the CPU, doesn't matter if the
> > > > > > same profile was enabled beforehand.
> > > > > 
> > > > > Yup, I'm aware, but I keep thinking that we'll only be using profiles with
> > > > > a base cpu type. If you start with nothing (a base) and then add a profile
> > > > > and take the same one away, you shouldn't be taking away anything else. I
> > > > > agree that if you use a profile on some cpu type that already enabled a
> > > > > bunch of stuff itself, then disabling a profile would potentially remove
> > > > > some of those too, but mixing cpu types that have their own extensions and
> > > > > profiles seems like a great way to confuse oneself as to what extensions
> > > > > will be present.  IOW, we should be adding a base cpu type at the same
> > > > > time we're adding these profiles.
> > > > 
> > > > The question that keep bouncing around my head is: why would we even
> > > > allow disabling profiles?
> > > > 
> > > > It seems to me that it only makes things more complicated, and I
> > > > really can't see the use case for it.
> > > > 
> > > > Enabling additional features on top of a profile? There's obvious
> > > > value in that, so that you can model hardware that implements
> > > > optional and proprietary extensions. Enabling multiple profiles?
> > > > You've convinced me that it's useful. But disabling profiles, I just
> > > > don't see it. I believe Alistair was similarly unconvinced.
> > > 
> > > The only value I see in allowing a profile to be disabled is to undo the
> > > enabling of the profile by specifying the profile as 'off' to the right of
> > > it being specified as 'on'. That may seem pointless, but scripts take
> > > advantage of being able to do that. Besides that one possible use case,
> > > there isn't much use in disabling profiles, but treating profile
> > > properties like every other boolean property makes the UI consistent and
> > > should actually simplify the code.
> > 
> > The code might be simpler, but the result is an additional burden on
> > the user, as the interactions between the various flags become much
> > more nuanced and less intuitive. I'm not convinced the trade-off is a
> > worthwhile one.
> > 
> > For the script override scenario, fair enough, but once again I feel
> > that we're making things much worse in the general case in order to
> > cater to a much narrower one. Script authors will naturally learn to
> > avoid hardcoding profile enablement once users have reported enough
> > failures resulting from that.
> 
> I'm not thrilled about how we're able to disable profiles either. I'm
> coping with it because (1) it was a feedback from the first version of
> this work [1] and no one had strong opinions against it back then and
> (2) I believe that users won't find much use in doing "-cpu rv64,profileA=false"
> in a real world/common scenario, so we can get away with this kind of
> weird functionality.
> 
> The profile flag is set to 'false' by default for all current CPUs. If
> the user manually sets it to 'false', well, it doesn't change the internal
> state of the CPU, does it? But then I need to be creative and interpret it
> as 'it's not a default false, it's an user-set false, so I need to disable
> extensions'. I can't think of many qemu options that behave like that, if
> any.

If we provided a mechanism to query the state of profiles, then they
should be 'true' when all their mandatory extensions are present. That
means that, despite defaulting to 'false', they should become true at
realize time after detecting all their mandatory extensions are present,
and then, if a user set the profile false, the user would be disabling
all the profile's extensions along with the profile.

Without a mechanism to query profiles, then it doesn't matter if they
remain false after realize, even if they should be true, but that's just
a coding decision (which probably deserves a code comment).

> 
> We also have the example of RVG, a bit that is default set to 'false' that,
> when enabled, causes IMAFD_zicsr_zifencei to be enabled. Today, if the user
> set RVG to 'false', nothing happens - we're not disabling IMAFD_zicsr_zifencei.

I would disable the extensions that G represents when G is explicitly
disabled, just as I suggest we do for profiles.

> In the latest version of this work there's a deliberate effort to make RVG
> behave like a profile [2], but perhaps I should make profiles behave like RVG.

More extension shorthands are coming[1] and, IMO, they should be addressed
in the same way as G (whatever the final decision on how to address G is).
Since G collects such basic extensions, then it might be hard to reason as
to why it should be possible to disable it, but if, for example, you have
a CPU which supports the Zvkn extensions and you want to test/debug with
all of those extensions disabled, then it'd be nice to do zvkn=off and
expect all of them to be disabled.

[1] https://lore.kernel.org/all/20231026151828.754279-1-max.chou@sifive.com/

> 
> Last but not the least, I'm planning to add a couple of bare-bones CPUs (rv64i
> and rv64e). Disabling profiles in these CPUs is a total waste of cycles since
> the CPUs are already bare.

I've already pointed out a couple times that disabling a profile may be
useful for scripts, particularly for bare-bones CPUs, since you know that
disabling something previously enabled is implementing a clean 'undo'.

> 
> After writing all this stuff, and realizing that profile disablement creates a
> lot of confusion

I'm having trouble imaging this hypothetical user that knows how to
construction QEMU command lines, knows what profiles are meant to enable,
knows how boolean properties work, but would be surprised that
'profile=off' disabled the profile's mandatory extensions and not
surprised when 'profile=off' does nothing. So, for me, 'profile=off' doing
nothing looks like it'll introduce confusion, not the other way around.

> and has no vocal fans, I had a change of heart. Profiles will
> behave like RVG -> if set, mandatory extensions will be enabled (respecting user
> choice on disabled extensions, of course).

I presume the user disabled extensions would need to come to the right of
the profiles on the command line to be respected.

> If disabled, nothing happens. Fans
> of the current design are welcome to weight in the discussion, of course.
> 
> If we decide in the future that stripping extensions from a CPU model is desirable
> we can come up with a 'bare' option, e.g. "-cpu rv64,bare=true" will strip all
> extensions from rv64. This is a much cleaner way of doing what profile disablement
> is currently doing.

Doesn't this just kick the can down the road? I suspect we'd end up
discussing what 'bare=false' means at that time.

Thanks,
drew

