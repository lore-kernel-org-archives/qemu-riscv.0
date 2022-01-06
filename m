Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5aFS-0005Ns-7x
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 16:24:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5aFO-0005MJ-DF; Thu, 06 Jan 2022 16:24:35 -0500
Received: from [2607:f8b0:4864:20::136] (port=43723
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5aFM-0000yB-Pv; Thu, 06 Jan 2022 16:24:34 -0500
Received: by mail-il1-x136.google.com with SMTP id d3so3079336ilr.10;
 Thu, 06 Jan 2022 13:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3ZZgx1lKmfGR5UTPfUfTNyFikZXD7nhlz4qKMhxLYms=;
 b=m13fEMSpbueSylh5H7jt1K3JnvfAxlx4L3Um96fQBhijUccwjD4EnNO0DYZaL5g4gj
 gd5lzOcCmloTcWB0JceV997A2WE95g7N86m8GeGjEAbnqXp6MCdlO0w8RazAa+6h37dR
 wViv74/Qky7guBdt8BPGobAZX1TEFsW1KFN+sForRw9up0kahaarvnUZ0UzoyFPivAQp
 apqcWWofSurpmbwY3XiV8sifLgZVvGVM2yggWL0BQ9A1khZ4U6uKEi8KRne2t8hoYVfp
 2dQdcqEhsiArRw/I0SLu0kuLLpQ2eIo28ldvMJn1MJnY21TSIh5WtUoL5ZrsCu69PMxk
 UM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3ZZgx1lKmfGR5UTPfUfTNyFikZXD7nhlz4qKMhxLYms=;
 b=yl4P3AXJhJQIn4kQ+Gof80/u1tPWcHSQzL6FrRkK9LqI64CC6ydOcyBCgETdV0SUgi
 eqU1AW+lzPT+2nWsthGFzuWjdMYIo9zueHuLiP0hvfKKNO56uq+F1BIKf24yYHNIGeO4
 Ms9tGDXajjj0PeIC3RQ6KEYICiKSeYCZOKov7QAk3cwzJwpiM5kgJU2/TAcDBiLff1x/
 Hlhfp29X3K8ulyXMmOGOvwQDdVTjoHAah4d6GDOnN6SyDzDRKUyb3VOJOfMbA9Sh+dcE
 23bK1Wsn8rl9igJ+F6h3m93uZ5bCoJXWFn1MY5pOGwFTAoh72Gikbi5+GIB3SrJqlghN
 21AQ==
X-Gm-Message-State: AOAM533HVd4lz2z79s9eCun9ZN0dRQNXu59b067dvcelGq6S9tev1C4b
 GmfO9cFlP33ootikK8vNIGN50A0G1cRZkHdCms8=
X-Google-Smtp-Source: ABdhPJxFNfpYAT2VmuyGYA2JbNrcKkEYxHnXSRgWehxa5g5y98YyAC6mzyzYxQAslJ8kn93Y/xuXUXM4f1qAeYfzaRE=
X-Received: by 2002:a05:6e02:1569:: with SMTP id
 k9mr27242941ilu.290.1641504271157; 
 Thu, 06 Jan 2022 13:24:31 -0800 (PST)
MIME-Version: 1.0
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20220106210108.138226-8-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20220106210108.138226-8-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 7 Jan 2022 07:24:05 +1000
Message-ID: <CAKmqyKMB-zZKNf-HRz-=RR+wtM7UHFo4wCJUiCwF0nJrH4OzOg@mail.gmail.com>
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Thu, 06 Jan 2022 21:24:37 -0000

On Fri, Jan 7, 2022 at 7:04 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> This patch adds the support of the '-cpu rv128' option to
> qemu-system-riscv64 so that we can indicate that we want to run rv128
> executables.
> Still, there is no support for 128-bit insns at that stage so qemu fails
> miserably (as expected) if launched with this option.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/disas/dis-asm.h |  1 +
>  target/riscv/cpu.h      |  1 +
>  disas/riscv.c           |  5 +++++
>  target/riscv/cpu.c      | 20 ++++++++++++++++++++
>  target/riscv/gdbstub.c  |  5 +++++
>  5 files changed, 32 insertions(+)
>
> diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
> index 08e1beec85..102a1e7f50 100644
> --- a/include/disas/dis-asm.h
> +++ b/include/disas/dis-asm.h
> @@ -459,6 +459,7 @@ int print_insn_nios2(bfd_vma, disassemble_info*);
>  int print_insn_xtensa           (bfd_vma, disassemble_info*);
>  int print_insn_riscv32          (bfd_vma, disassemble_info*);
>  int print_insn_riscv64          (bfd_vma, disassemble_info*);
> +int print_insn_riscv128         (bfd_vma, disassemble_info*);
>  int print_insn_rx(bfd_vma, disassemble_info *);
>  int print_insn_hexagon(bfd_vma, disassemble_info *);
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fa5d238530..efe481f5fb 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -38,6 +38,7 @@
>  #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
> +#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("rv128")

As this series only adds partial support for 128-bit support, I think
we should probably change this to "x-rv128". That way we indicate to
users that it is experimental. That allows us more flexibility in the
future to have breaking changes and will hopefully avoid confusion
about the current state. What do you think? I can just make the change
when I apply the patches.

Alistair

