Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAV90-00085r-HU
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 05:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nAV8j-00082K-PP; Thu, 20 Jan 2022 05:58:02 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:41634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nAV8h-0000SZ-ND; Thu, 20 Jan 2022 05:58:01 -0500
Received: by mail-ua1-f53.google.com with SMTP id l1so8193605uap.8;
 Thu, 20 Jan 2022 02:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3h006M3/LWVfMDsm7eFKgThbCYlNan1je5/XnlvYUYE=;
 b=aHTokoukWdgHrTegJXKY0ifx4G7C/31dp5YX2xLCXP2ZOKlgf/W8poaonwv8u+tFex
 ETRTz+ByoY4bGEp6p2bzzaJ3dtzPESChoJCYlCFmU9hCu9J8wub88ha/h0dGEIjxR4sX
 ueQkhfBKjlMwz8P+v0Yu6uDjXb/DkM/BvpeVankEBKSnNZd2XxNcSEfuX6yfXr5AnIP0
 95QsZkYZ5IYxHCrOGeRu8Qp1hSnHMWz+LtSRzWGKDgGbrR6uLY0lOFYLc8PkhazyhA9J
 4DospoukQW0X9AY7ZM9XlxzJARd5MXjh8g9828OURCevulgototLhHgetCfKidHQjhKO
 B3xQ==
X-Gm-Message-State: AOAM532YSikAoJW2y+zQm143FohsKHF9DnPfS7QiRuY77MCzQygXif+j
 TsWM1p1UQIeRJxUpMr8/RtByfPzFGmJmj328
X-Google-Smtp-Source: ABdhPJwv6mbQRTcgXbMXkXGvduhHuXzj9ShTCVgS7538EeplYyRC/O0c6EP/Y9Mtjf5aQBqgnE0y+A==
X-Received: by 2002:a67:ee58:: with SMTP id g24mr868438vsp.27.1642676275411;
 Thu, 20 Jan 2022 02:57:55 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id q9sm467452uad.3.2022.01.20.02.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 02:57:55 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id c36so9998230uae.13;
 Thu, 20 Jan 2022 02:57:54 -0800 (PST)
X-Received: by 2002:ab0:59ea:: with SMTP id k39mr13657492uad.71.1642676274509; 
 Thu, 20 Jan 2022 02:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20220118163245.2596468-1-cmuellner@linux.com>
 <d654ab4d-7347-f6ce-2845-d319c318f978@univ-grenoble-alpes.fr>
In-Reply-To: <d654ab4d-7347-f6ce-2845-d319c318f978@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <cmuellner@linux.com>
Date: Thu, 20 Jan 2022 11:57:43 +0100
X-Gmail-Original-Message-ID: <CAHB2gtRFns=BSb2Tu+BQQtBaXo+NBtZ2AUb_a253A0hyYKN8=g@mail.gmail.com>
Message-ID: <CAHB2gtRFns=BSb2Tu+BQQtBaXo+NBtZ2AUb_a253A0hyYKN8=g@mail.gmail.com>
Subject: Re: [RESEND] target/riscv: fix RV128 lq encoding
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.222.53;
 envelope-from=christophm30@gmail.com; helo=mail-ua1-f53.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 20 Jan 2022 10:58:04 -0000

Hi Fr=C3=A9d=C3=A9ric,

you are right, I misunderstood the "LQ is added to the MISC-MEM major
opcode" part of the spec.
I saw the encoding conflict with the CBO instructions and thought of a
bug in qemu's LQ encoding.
Philipp already highlighted that cbo.* instructions are actually LQ with rd=
=3D0.

Thanks,
Christoph

On Wed, Jan 19, 2022 at 8:45 PM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Le 18/01/2022 =C3=A0 17:32, Christoph Muellner a =C3=A9crit :
> > If LQ has func3=3D=3D010 and is located in the MISC-MEM opcodes,
> > then it conflicts with the CBO opcode space.
> > However, since LQ is specified as: "LQ is added to the MISC-MEM major
> > opcode", we have an implementation bug, because 'major opcode'
> > refers to func3, which must be 111.
> >
> > This results in the following instruction encodings:
> >
> > lq        ........ ........ .111.... .0001111
> > cbo_clean 00000000 0001.... .0100000 00001111
> > cbo_flush 00000000 0010.... .0100000 00001111
> > cbo_inval 00000000 0000.... .0100000 00001111
> > cbo_zero  00000000 0100.... .0100000 00001111
> >                               ^^^-func3
> >                                        ^^^^^^^-opcode
>
>    Hello Christoph,
>    I see page table 26.1 of the last riscv-isa-manual.pdf what is called =
major
>    opcodes in my understanding, and MISC-MEM is one of them with value 00=
_111_11.
>    The value for func3 that I chose comes from
>    https://github.com/michaeljclark/riscv-meta/blob/master/opcodes
>    which admittedly is out-dated, but I don't see any particular value fo=
r
>    LQ/SQ in the new spec either (I mean, riscv-isa-manual.pdf, any pointe=
r we
>    could refer to ?).
>    I have nothing against changing the opcode, but then we need to change
>    disas/riscv.c which also uses the previous opcode to dump instructions=
 when
>    running with -d in_asm.
>
>    Fr=C3=A9d=C3=A9ric
> >
> > Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> > ---
> >   target/riscv/insn32.decode | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index 5bbedc254c..d3f798ca10 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -168,7 +168,7 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
> >
> >   # *** RV128I Base Instruction Set (in addition to RV64I) ***
> >   ldu      ............   ..... 111 ..... 0000011 @i
> > -lq       ............   ..... 010 ..... 0001111 @i
> > +lq       ............   ..... 111 ..... 0001111 @i
> >   sq       ............   ..... 100 ..... 0100011 @s
> >   addid    ............  .....  000 ..... 1011011 @i
> >   sllid    000000 ......  ..... 001 ..... 1011011 @sh6
>
> --
> +------------------------------------------------------------------------=
---+
> | Fr=C3=A9d=C3=A9ric P=C3=A9trot, Pr. Grenoble INP-Ensimag/TIMA,   Ensima=
g deputy director |
> | Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angus=
ta |
> | http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.=
fr |
> +------------------------------------------------------------------------=
---+

