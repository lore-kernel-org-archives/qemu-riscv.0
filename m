Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7AAC77B7F
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 08:45:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzCmo-00028o-Eh; Wed, 17 May 2023 04:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pzCmk-00026m-4i
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 04:45:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pzCmi-0000fw-Co
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 04:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684313123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btDd3o+y3726jjGUMJp43kgY4eDrvkrYaeBHBAg9GAA=;
 b=BoD+NtvI2sT0vZbw2VmQnXGEArU6KmYkySIZpxNPkvWpp0AkF8whe1NhB3wjFtuMng6P5B
 R0l1NnZluhBCC3hpzpbL+6h8FeTuBXykkHvp48huk71QHjA2NJ6mTjBxleaOSdBC+/gSiS
 T5uMMKNUD8Ocj0L/QREnha493+YJo7g=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-3c6nMLZuNAaJnSSNMx__1w-1; Wed, 17 May 2023 04:45:22 -0400
X-MC-Unique: 3c6nMLZuNAaJnSSNMx__1w-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-6438e9e9f91so352399b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 17 May 2023 01:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684313121; x=1686905121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=btDd3o+y3726jjGUMJp43kgY4eDrvkrYaeBHBAg9GAA=;
 b=Lhq6W66MNx6xHGfr5nCW3UlRM+535WO8f8C0gAcEmmDe5Uk363ZS/9GaAB0vxWnV3L
 t5msExRRdQ5dIvEN+ttMVcXSa2FwXDpnAqFMQ/S0clufrHy2bBp7ljVL+bmC9ZNPH4iC
 CrZaFmOn0l+kmNE8r5GdVycDXBWHAZCuDe0Ustlcg1G78g5KL57FFZkv8T+6BnmFaalr
 /crU8b9x+MVZmkgWeFZWMrQ9wbdwwA8GbUHcb0Z1vsrqBr/GmL+VGPlDKsQwJNddgtZX
 uszbz0Fcla5c43JhXOv+fOheXEarPh6wHsPPjnPeFill6rYEXNqphfllVOBo6Sh6r0g/
 GTQA==
X-Gm-Message-State: AC+VfDwsT0o46LHi8L/A5aMohKV8hzNQN1yC1huZRjqk+mMBxuFWmRC5
 mELc6hCzyo2RYARCEGBzI+6RKoy4FQ+A+ktEMclbC0+vS6YagjZ/MKC8pO+mnxw2uPLibaVhC5i
 re1JiZancW2sidAHTLIERSP9Y1b7R1ec=
X-Received: by 2002:a05:6a00:2d14:b0:62d:cfd4:e440 with SMTP id
 fa20-20020a056a002d1400b0062dcfd4e440mr54512pfb.8.1684313121340; 
 Wed, 17 May 2023 01:45:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5YM17pdhDmehi5sxmuC2BTZH3i2DYkZtX5i2agfEUEU3De6VGmL4xav42N6Qa7f4NgU4KTc3ghaSqCfkhUuJ0=
X-Received: by 2002:a05:6a00:2d14:b0:62d:cfd4:e440 with SMTP id
 fa20-20020a056a002d1400b0062dcfd4e440mr54492pfb.8.1684313121040; Wed, 17 May
 2023 01:45:21 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 May 2023 01:45:20 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
 <ZFiRr8d2zyAJlZJv@sunil-laptop>
 <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
 <ZFjbwh3CdljaHEZZ@sunil-laptop>
 <CABJz62P3u0d-ggQw-B_6AYTNu8Z9-TOs+UOn2vM8NNV0mQKR+Q@mail.gmail.com>
 <CAKmqyKMDf3F67=_Dq8oFOGG3Ft9hszfB6J2-U9DmSSvK0YKkMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMDf3F67=_Dq8oFOGG3Ft9hszfB6J2-U9DmSSvK0YKkMg@mail.gmail.com>
Date: Wed, 17 May 2023 01:45:20 -0700
Message-ID: <CABJz62OyYei7DtukTGsKA8oaRBewUR4nwZxx_8ONc0fKkZDuPQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
To: Alistair Francis <alistair23@gmail.com>
Cc: Sunil V L <sunilvl@ventanamicro.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, May 17, 2023 at 02:57:12PM +1000, Alistair Francis wrote:
> On Mon, May 8, 2023 at 9:45=E2=80=AFPM Andrea Bolognani <abologna@redhat.=
com> wrote:
> > > > Taking a step back, what is even the use case for having M-mode cod=
e
> > > > in pflash0? If you want to use an M-mode firmware, can't you just u=
se
> > > > -bios instead? In other words, can we change the behavior so that
> > > > pflash being present always mean loading S-mode firmware off it?
>
> It was originally added to support Oreboot (the Rust version of
> Coreboot). The idea was that Oreboot (ROM) would be in flash and then
> go from there.
>
> It also applies to other ROM code that a user might want to test that
> runs before OpenSBI.

Is there a reason why these would have to be loaded into pflash
instead of being passed to -bios? From a quick look at the
documentation for oreboot[1], it looks like they're doing the latter.

Either way, assuming that there's a genuine reason why pflash must be
used, I think the behavior implemented in v1 (pflash0 is M-mode when
-bios none is used, S-mode otherwise) maps very well conceptually,
and results in behavior matching that of other architectures out of
the box. That's good enough for me :) I was just wondering whether we
could keep things even simpler.


[1] https://github.com/oreboot/oreboot/blob/main/src/mainboard/emulation/qe=
mu-riscv/QEMU.md
--=20
Andrea Bolognani / Red Hat / Virtualization


