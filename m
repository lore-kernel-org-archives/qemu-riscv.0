Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrcix-00014d-IS
	for mharc-qemu-riscv@gnu.org; Fri, 11 Jun 2021 04:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrciv-00014P-3N; Fri, 11 Jun 2021 04:41:05 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:34626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrcir-0003Cy-Pw; Fri, 11 Jun 2021 04:41:04 -0400
Received: by mail-il1-x12b.google.com with SMTP id w14so4410442ilv.1;
 Fri, 11 Jun 2021 01:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZIeh/cyJvV+KzG9lGeI8mCDQQqpCo2jMg6+vhmVg77g=;
 b=decKPEkJV151C4gyyXnaMRuvA/0+rDjF52vZj16I4bRbxO6Apj9ffC/nKVHjML0UiD
 Ldqx8FRXbvM4wIwImM+Z40oNJ5KKUjfe2m/hNbogoE+4hZ/Z6NnQNiYeltpuayVSzJPY
 f8fKOEhGDCC1iTlp0ZBBtxtRERm+JkkpejUfxHF99SnjfGRFerxCm/Gu7zWxjT9t1uGs
 BddHFHea5CM1PpIdUAgDEpuSfgQ+mJ3M8CfYJsKW6g/tO8+/fuXc0s74wSpH8gZHdgaf
 /BHEw5E+okI4bHfdGwOhuMEYRH9eKS4/HD54aT48EnuZ6q4bxWktV9TwwRpuTbfEz7k9
 5Nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZIeh/cyJvV+KzG9lGeI8mCDQQqpCo2jMg6+vhmVg77g=;
 b=UUnLMsCkdBQoPTxgVVpc1TXn5iWmX441blngDdq0jJxMZEjkKbVg0ncX+j+a+FlMBw
 8eJwhaJ0ZFit2I/Aj8jLhXOBDI2RYDg+C0jdNYg6o3yWBHdPHfZX6mIyxFsT+fJ7MSBh
 oGOlIjKcBeZOTCfpkxjVA0cWFWcighCkceGhFRYkFr3WzRBBvR2FBKGhsvaoNMgg6vn1
 raMrnfEdH7k80S/jFiQeCFt+LhE/m0DbxmkYUCRwyNITWVGUQplvdA+x7Qyeo+SFzZ1c
 my0EGilLkODC1LtH9y01RWTrroL/1L3DgNxtSDkHJwRhnVroLQJXn2fbQyOvhPD2HT9K
 npeQ==
X-Gm-Message-State: AOAM532lCYdVcE5S3fTUjMsDx/vMuJHxNxnZHuF9XtH1bNkjAbL+Z3LY
 /8vgOMJNl7Cawf2TryDW5udP2PcM66KFRI0U8Vk=
X-Google-Smtp-Source: ABdhPJwPlP7T/+kCwt0k/rGu7ekdTMPDdwRuaGIUWSdqS7PXfS6U5UME/tsi93jOXqGvHVqXZrH3Cu50cmWoivrAyPs=
X-Received: by 2002:a05:6e02:1447:: with SMTP id
 p7mr2337502ilo.131.1623400860005; 
 Fri, 11 Jun 2021 01:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210514143242.377645-1-anup.patel@wdc.com>
 <CAAhSdy3KmvjR8hnMz2UXomA45FcEV9fmiCXRBFGMRQus5=c6Lg@mail.gmail.com>
In-Reply-To: <CAAhSdy3KmvjR8hnMz2UXomA45FcEV9fmiCXRBFGMRQus5=c6Lg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Jun 2021 18:40:33 +1000
Message-ID: <CAKmqyKOHbVvM5haU-hVAUg_wB_h=Ap2rZzvutNyF7JMUvB80pw@mail.gmail.com>
Subject: Re: [PATCH 0/4] AIA local interrupt CSR support
To: Anup Patel <anup@brainfault.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup.patel@wdc.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Fri, 11 Jun 2021 08:41:05 -0000

On Fri, Jun 11, 2021 at 4:48 PM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Alistair,
>
> On Fri, May 14, 2021 at 8:03 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The advanced interrupt architecture (AIA) extends the per-HART local
> > interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
> > and Advanced PLIC (wired interrupt controller).
> >
> > The latest AIA draft specification can be found here:
> > http://jhauser.us/private/RISCV-AIA/riscv-interrupts-021.pdf
> >
> > This series adds initial AIA support in QEMU which includes emulating all
> > AIA local CSR. To enable AIA in QEMU, we just need to pass "x-aia=true"
> > paramenter in "-cpu" QEMU command-line.
> >
> > To test series, we require OpenSBI and Linux with AIA support which
> > can be found in riscv_aia_v1 branch at:
> > https://github.com/avpatel/opensbi.git
> > https://github.com/avpatel/linux.git
> >
> > Anup Patel (4):
> >   target/riscv: Add defines for AIA local interrupt CSRs
> >   target/riscv: Add CPU feature for AIA CSRs
> >   target/riscv: Implement AIA local interrupt CSRs
> >   hw/riscv: virt: Use AIA INTC compatible string when available
>
> The ACLINT specification will be frozen soon (probably early next
> month). The ACLINT QEMU support patches are also ready and don't
> depend on the AIA QEMU support patches.
>
> Is it okay to target ACLINT support in QEMU first ?

Yeah, go for it.

Alistair

>
> I can rebase this series on ACLINT support patches and also include
> more AIA emulation patches (APLIC and IMSIC) in the AIA series.
>
> Regards,
> Anup
>
> >
> >  hw/riscv/virt.c           |   11 +-
> >  target/riscv/cpu.c        |   32 +-
> >  target/riscv/cpu.h        |   56 +-
> >  target/riscv/cpu_bits.h   |  128 +++++
> >  target/riscv/cpu_helper.c |  245 ++++++++-
> >  target/riscv/csr.c        | 1059 +++++++++++++++++++++++++++++++++++--
> >  target/riscv/machine.c    |   26 +-
> >  7 files changed, 1454 insertions(+), 103 deletions(-)
> >
> > --
> > 2.25.1
> >
>

