Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAUqd-0006jT-6I
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 05:39:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nAUqV-0006gz-6e
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 05:39:11 -0500
Received: from [2a00:1450:4864:20::334] (port=54105
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nAUqP-00081R-Qt
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 05:39:10 -0500
Received: by mail-wm1-x334.google.com with SMTP id n8so11074684wmk.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Jan 2022 02:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AEv4HLuO/whRkERcANbmPG5mjRMVaEol4VdJI9uSkCw=;
 b=8BMiUNrD2ptZpHYlLh/mQFMoq5mazEOgYeO73PnHkEF+l6Gta2N9JMAEoBtQshmhV2
 c14yx81BqeINGr/l7SJEccnES52Gon6tRdFdYS0XhEct+s44iEu4t2h1/aJmysZVkzla
 Wi52J2B/uGtyo269WFhZYkX3SuQQx3fxEbneU8vU6HQqPIB/755GvZZ1M/zXeeY3mYlY
 i5x8uhVc0heTmtGKnngOB+zHAR4kjwqFm1Rzgm37NIqxYdIa416aUWMQfe6uSYD4cl2w
 AMQHVrX5Pvt+zigiktf366dCl7bYZj7Z2oKWktkGkcuad9oo9jzpcUJtGr8HL1/IB7pk
 dP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AEv4HLuO/whRkERcANbmPG5mjRMVaEol4VdJI9uSkCw=;
 b=e5CnQXQNbvIOSS5aJ50IMjxyRNOTjB0t1Svc45yw/tsLfKAdt2nxVAkTxwS7IqlmNS
 SKGHir2XqtZYMleZvDuz5I/xWCVJxcsyB5OFUhUR7p9SVPYKAuWyko8Yv6D9+2qgHnQG
 d9x9wiLO9RcqKzckusZsCjYPa9gLxbad9wQxszKMnb5RNs2C0QFbLoI1A7D6Mia8Yyma
 DUc4Vw91rMQJqsoNafBhpZDIgiCr5l6DdndWSKCbQPiozIjhIMN2Y/g7IRTtmQYnXfUS
 AsyKjFbtdwz4ecZ1uMbT1eC6tInixZfoMuiimrofDm00QfZWkUajFxpiFA2Rnpu6z/Zv
 FfFg==
X-Gm-Message-State: AOAM530kYYsZqCbb0sKZqPKSvC9vJfMGK4kP3LQjRuCwlIDqWBltGDLx
 AAB17rrzn2BrGts9MfNJx8e23t5M/WYY8qzuyEKXNg==
X-Google-Smtp-Source: ABdhPJwokJ1A9Hk2+jM545Gi6N9vScWnCbKq5dHS6DnKnoqpLsisLj1o8dpWUMLF3lMTwMC5Fx5wE77lYQDZKNGC/dY=
X-Received: by 2002:a5d:64c1:: with SMTP id f1mr22524534wri.214.1642675143859; 
 Thu, 20 Jan 2022 02:39:03 -0800 (PST)
MIME-Version: 1.0
References: <20220118111736.454150-1-apatel@ventanamicro.com>
 <20220118111736.454150-4-apatel@ventanamicro.com>
 <CAEUhbmX-juU-a0D4sgnxR=Z+uRU=tBt2bNYAOjmfoW_7DD9JKA@mail.gmail.com>
In-Reply-To: <CAEUhbmX-juU-a0D4sgnxR=Z+uRU=tBt2bNYAOjmfoW_7DD9JKA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 20 Jan 2022 16:08:50 +0530
Message-ID: <CAAhSdy3+eiHwRx3ExNkb3To9OCF=2jenUFPSXp7cHxrOPhdA2Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] roms/opensbi: Remove ELF images
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::334;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jan 2022 10:39:14 -0000

On Wed, Jan 19, 2022 at 12:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Jan 18, 2022 at 7:18 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > Now that all RISC-V machines can use OpenSBI BIN images, we remove
> > OpenSBI ELF images and also exclude these images from BIOS build.
> >
> > Signed-off-by: Anup Patel <anup@brainfault.org>
> > ---
> >  pc-bios/meson.build                            |   2 --
> >  pc-bios/opensbi-riscv32-generic-fw_dynamic.elf | Bin 838904 -> 0 bytes
> >  pc-bios/opensbi-riscv64-generic-fw_dynamic.elf | Bin 934696 -> 0 bytes
> >  roms/Makefile                                  |   2 --
> >  4 files changed, 4 deletions(-)
> >  delete mode 100644 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
> >  delete mode 100644 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
> >
>
> .gitlab-ci.d/opensbi.yml should also be updated to remove .elf build

Okay, I will update this file in the next revision.

Thanks,
Anup

>
> Otherwise,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

