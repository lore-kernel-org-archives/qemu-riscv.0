Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B57B606A323
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r4qQv8TC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRpH9-0000l3-Gn; Fri, 13 Nov 2026 06:17:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xRpGt-0000jY-5V
 for qemu-riscv@nongnu.org; Fri, 13 Nov 2026 06:16:44 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xRpGn-0003yJ-U0
 for qemu-riscv@nongnu.org; Fri, 13 Nov 2026 06:16:40 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-490c3ae81d3so343022f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 03:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794568578; x=1795173378; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Z5T7KC9KEsnaJXG/Nxm1+17MkAMKL3cV3etgewWGJXI=;
 b=r4qQv8TCXUcWdoRi7l1dKyHQCaHjQNCk1hRhZLH0m6wLON6IX5Tx15hSVrD0t3W8Ad
 FkYcXifjd26Jh8jnZtQDBEmhZPVqSNoUsmTWo/7sfTW+mY5kgjz8rlB3NLfT4IkOQJx+
 GexdA0G8N+PtZq38UrWfgKW5fv5kyysxvTuzoSdWFpvL70xnSMnPluCj1LBtIUOHxrsp
 WmqG8ozkKu8qMluy8Ri7Wj5g126PBgixLvkMjHgzmtJKN/mRg8kbULlJarn1LnK7DPaH
 /v6WO1Ny88VCVCQ6qaI3WjEQkaa7YYBCBsYtoA9qilev11OTEm32UOydz+UdypmGLdiz
 wv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794568578; x=1795173378;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Z5T7KC9KEsnaJXG/Nxm1+17MkAMKL3cV3etgewWGJXI=;
 b=hkCe0FJ7nFoKbUQbUFcr9IQxVIIfYAszNiFuGeBgNsgCInCyJDerH/hup54dZBJmJ+
 n3AjJh2VCDO1lKRBZ3zD0MgGclmendqRbqg0OtQdCMdSQfb2neiK/y5yVYSD6bnbfxQk
 9UEK7IFKhOjzkwbgZCqLnF5kPgSBznccSGEzJfdzYxqkFh4qOW7LeKt48Bq/QjoFgGbm
 r55MyhQoYL6UN+IiXfCCa6pb03Tz5z0ODc4RFS/k36IhAdePuDUI997v3JAlIR3K5PIa
 v6p4eA3sV4oKVqK8preRKi6ilYUbKaNSy8k6+zkva43VOUTXmpcPL2Q0SwFgqSDrtaI0
 OUig==
X-Forwarded-Encrypted: i=1;
 AL+hErGLRQs9NPsIrlDEGGy/ZMIuOGZ4U5rZUHepu0YEm3uo3wDWDOLdH4S07gw90xo0G8bvSfBZJqNqn6l3@nongnu.org
X-Gm-Message-State: APuU4Z91UdyE0tNVDlw+dzuuXuyWMU7oQRXsoxq9WXcTJQloU9nL5GYm
 mdN0gfmO5+dY+gdQtyE/62QLN4fan5N+s1q/nJIMmEYa33iQrUdsjo2X2AGXS4IDgzQ=
X-Gm-Gg: AYBFou2XLu8u4q7Tihx7ogK0KJG0hnLUV9H/8o6Mhv0ULLdxAycTp8K92kQ40GJ1D2i
 5u7n6tHgjB0J28bKvMEzYS39tXINJFvTxAUhEQMVr3Vt1ICmAiccRsiFSOYG4nr4FVjtDGRJydU
 swcz3oXGp5K6Xui7Nv1vSju9qcRran6xasv6hNCn3A+lLnyyk9/4ybdq+XS66nnIwA1Ws5EZ52C
 pxYjz5YsyfZf6Wj8mVVoJFLMR/HLXBCy10gOalsvw9A8z672HBlN51whOWb84+F1Cl+hjgvGYfK
 JFVQgJ8PIn0a6hmz+dRLyWDNGUKiE/Eo9YU+VmGCZIltGR8VSOZtsXeNmC+MmKLCJyGnRQcd2EW
 dEaaRkSc6AVxbDIdyOuV+hX1OgxL+tZu+fYYrrQfcApaLahOBBwbdrScMOSR6kgjCoT4CeSQK+j
 5muXJGvc3qmAjAbmiQJUSB1n/EPBBV8PWNAXxiD+z4ARYJHk0IF6hc49iSRmr7P+AGK1rHSCBy+
 2rGCCquABMld0dlFZEevdRgyQ1AOfC4Nl6OJ7BYANCtK41cCaVN+GEE6S3yrA2fi5gTAW6DoIjd
 +HmDIpu8jNejOReoHbQnGI9LaP5i
X-Received: by 2002:a05:6000:26c9:b0:493:32cf:ff9a with SMTP id
 ffacd0b85a97d-49c7325c195mr5368421f8f.56.1794568577587; 
 Fri, 13 Nov 2026 03:16:17 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c60f8d615sm4759244f8f.56.2026.11.13.03.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 03:16:16 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 892D65F87D;
 Fri, 13 Nov 2026 11:16:15 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth
 <thuth@redhat.com>,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Peter
 Maydell <peter.maydell@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org,  qemu-block@nongnu.org,  qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 04/28] hw: mark all remaining virtio object types as
 secure
In-Reply-To: <avYM-3jVbW65NYyk@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 12 Nov 2026 19:01:15 +0000")
References: <20261029131241.2275706-1-berrange@redhat.com>
 <20261029131241.2275706-5-berrange@redhat.com>
 <fe7f7d29-8ca3-4ced-afcc-c768b84c4888@redhat.com>
 <CAMxuvazfhfGSZCiSi+viwJ7f7XDWAZfjmW39n3a7a-qQyw-YSA@mail.gmail.com>
 <au3mwO32b0-PSXKu@redhat.com>
 <CAMxuvayhYcOvH2QPptrKUQGFHoRxQcM1USF5OwuZYR_g2c4zgw@mail.gmail.com>
 <au4Pa4GFA4u-XQ7J@redhat.com> <avYM-3jVbW65NYyk@redhat.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Fri, 13 Nov 2026 11:16:15 +0000
Message-ID: <87ik21asn4.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Alex, as the virtio-gpu* maintainer can you give your opinion
> on the discussion below about virtio-gpu security tagging
> vs our current security policy for "virtualization use case"
> to ack/nack the proposal.

I'm inclined to agree with Marc-Andre here - the 3D GPU attack surface
is large and for the in-QEMU handling we have a bunch of issues with GPU
context handling between threads that make it tricky. Compounding that
ruttabaga is not very well tested at all because its hard to enable
without non-distro libs (for now).

Finally virtio-gpu is Odd Fixes so it's not getting the response times
of other VirtIO stuff in terms of handling security issues.

We should encourage users to use vhost-user-gpu for 3D stuff because at
least then the rendering pipeline and processing of guest controlled
data is easier to sandbox.

So I'd say:

  - virtio-gpu for 2d - OK
  - virtio-gpu for 3d via vhost - OK
  - virtio-gpu for 3d in QEMU - Not OK
=20=20
Alex.

>
> On Fri, Nov 06, 2026 at 05:33:31PM +0000, Daniel P. Berrang=C3=A9 wrote:
>> On Fri, Nov 06, 2026 at 06:52:27PM +0400, Marc-Andr=C3=A9 Lureau wrote:
>> > Hi
>> >=20
>> > On Fri, Nov 6, 2026 at 6:40=E2=80=AFPM Daniel P. Berrang=C3=A9 <berran=
ge@redhat.com> wrote:
>> > >
>> > > On Fri, Nov 06, 2026 at 06:35:29PM +0400, Marc-Andr=C3=A9 Lureau wro=
te:
>> > > > Hi
>> > > >
>> > > > On Fri, Nov 6, 2026 at 3:53=E2=80=AFPM Thomas Huth <thuth@redhat.c=
om> wrote:
>> > > > >
>> > > > > On 29/10/2026 14.12, Daniel P. Berrang=C3=A9 wrote:
>> > > > > > These are all intended for use in a virtualization scenario an=
d must
>> > > > > > provide a security boundary.
>> > > > > >
>> > > > > > Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > > > > > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> > > > > > ---
>> > > > > Reviewed-by: Thomas Huth <thuth@redhat.com>
>> > > > >
>> > > >
>> > > > I have a second thought about this, I'd like to exclude all
>> > > > gpu-accelerated paths for now. virgl/mesa/rutabaga expose a very l=
arge
>> > > > attack surface, so I'd like to drop them from the secure boundary
>> > >
>> > > Rather than repost, please see my response for patch 2:
>> > >
>> > >   https://lists.gnu.org/archive/html/qemu-devel/2026-11/msg01530.html
>> > >
>> > > TL;DR: we have already promised anything virtio related is in scope
>> > > for security handling for a long time, as they are all unambiguously
>> > > "virtualization use case".
>> > >
>> >=20
>> > the value of a secure policy enforcement is low if we know those
>> > devices are unsecure and don't have the resources to make them secure.
>>=20
>> It isn't a great situation to be in, but we're already there for any
>> virtio devices based on our existing policies for bug handling and
>> security triage. We can't promise we'll get fixes for all CVEs quickly,
>> but we will at least assign CVEs so that users are aware when there
>> are known problems.
>>=20
>> This contrasts to other devices where problems will remain largely
>> hidden for view, as we treat them as normal bugs and never call our
>> security concerns when committing changes.
>>=20
>> With regards,
>> Daniel
>> --=20
>> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
>> |: https://libvirt.org          ~~          https://entangle-photo.org :|
>> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>>=20
>>=20
>
> With regards,
> Daniel

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

