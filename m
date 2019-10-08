Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHmBp-0005ZR-48
	for mharc-qemu-riscv@gnu.org; Tue, 08 Oct 2019 05:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39135)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iHmBm-0005Wj-Kk
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 05:53:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iHmBl-0003YR-Fa
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 05:53:54 -0400
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:43281)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iHmBj-0003WK-17; Tue, 08 Oct 2019 05:53:51 -0400
Received: by mail-yw1-xc44.google.com with SMTP id q7so6204792ywe.10;
 Tue, 08 Oct 2019 02:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ORxxJ0M/325MeidPci2KxTjX/RdOiKnspbSwICjoPE=;
 b=Erx7bG7q3DXAUGzy4Lzntrwt/MSYl2IfHoa5yYHl6W3QaJxYUbSmCAAyYk1r5/FXxF
 3eBJ8xggvpYVUEC/NnHpSnkvAKrxp3LAjQVJ8f3CPzS0bVT1qz9u4ZCHhgXeNUTedx/r
 Vm9hcT2H/b+Ea0YXQWYGljW3IKmeE16zhLRsdXhRvJO3HMYfXhzyELay1A/iZw+sP++E
 TgA27dfFKZgvXHPOkjNQ22SUnm6aCnXzimJhDfJzv7hWx76GEnynKm/kYp5kZX1CIF1I
 LO9pg/WlcXRncef2lvF6/hyJqQ22T1UQ5WiY+fctL3tMkp4zxCz1evh2iM4mfU1DUWAI
 AoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ORxxJ0M/325MeidPci2KxTjX/RdOiKnspbSwICjoPE=;
 b=oYw7yp7ZRCMBJTQOgymAMK6WQSU80a/3BO5JhnEKBrEx4FMDXJgVss8BZO/QrlUVSf
 AajMZiotixLlro+1LoFyn9FCFyYvWZUEmxVMaW6nFcf/gaMcIimXjiN5AYzd5CKO8PYw
 K5VAPpTKgz8wUQOZls5BvqOsjzFFDcTNREvmQEJ4Sp2hLdY2gTbL425xtK8I+qMj3l5T
 WeTCOrmUR3tWgw9vxkao8+LGKMJSw7a7OgxO/ViNEqq2sLg/OMKnGLa/AwTcq/gfRn06
 WCIoaCFVfkYxKcMrFkP2LlPqMOMOei7h7I1ZqxAHFJNZx2RUQAg1fYjBHsfcDelbDYna
 t19Q==
X-Gm-Message-State: APjAAAWJljLhxctIWoRVewLWHpRgd01VPeSsQAjgQR5UdP6M9ZaDKaoQ
 XgaH2J60xXZrOQq3wDcJ4Ncj6ZaNSJmfzoIQtPc=
X-Google-Smtp-Source: APXvYqzRCeqk7xeShWLGS3gYOcId3u+BTyOYQM/m050BwLplvORe2oJEVsYnVs9v9cauVZ6bwLrnVzM1Plm4eBCP4/g=
X-Received: by 2002:a81:2f12:: with SMTP id v18mr13947029ywv.137.1570528430487; 
 Tue, 08 Oct 2019 02:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191008001318.219367-1-jonathan@fintelia.io>
 <20191008001318.219367-2-jonathan@fintelia.io>
In-Reply-To: <20191008001318.219367-2-jonathan@fintelia.io>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 8 Oct 2019 17:53:37 +0800
Message-ID: <CAEUhbmXHdj=-28inH5-ToS4tOAYOva1Lc1QCz6RGijkMrWhFdg@mail.gmail.com>
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
X-Received-From: 2607:f8b0:4864:20::c44
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
X-List-Received-Date: Tue, 08 Oct 2019 09:53:55 -0000

On Tue, Oct 8, 2019 at 8:15 AM Jonathan Behrens <jonathan@fintelia.io> wrote:
>
> If the number of registers reported to the gdbstub code does not match the
> number in the associated XML file, then the register numbers used by the stub
> may get out of sync with a remote GDB instance.

I am not sure how to trigger the out of sync issue. Do you know how?

>
> Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
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

The change looks good to me.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

