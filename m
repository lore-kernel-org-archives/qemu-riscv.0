Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgyTK-00061l-9f
	for mharc-qemu-riscv@gnu.org; Wed, 12 May 2021 19:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lgyTI-00061T-4y; Wed, 12 May 2021 19:40:56 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:37715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lgyTG-0006it-GI; Wed, 12 May 2021 19:40:55 -0400
Received: by mail-il1-x131.google.com with SMTP id j12so21652714ils.4;
 Wed, 12 May 2021 16:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VmoptVDPUya889qnWxY3zvOr/LlrmJRJBYYjyNJqpRA=;
 b=DHJKNYLlXK9GbhESklAmnpV0hFj/wvBg08FhksLas8FsG27lMViuIybb6LvRwRd9ft
 qwGxbrkP5474nhf7VPLJj4aIZ+RGmDzJZWjY7P05aVN6cPVDbgDnVPjpqNfQyoCnh7u5
 rEycTD+2y7SuhyAN1yjbK0D3sbBQKCEr5VhfEiZNHPcxxRc7TWHwM3p42VlQkoYawrj/
 tor5RSFfKz3E/ujPUZGVc4tQNh3dp4kKx731MMpF1vVWqsC1h3+1bclG1hPk6oDJDmFc
 qF4eo4aUJ8E5JsRR4P/kNGCoyuFVH2Ejp8Y73n5S2nxuwOcQS8f+yu1tjk7BW4QDiNRk
 dFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VmoptVDPUya889qnWxY3zvOr/LlrmJRJBYYjyNJqpRA=;
 b=gByn8xZ4JNTLmY2et1W2uqyne0+DIEbrjYalGfC/Eep7kaFx8JCH5U7pZxHcj+qrdf
 Hgerk0anrsH5ZrswxDI4y4EiJbstC7xkxBa7z40jFlYwGbsWewa5lpqFFnuuYF6RixYj
 eb4lzWROeHefJVxU65X83yLxSMoH6qFlj7r1Szzvr9JXFrbTuH8wjn+rIi/VxCVozwNE
 AEF7cT7jazynAQDRaVybTZ6Uxj+MXaXifWMqq6jZ8HpTPNZhL+cGmJWBT61u6whnfTFp
 VohbHpxEaaP/s00RpyEGifAVQP9cpEjEm92CYhQYIsOJ43y3DGapeXDk/McANNwvlihw
 xPig==
X-Gm-Message-State: AOAM530DjA+arEvM2xALyMT/xV8kkOOqUpyt+hbRkdaMxbIFpYxf8/0e
 Vx8YJzDknuzvyTxsvUXTo8hcyMQiiUCa41ch1Q0=
X-Google-Smtp-Source: ABdhPJxZw00V4H1z2oL0Yo+QR2F12qhSNw+0MUqR5cts/F91Fkeky9rnJc5KDD5KXWkCQ5u0VTBVmVB5/sOojEYxgL4=
X-Received: by 2002:a05:6e02:1566:: with SMTP id
 k6mr223068ilu.227.1620862853020; 
 Wed, 12 May 2021 16:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210511100722.18065-1-ruinland@andestech.com>
 <CAKmqyKO35O+bichwKQVeZ2tPT+2G-hweds1VY6oJc_bqkuG8Zw@mail.gmail.com>
 <CAEUhbmUZi17xzoSU9jwJubeqwi+gzXQ0p6kSDY2T579wCdQopg@mail.gmail.com>
In-Reply-To: <CAEUhbmUZi17xzoSU9jwJubeqwi+gzXQ0p6kSDY2T579wCdQopg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 May 2021 09:40:26 +1000
Message-ID: <CAKmqyKMvtf0CakQS4TG8UAYT6XFqMSbMu08FLss=D=b=i-MOKw@mail.gmail.com>
Subject: Re: [PATCH V2 0/2] Proposing custom CSR handling logic
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Dylan Jhong <dylan@andestech.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Wed, 12 May 2021 23:40:57 -0000

On Thu, May 13, 2021 at 12:47 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, May 12, 2021 at 2:03 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, May 11, 2021 at 8:07 PM Ruinland Chuan-Tzu Tsai
> > <ruinland@andestech.com> wrote:
> > >
> > > Hi all,
> > >
> > > My sincere apology that I missed the patch to include our own CSR table
> > > into the patch series and there were plenty of typos.
> > > Thus I'm sending out V2 of these tiny patches.
> > >
> > > I agree with Alistair's comment on not introducing intrusive code which
> > > will interfere the generic code structure. Yet since there are
> > > possibilities that some custom CSRs/instructions could be once drafted/
> > > proposed by vendors at first, and made themselves into the standard
> > > as the implementation become widely adopted.
> > >
> > > So in this patch set, we humbly utilzed a glib hash table for inserting
> > > the `struct riscv_custom_csr_operations`, check if the CSR is a non
> > > standard one, and then proceed the desired behavior.
> > >
> > > Once the non-standard CSRs make themselves into the specification,
> > > people could easily plug-and-use the code into CSR operation table
> > > inside `csr.c`.
> > >
> > > Ones may have concerns regarding the check code would introduce
> > > further overhead. For those considerations, I guess it could be solved
> > > by introducing a build option such as '--enable-riscv-vendor-features'
> > > to toggle the code.
> > >
> > > Cordially yours,
> > > Ruinland ChuanTzu Tsai
> > >
> > > Ruinland Chuan-Tzu Tsai (2):
> > >   Adding premliminary support for custom CSR handling mechanism
> > >   Adding custom Andes CSR table.
> >
> > Thanks for the patches.
> >
> > Can you please include:
> >  wangjunqiang@iscas.ac.cn
> >  qemu-devel@nongnu.org
> >  bin.meng@windriver.com
> >
> > on future patches so everyone is included.
>
> Thanks Alistair!
>
> >
> > >
> > >  target/riscv/cpu.c           |  28 ++++++++
> > >  target/riscv/cpu.h           |  12 +++-
> > >  target/riscv/cpu_bits.h      | 115 ++++++++++++++++++++++++++++++++
> > >  target/riscv/csr.c           | 107 ++++++++++++++++++++++++++++--
> > >  target/riscv/csr_andes.inc.c | 125 +++++++++++++++++++++++++++++++++++
> > >  5 files changed, 381 insertions(+), 6 deletions(-)
>
> I didn't see the original patch set in the ML, nor does it show up on
> patchwork. I wonder is it posted on the ML?

It might not have. It is an early version and needs some more work,
but it does seem to be on the right track. I left a few comments but
hopefully the next version will make it to the mailing list.

I will CC you on the response so you can see.

Alistair

>
> Regards,
> Bin

