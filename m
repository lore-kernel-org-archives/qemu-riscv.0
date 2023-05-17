Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261DCC77B7D
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 04:57:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz9EN-0004uK-7J; Wed, 17 May 2023 00:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz9EM-0004u8-10; Wed, 17 May 2023 00:57:42 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz9EK-0008DT-8q; Wed, 17 May 2023 00:57:41 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-435f36ad948so71286137.3; 
 Tue, 16 May 2023 21:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684299459; x=1686891459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rtOiJuOtUl2bySlOYvv9gEqbmPXtcNAXjBY5zhiEZ4Q=;
 b=i0VqDcF8EtePgKLb0o13GzBprsnSBdOYp31qQKmMhl84b0ULo6mw1GcEA5mWEGlsl/
 3/SwgO/k+4oA4BMZZsBxrSxe4BwQNYaQvBpR9ZfOb/CXWepgIdADZrHZb55auy7RGTVa
 t5ousUJ5kndPWkG52Qv/EiPsrbJsCFyAHE5PZ7Y3yAUMUJMqscvdXi7RXGyE2dRDOkQj
 cFPzGSH1mx/DFMTfPjRdI80JHAr0wWdCWsQI26Q8ZyEXY9OY5GYF0ud5BnIKG6mWZczt
 ANq2BhTn96JWm4cmungx4uhLFf+UmTRmjFJUBII+B++XLR4V9ysUP6mLWyOIgh2RifqM
 KB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684299459; x=1686891459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rtOiJuOtUl2bySlOYvv9gEqbmPXtcNAXjBY5zhiEZ4Q=;
 b=VeVFgZgg8oVDgb3Sa8EYFhEUEaMqCulx9SvX/yJU87z+ZRFUE1OoFbIlFwyxDAg22m
 JkzHmV652IzLuDaEIdCVs58rx4Cc7NZLjIGdA7fS66UwZR44KpZfM2+YLy1+us5h08mO
 FyUklkg9GmPMxLBMy+X6kDZJsEzDOvz/SpWPvt+ww3VtmwqTn614Ut5RGU/msslvYsL9
 AjmnELGyyNxYu7Cnr1M46iyrsTBRs++SizntZO1T+WN0ZNPpNMlUL3QFfEU6y5N/3wGX
 LJuqouL5RFeEX1Tf9BOgMMtxqseFO6YZtv8rTKu6P+je/DGzu5dGV0hHWaJlZcvitwXW
 ujaA==
X-Gm-Message-State: AC+VfDyTxYoy9dnYoXLxmsqvG0t0qaX3/a7rQK64YO7VwcZDBGK0VUTs
 AVOf/rkZrCbVNmdbACEP+/J6TeefhlOwFJBZTCqzdZseFlbBrFrK
X-Google-Smtp-Source: ACHHUZ4X5lL0xv3wxff1VarE8l+TxmNLxzSszM0V/E4sNhPuZVzx2Pxk8dLCjyJAnZ76rnv8ud0s6vRmT1Ey+Q0Xp0A=
X-Received: by 2002:a67:f489:0:b0:42e:6185:8c94 with SMTP id
 o9-20020a67f489000000b0042e61858c94mr15121383vsn.29.1684299458764; Tue, 16
 May 2023 21:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
 <ZFiRr8d2zyAJlZJv@sunil-laptop>
 <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
 <ZFjbwh3CdljaHEZZ@sunil-laptop>
 <CABJz62P3u0d-ggQw-B_6AYTNu8Z9-TOs+UOn2vM8NNV0mQKR+Q@mail.gmail.com>
In-Reply-To: <CABJz62P3u0d-ggQw-B_6AYTNu8Z9-TOs+UOn2vM8NNV0mQKR+Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 14:57:12 +1000
Message-ID: <CAKmqyKMDf3F67=_Dq8oFOGG3Ft9hszfB6J2-U9DmSSvK0YKkMg@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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

On Mon, May 8, 2023 at 9:45=E2=80=AFPM Andrea Bolognani <abologna@redhat.co=
m> wrote:
>
> On Mon, May 08, 2023 at 04:53:46PM +0530, Sunil V L wrote:
> > On Mon, May 08, 2023 at 03:00:02AM -0700, Andrea Bolognani wrote:
> > > I think that it's more important to align with other architectures.

That's true, ideally we want to match what people are already doing.

> > >
> > > The number of people currently running edk2 on RISC-V is probably
> > > vanishingly small, and in my opinion requiring them to tweak their
> > > command lines a bit is a fair price to pay to avoid having to carry a
> > > subtle difference between architectures for years to come.
> >
> > It is not just tweaking the command line. The current EDK2 will not wor=
k
> > anymore if code is moved to plfash 0 since EDK2 assumed its entry point
> > is in pflash1. I agree there may not be too many users but if we have
> > to align with other archs, there will be combinations of qemu and
> > edk2 versions which won't work.
>
> Right.
>
> > > With that in mind, my preference would be to go back to v1.
> >
> > Thanks!. If this is the preference,  we can request people to use prope=
r
> > versions of EDK2 with different qemu versions.
>
> Yeah, in the (not so) long run this will just not matter, as the
> versions of edk2 and QEMU available to people will all implement the
> new behavior. Better to optimize for the long future ahead of us
> rather than causing ongoing pain for the sake of the few users of a
> work-in-progress board.
>
> > > Taking a step back, what is even the use case for having M-mode code
> > > in pflash0? If you want to use an M-mode firmware, can't you just use
> > > -bios instead? In other words, can we change the behavior so that
> > > pflash being present always mean loading S-mode firmware off it?

It was originally added to support Oreboot (the Rust version of
Coreboot). The idea was that Oreboot (ROM) would be in flash and then
go from there.

It also applies to other ROM code that a user might want to test that
runs before OpenSBI.

> >
> > TBH, I don't know. I am sure Alistair would know since it was added in
> > https://github.com/qemu/qemu/commit/1c20d3ff6004b600336c52cbef9f134fad3=
ccd94
> > I don't think opensbi can be launched from pflash. So, it may be some
> > other use case which I am now aware of.
> >
> > I will be happy if this can be avoided by using -bios.
>
> The actual commit would be [1], from late 2019. Things might have
> changed in the intervening ~3.5 years. Let's wait to hear from
> Alistair :)

Overall for this patch I don't feel strongly about following what ARM
does or continuing with what we already have. I would prefer to match
other archs if we can though.

Also, either way we should update the documentation in
docs/system/riscv/virt.rst to describe what happens.

Alistair

>
>
> [1] https://github.com/qemu/qemu/commit/2738b3b555efaf206b814677966e8e351=
0c64a8a
> --
> Andrea Bolognani / Red Hat / Virtualization
>
>

