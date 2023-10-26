Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4171C25B48
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 17:37:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw4I6-00027j-DD; Thu, 26 Oct 2023 13:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qw4I5-00027F-MP
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 13:37:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qw4I3-0001Sr-10
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 13:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698341819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=58DSEKgNjOLGRuYvpzLT7WeIifJBOGKc9mpmnTiMhP0=;
 b=M67NI3/m9X3BVvRUAqXJhwCj4FzaKq3hxgU/uQp787nj3/avJMQ42pPD4rR8dsP59RKfRV
 tay5GAHGeXmWXjJuWeJLqbDoUBlkk1R/H4zNPtfZal6cVE9viz1V6AW3F8i/psPzdd74pm
 R50xKT7G0jj1Rd6BEsSI9GMlzxII36o=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-PFdD00e2PNeNc2XSwhIoTw-1; Thu, 26 Oct 2023 13:36:58 -0400
X-MC-Unique: PFdD00e2PNeNc2XSwhIoTw-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-66d0b251a6aso15158466d6.2
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 10:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698341818; x=1698946618;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=58DSEKgNjOLGRuYvpzLT7WeIifJBOGKc9mpmnTiMhP0=;
 b=tQpk/4LE6I14h/bg8p+X0e8wCriv+npXqqfKRP6Xf5Lnq6K5xm/OqVae1IVxM/Frjp
 hIcLiq87oxegCOFs0/BEvRxOiSaUUv1YpJpxuIWJi+zWqNwPT/q478rvQEfH2L6Sud9D
 0AYrd52Ju9lAefdcHrTZBGWsiVYsagh5iv9wvh+AwxGlGDHPuK0Ks6MlBfH/n6mR3NOu
 VDDoaXeg3IioOqrW+ZDZN4BH416+OhsOZnOQJA/fo0r6EdIvRR9LFsy5vKNGhkwEntjO
 xlcNY0wf7zYOeyvaxdHS/jLPhpwb40SL+Zxay4NrrIgjtZkALwQPLWB4Bhsn5cQJSnrI
 d98A==
X-Gm-Message-State: AOJu0Yw4bwLjmPQTQ5VAbJSvDZdQ8QLDtDs1OdJIwhlIKHiXAnNKVBfz
 quhyM76T9ypNPg3cltW5Tq7JNBIqGaMAxuGRulm5oqq/TceZVmbfNenXeR3DgdHtlyHdfGcdIex
 wxYZZX9YVQhqlW7I/rX4iVC7QX2bmUV4=
X-Received: by 2002:ac8:5b87:0:b0:41e:2495:41e1 with SMTP id
 a7-20020ac85b87000000b0041e249541e1mr300858qta.37.1698341818413; 
 Thu, 26 Oct 2023 10:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHihsc5clZC9TicAqwOudHEVtqOcCUBIgei2ku+EvFNATLj0k1T4dxUt2HoVEXuSyTcWZnOZ8/5tpA+02olDdw=
X-Received: by 2002:ac8:5b87:0:b0:41e:2495:41e1 with SMTP id
 a7-20020ac85b87000000b0041e249541e1mr300835qta.37.1698341818097; Thu, 26 Oct
 2023 10:36:58 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Oct 2023 10:36:57 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
 <20231020223951.357513-4-dbarboza@ventanamicro.com>
 <20231023-2018025adea3ffaebbbefe23@orel>
 <0e66af36-bd36-4b42-b901-ed726af207b7@ventanamicro.com>
 <20231023-b0eb8f3478a61875a22de747@orel>
 <CABJz62MN5ha-JH=i+PAu=7hZspV8g85jeAc=hRam0Z1f4fPDEg@mail.gmail.com>
 <20231026-c8c8065150673a1f48f41dd5@orel>
MIME-Version: 1.0
In-Reply-To: <20231026-c8c8065150673a1f48f41dd5@orel>
Date: Thu, 26 Oct 2023 10:36:57 -0700
Message-ID: <CABJz62N0D2x1kP+sPi7xrDMMyG080BesyeAR+6HsnVt0-yi=TQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] target/riscv/tcg: add user flag for profile support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, Oct 26, 2023 at 05:14:49PM +0200, Andrew Jones wrote:
> On Thu, Oct 26, 2023 at 07:36:21AM -0700, Andrea Bolognani wrote:
> > On Mon, Oct 23, 2023 at 07:35:16PM +0200, Andrew Jones wrote:
> > > On Mon, Oct 23, 2023 at 02:00:00PM -0300, Daniel Henrique Barboza wrote:
> > > > On 10/23/23 05:16, Andrew Jones wrote:
> > > > > Hmm, I'm not sure I agree with special-casing profiles like this. I think
> > > > > the left-to-right processing should be consistent for all. I'm also not
> > > > > sure we should always warn when disabling a profile. For example, if a
> > > > > user does
> > > > >
> > > > >   -cpu rv64,rva22u64=true,rva22u64=false
> > > > >
> > > > > then they'll get a warning, even though all they're doing is restoring the
> > > > > cpu model. While that looks like an odd thing to do, a script may be
> > > > > adding the rva22u64=true and the rva22u64=false is the user input which
> > > > > undoes what the script did.
> > > >
> > > > QEMU options do not work with a "the user enabled then disabled the same option,
> > > > thus it'll count as nothing happened" logic. The last instance of the option will
> > > > overwrite all previous instances. In the example you mentioned above the user would
> > > > disable all mandatory extensions of rva22u64 in the CPU, doesn't matter if the
> > > > same profile was enabled beforehand.
> > >
> > > Yup, I'm aware, but I keep thinking that we'll only be using profiles with
> > > a base cpu type. If you start with nothing (a base) and then add a profile
> > > and take the same one away, you shouldn't be taking away anything else. I
> > > agree that if you use a profile on some cpu type that already enabled a
> > > bunch of stuff itself, then disabling a profile would potentially remove
> > > some of those too, but mixing cpu types that have their own extensions and
> > > profiles seems like a great way to confuse oneself as to what extensions
> > > will be present.  IOW, we should be adding a base cpu type at the same
> > > time we're adding these profiles.
> >
> > The question that keep bouncing around my head is: why would we even
> > allow disabling profiles?
> >
> > It seems to me that it only makes things more complicated, and I
> > really can't see the use case for it.
> >
> > Enabling additional features on top of a profile? There's obvious
> > value in that, so that you can model hardware that implements
> > optional and proprietary extensions. Enabling multiple profiles?
> > You've convinced me that it's useful. But disabling profiles, I just
> > don't see it. I believe Alistair was similarly unconvinced.
>
> The only value I see in allowing a profile to be disabled is to undo the
> enabling of the profile by specifying the profile as 'off' to the right of
> it being specified as 'on'. That may seem pointless, but scripts take
> advantage of being able to do that. Besides that one possible use case,
> there isn't much use in disabling profiles, but treating profile
> properties like every other boolean property makes the UI consistent and
> should actually simplify the code.

The code might be simpler, but the result is an additional burden on
the user, as the interactions between the various flags become much
more nuanced and less intuitive. I'm not convinced the trade-off is a
worthwhile one.

For the script override scenario, fair enough, but once again I feel
that we're making things much worse in the general case in order to
cater to a much narrower one. Script authors will naturally learn to
avoid hardcoding profile enablement once users have reported enough
failures resulting from that.

> > > > > As far as warnings go, it'd be nice to warn when mandatory profile
> > > > > extensions are disabled from an enabled profile. Doing that might be
> > > > > useful for debug, but users which do it without being aware they're
> > > > > "breaking" the profile may learn from that warning. Note, the warning
> > > > > should only come when the profile is actually enabled and when the
> > > > > extension would actually be disabled, i.e.
> > > > >
> > > > >   -cpu rv64,rva22u64=true,c=off
> > > > >
> > > > > should warn
> > > > >
> > > > >   -cpu rv64,c=off,rva22u64=true
> > > > >
> > > > > should not warn (rva22u64 overrides c=off since it's to the right)
> > > > >
> > > > >   -cpu rv64,rva22u64=true,rva22u64=false,c=off
> > > > >
> > > > > should not warn (rva22u64 is not enabled)
> >
> > I think these should be hard errors, not warnings.
> >
> > If you're enabling a profile and then disabling an extension that's
> > mandatory for that profile, you've invalidated the profile. You've
> > asked for a configuration that doesn't make any sense: you can't have
> > a CPU that both implements a profile and lacks one of its mandatory
> > extensions.
>
> Given a platform which implements a profile which mandates extension E and
> a need to debug E or test behavior where E is [incorrectly] absent, you'll
> need to expand the profile first, listing each of the other extensions
> manually. It'd be much faster to specify the profile, take away the
> extension, and ignore the warning.

I understand the appeal, I just think that regular users should be
prevented from stumbling into this kind of expert-level,
intentionally-broken configuration by mistake.

> > QEMU users could easily miss the warning. libvirt users won't see it
> > at all. It's a user error and it needs to be treated as such IMO.
>
> I do agree with the concern that warnings will be missed/ignored. Maybe
> QEMU needs something like -Werror for stuff like this, i.e.
>
>  -cpu rv64,error-on-extension-warnings=on,profile-A=on,extension-of-A=off
>
> would error out, but, without the special property, just warn. Or, flip
> the default behavior around with
>
>  -cpu rv64,ignore-extension-errors=on,profile-A=on,extension-of-A=off
>
> which would either silently proceed or just warn, but, without the
> special property, error out. libvirt would default to the error out
> case, whichever that one is, but also provide an element to turn off
> erroring-out.

I would be okay with something along these lines.

-- 
Andrea Bolognani / Red Hat / Virtualization


