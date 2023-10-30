Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D58C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 03:48:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxJGO-0007ol-SJ; Sun, 29 Oct 2023 23:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxJGM-0007nB-D9; Sun, 29 Oct 2023 23:48:26 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxJGK-0001sp-Lq; Sun, 29 Oct 2023 23:48:26 -0400
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-457e5dec94dso1974274137.3; 
 Sun, 29 Oct 2023 20:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698637703; x=1699242503; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vtTrkgXyVDucMOb8cDcSqouOJAGfIxZiGTis6PWhCQo=;
 b=lLfC0IkxuvJH7KiEQ1WB2aMdJWyjsFiQrpbyleRuNozUzQhzS6LLhLdR1CNN8b9M4F
 uJ2MvY05zjdSF+m+PH4gF85Lld5uRzIMRIR5SHkuV4srbnCsCnlSGQdBm/fWw1TB+WwT
 nsxJdLDH8qLdNeO0t0kBmh9DjGMcFxOICkmySgXrV20M6CrOFVNWXCKITr8ktrAbDAdp
 b+gyH/R25R3W25M5gr/vbUtXnaTNtSAihfh//r4XZtbHwYcmE8gOtCqjT6fo+aYOcLox
 2kFzNj4kG3LbJoDc1b4Du4LFyWjcUl+0kBY6P+ahuXU3lMmj6CN/v1H+sS1TGyxTYMW0
 9o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698637703; x=1699242503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vtTrkgXyVDucMOb8cDcSqouOJAGfIxZiGTis6PWhCQo=;
 b=OW64L4aRTFTVE6JH93Ks3ye4eHZQKdOmPgBcvOOIXblJKvyTvArsOhaV9uippdVrHG
 fvs4FRAYfareeQyBYBjvSUOwZPI4qspVEohdubeqyRsn9DyEprPuVzjoTKCo2/DwWfOh
 eCSbeA/HMng+g+JEA1InfTQy/XLWG26DhA9dRJJg6Fl4SYUyzoxgwlPXv0I6rR2XUt9y
 9We3UmtGB5+6vKz4eXTqPgeh71s/BlPnK8W6gFFruYJTvh09fwB57bBDFB77YBcrNAFT
 J5S8tjZGEbZytScRHLarCZo30c/+d+QjIod+cDWZ6CoWlhptoINZ1Yhzc53MN9IEJQOp
 tyhw==
X-Gm-Message-State: AOJu0Yzgl7GRXXFM3uA4N5mPoEBPbwXnC5tmcdalWE9aR8prSfL9ZfVd
 FY1JjuLZMIsS/gVMUe7WICK1l9qHcml/RmvA0vQ=
X-Google-Smtp-Source: AGHT+IEdJK/K9U4XInGB+OLzrfODMJ7YUGCwufnE4ZP22N0Q0Wz4xtxadXEqW1dxLnNbVQ/QV6rPONdOeX5c2HdbmJ4=
X-Received: by 2002:a67:a20b:0:b0:45b:529:cffb with SMTP id
 l11-20020a67a20b000000b0045b0529cffbmr7155960vse.27.1698637702982; Sun, 29
 Oct 2023 20:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
 <20231028085427.707060-7-dbarboza@ventanamicro.com>
 <20231028-588cc5e3969c1962985c2f69@orel>
In-Reply-To: <20231028-588cc5e3969c1962985c2f69@orel>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 13:47:56 +1000
Message-ID: <CAKmqyKNfp6jrwmV7zRVj28XrqnT6_Ao=kz_zY4g8M_DOth2o=g@mail.gmail.com>
Subject: Re: [PATCH v6 06/12] target/riscv/tcg: add user flag for profile
 support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, Oct 28, 2023 at 8:44=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Sat, Oct 28, 2023 at 05:54:21AM -0300, Daniel Henrique Barboza wrote:
> > The TCG emulation implements all the extensions described in the
> > RVA22U64 profile, both mandatory and optional. The mandatory extensions
> > will be enabled via the profile flag. We'll leave the optional
> > extensions to be enabled by hand.
> >
> > Given that this is the first profile we're implementing in TCG we'll
> > need some ground work first:
> >
> > - all profiles declared in riscv_profiles[] will be exposed to users.
> > TCG is the main accelerator we're considering when adding profile
> > support in QEMU, so for now it's safe to assume that all profiles in
> > riscv_profiles[] will be relevant to TCG;
> >
> > - we'll not support user profile settings for vendor CPUs. The flags
> > will still be exposed but users won't be able to change them. The idea
> > is that vendor CPUs in the future can enable profiles internally in
> > their cpu_init() functions, showing to the external world that the CPU
> > supports a certain profile. But users won't be able to enable/disable
> > it;
> >
> > - Setting a profile to 'true' means 'enable all mandatory extensions of
> > this profile, setting it to 'false' means 'do not enable all mandatory
> > extensions for this profile'.
>
> While this definition of profile=3Doff looks appealing at first, it's rea=
lly
> just saying 'do not do anything', which means it's limiting the potential
> of the property. But, I'll stop talking about this now, as I have another

This seems like the way to go to me

> design suggestion instead:
>
> Since profiles are like G, and other shorthand extensions (just without a=
n
> official shorthand extension name), then I believe they should behave lik=
e
> shorthand extensions. Also, since shorthand extensions can be derived fro=
m
> their parts, then I think shorthand extensions should behave like
> synthetic extensions. For example, zic64b starts 'false', but, at realize
> time, if all its conditions are present, then it turns 'true'. Shorthand
> extensions should be able to do that too by detecting that each of the
> extensions they represent is present.
>
> So, I think we should automatically turn G and profiles (and future
> shorthand extensions) on when all their respective extensions are present=
.

I think that's a good idea and something we should support

Alistair

>
> Thanks,
> drew
>

