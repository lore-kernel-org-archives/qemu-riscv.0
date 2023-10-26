Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BCCC25B67
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 14:36:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw1TJ-00009r-8p; Thu, 26 Oct 2023 10:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qw1TH-00008b-KJ
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 10:36:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qw1TF-0006TD-UV
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 10:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698330984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9NKnS1R0ipxCuX+GlOe6W7MOgkmBECREE3MMX2SBRzU=;
 b=NC77jNR5YUOrmiA06+xu6q2VYuUUX9llv8A5CFA1yYu/+AhPaTrU4/tGb2//ScYJiysCvH
 QqigSjH9FXJbT7FJt5ruyq3UPVCG3pTYM4Tdij880Cw6LJ5abHIyfj5huONnKuCLboXz4m
 Qh3jrnTM5vzT/O9KiyLe4Ioms4XLXvg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-Ml_Q9_SCP4uKGENgG16lqw-1; Thu, 26 Oct 2023 10:36:23 -0400
X-MC-Unique: Ml_Q9_SCP4uKGENgG16lqw-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-41cb4d6744bso13655781cf.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 07:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698330983; x=1698935783;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9NKnS1R0ipxCuX+GlOe6W7MOgkmBECREE3MMX2SBRzU=;
 b=pbgR9FfFK5u4Qjqm8hdxk2EIL36jgkY4lZHk5NZKCQumyIWRhqLbqdEyyKbzec4hvw
 mqgas4QOXZxUD8vfv8gSNIh69LqerGxr5h5x8rT7Lu4+v6KTWsv3maz67xC+IfH0YZLc
 1noYILYOyxNcUP80q23pVxei2kBGz+MuZjG5+tT/Diw4CLD5q+uQ9SNsdRpyqMwD0E2U
 7WdwrBY11IN68X/pb9wenp/KD/DWYbWxIV2ZaP11zkPARvxQuKKdrNWORLEALANz7SiR
 t6/NSkqnNQJL8UxdC6dFkwk/6AmGTkF5vqb+iTkAnjaYQ8gXclfiu+8jL+w4aDyzNFdj
 LN4A==
X-Gm-Message-State: AOJu0Ywm7onkMB+5/KT76YfCrJO8DC3hVl+JEEigAmayzMtqFfPy9vdW
 wLBh41V3p6Bx6WyRx1gS5D7TMBsZC2+JJ+2D5098x++iHVN++KeAhQKcPLzVEq7SVJjrcjT2tR+
 DiDEGXVrQsOVCA3jXVpX1t7y13gpKfQ4=
X-Received: by 2002:ac8:5793:0:b0:405:3dcf:1182 with SMTP id
 v19-20020ac85793000000b004053dcf1182mr21752406qta.50.1698330982835; 
 Thu, 26 Oct 2023 07:36:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaMn69lhb4x8rxQWi40nXAzNPjv/zhw1w8dLyAzimsT3VgthZB1BK1AbpSbL8Dhvso4RsQQYhwfyIfNHmGlF0=
X-Received: by 2002:ac8:5793:0:b0:405:3dcf:1182 with SMTP id
 v19-20020ac85793000000b004053dcf1182mr21752385qta.50.1698330982569; Thu, 26
 Oct 2023 07:36:22 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Oct 2023 07:36:21 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
 <20231020223951.357513-4-dbarboza@ventanamicro.com>
 <20231023-2018025adea3ffaebbbefe23@orel>
 <0e66af36-bd36-4b42-b901-ed726af207b7@ventanamicro.com>
 <20231023-b0eb8f3478a61875a22de747@orel>
MIME-Version: 1.0
In-Reply-To: <20231023-b0eb8f3478a61875a22de747@orel>
Date: Thu, 26 Oct 2023 07:36:21 -0700
Message-ID: <CABJz62MN5ha-JH=i+PAu=7hZspV8g85jeAc=hRam0Z1f4fPDEg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] target/riscv/tcg: add user flag for profile support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Oct 23, 2023 at 07:35:16PM +0200, Andrew Jones wrote:
> On Mon, Oct 23, 2023 at 02:00:00PM -0300, Daniel Henrique Barboza wrote:
> > On 10/23/23 05:16, Andrew Jones wrote:
> > > Hmm, I'm not sure I agree with special-casing profiles like this. I think
> > > the left-to-right processing should be consistent for all. I'm also not
> > > sure we should always warn when disabling a profile. For example, if a
> > > user does
> > >
> > >   -cpu rv64,rva22u64=true,rva22u64=false
> > >
> > > then they'll get a warning, even though all they're doing is restoring the
> > > cpu model. While that looks like an odd thing to do, a script may be
> > > adding the rva22u64=true and the rva22u64=false is the user input which
> > > undoes what the script did.
> >
> > QEMU options do not work with a "the user enabled then disabled the same option,
> > thus it'll count as nothing happened" logic. The last instance of the option will
> > overwrite all previous instances. In the example you mentioned above the user would
> > disable all mandatory extensions of rva22u64 in the CPU, doesn't matter if the
> > same profile was enabled beforehand.
>
> Yup, I'm aware, but I keep thinking that we'll only be using profiles with
> a base cpu type. If you start with nothing (a base) and then add a profile
> and take the same one away, you shouldn't be taking away anything else. I
> agree that if you use a profile on some cpu type that already enabled a
> bunch of stuff itself, then disabling a profile would potentially remove
> some of those too, but mixing cpu types that have their own extensions and
> profiles seems like a great way to confuse oneself as to what extensions
> will be present.  IOW, we should be adding a base cpu type at the same
> time we're adding these profiles.

The question that keep bouncing around my head is: why would we even
allow disabling profiles?

It seems to me that it only makes things more complicated, and I
really can't see the use case for it.

Enabling additional features on top of a profile? There's obvious
value in that, so that you can model hardware that implements
optional and proprietary extensions. Enabling multiple profiles?
You've convinced me that it's useful. But disabling profiles, I just
don't see it. I believe Alistair was similarly unconvinced.

> > > As far as warnings go, it'd be nice to warn when mandatory profile
> > > extensions are disabled from an enabled profile. Doing that might be
> > > useful for debug, but users which do it without being aware they're
> > > "breaking" the profile may learn from that warning. Note, the warning
> > > should only come when the profile is actually enabled and when the
> > > extension would actually be disabled, i.e.
> > >
> > >   -cpu rv64,rva22u64=true,c=off
> > >
> > > should warn
> > >
> > >   -cpu rv64,c=off,rva22u64=true
> > >
> > > should not warn (rva22u64 overrides c=off since it's to the right)
> > >
> > >   -cpu rv64,rva22u64=true,rva22u64=false,c=off
> > >
> > > should not warn (rva22u64 is not enabled)

I think these should be hard errors, not warnings.

If you're enabling a profile and then disabling an extension that's
mandatory for that profile, you've invalidated the profile. You've
asked for a configuration that doesn't make any sense: you can't have
a CPU that both implements a profile and lacks one of its mandatory
extensions.

QEMU users could easily miss the warning. libvirt users won't see it
at all. It's a user error and it needs to be treated as such IMO.

-- 
Andrea Bolognani / Red Hat / Virtualization


