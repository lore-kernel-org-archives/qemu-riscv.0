Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm3Oh-00029u-NF
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 22:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3Og-000273-20; Mon, 10 Apr 2023 22:06:14 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3Od-0007g9-5I; Mon, 10 Apr 2023 22:06:13 -0400
Received: by mail-vs1-xe30.google.com with SMTP id b26so6137316vsa.11;
 Mon, 10 Apr 2023 19:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681178769; x=1683770769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WQ0k4zmdalq0z2Rj57Vbrq9qNiYkdW0l3jbunk7B7Es=;
 b=Ue9gixfk1VEIlo4UupAFOUdToaC7zH97Rz3H3lwgi84LDWdcTXNpe4ftq7/IYt5VPU
 SETh0Wdwpp/wa9YzMHHFKWeDXHKMnudYsJf3cUu3U5YDQbPAkVYXWGR9UMN1pxDNtDHm
 EnCudpw9//0/qBlRlUng8+FfSJfJmd6PNN+Ocg0Y5fV3FfVtaD51s6zFXqYfI2EHanqt
 av38wy0pd5VEU8CR2F5gifEHC8dxOD2yhDb4aeZn/NQq5g/bXjzXOkAZ22RtYoxiXzCa
 ew/uOm3Ql2WgNsybLxjsXmETDkpRBW284TQwVUb5Uu4Gt4hFXxSVvv09iOs9eai4WQwX
 FdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681178769; x=1683770769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WQ0k4zmdalq0z2Rj57Vbrq9qNiYkdW0l3jbunk7B7Es=;
 b=55LOADFwvAWWKhmB1rh4COjQwo6eNouGOE2QL/TR9DdauXMwjkyUBDj8B+ZVS7Ug2K
 nzCEIE89VxI6xAcwHVwyKRf/oBbz2dH5tGatKDpWVnw944iCP4mG+ryY1ryUcWPkpba+
 KCLvHZwYm7XKarOgKHm6yjRD/6b0Q3jGMeb2WEKHUUQ9+hBSew46ejqKcSu0uRQDbmNj
 pBqpSnRpzZ0TI67ve4Z4Icrq4Ts5uChtOZpPOlOn15fuhuBH+k4GaJ3SKscjyOfs9ct5
 LqAr4YRnFLD6gLJ+2an7aoQ3oBeFfGKIMa4kbRuLolWlixdJuCsuSfAts747tyYR/pvM
 9qDg==
X-Gm-Message-State: AAQBX9eD47nRhCwprvVRqeJ8EZwxO+VVlr/jCcsFmiVjz63UhPzfrOSK
 W+p7shm7yOGTx8vcy5dCWCKDGrpmefx3kggnmHI=
X-Google-Smtp-Source: AKy350aIG8FBPEc9hGZgFp8jln33FvN24EGU2FOg3PvSvYjdIctxP9fu+R4B2u1SyNIXEsAH7vM34lXVLeR8piZk5KQ=
X-Received: by 2002:a67:c289:0:b0:42c:3f5a:7561 with SMTP id
 k9-20020a67c289000000b0042c3f5a7561mr5324917vsj.3.1681178769552; Mon, 10 Apr
 2023 19:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-3-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-3-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 12:05:43 +1000
Message-ID: <CAKmqyKMtHANNW3RxQmZm-CgeTDpk-GEXjRqN_zfkfB1onHqF9w@mail.gmail.com>
Subject: Re: [PATCH v6 02/25] target/riscv: Add a general status enum for
 extensions
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
X-List-Received-Date: Tue, 11 Apr 2023 02:06:14 -0000

On Sat, Mar 25, 2023 at 9:58=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> The pointer masking is the only extension that directly use status.
> The vector or float extension uses the status in an indirect way.
>
> Replace the pointer masking extension special status fields with
> the general status.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Message-Id: <20230324143031.1093-3-zhiwei_liu@linux.alibaba.com>
> [rth: Add a typedef for the enum]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h      |  8 ++++++++
>  target/riscv/cpu_bits.h | 12 ++++--------
>  target/riscv/cpu.c      |  2 +-
>  target/riscv/csr.c      | 14 +++++++-------
>  4 files changed, 20 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 12fe8d8546..30d9828d59 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -99,6 +99,14 @@ enum {
>      TRANSLATE_G_STAGE_FAIL
>  };
>
> +/* Extension context status */
> +typedef enum {
> +    EXT_STATUS_DISABLED =3D 0,
> +    EXT_STATUS_INITIAL,
> +    EXT_STATUS_CLEAN,
> +    EXT_STATUS_DIRTY,
> +} RISCVExtStatus;
> +
>  #define MMU_USER_IDX 3
>
>  #define MAX_RISCV_PMPS (16)
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index fca7ef0cef..b84f62f8d6 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -9,6 +9,9 @@
>                   (((uint64_t)(val) * ((mask) & ~((mask) << 1))) & \
>                   (uint64_t)(mask)))
>
> +/* Extension context status mask */
> +#define EXT_STATUS_MASK     0x3ULL
> +
>  /* Floating point round mode */
>  #define FSR_RD_SHIFT        5
>  #define FSR_RD              (0x7 << FSR_RD_SHIFT)
> @@ -734,13 +737,6 @@ typedef enum RISCVException {
>  #define PM_ENABLE       0x00000001ULL
>  #define PM_CURRENT      0x00000002ULL
>  #define PM_INSN         0x00000004ULL
> -#define PM_XS_MASK      0x00000003ULL
> -
> -/* PointerMasking XS bits values */
> -#define PM_EXT_DISABLE  0x00000000ULL
> -#define PM_EXT_INITIAL  0x00000001ULL
> -#define PM_EXT_CLEAN    0x00000002ULL
> -#define PM_EXT_DIRTY    0x00000003ULL
>
>  /* Execution enviornment configuration bits */
>  #define MENVCFG_FIOM                       BIT(0)
> @@ -780,7 +776,7 @@ typedef enum RISCVException {
>  #define S_OFFSET     5ULL
>  #define M_OFFSET     8ULL
>
> -#define PM_XS_BITS   (PM_XS_MASK << XS_OFFSET)
> +#define PM_XS_BITS   (EXT_STATUS_MASK << XS_OFFSET)
>  #define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
>  #define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
>  #define U_PM_INSN    (PM_INSN    << U_OFFSET)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e97473af2..1135106b3e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -764,7 +764,7 @@ static void riscv_cpu_reset_hold(Object *obj)
>          i++;
>      }
>      /* mmte is supposed to have pm.current hardwired to 1 */
> -    env->mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
> +    env->mmte |=3D (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
>  #endif
>      env->xl =3D riscv_cpu_mxl(env);
>      riscv_cpu_update_mask(env);
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..abea7b749e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3513,7 +3513,7 @@ static RISCVException write_mmte(CPURISCVState *env=
, int csrno,
>
>      /* hardwiring pm.instruction bit to 0, since it's not supported yet =
*/
>      wpri_val &=3D ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
> -    env->mmte =3D wpri_val | PM_EXT_DIRTY;
> +    env->mmte =3D wpri_val | EXT_STATUS_DIRTY;
>      riscv_cpu_update_mask(env);
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
> @@ -3593,7 +3593,7 @@ static RISCVException write_mpmmask(CPURISCVState *=
env, int csrno,
>      if ((env->priv =3D=3D PRV_M) && (env->mmte & M_PM_ENABLE)) {
>          env->cur_pmmask =3D val;
>      }
> -    env->mmte |=3D PM_EXT_DIRTY;
> +    env->mmte |=3D EXT_STATUS_DIRTY;
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
>      mstatus =3D env->mstatus | MSTATUS_XS;
> @@ -3621,7 +3621,7 @@ static RISCVException write_spmmask(CPURISCVState *=
env, int csrno,
>      if ((env->priv =3D=3D PRV_S) && (env->mmte & S_PM_ENABLE)) {
>          env->cur_pmmask =3D val;
>      }
> -    env->mmte |=3D PM_EXT_DIRTY;
> +    env->mmte |=3D EXT_STATUS_DIRTY;
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
>      mstatus =3D env->mstatus | MSTATUS_XS;
> @@ -3649,7 +3649,7 @@ static RISCVException write_upmmask(CPURISCVState *=
env, int csrno,
>      if ((env->priv =3D=3D PRV_U) && (env->mmte & U_PM_ENABLE)) {
>          env->cur_pmmask =3D val;
>      }
> -    env->mmte |=3D PM_EXT_DIRTY;
> +    env->mmte |=3D EXT_STATUS_DIRTY;
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
>      mstatus =3D env->mstatus | MSTATUS_XS;
> @@ -3673,7 +3673,7 @@ static RISCVException write_mpmbase(CPURISCVState *=
env, int csrno,
>      if ((env->priv =3D=3D PRV_M) && (env->mmte & M_PM_ENABLE)) {
>          env->cur_pmbase =3D val;
>      }
> -    env->mmte |=3D PM_EXT_DIRTY;
> +    env->mmte |=3D EXT_STATUS_DIRTY;
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
>      mstatus =3D env->mstatus | MSTATUS_XS;
> @@ -3701,7 +3701,7 @@ static RISCVException write_spmbase(CPURISCVState *=
env, int csrno,
>      if ((env->priv =3D=3D PRV_S) && (env->mmte & S_PM_ENABLE)) {
>          env->cur_pmbase =3D val;
>      }
> -    env->mmte |=3D PM_EXT_DIRTY;
> +    env->mmte |=3D EXT_STATUS_DIRTY;
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
>      mstatus =3D env->mstatus | MSTATUS_XS;
> @@ -3729,7 +3729,7 @@ static RISCVException write_upmbase(CPURISCVState *=
env, int csrno,
>      if ((env->priv =3D=3D PRV_U) && (env->mmte & U_PM_ENABLE)) {
>          env->cur_pmbase =3D val;
>      }
> -    env->mmte |=3D PM_EXT_DIRTY;
> +    env->mmte |=3D EXT_STATUS_DIRTY;
>
>      /* Set XS and SD bits, since PM CSRs are dirty */
>      mstatus =3D env->mstatus | MSTATUS_XS;
> --
> 2.34.1
>
>

