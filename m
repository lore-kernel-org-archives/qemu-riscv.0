Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mqDEM-0004wg-PW
	for mharc-qemu-riscv@gnu.org; Thu, 25 Nov 2021 06:47:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mqDEL-0004vm-NU; Thu, 25 Nov 2021 06:47:57 -0500
Received: from [2607:f8b0:4864:20::136] (port=41655
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mqDEK-0005Dp-8h; Thu, 25 Nov 2021 06:47:57 -0500
Received: by mail-il1-x136.google.com with SMTP id t8so5566157ilu.8;
 Thu, 25 Nov 2021 03:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zSn9MQDIR2joyDoDlFHP8quwHvY0EI42m5U2g2WalAg=;
 b=CFzjYMbVzoO+DsNQ9RbmvD1p5TtEhGWE1iCy6lI9ET/daZmb2U3fHpRpQ5bqaIVXKK
 29ow1AA8mVouEQdFTlpzyxWjFw8HsMjBYf9IIO7cTN4YeohXUN5RS/bCbRHcryx0p+kA
 2q8Hbs+SgHiBhXOMC2+xMReK950w8NgeMtYLKjzqKWOukYPdYhG2ewlHITya+LcUpTor
 xlGrLOjy1W1TOziVhnF0Bb3mpQ+HBLDKFVSa/6WGPY7kHG6IL5iLYLftzPFhbnMS8oek
 7nJzC37HxZAyjX804eGyRWP/qknQHipruaHkd26RVJmR+rF1V0guaUK71xTbfQFf2dTb
 2xvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zSn9MQDIR2joyDoDlFHP8quwHvY0EI42m5U2g2WalAg=;
 b=bR8cV/1z05qj6YAnDEL0LLosZCN0PTnCbNol5vZHzwukuoLEnptR6erNOXDjd6Wt7o
 BJug+3B+sNQgV20awJgWDA4fh0LpcgVDqn+YtY2gqU95MWWgEHRngQ+k0xm4TPpJyYzY
 bxuKzD7naiSPbYHL6BChAsNnJy6xF4XfIr17aiDt7ppnz07fdD/iXpp0XZZGGLcouHq5
 MG5oC/19tORfQYTxV7twmOBXRaD07kpk+oGBV+aKBXOpCak3HoUhjbEIKKy1Bh34rsft
 JvH2op6+WbRJJ4PKH/j/Ee3AQe1HHdpi/4HxbiLb0MZWlnGm463z/hoGeaWQ1PkWq/iY
 kLnw==
X-Gm-Message-State: AOAM532UuiuKT6Xj0fczR5ceGyAxMuQUJUww/aTsCck957uTRftmSxAP
 TdCU5j5ASyYkw3Hlo5h5SOP2UFvAtdCGnxeDJRw=
X-Google-Smtp-Source: ABdhPJwPNx2BqY9RoyElpaulVrSX6bg7QQncC/E6r9XiHVxvp286MHMUN9eCd1QfWOlrHUxMpPVZ7Opnf7MLipKiguU=
X-Received: by 2002:a05:6e02:1b08:: with SMTP id
 i8mr18466393ilv.74.1637840874632; 
 Thu, 25 Nov 2021 03:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-8-frederic.petrot@univ-grenoble-alpes.fr>
 <CAKmqyKM_6QH40iesGaCYLxWHzRyfoFACEH+eiOY-_YQTpeo=nw@mail.gmail.com>
 <a68d73ec-bde8-5869-842f-e45bbdbdc5ed@univ-grenoble-alpes.fr>
 <88c5fc89-49a3-0dd3-87bb-287ba590f915@amsat.org>
In-Reply-To: <88c5fc89-49a3-0dd3-87bb-287ba590f915@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 Nov 2021 21:47:28 +1000
Message-ID: <CAKmqyKN69JDsRfFvuJGaDxyP+LS+90PGjD-ACtFhdGmnBguApg@mail.gmail.com>
Subject: Re: [PATCH v5 07/18] target/riscv: setup everything so that
 riscv128-softmmu compiles
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 25 Nov 2021 11:47:58 -0000

On Wed, Nov 24, 2021 at 5:33 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Fr=C3=A9d=C3=A9ric,
>
> On 11/24/21 07:55, Fr=C3=A9d=C3=A9ric P=C3=A9trot wrote:
> > On 24/11/2021 07:12, Alistair Francis wrote:
> >> On Sat, Nov 13, 2021 at 1:16 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
> >> <frederic.petrot@univ-grenoble-alpes.fr> wrote:
> >>>
> >>> This patch is kind of a mess because several files have to be slightl=
y
> >>> modified to allow for a new target. In the current status, we have do=
ne
> >>> our best to have RV64 and RV128 under the same RV64 umbrella, but the=
re
> >>> is still work to do to have a single executable for both.
> >>> In particular, we have no atomic accesses for aligned 128-bit address=
es.
> >>>
> >>> Once this patch applied, adding risc128-sofmmu to --target-list produ=
ces
> >>> a (no so useful yet) executable.
> >>
> >> I can't remember if we discussed this before, but do we need the
> >> riscv128-sofmmu executable? Can we instead just use a riscv64-sofmmu
> >> executable?
> >
> >   Hello Alistair,
> >   Richard was also advocating for a single executable, but pointed out =
that
> >   we need to disable mttcg because there is a need for specific tcg
> > support for
> >   128-bit aligned atomics.
> >   Given my understanding of that part of QEMU, I choose the easy way to
> > disable
> >   it once and for all at compile time until we have that.
>
>
> In rv128_base_cpu_init():
>
>   if (qemu_tcg_mttcg_enabled) {
>       /* Missing 128-bit aligned atomics */
>       error_report("128-bit RISC-V currently does not work"
>                    " with Multi Threaded TCG. Please use:"
>                    " -accel tcg,thread=3Dsingle");
>       exit(EXIT_FAILURE);
>   }

That seems like a good option! I think we could add this to the CPU
realise function.

The problem with a riscv128-sofmmu executable is that it's hard to get
rid of in the future. We are very slowly moving towards a single
executable and adding a new one means we are stuck with it for a
while.

Alistair

>
> Regards,
>
> Phil.

