Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm55S-0006aO-Kv
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 23:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm55R-0006a3-5d; Mon, 10 Apr 2023 23:54:29 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm55P-0003um-L9; Mon, 10 Apr 2023 23:54:28 -0400
Received: by mail-ua1-x92a.google.com with SMTP id k20so4796909ual.2;
 Mon, 10 Apr 2023 20:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681185266; x=1683777266;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EPbUf2gNE6RtTgYGLr8jNxXr4fDGZ2F5w+x4aH8EJ8c=;
 b=XTl+ihPe35P/v+dX2SDVDyo1MBT6FL+R2SEws9i+mjsGSsgs538xVi86as9KdWLi95
 3+qIfEsLw8gAcb0sMhvW80v7vjF58QuC2GNJmvQe5PjLua6ulgEKsHp5tsqFqKXFA3fX
 sICXoTNndthN+GxZEVGjQ1+s5kyWdJfa5X4u0fd1EDXOe6lJtS8I2NS/kvbnvA0NCj5a
 Z5Wg4+dfaiQLwSn54Snv0g9BkIbz32QUi0ZvHPebzCUzOAwJrBihfE2MBeMljxWTUOJc
 ZkrLIVBrHiwvsdYBpMcsTFh9eTr3xgaON3fCBzpmvWgn8wL41YZoMzmAEOKUlKpuxcid
 PMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681185266; x=1683777266;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EPbUf2gNE6RtTgYGLr8jNxXr4fDGZ2F5w+x4aH8EJ8c=;
 b=ticqltEFWlOrP6UrMbJsTetlA9LUesg0ZdaDmnxyDluuEU3WI6QzsObeupQyDAPinB
 wsDW2aZhEg8oR36kKdyNVsr+TtSJvyMuKOAE5wmdKB3601sKYva2pWYF/sCzaR/7Bgq7
 BaTFU3gAhNnoUtft2YhpFghpQzXuoQG7KNCHjPGn+ftRzSqYMpsUcfBMiY+khmPVgjNe
 PBHykkP8UeFJ62jm09LWbIXbvtXIffTczixdTUa5DGb0nJ8G7HMZVp56u9IsOdl2HDGO
 xlxJVnT0EkOnul+wHscq8FvMWbw6Hb2ChkzR4Up8z/U6GUOchzb0l8YZCuGDGh7/zvf2
 edsQ==
X-Gm-Message-State: AAQBX9faCcDsZKemW+HC/aahpxxtz/t4JEaRql9Cs2bCk3RfpGIxitWy
 s8FC9HWf7jpxab/Ki0adad+7CcEcFm8Ge3JmBf0=
X-Google-Smtp-Source: AKy350Z0QT4rf7ygkACXeMnjAfyEs5D9SKE1NmBlWuLgrWrGXoxMesfZ2Mz6JAlYmfpmkZy6XwR8O28BRLMRcfDuJyw=
X-Received: by 2002:a1f:910b:0:b0:406:6b94:c4fe with SMTP id
 t11-20020a1f910b000000b004066b94c4femr5335693vkd.0.1681185265871; Mon, 10 Apr
 2023 20:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-14-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-14-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 13:53:59 +1000
Message-ID: <CAKmqyKPjJMbD=Jsp269OBrD=Nzxhn19GEpC-yFNu-OsWUAiEmw@mail.gmail.com>
Subject: Re: [PATCH v6 13/25] target/riscv: Introduce mmuidx_priv
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 03:54:29 -0000

On Sat, Mar 25, 2023 at 9:53=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the priv level encoded into the mmu_idx, rather than
> starting from env->priv.  We have already checked MPRV+MPP
> in riscv_cpu_mmu_index -- no need to repeat that.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/internals.h  | 9 +++++++++
>  target/riscv/cpu_helper.c | 6 +-----
>  2 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 0b61f337dd..4aa1cb409f 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -37,6 +37,15 @@
>  #define MMUIdx_M            3
>  #define MMU_2STAGE_BIT      (1 << 2)
>
> +static inline int mmuidx_priv(int mmu_idx)
> +{
> +    int ret =3D mmu_idx & 3;
> +    if (ret =3D=3D MMUIdx_S_SUM) {
> +        ret =3D PRV_S;
> +    }
> +    return ret;
> +}
> +
>  static inline bool mmuidx_sum(int mmu_idx)
>  {
>      return (mmu_idx & 3) =3D=3D MMUIdx_S_SUM;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 7e6cd8e0fd..cb260b88ea 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -771,7 +771,7 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
>       * (riscv_cpu_do_interrupt) is correct */
>      MemTxResult res;
>      MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> -    int mode =3D env->priv;
> +    int mode =3D mmuidx_priv(mmu_idx);
>      bool use_background =3D false;
>      hwaddr ppn;
>      RISCVCPU *cpu =3D env_archcpu(env);
> @@ -793,10 +793,6 @@ static int get_physical_address(CPURISCVState *env, =
hwaddr *physical,
>         instructions, HLV, HLVX, and HSV. */
>      if (riscv_cpu_two_stage_lookup(mmu_idx)) {
>          mode =3D get_field(env->hstatus, HSTATUS_SPVP);
> -    } else if (mode =3D=3D PRV_M && access_type !=3D MMU_INST_FETCH) {
> -        if (get_field(env->mstatus, MSTATUS_MPRV)) {
> -            mode =3D get_field(env->mstatus, MSTATUS_MPP);
> -        }
>      }
>
>      if (first_stage =3D=3D false) {
> --
> 2.34.1
>
>

