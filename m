Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5825EB64DC
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:34:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLw4H-0008TU-Vr; Tue, 18 Jul 2023 21:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLw4E-0008SJ-6q; Tue, 18 Jul 2023 21:33:26 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLw4C-0000m8-6h; Tue, 18 Jul 2023 21:33:25 -0400
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-7943be26e84so2004742241.2; 
 Tue, 18 Jul 2023 18:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689730402; x=1692322402;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X4JLrYnYFuyRC4kz5a7NFGUsFiGfCZp+tO6PIN9KwIo=;
 b=MKg9TXQ88Wk8neNZlinSd/6MaNaxlUWRRLX7peyf5b6gQOsXnCvK8K4S9awCnHK6fw
 D44C9lhea8Vvcyc0DTkDlCyiGGvpCpArxJ87KIF5Carsuq3nWjUXp2oPg/8tOQuk54LA
 6NavFx2JUsQvWzPE6QrRxeMQ+cVFW1zIVeCRkmf4FHNIMZQ3EBDkZPYbxhcZqreFILvE
 W/lsiOcLdnINKg2hOcqfc13pk78/9pReFouQSO8E1i5O7mWmV86TL4mdaGCidc9MD0K4
 zENy0iVuaBZTG12Ksrn+fll+NzfB5sD8jauNkcUzxsIHgG+syrNqwHh8wwX7o4Mj9rDs
 cBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689730402; x=1692322402;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X4JLrYnYFuyRC4kz5a7NFGUsFiGfCZp+tO6PIN9KwIo=;
 b=TmyYC23GLxUlEGQ9Wz4Ziez3konB5+Tz6NxXNkpBjcYqSZpEoYM6W0bkEQihIEgx/B
 Fj9mkcj4hTKySWBgaGuL71EcnHBPY1sOFe+/Np0dmenkrWnXmdhCIrUgm8+Ve7Xwymln
 vG5IXjajjCA6sFGIXeuu8+v8BE9N1fk6lsGhHmGYeOCfs5W8W9ZOtvWJZYLFSuTmkuFf
 q9CEKghujEQmN3Ol6aMnvruefaqi+FfWR4m26P6gb+AMZMcF9lzs8tqmT46x/88GEGn3
 Ix6plt9eniG2dGvwInbvGeF5Eu9MKm3UTofUKvkN8BdxB/raiT3KpOVhKQJIEmH/jHZz
 FNCg==
X-Gm-Message-State: ABy/qLZBEHvLvSuj2RSCcus5cJ67n+ZaKlwSHZThwwh5NIu9/cFzLUuJ
 yOPR6UADhVsmptYzf9JUiziKBiF6EjazYDWGABQ=
X-Google-Smtp-Source: APBJJlFfH/gOAqgu/VUZNeh5ok6my+LrucNdmJXmVAEg4Y+9FtOBvChalVcm1tQIopvL2Pk4gm6E2IWYZ+No91jYu1w=
X-Received: by 2002:a05:6102:274b:b0:446:a477:804b with SMTP id
 p11-20020a056102274b00b00446a477804bmr6476043vsu.11.1689730401792; Tue, 18
 Jul 2023 18:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
 <20230712-tulip-replica-0322e71c3e81@spud>
 <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
 <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
 <20230712-fancied-aviator-270f51166407@spud>
 <20230713-craziness-lankiness-8aec3db24993@spud>
 <CAAhSdy3J5HUoVP21jo11FBuAFSPSxHNKtuL7amn-5t7n_smoSg@mail.gmail.com>
 <20230714-reoccur-confined-4b37494b1201@spud>
 <20230714-hash-handwrite-339817b93ba1@spud>
 <CAOnJCUL3=G_yV5cP5OjCGQKNvciNgXWnoQGUU4Bqh4iwnx6C4A@mail.gmail.com>
In-Reply-To: <CAOnJCUL3=G_yV5cP5OjCGQKNvciNgXWnoQGUU4Bqh4iwnx6C4A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:32:55 +1000
Message-ID: <CAKmqyKO3O87ETntm7pzMPedKW19ANpEp5nM4jFiHXO76K9saTQ@mail.gmail.com>
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re: [PATCH
 for-8.2 6/7] target/riscv: add 'max' CPU type)
To: Atish Patra <atishp@atishpatra.org>, Anup Patel <apatel@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, 
 opensbi@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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

On Sat, Jul 15, 2023 at 7:14=E2=80=AFPM Atish Patra <atishp@atishpatra.org>=
 wrote:
>
> On Fri, Jul 14, 2023 at 5:29=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Fri, Jul 14, 2023 at 11:19:34AM +0100, Conor Dooley wrote:
> > > On Fri, Jul 14, 2023 at 10:00:19AM +0530, Anup Patel wrote:
> > >
> > > > > > OpenSBI v1.3
> > > > > >    ____                    _____ ____ _____
> > > > > >   / __ \                  / ____|  _ \_   _|
> > > > > >  | |  | |_ __   ___ _ __ | (___ | |_) || |
> > > > > >  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> > > > > >  | |__| | |_) |  __/ | | |____) | |_) || |_
> > > > > >   \____/| .__/ \___|_| |_|_____/|___/_____|
> > > > > >         | |
> > > > > >         |_|
> > > > > >
> > > > > > init_coldboot: ipi init failed (error -1009)
> > > > > >
> > > > > > Just to note, because we use our own firmware that vendors in O=
penSBI
> > > > > > and compiles only a significantly cut down number of files from=
 it, we
> > > > > > do not use the fw_dynamic etc flow on our hardware. As a result=
, we have
> > > > > > not tested v1.3, nor do we have any immediate plans to change o=
ur
> > > > > > platform firmware to vendor v1.3 either.
> > > > > >
> > > > > > I unless there's something obvious to you, it sounds like I wil=
l need to
> > > > > > go and bisect OpenSBI. That's a job for another day though, giv=
en the
> > > > > > time.
> > > > > >
> > > >
> > > > The real issue is some CPU/HART DT nodes marked as disabled in the
> > > > DT passed to OpenSBI 1.3.
> > > >
> > > > This issue does not exist in any of the DTs generated by QEMU but s=
ome
> > > > of the DTs in the kernel (such as microchip and SiFive board DTs) h=
ave
> > > > the E-core disabled.
> > > >
> > > > I had discovered this issue in a totally different context after th=
e OpenSBI 1.3
> > > > release happened. This issue is already fixed in the latest OpenSBI=
 by the
> > > > following commit c6a35733b74aeff612398f274ed19a74f81d1f37 ("lib: ut=
ils:
> > > > Fix sbi_hartid_to_scratch() usage in ACLINT drivers").
> > >
> > > Great, thanks Anup! I thought I had tested tip-of-tree too, but
> > > obviously not.
> > >
> > > > I always assumed that Microchip hss.bin is the preferred BIOS for t=
he
> > > > QEMU microchip-icicle-kit machine but I guess that's not true.
> > >
> > > Unfortunately the HSS has not worked in QEMU for a long time, and whi=
le
> > > I would love to fix it, but am pretty stretched for spare time to beg=
in
> > > with.
> > > I usually just do direct kernel boots, which use the OpenSBI that com=
es
> > > with QEMU, as I am sure you already know :)
> > >
> > > > At this point, you can either:
> > > > 1) Use latest OpenSBI on QEMU microchip-icicle-kit machine
> >
> > I forgot to reply to this point, wondering what should be done with
> > QEMU. Bumping to v1.3 in QEMU introduces a regression here, regardless
> > of whether I can go and build a fixed version of OpenSBI.
> >
> FYI: The no-map fix went in OpenSBI v1.3. Without the upgrade, any
> user using the latest kernel (> v6.4)
> may hit those random linear map related issues (in hibernation or EFI
> booting path).
>
> There are three possible scenarios:
>
> 1. Upgrade to OpenSBI v1.3: Any user of microchip-icicle-kit machine
> or sifive fu540 machine users
> may hit this issue if the device tree has the disabled hart (e core).
> 2. No upgrade to OpenSBI v1.2. Any user using hibernation or UEFI may
> have issues [1]
> 3. Include a non-release version OpenSBI in Qemu with the fix as an excep=
tion.
>
> #3 probably deviates from policy and sets a bad precedent. So I am not
> advocating for it though ;)
> For both #1 & #2, the solution would be to use the latest OpenSBI in
> -bios argument instead of the stock one.
> I could be wrong but my guess is the number of users facing #2 would
> be higher than #1.

Thanks for that info Atish!

We are stuck in a bad situation.

The best solution would be if OpenSBI can release a 1.3.1, @Anup Patel
do you think you could do that?

Otherwise I think we should stick with OpenSBI 1.3. Considering that
it fixes UEFI boot issues for the virt board (which would be the most
used) it seems like a best call to make. People using the other boards
are unfortunately stuck building their own OpenSBI release.

If there is no OpenSBI 1.3.1 release we should add something to the
release notes. @Conor Dooley are you able to give a clear sentence on
how the boot fails?

Alistair

>
> [1] https://lore.kernel.org/linux-riscv/20230625140931.1266216-1-songshua=
ishuai@tinylab.org/
> > > > 2) Ensure CPU0 DT node is enabled in DT when booting on QEMU
> > > >     microchip-icicle-kit machine with OpenSBI 1.3
> > >
> > > Will OpenSBI disable it? If not, I think option 2) needs to be remove
> > > the DT node. I'll just use tip-of-tree myself & up to the
> >
> > Clearly didn't finish this comment. It was meant to say "up to the QEMU
> > maintainers what they want to do on the QEMU side of things".
> >
> > Thanks,
> > Conor.
>
>
>
> --
> Regards,
> Atish
>

