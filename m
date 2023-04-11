Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm56j-0007Kj-DP
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 23:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm56h-0007KD-Uo; Mon, 10 Apr 2023 23:55:48 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm56g-0004In-0D; Mon, 10 Apr 2023 23:55:47 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id k11so3226972vsv.8;
 Mon, 10 Apr 2023 20:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681185344; x=1683777344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=louYlOKvLDArUDx47IDXBmGau3tI6i0GsM9SC/rSxKs=;
 b=ele5Py6oCDUw+WEde0izXJ95gq9miCU3mwfuFe8sIFFUD5YV0akaJ9oZ7nkOzE9F14
 DghvMft6yujJQyj1jyvIU8BO8i7zj08ZglsGd3MN1JyeAN7d8bff6ljicBChh80iFvHb
 73fwmsQ+RNC2H4rsRaS0dYIQzZIHN9/D4XD/gWPQUpUe9vT1FCuRvKqPMC4U3OI1BbUc
 wLbtDIA2/vE6WrGzBNKn+tZYeO80xo5hs3SRJT/Dqeuj6muQFVZne1q/rPOuZdxtpZ4D
 g1zo8Rn58eOjRN6IYhNYglVUtWVANmj5JqGDoMAoEuVIaurHrsTN2Uco/a6N0oiUE0VX
 7cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681185344; x=1683777344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=louYlOKvLDArUDx47IDXBmGau3tI6i0GsM9SC/rSxKs=;
 b=ti4n3Z9U0DwyxgxQFLKHmcddglzQbSiAIQd8uKa44fEBhzXEebNUF5LDFZwd4VHada
 A637n9kprW8BHh8MkRjPjvLSPG60aTK4z/iCU55IhVMJhg427C6xqZBtILfuNwqC2+jc
 BAbv7eSR+kB8SDjS8NsiGzIdZ2hpmxFXifU1pKonjIPgXV/w1IpwDOoxEYaoR6YL/496
 3HdyOT07UYXb1PigkuZifWuJm1K+BMxQgpEHUwG4TKIh5vs3vhkvW43bYwkc2Tzk1ycw
 blaOIkSUPMFaqAk1SDM2/rEZsk7XQcJeiHV9Iaupbh0/kaZF0GvoVNKlvb2OgEvZRsgw
 D6MQ==
X-Gm-Message-State: AAQBX9c5UrHc4KqXHBNwMIAHY1kIJR4MCERxsIOmD+1LYideSUPTMzCE
 gBBdXEANN+7aeTBwqMBjnRfqnFyy7ICF+PtR8tI=
X-Google-Smtp-Source: AKy350Yh+sImV868tbYwMI/3sNz5zjzrCpDsH5nE2aqS22h6xj+67a4wGGMKDenFLXr2OxV/2Iqk1pzTVu4mthC6jwM=
X-Received: by 2002:a67:d38d:0:b0:425:8e57:7bfd with SMTP id
 b13-20020a67d38d000000b004258e577bfdmr7619904vsj.3.1681185344334; Mon, 10 Apr
 2023 20:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-15-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-15-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 13:55:18 +1000
Message-ID: <CAKmqyKMdwG8Nd+x4EEinXC4SXM9wi688rjc-UCivpOSvUJRcGQ@mail.gmail.com>
Subject: Re: [PATCH v6 14/25] target/riscv: Introduce mmuidx_2stage
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 03:55:48 -0000

On Sat, Mar 25, 2023 at 9:53=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move and rename riscv_cpu_two_stage_lookup, to match
> the other mmuidx_* functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        |  1 -
>  target/riscv/internals.h  |  5 +++++
>  target/riscv/cpu_helper.c | 17 ++++++-----------
>  3 files changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f03ff1f10c..b6bcfb3834 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -586,7 +586,6 @@ void riscv_cpu_set_geilen(CPURISCVState *env, target_=
ulong geilen);
>  bool riscv_cpu_vector_enabled(CPURISCVState *env);
>  bool riscv_cpu_virt_enabled(CPURISCVState *env);
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
> -bool riscv_cpu_two_stage_lookup(int mmu_idx);
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
>  G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                                 MMUAccessType access_type=
, int mmu_idx,
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 4aa1cb409f..b5f823c7ec 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -51,6 +51,11 @@ static inline bool mmuidx_sum(int mmu_idx)
>      return (mmu_idx & 3) =3D=3D MMUIdx_S_SUM;
>  }
>
> +static inline bool mmuidx_2stage(int mmu_idx)
> +{
> +    return mmu_idx & MMU_2STAGE_BIT;
> +}
> +
>  /* share data between vector helpers and decode code */
>  FIELD(VDATA, VM, 0, 1)
>  FIELD(VDATA, LMUL, 1, 3)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index cb260b88ea..8a124888cd 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -603,11 +603,6 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, =
bool enable)
>      }
>  }
>
> -bool riscv_cpu_two_stage_lookup(int mmu_idx)
> -{
> -    return mmu_idx & MMU_2STAGE_BIT;
> -}
> -
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
>  {
>      CPURISCVState *env =3D &cpu->env;
> @@ -791,7 +786,7 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
>
>      /* MPRV does not affect the virtual-machine load/store
>         instructions, HLV, HLVX, and HSV. */
> -    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
> +    if (mmuidx_2stage(mmu_idx)) {
>          mode =3D get_field(env->hstatus, HSTATUS_SPVP);
>      }
>
> @@ -1177,7 +1172,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, =
hwaddr physaddr,
>
>      env->badaddr =3D addr;
>      env->two_stage_lookup =3D riscv_cpu_virt_enabled(env) ||
> -                            riscv_cpu_two_stage_lookup(mmu_idx);
> +                            mmuidx_2stage(mmu_idx);
>      env->two_stage_indirect_lookup =3D false;
>      cpu_loop_exit_restore(cs, retaddr);
>  }
> @@ -1203,7 +1198,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, va=
ddr addr,
>      }
>      env->badaddr =3D addr;
>      env->two_stage_lookup =3D riscv_cpu_virt_enabled(env) ||
> -                            riscv_cpu_two_stage_lookup(mmu_idx);
> +                            mmuidx_2stage(mmu_idx);
>      env->two_stage_indirect_lookup =3D false;
>      cpu_loop_exit_restore(cs, retaddr);
>  }
> @@ -1255,7 +1250,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>
>      /* MPRV does not affect the virtual-machine load/store
>         instructions, HLV, HLVX, and HSV. */
> -    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
> +    if (mmuidx_2stage(mmu_idx)) {
>          mode =3D get_field(env->hstatus, HSTATUS_SPVP);
>      } else if (mode =3D=3D PRV_M && access_type !=3D MMU_INST_FETCH &&
>                 get_field(env->mstatus, MSTATUS_MPRV)) {
> @@ -1267,7 +1262,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>
>      pmu_tlb_fill_incr_ctr(cpu, access_type);
>      if (riscv_cpu_virt_enabled(env) ||
> -        ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
> +        ((mmuidx_2stage(mmu_idx) || two_stage_lookup) &&
>           access_type !=3D MMU_INST_FETCH)) {
>          /* Two stage lookup */
>          ret =3D get_physical_address(env, &pa, &prot, address,
> @@ -1365,7 +1360,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>          raise_mmu_exception(env, address, access_type, pmp_violation,
>                              first_stage_error,
>                              riscv_cpu_virt_enabled(env) ||
> -                                riscv_cpu_two_stage_lookup(mmu_idx),
> +                                mmuidx_2stage(mmu_idx),
>                              two_stage_indirect_error);
>          cpu_loop_exit_restore(cs, retaddr);
>      }
> --
> 2.34.1
>
>

