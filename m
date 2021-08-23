Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIIjn-0002S2-5U
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 18:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mIIjl-0002QW-5m; Mon, 23 Aug 2021 18:48:13 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mIIjj-0005II-K1; Mon, 23 Aug 2021 18:48:12 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so487728pjb.3; 
 Mon, 23 Aug 2021 15:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=C9Ryswg6b8sFnt1nqfjsT9/BG4Qszs4WL1eSmKn8BGk=;
 b=hQF36mRUoPPLg/tVE9p/1n8wI/vt1rliafW9EgAA7qpLuOI9cMUjhIYbA/uL77qrlm
 d58a1e70nkf+vTExq2cPnvkLxoCDyb3nVUdGQmpDXSomqsXLl1fUIegdF6laTb13q0nI
 4uLp9k8eNufcUymp/hi/Cm6PeRut1l6xAYJACgKzqwsETmXtNEKQSgpZxagrIF/0PiD5
 zWxsxL+LTkzeDKwj7e3eX7VfcDIN5f5EI9OQITILsMyedE7dEVmjdAN3ua+FA2pljahY
 MR46ZC765EhRQFnhEGoFbyLCGYkJoK/L60o2YumDRkP0gQ6hSngeeUlYEV8NmTgbkp93
 FPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=C9Ryswg6b8sFnt1nqfjsT9/BG4Qszs4WL1eSmKn8BGk=;
 b=MylmKtwaCVgQW9S81PIVyKMJuw4X1G9uU+2qchHtrW27eprvXVLLrPO3EU4uMjrlzV
 I9YU+PoMroISQVOF9lf3Oo5mmxNY2EUKZZmIOVlEW04MTWoxYGH6QqTwq6d814L05DYY
 JSvUwwzIqH8nVvv5CniHIbHTblMzIAxGXGtgnGnuTsKqG5YpofdPeqd6dSqXeQcO2Ipq
 k2KNanswAwZIZVdBLrUk5ThudatFBSGDyu3EspN0GFum1NLMyvM0cSZnFkOcFs5xrKwm
 2KDDawuJ1yBb4P6aliaVShzoFDnfWNQXDUdh+l5QuLOiiI11WbBYG+d52rJGyW3kWCgj
 qOGQ==
X-Gm-Message-State: AOAM5337ylUhQFpNsenZrZ38dCmSmlbLrziB900OiUiOgbE+BYkQ0Aln
 FHihnYicJJhzR0wOvPXjysk=
X-Google-Smtp-Source: ABdhPJwZNYqPWGPEiCe3cfhdG05XtrnEYeejz/6koxB3pN+agS7KjdTetnOkfN30F5PAdCuS+9SjKA==
X-Received: by 2002:a17:90b:3ec5:: with SMTP id
 rm5mr902251pjb.110.1629758889338; 
 Mon, 23 Aug 2021 15:48:09 -0700 (PDT)
Received: from mail.google.com ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id k4sm17048334pff.12.2021.08.23.15.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 15:48:08 -0700 (PDT)
Date: Tue, 24 Aug 2021 06:47:56 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Changbin Du <changbin.du@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
Message-ID: <20210823224756.p7qtttv675gumtri@mail.google.com>
References: <20210823142004.17935-1-changbin.du@gmail.com>
 <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=changbin.du@gmail.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 22:48:13 -0000

On Mon, Aug 23, 2021 at 05:21:07PM +0200, Philippe Mathieu-Daudé wrote:
> On 8/23/21 4:20 PM, Changbin Du wrote:
> > To resolve the issue to debug switchable targets, this serias introduces
> > basic infrastructure for gdbstub and enable support for ARM and RISC-V
> > targets.
> > 
> > For example, now there is no problem to debug an big-enadian aarch64 target
> > on x86 host.
> > 
> >   $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...
> 
> I don't understand why you need all that.
> Maybe you aren't using gdb-multiarch?
>
Nope, my gdb support all architectures.

> You can install it or start it via QEMU Debian Docker image:
> 
> $ docker run -it --rm -v /tmp:/tmp -u $UID --network=host \
>   registry.gitlab.com/qemu-project/qemu/qemu/debian10 \
>   gdb-multiarch -q \
>     --ex 'set architecture aarch64' \
>     --ex 'set endian big'
> The target architecture is assumed to be aarch64
> The target is assumed to be big endian
> (gdb) target remote 172.17.0.1:1234
> (gdb)
>
The gdb has no problem to read endianness and arch info from elf. The problem
is how qemu gdbstub handles the byte order it received.

Now let's try to debug a big-enadian aarch64 linux kernel.

1) start qemu with '-gdb tcp::1234'

$ gdb-multiarch vmlinux
(gdb) target remote :1234
Remote debugging using :1234
0x0000004000000000 in ?? ()
=> 0x0000004000000000:	Cannot access memory at address 0x4000000000
(gdb) ni
Cannot access memory at address 0x4000000000
(gdb) show architecture 
The target architecture is set to "auto" (currently "aarch64").
(gdb) show endian 
The target endianness is set automatically (currently big endian).

You see it an't work, not to mention adding breakpoints.

2) start qemu with '-gdb tcp::1234,endianness=big'

$ gdb-multiarch vmlinux
(gdb) target remote :1234
Remote debugging using :1234
0x0000000040000000 in ?? ()
=> 0x0000000040000000:	c0 00 00 58	ldr	x0, 0x40000018
(gdb) ni
0x0000000040000004 in ?? ()
=> 0x0000000040000004:	e1 03 1f aa	mov	x1, xzr
(gdb) b start_kernel
Breakpoint 1 at 0xffff800011130ee8 (2 locations)
(gdb) c
Continuing.

Thread 1 hit Breakpoint 1, 0xffff800011130ee8 in start_kernel ()
=> 0xffff800011130ee8 <start_kernel+0>:	5f 24 03 d5	bti	c
(gdb) bt
#0  0xffff800011130ee8 in start_kernel ()
#1  0xffff8000111303c8 in __primary_switched () at arch/arm64/kernel/head.S:467
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

okay, now it works fine.

-- 
Cheers,
Changbin Du

