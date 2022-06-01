Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwDgw-000790-Ug
	for mharc-qemu-riscv@gnu.org; Tue, 31 May 2022 22:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwDgv-00078n-Uy; Tue, 31 May 2022 22:02:34 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:46845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwDgm-0001LZ-Ec; Tue, 31 May 2022 22:02:33 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 r3-20020a9d5cc3000000b0060ae1789875so263611oti.13; 
 Tue, 31 May 2022 19:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7sGu/SjBf+7oFq5R95o35Ccbmj3wHecjeT5MF34LwcM=;
 b=QKlTm1PYUNfHk6t2B+GyyLOvus9hd73WIwybe9HMJAeqR/96apj9p9/FSMvwD4XSTU
 ZK5r6VgIaUwTXfkwGMWd/hIDkGwTHhw+aKge0S/vDuEEGLoyJ4W/ZSWR4gSp1qdUYLFc
 SHoDQ81q1njB/P1mm1znfuOPIHjwbHoNnPi2OFIvY/qS9uy1U/2ahVhnRrBY7dOEQOX1
 HlPrIdtOk+eHQ3QVWMaT2jmIxTmmPdY2c0QDztVZp2mnvTfTJvb6Hy3mOt+3Nw9kRiBV
 mlRnGxXFPr2ZRFkCxiUtFDNe2XAI+MbGdaxOgUyBs9CmbS9bL8hAn0J+1UTDKYr4MOuv
 fm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7sGu/SjBf+7oFq5R95o35Ccbmj3wHecjeT5MF34LwcM=;
 b=WMf+lOebfWhC4CUFOhKtWoWWCXGXmhabYKsHIxk4ipv+2GdZbCurIm//iROcCuzHkG
 D6hHQyn2igtuA2sMcw6ryul6LUzioz+RjHhs7M+SDh3IKC9xkSvSlzAtPqV9fTPVCfbq
 HrVct/koontyCTbXrOkiXZjwMGBcBqEsrc/YH3KEu2vnJFnlMPUe6wUzkN2iFPuX6/X7
 wxWKCB5xsl8cSNlAvVuBsNPR6lpwXAUOaBlZBNhyG0gFB99Ea3ejM1kFM3Rb+TSYqd46
 xeoOkxzP85VlGART9uxkkkD3bDP8RGB/mY6yMiErTgKJ+F7CyaqO+LZPVLyU4snU318h
 6CqA==
X-Gm-Message-State: AOAM532pFEEXd5p+uH0kakIjYxbMNvNbgsSbAU1FOQd2IBZYKqu7+doW
 xUIw4YtNLNZOuVR2m4Uo54MaOSvLHaVzCJs8NcE=
X-Google-Smtp-Source: ABdhPJwOnnKmQXIyykCR0VpuN/RUXmowZA9S6uj1aQOZBU0TZjzDeh5xQrv7Aa568a9enhW0+5Lw2+UP8RlIlIoSP/U=
X-Received: by 2002:a05:6830:18dc:b0:60a:e7a3:dbe7 with SMTP id
 v28-20020a05683018dc00b0060ae7a3dbe7mr22553688ote.186.1654048942652; Tue, 31
 May 2022 19:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKMKxb81ZSpz-ncGc3fpt8f06EcEcXvtHjEpWLABXGT+uQ@mail.gmail.com>
 <YnTZP1iG+77Cugaq@redhat.com>
 <CAFEAcA_MncAJWUqG3yRVGMT0mXKvnBUqJLdoHwMdd=OW8fnodQ@mail.gmail.com>
 <CAHBxVyH=7hX5mjWcUBODk_tNHoczefdkfS8dFcf6is=vpz=SZw@mail.gmail.com>
 <CAKmqyKPK_F7Z4-tM9k8+3yXDdSTSFagieH23vqoW+TciXpnYqA@mail.gmail.com>
 <YoNiPw/3e+CY0v7o@redhat.com>
 <CAKmqyKOC0Fgu7WUXRcAJZNmVR8GeiXHGh4K8fg+5_c+pvZR_7w@mail.gmail.com>
 <CAOnJCU+i3m5OjM-wBf+t58YP9k5Jd0VeBK_yoPSPtzoE68H2EQ@mail.gmail.com>
 <CAKmqyKO5sUspA5d57r62phQ7qpBs7A0S_3XdF+sLmUV5kKwZMg@mail.gmail.com>
 <CAOnJCU+Pos0fTWj7C7rhVEa1QV7YsJa4MyO57CFMGFfs_hHR5A@mail.gmail.com>
 <CABJz62NR=6+k0AxZ4V35hXH=bUamZR4=f4wgDqcG8zm0e+KmHg@mail.gmail.com>
In-Reply-To: <CABJz62NR=6+k0AxZ4V35hXH=bUamZR4=f4wgDqcG8zm0e+KmHg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Jun 2022 12:01:56 +1000
Message-ID: <CAKmqyKMEFryRVCEhMniYA0RH46CMmpowK8s_QJ72YcP2J+mJ7w@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: Andrea Bolognani <abologna@redhat.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 01 Jun 2022 02:02:34 -0000

On Wed, May 25, 2022 at 1:56 AM Andrea Bolognani <abologna@redhat.com> wrote:
>
> On Mon, May 23, 2022 at 08:16:40PM -0700, Atish Patra wrote:
> > On Sun, May 22, 2022 at 10:59 PM Alistair Francis <alistair23@gmail.com> wrote:
> > > On Wed, May 18, 2022 at 4:38 PM Atish Patra <atishp@atishpatra.org> wrote:
> > > > 1. virt machine is not well documented and already bloated. There is
> > > > no specification for virt machine as such.
> > > > Putting restrictions after a certain release will lead to confusion.
> > > > 2. Do we support existing MMIO devices after that specific version or not ?
> > >
> > > Yeah, so I guess this doesn't achieve the same outcome you want. I
> > > would say we would still include some MMIO devices, like UART for
> > > example.
> >
> > Why ? We can just rely on the pcie based uart (virtio-serial-pci or
> > serial-pci) should be enough.
> > The only MMIO devices that should be allowed are the ones that can't
> > be behind pcie.
>
> IIRC virtio-serial is initialized too late to catch messages produced
> very early by the firmware (and possibly the kernel), which means
> it's okay for regular usage but not when trying to debug an entire
> class of boot issues.

Agreed. OpenSBI doesn't even support PCIe so we need an MMIO UART for
OpenSBI to be able to print messages

Alistair

>
> Either way, it looks like you wouldn't be able to completely get rid
> of MMIO even if you introduced a new virt-pcie machine type. That's
> the same for the aarch64 virt machine. I agree with Dan that we
> should follow the example set by that architecture - it has worked
> out pretty well.
>
> If there is a desire to reduce the complexity of the "standard"
> machine type, can we just take the current virt machine type and
> rename it to something else? And have your simpler code take over the
> virt name? Sure, it will cause some pain in the short term, but the
> RISC-V ecosystem is still young enough for it to not be a deal
> breaker.
>
> --
> Andrea Bolognani / Red Hat / Virtualization
>

