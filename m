Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jjPkH-0003IO-7Z
	for mharc-qemu-riscv@gnu.org; Thu, 11 Jun 2020 12:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jjPkE-0003GS-My; Thu, 11 Jun 2020 12:07:58 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:43766)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jjPkA-0001pz-Ui; Thu, 11 Jun 2020 12:07:58 -0400
Received: by mail-il1-x143.google.com with SMTP id g3so5896076ilq.10;
 Thu, 11 Jun 2020 09:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gBTuH6EAM+lMB7EkTRADdYlxqy3PAbX4mi45MI5BDx0=;
 b=Sdl794V9TvEMfBo3FVMuhWTTpCT9Vx5TEfFFiiMkDuQeqxqxY/mUfzRUb6MgJFuAya
 LZS4BuDUeGRgQZ2Lt4M1BwxiscthVH1bLPxcFPSr1r1c0zVPjZfMwMdW129SQaNGR+gB
 ljsdDgFNKVLCrr7/erERQRhz1aLuUrHkW4EanjFV6NCuTVOCDh2UmT9C9yvdcOJDczqM
 hldqiO3kU1/b/iIFa3okLWr0DNu6pE3LjVxCrXC2ltHgKIKOlxo7mx4H4+SnXaS6uzoW
 NLpa4DVtU8LuRcU6+W/Q11wWSatgI/cFG5oD5O50mqBsYESOmO1KosTEne7Rag8gnqew
 5qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gBTuH6EAM+lMB7EkTRADdYlxqy3PAbX4mi45MI5BDx0=;
 b=OvYgCX4dPFihnV6eXSeJhIA6AJ5K7/Dhcf+cLQMSrj083SQixpeV0AksUr390H0PGk
 UUoXXHz3du/iY9ad6ayT1YnGW3VYsnVjaZ2kvqqsqmscwO4etbBDModg0kqsqh3ysSVa
 X4unzd7DE2r7agNDb4NjHV6GHZCqLCuZDxFJgDwBqwMBjtDE5yxcIDnoKv5Zfq7ysxKw
 +KYne2XqilndLIat26xxSQb/JgqT/RhSTPHTFtERuJOs10L/XF3n6FCmm0EE9y1e1HnG
 Dshh5wUDW5uSVEmq0v+3YomOCwZ7/Z98RfVwvLlinzKp0voxafLXPYl/w6fMyTNoG53R
 BvMg==
X-Gm-Message-State: AOAM533HlHudqS6kgFYi0nGujM9boQkX9pGNlnfBqI2TGABjLVZzQwvk
 ttHvQgedVKSI8A7U1Z7y5MBghGI0/pNn2TzSoF8=
X-Google-Smtp-Source: ABdhPJzVeDsw3cENC5kLricOgl6womJYp9UtBQ6Q50o9V/ab8DgZihmOneJlnR1zrXkst4JqZC10kpuTgqg4lqnactQ=
X-Received: by 2002:a05:6e02:4d:: with SMTP id
 i13mr9148147ilr.227.1591891661383; 
 Thu, 11 Jun 2020 09:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <1591837729-27486-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1591837729-27486-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Jun 2020 08:58:17 -0700
Message-ID: <CAKmqyKNdxrwKgaC+Bdff=sBCQc5VcrWHZ=haO1O3Es2io2FnGA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: Generalize CPU init routine for the base CPU
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 11 Jun 2020 16:07:59 -0000

On Wed, Jun 10, 2020 at 6:09 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> There is no need to have two functions that have exactly the same
> codes for 32-bit and 64-bit base CPUs.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Applied to riscv-to-apply branch.

Alistair

> ---
>
> (no changes since v1)
>
>  target/riscv/cpu.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3a6d202..81cdea8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -126,9 +126,7 @@ static void riscv_any_cpu_init(Object *obj)
>      set_resetvec(env, DEFAULT_RSTVEC);
>  }
>
> -#if defined(TARGET_RISCV32)
> -
> -static void riscv_base32_cpu_init(Object *obj)
> +static void riscv_base_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
> @@ -136,6 +134,8 @@ static void riscv_base32_cpu_init(Object *obj)
>      set_resetvec(env, DEFAULT_RSTVEC);
>  }
>
> +#if defined(TARGET_RISCV32)
> +
>  static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -173,14 +173,6 @@ static void rv32imafcu_nommu_cpu_init(Object *obj)
>
>  #elif defined(TARGET_RISCV64)
>
> -static void riscv_base64_cpu_init(Object *obj)
> -{
> -    CPURISCVState *env = &RISCV_CPU(obj)->env;
> -    /* We set this in the realise function */
> -    set_misa(env, 0);
> -    set_resetvec(env, DEFAULT_RSTVEC);
> -}
> -
>  static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -603,13 +595,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      },
>      DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
>  #if defined(TARGET_RISCV32)
> -    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base32_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32imcu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32imacu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32imafcu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32gcsu_priv1_10_0_cpu_init),
>  #elif defined(TARGET_RISCV64)
> -    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base64_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64imacu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64gcsu_priv1_10_0_cpu_init),
>  #endif
> --
> 2.7.4
>
>

