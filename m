Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poF1j-0008Sj-NA
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 22:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poF1i-0008SN-JV; Sun, 16 Apr 2023 22:55:34 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poF1g-0004Z1-9s; Sun, 16 Apr 2023 22:55:34 -0400
Received: by mail-ua1-x930.google.com with SMTP id r10so7439958uat.6;
 Sun, 16 Apr 2023 19:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681700131; x=1684292131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8WvFBByR9DuCTD5UVG+UvbKrXLfrA81zAzcynt9T/A=;
 b=KgBEslzO2itPkxdFnFCymNdU18v33/Rte3GmHmFiBiVsW4nwrF7vQqS9cFlWWyJAsm
 U0fuv4rIAVOPcNavQ7+FTXoqwhMUOIDfzM42HO54T8p2mH8tMRKWwYEhz9C3iz70ozIw
 hpAIe8OpoMqvvZ0FRGtWnPG1w3YBjorTWFoDwlTjsszFmKI2XUNw62L4WRkgBy4wtkyn
 fVAVnzYL1Z5p2feMofwobLUnWCXVaL/QVLGXn/VqnqL0Ut2jXrZjbknyIdTnJHEqnhs5
 86pXnayDveA8Zrkt7eF6KAVvjFH3NTVA7LehhyONjsBZR9vlzpjkE3umhHK8g5eaHYjE
 Yzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681700131; x=1684292131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D8WvFBByR9DuCTD5UVG+UvbKrXLfrA81zAzcynt9T/A=;
 b=kzq63zQrRierExooD4FsOBznGw82lpYErsbdyh8ZNxXR3D/CUvyqHqQlX0zNxhPyRy
 F/NY/o5w8E1MSBrt2ZOWL+KrjuSH5fFbj7e6OaGv/1NrXrI6TFDPGBduWcBsisGPCZdX
 LOAOgsVjXOWO73tWQCWFTWHgjQuUQiHEjiEKexhovVpCnfjA9/KQaa30+ErUX560RQis
 0FJfEeHQL8KJoK9yWqAWKdaMEgtKn4pbimckdXDK09IkpcbROc8GbSXSH76UfSY2ujEN
 rzyY2WBp8bkCoKy842aAkEK7HiwtfTZ/7Et94EERoSwrVlPbp/rPbNY+VvgznLw8yzdD
 owQg==
X-Gm-Message-State: AAQBX9fLUj1mbUvR4S3KJ76BbHNH6Te5Si3fIayaPbuCWswykg5hg9ak
 jor2FWCZBJiN77wvGH2auaAXaXybhtZi3rewJEg=
X-Google-Smtp-Source: AKy350b/s8lfqh7OMpwu3yEROMEf4c9/2PyCjco2sy8ICcVT4BPFJ9nISXbnT+n1/3foY6lH0FjjAftdo35uZwK6Hvg=
X-Received: by 2002:a1f:2a17:0:b0:43c:6ef1:7116 with SMTP id
 q23-20020a1f2a17000000b0043c6ef17116mr7712068vkq.0.1681700130785; Sun, 16 Apr
 2023 19:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230411183511.189632-1-dbarboza@ventanamicro.com>
 <20230411183511.189632-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230411183511.189632-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 12:55:04 +1000
Message-ID: <CAKmqyKMA=C0puPHhP4opaDUMKTP59qXFWFf6ZV+bjV4f2o=OWA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] target/riscv: add CPU QOM header
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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
X-List-Received-Date: Mon, 17 Apr 2023 02:55:35 -0000

On Wed, Apr 12, 2023 at 4:36=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> QMP CPU commands are usually implemented by a separated file,
> <arch>-qmp-cmds.c, to allow them to be build only for softmmu targets.
> This file uses a CPU QOM header with basic QOM declarations for the
> arch.
>
> We'll introduce query-cpu-definitions for RISC-V CPUs in the next patch,
> but first we need a cpu-qom.h header with the definitions of
> TYPE_RISCV_CPU and RISCVCPUClass declarations. These were moved from
> cpu.h to the new file, and cpu.h now includes "cpu-qom.h".
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu-qom.h | 70 ++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h     | 46 +--------------------------
>  2 files changed, 71 insertions(+), 45 deletions(-)
>  create mode 100644 target/riscv/cpu-qom.h
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> new file mode 100644
> index 0000000000..b9318e0783
> --- /dev/null
> +++ b/target/riscv/cpu-qom.h
> @@ -0,0 +1,70 @@
> +/*
> + * QEMU RISC-V CPU QOM header
> + *
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef RISCV_CPU_QOM_H
> +#define RISCV_CPU_QOM_H
> +
> +#include "hw/core/cpu.h"
> +#include "qom/object.h"
> +
> +#define TYPE_RISCV_CPU "riscv-cpu"
> +
> +#define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
> +#define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
> +#define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
> +
> +#define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
> +#define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
> +#define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
> +#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
> +#define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibe=
x")
> +#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
> +#define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31"=
)
> +#define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34"=
)
> +#define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51"=
)
> +#define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34"=
)
> +#define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54"=
)
> +#define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906"=
)
> +#define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
> +
> +#if defined(TARGET_RISCV32)
> +# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
> +#elif defined(TARGET_RISCV64)
> +# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
> +#endif
> +
> +typedef struct CPUArchState CPURISCVState;
> +
> +OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
> +
> +/**
> + * RISCVCPUClass:
> + * @parent_realize: The parent class' realize handler.
> + * @parent_phases: The parent class' reset phase handlers.
> + *
> + * A RISCV CPU model.
> + */
> +struct RISCVCPUClass {
> +    /*< private >*/
> +    CPUClass parent_class;
> +    /*< public >*/
> +    DeviceRealize parent_realize;
> +    ResettablePhases parent_phases;
> +};
> +
> +#endif /* RISCV_CPU_QOM_H */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 86e08d10da..fa2655306d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -28,6 +28,7 @@
>  #include "qemu/int128.h"
>  #include "cpu_bits.h"
>  #include "qapi/qapi-types-common.h"
> +#include "cpu-qom.h"
>
>  #define TCG_GUEST_DEFAULT_MO 0
>
> @@ -37,32 +38,6 @@
>   */
>  #define TARGET_INSN_START_EXTRA_WORDS 1
>
> -#define TYPE_RISCV_CPU "riscv-cpu"
> -
> -#define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
> -#define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
> -#define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
> -
> -#define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
> -#define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
> -#define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
> -#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
> -#define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibe=
x")
> -#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
> -#define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31"=
)
> -#define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34"=
)
> -#define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51"=
)
> -#define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34"=
)
> -#define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54"=
)
> -#define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906"=
)
> -#define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
> -
> -#if defined(TARGET_RISCV32)
> -# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
> -#elif defined(TARGET_RISCV64)
> -# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
> -#endif
> -
>  #define RV(x) ((target_ulong)1 << (x - 'A'))
>
>  /* Consider updating misa_ext_cfgs[] when adding new MISA bits here */
> @@ -101,8 +76,6 @@ enum {
>
>  #define MAX_RISCV_PMPS (16)
>
> -typedef struct CPUArchState CPURISCVState;
> -
>  #if !defined(CONFIG_USER_ONLY)
>  #include "pmp.h"
>  #include "debug.h"
> @@ -387,23 +360,6 @@ struct CPUArchState {
>      uint64_t kvm_timer_frequency;
>  };
>
> -OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
> -
> -/*
> - * RISCVCPUClass:
> - * @parent_realize: The parent class' realize handler.
> - * @parent_phases: The parent class' reset phase handlers.
> - *
> - * A RISCV CPU model.
> - */
> -struct RISCVCPUClass {
> -    /* < private > */
> -    CPUClass parent_class;
> -    /* < public > */
> -    DeviceRealize parent_realize;
> -    ResettablePhases parent_phases;
> -};
> -
>  /*
>   * map is a 16-bit bitmap: the most significant set bit in map is the ma=
ximum
>   * satp mode that is supported. It may be chosen by the user and must re=
spect
> --
> 2.39.2
>
>

