Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIJAw-0006Ni-NL
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 19:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mIJAt-0006FE-Nh; Mon, 23 Aug 2021 19:16:15 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mIJAq-000369-MC; Mon, 23 Aug 2021 19:16:15 -0400
Received: by mail-il1-x135.google.com with SMTP id r6so18688327ilt.13;
 Mon, 23 Aug 2021 16:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JW3d3CKiYWG0P5M1jjy7msXIjoNn2Et5CEq342/vUTg=;
 b=i9l5SeF+LPsuZayn9/1DdRw5ojB1Vx72jIao4RSkeXts4drqx6pMABxLl9lJh+G6hG
 PZQgyAf/jS3/0kruQy3GS4V5BJN0U3OE0RR+4TPIIdl+Of8iseVxqc4/auyuori7504h
 NZihaiUGJgWDp0NNZZ3bUhVaALC7JOSx81iZgfgmTwlwXPb6KZ+Ck3eI/BUld8qPPMm9
 8u7zqHOyH3JWEilzEBYQy0LweUi8o6g8xTqor0TP81Jr23yVh93j37jrsYAbM8owjmoh
 c8D31eKs45o9ZUDI4WFIKJHYHQErsHfl80Oxt2n0GzAfBkvPBgU0TUQOVJqd2paAIZO9
 bdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JW3d3CKiYWG0P5M1jjy7msXIjoNn2Et5CEq342/vUTg=;
 b=k2DKYeNYz1CxZBKAoq7IGSDIpHLE7bQ/uSXutWy53PnWI0JNN8vzz1yp6uwL1L+tiH
 vV+suapsAhOgIVuJGy5qdHKeuUSI2fDXF3syPZvWYcaYJyvSzvEhgzvNAtEoXG1+03D0
 hvh+0mjwhnF2Rq1aKxi5QtaFH9ZSovCYNGEcOUzJN0ifzspSR7OVh3NbzFntyDRCcm6t
 QMsL3oQ+pV2b3DwR59hfqJ/9tRfjsm8pn3dv55DTEP3MqU7KzNbcWkvWALRViwXnGHHD
 5tazYDfLUnXubqjTysKKwaHZ85wMTgWZMxRDpWKqyKigV1zxCyKD6wfZtsfcOyM69qsj
 DaTA==
X-Gm-Message-State: AOAM533JTWnfYZ+LJc9DeFRg7HOzNrIa/jETizBCnLJdAfR775PmLjW0
 ct8iYZeWvqeFF3h9+2cP613Ff9eHxZgR4Q==
X-Google-Smtp-Source: ABdhPJzB6lUbQ55FTmaSxafbCovZCZAn6A4xKkze17JWYb0oB/phYm8b5xeVnu1I6JaUZbZyCxX5+Q==
X-Received: by 2002:a63:8948:: with SMTP id v69mr34146486pgd.132.1629759943276; 
 Mon, 23 Aug 2021 16:05:43 -0700 (PDT)
Received: from mail.google.com ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id lk17sm255431pjb.44.2021.08.23.16.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 16:05:42 -0700 (PDT)
Date: Tue, 24 Aug 2021 07:05:35 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Changbin Du <changbin.du@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
Message-ID: <20210823230535.js3gymomh2chmznc@mail.google.com>
References: <20210823142004.17935-1-changbin.du@gmail.com>
 <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
 <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=changbin.du@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 23:16:16 -0000

On Mon, Aug 23, 2021 at 04:30:05PM +0100, Peter Maydell wrote:
> On Mon, 23 Aug 2021 at 16:21, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> >
> > On 8/23/21 4:20 PM, Changbin Du wrote:
> > > To resolve the issue to debug switchable targets, this serias introduces
> > > basic infrastructure for gdbstub and enable support for ARM and RISC-V
> > > targets.
> > >
> > > For example, now there is no problem to debug an big-enadian aarch64 target
> > > on x86 host.
> > >
> > >   $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...
> >
> > I don't understand why you need all that.
> > Maybe you aren't using gdb-multiarch?
> >
> > You can install it or start it via QEMU Debian Docker image:
> >
> > $ docker run -it --rm -v /tmp:/tmp -u $UID --network=host \
> >   registry.gitlab.com/qemu-project/qemu/qemu/debian10 \
> >   gdb-multiarch -q \
> >     --ex 'set architecture aarch64' \
> >     --ex 'set endian big'
> > The target architecture is assumed to be aarch64
> > The target is assumed to be big endian
> > (gdb) target remote 172.17.0.1:1234
> 
> I don't think that will help, because an AArch64 CPU (at least
> in the boards we model) will always start up in little-endian,
> and our gdbstub will always transfer register data etc in
> little-endian order, because gdb cannot cope with a target that
> isn't always the same endianness. Fixing this requires gdb
Yes, that's the problem.

> changes to be more capable of handling dynamic target changes
> (this would also help with eg debugging across 32<->64 bit switches);
> as I understand it that gdb work would be pretty significant,
> and at least for aarch64 pretty much nobody cares about
> big-endian, so nobody's got round to doing it yet.
> 
Mostly we do not care dynamic target changes because nearly all OS will setup
endianness mode by its first instruction. And dynamic changes for gdb is hard
since the byte order of debugging info in elf is fixed. And currently the GDB
remote protocol does not support querying endianness info from remote.

So usually we needn't change byte order during a debug session, but we just want
the qemu gdbstub can send data in and handle data it received in right byte order.
This patch does this work with the help of users via the option 'endianness='.

> Our target/ppc/gdbstub.c code takes a different tack: it
> always sends register data in the same order the CPU is
> currently in, which has a different set of cases when it
> goes wrong.
>
Yes, I tried to do this before. But as I said above GDB unable to handle dynamic
target changing. Maybe we can take this way as 'endianness=default'? Anyway,
this requires each target provides a interface to determine the current byte
order.

> thanks
> -- PMM

-- 
Cheers,
Changbin Du

