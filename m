Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgq9A-0007X5-1A
	for mharc-qemu-riscv@gnu.org; Wed, 12 May 2021 10:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lgq96-0007To-KH; Wed, 12 May 2021 10:47:32 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:35446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lgq8r-0006En-HL; Wed, 12 May 2021 10:47:27 -0400
Received: by mail-yb1-xb35.google.com with SMTP id i4so31039652ybe.2;
 Wed, 12 May 2021 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TIhpazb+NZwwpQ8jJjDfqBzDHPawsuNSMAGKROJQWBM=;
 b=QHxCMOU7/ea0UUliE8mBYTDKRGOmdPkh+6MFGT7Cc2McRZu1V9S/LBGSzrKz+r3HHZ
 WssEiSB9gfXNERkh56Ordns+N3v9BmEvlEr7gHlj5hg1Ha4nuUnkuRjoXIslsnDPC21K
 p8Ez31VtiQK00LFiYDvGwdz0fU00vjicBIcaYNkRt3XRKMRvXkpzxqTLonmrRG+Firh0
 yfKczWp2Yv5k12dLNOgzxYNviorwI7YqcCggKWKOCraFSP2XnuYgaqliz9OPyC35E9HY
 MdaPfqZhr15kATwFTZTOUuxgAeSq9w8Mq4HJPfn2SaOiDvZGnIAGg3JzJQ034Gt+o7IY
 TJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TIhpazb+NZwwpQ8jJjDfqBzDHPawsuNSMAGKROJQWBM=;
 b=KVJw+JG0wU8uGyndkDQx5lKEpdZkS9ODmExXapgdvZ1YF6zRMtK3WeEVOiSZ0J3qr2
 2wDt0N4oTCyVF+60hamcChWoIKv5/0mRXK7RCtzgPmH2qwLoMLhyJSvL1Va0f/duZn1P
 VVOyH0DUS5+w5ZKnOHvwy/8WLo3Wwza7TtOk8hqgC4/vUFReZ3vxrYZyyD2L2fQUkeCn
 KIdJVG1oiZCP51Yp66jfXjV2SXEgoPQSTjBlQfeNvFf31mD5ErbyzHo06aSUIvl6Hv9E
 TagLK2Mjnczlzc9oozmOvsV17LEpg7slgp+tNzDfoLyF/AQue8EEfSodcEnGrb5+/zOQ
 oLgA==
X-Gm-Message-State: AOAM531eHG39Rr3Z4t7t4BXnMenK/gUwXnUe3f+Z7wHOcZislB7BqLN4
 G55htfjl507p4XD+JNYIZjyDygmqS1hn2gy7G1U=
X-Google-Smtp-Source: ABdhPJxfbB4vPpMocbdSYvmTp9EotJnR00RUSjBYLAbmmnXqVRY1aOlMjPcyLgoLhvK80trS+h0KLpSrOWSX1e9ITig=
X-Received: by 2002:a25:99c1:: with SMTP id q1mr47340264ybo.517.1620830834041; 
 Wed, 12 May 2021 07:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210511100722.18065-1-ruinland@andestech.com>
 <CAKmqyKO35O+bichwKQVeZ2tPT+2G-hweds1VY6oJc_bqkuG8Zw@mail.gmail.com>
In-Reply-To: <CAKmqyKO35O+bichwKQVeZ2tPT+2G-hweds1VY6oJc_bqkuG8Zw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 12 May 2021 22:47:02 +0800
Message-ID: <CAEUhbmUZi17xzoSU9jwJubeqwi+gzXQ0p6kSDY2T579wCdQopg@mail.gmail.com>
Subject: Re: [PATCH V2 0/2] Proposing custom CSR handling logic
To: Alistair Francis <alistair23@gmail.com>
Cc: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Dylan Jhong <dylan@andestech.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
X-List-Received-Date: Wed, 12 May 2021 14:47:33 -0000

On Wed, May 12, 2021 at 2:03 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, May 11, 2021 at 8:07 PM Ruinland Chuan-Tzu Tsai
> <ruinland@andestech.com> wrote:
> >
> > Hi all,
> >
> > My sincere apology that I missed the patch to include our own CSR table
> > into the patch series and there were plenty of typos.
> > Thus I'm sending out V2 of these tiny patches.
> >
> > I agree with Alistair's comment on not introducing intrusive code which
> > will interfere the generic code structure. Yet since there are
> > possibilities that some custom CSRs/instructions could be once drafted/
> > proposed by vendors at first, and made themselves into the standard
> > as the implementation become widely adopted.
> >
> > So in this patch set, we humbly utilzed a glib hash table for inserting
> > the `struct riscv_custom_csr_operations`, check if the CSR is a non
> > standard one, and then proceed the desired behavior.
> >
> > Once the non-standard CSRs make themselves into the specification,
> > people could easily plug-and-use the code into CSR operation table
> > inside `csr.c`.
> >
> > Ones may have concerns regarding the check code would introduce
> > further overhead. For those considerations, I guess it could be solved
> > by introducing a build option such as '--enable-riscv-vendor-features'
> > to toggle the code.
> >
> > Cordially yours,
> > Ruinland ChuanTzu Tsai
> >
> > Ruinland Chuan-Tzu Tsai (2):
> >   Adding premliminary support for custom CSR handling mechanism
> >   Adding custom Andes CSR table.
>
> Thanks for the patches.
>
> Can you please include:
>  wangjunqiang@iscas.ac.cn
>  qemu-devel@nongnu.org
>  bin.meng@windriver.com
>
> on future patches so everyone is included.

Thanks Alistair!

>
> >
> >  target/riscv/cpu.c           |  28 ++++++++
> >  target/riscv/cpu.h           |  12 +++-
> >  target/riscv/cpu_bits.h      | 115 ++++++++++++++++++++++++++++++++
> >  target/riscv/csr.c           | 107 ++++++++++++++++++++++++++++--
> >  target/riscv/csr_andes.inc.c | 125 +++++++++++++++++++++++++++++++++++
> >  5 files changed, 381 insertions(+), 6 deletions(-)

I didn't see the original patch set in the ML, nor does it show up on
patchwork. I wonder is it posted on the ML?

Regards,
Bin

