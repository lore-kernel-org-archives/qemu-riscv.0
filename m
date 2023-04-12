Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYAX-0008E9-0U
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 06:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmYAV-0008Ce-27; Wed, 12 Apr 2023 06:57:39 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmYAT-00013R-6I; Wed, 12 Apr 2023 06:57:38 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id z13so10132153vss.1;
 Wed, 12 Apr 2023 03:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681297055; x=1683889055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gmay+YrG1YohTpRrIo5lvZS3O6hGPdM6zE7JdUENo+o=;
 b=jftHyuzw9d5kq/9KwK5ba4/Rb5Env4wXdBWn4MQx8MRRm/wWmNwWiRZ5KmVgT7BrxM
 MDJUPFdTXa9wiOoM2C4z9NQ1OXGJVPyZmVSfVgJdhnNlTHlyQ2NDDOXKx1Sd5WGW++6s
 PvJ8SvOoSSsahSsw0VzW7q3BeilBBDr9r/XI2ZG1UtUT2lZ8mKwCDyYLRrkY7+SCBggz
 MdQXDp+0yB5UcKcIBn8h2hY0LtJGtcDyfu6OuzE0lTY68zWTBq61WzgjI94C+MQfUtnB
 dDA4aCx7pEeV9bM/09XHG/TdIs0K+rtIw75KncgZOPe7ICom5z5Go3vEhXPZmzB9gU+Y
 ARQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681297055; x=1683889055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gmay+YrG1YohTpRrIo5lvZS3O6hGPdM6zE7JdUENo+o=;
 b=DNg18vBgcpbZlJ2Aw2qFj/MD55Bg5AUsQEmUq4H4JGCK3PbP4zr+gDkbmB6BZ6QhIN
 JlinwgvBNfuzUyPov1ADvobOhxeZuds4AMrKaN63LucFQCP0GzzceApWhQvrI4+C+SQt
 gYGqpwzxyh3k5RYj8ftevtyZ1S3mmU1pxwNLpfUTI/nyg4aF91C/vUqmiKaF8mXvSraV
 Bp8y+o/EjTM1TURMddrBEeG/x1cPIsxtqtR9Y7t9thpzh0pho2mWqLTr9nr8ucHbxDWn
 VOgeY0+vmPQ6+uLTa3WOXWehyA0K1hdIpzplxaeXg7XfeFOQx9QmgsdV8gYd/nhSubQm
 FJYA==
X-Gm-Message-State: AAQBX9e8SmAsLQ/SwpFPtsDGE+lidzEAIRqUnAujjPDE1yDH8sCg23lw
 BNh5Nj8HPeMB+saJaC/0ZY4SruGt/ebzNFH7UjoDf5N3GhO7og==
X-Google-Smtp-Source: AKy350a8w91PAJcwXRZ7ddAzkP9YcPyWXpDmblj0srRkLEkKUpod/m8rcUN23eIu2cNxv9qJ7vXCVKHESyNFkUJWmvg=
X-Received: by 2002:a67:c806:0:b0:425:87ab:c386 with SMTP id
 u6-20020a67c806000000b0042587abc386mr1017576vsk.3.1681297055144; Wed, 12 Apr
 2023 03:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230410124451.15929-1-ivan.klokov@syntacore.com>
 <20230410124451.15929-3-ivan.klokov@syntacore.com>
In-Reply-To: <20230410124451.15929-3-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Apr 2023 20:57:09 +1000
Message-ID: <CAKmqyKPnWSOpTYb3Btj0Ov=wDaKYYgfnOewpS3KJT6iViaXS=g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] target/riscv: Add RVV registers to log
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 philmd@linaro.org, wangyanan55@huawei.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 10:57:39 -0000

On Mon, Apr 10, 2023 at 10:47=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore=
.com> wrote:
>
> Print RvV extesion register to log if VPU option is enabled.
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 56 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5bc0005cc7..cfd063a5dc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -172,6 +172,14 @@ const char * const riscv_fpr_regnames[] =3D {
>    "f30/ft10", "f31/ft11"
>  };
>
> +const char * const riscv_rvv_regnames[] =3D {
> +  "v0",  "v1",  "v2",  "v3",  "v4",  "v5",  "v6",
> +  "v7",  "v8",  "v9",  "v10", "v11", "v12", "v13",
> +  "v14", "v15", "v16", "v17", "v18", "v19", "v20",
> +  "v21", "v22", "v23", "v24", "v25", "v26", "v27",
> +  "v28", "v29", "v30", "v31"
> +};
> +
>  static const char * const riscv_excp_names[] =3D {
>      "misaligned_fetch",
>      "fault_fetch",
> @@ -422,7 +430,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *=
f, int flags)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
> -    int i;
> +    int i, j;
> +    uint8_t *p;
>
>  #if !defined(CONFIG_USER_ONLY)
>      if (riscv_has_ext(env, RVH)) {
> @@ -506,6 +515,51 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE =
*f, int flags)
>              }
>          }
>      }
> +    if (riscv_has_ext(env, RVV) && (flags & CPU_DUMP_VPU)) {
> +        static const int dump_rvv_csrs[] =3D {
> +                    CSR_VSTART,
> +                    CSR_VXSAT,
> +                    CSR_VXRM,
> +                    CSR_VCSR,
> +                    CSR_VL,
> +                    CSR_VTYPE,
> +                    CSR_VLENB,
> +                };
> +        for (int i =3D 0; i < ARRAY_SIZE(dump_rvv_csrs); ++i) {
> +            int csrno =3D dump_rvv_csrs[i];
> +            target_ulong val =3D 0;
> +            RISCVException res =3D riscv_csrrw_debug(env, csrno, &val, 0=
, 0);
> +
> +            /*
> +             * Rely on the smode, hmode, etc, predicates within csr.c
> +             * to do the filtering of the registers that are present.
> +             */
> +            if (res =3D=3D RISCV_EXCP_NONE) {
> +                qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
> +                             csr_ops[csrno].name, val);
> +            }
> +        }
> +        uint16_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
> +
> +/*
> + * From vector_helper.c
> + * Note that vector data is stored in host-endian 64-bit chunks,
> + * so addressing bytes needs a host-endian fixup.
> + */
> +#if HOST_BIG_ENDIAN
> +#define BYTE(x)   ((x) ^ 7)
> +#else
> +#define BYTE(x)   (x)
> +#endif
> +        for (i =3D 0; i < 32; i++) {
> +            qemu_fprintf(f, " %-8s ", riscv_rvv_regnames[i]);
> +            p =3D (uint8_t *)env->vreg;
> +            for (j =3D vlenb - 1 ; j >=3D 0; j--) {
> +                qemu_fprintf(f, "%02x", *(p + i * vlenb + BYTE(j)));
> +            }
> +            qemu_fprintf(f, "\n");
> +        }
> +    }
>  }
>
>  static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
> --
> 2.34.1
>
>

