Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B931FEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 02:38:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG9Rm-0005ZC-Oh; Sun, 02 Jul 2023 22:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9Rj-0005YP-UV; Sun, 02 Jul 2023 22:37:47 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9Ri-0001zz-9f; Sun, 02 Jul 2023 22:37:47 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-47e43b71bb7so588302e0c.1; 
 Sun, 02 Jul 2023 19:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688351865; x=1690943865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U1y/iNEIttSfNmy1hABwqe6hCOpo9OMFSEeYWepfpWA=;
 b=H31l2wtipEVDgg+/TGZe69uPWL5VgyNxg1WjElrBEP9bzP1AJ3ix+n/cpkNTOb5vLy
 4N8ABbzSO9ZwROYDG7ooBD1fj1ebSbUBRaJWTPd/TaizmjLDpOlMFKxWCKX54hJgztIv
 1iLwl72v3USWpBm1iBP7L9VSXKadwKyULeWuL5vuDLjwSwcnfFjv+jpIIxg+XdxGhWyu
 qEv2SCYzM2uFB1Tk58U93sT+OyTSFrE3blzQEymZVZ5BxcFpHshM70gG2NREerodcu0x
 Kw2cm8103U6yqkmDmMTxivxUBweBpeR6FI8161k8VCPix/Y3FyxrQlt8wjU2zkng+y9F
 2sRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688351865; x=1690943865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U1y/iNEIttSfNmy1hABwqe6hCOpo9OMFSEeYWepfpWA=;
 b=XyfjO9j3B41eWsjofUFhnOv+RZIFJlnHJq5IvaCRhtKRh3tzkKD5s6q90jmvtmH6Ao
 bBhX3uD3t6DY/JgojqQ3/QkBXPp9QcL6ZFVQoseAtoOXfOzmjZ7Nx8soF4KGv2enx/f6
 8/6UVJk9HfOdYC4DvTpRs4HPPAvGo1FqBZ2I9md0klndJKCIUCjheDOLpf43U2Ju+GB6
 kW3z8LmU7F3HHu2PPqggpqf7f01gYxLbQXyDY4+/6yKhqnUmZwkrHp4GX7d6EgeL7exx
 5G54hvMwKk8kD0tussCJFTSL+gky1WQwu41VZSZEA5jlxX0emDKdEZTK2uxaf+lRrPRZ
 p2bw==
X-Gm-Message-State: ABy/qLZ+7C3T2tH33Np3Wwn12plMsie64WiKs2AIcA+bLm7CPYn0iEbx
 P0W1JRCm81/BWEgdU+JDdEqwOnTsUP901JmAcTA=
X-Google-Smtp-Source: APBJJlGnbpZdrOBtpk587y2awc8FJOFf2JduzL3L8f+U9Tlf0p88qNHn60yfjCkKwkPkFF3fg/+SLuuh+QM8uZ+SWJk=
X-Received: by 2002:a1f:5c56:0:b0:471:4f65:4f7f with SMTP id
 q83-20020a1f5c56000000b004714f654f7fmr3803688vkb.3.1688351864724; Sun, 02 Jul
 2023 19:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230629083730.386604-1-ivan.klokov@syntacore.com>
In-Reply-To: <20230629083730.386604-1-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 12:37:18 +1000
Message-ID: <CAKmqyKNW06+mPKKNOBetTRohNi7h5KnhY-kb40YCFrHQ6D+xNA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] target/riscv: Add RVV registers to log
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 philmd@linaro.org, wangyanan55@huawei.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jun 29, 2023 at 6:39=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore.=
com> wrote:
>
> Print RvV extension register to log if VPU option is enabled.
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Thanks!

Applied to riscv-to-apply.next

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

