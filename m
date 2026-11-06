Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF99606A326
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 14:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q/DlNYMx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xPLJA-0003Pj-VU; Fri, 06 Nov 2026 09:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xPLJ9-0003Nq-8n
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 09:52:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xPLJ7-0002GB-Mz
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 09:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793976764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hAG1lMR6EpyUF8Mo/bczfeHpe//nmcoFZfecTgTJ8Q=;
 b=Q/DlNYMxQqX98EVo75AvyGqJKelWdeREUYYUlGDKc0ihZ0b3XpHKTQ3PtPNowdb9j1qgiM
 5kcUUh4tKLS9d6ChqxJrOcH/yLlKu2GIQjfZhONCT1SgfExgYaPPpxgd7+8oAeVxOCOegm
 yeXLJbOdk0UvGQrAfDPqlAeUU6eNldo=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-6PWAVhNfM46u_1J-nNSyJQ-1; Fri, 06 Nov 2026 09:52:40 -0500
X-MC-Unique: 6PWAVhNfM46u_1J-nNSyJQ-1
X-Mimecast-MFC-AGG-ID: 6PWAVhNfM46u_1J-nNSyJQ_1793976760
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2ea446ea8c9so14628395ad.0
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2026 06:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793976760; x=1794581560;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+hAG1lMR6EpyUF8Mo/bczfeHpe//nmcoFZfecTgTJ8Q=;
 b=V+muXtwZbmOvw4ZE2Xti1CUY2r+qWawdKelFvAkqfja7AsTJaE0Kg/gbsF6UAXKfzi
 17epVfm/29ikDhBytRKXsPXSgwDcx1D6NmeFRBjaXigpAtQSId3KhMqgGNYS7jxHhfZI
 2blxUyr73HtjS1ycLvY4ltww1UmnHMzOhP+aksf356CiD6l/j8hrJU5rt8Nzyr3oNFXO
 0t12yXXmqH48yYKOXGaVU3uBKrVdBut0t6JUS917I3bBT042dF5EW1M1QNmMOigPwwoj
 +Sbm3QA+sd2+D4eHC1M0GRjUWfg4+a9gJMqXVAbjbUTom35+yFnIezhlcux1dMqCjIZi
 xk7w==
X-Forwarded-Encrypted: i=1;
 AL+hErESxaovDEJNanjvD25uaUn46xvQ9FzUl7ziH8JYGW52Epdp+WueXO5X6UKo37uFE5WGRhlslHR/Gpka@nongnu.org
X-Gm-Message-State: APuU4Z8VaGPfHtJqweM/HuILBXt9xpGyk4aVVYfsSCZNAeacaHAGlII5
 DI72Or+lS5yyN6hSeIDMg1KFdFalO0Ep8SNbWTHEkTrwJd5nCJWRtOW/UdvB4/bOnmKmb+AS9tB
 InAoFzvK5iT5RU0RQMetzbBLmvP7PicACU9y0VQx1E9rDGdOEVDalbdkPIv0zAPhewvNLqhz0A1
 32PJuRzs3xq3uF2hBhhN4i/ZrZ2djppKc=
X-Gm-Gg: AYBFou2abhUapDgoJ+uVmnxq60CFklbtgl3o4+/QTVE3zONT8U1SDmr5Hcpb0pkO7QO
 z8fzQedBUSWyntNEbFsmQOEXPoDffoz6rp9ZWgZWlj151/tsjH+mSQhp7qfDEPjlQ9jnI2X+0tj
 wzVZf9eGTvyCxvMqtE7ctayHvSulU7quAJ9OQh3gmvsx5nfJ4n1HO4V6at/uJHZTdyF6mNy+Tdb
 izigBzMl/3ISQV8LERgbPS5jND8R2dLMVRo0GOhfRi6WNqDFw8znXHO7qM4jhaQDbEcev+ou3ou
 7g==
X-Received: by 2002:a17:90b:35c5:b0:3ad:677f:567f with SMTP id
 98e67ed59e1d1-3b0db70daffmr1759560a91.40.1793976759693; 
 Fri, 06 Nov 2026 06:52:39 -0800 (PST)
X-Received: by 2002:a17:90b:35c5:b0:3ad:677f:567f with SMTP id
 98e67ed59e1d1-3b0db70daffmr1759539a91.40.1793976759161; Fri, 06 Nov 2026
 06:52:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029131241.2275706-1-berrange@redhat.com>
 <20261029131241.2275706-5-berrange@redhat.com>
 <fe7f7d29-8ca3-4ced-afcc-c768b84c4888@redhat.com>
 <CAMxuvazfhfGSZCiSi+viwJ7f7XDWAZfjmW39n3a7a-qQyw-YSA@mail.gmail.com>
 <au3mwO32b0-PSXKu@redhat.com>
In-Reply-To: <au3mwO32b0-PSXKu@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 6 Nov 2026 18:52:27 +0400
X-Gm-Features: AclHuK8PkA73Zsh95_t7Twce7oOByDLrT6UMHFSQfVJqhUHCjhh81u-PlI46tLQ
Message-ID: <CAMxuvayhYcOvH2QPptrKUQGFHoRxQcM1USF5OwuZYR_g2c4zgw@mail.gmail.com>
Subject: Re: [PATCH v2 04/28] hw: mark all remaining virtio object types as
 secure
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AyH__HUYg11oof6kqT241G6c3tpfibK6CDTJUPeLeFE_1793976760
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

On Fri, Nov 6, 2026 at 6:40=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Fri, Nov 06, 2026 at 06:35:29PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Fri, Nov 6, 2026 at 3:53=E2=80=AFPM Thomas Huth <thuth@redhat.com> w=
rote:
> > >
> > > On 29/10/2026 14.12, Daniel P. Berrang=C3=A9 wrote:
> > > > These are all intended for use in a virtualization scenario and mus=
t
> > > > provide a security boundary.
> > > >
> > > > Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > > ---
> > > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > >
> >
> > I have a second thought about this, I'd like to exclude all
> > gpu-accelerated paths for now. virgl/mesa/rutabaga expose a very large
> > attack surface, so I'd like to drop them from the secure boundary
>
> Rather than repost, please see my response for patch 2:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2026-11/msg01530.html
>
> TL;DR: we have already promised anything virtio related is in scope
> for security handling for a long time, as they are all unambiguously
> "virtualization use case".
>

the value of a secure policy enforcement is low if we know those
devices are unsecure and don't have the resources to make them secure.

> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


