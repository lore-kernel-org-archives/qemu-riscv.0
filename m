Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iFpSZ-0005Ve-Ls
	for mharc-qemu-riscv@gnu.org; Wed, 02 Oct 2019 20:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iFpSW-0005Rt-OT
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 20:59:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iFpSV-0005mv-O9
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 20:59:08 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:38267)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iFpST-0005m4-7A; Wed, 02 Oct 2019 20:59:05 -0400
Received: by mail-yw1-xc42.google.com with SMTP id s6so395494ywe.5;
 Wed, 02 Oct 2019 17:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F90W0inCa8+t9lUSx1aHYhRTxYmY/Uj5sscShRlY0xU=;
 b=UenB6Pv2aMcwORYnJa/udEOK/OMlOlz6jqMy2TXcIu5duEzwrrlfqSWP60bKR8amNd
 GLa50HXoEv+zkV9wOKZmEvPhWeM+mrC3iKtidu2TPYGEpVSqLyBRldFLqqSqvsoPZOg3
 aZg8WOeuv7h7oWzx32cbuAcfU59/CpknE6VaNwHy2hI6S2QPmVRhV7VvfZ2i8UDPM+Sk
 gZ68jcrUX/dCCRmX+s+J8ll5NkGeUjSYd/N7I21ZYfFfItZPm3Isy7GgqnFE4n0ajWEn
 W3s1VpeZ9L6cu1x7R3JaEVwQQKToDiqg2fFyt99IgNLcbH1CEM0GzxkR+NUQTI2HbrCs
 aR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F90W0inCa8+t9lUSx1aHYhRTxYmY/Uj5sscShRlY0xU=;
 b=k9zYP+6/ADIZs2VpV3rw+U7iALst+SY4w/Gl3LPJFKkMmDwsZfbGA/zzSkI6HNHTLd
 CTPE5Sn8e89797jvl/jWOQNqwwRP9jc8m+Sx5uiTJMTjbEr4Hhv/Vk8Hc1Fb0zHJWvG0
 5DZbMjxOQwfgQGQ1Wi8dDy46OfubPJXfEReP4QP9SCD1Zo3FJOCuP+uRL3hxqn3h9yzB
 Yo1m63z7HuUXnHv984kJ7d1Jwn5ihP/xKXUHOKfTqZKZ0VBJ7MCNjfFDBrY1Ha0pZmfO
 IVLRHsWQQ00N4YSliOxKCJtSxNFuCmEXLQJ8dcXTE8zMyiJB48EfnTXef1RTz+heVC2m
 0Gow==
X-Gm-Message-State: APjAAAUf/P1HJ196Nop8zOMxQVDKFuFwQisiYN98fylhdRrltkapH4do
 o0CjH9zZwGmTWZY4N7e5t2z8UaM9vyaSCF/esMs=
X-Google-Smtp-Source: APXvYqz8hBNak9nVkhSFZ3co9kYIGhIZ0GYJJRkSgfVP8oMqNoBPziJ9Z5uyyO1CbY+PyyNvaOGQ7XikGQMYaqIJLk8=
X-Received: by 2002:a81:a401:: with SMTP id b1mr4516299ywh.280.1570064344541; 
 Wed, 02 Oct 2019 17:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191002144859.18208-1-jonathan@fintelia.io>
In-Reply-To: <20191002144859.18208-1-jonathan@fintelia.io>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 3 Oct 2019 08:58:53 +0800
Message-ID: <CAEUhbmV6J_fj_+2t+wxyQqgUmmQYrN3_N5T4ignX0qYA2wOdFg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Expose "priv" register for GDB
To: Jonathan Behrens <jonathan@fintelia.io>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
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
X-List-Received-Date: Thu, 03 Oct 2019 00:59:10 -0000

On Wed, Oct 2, 2019 at 10:51 PM Jonathan Behrens <jonathan@fintelia.io> wrote:
>
> This patch enables a debugger to read and write the current privilege level via
> a special "priv" register. When compiled with CONFIG_USER_ONLY the register is
> still visible but is hardwired to zero.
>
> Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
> ---
>  gdb-xml/riscv-32bit-cpu.xml |  1 +
>  gdb-xml/riscv-64bit-cpu.xml |  1 +
>  target/riscv/cpu.c          |  2 +-
>  target/riscv/gdbstub.c      | 14 ++++++++++++++
>  4 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/gdb-xml/riscv-32bit-cpu.xml b/gdb-xml/riscv-32bit-cpu.xml
> index 0d07aaec85..d6d76aafd8 100644
> --- a/gdb-xml/riscv-32bit-cpu.xml
> +++ b/gdb-xml/riscv-32bit-cpu.xml
> @@ -44,4 +44,5 @@
>    <reg name="t5" bitsize="32" type="int"/>
>    <reg name="t6" bitsize="32" type="int"/>
>    <reg name="pc" bitsize="32" type="code_ptr"/>
> +  <reg name="priv" bitsize="32" type="int"/>
>  </feature>
> diff --git a/gdb-xml/riscv-64bit-cpu.xml b/gdb-xml/riscv-64bit-cpu.xml
> index b8aa424ae4..0758d1b5fe 100644
> --- a/gdb-xml/riscv-64bit-cpu.xml
> +++ b/gdb-xml/riscv-64bit-cpu.xml
> @@ -44,4 +44,5 @@
>    <reg name="t5" bitsize="64" type="int"/>
>    <reg name="t6" bitsize="64" type="int"/>
>    <reg name="pc" bitsize="64" type="code_ptr"/>
> +  <reg name="priv" bitsize="64" type="int" />
>  </feature>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f13e298a36..347989858f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -475,7 +475,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      cc->synchronize_from_tb = riscv_cpu_synchronize_from_tb;
>      cc->gdb_read_register = riscv_cpu_gdb_read_register;
>      cc->gdb_write_register = riscv_cpu_gdb_write_register;
> -    cc->gdb_num_core_regs = 33;
> +    cc->gdb_num_core_regs = 34;
>  #if defined(TARGET_RISCV32)
>      cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
>  #elif defined(TARGET_RISCV64)
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index ded140e8d8..dc8cb4d26c 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -278,6 +278,12 @@ int riscv_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
>          return gdb_get_regl(mem_buf, env->gpr[n]);
>      } else if (n == 32) {
>          return gdb_get_regl(mem_buf, env->pc);
> +    } else if (n == 33) {
> +#ifdef CONFIG_USER_ONLY
> +        return gdb_get_regl(mem_buf, 0);
> +#else
> +        return gdb_get_regl(mem_buf, env->priv);
> +#endif
>      }
>      return 0;
>  }
> @@ -296,6 +302,14 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>      } else if (n == 32) {
>          env->pc = ldtul_p(mem_buf);
>          return sizeof(target_ulong);
> +    } else if (n == 33) {
> +#ifndef CONFIG_USER_ONLY
> +        env->priv = ldtul_p(mem_buf) & 0x3;
> +        if (env->priv == 2) {

Please use PRV_H

> +            env->priv = 1;

and PRV_S here

> +        }
> +#endif
> +        return sizeof(target_ulong);
>      }
>      return 0;
>  }
> --

Regards,
Bin

