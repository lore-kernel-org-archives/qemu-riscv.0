Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7846AEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 02:28:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG9Ip-0003Ju-5F; Sun, 02 Jul 2023 22:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9Im-0003JI-D6; Sun, 02 Jul 2023 22:28:32 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9Ik-0008WD-AM; Sun, 02 Jul 2023 22:28:32 -0400
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-794c5f60479so23895241.3; 
 Sun, 02 Jul 2023 19:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688351308; x=1690943308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6DAIsSxGmt2/NUvwJVV1HzzCZ+IXMJMxNHaZm8X4efg=;
 b=lep5CWWM6FkQs3hCGL2kYiihcTsO3tvI59aCgBtCZY7VIS+lWWl7prS+LH4coHJlUy
 HN7fKrwZUdZlwTojv3kHkTPp/EnMh0iqbGJZMwc0MEEf8MIimU7216O4MUdhm01fjSMa
 H/OETjn4wPpI6QcE/K6zA8yaIFZM9DAjCeuXN3D2RIN6n2x5eL697FG0qgW8GTy5HELp
 Bm+9h0pPx+3/EnYZE7hIK2vklipq7ggwmwuxJ0aM+3uHPaGXcfmXBesVmn8rJHuA8FKR
 joiHxBg26kcyahkH3FXmvQgqeRz9UCZNEMVUnmeN4wsOf5HkLglGzEyolyjrc/BcVwYA
 PrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688351308; x=1690943308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6DAIsSxGmt2/NUvwJVV1HzzCZ+IXMJMxNHaZm8X4efg=;
 b=GeGnS6dhgZjSmHomUEbk1tr9MeL1uvO0AnrnJ9Yt/jb04PRd2sicEaTMQK1GlF6xjJ
 oZ0qE3oEh06Jrywy8T7bTr0ClJp0c2NKMF+cQNjjDq3M8ZrfHJnkvnxOwDHxdMMqZAyH
 WeWuu4qc/GALexeG9Tmin1j3BmI9tumggsuTAej2ZQTjKMwVRqd5DQ0/iFeTcXx06wlP
 9ll+buxov7X3dn1eJS/f0UrhPV6YNCZ/AxAJN/ifXTF95mW+ggqdWRLceUmPBY8JegMd
 t3g6fHA+MzeB2c2ZAL23eknNctoRjXZ55i2zzX2P4YCRArG3HlaPnLtl01oh6RPcCdhU
 L+xg==
X-Gm-Message-State: ABy/qLZxQ5ynb2MVTETKXcc1R004an4SlVQhTyRsQOyPEjOyHgbkarEK
 i0U4T8KhlLQDyDeUrjhmxBlZ3YJWgsdQMTFScRM=
X-Google-Smtp-Source: APBJJlEa9XHgMe6EQ7GnBxjPjHGFvw2xxifeLPZxbVSWarIAdCxIKMpM8VkqDR+kTSU0ErtQW3mJZF+8L4PkSmwbVew=
X-Received: by 2002:a1f:6005:0:b0:471:8787:2c6c with SMTP id
 u5-20020a1f6005000000b0047187872c6cmr2637771vkb.6.1688351308400; Sun, 02 Jul
 2023 19:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230629083730.386604-1-ivan.klokov@syntacore.com>
In-Reply-To: <20230629083730.386604-1-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 12:28:02 +1000
Message-ID: <CAKmqyKP9bMQTWxN6_3HVr0i+A-sN1aq7nH4-q-W1ke4yjugxQg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] target/riscv: Add RVV registers to log
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 philmd@linaro.org, wangyanan55@huawei.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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

On Thu, Jun 29, 2023 at 6:39=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore.=
com> wrote:
>
> Print RvV extension register to log if VPU option is enabled.
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v5:
>    - Fix typo, move macros out of function, direct access to cfg.vlen fie=
ld.
> ---
>  target/riscv/cpu.c | 57 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 881bddf393..ff29573b1f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -55,6 +55,17 @@ struct isa_ext_data {
>  #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
>      {#_name, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
>
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
> +
>  /*
>   * Here are the ordering rules of extension naming defined by RISC-V
>   * specification :
> @@ -183,6 +194,14 @@ const char * const riscv_fpr_regnames[] =3D {
>      "f30/ft10", "f31/ft11"
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
> @@ -608,7 +627,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *=
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
> @@ -692,6 +712,41 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE =
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
> +        uint16_t vlenb =3D cpu->cfg.vlen >> 3;
> +
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

