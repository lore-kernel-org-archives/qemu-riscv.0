Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFNUp-0001N5-QN
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 17:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNUl-0001JA-5k; Tue, 10 Jan 2023 17:53:27 -0500
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNUj-00048R-7Y; Tue, 10 Jan 2023 17:53:26 -0500
Received: by mail-ua1-x934.google.com with SMTP id t8so3234292uaj.5;
 Tue, 10 Jan 2023 14:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xjiLLvsz1+8AN0N78SvCPD3CHYf8zVgFXh0dH4ebgvg=;
 b=e4UyVrcdaR56i0TIB1EY8tAnuGiQkkk5TcL2I4TmYmf2TmmGLrjBqT/6nXm/ug9fDd
 IkkITOK+2Dil8brYnWhdbT4BsCNgdL0gG6pZ5HRsHqEUlOd9Yxd0Bhmc5+5AGaIrEDmy
 8s6Odw2ZQmWANJ8BkmDdEocmJSiguMinTchxn1mSXBTCmVeHuyN8OJwkYpnzt3yLBLZH
 RbaR3UIsxF4/xc5YiTAw+RcYHfLyKbkfEwkx1e42DLgipbWsEl/jI3dd1y3G2PptYhQq
 4n0R+SCKSnjTRjNcsGwU0L2BbtctX2Fych0eIfdH7kk9+x3Fvr27u3ALB/+/FrUMKgYo
 g/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xjiLLvsz1+8AN0N78SvCPD3CHYf8zVgFXh0dH4ebgvg=;
 b=AJtU/0YG4sSlKFNYbqXuEuPGsM6susIKJ/iH3YLEs2t57I3W2nx0KTwHJd7IlDI+aF
 vAMPKpq4Hr7EEtMeVWlfP4038VAH1XWmLS0QALkIadhnCCCopxCnGGpAJ7QTaRa32nGT
 bCNVN7pUhi1D095ngr3CzJCS5Jg3RzOT4URqaEbh/1FLa+QizUhGwiv8KD9uFrRnCTUe
 /kx920km9A4wcsmW9jfvwSgO4VanC2oC6/OUkSUe93hsrijV0wbp6WMs+1fF0NjgWpxB
 874Wkr4D/Vw7kNXOgryh3d0WSFZAUvvjWgcdEeVBP97v/TOS1qtZB1N+aOXGeBxSl/qP
 93lA==
X-Gm-Message-State: AFqh2kopilOajcuwXarMwcCwMZlrbk+RH9LXkTHJ1UpHslmAXofetByj
 9bgwfl3bFPIhI029Z5C7HjNnXDWjgF+6cLGvZPaEMsjR1wg=
X-Google-Smtp-Source: AMrXdXsmpzLZirQI53I+pgirgTHZv3RzKJmD9F8IUIrRKPxaAp5N9NKl2LYX3ZRNQw38hdmZrPuk5/jChQahNV/X+vo=
X-Received: by 2002:ab0:6182:0:b0:419:2865:3ae7 with SMTP id
 h2-20020ab06182000000b0041928653ae7mr8095914uan.70.1673391203706; Tue, 10 Jan
 2023 14:53:23 -0800 (PST)
MIME-Version: 1.0
References: <20230110201405.247785-1-dbarboza@ventanamicro.com>
 <20230110201405.247785-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230110201405.247785-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 08:52:57 +1000
Message-ID: <CAKmqyKMifsWuxaEs8KKDqeWaqdpVH1c3P8xeg8fuxU5k7HWdFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv/cpu: set cpu->cfg in register_cpu_props()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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
X-List-Received-Date: Tue, 10 Jan 2023 22:53:29 -0000

On Wed, Jan 11, 2023 at 6:17 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> There is an informal contract between the cpu_init() functions and
> riscv_cpu_realize(): if cpu->env.misa_ext is zero, assume that the
> default settings were loaded via register_cpu_props() and do validations
> to set env.misa_ext.  If it's not zero, skip this whole process and
> assume that the board somehow did everything.
>
> At this moment, all SiFive CPUs are setting a non-zero misa_ext during
> their cpu_init() and skipping a good chunk of riscv_cpu_realize().
> This causes problems when the code being skipped in riscv_cpu_realize()
> contains fixes or assumptions that affects all CPUs, meaning that SiFive
> CPUs are missing out.
>
> To allow this code to not be skipped anymore, all the cpu->cfg.ext_* attributes
> needs to be set during cpu_init() time. At this moment this is being done in
> register_cpu_props(). The SiFive oards are setting their own extensions during
> cpu_init() though, meaning that they don't want all the defaults from
> register_cpu_props().
>
> Let's move the contract between *_cpu_init() and riscv_cpu_realize() to
> register_cpu_props(). Inside this function we'll check if cpu->env.misa_ext
> was set and, if that's the case, set all relevant cpu->cfg.ext_*
> attributes, and only that. Leave the 'misa_ext' = 0 case as is today,
> i.e. loading all the defaults from riscv_cpu_extensions[].
>
> register_cpu_props() can then be called by all the cpu_init() functions,
> including the SiFive ones. This will make all CPUs behave more in line
> with that riscv_cpu_realize() expects.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h |  4 ++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ee3659cc7e..b8c1edb7c2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -262,6 +262,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    register_cpu_props(DEVICE(obj));
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>  }
>
> @@ -271,6 +272,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>      RISCVCPU *cpu = RISCV_CPU(obj);
>
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
> +    register_cpu_props(DEVICE(obj));
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
>  }
> @@ -305,6 +307,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    register_cpu_props(DEVICE(obj));
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>  }
>
> @@ -314,6 +317,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>      RISCVCPU *cpu = RISCV_CPU(obj);
>
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
> +    register_cpu_props(DEVICE(obj));
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
>  }
> @@ -324,6 +328,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>      RISCVCPU *cpu = RISCV_CPU(obj);
>
>      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
> +    register_cpu_props(DEVICE(obj));
>      set_priv_version(env, PRIV_VERSION_1_11_0);
>      cpu->cfg.mmu = false;
>      cpu->cfg.epmp = true;
> @@ -335,6 +340,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      RISCVCPU *cpu = RISCV_CPU(obj);
>
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
> +    register_cpu_props(DEVICE(obj));
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      cpu->cfg.mmu = false;
>  }
> @@ -1139,10 +1145,44 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +/*
> + * Register CPU props based on env.misa_ext. If a non-zero
> + * value was set, register only the required cpu->cfg.ext_*
> + * properties and leave. env.misa_ext = 0 means that we want
> + * all the default properties to be registered.
> + */
>  static void register_cpu_props(DeviceState *dev)
>  {
> +    RISCVCPU *cpu = RISCV_CPU(OBJECT(dev));
> +    uint32_t misa_ext = cpu->env.misa_ext;
>      Property *prop;
>
> +    /*
> +     * If misa_ext is not zero, set cfg properties now to
> +     * allow them to be read during riscv_cpu_realize()
> +     * later on.
> +     */
> +    if (cpu->env.misa_ext != 0) {
> +        cpu->cfg.ext_i = misa_ext & RVI;
> +        cpu->cfg.ext_e = misa_ext & RVE;
> +        cpu->cfg.ext_m = misa_ext & RVM;
> +        cpu->cfg.ext_a = misa_ext & RVA;
> +        cpu->cfg.ext_f = misa_ext & RVF;
> +        cpu->cfg.ext_d = misa_ext & RVD;
> +        cpu->cfg.ext_v = misa_ext & RVV;
> +        cpu->cfg.ext_c = misa_ext & RVC;
> +        cpu->cfg.ext_s = misa_ext & RVS;
> +        cpu->cfg.ext_u = misa_ext & RVU;
> +        cpu->cfg.ext_h = misa_ext & RVH;
> +        cpu->cfg.ext_j = misa_ext & RVJ;
> +
> +        /*
> +         * We don't want to set the default riscv_cpu_extensions
> +         * in this case.
> +         */
> +        return;
> +    }
> +
>      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
>          qdev_property_add_static(dev, prop);
>      }
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0158932dc5..798bd081de 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -63,6 +63,10 @@
>
>  #define RV(x) ((target_ulong)1 << (x - 'A'))
>
> +/*
> + * Consider updating register_cpu_props() when adding
> + * new MISA bits here.
> + */
>  #define RVI RV('I')
>  #define RVE RV('E') /* E and I are mutually exclusive */
>  #define RVM RV('M')
> --
> 2.39.0
>
>

