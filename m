Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm581-00089z-QT
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 23:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm580-00089Z-Vi; Mon, 10 Apr 2023 23:57:08 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm57z-0004Zk-8T; Mon, 10 Apr 2023 23:57:08 -0400
Received: by mail-vs1-xe30.google.com with SMTP id z13so6395687vss.1;
 Mon, 10 Apr 2023 20:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681185425; x=1683777425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B0ZlY37LiUu6IjOiQKK4nT1Lz2CUiLNEjUKwboMAXcE=;
 b=HCSeFgtDf0duhIireF6PJcyN91Rq1O4Vy772/oM9Pa8coEyGXjtbNBUPjpmGe0HWqM
 FOae25xlA8Jd2iO4Rl6Z6/8SmYt1NlqVfzxJUEXBLVX2v3YGUTZ6QNfCctq57fgj8ymj
 i21TFtod//U4R4dOWJ3fZuLgsABNmzKhbD3/dBP4gT2d7u01j69kYcEzVq6vJxQ+Heia
 kv1XTeEiwTZQq7hpNINVqiLRr3bn3Thu611zoC42H39zbJbtm8JAnYHw2DOvxyh1gMI6
 KTXkEg+v7qrHeZfzYD+x6n0Whu4i3FQCzid2g2ZlsscXjkfYAFt5KNXso65+ES4n4d/7
 dlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681185425; x=1683777425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B0ZlY37LiUu6IjOiQKK4nT1Lz2CUiLNEjUKwboMAXcE=;
 b=k9+XAn1aXx/Afi6CkV2RYLI69z5InbhEU0Ki0GbAIuh1UnXrWE4YLlMm2pfsXdQ2Ql
 Dhk8OuYMnAH0QG+Lf4mn+ziuxP2xbxX4IOgWnc7j2FkpEPH7ME80xyrrcqbosjRxa4NU
 cRExhrbouggsImH4HtHejucGzS+AP9E4lluXmrcf4gqPOo4Lz2fWJS8v5qfLmFSwvFoF
 rq1EqdOhoe2T/cFlhWnxXP/u9fJBytiW9z71YB6OAiZ0xyVpPNmSJwgzdXXfwJeln6PR
 3aIUDd5YztLcog0vdFGu0eKmiNryph5ueo0LfP6+E3Nmn98a25FXqrHkVEMK8prvm139
 6Jqw==
X-Gm-Message-State: AAQBX9cS5dwO2a7ySSuMgo7n+UcXsgOhItP94mQQ3gLcZBjYyO1A4bgq
 IKEyjpB/RIfth/T8EzXVx471604TqkAuBpWkZr4=
X-Google-Smtp-Source: AKy350Y5u0AS/TdxKA9ynoLY6id6CSabrzlpCkaXuXGpqW0g+seVZdN8vSG5o7Vx6SSQDRf2TUHAKBF2uFPhSmE3R3k=
X-Received: by 2002:a67:d38e:0:b0:425:d39f:3882 with SMTP id
 b14-20020a67d38e000000b00425d39f3882mr5811225vsj.3.1681185425544; Mon, 10 Apr
 2023 20:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-16-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-16-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 13:56:39 +1000
Message-ID: <CAKmqyKPgkaVftSE4Mr45fKgLQZG8hOaWjxGyBvBTJdZtDJFmzw@mail.gmail.com>
Subject: Re: [PATCH v6 15/25] target/riscv: Move hstatus.spvp check to
 check_access_hlsv
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 03:57:09 -0000

On Sat, Mar 25, 2023 at 9:57=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The current cpu_mmu_index value is really irrelevant to
> the HLV/HSV lookup.  Provide the correct priv level directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 8 +-------
>  target/riscv/op_helper.c  | 2 +-
>  2 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 8a124888cd..0adfd4a12b 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -784,12 +784,6 @@ static int get_physical_address(CPURISCVState *env, =
hwaddr *physical,
>          use_background =3D true;
>      }
>
> -    /* MPRV does not affect the virtual-machine load/store
> -       instructions, HLV, HLVX, and HSV. */
> -    if (mmuidx_2stage(mmu_idx)) {
> -        mode =3D get_field(env->hstatus, HSTATUS_SPVP);
> -    }
> -
>      if (first_stage =3D=3D false) {
>          /* We are in stage 2 translation, this is similar to stage 1. */
>          /* Stage 2 is always taken as U-mode */
> @@ -1251,7 +1245,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>      /* MPRV does not affect the virtual-machine load/store
>         instructions, HLV, HLVX, and HSV. */
>      if (mmuidx_2stage(mmu_idx)) {
> -        mode =3D get_field(env->hstatus, HSTATUS_SPVP);
> +        ;
>      } else if (mode =3D=3D PRV_M && access_type !=3D MMU_INST_FETCH &&
>                 get_field(env->mstatus, MSTATUS_MPRV)) {
>          mode =3D get_field(env->mstatus, MSTATUS_MPP);
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 81362537b6..db7252e09d 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -437,7 +437,7 @@ static int check_access_hlsv(CPURISCVState *env, bool=
 x, uintptr_t ra)
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
>      }
>
> -    return cpu_mmu_index(env, x) | MMU_2STAGE_BIT;
> +    return get_field(env->hstatus, HSTATUS_SPVP) | MMU_2STAGE_BIT;
>  }
>
>  target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
> --
> 2.34.1
>
>

