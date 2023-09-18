Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5754FCD13CF
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 01:47:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi3Lq-0004Go-MK; Sun, 17 Sep 2023 21:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3Lp-0004GK-DX; Sun, 17 Sep 2023 21:47:01 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3Ln-0002Gh-LI; Sun, 17 Sep 2023 21:47:00 -0400
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-4526d872941so197471137.1; 
 Sun, 17 Sep 2023 18:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695001618; x=1695606418; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MlcNtrNocxfjIjnjGi7NLFwjeyFYzBqYvKXZACKKShk=;
 b=ZQ5XSfD6ap2bwSiD8icTafesMpcpoNN2QMgFE5Js10aQ4EyOWfB/lYfJAEL7WN2sqy
 k+9HEHZipQm8nRnZ42qLlDajHtnXQmWiU3jNFhGZ6r+f0Z20Oe44q5EDivEu3B7Gvr2N
 BbujdOL3A2HImPAZIaaL7QgmusHHgQKuc+swP1niVF3lCKPnJGMjCS2BM0gr1a313ZEp
 AmEU/JAu7HyYvvrwIfO7in/uqMmua2TGWRuDF/hU4QbLmlVVvRvkKoHaZP+IKB1Bs2pF
 yBQblq42Lognwyj6CY4kDbEDwWwB2gxrmS7HB+oIEHkVdAcyz5+QRXnlSE7MPn7zTUvu
 ZGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695001618; x=1695606418;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MlcNtrNocxfjIjnjGi7NLFwjeyFYzBqYvKXZACKKShk=;
 b=a+o6CK8PikXyEpFg1zvoB6HCsee1XqBoPEFlqE8k5CcRbzCKMshs89qggNv9+/o0BX
 KO1aszWkA6EkxDzUgY4E8lx409zTBX/YCl/iFoWtFbqDGEK2a2R8qCGgT7grAVnvYD3w
 G3rM6qv5k11koGytMmZ4gZfZBN4HIXRPAmyo0TuEEeZN9PXsV4Eg4FXDqt9dCupVt+eQ
 yR7FvoP+c+1QN+IqdFIU3AW6Es9R8m8rWT6dJD7pa1P+v4YAlq9Zsqj6BgqMwh4DjDR7
 sWsjLjcOtl03m2XxnoFW0Np28TO2gGVm7xIR3jKuf+xUv09aiCIFj5TcUxVrOH6nvQL5
 jcRw==
X-Gm-Message-State: AOJu0Yy8QT9Mq5yiAKgUAMVbuYNiRN8zgjrhgSfBCr1sDB63kHkoB5yk
 f892UkTmKRD+lI2XFyueIeM6muL9LqGGifQhsK4=
X-Google-Smtp-Source: AGHT+IElvLMf9lkfeTzVPKLbnNWMSyCeqlcP04Y8eDlN0CKpZWyGGJpTPHYylohXOOiIfkR4ZJWegB6ldH7OFRyKxLE=
X-Received: by 2002:a05:6102:456:b0:450:8e58:2de4 with SMTP id
 e22-20020a056102045600b004508e582de4mr6732137vsq.7.1695001617869; Sun, 17 Sep
 2023 18:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230908182640.1102270-1-baturo.alexey@gmail.com>
 <20230908182640.1102270-7-baturo.alexey@gmail.com>
In-Reply-To: <20230908182640.1102270-7-baturo.alexey@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2023 11:46:31 +1000
Message-ID: <CAKmqyKMc_ghCSVqN7NKibhZtnneCFUc4dqDO3OnUpna_Wq7y2w@mail.gmail.com>
Subject: Re: [RFC v1 6/8] target/riscv: Add functions to calculate current N
 masked bits for pointer masking
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 zhiwei_liu@linux.alibaba.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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

On Sat, Sep 9, 2023 at 5:37=E2=80=AFAM Alexey Baturo <baturo.alexey@gmail.c=
om> wrote:
>
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---
>  target/riscv/cpu.h        |  6 ++--
>  target/riscv/cpu_helper.c | 58 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 17d0088cb4..c87c4f26a2 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -91,11 +91,9 @@ typedef enum {
>  /* Enum holds maximum for N bits to be ignored depending on privilege le=
vel */
>  typedef enum {
>      PM_BARE_N_BITS =3D 16,
> -    PM_SV32_N_BITS =3D 0,
>      PM_SV39_N_BITS =3D 25,
>      PM_SV48_N_BITS =3D 16,
>      PM_SV57_N_BITS =3D 7,
> -    PM_SV64_N_BITS =3D 0,
>  } RISCVZjpmMaxNBits;

Didn't you just add this? Why remove parts from it

Alistair

>
>  #define MMU_USER_IDX 3
> @@ -633,6 +631,10 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu,=
 target_ulong vtype)
>  void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>                            uint64_t *cs_base, uint32_t *pflags);
>
> +void riscv_cpu_update_mask(CPURISCVState *env);
> +RISCVZjpmMaxNBits riscv_cpu_pm_get_n_bits(int satp_mode, int priv_mode);
> +bool riscv_cpu_pm_check_applicable(CPURISCVState *env, int priv_mode);
> +
>  RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>                             target_ulong *ret_value,
>                             target_ulong new_value, target_ulong write_ma=
sk);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b3871b0a28..6e68b2fc27 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -144,6 +144,64 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr =
*pc,
>      *pflags =3D flags;
>  }
>
> +/*
> + * Curernt Zjpm v0.6.1 spec doesn't strictly specify the exact value of =
N bits.
> + * It allows it to be dependent on both translation mode and priv level.
> + * For now let's ignore priv mode and always return max available value.
> + */
> +RISCVZjpmMaxNBits riscv_cpu_pm_get_n_bits(int satp_mode, int priv_mode)
> +{
> +    switch (satp_mode) {
> +    case VM_1_10_MBARE:
> +        return PM_BARE_N_BITS;
> +    case VM_1_10_SV39:
> +        return PM_SV39_N_BITS;
> +    case VM_1_10_SV48:
> +        return PM_SV48_N_BITS;
> +    case VM_1_10_SV57:
> +        return PM_SV57_N_BITS;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +/* For current priv level check if pointer masking should be applied */
> +bool riscv_cpu_pm_check_applicable(CPURISCVState *env, int priv_mode)
> +{
> +    /* checks if appropriate extension is present and enable bit is set =
*/
> +    switch (priv_mode) {
> +    case PRV_M:
> +        return riscv_cpu_cfg(env)->ext_smmjpm && env->mseccfg & MSECCFG_=
MPMEN;
> +    case PRV_S:
> +        return riscv_cpu_cfg(env)->ext_smnjpm && env->menvcfg & MENVCFG_=
SPMEN;
> +    case PRV_U:
> +        return riscv_cpu_cfg(env)->ext_ssnjpm && env->senvcfg & SENVCFG_=
UPMEN;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    g_assert_not_reached();
> +    return false;
> +}
> +
> +void riscv_cpu_update_mask(CPURISCVState *env)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    int priv_mode =3D cpu_address_mode(env);
> +    int satp_mode =3D 0;
> +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> +        satp_mode =3D get_field(env->satp, SATP32_MODE);
> +    } else {
> +        satp_mode =3D get_field(env->satp, SATP64_MODE);
> +    }
> +    RISCVZjpmMaxNBits n_bits =3D riscv_cpu_pm_get_n_bits(satp_mode, priv=
_mode);
> +    /* in bare mode address is not sign extended */
> +    env->pm_signext =3D (satp_mode !=3D VM_1_10_MBARE);
> +    /* if pointer masking is applicable set env variable */
> +    bool applicable =3D riscv_cpu_pm_check_applicable(env, priv_mode);
> +    env->pm_n_bits =3D applicable ? n_bits : 0;
> +#endif
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>
>  /*
> --
> 2.34.1
>
>

