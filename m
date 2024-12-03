Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3115BE67493
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 10:13:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIPtl-0002qU-JC; Tue, 03 Dec 2024 05:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1tIPtj-0002pu-2W
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 05:12:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1tIPth-0008Tp-O4
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 05:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733220766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IMPAt8+8+Lw2bQt2pgSzqp8tDWEXPSvY4yD4nZ9IvDI=;
 b=HDoS+XdhUVWUms/91AT+uRsx/aKAnepycGQuMikY6Wav0JCNQhG7RKnQ7zq7MyywCuw1at
 7wnJig7QfVbuJWdrB5v1rxJx2fbbh8L6KxtYSanQtoczqfjlkqbTJJm0/C3k4AqBEDP3Qh
 DhHQh0zH8Mff5keHqRVa8XTsNrJ4zyE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-Ae5GlGdhMVyAlxfh_uLasQ-1; Tue, 03 Dec 2024 05:12:45 -0500
X-MC-Unique: Ae5GlGdhMVyAlxfh_uLasQ-1
X-Mimecast-MFC-AGG-ID: Ae5GlGdhMVyAlxfh_uLasQ
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4668a95e56dso83090071cf.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Dec 2024 02:12:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733220765; x=1733825565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IMPAt8+8+Lw2bQt2pgSzqp8tDWEXPSvY4yD4nZ9IvDI=;
 b=SqOdlr6XvkGmsd4eR7HTVhx++SDCU0hexzvng2v3rErv9su2hLbBiZdJMRkkRGcMyF
 97a0ne2SmKH8UfoVVIsdoYa9FYUefjhmwqyc/Ppswx6slJtsg1U0UIeYBstd8ryOofyD
 mO4xmPVA77ljEBG09L8yVDrgHP8vvS5phB+A0ZZPl3K6nPPIvlsEddNxjEgzrzvW6RGr
 MdOy++tJwthJD1qluGLD9jeZpoyqYkXCZ2XTu0zqTnhdh3n+rwcrGFnES4myN+RDFVqw
 Wk716dT0qImapir3oAL1U1q/I31xOzSl62MFWZVk+TNymU8NDUqj8FK5wuBeYOXAAwGP
 yL9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+SgwW88X0CjUVPJEQ8I5mafAFNilqQm+mDODhPKgzYMBPvuEaTngu1S4qdx6jTjn/g1Kfwij1MQQi@nongnu.org
X-Gm-Message-State: AOJu0Yw2+veUigyDd+8rmhVnowq9m3W6K0sxHG39shgU4Jz7LjptkvgH
 WcgzO5BOmtzH/d5lwDoMMi08L4i0JEJRF56iQsInnHylUidSnrtScCAVQBcD/xSzXUUD6VpJDyh
 Eaoi3yJ4xXfiJ41TMlXBjKeBqr6EkpC5cTLJn+wKPcGEKKr+JzRg/SDLKzKIsHFxk6VcgtJjX/Y
 nSBZ6K2jyTDRwZAJwmeWT/E1/+U1Y=
X-Gm-Gg: ASbGncuUY0+IpzvcMWHFqZQcCm31nNJ1jYAFrfNWYyXpYJ1gDdGBF7+fpOIzOIQWrLm
 qdm6xIuYnWRC2pWeGGgqLaMjwgqnZ
X-Received: by 2002:a05:622a:30c:b0:461:148b:1888 with SMTP id
 d75a77b69052e-4670c041ff9mr23432201cf.4.1733220765223; 
 Tue, 03 Dec 2024 02:12:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+FJ+Z7BrVABJkYK5T2KYAMmwPmP74nT1B2D0+NOg/L3fc93NhSnvUlbdfQEzdSPg4gObnvaRZvvM3P/7hpRk=
X-Received: by 2002:a05:622a:30c:b0:461:148b:1888 with SMTP id
 d75a77b69052e-4670c041ff9mr23431961cf.4.1733220764949; Tue, 03 Dec 2024
 02:12:44 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Dec 2024 02:12:44 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20241203094702.124748-1-abologna@redhat.com>
 <cb079b65-e5fc-4667-aa63-9ff347666b6e@linaro.org>
MIME-Version: 1.0
In-Reply-To: <cb079b65-e5fc-4667-aa63-9ff347666b6e@linaro.org>
Date: Tue, 3 Dec 2024 02:12:44 -0800
Message-ID: <CABJz62Np7qR=pnh+XGqOAX8YOqGLkCaGpPdH804RbKLVBsjROA@mail.gmail.com>
Subject: Re: [PATCH] binfmt: Don't consider riscv{32,
 64} part of the same family
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv <qemu-riscv@nongnu.org>, 
 Laurent Vivier <laurent@vivier.eu>, David Abdurachmanov <davidlt@rivosinc.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Corbin <mark@dibsco.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OsRlEm6PONLpvUEa6kryc2nFAtz2tD6Uqt7h0y3HpDY_1733220765
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Dec 03, 2024 at 10:59:24AM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> On 3/12/24 10:47, Andrea Bolognani wrote:
> > Currently the script won't generate a configuration file that
> > sets up qemu-user-riscv32 on riscv64, likely under the
> > assumption that 64-bit RISC-V machines can natively run 32-bit
>
> I'm confused by the "machines" description used for user emulation.

I meant it in the sense of physical machines. I can use the word
"hosts" instead if you think that's less ambiguous.

> > However this functionality, while theoretically possible, in
> > practice is missing from most commonly available RISC-V hardware
> > and not enabled at the distro level. So qemu-user-riscv32 really
> > is the only option to run riscv32 binaries on riscv64.
>
> We have definitions such ELF_ARCH/ELF_PLATFORM/ELF_MACHINE to
> parse ELF header and select the best CPU / flags. Maybe RISC-V
> lacks them?
>
> BTW we should expose that for linux-user as target_arch_elf.h,
> like bsd-user does, that would reduce all these #ifdef'ry in
> linux-user/elfload.c...

All of this is flying way over my head, sorry :)

qemu-user-riscv32 already works great on riscv64 as far as I can
tell. I tested it by chrooting into a riscv32 Gentoo rootfs from a
riscv64 Fedora installation. We just need the configuration file to
be generated.

> > Make riscv32 and riscv64 each its own family, so that the
> > configuration file we need to make 32-on-64 userspace emulation
> > work gets generated.
>
> Does this patch aim for 9.2? Otherwise FYI  I'm working on unifying
> 32/64-bit targets, maybe for 10.0...

Having this in 9.2 would be great.

--=20
Andrea Bolognani / Red Hat / Virtualization


