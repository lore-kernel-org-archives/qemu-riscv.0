Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC80C7EE24
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 03:44:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4vi0-0005hb-9A; Thu, 01 Jun 2023 23:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4vhy-0005hH-Sp; Thu, 01 Jun 2023 23:44:10 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4vhw-0008BX-18; Thu, 01 Jun 2023 23:44:09 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-456fc318dd4so494422e0c.0; 
 Thu, 01 Jun 2023 20:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685677446; x=1688269446;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ia8nkpREpJWNziK2PXql2i6MzTjS+ARMRVy95rP1cck=;
 b=QJTU1gjo23NmBOMlf5B8juM90Qu84g9vgUuHamStwUVjD6h4nF3LmFgatK/DKVPs4A
 G4m0luTMRopbGj7XjD+r2E+cuMXy+aCgkUd8KlZsZzug8+9nCr/mRSaB6x0Wb9rdU+x1
 iUAb3wmeA4SXaUeYgV1036JSpNvATxaTe5f52tQWT7tnh9TQJQDI0YSZSgF6xoxlro9o
 M9KuK3tg1HuHUICsJOwep1QZ6MWIPvPBMtj0AI/xdgpckaZSbjFL8XGgP9zG0vT+2Awx
 Qf9MAYJTiufhkxWXZavF4aw82TiLbFk7zNwVQbRfKbSbuEaz7P9FyLeZkhZeer6ZfhjI
 +6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685677446; x=1688269446;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ia8nkpREpJWNziK2PXql2i6MzTjS+ARMRVy95rP1cck=;
 b=HdhIS9YYYty5d/rk6p4/o+SVC3jfSsNxE/zQLPb2dKKK/tyx21Sa5u8RWtgNxnk7X6
 jA0Jz1a9XaGfKL2laJvTFFmnQSPHOu1FPQTqdK70yJReN9RdIkrF4EG3d0FqvTuagDHy
 AfjHOhm8KpEpcMKsbPBWWqr4kpaMkg7sR1R8rXdlWJb+k0LfJs0oEjXK6TYpob9Z/HLk
 5nCh70VVz/0nyDWj/6uOwYhL/0B0SGCoYnmWOZoO4+5WefRUkS73QXkCYZF3ukwtj1my
 PNAQtbk3ZID2dCSpz1Aa5NJC4GWfR4yzI5iUFH6SzvSNO3EOF+e12jqsKXEiP0HQdsWo
 erKg==
X-Gm-Message-State: AC+VfDwnKgdQMwSewXOt0BS2zCppI+wQIYtVUGYzOJ43rFzokNl9jowT
 QTaEeLxq852irnYm1dlCiVVg3ozTGaVZ7EhKZwc=
X-Google-Smtp-Source: ACHHUZ4IvdFJ01NTVUf20gEFvaEjOoM16JEHbapZQknRgNGywBWx5BJtBP7RFngkSXmhNuS5FjeBQ/z40MZIsq4iB9o=
X-Received: by 2002:a1f:3f42:0:b0:45c:8ef0:e351 with SMTP id
 m63-20020a1f3f42000000b0045c8ef0e351mr1730542vka.4.1685677446234; Thu, 01 Jun
 2023 20:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230410124451.15929-1-ivan.klokov@syntacore.com>
 <20230410124451.15929-3-ivan.klokov@syntacore.com>
In-Reply-To: <20230410124451.15929-3-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Jun 2023 13:43:40 +1000
Message-ID: <CAKmqyKMGxJoyjseobh5J81uUUXbatv9GLYOd5zZG9PwWe=CTjw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] target/riscv: Add RVV registers to log
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 philmd@linaro.org, wangyanan55@huawei.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Apr 10, 2023 at 10:47=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore=
.com> wrote:
>
> Print RvV extesion register to log if VPU option is enabled.
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

I applied the first patch, unfortunately this one doesn't apply
anymore. Do you mind rebasing this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next

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

