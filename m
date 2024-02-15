Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02DBC48BEC
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 19:11:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rah9G-0001R3-1q; Thu, 15 Feb 2024 14:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rah9E-0001Qd-P7
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 14:11:52 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rah9C-0001IH-CQ
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 14:11:52 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4122a8566e4so4978825e9.2
 for <qemu-riscv@nongnu.org>; Thu, 15 Feb 2024 11:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1708024307; x=1708629107; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F6262ZqdQybtdkef3Uue0giVjqQ3jAwrdHPAc2t/8pY=;
 b=GY5cW612hdY8Ma9TaC5RzJ1eumhyF5Mhq9MSUiBJHUUaPV8YTqYQLgPoFHx2653MVv
 HHFnaEtPlqpeNIvMAOzquRvIAaSlUOZjn2zzboNJzVH30umgRCMRXBhqGo1+f9Pa1R33
 6eEUPRsEe3IwrV55mafjCMI0PayOPX70U3vfsQDyq1X1JD8vHpE44ZXvVwpOlH2I+pTv
 uqXsJ4gat8Vf2kLqq698cgozpeKcgjrf4Bge5kHo9HTN1dxyiZJV5H9+M5TBVQHJ1FOO
 riJ93oAn5hqtFFNnAwAiJ3Z9c0uVKT+rl/RUdzxCnZrwNe6SnQid7MoN0SNwgTDpNXyi
 53OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708024307; x=1708629107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F6262ZqdQybtdkef3Uue0giVjqQ3jAwrdHPAc2t/8pY=;
 b=o1T0zXyetsT4iJrK1ulP5hxkkFfSOXMZKbDwjhc2YLpV5ASHIdeLNIrS9L9WDRMJl1
 KZWl2otZcIiG8Scua2yBKHsYpOTKZdWMSWB8/YILQg7pZOc9qm+ka+fhqk2GFUNCuTAW
 rjXQOPnSEY9vApyTGQc0UNK96SjOA6hXjjFFFNI9hzeqL+o87yB6BP8SRJ7UJjZyyb3N
 1CjsSJSQnBV0Xskl6htDrQeOmncmcN+kJfkMWdTSeB+MxsSvRysk+L8t5J27YFmar54S
 kHnG+AfIwhRymlxXzVfoXaSx5x5i/0xaU27uRiGnpWjcR9rAOi7ky8oq3Biv6CfjAf2P
 F35w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFxPS2Lt90i1kxnA3pMuvLSwhu0NahmUVCWsb+BESt936cDEVV0bKSHZXEPp/ZyRLDqCAntjtHrLuEupbV3X1SDgnQCHg=
X-Gm-Message-State: AOJu0YzLIRk3ONML+Ds6SHobQJHN0a+K2ceq+Xxxw6Kofvv6noUst10K
 1+Vi5i1eUEHlpWUqvFybXSUPRcztcRuccFxf7upccwvGK8ywJ4H97q7LXvvLdjA=
X-Google-Smtp-Source: AGHT+IGErtkjNuypc1ii3UcwxM1iCc+zNEDAfvrtYHzDDhMO+YFBnJ3BI0UHuJBBIxpyzVRGHZxcBg==
X-Received: by 2002:adf:e6c3:0:b0:33c:ddc2:ca0c with SMTP id
 y3-20020adfe6c3000000b0033cddc2ca0cmr1798870wrm.56.1708024306559; 
 Thu, 15 Feb 2024 11:11:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 bu23-20020a056000079700b0033b7d9c14desm23406wrb.5.2024.02.15.11.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 11:11:46 -0800 (PST)
Date: Thu, 15 Feb 2024 20:11:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v3 3/6] target/riscv: add remaining named features
Message-ID: <20240215-8e556e6029ee11ee7317db8b@orel>
References: <20240202152154.773253-1-dbarboza@ventanamicro.com>
 <20240202152154.773253-4-dbarboza@ventanamicro.com>
 <20240215-alkaline-saturday-275cd8e3aa39@spud>
 <20240215-55440212b4d6cde9feab5d94@orel>
 <20240215-overhear-paycheck-8c70c17bd151@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215-overhear-paycheck-8c70c17bd151@spud>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Feb 15, 2024 at 04:34:32PM +0000, Conor Dooley wrote:
> On Thu, Feb 15, 2024 at 03:26:18PM +0100, Andrew Jones wrote:
> > On Thu, Feb 15, 2024 at 01:33:47PM +0000, Conor Dooley wrote:
> > > On Fri, Feb 02, 2024 at 12:21:51PM -0300, Daniel Henrique Barboza wrote:
> > > > The RVA22U64 and RVA22S64 profiles mandates certain extensions that,
> > > > until now, we were implying that they were available.
> > > > 
> > > > We can't do this anymore since named features also has a riscv,isa
> > > > entry. Let's add them to riscv_cpu_named_features[].
> > > > 
> > > > Instead of adding one bool for each named feature that we'll always
> > > > implement, i.e. can't be turned off, add a 'ext_always_enabled' bool in
> > > > cpu->cfg. This bool will be set to 'true' in TCG accel init, and all
> > > > named features will point to it. This also means that KVM won't see
> > > > these features as always enable, which is our intention.
> > > > 
> > > > If any accelerator adds support to disable one of these features, we'll
> > > > have to promote them to regular extensions and allow users to disable it
> > > > via command line.
> > > > 
> > > > After this patch, here's the riscv,isa from a buildroot using the
> > > > 'rva22s64' CPU:
> > > 
> > > Why does an "rva22s64" cpu have "zicclsm" in it? Isn't zicclsm only
> > > present in "u" profiles?
> > 
> > "s" profiles mandate all the "u" profile mandatory extensions. For example
> > 6.2.2 says
> > 
> > """
> > The RVA22S64 mandatory unprivileged extensions include all the mandatory unprivileged
> > extensions in RVA22U64.
> > """
> 
> Doesn't that rule out emulating misaligned access in s-mode if you want
> to be profile compliant?

That's how I interpret it, but I'll defer to a profile spec author, or
at least to somebody more confident of their spec interpretation skills.

> 
> > > >  # cat /proc/device-tree/cpus/cpu@0/riscv,isa
> > > > rv64imafdc_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_
> > > > zicntr_zicsr_zifencei_zihintpause_zihpm_za64rs_zfhmin_zca_zcd_zba_zbb_
> > > > zbs_zkt_ssccptr_sscounterenw_sstvala_sstvecd_svade_svinval_svpbmt#
> > > 
> > > I want to raise my frustration with the crock we've been given here by
> > > RVI. Any "named feature" that just creates a name for something that
> > > already is assumed is completely useless, and DT property that is used
> > > to communicate it's presence cannot be used - instead the property needs
> > > to be inverted - indicating the absence of that named feature.
> > > 
> > > Without the inversion, software that parses "riscv,isa" cannot make any
> > > determination based on the absence of the property - it could be parsing
> > > an old DT that does not have the property or it could be parsing the DT
> > > of a system that does not support the extension.
> > 
> > I'm guessing any platform which wants to advertise that it's compliant
> > with a profile will update its hardware descriptions to ensure all the
> > profile's mandatory extensions are presented. But, I think I understand
> > your concern. If somebody is parsing the ISA string as way to determine
> > if the platform is compliant with a profile, then they may get a false
> > negative due to the ISA string missing a newly named feature.
> 
> Nah, you misunderstand me. I don't care at all about profiles or
> checking for compliance with one. I'm only interested in how my software
> can check that some feature is (or is not) supported. This creating a name
> for something implicit business is not a problem in and of itself, but
> putting then into "riscv,isa" is a pointless activity as it communicates
> nothing.
> 
> > I'm not
> > sure how much of a problem that will be in practice, though, since testing
> > for profile compliance, just for the sake of it, doesn't seem very useful.
> > Software really only needs to know which extensions are available and if
> > it's an old feature that got newly named, then software likely already
> > has another way of detecting it.
> 
> Right. That part is fine, but creating extensions for these things we
> previously assumed present gives me the impression that creating systems
> that do not support these features is valid. IFF that does happen,
> removing the string from "riscv,isa" isn't going to be able to
> communicate that the feature is unsupported.

Ah, now I think I understand the concern. The new names might as well be
ignored because the absence of the names in the hardware descriptions is
ambiguous. I guess I'd encourage software that has a role in advertising
features to use the new names when it has detected the feature or assumes
the feature is present (and presumably wouldn't be running if its
assumption was wrong). If, for example, Linux puts a new name in
/proc/cpuinfo after detecting or assuming the feature's presence, then it
no longer matters that the hardware description had it or not from the
perspective of the /proc/cpuinfo consumer (assuming they're aware of which
kernel version they need). With these types of fixups and enough time,
then hopefully most of the software ecosystem will able to live in
ignorant bliss.

> The commit message here
> says:
> > > > If any accelerator adds support to disable one of these features, we'll
> > > > have to promote them to regular extensions and allow users to disable it
> > > > via command line.
> 
> Which is part of what prompted me here, since they cannot be handled in
> the same way that "regular extensions" are.
>

From QEMU's perspective, they can. Linux or whatever software consuming
the hardware descriptions may want to distrust the absence of newly
named feature extensions and do their own checks, but that's not QEMU's
concern. Actually, being able to disable these newly named features allows
Linux and other software to test how they behave when the feature goes
away. Do they crash fast and clean or do they go off in the weeds? Does
their ad hoc detection actually work?

Thanks,
drew

