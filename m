Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixGl5-0006OB-D8
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jan 2020 15:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42215)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ixGl2-0006Nw-TS
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 15:49:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ixGl1-0001EL-Hb
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 15:49:48 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34752)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ixGl1-00016y-8i
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 15:49:47 -0500
Received: by mail-wr1-x442.google.com with SMTP id t2so5881507wrr.1
 for <qemu-riscv@nongnu.org>; Thu, 30 Jan 2020 12:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=TSb+wND/Xpa3iUFZUZ8sCCdVA9tmAo+BY5u9Yah8CqU=;
 b=aJfcM6przZBsr3JTNRfEdVufp0bcpkKMs/IeqiK9JBgL9YevpAvGwQ30FVmRBHZQzn
 1wJrFqfTjpNRaSUxrEG7USxCVvATr/Djcu0RelpIjIJ6MlxmX9cEbsQgGiWiXa82ZDGZ
 Z7wbwc2jFDealzURym2fJJC5toaImkvAYDaz1jqenlttqhL93chvexj7s7gtaF/cBfNX
 /GBaPKOu2WH0aUfckjqU9H3gJHRbBD9BBRWrgU8UMdKSdh/1fW6ToAIlCuX0ZA/GVKVu
 7EKbUoAkqtUwxtssMG0hM9m6fkxURG7DrjZhnsdTuUG0/SVijikTz5RMWWlkkhkJfaDe
 k4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=TSb+wND/Xpa3iUFZUZ8sCCdVA9tmAo+BY5u9Yah8CqU=;
 b=NOTY2g2ZIwPA6OkxY6QQxGx+rtnaf9QsS/Jl/aTSnZ3rw+c9vFUFJ7M04k3SM2VNMV
 IQQs6CyPwOaoYvYiDWgxCsHezt1vGKfQez4ECt2+6aXIP438Ctqh6/m8FYJwozw6C5hG
 kI1xQitVjAcEAqE+7fJ3pKzJ9ZtFvd6yKF4WCGlW0myu4u7i/7PrLLuZDWZjEELlyqTF
 KTnQo1koclQ26G0YCeSCnlCGu4IrvLqghbDnpJl8Kojw3nmgjF+DSoNNmg4frkz3fKed
 y+RKqp0QvCBHHPAy8OhLyv2oyBHMJt4T4X2inaHPD4NLt6HEyFQ0wDV+Ho/j7gUG6e1e
 UADw==
X-Gm-Message-State: APjAAAWFz8gW6FlBxhPoLtqqtgspYZTWM6hEZSzWz/npNIHrp4h4Y1dL
 fVgLoX3YqFGVOsZskmjzE2ypQQ==
X-Google-Smtp-Source: APXvYqx1DAEpIIzUckrgtHDqZZ7zzyJGHJdGm0bnyzJzACxs8iWK8NyxkImqWMOHhz6R7Upwgf7rSw==
X-Received: by 2002:adf:fd84:: with SMTP id d4mr7437939wrr.211.1580417385375; 
 Thu, 30 Jan 2020 12:49:45 -0800 (PST)
Received: from localhost ([2a00:79e0:d:11:1da2:3fd4:a302:4fff])
 by smtp.gmail.com with ESMTPSA id g128sm7341031wme.47.2020.01.30.12.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 12:49:44 -0800 (PST)
Date: Thu, 30 Jan 2020 12:49:44 -0800 (PST)
X-Google-Original-Date: Thu, 30 Jan 2020 20:49:43 GMT (+0000)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: Separate FPU register size from core register size
 in gdbstub [v2]
CC: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 sagark@eecs.berkeley.edu, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org, keithp@keithp.com
To: keithp@keithp.com
In-Reply-To: <20200128233216.515171-1-keithp@keithp.com>
References: <20200128233216.515171-1-keithp@keithp.com>
Message-ID: <mhng-2ed22ad1-9efc-4ffb-856b-0d63ad8a9173@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
X-List-Received-Date: Thu, 30 Jan 2020 20:49:50 -0000

On Tue, 28 Jan 2020 23:32:16 GMT (+0000), keithp@keithp.com wrote:
> The size of the FPU registers is dictated by the 'f' and 'd' features,
> not the core processor register size. Processors with the 'd' feature
> have 64-bit FPU registers. Processors without the 'd' feature but with
> the 'f' feature have 32-bit FPU registers.
>
> Signed-off-by: Keith Packard <keithp@keithp.com>
>
> ---
>
> v2:
>     Fix checkpatch formatting complaints.
> ---
>  configure              |  4 ++--
>  target/riscv/gdbstub.c | 20 +++++++++++---------
>  2 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/configure b/configure
> index a72a5def57..c21bff8d10 100755
> --- a/configure
> +++ b/configure
> @@ -7709,13 +7709,13 @@ case "$target_name" in
>      TARGET_BASE_ARCH=riscv
>      TARGET_ABI_DIR=riscv
>      mttcg=yes
> -    gdb_xml_files="riscv-32bit-cpu.xml riscv-32bit-fpu.xml riscv-32bit-csr.xml riscv-32bit-virtual.xml"
> +    gdb_xml_files="riscv-32bit-cpu.xml riscv-32bit-fpu.xml riscv-64bit-fpu.xml riscv-32bit-csr.xml riscv-32bit-virtual.xml"
>    ;;
>    riscv64)
>      TARGET_BASE_ARCH=riscv
>      TARGET_ABI_DIR=riscv
>      mttcg=yes
> -    gdb_xml_files="riscv-64bit-cpu.xml riscv-64bit-fpu.xml riscv-64bit-csr.xml riscv-64bit-virtual.xml"
> +    gdb_xml_files="riscv-64bit-cpu.xml riscv-32bit-fpu.xml riscv-64bit-fpu.xml riscv-64bit-csr.xml riscv-64bit-virtual.xml"
>    ;;
>    sh4|sh4eb)
>      TARGET_ARCH=sh4
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 1a7947e019..1a72f7be9c 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -303,7 +303,12 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>  static int riscv_gdb_get_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
>  {
>      if (n < 32) {
> -        return gdb_get_reg64(mem_buf, env->fpr[n]);
> +        if (env->misa & RVD) {
> +            return gdb_get_reg64(mem_buf, env->fpr[n]);
> +        }
> +        if (env->misa & RVF) {
> +            return gdb_get_reg32(mem_buf, env->fpr[n]);
> +        }
>      /* there is hole between ft11 and fflags in fpu.xml */
>      } else if (n < 36 && n > 32) {
>          target_ulong val = 0;
> @@ -403,23 +408,20 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
> -#if defined(TARGET_RISCV32)
> -    if (env->misa & RVF) {
> +    if (env->misa & RVD) {
> +        gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
> +                                 36, "riscv-64bit-fpu.xml", 0);
> +    } else if (env->misa & RVF) {
>          gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
>                                   36, "riscv-32bit-fpu.xml", 0);
>      }
> -
> +#if defined(TARGET_RISCV32)
>      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
>                               240, "riscv-32bit-csr.xml", 0);
>
>      gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
>                               1, "riscv-32bit-virtual.xml", 0);
>  #elif defined(TARGET_RISCV64)
> -    if (env->misa & RVF) {
> -        gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
> -                                 36, "riscv-64bit-fpu.xml", 0);
> -    }
> -
>      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
>                               240, "riscv-64bit-csr.xml", 0);

This isn't working for me.  When I apply it on top of my for-master (which is
very close to master), I get 

    $ ./install/bin/qemu-system-riscv32 -M virt -m 256 -nographic -cpu rv32 -s -S -bios default -kernel vmlinux &
    $ ./install/bin/riscv32-unknown-elf-gdb --ex "target remote :1234"
    GNU gdb (GDB) 10.0.50.20200122-git
    Copyright (C) 2020 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.
    Type "show copying" and "show warranty" for details.
    This GDB was configured as "--host=x86_64-pc-linux-gnu --target=riscv32-unknown-elf".
    Type "show configuration" for configuration details.
    For bug reporting instructions, please see:
    <http://www.gnu.org/software/gdb/bugs/>.
    Find the GDB manual and other documentation resources online at:
        <http://www.gnu.org/software/gdb/documentation/>.
    
    For help, type "help".
    Type "apropos word" to search for commands related to "word".
    Remote debugging using :1234
    warning: while parsing target description (at line 1): Could not load XML document "riscv-64bit-fpu.xml"
    warning: Could not load XML target description; ignoring
    warning: No executable has been specified and target does not support
    determining executable automatically.  Try using the "file" command.
    Truncated register 16 in remote 'g' packet
    (gdb) q

The same setup works (for some definition of works, as I get 32-bit D
registers) before the patch, so I don't think it's just something silly in my
environment.

