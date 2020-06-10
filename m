Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jj9o2-0005Ru-Mb
	for mharc-qemu-riscv@gnu.org; Wed, 10 Jun 2020 19:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jj9o1-0005RN-ED; Wed, 10 Jun 2020 19:06:49 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:37071)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jj9nz-0002lS-H2; Wed, 10 Jun 2020 19:06:49 -0400
Received: by mail-il1-x141.google.com with SMTP id e11so3664563ilr.4;
 Wed, 10 Jun 2020 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cfw88q8YpGHDTaeCBc3RuvSXu5R8VG4uNh5NqTqiw18=;
 b=VKXbfwllKROHfml1wPtbuvj8PVEpJJEsV4PavXVzz1LPQ6hJmLEDYDTHqvn6KQIHdk
 PEva2NkIMEdThH8dFJ5g1MLdZckXqcuti3V59VIcu8+mGlhLZrG9rUEZMEkDEIixw+k2
 f0duwIzneNfpbXe8c7G+k8vQg2E7SwJ3WjCoQ4YCIrpjNRugKrfTzYXzC8dRfohvYrHs
 EJbuofng0yMBZbCjBnJScC7rzRbyfu2PR4Z3HONlLake6lR6ZmNTK6Gqs2/dgB/RROxj
 RRRxizGJt6H0gw2AWFdY48/iJutyUquk6KkU2wx8YQffpa/nEzCQCVp1XS/b8p382xR3
 /CIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cfw88q8YpGHDTaeCBc3RuvSXu5R8VG4uNh5NqTqiw18=;
 b=NMQMmImSg1/kFXTk1z36UO8Yw1KUnx8UT6HWCJlpdriZubAO6b5VCTmrU2ENPtLARU
 30/6fgwEDfGeuejGcNC2OcUUrGEQ9TtTCfQkuGRBqIM/lkCshGmL+x7LhLO9OxIFnkDT
 9bD3AqkiW7BHd/5gZeW3suYkzz2gMnvDoX4bK5fh9CiFuscIoYVePioWWYwtM3hbV6Bq
 kgwWQ9UYb/J8MCtjaSbBvflZi5HHwcF9xleMuESMlxIPw1T9ZVFtDKqrnWGR791DGF7i
 4GQLwfOzmWeg3e89C7T1BsJe7PiF0exs0fP28kYOo3accwI1HxjzVnDbxTyN85QHw7DD
 Gzfg==
X-Gm-Message-State: AOAM533sPy18YPMXUjPkzMg6mkm7Z0ew9sej7f4xiPqpDdq4jo0aP9AE
 oiaHYvvb8yvWNVehbINpxCvHYT6vs651HqaDrAk=
X-Google-Smtp-Source: ABdhPJxQuFdGf8vAyiR+1RDgE2ioNspeojHTjsg8nzeXCOYHvk0Ey9R0D82Yfj3R6Irqmx+EFxLIw72YwkAr5ZAv5Sw=
X-Received: by 2002:a92:aa07:: with SMTP id j7mr5375744ili.40.1591830394238;
 Wed, 10 Jun 2020 16:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <1591342707-9729-1-git-send-email-bmeng.cn@gmail.com>
 <1591342707-9729-4-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1591342707-9729-4-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 10 Jun 2020 15:57:11 -0700
Message-ID: <CAKmqyKNu4rBYrcxshoVAfQUkw4wvm3DgNEGS++BjV2S9C377fw@mail.gmail.com>
Subject: Re: [PATCH 4/4] riscv: Keep the CPU init routine names consistent
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
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
X-List-Received-Date: Wed, 10 Jun 2020 23:06:49 -0000

On Fri, Jun 5, 2020 at 12:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Adding a _ to keep some consistency among the CPU init routines.

We now differ from the actual ISA strings, but as these are internal
functions I don't think it matters. This seems clearer.

>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/cpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c5c2abc..5060534 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -153,7 +153,7 @@ static void rvnn_imacu_nommu_cpu_init(Object *obj)
>
>  #if defined(TARGET_RISCV32)
>
> -static void rv32imcu_nommu_cpu_init(Object *obj)
> +static void rv32_imcu_nommu_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      set_misa(env, RV32 | RVI | RVM | RVC | RVU);
> @@ -162,7 +162,7 @@ static void rv32imcu_nommu_cpu_init(Object *obj)
>      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>  }
>
> -static void rv32imafcu_nommu_cpu_init(Object *obj)
> +static void rv32_imafcu_nommu_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVC | RVU);
> @@ -575,9 +575,9 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
>  #if defined(TARGET_RISCV32)
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32imcu_nommu_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_imcu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rvnn_imacu_nommu_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32imafcu_nommu_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rvnn_gcsu_priv1_10_0_cpu_init),
>  #elif defined(TARGET_RISCV64)
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base_cpu_init),
> --
> 2.7.4
>
>

