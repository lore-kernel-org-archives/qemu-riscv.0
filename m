Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHsHV-0004s9-6f
	for mharc-qemu-riscv@gnu.org; Tue, 08 Oct 2019 12:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iHsHS-0004qH-UN
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 12:24:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iHsHR-0003V1-Vp
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 12:24:10 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:36712)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iHsHP-0003S0-5y; Tue, 08 Oct 2019 12:24:07 -0400
Received: by mail-lj1-x242.google.com with SMTP id v24so18243474ljj.3;
 Tue, 08 Oct 2019 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TS63qtniJlLjmdMayfkLdB0sWsBhuGoPrXEKjKUTmrI=;
 b=uMgJuXviXGPSJC2Q9InoS9sqv3pmojc/U4ywRHhrFAaa6O16L+TeP518nXZIxXCmB4
 3PUNoJEZfjeyy2DgWPwTeeOHZVbNM10+F4waxgY3iak5IVzoOKRBjJbqHT5Hd4eeMjUO
 5UQKYdrJ801z2OdIvUEoFXSFXxmfVRlmBeEDbOQYho2Kgbc1xTUIu7+DEHhwM3gDofAV
 /6HCcN4TJcxrqwlvu8/48Km81skhhB2V207Q46/jBCvE9+pxauPJE3y5L8Gtn4fTmwIf
 6n/q9yrj7VTrA6+XoBf1AND91V8kaIcpxCE2S8XTKw+UG1s8bBU9vFGXPVyItlIn853B
 jRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TS63qtniJlLjmdMayfkLdB0sWsBhuGoPrXEKjKUTmrI=;
 b=FwHA49owQUypsWm+GG++gGv7Ya/0syhE2fMsGVJBo0fqZEFg8u7JeL8xMoGlLi7Kko
 6mGAob8TmtwKNHFZ2UEIkhubMf0MrWExy/aHkEZWTN4PcFEoBKifXULFymo7AkwzvDv8
 tjYN9Y5MXI+yK4kyz6j1ssX8FDHHZQZPGlhPexnNpt6LQilUNr3m+m/ZRpd/gC25b+w6
 qPgCHvWfw7Sid/oR+bS7hHhuPrxhHHzo4RN9FZ0B+7iAain+xnKQGWgPJg57XLq6a9lg
 GFtqiaJWOmWZhvzQNpEBscgi6URaTjtM85QLO/PK1dqHykQmBNMl1Wj72LCzTCiKmK42
 H+zw==
X-Gm-Message-State: APjAAAX5Y1fJx0lb6SsdpgzrSFIUHcoGJFjl66qgDOvpL5EZ3oZ+aqWJ
 xpsTsV+z+cui7eaeUPFig2uYBvu5GVBbuz2d/x8=
X-Google-Smtp-Source: APXvYqy+VjFyynPGLhBxONs6ljGZRfzpF0+YH2eyuX2pqtQx3SfitHBNFIUoK9BeIwNSmywhxCdxOE0TIHnIBsC1F9o=
X-Received: by 2002:a2e:9a04:: with SMTP id o4mr23259170lji.101.1570551845772; 
 Tue, 08 Oct 2019 09:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191008001318.219367-1-jonathan@fintelia.io>
 <20191008001318.219367-2-jonathan@fintelia.io>
In-Reply-To: <20191008001318.219367-2-jonathan@fintelia.io>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Oct 2019 09:18:59 -0700
Message-ID: <CAKmqyKNXhFdY7JX_+weNFeTZiw-gmKEH8kKEXvJUpwh9D_gFSw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] target/riscv: Tell gdbstub the correct number of
 CSRs
To: Jonathan Behrens <jonathan@fintelia.io>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
X-List-Received-Date: Tue, 08 Oct 2019 16:24:12 -0000

On Mon, Oct 7, 2019 at 5:16 PM Jonathan Behrens <jonathan@fintelia.io> wrote:
>
> If the number of registers reported to the gdbstub code does not match the
> number in the associated XML file, then the register numbers used by the stub
> may get out of sync with a remote GDB instance.
>
> Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/gdbstub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index ded140e8d8..cb5bfd3d50 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -384,7 +384,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>      }
>
>      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
> -                             4096, "riscv-32bit-csr.xml", 0);
> +                             240, "riscv-32bit-csr.xml", 0);
>  #elif defined(TARGET_RISCV64)
>      if (env->misa & RVF) {
>          gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
> @@ -392,6 +392,6 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>      }
>
>      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
> -                             4096, "riscv-64bit-csr.xml", 0);
> +                             240, "riscv-64bit-csr.xml", 0);
>  #endif
>  }
> --
> 2.23.0
>

