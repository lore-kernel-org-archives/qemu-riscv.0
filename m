Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmB58-0003qb-MM
	for mharc-qemu-riscv@gnu.org; Wed, 04 May 2022 05:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmB57-0003nU-2T; Wed, 04 May 2022 05:14:01 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:39758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmB55-0001dO-Ah; Wed, 04 May 2022 05:14:00 -0400
Received: by mail-io1-xd36.google.com with SMTP id e3so863075ios.6;
 Wed, 04 May 2022 02:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vx+5gpye/+EJCgkYyP8HJcj58rJXvM+sXyucwgpmK14=;
 b=IBhgsCL/fkDeLT5IPQ7PQvM7bOfKIRh9Wc/SpFO1ysFJ6gEE1TGInULLkNN5sHTLqf
 tMtfYyBzsVSN961X/800RWP/fJyKRJRvd0xQg/dLXd+9/1WaWNBUEN43JlVPwUU96gPH
 jYXTLSnS+T17TQNHVrpCjSnxqSLtZXX+Xv3w8WvlwtbBaxR/SDBSSkTTaY8M5xDVJE6p
 cd9e4/+oJqZwe3414HPnSRuP1saU2I0lcyXF+MjYiVuS4gYIhJQTHDJLi88VfkgfsoWz
 7JeJ2gu1zvNlezDMfHYMoeBNEuS+Fd0BLTiWD72XqdJ3wmrhkJ8dJwJ53HKrO759VRBI
 XYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vx+5gpye/+EJCgkYyP8HJcj58rJXvM+sXyucwgpmK14=;
 b=nwRyrFnZlL+YrjmzthhH5GXViUIzJHxSLBYb7XP5c4hutuKopxwsyz8QEZhzBTE+3b
 LH2tuKiBzitGNC/5ICSG5N0oPdn169LqXV8Ux533FqZGIKQkTE/slkj9/io+PjJAbq/U
 UMjUz2C3IZRxgwvjzrBvoFko+u0fcVXXtUh9mm7tBHwZHtv0nL8VdyyU85nIQcbEUEqx
 HkCf0yfO7+wHBA26Xsmziu5Pyu3JuE+/NKi+ZFUqX2yET8l3Gi7Ja+kq7/cbpIKjomBD
 Nc+HJP1KsUtl658TOyAauXONDkI9wzUxhRZiQxwvJLQyUHaawEn41CQ39E2PrQAuHci1
 gN9A==
X-Gm-Message-State: AOAM533rz3X4PVlt9zRGc3EdEHk+eFJDMaZ7OC3JngkoLsaDbdOYg+1p
 Hq6yOClIDBrDZrxhS3VwFN4AGY7l6iYGACXWiRk=
X-Google-Smtp-Source: ABdhPJxfeaTyuXMCzJS4++ED5UB4IGelqgBZZF71oTCvv3NjCwh3KhP9+sBEJnd2ui+SsiOVlU84N8hd/6Hl+pMAo6g=
X-Received: by 2002:a05:6638:14c1:b0:32a:aa03:93e1 with SMTP id
 l1-20020a05663814c100b0032aaa0393e1mr8823516jak.66.1651655637648; Wed, 04 May
 2022 02:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220429153431.308829-1-apatel@ventanamicro.com>
 <20220429153431.308829-2-apatel@ventanamicro.com>
In-Reply-To: <20220429153431.308829-2-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 May 2022 19:13:31 +1000
Message-ID: <CAKmqyKP+iXh=1WhOXT_51SQwpVmSMHxioTmxGmkAkttCQgyaeQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: Don't force update priv spec version to
 latest
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 04 May 2022 09:14:01 -0000

On Sat, Apr 30, 2022 at 1:43 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The riscv_cpu_realize() sets priv spec verion to v1.12 when it is
> when "env->priv_ver == 0" (i.e. default v1.10) because the enum
> value of priv spec v1.10 is zero.
>
> Due to above issue, the sifive_u machine will see priv spec v1.12
> instead of priv spec v1.10.
>
> To fix this issue, we set latest priv spec version (i.e. v1.12)
> for base rv64/rv32 cpu and riscv_cpu_realize() will override priv
> spec version only when "cpu->cfg.priv_spec != NULL".
>
> Fixes: 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f0a702fee6..02ee7d45d8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -169,6 +169,8 @@ static void rv64_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV64, 0);
> +    /* Set latest version of privileged specification */
> +    set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
>
>  static void rv64_sifive_u_cpu_init(Object *obj)
> @@ -204,6 +206,8 @@ static void rv32_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV32, 0);
> +    /* Set latest version of privileged specification */
> +    set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
>
>  static void rv32_sifive_u_cpu_init(Object *obj)
> @@ -509,7 +513,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      CPURISCVState *env = &cpu->env;
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>      CPUClass *cc = CPU_CLASS(mcc);
> -    int priv_version = 0;
> +    int priv_version = -1;
>      Error *local_err = NULL;
>
>      cpu_exec_realizefn(cs, &local_err);
> @@ -533,10 +537,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          }
>      }
>
> -    if (priv_version) {
> +    if (priv_version >= PRIV_VERSION_1_10_0) {
>          set_priv_version(env, priv_version);
> -    } else if (!env->priv_ver) {
> -        set_priv_version(env, PRIV_VERSION_1_12_0);
>      }
>
>      if (cpu->cfg.mmu) {
> --
> 2.34.1
>
>

