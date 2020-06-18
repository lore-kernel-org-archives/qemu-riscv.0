Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlmnK-0008Jb-VE
	for mharc-qemu-riscv@gnu.org; Thu, 18 Jun 2020 01:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jlmnJ-0008G7-IV; Thu, 18 Jun 2020 01:08:57 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:39588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jlmnH-00015L-Nd; Thu, 18 Jun 2020 01:08:57 -0400
Received: by mail-yb1-xb42.google.com with SMTP id j202so2470653ybg.6;
 Wed, 17 Jun 2020 22:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JPDf4eoDyKL1psbgQbjHSwKw7oBnRPJcA7RCYCoyfxY=;
 b=L+y//2Tse4sEzmaymM8/8jWID76ifRx2Xc9dkTYyq2bxCZfzdKYNkum2kkJGubLkkw
 IPZNiikkvhottT9uf3+fVyJjMCxlCjxrZTcPXvVpJnu5dmvL+jJ66d+MEtqdkBN7L3Gu
 W3Ss8OX62Sj9LkVsjaswijI3py5ercV4VNswJ87VW5LT5gWL/LPs+84mZmwYBq3KRvvB
 3c5vWXGNUqBg5BiHefaN/sTGr5LTA0Kzym0SwiHWp7GfVMd3ewm8vfh1OYGtp3+u82Zl
 1rX22wmTQIEaYp9sI2GdFktaUkURItBDCzbYgCtSBbo9afylL2ezB3yGr+U/oFiHYis3
 dx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JPDf4eoDyKL1psbgQbjHSwKw7oBnRPJcA7RCYCoyfxY=;
 b=Od04TLwSk+LFoIjQaoM8lpIyV8diCia93dEDNVOJbnZvhGTJsAUlAWIa31kkvthaOc
 4NhaemqNUGZDj33gzaH2uwmPdolg2LNu0sqn3DuzO/e/8l3fk+GEXk62IIv+LeZYs/wt
 PTtijUY7dzjEK5oOLNk9Ha70b959kh+m2GA5dR8bm3x554u0ZSamr5spgwjYkIRcV/H3
 vprVmRQCzqjSPED9FQQjiMLOeaLMzFPE6Nya3zYrbS3cJ+XbrOR8V5419o5bilv9/f4M
 ALtOb6w6uefEi/cZvoyGqxTrIGSgK+piuakQK5Xk9dpcG6n5QVJ8pQ+vDNJqFCTBX1Q6
 3djQ==
X-Gm-Message-State: AOAM530E/ALPWRpNKxEM6DJsxxEaw6i6QQfr1LpgG/BzNfPb2Gl/Uxiu
 45vKmcsNfsLUGTkQrDiqrLFF7Q2tyyvN5SfpZIM=
X-Google-Smtp-Source: ABdhPJw883OpWJWqncDOhqRPfSYehelqmSD+ykSs2uqUKNfwxV0PlmDfvPvfi5mGKOfKdKRKj8sbQ5AxGF0IhEmfNVI=
X-Received: by 2002:a05:6902:532:: with SMTP id
 y18mr3577804ybs.122.1592456934393; 
 Wed, 17 Jun 2020 22:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <1592268641-7478-1-git-send-email-bmeng.cn@gmail.com>
 <1592268641-7478-3-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKNovTf3F+t9WFCWXvAgT_CRa5dbDuQExzbqxkM-z3ufqw@mail.gmail.com>
 <CAEUhbmVq8kVfZRQSF-LT_bDib9e1xBL-7zifmHpQgdvehcNzFA@mail.gmail.com>
In-Reply-To: <CAEUhbmVq8kVfZRQSF-LT_bDib9e1xBL-7zifmHpQgdvehcNzFA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 18 Jun 2020 13:08:43 +0800
Message-ID: <CAEUhbmU3ouNn=PfXLwZx_Pu49zmWY1ddsSqKONdh6X5atXcncg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] hw/riscv: sifive: Change SiFive E/U CPU reset
 vector to 0x1004
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 18 Jun 2020 05:08:58 -0000

Hi Alistair,

On Thu, Jun 18, 2020 at 8:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Thu, Jun 18, 2020 at 12:40 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Mon, Jun 15, 2020 at 5:51 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Per the SiFive manual, all E/U series CPU cores' reset vector is
> > > at 0x1004. Update our codes to match the hardware.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > This commit breaks my Oreboot test.
> >
> > Oreboot starts in flash and we run the command with the
> > `sifive_u,start-in-flash=true` machine.
>
> Could you please post an Oreboot binary for testing somewhere, or some
> instructions so that I can test this?
>

I have figured out where the issue is. The issue is inside the Oreboot
codes that its QEMU detecting logic should be updated to match this
change.

I've sent pull request to Oreboot to fix this:
https://github.com/oreboot/oreboot/pull/264

> >
> > I have removed this and the later patches from the RISC-V branch. I
> > want to send a PR today. After that I'll look into this.
>

I don't think we should drop this patch and later ones in this series.

Regards,
Bin

