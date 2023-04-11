Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm5Za-0006so-RM
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 00:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5ZY-0006sQ-C6; Tue, 11 Apr 2023 00:25:36 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5ZW-0002dQ-LE; Tue, 11 Apr 2023 00:25:36 -0400
Received: by mail-ua1-x931.google.com with SMTP id t20so17735627uaw.5;
 Mon, 10 Apr 2023 21:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681187133; x=1683779133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIYWjeHW3XtFQw8dELwy989yPonLy4SdKK+4E6HZr/8=;
 b=hh8+VTC8hBC9Gc2xUFNv4JFh4OUHZwUGbOh+ZwlZgW+7DtbwDhSCoKYoxFBDln6X/m
 +XrQZszAp+Z+bsCee3faKD9iheADw/f7CgL4h6lVzPjjR0FYfKERTg+Q/HAPQF182EJz
 mqeYcCzho9MqoTZvYaB/tT2p9el2coeeWRv2qXS4HuuXVmzk/bnY6JJMiEJKatOQ2riP
 B12iC8sb6LwSfUfj7krHLNbyCgheqf/xgjcPj44Nzm2YclmPet4x3CQuQSTBzguzoxzE
 ucdsQd6oG0WGMT0IJBXKFacN/LTIBn5ji7W20zar5kP3830q8WBU6CeTk8Y8CKeBgh8M
 2APw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681187133; x=1683779133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIYWjeHW3XtFQw8dELwy989yPonLy4SdKK+4E6HZr/8=;
 b=MvISgy1a6ZG1i0FhUj5bq8d2R2m4fvoKjuSJDi0CCxGGJlwwullRcGMQSHqutgNruJ
 r3FOmoTwohTOKATcure5TELvd+DdDz7NuoWWmTAljjIDVS41zaUsZFF69BU7q/6BQ/lk
 DXNuy2kS/kXlW6lKYyBpHSkO5FFOi32ygG9rev+1AFKb98wbRQibMJ/cjWlfgNcwu43f
 II1ZQLODyxlAtYdm1cLMH1CXLjEqB65n+4Yjb9xCMtDqJIwSKWTUfQxZN8hgP5nlfq91
 /OVt3o5GtNKmSwRJfxYsfVNKq/0BCU5QlaQKRILQwYHlQV3ijDcfS85/SIZXVaZCNDW9
 It8A==
X-Gm-Message-State: AAQBX9d/0/+WLQibYsi9fHhk9VGBF0z528vX+KkW7ACiKPjtjnBDMU+L
 5yPGc+GZRiwIJP57ojnEHsnS83+FkzVN/QaUstK462GIJ4s=
X-Google-Smtp-Source: AKy350bFzw3wGte6WZ+A66IMo+fWrzHa7PBW95dNNZ/9BWiYAbwyHgt4UkfTPygb4EIJnCuFxv1t4p3uE2PzKkIbu4o=
X-Received: by 2002:ab0:5b8c:0:b0:765:c225:c914 with SMTP id
 y12-20020ab05b8c000000b00765c225c914mr8047850uae.1.1681187133201; Mon, 10 Apr
 2023 21:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-18-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-18-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 14:25:07 +1000
Message-ID: <CAKmqyKMVHFLGBagf4op2+9dnSTuPhKnhiG961XBcJL7x0oODRw@mail.gmail.com>
Subject: Re: [PATCH v6 17/25] target/riscv: Check SUM in the correct register
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 04:25:36 -0000

On Sat, Mar 25, 2023 at 10:42=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Table 9.5 "Effect of MPRV..." specifies that MPV=3D1 uses VS-level
> vsstatus.SUM instead of HS-level sstatus.SUM.
>
> For HLV/HSV instructions, the HS-level register does not apply, but
> the VS-level register presumably does, though this is not mentioned
> explicitly in the manual.  However, it matches the behavior for MPV.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 12 ++++++++----
>  target/riscv/op_helper.c  |  6 +++++-
>  2 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 6c42f9c6fd..0017ecbf37 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -42,11 +42,16 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifet=
ch)
>
>      /* All priv -> mmu_idx mapping are here */
>      if (!ifetch) {
> -        if (mode =3D=3D PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) =
{
> +        uint64_t status =3D env->mstatus;
> +
> +        if (mode =3D=3D PRV_M && get_field(status, MSTATUS_MPRV)) {
>              mode =3D get_field(env->mstatus, MSTATUS_MPP);
>              virt =3D get_field(env->mstatus, MSTATUS_MPV);
> +            if (virt) {
> +                status =3D env->vsstatus;
> +            }
>          }
> -        if (mode =3D=3D PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
> +        if (mode =3D=3D PRV_S && get_field(status, MSTATUS_SUM)) {
>              mode =3D MMUIdx_S_SUM;
>          }
>      }
> @@ -838,8 +843,7 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
>          }
>          widened =3D 2;
>      }
> -    /* status.SUM will be ignored if execute on background */
> -    sum =3D mmuidx_sum(mmu_idx) || use_background || is_debug;
> +    sum =3D mmuidx_sum(mmu_idx) || is_debug;
>      switch (vm) {
>      case VM_1_10_SV32:
>        levels =3D 2; ptidxbits =3D 10; ptesize =3D 4; break;
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index db7252e09d..93d4ae8b3e 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -437,7 +437,11 @@ static int check_access_hlsv(CPURISCVState *env, boo=
l x, uintptr_t ra)
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
>      }
>
> -    return get_field(env->hstatus, HSTATUS_SPVP) | MMU_2STAGE_BIT;
> +    int mode =3D get_field(env->hstatus, HSTATUS_SPVP);
> +    if (!x && mode =3D=3D PRV_S && get_field(env->vsstatus, MSTATUS_SUM)=
) {
> +        mode =3D MMUIdx_S_SUM;
> +    }
> +    return mode | MMU_2STAGE_BIT;
>  }
>
>  target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
> --
> 2.34.1
>
>

