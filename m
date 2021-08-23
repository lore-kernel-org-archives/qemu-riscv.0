Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIBuc-00025Y-MO
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 11:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIBub-00024F-2N
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 11:30:57 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIBuY-0000n8-Kp
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 11:30:56 -0400
Received: by mail-ej1-x62e.google.com with SMTP id w5so37867602ejq.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FsrGlXDOfd0pynyCIWZllLQLAD+dgM+8uPis0CdO/9w=;
 b=sCOULLI/MqDWibbVJQn/dw3JTlHST4qHnsmHRD3o/G3OHHX4vQUEhovHLIt4Q/lT71
 BPcYKK31aLtdjKe8jpcF8WgjtIkk/iDbgUOCl6SfEdKA3b2FqYTVDk8PztblME2TbNs8
 WBtTZIjzpAZXQTd7cA7grFhUqy1kh6Ha/zAdyaSIykUyc67bvFw98KVUaeYitzCexI6P
 d/kboOrNixafO6QCqMClzFihHaEJefZtMtuuLRmsZJJiylJcUrXFlIzCN65dOMWf8ysJ
 QJ9UoK7AqtMG/SM4O5Nuur7wAYAInzVVzcaZYjUYVlv8Pb2qWYoE8ZL7aUqXbJu2BSZY
 eN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FsrGlXDOfd0pynyCIWZllLQLAD+dgM+8uPis0CdO/9w=;
 b=BcTICE3s+oEfK765axfFVxBuufH0Fob3wciKUFKDAJzG/q/BLka9Wcm/1P4odva71Q
 st0DE+Z5Y0Ne8lVL1YPRJjbgMhUt0cis9j/GqeRtv9c69uKs5o1/Jy3gkPRpcxZ6dm8d
 /EZdV0NNI/hKdKmvVp9Pl/2iSRqu/1qdArfr+5GLQguEda3Q4somW9nxSr5fnBHdrin3
 0JER9VMNd6ZPmNrvVrSJlIoRiB8J76PBeVysWaSC/PxOazJ0Kvp6KVMBlnN5E4x191lP
 84H0jZQDrkBHqo10bWKDj7ExGVcA9xf2yUA8VksHHMxeVwodJJSCB2IYAvb98f5peFau
 85jw==
X-Gm-Message-State: AOAM530AN1x6ZQ+lt6iBBFSkjcptUyHK6yD9IKW20jFz6taGsS0i73rg
 1P4dI/Jg8hfD0Jh68QML+LKNP7kfceKu222d654G1Q==
X-Google-Smtp-Source: ABdhPJy4fE0w2akwHovhabUXVnQsDNiSUkBZLjzsETvVHmF0/6F+aCYPvUmqVW6JAkg3b2+Cxyyw1m78xfuwh/XBIQA=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr36756872ejz.250.1629732652335; 
 Mon, 23 Aug 2021 08:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210823142004.17935-1-changbin.du@gmail.com>
 <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
In-Reply-To: <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 16:30:05 +0100
Message-ID: <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Changbin Du <changbin.du@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 23 Aug 2021 15:30:57 -0000

On Mon, 23 Aug 2021 at 16:21, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 8/23/21 4:20 PM, Changbin Du wrote:
> > To resolve the issue to debug switchable targets, this serias introduce=
s
> > basic infrastructure for gdbstub and enable support for ARM and RISC-V
> > targets.
> >
> > For example, now there is no problem to debug an big-enadian aarch64 ta=
rget
> > on x86 host.
> >
> >   $ qemu-system-aarch64 -gdb tcp::1234,endianness=3Dbig ...
>
> I don't understand why you need all that.
> Maybe you aren't using gdb-multiarch?
>
> You can install it or start it via QEMU Debian Docker image:
>
> $ docker run -it --rm -v /tmp:/tmp -u $UID --network=3Dhost \
>   registry.gitlab.com/qemu-project/qemu/qemu/debian10 \
>   gdb-multiarch -q \
>     --ex 'set architecture aarch64' \
>     --ex 'set endian big'
> The target architecture is assumed to be aarch64
> The target is assumed to be big endian
> (gdb) target remote 172.17.0.1:1234

I don't think that will help, because an AArch64 CPU (at least
in the boards we model) will always start up in little-endian,
and our gdbstub will always transfer register data etc in
little-endian order, because gdb cannot cope with a target that
isn't always the same endianness. Fixing this requires gdb
changes to be more capable of handling dynamic target changes
(this would also help with eg debugging across 32<->64 bit switches);
as I understand it that gdb work would be pretty significant,
and at least for aarch64 pretty much nobody cares about
big-endian, so nobody's got round to doing it yet.

Our target/ppc/gdbstub.c code takes a different tack: it
always sends register data in the same order the CPU is
currently in, which has a different set of cases when it
goes wrong.

thanks
-- PMM

