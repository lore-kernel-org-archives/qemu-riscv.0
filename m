Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBqin-00056F-Os
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 23:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBqim-000544-Is; Thu, 05 Aug 2021 23:40:32 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:38756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBqil-0001Hk-05; Thu, 05 Aug 2021 23:40:32 -0400
Received: by mail-yb1-xb33.google.com with SMTP id c137so12430984ybf.5;
 Thu, 05 Aug 2021 20:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=weAPN+ydW2028eD7P9mR7SZE9Wn5X1XG4WLPLPEGvPM=;
 b=PuKaHG8IHIKS3aMEdndLq25ncovGYYkenT1/l6lHjp/OLzuugYdawFXg7SeTXt6x91
 NgpH0Dics4cxaVv/emjtAqkfFK88j6bCHjqq5WGZKUzCQvdCdJFV/0rGk7dFNT9+q9NJ
 bTGR9yPl3ICSqcCLJVRyoxf8pS9u9tP+nbs/1DTRUYZuCHNt/xsH8k6bXxYocpJbN1hc
 svRPQ8YDF/L07v7ZfVJIJusnRqyLZhgFB+VixZhaDC7AMtiscEbsvSgiO2ro2OVcFP4D
 4DYGIL4jaYFpatapXsf6aYJVm6V1ndYgUdInwmRYylfVOff3SFHBjU9HXrGl+N33VIyW
 TEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=weAPN+ydW2028eD7P9mR7SZE9Wn5X1XG4WLPLPEGvPM=;
 b=tuklVxZ7nOVTmenhEqO3S9NhBygxJ+YsNnEYaK+7kYclBsbFdSZEW84GHWmr0dEFGK
 jWMGjeEkmilhcGyEtMQP1vb4gvre2PGK+I2DLiUw9qpIo6eXJRF7jP8/0RzMVMzQncK5
 uxnVhJ6TwVlY1EniM9m+w98gDFsz0eZMSjA3xbOdXQvAZ28gse7Khayw6cur4I+9HhPh
 rXpT94pYANYELaasWxZZeRciriT7nuB8bmPM7d/yzJnRmIeHNzC/nvC4m/iEj+0F+G/8
 sSPC29mZXAqc0YpJviKlo11QxcDSo9g5skghdcJ4ufYqt7z9iylKspZTJgsCo14b/uxa
 j7Ig==
X-Gm-Message-State: AOAM533+FtE7NOlxCBqdJdT6RVrvkQilAscK2BCEJgUZCXZzCKHQGnIi
 NXI3Y8UXDO80XN37yKSN7fhfsnSOAA5ELuZddeo=
X-Google-Smtp-Source: ABdhPJz4xy8f0WYoumC2JWIopzFXnWAavm8cRFrTyQXVspN3We0xzETo099SdyrlMnDE4/PyeUikDElAPY3VrI5K3FA=
X-Received: by 2002:a25:be09:: with SMTP id h9mr10747260ybk.239.1628221229577; 
 Thu, 05 Aug 2021 20:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210805175626.11573-1-ruinland@andestech.com>
 <20210805175626.11573-4-ruinland@andestech.com>
In-Reply-To: <20210805175626.11573-4-ruinland@andestech.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Aug 2021 11:40:18 +0800
Message-ID: <CAEUhbmU=PN0K+jQzYsbw+0WK6C6w85t2tNGhW0uHJMgfeKvCfw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 3/4] Adding Andes AX25 and A25 CPU model
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, 
 Dylan Jhong <dylan@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 06 Aug 2021 03:40:32 -0000

On Fri, Aug 6, 2021 at 2:00 AM Ruinland Chuan-Tzu Tsai
<ruinland@andestech.com> wrote:
>
> From: Ruinalnd ChuanTzu Tsai <ruinland@andestech.com>
>
> Adding Andes AX25 and A25 CPU model into cpu.h and cpu.c without

The latest RISC-V core from Andes is AX45 and A45. Should we just
support the latest one?

> enhanced features (yet).
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> ---
>  target/riscv/cpu.c | 16 ++++++++++++++++
>  target/riscv/cpu.h |  2 ++
>  2 files changed, 18 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3a638b5..9eb1e3a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -182,6 +182,13 @@ static void rv64_base_cpu_init(Object *obj)
>      set_misa(env, RV64);
>  }
>
> +static void ax25_cpu_init(Object *obj)

nits: for name consistency, should be rv64_andes_ax25_cpu_init()

> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    set_priv_version(env, PRIV_VERSION_1_10_0);
> +}
> +
>  static void rv64_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -235,6 +242,13 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      set_resetvec(env, DEFAULT_RSTVEC);
>      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>  }
> +
> +static void a25_cpu_init(Object *obj)

nits: rv32_andes_a25_cpu_init()

> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    set_priv_version(env, PRIV_VERSION_1_10_0);
> +}
>  #endif
>
>  static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
> @@ -726,8 +740,10 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_A25,              a25_cpu_init),
>  #elif defined(TARGET_RISCV64)
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_AX25,             ax25_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 52df9bb..bd79d63 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -37,6 +37,8 @@
>  #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
> +#define TYPE_RISCV_CPU_A25              RISCV_CPU_TYPE_NAME("andes-a25")
> +#define TYPE_RISCV_CPU_AX25             RISCV_CPU_TYPE_NAME("andes-ax25")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
>  #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")

Regards,
Bin

