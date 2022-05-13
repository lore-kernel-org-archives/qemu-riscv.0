Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npZxS-0003JO-Tu
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 14:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1npZxP-0003FG-M7
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 14:24:07 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:46739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1npZxO-000179-3X
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 14:24:07 -0400
Received: by mail-yb1-xb34.google.com with SMTP id i38so16630836ybj.13
 for <qemu-riscv@nongnu.org>; Fri, 13 May 2022 11:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pJ/K+pZNDL6LTbZFbiUHzFg8t5txV0YFi4QNYqtsgFo=;
 b=DFiEVBDNf2jCIIJMSu/BlPUN6c8DV3Qj6buxlG7vSi+yLy6bMZ/pFOuab29qgz+E5/
 ewom80s95d5SicOQuIJ4+UQdd0EmUu/Q7HYese8C4aUG9vTxicOtrSskhk8ZirGJVtbP
 oFOZXqx/u8f+3pkU+oV9CRRV2+USfaHxURYsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pJ/K+pZNDL6LTbZFbiUHzFg8t5txV0YFi4QNYqtsgFo=;
 b=BzKl8FzoYBQWs+DR9XnltwpqDUJXGOez4QXyjipZnHlfqIsYcMU/RqT+4EQ9zv24it
 m1I0gdAxh82jQwK42V8S1tvpitbVKB0Nhh33FqIl87AV8IKSGD7zL55k3yBWy3kFzrwQ
 UvJwQeA7TjbmH5+/VXHEJ7e5KPSCMfPNN+ONvxcHuzXawKw226XaZo6UioSH24ga9IGn
 yUrS48YjHdVl20i2Wm2QhOfeT1VV/M5WtrgxDfRE0y0KzaRhhpYY6oEXoggpRD1+HpgU
 d3Eef942tur6G3LS128yyBhLuhdMLdeY20OTd2M0dTtbm/wjeajZZH5aIkzE3EEeCLX/
 FhTA==
X-Gm-Message-State: AOAM531kHi5o7Afq1Io9fEhvbMF3G6rdyifvUzjYx8icW93HF4jEa++h
 ufFOfzkFuk6BWn2IJyWuFlozpY0GsQgI3uUj4DJP
X-Google-Smtp-Source: ABdhPJxAj0GHwQ1AA2eNuEvyeQjFXz+Xm+Jqqafyslrwe9B2mAop/lU3Lnh4MMxGZE5HJ3bFrJeqPBIPBAU++4ZplAM=
X-Received: by 2002:a25:8d12:0:b0:64b:5980:e7cb with SMTP id
 n18-20020a258d12000000b0064b5980e7cbmr6047163ybl.14.1652466244927; Fri, 13
 May 2022 11:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220511144528.393530-1-apatel@ventanamicro.com>
 <20220511144528.393530-6-apatel@ventanamicro.com>
In-Reply-To: <20220511144528.393530-6-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 13 May 2022 11:23:54 -0700
Message-ID: <CAOnJCU+C5Rvr7GHgUX5dA7zZ7+JMUw_U4S+mUCM0BRwOfRQetQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] target/riscv: Don't force update priv spec version
 to latest
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 13 May 2022 18:24:08 -0000

On Wed, May 11, 2022 at 7:46 AM Anup Patel <apatel@ventanamicro.com> wrote:
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
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/cpu.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9a5be9732d..f3b61dfd63 100644
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


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

