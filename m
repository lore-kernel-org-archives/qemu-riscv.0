Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdgdp-000291-Lf
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 18:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdgdn-000232-Qi; Thu, 21 Oct 2021 18:34:27 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:44819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdgdl-0006VA-Ti; Thu, 21 Oct 2021 18:34:27 -0400
Received: by mail-io1-xd33.google.com with SMTP id r134so2922151iod.11;
 Thu, 21 Oct 2021 15:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tWwsFIv1taZoCdqMNI8Fd4uSYH67E8vZ5Pq43tf7LKE=;
 b=EZ/AHjx/KvGTIze8Ic2xtR4awGXa9HcyOg4e3gj6fLalBh8LONrum6vCVjhzg5CrPW
 rZOKl/AI3mLKpHtwfFalH5lFRIowTal6djeHQ32PDj9++wDYp1NQ/LwW1Hme+wuCg5eE
 xGtrIWmtHEhAqbWVhVWlfbiqZ4QAEJlGOdaqaambjiJWXAxoLzI3+MJ0GeSBEK1zJkgt
 kxhQdllxVfnZTCboxYWKiJPUTz/gXM8srYDX9jgKRm5CWQlyTKYg+chuyRIKYjOvyIq+
 3xlYUncHDU8/MhpVr+rccA8naU/q87TR+QB6WBUPZfSd6H7jMrr0sxl0vcEstgPOo5LH
 1FCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tWwsFIv1taZoCdqMNI8Fd4uSYH67E8vZ5Pq43tf7LKE=;
 b=zIEn/8aRNTfezy3l63/R3CIPVe32YJMXneuMbBE9OtgySYyz3mlHu8HGhemi4ViSR4
 OmDzSPsZ8k/MJ2F39H7bUployghnNMDn7RG5NgJIKgLxnDXl5q3dCCEU1jVWE9GsWw6/
 MfwxcDTSp1jo51tIHBEimkhafpuDQiG1HiuXpc8FWbtsng4DBE48NIj7BF0VE5zqo0mD
 g3oDmm7JA+cvm8fVRSy738Du2MB61iuqRQ4vlTUNoeiFB9E0DMcNaIri6HBr1RgKATqG
 moVNy596aP8cpTedQxVwKYq7K3f2Ur3tDEJjSnVzgVkv2qJLIliLgNILZdPqRBKgNQL6
 DUdQ==
X-Gm-Message-State: AOAM531XOBuhKteAhjhdFIEZbSWqZeXX6FGJW2LYQcz7FGtdFvIrGKGH
 2iK11c8zQgpCZR0iqlMI3bdeHmPssZeX7IqO3l4wWdeUOObDVs8W
X-Google-Smtp-Source: ABdhPJzqYwq0IapSI4wCt+9qbPvyfrDASxjVN7m/S94hDihnxzriERCqBE+HwcXTzoL5sy4at2L+nIXnAgdk2o48uHQ=
X-Received: by 2002:a05:6602:2599:: with SMTP id
 p25mr6072227ioo.90.1634855664456; 
 Thu, 21 Oct 2021 15:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211021150921.721630-1-ruinland@andestech.com>
 <20211021150921.721630-2-ruinland@andestech.com>
In-Reply-To: <20211021150921.721630-2-ruinland@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Oct 2021 08:33:58 +1000
Message-ID: <CAKmqyKOH-vDG59DDC4CLmYo7v4vSyWxXoupNKXPpYyF61E=YPQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 1/3] riscv: Adding Andes A25 and AX25 cpu models
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
Cc: wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bmeng.cn@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, ycliang@andestech.com, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>,
 Dylan Jhong <dylan@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 21 Oct 2021 22:34:28 -0000

On Fri, Oct 22, 2021 at 1:13 AM Ruinland Chuan-Tzu Tsai
<ruinland@andestech.com> wrote:
>
> Introduce A25 and AX25 CPU model designed by Andes Technology.
>
> Signed-off-by: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 16 ++++++++++++++++
>  target/riscv/cpu.h |  2 ++
>  2 files changed, 18 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7c626d89cd..0c93b7edd7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -168,6 +168,13 @@ static void rv64_base_cpu_init(Object *obj)
>      set_misa(env, RV64);
>  }
>
> +static void ax25_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    set_priv_version(env, PRIV_VERSION_1_10_0);
> +}
> +
>  static void rv64_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -222,6 +229,13 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      set_resetvec(env, DEFAULT_RSTVEC);
>      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>  }
> +
> +static void a25_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    set_priv_version(env, PRIV_VERSION_1_10_0);
> +}
>  #endif
>
>  static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
> @@ -789,8 +803,10 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_A25,              a25_cpu_init),
>  #elif defined(TARGET_RISCV64)
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_AX25,             ax25_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5896aca346..3bef0d1265 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -37,6 +37,8 @@
>  #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
> +#define TYPE_RISCV_CPU_A25             RISCV_CPU_TYPE_NAME("andes-a25")
> +#define TYPE_RISCV_CPU_AX25             RISCV_CPU_TYPE_NAME("andes-ax25")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>  #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
> --
> 2.25.1
>

