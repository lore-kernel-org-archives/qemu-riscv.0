Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8dUn-0003Xn-32
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 04:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o8dUh-0003W1-Tp
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 04:01:20 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o8dUV-00074P-1U
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 04:01:15 -0400
Received: by mail-pg1-x536.google.com with SMTP id z14so10784508pgh.0
 for <qemu-riscv@nongnu.org>; Tue, 05 Jul 2022 01:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2BsVP2r3nYhVYx4S6kKZtgGvxipXoqQi7jD2YehqE9o=;
 b=qXCASg+GdMa2RJIzpwsRKKoj/O7fAPD+SGVqaOHJN/fQ4KKmUmKDi0QzJpwkHztelb
 1wz06Ztzg2O05cP1DlsybMWxHh+CIpQ9SckSR+XfaGuTCN+lnta4Z/exXq3v92YHKEcf
 txDS4U+wvi/cblZw3sQ2vIY5esEJorUIXPbWAOtmnvoek8Yqnq3a8HOYzou+KhSP3NhR
 EvqT4i8iXF4hi6UlnQbsdaEf6ADMswfG+9Vm/1hWAaaWJkz7Sy9h9uqnmZii3n6DtoUG
 p9OdvVeqhZR3r5S0g41fewxND62JF3Nk5OuXQkFvfQF5zh+3VVh7gO92BrRUCvNW9UL2
 Ketg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2BsVP2r3nYhVYx4S6kKZtgGvxipXoqQi7jD2YehqE9o=;
 b=A/AqDJK9cgsDTx2PiknoBdxc5n9RogMpL0uiG3FcjesVOzs0qbCpqUU9fnV9RWnE+j
 9l2owbuogxuy7WRwsAueYDjC+/oGrxPlqevqiuOMdMFbP6DE/FHeT0A51LZF5m17jbql
 +9u7uQKvcdXQ62YsVVSofg+Qpc9o9OIezNNZr1fpa7cftBTFz0klyziEsXCX3mQcHte+
 dju4AOdCOJY9XuZ6KtJIV7oWRVD3F2ynmgZLFMHETlfrdYz5JW763B4M62kLHxxBAA+T
 snKKfncOZgA/KcHJmnbS5WBGoMiTx9B60UKpwt2/So42QuG6b5otBy19b3PpVIUvRQL2
 6mEQ==
X-Gm-Message-State: AJIora8qRQWo5mxy+NHTLfZTwu9z8b65HuZ0TPE/Uhy9DSOhY/6bPdLP
 XI1TFSppb8beeFHyhqdrgQOzbpkZeYTrKg9luR3kXA==
X-Google-Smtp-Source: AGRyM1sPLn8gOtCiFdxw/BK0EXQfKBJPsoAwkAZxI9/rWcA7CmSBDYLNCXZLKysvthTyGtB8F685XpHcsDK5zT06J+w=
X-Received: by 2002:a63:287:0:b0:412:2f6e:7fc with SMTP id
 129-20020a630287000000b004122f6e07fcmr9500432pgc.185.1657008061359; 
 Tue, 05 Jul 2022 01:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-10-atishp@rivosinc.com>
 <88b34ac2-c126-c4de-f238-f882d73365c6@iscas.ac.cn>
In-Reply-To: <88b34ac2-c126-c4de-f238-f882d73365c6@iscas.ac.cn>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 5 Jul 2022 01:00:50 -0700
Message-ID: <CAHBxVyF240FjEwtrEuttXXan1QKAoX1J8LHm3a91xSy=QRPEUQ@mail.gmail.com>
Subject: Re: [PATCH v10 09/12] target/riscv: Simplify counter predicate
 function
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 05 Jul 2022 08:01:20 -0000

On Mon, Jul 4, 2022 at 8:19 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/6/21 =E4=B8=8A=E5=8D=887:15, Atish Patra =E5=86=99=E9=81=
=93:
>
> All the hpmcounters and the fixed counters (CY, IR, TM) can be represente=
d
> as a unified counter. Thus, the predicate function doesn't need handle ea=
ch
> case separately.
>
> Simplify the predicate function so that we just handle things differently
> between RV32/RV64 and S/HS mode.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/csr.c | 112 +++++----------------------------------------
>  1 file changed, 11 insertions(+), 101 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 2664ce265784..9367e2af9b90 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno=
)
>      CPUState *cs =3D env_cpu(env);
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      int ctr_index;
> +    target_ulong ctr_mask;
>      int base_csrno =3D CSR_CYCLE;
>      bool rv32 =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32 ? true : false;
>
> @@ -82,122 +83,31 @@ static RISCVException ctr(CPURISCVState *env, int cs=
rno)
>          base_csrno +=3D 0x80;
>      }
>      ctr_index =3D csrno - base_csrno;
> +    ctr_mask =3D BIT(ctr_index);
>
>      if ((csrno >=3D CSR_CYCLE && csrno <=3D CSR_INSTRET) ||
>          (csrno >=3D CSR_CYCLEH && csrno <=3D CSR_INSTRETH)) {
>          goto skip_ext_pmu_check;
>      }
>
> -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) =
{
> +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & ctr_mask))) {
>          /* No counter is enabled in PMU or the counter is out of range *=
/
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
>  skip_ext_pmu_check:
>
> -    if (env->priv =3D=3D PRV_S) {
> -        switch (csrno) {
> -        case CSR_CYCLE:
> -            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_TIME:
> -            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_INSTRET:
> -            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->mcounteren, 1 << ctr_index)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        }
> -        if (rv32) {
> -            switch (csrno) {
> -            case CSR_CYCLEH:
> -                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_TIMEH:
> -                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_INSTRETH:
> -                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->mcounteren, 1 << ctr_index)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            }
> -        }
> +    if (((env->priv =3D=3D PRV_S) && (!get_field(env->mcounteren, ctr_ma=
sk))) ||
> +       ((env->priv =3D=3D PRV_U) && (!get_field(env->scounteren, ctr_mas=
k)))) {
> +        return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> Sorry. I didn't realize this simplification and sent a similar patch to f=
ix the problems in Xcounteren
>
> related check I found when I tried to learn the patchset for state enable=
 extension two days ago.
>
> I think there are several difference between our understanding, following=
 is my modifications:
>
> +    if (csrno <=3D CSR_HPMCOUNTER31 && csrno >=3D CSR_CYCLE) {
> +        field =3D 1 << (csrno - CSR_CYCLE);
> +    } else if (riscv_cpu_mxl(env) =3D=3D MXL_RV32 && csrno <=3D CSR_HPMC=
OUNTER31H &&
> +               csrno >=3D CSR_CYCLEH) {
> +        field =3D 1 << (csrno - CSR_CYCLEH);
> +    }
> +
> +    if (env->priv < PRV_M && !get_field(env->mcounteren, field)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (riscv_cpu_virt_enabled(env) && !get_field(env->hcounteren, field=
)) {
> +        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +    }
> +
> +    if (riscv_has_ext(env, RVS) && env->priv =3D=3D PRV_U &&
> +        !get_field(env->scounteren, field)) {
> +        if (riscv_cpu_virt_enabled(env)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        } else {
> +            return RISCV_EXCP_ILLEGAL_INST;
>          }
>      }
>
>
> 1) For any less-privileged mode under M, illegal exception is raised if m=
atching
> bit in mcounteren is zero.
>

As per the priv spec, in the section 3.1.11
"When one of these bits is set, access to the corresponding register
is permitted in the next implemented privilege mode (S-mode if
implemented, otherwise U-mode)."

mcounteren controls the access for U-mode only if the next implemented
mode is U (riscv_has_ext(env, RVS) must be false).
I did not add the additional check as the ctr is defined only for
!CONFIG_USER_ONLY.

> 2) For VS/VU mode('H' extension is supported implicitly), virtual instruc=
tion
> exception is raised if matching bit in hcounteren is zero.
>
> 3) scounteren csr only works in U/VU mode when 'S' extension is supported=
:

Yes. But we don't need additional check for 'S' extension as it will
be done by the predicate function "smode"

>    For U mode, illegal exception is raised if matching bit in scounteren =
is zero.
>    For VU mode, virtual instruction exception exception is raised if matc=
hing bit
> in scounteren is zero.
>
> Regards,
> Weiwei Li
>
>
>      if (riscv_cpu_virt_enabled(env)) {
> -        switch (csrno) {
> -        case CSR_CYCLE:
> -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> -                get_field(env->mcounteren, COUNTEREN_CY)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_TIME:
> -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> -                get_field(env->mcounteren, COUNTEREN_TM)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_INSTRET:
> -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> -                get_field(env->mcounteren, COUNTEREN_IR)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->hcounteren, 1 << ctr_index) &&
> -                 get_field(env->mcounteren, 1 << ctr_index)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        }
> -        if (rv32) {
> -            switch (csrno) {
> -            case CSR_CYCLEH:
> -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> -                    get_field(env->mcounteren, COUNTEREN_CY)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_TIMEH:
> -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> -                    get_field(env->mcounteren, COUNTEREN_TM)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_INSTRETH:
> -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> -                    get_field(env->mcounteren, COUNTEREN_IR)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->hcounteren, 1 << ctr_index) &&
> -                     get_field(env->mcounteren, 1 << ctr_index)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            }
> +        if (!get_field(env->mcounteren, ctr_mask)) {
> +            /* The bit must be set in mcountern for HS mode access */
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        } else if (!get_field(env->hcounteren, ctr_mask)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
>      }
>  #endif

