Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mISTf-0001JC-4Z
	for mharc-qemu-riscv@gnu.org; Tue, 24 Aug 2021 05:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mISTa-0001HL-KC
 for qemu-riscv@nongnu.org; Tue, 24 Aug 2021 05:12:12 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mISTT-0003LI-V9
 for qemu-riscv@nongnu.org; Tue, 24 Aug 2021 05:12:07 -0400
Received: by mail-ed1-x52c.google.com with SMTP id dm15so5524055edb.10
 for <qemu-riscv@nongnu.org>; Tue, 24 Aug 2021 02:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=koheVDs+/OKX3JpROEujOYanfsFtXB+c/60/gWldHD0=;
 b=m/r/px+4zOS3DleHfBI4QcKuIGYWEqBnd0tPYMBxz8CjmCafbVbuotus+w1YJzUaHI
 waY/yYOwIdIoRkTuC5sZD6limfHfvfOnLN89otaEj9rtDt6s4HvJgUPeuyPqs5DViW7l
 m9DSjrWBVow9BYu/WDncw1Y73RFgKe7s5oDKE+j1rusBjsWt5OBUH99S4q+8QRbWhteh
 /5Pj2XgHn45cjKflOda0utabE7kr6XQXBmi5Ma4U5NIRvvshodN3wzlGowq06iBFp0pJ
 DmXVRAg32FwCG2UW+HiLdYRIL01E9cHsL9QrJnpSmRfmHzClR3zWqONvBZIS8NwEwJnn
 2JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=koheVDs+/OKX3JpROEujOYanfsFtXB+c/60/gWldHD0=;
 b=lu1COGaGIVf4qvSVQxkgee5p8a0vYSVKEtXYBXq8UZ9Iiyz4x3vHEGeXuoXywkQbCP
 EUU5KiICzgdsCKmJC6whAs9sh+vdOc8ZlNY5Zi8nwAHTKutFjvdpqGpvSCQ5dCqafyu0
 mLzs9UYe98/FbDaL0IhgW4qf5z0EFd9iA9DEqjmAsfxV6UHjZ+M69MCs+uGw51C2swtH
 XkCgmn1ikC2I5BPJTZFoaD0s8AvnOPVvGbg2fDBESIiwrWYA7YDNUiVs2TPT4IYc4WBW
 nNXnYxVjbhzjcSLYFRAVXPQtHvWjGcvfPdGS0NrtQlDXzvFOZJiX6hTi2dQ1Mf9gSOyE
 ntLQ==
X-Gm-Message-State: AOAM530WNcy7ISwVhSkpElOb6lNx6PaSjwyiEDHsKlnTsIHH+RN+PB7p
 SmblbPVCA/nS71jjo2oGMm6FLQY+DTD9C2M3oTUc+Q==
X-Google-Smtp-Source: ABdhPJwxyAMPMI9YmggIloFbTje0kuMe9QeWGteNoECe62Bv+V4cEg6Gl4BqSICH0RwGBoMPelpWUXkWjO9mn0fiJok=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr41930472edc.204.1629796321088; 
 Tue, 24 Aug 2021 02:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210823142004.17935-1-changbin.du@gmail.com>
 <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
 <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
 <20210823230535.js3gymomh2chmznc@mail.google.com>
In-Reply-To: <20210823230535.js3gymomh2chmznc@mail.google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 10:11:14 +0100
Message-ID: <CAFEAcA8DR4UuZi-QAqMr82tL+S3Y8bEQn7q0W7iCjQCsFRis1Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: Changbin Du <changbin.du@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 24 Aug 2021 09:12:12 -0000

On Tue, 24 Aug 2021 at 00:05, Changbin Du <changbin.du@gmail.com> wrote:
>
> On Mon, Aug 23, 2021 at 04:30:05PM +0100, Peter Maydell wrote:
> > changes to be more capable of handling dynamic target changes
> > (this would also help with eg debugging across 32<->64 bit switches);
> > as I understand it that gdb work would be pretty significant,
> > and at least for aarch64 pretty much nobody cares about
> > big-endian, so nobody's got round to doing it yet.
> >
> Mostly we do not care dynamic target changes because nearly all OS will setup
> endianness mode by its first instruction. And dynamic changes for gdb is hard
> since the byte order of debugging info in elf is fixed. And currently the GDB
> remote protocol does not support querying endianness info from remote.
>
> So usually we needn't change byte order during a debug session, but we just want
> the qemu gdbstub can send data in and handle data it received in right byte order.
> This patch does this work with the help of users via the option 'endianness='.

I'm not a huge fan of putting in workarounds that deal with the
problem for specific cases and require users to tweak options settings,
rather than solving the problem in a more general way that would
let it all Just Work for all cases.

-- PMM

