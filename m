Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7DDC3ABC3
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 May 2025 15:23:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uEUzH-0003TU-T8; Mon, 12 May 2025 11:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEUzF-0003SW-NI
 for qemu-riscv@nongnu.org; Mon, 12 May 2025 11:22:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEUzD-0005KR-Ha
 for qemu-riscv@nongnu.org; Mon, 12 May 2025 11:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747063353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s8G7Z9wHgR/rNemsXSSNPwg3mTiNytDChMsJQGUo7YI=;
 b=H1FGbW9bHjuOyiPpP7XSWfR4uNJ61345pxv8JNFxtqBvUd0d71FZPA7TK9GlKgnFTJm+2U
 Terd689dS+Co2a5byVRQY5MixSTYsW5CizX9LKmPMGmaF3GP9KG8Ksc41rdtsgPJe3olLa
 XeKQrd9XO+FIJKAD9dE++gsDPYzidkw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-1OIU6DhkMdefHlfEmFOJQg-1; Mon, 12 May 2025 11:22:32 -0400
X-MC-Unique: 1OIU6DhkMdefHlfEmFOJQg-1
X-Mimecast-MFC-AGG-ID: 1OIU6DhkMdefHlfEmFOJQg_1747063351
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-442dc702850so13370675e9.1
 for <qemu-riscv@nongnu.org>; Mon, 12 May 2025 08:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747063351; x=1747668151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3fDbveoy634fX30HQGWyRUGP5YagE3FENcZZx4UjSE4=;
 b=fvx0J03+NSFhgyeI1CVQksddU+c+/Torr4ZMHXw8QtHyzLF1MOb+P7bvGbvuSAh1AM
 taY+Tpwbf115hFViTGSIarntptSue2RWeCtXyR2P4x4F9Ko6GIUcBqPLS9mzubpc3sLI
 FseI3PB1wBljvm/UapLvkxEULsOKe4oZUa3z8znMVoorYV2z20S8b0OhlMjZ1PwK1UHd
 mZfUaT15BnqeDWKxHI9LuWF3Un+D/JpplM09vlThlRLdXHdPkK1J+7DB7s4HBeQuGnG3
 4kIXr9xNDtkeGMxGNMi6ewtjBw7q6vf9QviaUUdLs2r10+ZEqLVkLhAPMLzwSgE7UZKh
 ua0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTIImnl5iz3Mm8WKfdJA9Mr5+aV6ex+QFrQ4AGzrnd9eqEj61lL3E/RJXqFX11ut5VkMXOU9vVvwo2@nongnu.org
X-Gm-Message-State: AOJu0YwmMwGLDBXa08S5NcnoZ6L0kHd4ctOx8XdbXuqVaCxegsGYwY3h
 SeOK9RLOixGU3giQnxqtPPX04AH3O/Obr0O2q6Ngmbvjl7rsA3vXeuvRrPQbGI1VpRXBPb9afhu
 y6XXuqKkREPme+9zDW7FX2DHP2ytyQKlA+dYrS1QpYIFXbZSSiPi/
X-Gm-Gg: ASbGncvO94aGFKSBv+RSW2RgayH9k+NsVey9oQHwwjunP4CJ2rMyqtfvCpqyo1LC8AN
 B5aM2z72Zi4v4/zl18gZdNCLZ0wrpOkBRNOF4WAL+sfiqK4mDyhdBgZ1GIszT0144ObUahQglrK
 w27Rfd3KuK9oZkeJLndjr3o5HumQ1zF80yD99d5IgjUJSv9Ocs8+x96CHPCwmkVtJOE5GVHmjOB
 mNbfvyBcLytEnNsjCWu0csAP0/geM6TwMWreVLuzv8OhdxEqbbrGU+uBSNVUso+54EeakitxItF
 pt8Ww5JCh3YgMyESSc3J33nguJoav+SV
X-Received: by 2002:a5d:64cb:0:b0:3a2:56f:e931 with SMTP id
 ffacd0b85a97d-3a2056fea7bmr4650575f8f.19.1747063351051; 
 Mon, 12 May 2025 08:22:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpfuYUF3ZtquPfDbtUbsIXdvtVrYdxS4GjvinNAdEoeVjZYWPtRk7OTMzvGsodv9XiY0XPiA==
X-Received: by 2002:a5d:64cb:0:b0:3a2:56f:e931 with SMTP id
 ffacd0b85a97d-3a2056fea7bmr4650532f8f.19.1747063350573; 
 Mon, 12 May 2025 08:22:30 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67ed1bcsm127891875e9.18.2025.05.12.08.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 08:22:30 -0700 (PDT)
Date: Mon, 12 May 2025 17:22:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Zhao
 Liu <zhao1.liu@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, kvm@vger.kernel.org, Gerd Hoffmann
 <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>, Amit Shah
 <amit@kernel.org>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif
 <clement.mathieu--drif@eviden.com>, qemu-arm@nongnu.org, =?UTF-8?B?TWFy?=
 =?UTF-8?B?Yy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>
Subject: Re: How to mark internal properties
Message-ID: <20250512172226.433900f8@imammedo.users.ipa.redhat.com>
In-Reply-To: <87jz6mqeu5.fsf@pond.sub.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-13-philmd@linaro.org>
 <23260c74-01ba-45bc-bf2f-b3e19c28ec8a@intel.com>
 <aB2vjuT07EuO6JSQ@intel.com>
 <2f526570-7ab0-479c-967c-b3f95f9f19e3@redhat.com>
 <CAFEAcA-kuHvxjuV_cMh-Px3C-k2Gd51jFqhwndO52vm++M_jAA@mail.gmail.com>
 <aCG6MuDLrQpoTqpg@redhat.com> <87jz6mqeu5.fsf@pond.sub.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WKVnL4utgrmVHTbIkFKoLZ6Z2RzjVQyU54SHWLxWNt4_1747063351
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.551,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 12 May 2025 12:54:26 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>=20
> > On Mon, May 12, 2025 at 09:46:30AM +0100, Peter Maydell wrote: =20
> >> On Fri, 9 May 2025 at 11:04, Thomas Huth <thuth@redhat.com> wrote: =20
> >> > Thanks for your clarifications, Zhao! But I think this shows again t=
he
> >> > problem that we have hit a couple of times in the past already: Prop=
erties
> >> > are currently used for both, config knobs for the users and internal
> >> > switches for configuration of the machine. We lack a proper way to s=
ay "this
> >> > property is usable for the user" and "this property is meant for int=
ernal
> >> > configuration only".
> >> >
> >> > I wonder whether we could maybe come up with a naming scheme to bett=
er
> >> > distinguish the two sets, e.g. by using a prefix similar to the "x-"=
 prefix
> >> > for experimental properties? We could e.g. say that all properties s=
tarting
> >> > with a "q-" are meant for QEMU-internal configuration only or someth=
ing
> >> > similar (and maybe even hide those from the default help output when=
 running
> >> > "-device xyz,help" ?)? Anybody any opinions or better ideas on this?=
 =20
> >>=20
> >> I think a q-prefix is potentially a bit clunky unless we also have
> >> infrastructure to say eg DEFINE_INTERNAL_PROP_BOOL("foo", ...)
> >> and have it auto-add the prefix, and to have the C APIs for
> >> setting properties search for both "foo" and "q-foo" so you
> >> don't have to write qdev_prop_set_bit(dev, "q-foo", ...). =20
>=20
> If we make intent explicit with DEFINE_INTERNAL_PROP_FOO(), is repeating
> intent in the name useful?

While we are inventing a new API, I'd say that _INTERNAL_ is not the only t=
hing
on my wish-list wrt properties.
It would be also nice to know when a property is set by internal or externa=
l user
or if it still has default value.

Basically we are looking at different flags for properties and INERNAL bein=
g
one of them.

Maybe instead of specialized macro, we should have a more generic
   DEFINE_PROP_WITH_FLAGS_FOO(...,flags)
So we won't have to rewrite it again when we think of another flag to turn =
on/off.


From previous uses of x- flag, some of such properties are created as
temporary | developer-only and occasionally as a crutch (still no intended =
for end user).
But then sometimes such properties get promoted to ABI with fat warnings
not to touch them. Having stable|unstable flag could help here without
need to rename property (and prevent breaking users who (ab)used it if we c=
are).


