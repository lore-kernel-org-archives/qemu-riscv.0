Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1D1CAC581
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 15:16:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uvdbn-0006iM-98; Mon, 08 Sep 2025 11:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uvdb8-00069k-MN
 for qemu-riscv@nongnu.org; Mon, 08 Sep 2025 11:16:02 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uvdb3-0000tz-2w
 for qemu-riscv@nongnu.org; Mon, 08 Sep 2025 11:16:01 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-71d603b674aso34074277b3.1
 for <qemu-riscv@nongnu.org>; Mon, 08 Sep 2025 08:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757344555; x=1757949355; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZAcq2IzXK25mOsvf+2fXAwLq4HEj1SxvPE63m8e1gQ=;
 b=azUwZ3Ze6GwxSsfMSNiDLmbw2XQFjQ9Hr46/Ga8XT5eTKGny91OKRumxGGEpw4/Iy4
 wTJcm5hjVBNJhXVMWY7snporqkQwM4Hij/6ppRvVraMvM+tyEn2flTDGGxd2/ds0YJ2E
 r3CJQlPPwOoPCFsHG79HoJn5yxhDHFMHortGmzq2ykT5N4LVITdWkT5va/mKDNUVS8P/
 VuYMLsd2KK1ZR89+yI6jkIwQh3L4OmA/hT9WHJKcbAXMtGXvPUYuNKDuIzzD6+477n6s
 bkYsmkxX6WK4MiY0QuyyaT/8Re1E69+vJh5CUwPfuNdHi7prz2kurs9kqlfN/2+0dUxD
 4dqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757344555; x=1757949355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZAcq2IzXK25mOsvf+2fXAwLq4HEj1SxvPE63m8e1gQ=;
 b=snsyyW64Vfw65GD+MEoYKXbHT6sl2ahkSuFwgu30RiRhQkOL3f9lE5QmynzqN60tRk
 sZrWHbfSnwl9JWS5KoExpxhPyUbawRoUmcx9bczdYoJSGHOqJ9Svw4C499bnwm8A3uEz
 npJkyPL85GhNlKZD0LkDkXydY8zLfic3zo2WKnfj2SDYLif1ai5hNKERUUA5MSXMmmIn
 dGuoQZx0M17sXkbeXHABh1VYsnG/NXu8gEYPJjBAJTmL8274hOu1WwKoXWqJWK2WfJQH
 ENbHtYKfGamzDhdZL7I8ZoM6Qy2mvrHA3FQLJlI5xganrBV7znMGyVRoKtPrrBdqN+uH
 pHWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsaYR3T4j/tNUGX4aKfHC84h5TbYTtIYrngW5BbUGnI2E+A0LY8oR7tt7ut48bjjLS+r71BzYQsxpn@nongnu.org
X-Gm-Message-State: AOJu0Yz+WacN2+IOh0l5rlnOt78Wd5P9puWCJPGXCP075aPvdirMc6zO
 xfOUiw4COXNUIUkuS3IATimhUxfhm0knAOYnPn1d+Ke46tom7J4286FOiLjK98Fywjn2WMInwSL
 DQOd9SLXjXPtMfkBabruTvpTf8NMuO5i5+brlWKhbhw==
X-Gm-Gg: ASbGncuOCQ1H906XIL5b84/ktkB09pAESEe1kOgR2+zbs/BQV1dBOEJVZMPZdx4WGq0
 BJS/FOHqU7y5RcO7xPeH/difg/6ySWaC8eR20oX/BoyEMHPclOpuDWVfGBB9lSSLFuLEIFVq//I
 2DmXUtzjbTv4YGIZEeUOsEjAyT9UYipQ0W3Aq4AQbn2dyr7lSOLQ0eUBC8x13MkoY8k+mAUHL/K
 Md1Od70mNqxoJ+oznc7zauMiF9lSA==
X-Google-Smtp-Source: AGHT+IEDU+fQlooTOvlMM2VcYiGvX8krvNtJfTKDsOGW0mShl0215ufnrRm8yOjhX5urQESioN7PwMrgQxmxTu/ejsY=
X-Received: by 2002:a05:690c:450e:b0:721:1649:b041 with SMTP id
 00721157ae682-727f2dbf5e4mr79411807b3.2.1757344554992; Mon, 08 Sep 2025
 08:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250908125058.220973-1-peter.maydell@linaro.org>
 <aL7xrilR-gyByKEM@redhat.com>
In-Reply-To: <aL7xrilR-gyByKEM@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Sep 2025 16:15:43 +0100
X-Gm-Features: Ac12FXysXojhkeI9PxaPxc4_D5jyo7XLzh_wPWfafH0A3ISDGfcma2fYVlbQNQI
Message-ID: <CAFEAcA_wt3HwDq=sJ+VuLdx_RFFwB6E9FjrbT1zgNXGGvfQ9YA@mail.gmail.com>
Subject: Re: [RFC PATCH] docs/system/security: Restrict "virtualization use
 case" to specific machines
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org, 
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 8 Sept 2025 at 16:09, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Sep 08, 2025 at 01:50:57PM +0100, Peter Maydell wrote:
> > Currently our security policy defines a "virtualization use case"
> > where we consider bugs to be security issues, and a
> > "non-virtualization use case" where we do not make any security
> > guarantees and don't consider bugs to be security issues.
> >
> > The rationale for this split is that much code in QEMU is older and
> > was not written with malicious guests in mind, and we don't have the
> > resources to audit, fix and defend it.  So instead we inform users
> > about what the can in practice rely on as a security barrier, and
> > what they can't.
> >
> > We don't currently restrict the "virtualization use case" to any
> > particular set of machine types.  This means that we have effectively
> > barred ourselves from adding KVM support to any machine type that we
> > don't want to put into the "bugs are security issues" category, even
> > if it would be useful for users to be able to get better performance
> > with a trusted guest by enabling KVM. This seems an unnecessary
> > restriction, and in practice the set of machine types it makes
> > sense to use for untrusted-guest virtualization is quite small.
> >
> > Specifically, we would like to be able to enable the use of
> > KVM with the imx8 development board machine types, but we don't
> > want to commit ourselves to having to support those SoC models
> > and device models as part of QEMU's security boundary:
> > https://lore.kernel.org/qemu-devel/20250629204851.1778-3-shentey@gmail.=
com/
> >
> > This patch updates the security policy to explicitly list the
> > machine types we consider to be useful for the "virtualization
> > use case".
> >
> > This is an RFC partly to see if we have consensus that this change
> > makes sense, and partly because I was only able to identify the
> > machine types we want to cover for some of our target architectures.
> > If maintainers for the other architectures could clarify which
> > machine types work with KVM that would be helpful.
>
> The split of "virtualization" vs "non-virtualization" use case
> in the docs was always as rather a crude hack.
>
> "Virtualization uses cases" was more or less a code phrase to
> mean "the subset of QEMU that we traditionally shipped in RHEL"
> as that is approximately what we have reasonable confidence
> about.
>
> Personally I wouldn't assign strict equivalence between "machine
> can use KVM" and  "virtualization use case".

I agree, but this is effectively what our docs are currently doing,
and what I'm trying to decouple with this patch...

> Case in point - the "isapc" machine type can use KVM but I would
> not consider that to be a virtualization use case, and would likely
> reject a security report if it /only/ affected isapc, and not 'pc'
> / 'q35'.
>
> We didn't want to undertake the work to annotate every QOM/QDev
> impl in QEMU with info about whether we considered it in scope
> for security fixes or not, which is what we really ought to do
> at some point. The main challenge is someone having the time
> to do the audit & annotation work.
>
> > diff --git a/docs/system/security.rst b/docs/system/security.rst
> > index f2092c8768b..395c2d7fb88 100644
> > --- a/docs/system/security.rst
> > +++ b/docs/system/security.rst
> > @@ -35,6 +35,34 @@ malicious:
> >  Bugs affecting these entities are evaluated on whether they can cause =
damage in
> >  real-world use cases and treated as security bugs if this is the case.
> >
> > +To be covered by this security support policy you must:
> > +
> > +- use a virtualization accelerator like KVM or HVF
> > +- use one of the machine types listed below
> > +
> > +It may be possible to use other machine types with a virtualization
> > +accelerator to provide improved performance with a trusted guest
> > +workload, but any machine type not listed here should not be
> > +considered to be providing guest isolation or security guarantees,
> > +and falls under the "non-virtualization use case".
> > +
> > +Supported machine types for the virtualization use case, by target arc=
hitecture:
> > +
> > +aarch64
> > +  ``virt``
> > +i386, x86_64
> > +  ``microvm``, ``xenfv``, ``xenpv``, ``xenpvh``, ``pc``, ``q35``, ``is=
apc``
> > +s390x
> > +  ``s390-ccw-virtio``
> > +loongarch64:
> > +  ``virt``
> > +ppc, ppc64:
> > +  TODO
> > +mips, mips64:
> > +  TODO
> > +riscv32, riscv64:
> > +  TODO
>
> Currently 'virtualization use case' is reasonably vague such that we can
> bend its scope as we desire, at the time it is questioned in a possible
> security report.
>
> Machine types are only one aspect of this. Devices are the other, and
> the area where it gets significantly more fuzzy and difficult because
> essentially any device can be used with KVM, and where we draw the
> line is fairly arbitrary.

I think that being vague like this is a disservice to our users.
If I'm a user of QEMU, I'd like to know whether I'm inside the
line or outside of it before I put my config into production,
not later on when it turns out there was an exploitable bug
that wasn't classified as a security issue...

Most devices can't in fact be used with KVM, because they're
sysbus devices that aren't used in the machines that you can
use with KVM. Pluggable devices are rarer (and yes, under
our current policy random PCI devices are effectively
in-scope).

thanks
-- PMM

