Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kX5bC-00085I-Sz
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 12:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kX5bB-00083W-9I; Mon, 26 Oct 2020 12:43:57 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:46542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kX5b9-0003W5-Jg; Mon, 26 Oct 2020 12:43:56 -0400
Received: by mail-il1-x141.google.com with SMTP id a20so8896756ilk.13;
 Mon, 26 Oct 2020 09:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ap6M6fFnNHK3z8gDCOEj1os5xkDRJ+O2o46EJxSq3eQ=;
 b=DHde+q97yQLDu3SjbG1z5iNhTymol7PMzm6NkEfwO/oJt+UNa2w9HXGhMDrQdaPdzi
 7U54Lgq1zavrLdEdHHvwTjKPud8f53xm5HdkmpSAuFI3Ch4/okGYNtR6auNchYZ3EYFo
 KO9EXRG7uBwP9bUXVFDeiSlHCoHnz1+NYyLAGUKlgVjKwOMFHdE6k3PlmpkoGTO93A/W
 kK1kTuYvYkC6LI/wFVO4Qz24oiAezcVLc1H0H/7ywvcqZXKcxbvdVS2bUIvIh/eC6gqq
 UwoO76QvY7fTrVOsdQMaAyWulu0YCikddE4kex9geVeA5uqO4CPK2Setb33Fr2D9GjqJ
 MqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ap6M6fFnNHK3z8gDCOEj1os5xkDRJ+O2o46EJxSq3eQ=;
 b=toRgIClzSJnjlTfSeHTTHht9XFYQC3aqSNzYotjCgSog9qHm1wAzxbQDPUNIKdZ8/J
 Iy3jj+pgupkt0E8AVsScvu6hsciNJGVyoH4VpH0cx3hcFMgHPvdLJ8eWYdV3V7VbpjWF
 zGwg0vs7NeZmgl7wdpPuUl0acLfKM/5LHFezMx8GRgeLW6iBug2gvsOPidVc2GhGpOEe
 RP5r4zqGt7lJ45hpgIO4SS77eqJ/SGgw2bhavOf3HFSm2BEstli9Gj608VtxrYS8KTsF
 dqRGKaXMX/90ar2I7Zwm7As90kYGvZ3KThEAtMxPg1PFZGsui1N1jDUcWWu9djeZVMj5
 Rz+Q==
X-Gm-Message-State: AOAM530DrooRUYSoxu7bs7SFbrA/hoT2RM6rSLRFMC7rLIgtlti1Tgut
 fBWyMp+5xokdZORdXcDG/LiDxmvozc/rgCpfNbg=
X-Google-Smtp-Source: ABdhPJy0mrhpDPS3NqeRowCvL77UPQ59CWuE1x4+YHuOkyHwoaUwwGgRhSs6BkUvqHGfM8BYQqloBI7JRezNm+UNU+w=
X-Received: by 2002:a92:c0cc:: with SMTP id t12mr6843782ilf.227.1603730633910; 
 Mon, 26 Oct 2020 09:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603467169.git.alistair.francis@wdc.com>
 <CAEUhbmUYkst2AL6cfiffJSr1T23VJyJsaqFBZe+UzDHreCqNpQ@mail.gmail.com>
In-Reply-To: <CAEUhbmUYkst2AL6cfiffJSr1T23VJyJsaqFBZe+UzDHreCqNpQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Oct 2020 09:32:05 -0700
Message-ID: <CAKmqyKOqifXUtTKrVeey20Rnd+jYCxxm1=j=j-Otw+22Vd0SfQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/16] RISC-V: Start to remove xlen preprocess
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 26 Oct 2020 16:43:57 -0000

On Mon, Oct 26, 2020 at 1:55 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Fri, Oct 23, 2020 at 11:44 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > The RISC-V QEMU port currently has lot of preprocessor directives that
> > check if we are targetting a 32-bit or 64-bit CPU. This means that the
> > 64-bit RISC-V target can not run 32-bit CPUs. This is different to most
> > other QEMU architectures and doesn't allow us to mix xlens (such as when
> > running Hypervisors with different xlen guests).
> >
> > This series is a step toward removing some of those to allow us to use
> > 32-bit CPUs on 64-bit RISC-V targets.
> >
> > Alistair Francis (16):
> >   target/riscv: Add a TYPE_RISCV_CPU_BASE CPU
> >   riscv: spike: Remove target macro conditionals
> >   riscv: virt: Remove target macro conditionals
> >   hw/riscv: boot: Remove compile time XLEN checks
> >   hw/riscv: virt: Remove compile time XLEN checks
> >   hw/riscv: spike: Remove compile time XLEN checks
> >   hw/riscv: sifive_u: Remove compile time XLEN checks
> >   target/riscv: fpu_helper: Match function defs in HELPER macros
> >   target/riscv: Add a riscv_cpu_is_32bit() helper function
> >   target/riscv: Specify the XLEN for CPUs
> >   target/riscv: cpu: Remove compile time XLEN checks
> >   target/riscv: cpu_helper: Remove compile time XLEN checks
> >   target/riscv: csr: Remove compile time XLEN checks
> >   target/riscv: cpu: Set XLEN independently from target
> >   target/riscv: Convert the get/set_field() to support 64-bit values
> >   target/riscv: Consolidate *statush registers
> >
> >  include/hw/riscv/boot.h   |   8 +-
> >  include/hw/riscv/spike.h  |   6 --
> >  include/hw/riscv/virt.h   |   6 --
> >  target/riscv/cpu.h        |  36 ++++---
> >  target/riscv/cpu_bits.h   |  24 ++---
> >  hw/riscv/boot.c           |  55 ++++++-----
> >  hw/riscv/sifive_u.c       |  59 ++++++------
> >  hw/riscv/spike.c          |  50 +++++-----
> >  hw/riscv/virt.c           |  36 +++----
> >  target/riscv/cpu.c        |  83 ++++++++++------
> >  target/riscv/cpu_helper.c |  47 +++------
> >  target/riscv/csr.c        | 197 ++++++++++++++++++++------------------
> >  target/riscv/fpu_helper.c |  16 ++--
> >  target/riscv/op_helper.c  |  11 +--
> >  14 files changed, 328 insertions(+), 306 deletions(-)
>
> Test result:
>
> 64-bit virt & sifive_u, boots OpenSBI and kernel.
> 32-bit virt boots OpenSBI and kernel. 32-bit sifive_u does not boot OpenSBI.

Thanks, I have fixed the failure and added this to my automated test cases.

Alistair

>
> Regards,
> Bin

