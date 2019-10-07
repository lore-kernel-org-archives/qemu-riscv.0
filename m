Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHXsG-0007iS-0u
	for mharc-qemu-riscv@gnu.org; Mon, 07 Oct 2019 14:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iHXsC-0007fJ-V4
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 14:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iHXsB-0004cH-QO
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 14:36:44 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:34899)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iHXs9-0004bJ-6x; Mon, 07 Oct 2019 14:36:41 -0400
Received: by mail-lf1-x142.google.com with SMTP id w6so10003366lfl.2;
 Mon, 07 Oct 2019 11:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eWbocJ1fD8v88jlZ4169MzpTZuvRPbEXw0Rq/ooBDRk=;
 b=pGceN9URwm2gWowCkm9wvuu1nmFSwTUlblMR7n3liDLVYGa5QoY0DBu4O0d6sk4dWp
 b9dzCld7hfAQI+c18FauYI0TPC7gexdjDXmL6rlZwoVFLCh2OA2wW8bHLRdELI7p0EZF
 0qEVwrEq8rnXxAaL99Fqb4qaQ96CGBcSichg7sA98U7yZst9vb/mm51mWLRwjp6tJ22l
 tKGhbdAZnU7u7uRQnki+U3np3dP8bd2uPIG2xsE4i6euIF8jd0tQoE6h1o4LM5VwSERv
 lBhfwZPXYxM2kKSPq0696xBulOV1mBbf40uhb+Zt7eJQwVNsSjoi8ROtChzIjs/3PUdi
 cc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eWbocJ1fD8v88jlZ4169MzpTZuvRPbEXw0Rq/ooBDRk=;
 b=Pb143hB7VBhVebn9QKHWfLGGiY8PpP8VNq8mG0aUv6oeKHY0Ha+EQQbhTPnrq8zhkY
 Boy0weWBlWo3ua6rjf0aNupCSqiI50Qz/O0bjg0amaEURMp5bWgdlFugkZAfL3hQkr+6
 2GSUPFQ1v+zZ/9d9FJqnysK3KgXi/gFO1agrknOHaSR2gU2bZrzjX88BQBd/vjfyvXHi
 a685/FwzTGMYDyTAbRYY/Idvy6C/NI4OhQlZC3eTpMhbWxnmr/c1obWRxY9odMY+7zbH
 gIb6JofG2JXT6T6jQzVFYQK8hyl7vo1lgKJJd9xnvA+qIQTcGvX0bJiNEInJ7xleUFWM
 F2QQ==
X-Gm-Message-State: APjAAAXQ6LhcisDCK7ZIaRHNokAt9ulKup9D9Mcguygrw2sIGPtwBGIN
 wQG/DE5lI8atj9KsCO3NMICHQvJEw3cTCM/dhdM=
X-Google-Smtp-Source: APXvYqwDDknyG3YOXTD+DUV/l9sUUtlNGwhuoulvn3OeY3eWg4lMFdAHRtDY1ijaM897i5F5dxtGzSSvzOV/UKkwgYE=
X-Received: by 2002:ac2:5e9e:: with SMTP id b30mr17629448lfq.5.1570473399667; 
 Mon, 07 Oct 2019 11:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191004151614.81516-1-jonathan@fintelia.io>
In-Reply-To: <20191004151614.81516-1-jonathan@fintelia.io>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 7 Oct 2019 11:31:43 -0700
Message-ID: <CAKmqyKPFuyuC6sGCRGJGo2f_3=2z33MmuXHZov5R0pc7A9O9Jg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Expose "priv" register for GDB
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
X-Received-From: 2a00:1450:4864:20::142
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
X-List-Received-Date: Mon, 07 Oct 2019 18:36:46 -0000

On Fri, Oct 4, 2019 at 8:18 AM Jonathan Behrens <jonathan@fintelia.io> wrote:
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
> ---
> Changelog V2:
> - Use PRV_H and PRV_S instead of integer literals
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
> index ded140e8d8..7e0822145d 100644
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
> +        if (env->priv == PRV_H) {
> +            env->priv = PRV_S;
> +        }

Why have this? There is no PRV_H so we should never be in that privilege mode.

Alistair

> +#endif
> +        return sizeof(target_ulong);
>      }
>      return 0;
>  }
> --
> 2.23.0
>

