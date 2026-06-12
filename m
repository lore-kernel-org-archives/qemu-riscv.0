Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CD1CD8CA8
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 04:26:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXtTW-0007Xt-72; Fri, 12 Jun 2026 00:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXtTV-0007Q5-3h
 for qemu-riscv@nongnu.org; Fri, 12 Jun 2026 00:26:33 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXtTS-0003WS-SG
 for qemu-riscv@nongnu.org; Fri, 12 Jun 2026 00:26:32 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6919f40a0c8so972251a12.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 21:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781238389; cv=none;
 d=google.com; s=arc-20240605;
 b=asuR33VU4Q0RL+TPLJGq8BP46O88CwlAb/SJVQhRGpCAxoafYF/vQo0E6OzXLGRjJg
 vv+E61hJcXNP7510/e0FiqL9XmD67rcZm4p8I3BX7nX47yvFPzdr6c9zbnHJFv8xflPR
 2evjRmnvsX3qU77cUGwb1rXybi+bViX7a/09kKsdSVC19Uq0s+34ilMs/rfIYCONjs6F
 PfLTWuydyGkzv1fA3KeTH2rqo8bu2AAk9kcVduKSkdfJLPFltnjyABIAWo2Y/HJNYkiK
 YD1ci/lNHKAm00+uIfQkCtz6JESC9E4PqYxJFLD96C1AqxGgm8C+c8o0H1wymDE8qOLH
 lVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=xyO9dPxbFwSx7K3SPOJ/a3N7qc6O/U6m4Cjv/hF1qCU=;
 fh=CCzbA6vBnY6fsvf6slK6ygYGGf9mCNcJeBAyDGH7PHc=;
 b=LvwDLM9VUbwPCIm+j9gGr3knKl+IricUO9k1u4b48phFUrzox6nUE4EJR4Pr2yjJKh
 uA1X1XZsay6e/yBaIc05vEY8ojgAToQT168xDopIzfIRLvVb0bSP8nk6KZQtfc2jMRU3
 U0dsq4ZADW7PvJKQ7FxWvFjuDaDO+siTghCMLDmUHbGLaLSvhKGry2zLt2wMcniaADJ+
 pCPckrHsJBq8q0e6O2JPmuSHBSEk55/oiQiQfnFJhRs0TnCNHA6UK2OS/s4gyXVJGXHd
 tm7iQH1BjZTwUT7/9BJa8XZBigrLzQwsio4i2fQbbfNCL/PtPH2Ew2EkzLMqP2NTOYhP
 Q2mg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781238389; x=1781843189; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xyO9dPxbFwSx7K3SPOJ/a3N7qc6O/U6m4Cjv/hF1qCU=;
 b=iF6DQNgR+Sbc6OxKurrq+alwZtGalunOBhpLSBQnMqbExsUoMccROnMHW4b+FNJ9BT
 sPJMMQiRHbaI/j36Bv27Yq4yGYdqYwM88f1IhcaVlglpW8wzicCFJ6YCZUxXMzD98x2p
 rqaTctmXuox9fqUcAXMxBm+LMiS4JOA8LKCo5bG5rdbcN5MK8wdNApSzpHWJdNzZJrjt
 j9YHFK6BcsdSYaagQ0e6wYnsBabBRkDipneBmKsFQFNBOezXD9fWUDcu19UsDRBqll0E
 S8rA2c1AKcUsYb/XmR0M/hG8XKeEdKX7milrCmoaVFF/Ia0v/4ClgevLVgfSsVfpjbYj
 1cZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781238389; x=1781843189;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xyO9dPxbFwSx7K3SPOJ/a3N7qc6O/U6m4Cjv/hF1qCU=;
 b=N1qnKQ1JDiiLqgGUZXfaw7tpqo9ek6NH4dSTZ8OXQ1/7Pt11mlFmE5SzG1UgjGab97
 rMSDRIo4EEhoLUK1Y7WpTatV2ZQBcIE1LVinE87b7hqmT7zK5tbguqZvx51ZLSvUzma3
 JFsjisZXZK6rl8aNCzHV/+abkuNIaPy0v0OT6Y1msf/zqQG7P5umEF6FWGTbWs4yd1iS
 iBzmS6JWGmNwatcX0zDK+ExZbUtBYgeUDipv6IeOlPBDll1YU/z/QB17Tyirvx7h7u4Q
 VodJkNHmikb2unvkcSzKhjgF2VoCRLbIZE8gdJl83LkcpU4vraeBXenxlJuTxXcNPi56
 VdPg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+jkBu9S2tYrH3afNfzMnn6DoGPxqp9a+7qIl615cqhs+2TcOKkbzPKEjTS4ggG9wqjDUaQ3HbsAV+D@nongnu.org
X-Gm-Message-State: AOJu0YyceCMHVe/zpq4Bc645DeRONOjEq/4w29OR+1Lrw3h52HjWDFr6
 K//gvLueF2IDMq+Rg3Upwki6lrCTWmrZmqMrabBQDfpG040waZdCsD5YX3GwZuKKRQt3Wo5k26P
 +RXCUs3qqOpFKDaCCGp6y6RihVPgbQnM=
X-Gm-Gg: Acq92OE6LuA9ZwdxyhTlbefxSYfB7bK7JnG/ilh2OqTnOLMHl0uq9ad7nGxwpZzd6a9
 g6ZX3rUO30ry67DZJpeFk4DILgdX/S0HFtmRPyp4Lb0oUsSkKIIu2htb4NaDZ41fErbLEFB+u44
 sUpv2fHEab6gtpeoo7ymjeu9+TdscemVyo94tvlD74+2f5Kg/KwiWSXWQ6Hx8nYvHVon4wTy6+6
 JYYAjH1/kQWjN26vO+LkE5sQwow/Wybxt6xwLSnS/JneKlA2XqxHGa22IhR+uiMORXbsf9mlzWt
 GSxESKiGZy39PEgLXJClqxQzuwKKrrBvYbkAmw==
X-Received: by 2002:a05:6402:4343:b0:66b:f0b3:42a7 with SMTP id
 4fb4d7f45d1cf-69378a724b0mr362413a12.24.1781238388947; Thu, 11 Jun 2026
 21:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260611105037.157773-1-max.chou@sifive.com>
 <20260611105037.157773-3-max.chou@sifive.com>
In-Reply-To: <20260611105037.157773-3-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jun 2026 14:26:02 +1000
X-Gm-Features: AVVi8CdGh_d_-efooyLWossEJqbTxPSJ-ncAFhRc8ur_PszrNHUSYAUPYT5j9KI
Message-ID: <CAKmqyKMhhXZ00fjh3xwssdJ7AYUToYAkjVYrBD9ju9KRPpfxNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: rvv: Set mstatus.FS dirty when vector
 FP raises exceptions
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x532.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jun 11, 2026 at 8:51=E2=80=AFPM Max Chou <max.chou@sifive.com> wrot=
e:
>
> According to the RISC-V privileged spec 3.1.6, any instruction that
> modifies FP extension state (FP CSRs including fflags, or f registers)
> must set mstatus.FS to Dirty.  Raising fflags bits is modifying fcsr
> (an FP CSR).
>
> When a vector FP instruction raises a floating-point exception, it
> modifies fflags (an FP CSR), but current implementation was not marking
> mstatus.FS dirty in this case.
>
> Fix the issue by snapshot fflags before the element loop and OR
> MSTATUS_FS into env->mstatus if any new exception bits are set
> afterwards.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 241 +++++++++++++++++++----------------
>  1 file changed, 128 insertions(+), 113 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 89012fccb3..e321ca2616 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -3172,34 +3172,36 @@ static void do_##NAME(void *vd, void *vs1, void *=
vs2, int i,   \
>      *((TD *)vd + HD(i)) =3D OP(s2, s1, &env->fp_status);         \
>  }
>
> -#define GEN_VEXT_VV_ENV(NAME, ESZ)                        \
> -void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
> -                  void *vs2, CPURISCVState *env,          \
> -                  uint32_t desc)                          \
> -{                                                         \
> -    uint32_t vm =3D vext_vm(desc);                          \
> -    uint32_t vl =3D env->vl;                                \
> -    uint32_t total_elems =3D                                \
> -        vext_get_total_elems(env, desc, ESZ);             \
> -    uint32_t vta =3D vext_vta(desc);                        \
> -    uint32_t vma =3D vext_vma(desc);                        \
> -    uint32_t i;                                           \
> -                                                          \
> -    VSTART_CHECK_EARLY_EXIT(env, vl);                     \
> -                                                          \
> -    for (i =3D env->vstart; i < vl; i++) {                  \
> -        if (!vm && !vext_elem_mask(v0, i)) {              \
> -            /* set masked-off elements to 1s */           \
> -            vext_set_elems_1s(vd, vma, i * ESZ,           \
> -                              (i + 1) * ESZ);             \
> -            continue;                                     \
> -        }                                                 \
> -        do_##NAME(vd, vs1, vs2, i, env);                  \
> -    }                                                     \
> -    env->vstart =3D 0;                                      \
> -    /* set tail elements to 1s */                         \
> -    vext_set_elems_1s(vd, vta, vl * ESZ,                  \
> -                      total_elems * ESZ);                 \
> +#define GEN_VEXT_VV_ENV(NAME, ESZ)                           \
> +void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,  \
> +                  CPURISCVState *env, uint32_t desc)         \
> +{                                                            \
> +    uint32_t vm =3D vext_vm(desc);                             \
> +    uint32_t vl =3D env->vl;                                   \
> +    uint32_t total_elems =3D                                   \
> +        vext_get_total_elems(env, desc, ESZ);                \
> +    uint32_t vta =3D vext_vta(desc);                           \
> +    uint32_t vma =3D vext_vma(desc);                           \
> +    uint32_t i;                                              \
> +    FloatExceptionFlags pre_fflag =3D                          \
> +        get_float_exception_flags(&env->fp_status);          \
> +                                                             \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                        \
> +                                                             \
> +    for (i =3D env->vstart; i < vl; i++) {                     \
> +        if (!vm && !vext_elem_mask(v0, i)) {                 \
> +            /* set masked-off elements to 1s */              \
> +            vext_set_elems_1s(vd, vma, i * ESZ,              \
> +                              (i + 1) * ESZ);                \
> +            continue;                                        \
> +        }                                                    \
> +        do_##NAME(vd, vs1, vs2, i, env);                     \
> +    }                                                        \
> +    env->vstart =3D 0;                                         \
> +    /* set tail elements to 1s */                            \
> +    vext_set_elems_1s(vd, vta, vl * ESZ,                     \
> +                      total_elems * ESZ);                    \
> +    riscv_cpu_check_fflags(env, pre_fflag);                  \
>  }
>
>  RVVCALL(OPFVV2, vfadd_vv_h_bf16, OP_UUU_H, H2, H2, H2, bfloat16_add)
> @@ -3219,34 +3221,36 @@ static void do_##NAME(void *vd, uint64_t s1, void=
 *vs2, int i, \
>      *((TD *)vd + HD(i)) =3D OP(s2, (TX1)(T1)s1, &env->fp_status);\
>  }
>
> -#define GEN_VEXT_VF(NAME, ESZ)                            \
> -void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
> -                  void *vs2, CPURISCVState *env,          \
> -                  uint32_t desc)                          \
> -{                                                         \
> -    uint32_t vm =3D vext_vm(desc);                          \
> -    uint32_t vl =3D env->vl;                                \
> -    uint32_t total_elems =3D                                \
> -        vext_get_total_elems(env, desc, ESZ);             \
> -    uint32_t vta =3D vext_vta(desc);                        \
> -    uint32_t vma =3D vext_vma(desc);                        \
> -    uint32_t i;                                           \
> -                                                          \
> -    VSTART_CHECK_EARLY_EXIT(env, vl);                     \
> -                                                          \
> -    for (i =3D env->vstart; i < vl; i++) {                  \
> -        if (!vm && !vext_elem_mask(v0, i)) {              \
> -            /* set masked-off elements to 1s */           \
> -            vext_set_elems_1s(vd, vma, i * ESZ,           \
> -                              (i + 1) * ESZ);             \
> -            continue;                                     \
> -        }                                                 \
> -        do_##NAME(vd, s1, vs2, i, env);                   \
> -    }                                                     \
> -    env->vstart =3D 0;                                      \
> -    /* set tail elements to 1s */                         \
> -    vext_set_elems_1s(vd, vta, vl * ESZ,                  \
> -                      total_elems * ESZ);                 \
> +#define GEN_VEXT_VF(NAME, ESZ)                                   \
> +void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,    \
> +                  CPURISCVState *env, uint32_t desc)             \
> +{                                                                \
> +    uint32_t vm =3D vext_vm(desc);                                 \
> +    uint32_t vl =3D env->vl;                                       \
> +    uint32_t total_elems =3D                                       \
> +        vext_get_total_elems(env, desc, ESZ);                    \
> +    uint32_t vta =3D vext_vta(desc);                               \
> +    uint32_t vma =3D vext_vma(desc);                               \
> +    uint32_t i;                                                  \
> +    FloatExceptionFlags pre_fflag =3D                              \
> +        get_float_exception_flags(&env->fp_status);              \
> +                                                                 \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                            \
> +                                                                 \
> +    for (i =3D env->vstart; i < vl; i++) {                         \
> +        if (!vm && !vext_elem_mask(v0, i)) {                     \
> +            /* set masked-off elements to 1s */                  \
> +            vext_set_elems_1s(vd, vma, i * ESZ,                  \
> +                              (i + 1) * ESZ);                    \
> +            continue;                                            \
> +        }                                                        \
> +        do_##NAME(vd, s1, vs2, i, env);                          \
> +    }                                                            \
> +    env->vstart =3D 0;                                             \
> +    /* set tail elements to 1s */                                \
> +    vext_set_elems_1s(vd, vta, vl * ESZ,                         \
> +                      total_elems * ESZ);                        \
> +    riscv_cpu_check_fflags(env, pre_fflag);                      \
>  }
>
>  RVVCALL(OPFVF2, vfadd_vf_h_bf16, OP_UUU_H, H2, H2, bfloat16_add)
> @@ -3993,35 +3997,38 @@ static void do_##NAME(void *vd, void *vs2, int i,=
      \
>      *((TD *)vd + HD(i)) =3D OP(s2, &env->fp_status);     \
>  }
>
> -#define GEN_VEXT_V_ENV(NAME, ESZ)                      \
> -void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
> -                  CPURISCVState *env, uint32_t desc)   \
> -{                                                      \
> -    uint32_t vm =3D vext_vm(desc);                       \
> -    uint32_t vl =3D env->vl;                             \
> -    uint32_t total_elems =3D                             \
> -        vext_get_total_elems(env, desc, ESZ);          \
> -    uint32_t vta =3D vext_vta(desc);                     \
> -    uint32_t vma =3D vext_vma(desc);                     \
> -    uint32_t i;                                        \
> -                                                       \
> -    VSTART_CHECK_EARLY_EXIT(env, vl);                  \
> -                                                       \
> -    if (vl =3D=3D 0) {                                     \
> -        return;                                        \
> -    }                                                  \
> -    for (i =3D env->vstart; i < vl; i++) {               \
> -        if (!vm && !vext_elem_mask(v0, i)) {           \
> -            /* set masked-off elements to 1s */        \
> -            vext_set_elems_1s(vd, vma, i * ESZ,        \
> -                              (i + 1) * ESZ);          \
> -            continue;                                  \
> -        }                                              \
> -        do_##NAME(vd, vs2, i, env);                    \
> -    }                                                  \
> -    env->vstart =3D 0;                                   \
> -    vext_set_elems_1s(vd, vta, vl * ESZ,               \
> -                      total_elems * ESZ);              \
> +#define GEN_VEXT_V_ENV(NAME, ESZ)                            \
> +void HELPER(NAME)(void *vd, void *v0, void *vs2,             \
> +                  CPURISCVState *env, uint32_t desc)         \
> +{                                                            \
> +    uint32_t vm =3D vext_vm(desc);                             \
> +    uint32_t vl =3D env->vl;                                   \
> +    uint32_t total_elems =3D                                   \
> +        vext_get_total_elems(env, desc, ESZ);                \
> +    uint32_t vta =3D vext_vta(desc);                           \
> +    uint32_t vma =3D vext_vma(desc);                           \
> +    uint32_t i;                                              \
> +    FloatExceptionFlags pre_fflag =3D                          \
> +        get_float_exception_flags(&env->fp_status);          \
> +                                                             \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                        \
> +                                                             \
> +    if (vl =3D=3D 0) {                                           \
> +        return;                                              \
> +    }                                                        \
> +    for (i =3D env->vstart; i < vl; i++) {                     \
> +        if (!vm && !vext_elem_mask(v0, i)) {                 \
> +            /* set masked-off elements to 1s */              \
> +            vext_set_elems_1s(vd, vma, i * ESZ,              \
> +                              (i + 1) * ESZ);                \
> +            continue;                                        \
> +        }                                                    \
> +        do_##NAME(vd, vs2, i, env);                          \
> +    }                                                        \
> +    env->vstart =3D 0;                                         \
> +    vext_set_elems_1s(vd, vta, vl * ESZ,                     \
> +                      total_elems * ESZ);                    \
> +    riscv_cpu_check_fflags(env, pre_fflag);                  \
>  }
>
>  RVVCALL(OPFVV1, vfsqrt_v_h, OP_UU_H, H2, H2, float16_sqrt)
> @@ -4610,6 +4617,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
>      uint32_t vta_all_1s =3D vext_vta_all_1s(desc);              \
>      uint32_t vma =3D vext_vma(desc);                            \
>      uint32_t i;                                               \
> +    FloatExceptionFlags pre_fflag =3D                           \
> +        get_float_exception_flags(&env->fp_status);           \
>                                                                \
>      VSTART_CHECK_EARLY_EXIT(env, vl);                         \
>                                                                \
> @@ -4636,6 +4645,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
>              vext_set_elem_mask(vd, i, 1);                     \
>          }                                                     \
>      }                                                         \
> +    riscv_cpu_check_fflags(env, pre_fflag);                   \
>  }
>
>  GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h_bf16, uint16_t, H2, bfloat16_eq_quiet)
> @@ -4653,6 +4663,8 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, =
void *vs2,       \
>      uint32_t vta_all_1s =3D vext_vta_all_1s(desc);                    \
>      uint32_t vma =3D vext_vma(desc);                                  \
>      uint32_t i;                                                     \
> +    FloatExceptionFlags pre_fflag =3D                                 \
> +        get_float_exception_flags(&env->fp_status);                 \
>                                                                      \
>      VSTART_CHECK_EARLY_EXIT(env, vl);                               \
>                                                                      \
> @@ -4678,6 +4690,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, =
void *vs2,       \
>              vext_set_elem_mask(vd, i, 1);                           \
>          }                                                           \
>      }                                                               \
> +    riscv_cpu_check_fflags(env, pre_fflag);                         \
>  }
>
>  GEN_VEXT_CMP_VF(vmfeq_vf_h_bf16, uint16_t, H2, bfloat16_eq_quiet)
> @@ -5151,34 +5164,36 @@ GEN_VEXT_RED(vwredsumu_vs_h, uint32_t, uint16_t, =
H4, H2, DO_ADD)
>  GEN_VEXT_RED(vwredsumu_vs_w, uint64_t, uint32_t, H8, H4, DO_ADD)
>
>  /* Vector Single-Width Floating-Point Reduction Instructions */
> -#define GEN_VEXT_FRED(NAME, TD, TS2, HD, HS2, OP)          \
> -void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
> -                  void *vs2, CPURISCVState *env,           \
> -                  uint32_t desc)                           \
> -{                                                          \
> -    uint32_t vm =3D vext_vm(desc);                           \
> -    uint32_t vl =3D env->vl;                                 \
> -    uint32_t esz =3D sizeof(TD);                             \
> -    uint32_t vlenb =3D simd_maxsz(desc);                     \
> -    uint32_t vta =3D vext_vta(desc);                         \
> -    uint32_t i;                                            \
> -    TD s1 =3D  *((TD *)vs1 + HD(0));                         \
> -                                                           \
> -    VSTART_CHECK_EARLY_EXIT(env, vl);                      \
> -                                                           \
> -    for (i =3D env->vstart; i < vl; i++) {                   \
> -        TS2 s2 =3D *((TS2 *)vs2 + HS2(i));                   \
> -        if (!vm && !vext_elem_mask(v0, i)) {               \
> -            continue;                                      \
> -        }                                                  \
> -        s1 =3D OP(s1, (TD)s2, &env->fp_status);              \
> -    }                                                      \
> -    if (vl > 0) {                                          \
> -        *((TD *)vd + HD(0)) =3D s1;                          \
> -    }                                                      \
> -    env->vstart =3D 0;                                       \
> -    /* set tail elements to 1s */                          \
> -    vext_set_elems_1s(vd, vta, esz, vlenb);                \
> +#define GEN_VEXT_FRED(NAME, TD, TS2, HD, HS2, OP)            \
> +void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,  \
> +                  CPURISCVState *env, uint32_t desc)         \
> +{                                                            \
> +    uint32_t vm =3D vext_vm(desc);                             \
> +    uint32_t vl =3D env->vl;                                   \
> +    uint32_t esz =3D sizeof(TD);                               \
> +    uint32_t vlenb =3D simd_maxsz(desc);                       \
> +    uint32_t vta =3D vext_vta(desc);                           \
> +    uint32_t i;                                              \
> +    FloatExceptionFlags pre_fflag =3D                          \
> +        get_float_exception_flags(&env->fp_status);          \
> +    TD s1 =3D  *((TD *)vs1 + HD(0));                           \
> +                                                             \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                        \
> +                                                             \
> +    for (i =3D env->vstart; i < vl; i++) {                     \
> +        TS2 s2 =3D *((TS2 *)vs2 + HS2(i));                     \
> +        if (!vm && !vext_elem_mask(v0, i)) {                 \
> +            continue;                                        \
> +        }                                                    \
> +        s1 =3D OP(s1, (TD)s2, &env->fp_status);                \
> +    }                                                        \
> +    if (vl > 0) {                                            \
> +        *((TD *)vd + HD(0)) =3D s1;                            \
> +    }                                                        \
> +    env->vstart =3D 0;                                         \
> +    /* set tail elements to 1s */                            \
> +    vext_set_elems_1s(vd, vta, esz, vlenb);                  \
> +    riscv_cpu_check_fflags(env, pre_fflag);                  \
>  }
>
>  /* Unordered sum */
> --
> 2.43.7
>
>

