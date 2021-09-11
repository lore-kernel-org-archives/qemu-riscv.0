Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mP4Io-0001Bk-F9
	for mharc-qemu-riscv@gnu.org; Sat, 11 Sep 2021 10:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP4Im-00016m-4F; Sat, 11 Sep 2021 10:48:20 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:37584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP4Ik-00086V-Na; Sat, 11 Sep 2021 10:48:19 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id r4so10390696ybp.4;
 Sat, 11 Sep 2021 07:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2IaYu/OwNdcxqVbO9GBZrnsAnWUU9nWUfTH1FYh1fYM=;
 b=fCToC2YBWcyMkPaaycUwpvqbZTm1QeydpIoUOyzU/VvALxAtv0CNjCpAhgHKiDskFL
 J5Urdn46jGzeFd5IpxTdU4hnHyrJBmFSyhtV1bNaoFKXaEKVZGCAYWx5GSnCgCvuVC96
 6/Wd+qyNkANNFd2QHOeflIItjBbvPJmS/CWZgdJEI9m4kDcN4w4TaNsty/s9rvJ5vaIN
 UyaJswy9NZ0u3e8vCSYRIkJo1uycppWW9KrDiddk9+U7AEWcVVwG47w41EE2PJzy+zGH
 +j2byiHcm1iXiNm0G2cHitvK1b9pO2g4eDsy3fYuvsU8F/t7fh8EXmJSg3xJhwoOyVCa
 qfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2IaYu/OwNdcxqVbO9GBZrnsAnWUU9nWUfTH1FYh1fYM=;
 b=f1aj56qDBPX4qJn5RwNw4DssXoA21ifGLADqnzc171FzGExYgs16uIbEqWwSTsiL5F
 wuoPDjdylDUFYfCIZ4qOFt0KT0LHjOLeYvWaEGqXvUH+eHs6nsyFzDqeDhOSFOPHSTuB
 zBVCOevL/o7+l3Tmt3tDXumCnWc+0Je442XlBjJv9ppvosyYuEbcuiM8fR3vxZNrG0NH
 6RXIlrPVJB1x+C2ZcF2T2kgroWkY2aOFOgIJvErgIZdzKR+jeMnzcQTevpkJuvPuPecM
 XJIRs/rE185NMdxr9kMpo7hfWqfnICvCG4vPJWr2RBSp4Ou/PnUpDTOqbTeklEXa6w5P
 Khtg==
X-Gm-Message-State: AOAM531qhiRhbqRqFbjgvopelcZ/KMKzAZepij+qJLi5152MxJbe/0eR
 TajD9bYpi2g/zn0wzcJbl0hIXAcvS8PNqVUvCyk=
X-Google-Smtp-Source: ABdhPJx4OPKZrUEsByXBQQE4hQUdy/XQ7LImKrAZdsbbTGBGmm/acH2QU8pOLgWbCKhaGMaI/pniO0gm5vkvW9GGhec=
X-Received: by 2002:a25:905:: with SMTP id 5mr1977271ybj.293.1631371697381;
 Sat, 11 Sep 2021 07:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210910055620.946625-1-frank.chang@sifive.com>
 <20210910055620.946625-2-frank.chang@sifive.com>
 <CAEUhbmUgceFXLF21L1U+bo0Rz-5Cwiig=Bmh0feo0ZVwXExeQg@mail.gmail.com>
 <CAEUhbmWzYnhM5Mc__SfmaNeimKuts93Mmq6481K3h-5jUsBLzA@mail.gmail.com>
In-Reply-To: <CAEUhbmWzYnhM5Mc__SfmaNeimKuts93Mmq6481K3h-5jUsBLzA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 11 Sep 2021 22:48:06 +0800
Message-ID: <CAEUhbmUTihTqGz8MDwJNQTVFs0gbGJxMptrd3L-_5urvZ_Onmg@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/dma: sifive_pdma: reset Next* registers when
 Control.claim is set
To: frank.chang@sifive.com
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Max Hsu <max.hsu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
X-List-Received-Date: Sat, 11 Sep 2021 14:48:20 -0000

On Sat, Sep 11, 2021 at 9:12 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Sep 11, 2021 at 8:37 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Fri, Sep 10, 2021 at 1:56 PM <frank.chang@sifive.com> wrote:
> > >
> > > From: Frank Chang <frank.chang@sifive.com>
> > >
> > > Setting Control.claim clears all of the chanel's Next registers.
> > > This is effective only when Control.claim is set from 0 to 1.
> > >
> > > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > > Tested-by: Max Hsu <max.hsu@sifive.com>
> > > ---
> > >  hw/dma/sifive_pdma.c | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> > > index 9b2ac2017d9..e723db9d700 100644
> > > --- a/hw/dma/sifive_pdma.c
> > > +++ b/hw/dma/sifive_pdma.c
> > > @@ -54,6 +54,9 @@
> > >  #define DMA_EXEC_DST        0x110
> > >  #define DMA_EXEC_SRC        0x118
> > >
> > > +#define CONFIG_WRSZ_DEFAULT 6
> > > +#define CONFIG_RDSZ_DEFAULT 6
> >
> > The FU540 manual says the next config reset value is 0, not 6.
> >
>
> From patch#2 's log on Unmatched, I see where the number 6 is coming.
> I also validated on Unleashed and observed the same. So there is a
> documentation error.
>
> Please add a comment to explain that.
>
> Otherwise,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Tested-by: Bin Meng <bmeng.cn@gmail.com>

