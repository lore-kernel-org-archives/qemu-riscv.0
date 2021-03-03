Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHWqP-0006QQ-T0
	for mharc-qemu-riscv@gnu.org; Wed, 03 Mar 2021 14:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHWqO-0006P7-Hu; Wed, 03 Mar 2021 14:07:36 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:38721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHWqM-0005Ls-NZ; Wed, 03 Mar 2021 14:07:36 -0500
Received: by mail-il1-x134.google.com with SMTP id f10so21895061ilq.5;
 Wed, 03 Mar 2021 11:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8H3G6JQkFEE7jXksEm6eQgfyeTbkbZB5NypGd+OCQyY=;
 b=MXUJK/KVJuq3e9FvYKyrPCBUAahGSTOgVRs7EVn35UKlZVX//f4188k/5X9KIMKTvj
 DSCygvRQD9sP+J5yyT69L5daROLnLL/tXufS93GhxpjlCFh1/thDcF0gcDXsS+4fBLZN
 9ooo0kzA43bv/N+Nsm9gjeI2rV5d6p0nyEk9YBBKzeHvVqWvUwXNh++9zF9bmYXDn4Am
 TXlEhop7elBdajXXshSQKgeYv1I30Vi3chsc5cymH2jz5RltK9hwq9hSTMPiju4VWkP1
 ghlyrZ2XAX2XsdmvVzPg3ZKUvM5ThYBgcH0KxPs5arDzflES+d/7OX4ejuUizKnVkg0D
 iq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8H3G6JQkFEE7jXksEm6eQgfyeTbkbZB5NypGd+OCQyY=;
 b=tDop/LF6F4WL6ngthjdoFPVIU1+WKS3wlIdkTALCMPrj0CbZ2WrKc5oPlGnr3jbEro
 JrmdUA9pTcTRIEXBDCXE5iPqnxxvOC0fJ6Ysqqu7APCh/wtiwFFToncsO9j+5oS+wqqi
 R0bK+B3YAVPYlyw6OXjjXBhwb1mdbakE6DU/v+kMhKtdWpr4l5gWqvOehoZILKlONA39
 K7+wT5R/2LcbSfOruiUOVCG1AdPjJSK8Wqv25Pax6jl52VVjNKT273KI1ip85LQ3WQti
 t73YN/F28+KeC06SYl07H4nm6iRAHxkm4rrMunRcG0oxUy6c71UMQee1aH78G/CSnEF0
 pNjw==
X-Gm-Message-State: AOAM532svBqgrzOoxKL1rVekLqk1SZ+02f9j4rgCgTm7fAKvmfPWdacK
 tRoam1aKD4ve44Y/NdwIAtWN+w74nCL3fOyglvBRZnpk2Dg=
X-Google-Smtp-Source: ABdhPJxt6Mxv/kdlEv6/pNNwsYbbUifQK8PwBmdKwZ9g+tRJH7xaVPgf//OqIk1uV5NYNh0vlFkhsh/wePUvVehXa2k=
X-Received: by 2002:a05:6e02:218f:: with SMTP id
 j15mr741683ila.40.1614798453458; 
 Wed, 03 Mar 2021 11:07:33 -0800 (PST)
MIME-Version: 1.0
References: <20210220144807.819-1-bmeng.cn@gmail.com>
 <CAEUhbmX2+CtzQ53JbN-Vn9mVX9tipTND3xGJzk317mTZEfayJA@mail.gmail.com>
In-Reply-To: <CAEUhbmX2+CtzQ53JbN-Vn9mVX9tipTND3xGJzk317mTZEfayJA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Mar 2021 14:06:17 -0500
Message-ID: <CAKmqyKMyVzoK9H2bVs8ngRvXNU+KOTi7_ZqW9U6f-+tXRkw3SQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] hw/riscv: Clean-ups and map high mmio for PCIe of
 'virt' machine
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Wed, 03 Mar 2021 19:07:37 -0000

On Sun, Feb 28, 2021 at 12:15 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Feb 20, 2021 at 10:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > This series does the following clean-ups:
> > - Drop 'struct MemmapEntry'
> > - virt: Drop the 'link_up' parameter of gpex_pcie_init()
> >
> > It also adds the following small enhancement to 'virt' machine:
> > - Limit RAM size in a 32-bit system
> > - Map high mmio for PCIe
> >
> > Changes in v3:
> > - Fix the typo (limit) in the commit message and codes
> >
>
> Ping?

Yep, just got back from holidays.

Thanks!

Applied to riscv-to-apply.next

Alistair

>

