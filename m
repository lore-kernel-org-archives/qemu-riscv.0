Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppe1j-0000sF-9G
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 19:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppe1h-0000rx-Et; Thu, 20 Apr 2023 19:49:21 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppe1f-0005sw-U3; Thu, 20 Apr 2023 19:49:21 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-42e66bb1621so339420137.2; 
 Thu, 20 Apr 2023 16:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682034558; x=1684626558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fr6vzeTTunSRf5a3QeBbDbTPEncOZ6TMIIOFq3NV5vE=;
 b=hnydzAmCiZIm/GU6CQMqtpSaWssee2Hf0bEF/RhAMtRYKrvYUj48Ou0YXyA/9EwFrs
 qQLaAGzFL8ArqXAqg9uIcSOI7jtzSnSRiOQs59rX4/WquI0Ohl0ahlQLRPJq+5EbDx9d
 tyb2pn6Cho3o8veC9r7MaOWx1VhOlRls6C/1OEHXRRjgHKHQyUZEyOn8ZSTasOWkHhtb
 Yqvh1hKi0bd/FgTnCEd3QSFEtvkkGBk/ZFDr7dUfobD7Y/gsimIXNYg6VuOhZuJkrlRA
 Wo7NcuTN2eTEaLo9pOmsbZ2a2zzVlnxgk9vqdNlDX02IK3NyaXhStvLuv4JKTnfNttPD
 XKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682034558; x=1684626558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fr6vzeTTunSRf5a3QeBbDbTPEncOZ6TMIIOFq3NV5vE=;
 b=PY2C5HFgJwkxg/0EykT8zIpR/LceF9MLw5w+tcbRVdMxV1PZTPQpySb4rZCMflUb5U
 b6d1j2AWgn9YC7A47IPLH2Bf1NhOuzS2KNWSaSttxbKOtRP0D4fRE3xSSBXxL96Huiw+
 lGXemr0Ml3Bvk+tXHkeGNT/oL/4a80EfePDFyIeW9zqYOvDBuxsUieDGAvojmyP/WOj2
 jfbhyk/qh3FVkj+l0H5tlmf/XuiwvVbhCmhjCWJaAAynnHnSZwSJbD9c2Ewr0bYF92ej
 Lzli/VOUzA46nVI9EtpieXzv9YTce6ToJaAoze900Ble//Hn6IvmJcICKZ8PJHbASv43
 iFqg==
X-Gm-Message-State: AAQBX9fJlZhQbeDhF5+jN3g7JB4BBdFBG4vFHIqZIlMImKYx4QQw0EqY
 8BvrH9cAsnaFqMlEUcoDQKi6h+1c0uyraFtLZGs=
X-Google-Smtp-Source: AKy350aw7HpNT7NYQfSzM5R23J+aokwp8sXS+gAoOsV1mwVa7WOHB/LNMVsg4XCLZNb1ebl/6LJ2ctnmEZ35n10IM/s=
X-Received: by 2002:a67:ec4d:0:b0:42f:f1e2:f1b2 with SMTP id
 z13-20020a67ec4d000000b0042ff1e2f1b2mr1876456vso.35.1682034558550; Thu, 20
 Apr 2023 16:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
 <20230420092100.177464-13-dbarboza@ventanamicro.com>
In-Reply-To: <20230420092100.177464-13-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Apr 2023 09:48:52 +1000
Message-ID: <CAKmqyKPX4ThJkWfyoTmVoCtcwGdPYONYqdMLAXUGzOb+9T=ggw@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 12/12] target/riscv: forbid write_misa() for
 static CPUs
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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
X-List-Received-Date: Thu, 20 Apr 2023 23:49:21 -0000

On Thu, Apr 20, 2023 at 7:22=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Static CPUs don't want their extensions changed by user interaction. We
> can prevent it during init by not exposing user facing properties, but
> write_misa() is also capable of disabling/enabling extension during
> runtime.
>
> We have a way of telling whether a CPU is static or not by checking for
> TYPE_RISCV_DYNAMIC_CPU. Use it to make write_misa() a no-op for these
> CPUs.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 5 +++++
>  target/riscv/cpu.h | 2 ++
>  target/riscv/csr.c | 5 +++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4fa720a39d..3cbcf6d320 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1452,6 +1452,11 @@ static void riscv_cpu_init(Object *obj)
>  #endif /* CONFIG_USER_ONLY */
>  }
>
> +bool riscv_cpu_is_static(RISCVCPU *cpu)
> +{
> +    return object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_DYNAMIC_CPU) =3D=
=3D NULL;
> +}
> +
>  typedef struct RISCVCPUMisaExtConfig {
>      const char *name;
>      const char *description;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 1f39edc687..1913ab9d8d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -587,6 +587,8 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *=
env,
>  target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>  void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>
> +bool riscv_cpu_is_static(RISCVCPU *cpu);
> +
>  #include "exec/cpu-all.h"
>
>  FIELD(TB_FLAGS, MEM_IDX, 0, 3)
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d449da2657..929c5477dd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1391,6 +1391,11 @@ static RISCVException write_misa(CPURISCVState *en=
v, int csrno,
>      uint32_t orig_misa_ext =3D env->misa_ext;
>      Error *local_err =3D NULL;
>
> +    if (riscv_cpu_is_static(cpu)) {
> +        /* never write MISA for static CPUs */
> +        return RISCV_EXCP_NONE;
> +    }

Do we actually need this? We already check misa_w which would be
disabled. What's the harm in allowing someone to manually enable
misa_w and then change the MISA?

Also, it's possible that static CPUs actually support changing the
MISA value at run time.

Alistair

> +
>      if (!riscv_cpu_cfg(env)->misa_w) {
>          /* drop write to misa */
>          return RISCV_EXCP_NONE;
> --
> 2.40.0
>
>

