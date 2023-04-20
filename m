Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppe6Y-0003FW-2w
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 19:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppe6W-0003El-D4; Thu, 20 Apr 2023 19:54:20 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppe6U-00070L-Gn; Thu, 20 Apr 2023 19:54:20 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-4404c9d9fceso354074e0c.2; 
 Thu, 20 Apr 2023 16:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682034857; x=1684626857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=50igzCLykD7JwgVvKrIP1Q4L2Vbw5aummnrBc5qQE3A=;
 b=RjSmXI0f960M2MCNv/rpbb/otsKJFvjxxqtCpLQB9wg3vglXAX0RTu3QqOoPpDiW0D
 1wkLBJ8/fjTe7AMD2juEmPdAcvsi6z0NwxaL6kqyQXBEZuYqBUCCV8DEWWtN+T1yKtSB
 VsdWSvR/Mn+ZBYavmP2RQhqz2P+HwJsVT/7iYloJ97o0AbJHL8zYGUZsk0/1Ik8vNL2T
 vHrJuLLVa2a+HaEU0Jt2D6JC99ZSQilAS/33fq4e7FPP40GXxnKuQHNvY6EFKKAeEWhT
 dHm5o6VJAtwoEuJvtU5zyyJif7p/dnRAGTbIVDUT2sjQJ1ADFDmeM84hywbNoFMvbx/O
 ERbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682034857; x=1684626857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=50igzCLykD7JwgVvKrIP1Q4L2Vbw5aummnrBc5qQE3A=;
 b=dnq2w2Bka0BNnoMs9mmlCBA4laRUEObHlUUHsUfT2RH8ZSoM2ZSOngC1gaE1WlljgD
 DUitYdoaaIhaMsdMjbtYl6NtmhykK4Jc7ZBT+L54tOrD+FMNBtgBr1usn1kxVJ/cR9Lg
 cObar2N/hFbQGaB3bIX96XuzMEY0gLJiShDdc9yhnBdBlTw3x0HPtdK1oUTPixjrm8jV
 VgNss1o96CTSzcCFuCLWkTMRQX4+5WboqAYLDIZLEQQkwnMtsEuF57YEyldKgHnSP3Dz
 dcB1qtuFwLyJeFBPg9E16F4W2GCpg6ASTqUa20KozQUmQE2VkiVfgKfLzOdPbhkFMK78
 ptyA==
X-Gm-Message-State: AAQBX9d4FHLPEBf2iWr6nz2ZL/UQoWzmuFjpbIUiygLGUg8b1tvAb4Qf
 qh2YRpaHDnj3obbQZkN/tvcl0nwywefx6OXKpzM=
X-Google-Smtp-Source: AKy350an7Z1p/QNNmd89Y9XDyC+Do5OdiApmQCYIJHJ+Ua15ngQZLVmkyETdQsxUHDozAbB8moSlz1nT61taV0XRX4o=
X-Received: by 2002:a1f:5e81:0:b0:432:3100:1278 with SMTP id
 s123-20020a1f5e81000000b0043231001278mr172898vkb.16.1682034857159; Thu, 20
 Apr 2023 16:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230418123624.16414-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230418123624.16414-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Apr 2023 09:53:51 +1000
Message-ID: <CAKmqyKOAwsfDB5_zWfvR5reW4ri75PMO0Y=80YiGUR7xuaWfBg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: add Ventana's Veyron V1 CPU
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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
X-List-Received-Date: Thu, 20 Apr 2023 23:54:20 -0000

On Tue, Apr 18, 2023 at 10:37=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> From: Rahul Pathak <rpathak@ventanamicro.com>
>
> Add a virtual CPU for Ventana's first CPU named veyron-v1. It runs
> exclusively for the rv64 target. It's tested with the 'virt' board.
>
> CPU specs and general information can be found here:
>
> https://www.nextplatform.com/2023/02/02/the-first-risc-v-shot-across-the-=
datacenter-bow/
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu-qom.h      |  1 +
>  target/riscv/cpu.c          | 38 +++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu_vendorid.h |  4 ++++
>  3 files changed, 43 insertions(+)
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index b29090ad86..04af50983e 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -41,6 +41,7 @@
>  #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34"=
)
>  #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54"=
)
>  #define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906"=
)
> +#define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
>  #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>
>  #if defined(TARGET_RISCV32)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index befa64528f..db0875fb43 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -422,6 +422,43 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>  #endif
>  }
>
> +static void rv64_veyron_v1_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +
> +    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU | RVH);
> +    env->priv_ver =3D PRIV_VERSION_1_12_0;
> +
> +    /* Enable ISA extensions */
> +    cpu->cfg.mmu =3D true;
> +    cpu->cfg.ext_icbom =3D true;
> +    cpu->cfg.cbom_blocksize =3D 64;
> +    cpu->cfg.cboz_blocksize =3D 64;
> +    cpu->cfg.ext_icboz =3D true;
> +    cpu->cfg.ext_smaia =3D true;
> +    cpu->cfg.ext_ssaia =3D true;
> +    cpu->cfg.ext_sscofpmf =3D true;
> +    cpu->cfg.ext_sstc =3D true;
> +    cpu->cfg.ext_svinval =3D true;
> +    cpu->cfg.ext_svnapot =3D true;
> +    cpu->cfg.ext_svpbmt =3D true;
> +    cpu->cfg.ext_smstateen =3D true;
> +    cpu->cfg.ext_zba =3D true;
> +    cpu->cfg.ext_zbb =3D true;
> +    cpu->cfg.ext_zbc =3D true;
> +    cpu->cfg.ext_zbs =3D true;
> +    cpu->cfg.ext_XVentanaCondOps =3D true;
> +
> +    cpu->cfg.mvendorid =3D VEYRON_V1_MVENDORID;
> +    cpu->cfg.marchid =3D VEYRON_V1_MARCHID;
> +    cpu->cfg.mimpid =3D VEYRON_V1_MIMPID;
> +
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV48);
> +#endif
> +}
> +
>  static void rv128_base_cpu_init(Object *obj)
>  {
>      if (qemu_tcg_mttcg_enabled()) {
> @@ -1827,6 +1864,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init=
),
> +    DEFINE_CPU(TYPE_RISCV_CPU_VEYRON_V1,        rv64_veyron_v1_cpu_init)=
,
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
>  #endif
>  };
> diff --git a/target/riscv/cpu_vendorid.h b/target/riscv/cpu_vendorid.h
> index a5aa249bc9..96b6b9c2cb 100644
> --- a/target/riscv/cpu_vendorid.h
> +++ b/target/riscv/cpu_vendorid.h
> @@ -3,4 +3,8 @@
>
>  #define THEAD_VENDOR_ID         0x5b7
>
> +#define VEYRON_V1_MARCHID       0x8000000000010000
> +#define VEYRON_V1_MIMPID        0x111
> +#define VEYRON_V1_MVENDORID     0x61f
> +
>  #endif /*  TARGET_RISCV_CPU_VENDORID_H */
> --
> 2.40.0
>
>

