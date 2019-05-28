Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVfjz-00055l-BZ
	for mharc-qemu-riscv@gnu.org; Tue, 28 May 2019 13:18:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hVfjw-00053h-MV
	for qemu-riscv@nongnu.org; Tue, 28 May 2019 13:18:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hVfju-0001BS-CJ
	for qemu-riscv@nongnu.org; Tue, 28 May 2019 13:18:19 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45745)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hVfjs-00015B-8D
	for qemu-riscv@nongnu.org; Tue, 28 May 2019 13:18:17 -0400
Received: by mail-pg1-f193.google.com with SMTP id w34so6705762pga.12
	for <qemu-riscv@nongnu.org>; Tue, 28 May 2019 10:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=ynqteHpaI18mvzVpqabF5CifMGbrBuDWqWx964didfw=;
	b=fNZxoo0Eu1brcdv+/cYzx4O6ycjrV7ceyd2vbC+/vhHqeaKNixZVyYw3nV7rCbT1ey
	iKs9Fi0rFfFAa1E/JraCYpQJxeXzTb4TFKtVe7FOkZjzCPMKYfW8cvR3qkwQ6uTqC86o
	ZwbHJsXXMBj4cYpnZGckKxKsLwzEoAoPjzfIeMzJrdPzS8te9K6AiFIaQHSxB0q4Onej
	4VzqOM9SVJjNyfRYPvDzWlhuNZbM4wROMrsrLINocg6o28ClAbpKNfOxbQ6ikn6vS+gs
	saCt+/ScoS5bWEW1PlImejLnRkE7saCFIBYPwSi1dzjUG7uUTc+UmsmdGJ1jHzO3HO/4
	6I6w==
X-Gm-Message-State: APjAAAVoUpexEMO24c5UJlAaNalu91mfwRYawyuslwX8XYuUsVbvhToE
	QtRjGcYOZeVHeoZjBlv/5pqiGA==
X-Google-Smtp-Source: APXvYqxrx3RdmluU8QWqv0XreCz+NTmdeff9YquhmuPtVyAQspuCIeGoSi2/4scrpqT3FpZQh8qAfQ==
X-Received: by 2002:a63:fc61:: with SMTP id r33mr26554880pgk.294.1559063889507;
	Tue, 28 May 2019 10:18:09 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	f38sm11763026pgm.85.2019.05.28.10.18.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 10:18:07 -0700 (PDT)
Date: Tue, 28 May 2019 10:18:07 -0700 (PDT)
X-Google-Original-Date: Tue, 28 May 2019 10:17:56 PDT (-0700)
In-Reply-To: <a95544549f6205d1da5c9efa69fed4f9a89f5866.1557182815.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-4345b03b-e9cb-4dfb-8807-4245659eca20@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.193
Subject: Re: [Qemu-riscv] [PATCH v1 1/1] target/riscv: Allow setting ISA
 extensions via CPU props
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 28 May 2019 17:18:22 -0000

On Mon, 06 May 2019 15:49:53 PDT (-0700), Alistair Francis wrote:
> This patch allows us to enable/disable the RISC-V ISA extensions from
> the QEMU command line. This works with the rv32 and rv64 machines. The
> idea is that in the future we can now add extensions and leave them
> disabled by default until enabled by the user.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> Based-on: <cover.1555726824.git.alistair.francis@wdc.com>
>
> This is based on my previous series: "RISC-V: Add properties to the
> CPUs" which has been merged into the RISC-V tree.
>
>  target/riscv/cpu.c | 70 ++++++++++++++++++++++++++++++++++++++++++++--
>  target/riscv/cpu.h | 11 ++++++++
>  2 files changed, 79 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2db173801f..41afed3140 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -23,6 +23,7 @@
>  #include "cpu.h"
>  #include "exec/exec-all.h"
>  #include "qapi/error.h"
> +#include "qemu/error-report.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
>
> @@ -118,7 +119,8 @@ static void riscv_any_cpu_init(Object *obj)
>  static void riscv_base32_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> -    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    /* We set this in the realise function */
> +    set_misa(env, 0);
>  }
>
>  static void rv32gcsu_priv1_09_1_cpu_init(Object *obj)
> @@ -155,7 +157,8 @@ static void rv32imacu_nommu_cpu_init(Object *obj)
>  static void riscv_base64_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> -    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    /* We set this in the realise function */
> +    set_misa(env, 0);
>  }
>
>  static void rv64gcsu_priv1_09_1_cpu_init(Object *obj)
> @@ -314,6 +317,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>      int priv_version = PRIV_VERSION_1_10_0;
>      int user_version = USER_VERSION_2_02_0;
> +    target_ulong target_misa = 0;
>      Error *local_err = NULL;
>
>      cpu_exec_realizefn(cs, &local_err);
> @@ -357,6 +361,58 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          set_feature(env, RISCV_FEATURE_PMP);
>      }
>
> +    /* If misa isn't set (rv32 and rv64 machines) set it here */
> +    if (!env->misa) {
> +        /* Do some ISA extension error checking */
> +        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> +            error_setg(errp,
> +                       "I and E extensions are incompatible");
> +                       return;
> +       }
> +
> +       if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
> +                               cpu->cfg.ext_a & cpu->cfg.ext_f &
> +                               cpu->cfg.ext_d)) {
> +            warn_report("Setting G will also set IMAFD");
> +            cpu->cfg.ext_i = true;
> +            cpu->cfg.ext_m = true;
> +            cpu->cfg.ext_a = true;
> +            cpu->cfg.ext_f = true;
> +            cpu->cfg.ext_d = true;
> +        }
> +
> +        /* Set the ISA extensions, checks should have happened above */
> +        if (cpu->cfg.ext_i) {
> +            target_misa |= RVI;
> +        }
> +        if (cpu->cfg.ext_e) {
> +            target_misa |= RVE;
> +        }
> +        if (cpu->cfg.ext_m) {
> +            target_misa |= RVM;
> +        }
> +        if (cpu->cfg.ext_a) {
> +            target_misa |= RVA;
> +        }
> +        if (cpu->cfg.ext_f) {
> +            target_misa |= RVF;
> +        }
> +        if (cpu->cfg.ext_d) {
> +            target_misa |= RVD;
> +        }
> +        if (cpu->cfg.ext_c) {
> +            target_misa |= RVC;
> +        }
> +        if (cpu->cfg.ext_s) {
> +            target_misa |= RVS;
> +        }
> +        if (cpu->cfg.ext_u) {
> +            target_misa |= RVU;
> +        }
> +
> +        set_misa(env, RVXLEN | target_misa);
> +    }
> +
>      riscv_cpu_register_gdb_regs_for_features(cs);
>
>      qemu_init_vcpu(cs);
> @@ -379,6 +435,16 @@ static const VMStateDescription vmstate_riscv_cpu = {
>  };
>
>  static Property riscv_cpu_properties[] = {
> +    DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
> +    DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
> +    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, true),
> +    DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
> +    DEFINE_PROP_BOOL("a", RISCVCPU, cfg.ext_a, true),
> +    DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
> +    DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
> +    DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
> +    DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
> +    DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("user_spec", RISCVCPU, cfg.user_spec),
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 67d27f45f6..9805e65065 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -229,6 +229,17 @@ typedef struct RISCVCPU {
>
>      /* Configuration Settings */
>      struct {
> +        bool ext_i;
> +        bool ext_e;
> +        bool ext_g;
> +        bool ext_m;
> +        bool ext_a;
> +        bool ext_f;
> +        bool ext_d;
> +        bool ext_c;
> +        bool ext_s;
> +        bool ext_u;
> +
>          char *priv_spec;
>          char *user_spec;
>          bool mmu;

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

