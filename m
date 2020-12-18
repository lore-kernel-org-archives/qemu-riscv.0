Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kqAH1-0004SD-Ao
	for mharc-qemu-riscv@gnu.org; Fri, 18 Dec 2020 02:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kqAH0-0004S3-Bp; Fri, 18 Dec 2020 02:33:58 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:39308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kqAGy-0007Ce-FH; Fri, 18 Dec 2020 02:33:58 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id 82so1118287yby.6;
 Thu, 17 Dec 2020 23:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cdpicnLxdrM4kah6km0rCctlwPfq+AqrtWayrQBBcFI=;
 b=SGeLlCpztyvqp/xsKKcYOvbqMTE2bStlcuGBPWUiS8VlhhOZZSFKi//84vKEU0S+M9
 /KyTYaS1ijTRbYZ4NzEr434XauokzQGLzSi0cWRajEDItMDut+gFAxpFBOJ45Om2wd3s
 abW8Qxf+innMbIoFyR1QVTVwZ9ahruSw8vysSnIhnLyp2EBSS5fK29cslekTLqyFKpLj
 5mYw63LwjL8D6hUfkQW0uLS6ejEULutZWPHfHSoMkwDAxffx7uVymoW62e1X5wlkTS2O
 Rzw9WAqgtSU5K7KD9oGQs31Fhfh7GLjYwBICLrzoMoNkdEkeDRkcFpTkT9dSxQv0C67B
 rBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cdpicnLxdrM4kah6km0rCctlwPfq+AqrtWayrQBBcFI=;
 b=miX36jmt7ErffNEp+I663Pe2aglTPXEhJtZcA7qB2gKV1x8jWwzjF7HMyae8O6XMJD
 rtTzTC/MIHKIZf+L770s3DQt5/xKGCewvMWv0TVLe19NU3sV2ERWzuvB+KJycs3ReKZL
 pAazW5is58C56HkTIeHV+3R6tMmfZqeh+FG5UqQQzvPjPbQrR5eoCQNyxCqrQeIcYwOR
 PR/G/HGToqAhySWZFibmuoLp7dwjbUxTjdiLR1ByF4sua7NhevzYurneA2JG4FbtkZFc
 hcVeXQTAWbP+M5Bstt7PxrhZaAD0ARaD6zLlsOXbMYaJXS0nk9y0xdN/sbimywLKcRVL
 CK5Q==
X-Gm-Message-State: AOAM531iPcySDxLxE9kz82DgHe2AVjvDoC7rPnDUy+dOYjM6Bemt1SAK
 gvU05BqMb0gN+GhdLblyqkhBSDISn+RqU3stFLw=
X-Google-Smtp-Source: ABdhPJy79hl6+eeMq7GHukbqBX1hmrSCSUMk5SSPpB2VJJPZU8JMzZjgHYjBBkY/reGE+eq3NPbMwbdWnQGhMBrGpJM=
X-Received: by 2002:a25:4d7:: with SMTP id 206mr4591904ybe.306.1608276834978; 
 Thu, 17 Dec 2020 23:33:54 -0800 (PST)
MIME-Version: 1.0
References: <20201217214826.2094617-1-atish.patra@wdc.com>
 <CAEUhbmUqJdpuqvZ6V3s9eeW=EUVXrnjbF5GRmygwaZhMGG-6sA@mail.gmail.com>
 <4f09804c0e35a45fcf3fa78b3f3ed55276d6e10f.camel@wdc.com>
In-Reply-To: <4f09804c0e35a45fcf3fa78b3f3ed55276d6e10f.camel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 18 Dec 2020 15:33:43 +0800
Message-ID: <CAEUhbmX16h5S5Y0kFsnDv6t2cnn6we-b-9U_cbnEQkrrckYy0w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
To: Atish Patra <Atish.Patra@wdc.com>
Cc: Anup Patel <Anup.Patel@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>
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
X-List-Received-Date: Fri, 18 Dec 2020 07:33:58 -0000

Hi Atish,

On Fri, Dec 18, 2020 at 3:27 PM Atish Patra <Atish.Patra@wdc.com> wrote:
>
> On Fri, 2020-12-18 at 15:21 +0800, Bin Meng wrote:
> > Hi Atish,
> >
> > On Fri, Dec 18, 2020 at 5:48 AM Atish Patra <atish.patra@wdc.com>
> > wrote:
> > >
> > > Currently, we place the DTB at 2MB from 4GB or end of DRAM which
> > > ever is
> > > lesser. However, Linux kernel can address only 1GB of memory for
> > > RV32.
> > > Thus, it can not map anything beyond 3GB (assuming 2GB is the
> > > starting address).
> > > As a result, it can not process DT and panic if opensbi dynamic
> > > firmware
> > > is used.
> > >
> > > Fix this by placing the DTB at 2MB from 3GB or end of DRAM
> > > whichever is lower.
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > ---
> > >  hw/riscv/boot.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> >
> > With this patch, 32-bit sifive_u still does not boot kernel with the
> > following patch applied on 5.10:
> > https://patchwork.kernel.org/project/linux-riscv/patch/20201217074855.1948743-1-atish.patra@wdc.com/
> >
> > Command I used:
> > $ qemu-system-riscv32 -nographic -M sifive_u -m 1G -smp 5 -kernel
> > arch/riscv/boot/Image
> >
> > 32-bit virt cannot boot the same kernel image with memory set to 2G
> > either:
> > $ qemu-system-riscv32 -nographic -M virt -m 2G -smp 4 -kernel
> > arch/riscv/boot/Image
> >
>
> Hi Bin,
> As mentioned in the email on the linux mailing list, this patch only
> solves 2GB problem. sifive_u problem is solved by Alistair's patch[1].
>
> He is planning to send the PR soon. The issue with sifive_u boot was it
> was failing the 32 bit test earlier resulting a 2MB aligned address
> instead of 4MB.

Ah, I see. However my testing shows that virt with 2G still does not
boot with this patch.

>
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg767886.html
>

Regards,
Bin

