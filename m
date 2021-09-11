Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mP2o6-0004ji-4W
	for mharc-qemu-riscv@gnu.org; Sat, 11 Sep 2021 09:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP2o4-0004jJ-CB; Sat, 11 Sep 2021 09:12:32 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:41508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP2nz-0000ON-Kf; Sat, 11 Sep 2021 09:12:32 -0400
Received: by mail-yb1-xb33.google.com with SMTP id z18so9988040ybg.8;
 Sat, 11 Sep 2021 06:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HI6yXuDkVLFAjUUT3s5/rl3hzFC5eFvEqgt+t2LlIiA=;
 b=paxZVfIjXWFK+u/1bABJSFc/VLA1luziuyDPR9LyDUMAowWnD2hzYZUSSUfQbjtT5H
 STh4e3uh7Nz8RVjDhI8/ixhLY5kEvxfm30b5R2YaSEmEWLSYHpOYiOHs5xtyz+50eV0/
 O3i1/EcStgf0DZPm0ApIEMS81GQm5aM/NXsSAFH51morxwMscl56jO8I9yBohDjeEbGD
 LTDRoHOXGci527moHTKYcZ02a78Q4z1h4C41G7f2I4Xe+L/PVHDjBg64dzO1LeqLvJT+
 +zZ60qvSqiH3bw4kHjtz5FWmAeGX9Ud8MaANy/qtk6uPJWWPqRO5Rn+o6VoMJqdj8pyy
 wYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HI6yXuDkVLFAjUUT3s5/rl3hzFC5eFvEqgt+t2LlIiA=;
 b=kddpPkfx4ZLV2R7V4V+w8ev8qMKFYN8vmw7n4tFAkney5rDJM2SbiLhHgVZfdRoVvN
 EDp2r5moANePMf2MfRhRGQJwLRac06iaBqQC1FSm0iC7isVhybZ1yQileM79JCHG7J6t
 KmyjvnRJVzV8dtFoHROvXdO/isol4ARCur5mmt/SoMvcuOiyUK+r9q4cOYI357ac0Gbj
 x1ciyNUsweet2WnfgNH+QpZJwWJkUA23Dcg8MD86gNkxyGDkqZ/mp2RGXMR78EXLEFYz
 1dKC93qLfq/pFPC5UGbADm37C9QuquQrhBDjf3LZDvUDeMFSgi+TzyE5fz7fQpBUHUPW
 vbcA==
X-Gm-Message-State: AOAM531ypBWWBXLvA3wXKanS4deRFE6srfmlnc2RwxaDquUbsAfZFLMI
 ZuCz6qm12KRPqcyOBBMb4+Pn2VmKA3u7bEOtEC0=
X-Google-Smtp-Source: ABdhPJzhEWrXow2IDqLrNgkfB1VJoQW0UK01QulvzjHmxYci/E13qQR/9C3TGSw9Ia/Qr7XykdkB1TtH6TLSXTtFxDc=
X-Received: by 2002:a05:6902:70b:: with SMTP id
 k11mr3304753ybt.313.1631365946364; 
 Sat, 11 Sep 2021 06:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210910055620.946625-1-frank.chang@sifive.com>
 <20210910055620.946625-2-frank.chang@sifive.com>
 <CAEUhbmUgceFXLF21L1U+bo0Rz-5Cwiig=Bmh0feo0ZVwXExeQg@mail.gmail.com>
In-Reply-To: <CAEUhbmUgceFXLF21L1U+bo0Rz-5Cwiig=Bmh0feo0ZVwXExeQg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 11 Sep 2021 21:12:15 +0800
Message-ID: <CAEUhbmWzYnhM5Mc__SfmaNeimKuts93Mmq6481K3h-5jUsBLzA@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/dma: sifive_pdma: reset Next* registers when
 Control.claim is set
To: frank.chang@sifive.com
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Max Hsu <max.hsu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
X-List-Received-Date: Sat, 11 Sep 2021 13:12:32 -0000

On Sat, Sep 11, 2021 at 8:37 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Sep 10, 2021 at 1:56 PM <frank.chang@sifive.com> wrote:
> >
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > Setting Control.claim clears all of the chanel's Next registers.
> > This is effective only when Control.claim is set from 0 to 1.
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > Tested-by: Max Hsu <max.hsu@sifive.com>
> > ---
> >  hw/dma/sifive_pdma.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> > index 9b2ac2017d9..e723db9d700 100644
> > --- a/hw/dma/sifive_pdma.c
> > +++ b/hw/dma/sifive_pdma.c
> > @@ -54,6 +54,9 @@
> >  #define DMA_EXEC_DST        0x110
> >  #define DMA_EXEC_SRC        0x118
> >
> > +#define CONFIG_WRSZ_DEFAULT 6
> > +#define CONFIG_RDSZ_DEFAULT 6
>
> The FU540 manual says the next config reset value is 0, not 6.
>

From patch#2 's log on Unmatched, I see where the number 6 is coming.
I also validated on Unleashed and observed the same. So there is a
documentation error.

Please add a comment to explain that.

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

