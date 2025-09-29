Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1597FCAC5B5
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 00:51:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v326s-0000u7-VX; Sun, 28 Sep 2025 20:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v326o-0000qw-Tj
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:51:19 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v326e-00049J-VC
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:51:17 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-62fca01f0d9so7890481a12.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Sep 2025 17:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759107065; x=1759711865; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqHSZsWWVFavEKjeTZX/1sR76kXRoNP9dSpFOjh1RSA=;
 b=FR++F+UTnTrJ467+Yi1CEH7iYT0JcIidN/a/RYu042vji+WnOr66HYlIV2UsxVjoan
 +u5MXMofXeKBXkNuyX+CWHPkYq8XSLerhzKGDIf9ehXA1KGB0SGPddJQNU/T97xLvlqm
 XKgAug0AZ1/x8rIx55dSNY/d5HIiWZ2caeemUlslDGMjc8yN2gp59owq298RC4jIgFNY
 HJ+rSO9DkjyDf7gehcxrgz+9dWs+OfWS9IKQW9ptkJqTZJMRACeH9s3OpnZFwkDSX1Dr
 djWZgkKZHS9hqosm96TfocgC84Ntl2sj7D3jgVhS2kD2C24gS+5Jcg/sNzf8Tf/VCKZN
 s3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759107065; x=1759711865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqHSZsWWVFavEKjeTZX/1sR76kXRoNP9dSpFOjh1RSA=;
 b=L+YMhqHyJB4l4ihlxU4Ie8/lO+Y8fhXDswNn7BbgfwUuH7PndWQ37EnOWp9G024Xil
 L++vBFFU9lhcK5RiG1KJU7tPojdgXNA7Wvf4oCijYJFp9i8RmQ2ujzvXJZc2j+MFBcJX
 h9pDS+jp+Ao5Z3mLV1huMj3uQgvNVW0dSj0XWqmGme3f9vIyv/VmbEJL+2w7vr8Rrpy1
 owS6aJEq1lwaEpWRQVnPh77U/bnydM4H44Ml2GcKoM0UQE6+6Hy4N40TtW2/G9aWBK4y
 O59yruSXbycfxRNAV2Rl3oCOhzOPLlyRDUNddHKVocSaG7SpClk7p/op6JhcWeBofCPG
 8CCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEKj//ade54BHggYfVGTqsqfOnEWpIYlhcTS/JaMiEwqHhj/YZ46l94ABR9Qt0Um7K8qXQ6+JCiPYN@nongnu.org
X-Gm-Message-State: AOJu0YysQD9yE3OmBwoR8ko/0uTIdhsJWNHeePKd0/GlTJoPI9Tgp8Yx
 PUXS0T6x6uA5qu8yXwWrEreEBVkYnyRp77lDhVA5yknOzJR6Ksl/lcMqVl3ubMLvK48fDQkF1x3
 azZUF4jAht9aOcdDJ6NEe7zj44W3KIJI=
X-Gm-Gg: ASbGncsplV2ltXtyMTidEInr7fG5q/D1guU8kRldc2VjfkvoFDLKCiqeNBDmQu9/Qo4
 QS8b8WCqaCXA6E7U7/7JNmYPbGTi18MHjEpG1pnXD0oh4r/+4TcumkwzOWR67KEcErM51fiRB7D
 Asx8s9uZ0sJ8OaSHwzOvfqFjmpogn/9Yili3kPXsP8V017my6DRJFwFYIZvnaS2MqJdri7B1siy
 Yz4txt3KXWRdP8i6xAi8l0D+qBlTrLuGNekL+qTkRntCFfj
X-Google-Smtp-Source: AGHT+IGkAucT3rgQKf+KFwG6ma6TjDUXa1Kd95n0wLbdvPHwKL4kGhdMcaIncsmzuE0ujYSa/ne+qRwQHQEJhbv9Yew=
X-Received: by 2002:a17:907:971b:b0:b3c:31c2:b57d with SMTP id
 a640c23a62f3a-b3c31c2be2bmr526634166b.55.1759107065148; Sun, 28 Sep 2025
 17:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250924074818.230010-1-jim.shu@sifive.com>
 <20250924074818.230010-4-jim.shu@sifive.com>
In-Reply-To: <20250924074818.230010-4-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 10:50:38 +1000
X-Gm-Features: AS18NWDXh-zggmejBt2yP7NGvTGg3uCdnwbQrYMUNQp208JJy1wGOaHuUR80i2Y
Message-ID: <CAKmqyKPCRrk61rz5hqCcbk44=K6OLzn=eVgWpTVLHY6JzjqyyA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] target/riscv: Fix ssamoswap error handling
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, Sep 24, 2025 at 5:50=E2=80=AFPM Jim Shu <jim.shu@sifive.com> wrote:
>
> Follow the RISC-V CFI v1.0 spec [1] to fix the exception type
> when ssamoswap is disabled by xSSE.
>
> [1] RISC-V CFI spec v1.0, ch2.7 Atomic Swap from a Shadow Stack Location
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                         |  5 ++
>  target/riscv/insn_trans/trans_rvzicfiss.c.inc |  8 +++
>  target/riscv/op_helper.c                      | 49 +++++++++++++++++++
>  3 files changed, 62 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index f712b1c368..c82bacdc39 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1284,3 +1284,8 @@ DEF_HELPER_4(vgmul_vv, void, ptr, ptr, env, i32)
>  DEF_HELPER_5(vsm4k_vi, void, ptr, ptr, i32, env, i32)
>  DEF_HELPER_4(vsm4r_vv, void, ptr, ptr, env, i32)
>  DEF_HELPER_4(vsm4r_vs, void, ptr, ptr, env, i32)
> +
> +/* CFI (zicfiss) helpers */
> +#ifndef CONFIG_USER_ONLY
> +DEF_HELPER_1(ssamoswap_disabled, void, env)
> +#endif
> diff --git a/target/riscv/insn_trans/trans_rvzicfiss.c.inc b/target/riscv=
/insn_trans/trans_rvzicfiss.c.inc
> index 45686af4d6..f4a1c12ca0 100644
> --- a/target/riscv/insn_trans/trans_rvzicfiss.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzicfiss.c.inc
> @@ -91,7 +91,11 @@ static bool trans_ssamoswap_w(DisasContext *ctx, arg_a=
moswap_w *a)
>      }
>
>      if (!ctx->bcfi_enabled) {
> +#ifndef CONFIG_USER_ONLY
> +        gen_helper_ssamoswap_disabled(tcg_env);
> +#else
>          return false;
> +#endif
>      }
>
>      TCGv dest =3D dest_gpr(ctx, a->rd);
> @@ -116,7 +120,11 @@ static bool trans_ssamoswap_d(DisasContext *ctx, arg=
_amoswap_w *a)
>      }
>
>      if (!ctx->bcfi_enabled) {
> +#ifndef CONFIG_USER_ONLY
> +        gen_helper_ssamoswap_disabled(tcg_env);
> +#else
>          return false;
> +#endif
>      }
>
>      TCGv dest =3D dest_gpr(ctx, a->rd);
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 110292e84d..8382aa94cb 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -717,4 +717,53 @@ target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, =
target_ulong addr)
>      return cpu_ldl_code_mmu(env, addr, oi, ra);
>  }
>
> +void helper_ssamoswap_disabled(CPURISCVState *env)
> +{
> +    int exception =3D RISCV_EXCP_ILLEGAL_INST;
> +
> +    /*
> +     * Here we follow the RISC-V CFI spec [1] to implement the exception=
 type
> +     * of ssamoswap* instruction.
> +     *
> +     * [1] RISC-V CFI spec v1.0, ch2.7 Atomic Swap from a Shadow Stack L=
ocation
> +     *
> +     * Note: We have already checked some conditions in trans_* function=
s:
> +     *   1. The effective priv mode is not M-mode.
> +     *   2. The xSSE specific to the effictive priv mode is disabled.
> +     */
> +    if (!get_field(env->menvcfg, MENVCFG_SSE)) {
> +        /*
> +         * Disabled M-mode SSE always trigger illegal instruction when
> +         * current priv mode is not M-mode.
> +         */
> +        exception =3D RISCV_EXCP_ILLEGAL_INST;
> +        goto done;
> +    }
> +
> +    if (!riscv_has_ext(env, RVS)) {
> +        /* S-mode is not implemented */
> +        exception =3D RISCV_EXCP_ILLEGAL_INST;
> +        goto done;
> +    } else if (env->virt_enabled) {
> +        /*
> +         * VU/VS-mode with disabled xSSE will trigger the virtual instru=
ction
> +         * exception.
> +         */
> +        exception =3D RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        goto done;
> +    } else {
> +        /*
> +         * U-mode with disabled S-mode SSE will trigger the illegal inst=
ruction
> +         * exception.
> +         *
> +         * Note: S-mode is already handled in the disabled M-mode SSE ca=
se.
> +         */
> +        exception =3D RISCV_EXCP_ILLEGAL_INST;
> +        goto done;
> +    }
> +
> +done:
> +    riscv_raise_exception(env, exception, GETPC());
> +}
> +
>  #endif /* !CONFIG_USER_ONLY */
> --
> 2.43.0
>
>

