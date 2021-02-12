Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAgFg-0003OF-8C
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 16:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgFb-0003Nq-CJ; Fri, 12 Feb 2021 16:45:20 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:32800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgFY-0008GE-RI; Fri, 12 Feb 2021 16:45:19 -0500
Received: by mail-il1-x12f.google.com with SMTP id e1so568658ilu.0;
 Fri, 12 Feb 2021 13:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Yjg/IodtYRvJV+eHVoYGt1XRxn6yaloB9lzV7zttepU=;
 b=T6jNF2/VrJpti2KfplDaABfliLER6qGFGMk5fGVhX5dKMH3uV+5QkNb0O1mp8p9bWI
 aFs2NnLoMrIATZNjiZjPZSDXmVb341vGJL5YlRHgCfZxXMOD5eC47z2/J4jcC7Zed3lo
 Pv5ARwLZ6D1FP6stSQ9CJbweC/M2iErLkWw5gHcLjgNSF48nOvionNnAoczhoaxtSVx/
 z7PhmLCvoW1Ooj/0XhHq/hKtnTeoiyVFiGM1BQyuEkX9YytCM/d8TyRK1ax1vovvN/k7
 TZWlay1itf92fKyIIzeDIKEPxVIY2oHP8ywgEvua2xM340rmfHqYsL/2dGOgrceedH/g
 abnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Yjg/IodtYRvJV+eHVoYGt1XRxn6yaloB9lzV7zttepU=;
 b=UmvmoCySxCBMj+JfpmCLb6MX0YvdRMqfZp9hITrtn6iGCH95Kflls19pxIJZlkKjzP
 5z1UCVKQ/IyaUFoyfCU8w/hIHFBetynn+UvDYXgjQcqHSyRuWkUG3ignw/DvNBvtPjwq
 LsZ8w7WIlwi1bx9omV/J+xZOw0QatJ0LG+74KNjgguHF9Y+dgJwB7Dia0n5gAKUeFMWa
 /EXS+ONvAqvA8ZWUDLVSfWv+Fa/QycQ7bTroeKQ4O8smHUnY+QXW9W9xjgAVJtyy01NV
 DyLqbLW5l7YBcgXz5Es2/vFIPn2HBLpabLBSolQxpEv6xrzeb0Cl2/lZFJVtmbMm3G2/
 mJRw==
X-Gm-Message-State: AOAM532yZoGnGDulK1HHUCrJdXn/aJBYoqU1qfpfJMQPT75sqM27hGmz
 EWOwPwO/wZHnksZ67xFRZ3fxpnMR6eH19kT81Zo=
X-Google-Smtp-Source: ABdhPJwHFigVZHoUngpHAYag/+E2iIJizSFXa+PUVsTouiOPThuqbs+FnM9jdajyjOczHjJbG9sUFgBpvZzyZq2H/2g=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr3951771ild.267.1613166313307; 
 Fri, 12 Feb 2021 13:45:13 -0800 (PST)
MIME-Version: 1.0
References: <1fb2d56aa23a81f4473e638abe9e2d78c09a3d5b.1611080607.git.alistair.francis@wdc.com>
 <24791910.1r3eYUQgxm@farino> <2013655.G923GbCHz0@farino>
In-Reply-To: <2013655.G923GbCHz0@farino>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 13:44:32 -0800
Message-ID: <CAKmqyKMkmUHKZ7GyTuTqu6ZQ_u9rZbQANPQy9U907voBDJo=4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] linux-user/signal: Decode waitid si_code
To: =?UTF-8?B?QW5kcmVhcyBLLiBIw7x0dGVs?= <dilfridge@gentoo.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Feb 2021 21:45:21 -0000

On Thu, Jan 21, 2021 at 7:15 AM Andreas K. H=C3=BCttel <dilfridge@gentoo.or=
g> wrote:
>
> Am Mittwoch, 20. Januar 2021, 22:12:30 EET schrieb Andreas K. H=C3=BCttel=
:
> > > This patch just passes the waitid status directly back to the guest.
> >
> > This works at least as well as the previous versions, so ++ from me.
> >
> > Will do more testing over the next days to see if it maybe also improve=
s the
> > additional oddities I observed.
> >
>
> So the patch is good since it clearly resolves the linked bug.
>
> However, something else is still broken (maybe related; unchanged compare=
d to
> the previous patch version). I keep seeing hanging "qemu-riscv32 /bin/bas=
h
> ..." processes using 100% cpu. If I attach strace (on the host arch x86-6=
4) to
> qemu, I see an infinite loop:
>
> waitid(P_ALL, -1, {}, WNOHANG|WEXITED, NULL) =3D 0
> rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
> rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
> rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
> rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
> rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
> rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
> waitid(P_ALL, -1, {}, WNOHANG|WEXITED, NULL) =3D 0
> rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
> rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
> rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
> rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
> rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
> rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
> ...
>
> Unfortunately I do not have a simple reproducer. This is somewhere in the
> middle of our build system...
>
> Otherwise, I can re-build glibc, gcc, binutils, make  in the qemu chroot
> without obvious problems, with one striking strange detail - "make" refus=
es to
> run more than one concurrent process (even with MAKEOPTS=3D"-j9"). Someth=
ing is
> off there.

Ping!

Even though it seems like there are still issues with RV32, this is a
step in the right direction.

Alistair

>
> --
> Andreas K. H=C3=BCttel
> dilfridge@gentoo.org
> Gentoo Linux developer
> (council, qa, toolchain, base-system, perl, libreoffice)

