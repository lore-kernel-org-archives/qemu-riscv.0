Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5j2u-0001JK-SF
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jan 2022 01:48:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5j2g-0001Dx-Sq; Fri, 07 Jan 2022 01:48:03 -0500
Received: from [2607:f8b0:4864:20::12d] (port=39631
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5j2e-0004o6-FO; Fri, 07 Jan 2022 01:48:02 -0500
Received: by mail-il1-x12d.google.com with SMTP id o1so3755161ilo.6;
 Thu, 06 Jan 2022 22:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VnNlJZYVenpeODCmJjVglP4+XGpD5fvApG4/3jOz1TU=;
 b=bGrvFptUX5K2wXsQKp0BkCGTllgEloqx18hMc7Eac2sRt6GJg9kPSJ7c9SS6MzmH2H
 Bq+uGQiWu8Txjf+DqJEMQ0//4XfzA2vXG9F2ngAoecNRIodF141o4KHVXispL8v1eKWT
 PE1oW3jOToZ0KV/ej3i0ei30qJ/1xlks7ItpbSAtHXtLR6XD86JUWzQz4ZYFJbJ6PbyS
 svl5Px6EV/jrhvppcMbEcrqfyTLK9wgI+qtMKXXzuv7h0001hR8rFtOgs+0IPnB4MD7z
 Ti0naKKe9YvBVduK7o8iB6/4Rol+eCX5t6/IecxiQCE7i084lHkjtoah7FNNGcld2b++
 7TWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VnNlJZYVenpeODCmJjVglP4+XGpD5fvApG4/3jOz1TU=;
 b=HfrPlCVFC0GKR2iUMFVv34+YMjir1EOBA+xloa24CCbJ5fKT8fiYFtt4tI5kY4fQj5
 3BD+pIEK5OlGoTqcxAv3MPQ2GDrJsK8UyzwuBdOoaD1Cdt5qQ8GVSADPDMuzwAIxkrwC
 ruKtpYpigNOkaM6NW4ac2Pfu3/C8x57D+15kpUIaGA8r8/nYz6nOgZaA+3gi6Ws8MwCX
 5k0BEpR01g76FTscZJRHXTqPe883HmiPZwVm63un2O2mvMuL24+J9+HAKcRbqeYT54YF
 AWhuR09VgyRAxIK09/wWnbGCCmkGoxKhuIOEWnBPLbuyd9qWGna3kDNpf7/OA4eh7VDF
 GHWQ==
X-Gm-Message-State: AOAM5311YIfwfmp2C+zhaM/qgHKHR8/YM+JyAL0VhlEknqXU+r9UfJFC
 CkSFPNY6Q5GlbjyeasEWZCjmtqdrg6nMcDX5T4c=
X-Google-Smtp-Source: ABdhPJwlC9RxCHSfMPJQioY7cMKuTsWm4R755f2MPU8dCBO1C5fHFMme+yUTZywnD51heB7aMz3RbrrA8qoN2yYrab0=
X-Received: by 2002:a05:6e02:194b:: with SMTP id
 x11mr5669514ilu.208.1641538072179; 
 Thu, 06 Jan 2022 22:47:52 -0800 (PST)
MIME-Version: 1.0
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20220106210108.138226-8-frederic.petrot@univ-grenoble-alpes.fr>
 <CAKmqyKMB-zZKNf-HRz-=RR+wtM7UHFo4wCJUiCwF0nJrH4OzOg@mail.gmail.com>
 <cb76d285-7071-c70d-3cb7-ad2978f400dd@univ-grenoble-alpes.fr>
In-Reply-To: <cb76d285-7071-c70d-3cb7-ad2978f400dd@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 7 Jan 2022 16:47:26 +1000
Message-ID: <CAKmqyKNd77rb9gSqriv_gykfBT_G+9hVKZVKp-JB2A3d9sXkrg@mail.gmail.com>
Subject: Re: [PATCH v8 07/18] target/riscv: setup everything for rv64 to
 support rv128 execution
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 07 Jan 2022 06:48:07 -0000

On Fri, Jan 7, 2022 at 4:23 PM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> On 06/01/2022 22:24, Alistair Francis wrote:
> > On Fri, Jan 7, 2022 at 7:04 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
> > <frederic.petrot@univ-grenoble-alpes.fr> wrote:
> >>
> >> This patch adds the support of the '-cpu rv128' option to
> >> qemu-system-riscv64 so that we can indicate that we want to run rv128
> >> executables.
> >> Still, there is no support for 128-bit insns at that stage so qemu fai=
ls
> >> miserably (as expected) if launched with this option.
> >>
> >> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-gr=
enoble-alpes.fr>
> >> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> >> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >> ---
> >>   include/disas/dis-asm.h |  1 +
> >>   target/riscv/cpu.h      |  1 +
> >>   disas/riscv.c           |  5 +++++
> >>   target/riscv/cpu.c      | 20 ++++++++++++++++++++
> >>   target/riscv/gdbstub.c  |  5 +++++
> >>   5 files changed, 32 insertions(+)
> >>
> >> diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
> >> index 08e1beec85..102a1e7f50 100644
> >> --- a/include/disas/dis-asm.h
> >> +++ b/include/disas/dis-asm.h
> >> @@ -459,6 +459,7 @@ int print_insn_nios2(bfd_vma, disassemble_info*);
> >>   int print_insn_xtensa           (bfd_vma, disassemble_info*);
> >>   int print_insn_riscv32          (bfd_vma, disassemble_info*);
> >>   int print_insn_riscv64          (bfd_vma, disassemble_info*);
> >> +int print_insn_riscv128         (bfd_vma, disassemble_info*);
> >>   int print_insn_rx(bfd_vma, disassemble_info *);
> >>   int print_insn_hexagon(bfd_vma, disassemble_info *);
> >>
> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> index fa5d238530..efe481f5fb 100644
> >> --- a/target/riscv/cpu.h
> >> +++ b/target/riscv/cpu.h
> >> @@ -38,6 +38,7 @@
> >>   #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
> >>   #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
> >>   #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
> >> +#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("rv128")
> >
> > As this series only adds partial support for 128-bit support, I think
> > we should probably change this to "x-rv128". That way we indicate to
> > users that it is experimental. That allows us more flexibility in the
> > future to have breaking changes and will hopefully avoid confusion
> > about the current state. What do you think? I can just make the change
> > when I apply the patches.
>
>    Sure, this is clearly experimental (the spec is a draft) and should be
>    marked so, I totally agree. Please make the change as you suggest,

Great!

Applied to riscv-to-apply.next

If you want to make sure my change didn't break anything you can test
the tree here: https://github.com/alistair23/qemu/tree/riscv-to-apply.next

I'll send a PR this weekend or next week.

Alistair

>
>    Thanks,
>    Fr=C3=A9d=C3=A9ric
>
> >
> > Alistair
>
> --
> +------------------------------------------------------------------------=
---+
> | Fr=C3=A9d=C3=A9ric P=C3=A9trot, Pr. Grenoble INP-Ensimag/TIMA,   Ensima=
g deputy director |
> | Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angus=
ta |
> | http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.=
fr |
> +------------------------------------------------------------------------=
---+

