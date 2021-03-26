Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lPmXO-0002RM-MV
	for mharc-qemu-riscv@gnu.org; Fri, 26 Mar 2021 09:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPmXM-0002PM-S9; Fri, 26 Mar 2021 09:30:04 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:42696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPmXK-0002nc-87; Fri, 26 Mar 2021 09:30:04 -0400
Received: by mail-yb1-xb34.google.com with SMTP id v107so862643ybi.9;
 Fri, 26 Mar 2021 06:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KIYIqmTfGGqWK40aMu2S+zzetb5A+tNz+puFdVqd1uQ=;
 b=LmFwPXcZ/MMaGX/SAOQ79kllbSwlIn0KKEp/qpxVieEWNgJwyEnNzHVdtM9utnAwoa
 0z5bV2p9UnBBIZ0A4pNEAXOZ068vW/vichNaTwUMCOsP9mbY+Gg589BDCzdUhy6poKIM
 XfW7qP9MQ/8dd6dpnRrhrfUIXRjAnM/bcyAjQK1y5tuVP1CGZwWxMgLxtBMo0QULsNOG
 GF6mM+9cTKVHR/uJZDzZaUYZ73zmSm/SbxNh+i8iUISsq85IBsbtLlzZ7XxM+KUMToz0
 dy+E2F8NWLU9PgdY53haYKsv6dGwMAJEuneFYwamr3skGANEve2ltTOOKAQ6EgYSEyu7
 CvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KIYIqmTfGGqWK40aMu2S+zzetb5A+tNz+puFdVqd1uQ=;
 b=SV1kLdWhzhSljRz/7PngwDwvFYhSuRoFg4vnxzy34LwIy7JfoeMSpYKLEM+gsKK+uB
 4HJn/sUUSgZamA8xyEP2eBkiKvR/DuQL1YkoKyXFd8qE9X4V1NKtICwRcLHdBPQ6jqhv
 GKW1zxo+4SjPrVJeyyiIGYUcQ2rKZ2dEHvzl8lK4NfpiMt+dLr/+DHheG8ltjgu/lFAe
 nGJ5krnAdJWCuz06CnPQ6q1xR+C1sosnvrvutqvr9w8JWa8XlUi+y5Qg+bEpXP9bM/VG
 CW21Li78jDSAye+dK1PaspfZ+zGIbfsTS/ssHQM7u5I3MKkf6tbmq3p3Qp1kO/PqIHUT
 5sxQ==
X-Gm-Message-State: AOAM530nCnT4gk+vADCe84GtTvAcPuorq/YAPzjjyUhqJLPTmRPdNUG4
 aUIe3gq3aOVgVu/2F1bVeLQklV6iyOybZb8Kn34=
X-Google-Smtp-Source: ABdhPJw7xRi8q4SexRtoU4QnAtesuz5YkUcUMgBUa1qVNqmhDGu++MZBMx2aSjFqlAnTtzrYANdx4ZqPYTaYTq1ee4Y=
X-Received: by 2002:a25:73d1:: with SMTP id
 o200mr20750099ybc.239.1616765400914; 
 Fri, 26 Mar 2021 06:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201022053225.2596110-1-anup.patel@wdc.com>
 <CAEUhbmVWesOJTxejnr-DYMUMXgLsRLz9nVqbAEb0emu_nUEhqw@mail.gmail.com>
In-Reply-To: <CAEUhbmVWesOJTxejnr-DYMUMXgLsRLz9nVqbAEb0emu_nUEhqw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Mar 2021 21:29:51 +0800
Message-ID: <CAEUhbmVfTNXbj02yi=MSx6voEFBiwPNsfMVUemh-tCMAVurnVg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/riscv: sifive_u: Allow passing custom DTB
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 26 Mar 2021 13:30:05 -0000

On Wed, Mar 24, 2021 at 9:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Anup,
>
> On Thu, Oct 22, 2020 at 1:34 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > Extend sifive_u machine to allow passing custom DTB using "-dtb"
> > command-line parameter. This will help users pass modified DTB
> > or Linux SiFive DTB to sifive_u machine.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  hw/riscv/sifive_u.c | 28 ++++++++++++++++++++--------
> >  1 file changed, 20 insertions(+), 8 deletions(-)
> >
>
> I am using the following command to boot a Linux v5.11 kernel, but it hangs at:
>
> $ qemu-system-riscv64 -M sifive_u -smp 5 -m 8G -display none -serial
> stdio -kernel arch/riscv/boot/Image -dtb
> arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb -append
> "earlycon=sbi console=ttySIF0"
>
> [    0.000000] smp: Bringing up secondary CPUs ...
>
> Removing -dtb makes the kernel continue booting.
>
> I am not sure what's missing ofusing "-dtb"?

I figured out what's missing, and will send a patch on documentation soon.

Regards,
Bin

