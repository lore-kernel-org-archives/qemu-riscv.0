Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD2DC001DE
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 09:13:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKbKo-0003bk-Bn; Sat, 15 Jul 2023 05:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qKbKn-0003bN-NW
 for qemu-riscv@nongnu.org; Sat, 15 Jul 2023 05:13:01 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qKbKl-0004N8-Px
 for qemu-riscv@nongnu.org; Sat, 15 Jul 2023 05:13:01 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b933bbd3eeso2296961fa.1
 for <qemu-riscv@nongnu.org>; Sat, 15 Jul 2023 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1689412377; x=1692004377;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lplq7nNh9v/iOOE5xwG4FxLJTS7HJUPMDYimkMR+PQE=;
 b=WUB9kdNtP8fzlZQ8bIdpBjjq2SdEbyiNwdfyyxGAXI8zf0Fnc42KUQpBtezvlCIaCb
 iy5NlyCmOkyhG//10Hqam4et9XAqkuf+SESLVxLhqx4X11Zc8l0mWkyd28ptWMqti/gx
 /Jdo39Pf+lKBZSPnJM0sdsX95DCmK1HK5USn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689412377; x=1692004377;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lplq7nNh9v/iOOE5xwG4FxLJTS7HJUPMDYimkMR+PQE=;
 b=AygE5DNClPZgn0qkJIHiDuFrwWXt4vEcVFFrrv/xfCelXOOY1ZElHZXyoJgtDN5uSn
 ZqVyPRS8TxyxS6Xq50uBGLHakoLA4xcxJ7LpWbNso3aXkquJIm0FbPPmuJqg9XBlSgD8
 srgNAsF5rUu+a0X96vqdVCxHTKidPYDG3xHtfgUmIrRiIeRVlKQg3IEL20qoDzk3Zx/n
 05oMFRatDvuSQpdKZNwGOJbC87lJo1VrB7W+Wnrv8Ru+tX6GXqqYNKcaKQt/sSrYsy92
 T6GSvoQAuzaNMo8E85tR/V8iQYJL5xxYxhb56L2oTSV/HQcRzMTHNXc+CBanXU2vzw/I
 veDA==
X-Gm-Message-State: ABy/qLb3gJEsAwVcUA1Y+z9/vbL6tN24nAvwG/PkmVoY6zML7cxKI7g2
 EdQ+u8i5xwpE2vIm+TFFioFNjYb+BUzUTfJmRRc+
X-Google-Smtp-Source: APBJJlFiqj5a/hMIGpY2CNA1zDNxNqMighSiAZQcZg0BK/ajf3/yAKI7BvJbsvS0oQ+OTfKCiGxnLLmMF2dNwGxRTFM=
X-Received: by 2002:a2e:b04b:0:b0:2b8:3ff3:cd93 with SMTP id
 d11-20020a2eb04b000000b002b83ff3cd93mr3210352ljl.7.1689412376854; Sat, 15 Jul
 2023 02:12:56 -0700 (PDT)
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
In-Reply-To: <20230714-hash-handwrite-339817b93ba1@spud>
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 15 Jul 2023 02:12:45 -0700
Message-ID: <CAOnJCUL3=G_yV5cP5OjCGQKNvciNgXWnoQGUU4Bqh4iwnx6C4A@mail.gmail.com>
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re: [PATCH
 for-8.2 6/7] target/riscv: add 'max' CPU type)
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, 
 opensbi@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=atishp@atishpatra.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Jul 14, 2023 at 5:29=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Fri, Jul 14, 2023 at 11:19:34AM +0100, Conor Dooley wrote:
> > On Fri, Jul 14, 2023 at 10:00:19AM +0530, Anup Patel wrote:
> >
> > > > > OpenSBI v1.3
> > > > >    ____                    _____ ____ _____
> > > > >   / __ \                  / ____|  _ \_   _|
> > > > >  | |  | |_ __   ___ _ __ | (___ | |_) || |
> > > > >  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> > > > >  | |__| | |_) |  __/ | | |____) | |_) || |_
> > > > >   \____/| .__/ \___|_| |_|_____/|___/_____|
> > > > >         | |
> > > > >         |_|
> > > > >
> > > > > init_coldboot: ipi init failed (error -1009)
> > > > >
> > > > > Just to note, because we use our own firmware that vendors in Ope=
nSBI
> > > > > and compiles only a significantly cut down number of files from i=
t, we
> > > > > do not use the fw_dynamic etc flow on our hardware. As a result, =
we have
> > > > > not tested v1.3, nor do we have any immediate plans to change our
> > > > > platform firmware to vendor v1.3 either.
> > > > >
> > > > > I unless there's something obvious to you, it sounds like I will =
need to
> > > > > go and bisect OpenSBI. That's a job for another day though, given=
 the
> > > > > time.
> > > > >
> > >
> > > The real issue is some CPU/HART DT nodes marked as disabled in the
> > > DT passed to OpenSBI 1.3.
> > >
> > > This issue does not exist in any of the DTs generated by QEMU but som=
e
> > > of the DTs in the kernel (such as microchip and SiFive board DTs) hav=
e
> > > the E-core disabled.
> > >
> > > I had discovered this issue in a totally different context after the =
OpenSBI 1.3
> > > release happened. This issue is already fixed in the latest OpenSBI b=
y the
> > > following commit c6a35733b74aeff612398f274ed19a74f81d1f37 ("lib: util=
s:
> > > Fix sbi_hartid_to_scratch() usage in ACLINT drivers").
> >
> > Great, thanks Anup! I thought I had tested tip-of-tree too, but
> > obviously not.
> >
> > > I always assumed that Microchip hss.bin is the preferred BIOS for the
> > > QEMU microchip-icicle-kit machine but I guess that's not true.
> >
> > Unfortunately the HSS has not worked in QEMU for a long time, and while
> > I would love to fix it, but am pretty stretched for spare time to begin
> > with.
> > I usually just do direct kernel boots, which use the OpenSBI that comes
> > with QEMU, as I am sure you already know :)
> >
> > > At this point, you can either:
> > > 1) Use latest OpenSBI on QEMU microchip-icicle-kit machine
>
> I forgot to reply to this point, wondering what should be done with
> QEMU. Bumping to v1.3 in QEMU introduces a regression here, regardless
> of whether I can go and build a fixed version of OpenSBI.
>
FYI: The no-map fix went in OpenSBI v1.3. Without the upgrade, any
user using the latest kernel (> v6.4)
may hit those random linear map related issues (in hibernation or EFI
booting path).

There are three possible scenarios:

1. Upgrade to OpenSBI v1.3: Any user of microchip-icicle-kit machine
or sifive fu540 machine users
may hit this issue if the device tree has the disabled hart (e core).
2. No upgrade to OpenSBI v1.2. Any user using hibernation or UEFI may
have issues [1]
3. Include a non-release version OpenSBI in Qemu with the fix as an excepti=
on.

#3 probably deviates from policy and sets a bad precedent. So I am not
advocating for it though ;)
For both #1 & #2, the solution would be to use the latest OpenSBI in
-bios argument instead of the stock one.
I could be wrong but my guess is the number of users facing #2 would
be higher than #1.

[1] https://lore.kernel.org/linux-riscv/20230625140931.1266216-1-songshuais=
huai@tinylab.org/
> > > 2) Ensure CPU0 DT node is enabled in DT when booting on QEMU
> > >     microchip-icicle-kit machine with OpenSBI 1.3
> >
> > Will OpenSBI disable it? If not, I think option 2) needs to be remove
> > the DT node. I'll just use tip-of-tree myself & up to the
>
> Clearly didn't finish this comment. It was meant to say "up to the QEMU
> maintainers what they want to do on the QEMU side of things".
>
> Thanks,
> Conor.



--=20
Regards,
Atish

