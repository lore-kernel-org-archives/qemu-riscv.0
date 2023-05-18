Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAC4C7EE24
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 04:54:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzVdx-0006eo-N2; Thu, 18 May 2023 00:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pzVdw-0006ck-6i; Thu, 18 May 2023 00:53:36 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pzVdu-0000sp-4C; Thu, 18 May 2023 00:53:35 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-436175b038fso462273137.3; 
 Wed, 17 May 2023 21:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684385612; x=1686977612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m2bzxQUK82OfNkNHrL4n0W7/GosvYokdjzcfAxJmVhE=;
 b=b1D5uXmASJyiE98iHa91RVmfQo+v2PbwOlZIP18A173EgP2KR0aYaPu0MBsGe4bDLr
 79GBsalX2/GHzhk1AYvL3nlDj8mXVN4A8FMA75d4XSORKjIWhIcdhxYs0f1dyznnmcK3
 humwvULi55OTcvY/nQ9g0jjH+lfwmqzntODkRYIoLqhwNdgOcTHxCSelGn0vG5PGuizn
 ACgbljDEUkJ5T1ey+AMyy7j5MVkyO8x/JswlAwxQBQYqmfSE69MvX72qzzSpAQVmpCP2
 SoUcDQ9BndSj1rS/ObiIgPYdsV7tGLAGt0dp+eQ9NSh4n37Qlqoixe7iYMMU4qcijq9w
 JQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684385612; x=1686977612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m2bzxQUK82OfNkNHrL4n0W7/GosvYokdjzcfAxJmVhE=;
 b=FHa18kDScuwwZb0+uwPvrdZGosVTDdt6MYGk4I+EMWwckiqel+4QZy5xXPTbSm2Srm
 x+pZUMQjJcGyAJDjwsTEAxnEXDrtPphtX5vdBc4TbjIUUst+zxOCMxAatdK/hG3GbHs+
 crGKQjhLgl03CDpzm/b9swEr5oGJBk8zG+q+i4CaDb7v+Wbhv+CBqkiWfbjWE9+gwWsP
 CdJByJWryvxMqqGhhzZE5yX1DUISPENL50sZVrjHa8RkXQ6QuVy9sy+1c038wxicDkhg
 6SmZKrx9uVDN175x8SgeogIXMAR4X8snb7rh+pHCQvkX6pDRg/eIqxPU5yEHjzdjdXP7
 VLQg==
X-Gm-Message-State: AC+VfDwLp49jwvlPHlY3RZxFnKHJem7Z9RpvWH/nAToLj5Egb46qIV3z
 XCc4ueZXz66LYG6B8vYfYiw/Rbs0IF83k3f6dr4=
X-Google-Smtp-Source: ACHHUZ7XCRXyjiENOAIk+/mLvdZgn4b8ZsRGwS93q/eYAdMHPgnTzS1SO8hYtyIyXVNHDv8EcmXCs7hXP0EOZwkUOWk=
X-Received: by 2002:a67:f8cf:0:b0:437:da98:e7d2 with SMTP id
 c15-20020a67f8cf000000b00437da98e7d2mr155551vsp.18.1684385611915; Wed, 17 May
 2023 21:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
 <ZFiRr8d2zyAJlZJv@sunil-laptop>
 <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
 <ZFjbwh3CdljaHEZZ@sunil-laptop>
 <CABJz62P3u0d-ggQw-B_6AYTNu8Z9-TOs+UOn2vM8NNV0mQKR+Q@mail.gmail.com>
 <CAKmqyKMDf3F67=_Dq8oFOGG3Ft9hszfB6J2-U9DmSSvK0YKkMg@mail.gmail.com>
 <CABJz62OyYei7DtukTGsKA8oaRBewUR4nwZxx_8ONc0fKkZDuPQ@mail.gmail.com>
In-Reply-To: <CABJz62OyYei7DtukTGsKA8oaRBewUR4nwZxx_8ONc0fKkZDuPQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 May 2023 14:53:05 +1000
Message-ID: <CAKmqyKMdtMLDxb8oO_EANODOxvdf2WUR-cSoog5BV1ib7SQ2zQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
To: Andrea Bolognani <abologna@redhat.com>
Cc: Sunil V L <sunilvl@ventanamicro.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 17, 2023 at 6:45=E2=80=AFPM Andrea Bolognani <abologna@redhat.c=
om> wrote:
>
> On Wed, May 17, 2023 at 02:57:12PM +1000, Alistair Francis wrote:
> > On Mon, May 8, 2023 at 9:45=E2=80=AFPM Andrea Bolognani <abologna@redha=
t.com> wrote:
> > > > > Taking a step back, what is even the use case for having M-mode c=
ode
> > > > > in pflash0? If you want to use an M-mode firmware, can't you just=
 use
> > > > > -bios instead? In other words, can we change the behavior so that
> > > > > pflash being present always mean loading S-mode firmware off it?
> >
> > It was originally added to support Oreboot (the Rust version of
> > Coreboot). The idea was that Oreboot (ROM) would be in flash and then
> > go from there.
> >
> > It also applies to other ROM code that a user might want to test that
> > runs before OpenSBI.
>
> Is there a reason why these would have to be loaded into pflash
> instead of being passed to -bios? From a quick look at the
> documentation for oreboot[1], it looks like they're doing the latter.

At one point we loaded Oreboot in in flash and booted from that. I
think Oreboot then loaded OpenSBI into memory. The idea was to mimic
what a physical board would do, so we could allow testing.

It doesn't look like it's used any more.

>
> Either way, assuming that there's a genuine reason why pflash must be
> used, I think the behavior implemented in v1 (pflash0 is M-mode when
> -bios none is used, S-mode otherwise) maps very well conceptually,
> and results in behavior matching that of other architectures out of
> the box. That's good enough for me :) I was just wondering whether we
> could keep things even simpler.

I don't see a reason to remove the boot from pflash if no -bios
argument is supplied. If there is a good reason to, I think we can
(via deprecation) but the current functionality seems fine to me.

Alistair

>
>
> [1] https://github.com/oreboot/oreboot/blob/main/src/mainboard/emulation/=
qemu-riscv/QEMU.md
> --
> Andrea Bolognani / Red Hat / Virtualization
>

