Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvG6-00076m-FM
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvG5-00076V-2a; Wed, 05 Apr 2023 01:00:33 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvG3-0007i4-7s; Wed, 05 Apr 2023 01:00:32 -0400
Received: by mail-vs1-xe34.google.com with SMTP id d18so30423711vsv.11;
 Tue, 04 Apr 2023 22:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680670829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Ck77YjEU+WxgQFveVPH2OjGa1d+rq67f89CktS3liw=;
 b=c5vLc+ofAK2eAT5BhLws/rgkN5GJWJx+GnwuEIWzTjV6sAcfj3RR9qjxRUpkbEjBrp
 cDaDwuJIHiasAKxhaWaSXL6z11aZzUIILRGExw4tMsb04nczhsEzeF2h7ADCkJJ7p2O9
 VXBRjsW9+cMNg10iuwm1+ekPHjbn1L1EzS4NSGXeqT57lUi/CoMZuIqrtR+gM+Lh8s3e
 2br9lIT/9M5addI8XZQqC5tElhTS7RB1KyEqyPlRUzcwkOtZ6g4G6yZ6t5JsUzyzwquQ
 CB4D8iRPUjFjqA+FJ+qZ8XPaJnAgtk5LIlIarA+SGchAm1zCrO9jMUpFwQOSGFrongNz
 0lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680670829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Ck77YjEU+WxgQFveVPH2OjGa1d+rq67f89CktS3liw=;
 b=w1qF1ibWbCr9S8YwulS4RLVV/weIhBC5PUGMuHgyU1C9gbwXobAPvFRizrrmgPfZ6E
 VlWznj3kdKw8U+83Sp4B7xXkj4820GM93mx/BV0XCtg3WqMMcaCgYeJn8g3KfTwZeRXK
 o0syw88Qk5cL1e27W3BCuG44P0H5KDbltmbHm0vW9KzybUeoMSkRF5MaQhtnnQwKl8Vg
 JJ+Poyjn1NbyRDyVLNwBP04zXR9en4QACyZgYHP/9jsRa+ylzdJ0W/i27y5ZWKmk/NIA
 Zj1mw/+3WiyJr2P2XI9lxiM5ADwtLRtLfL2hilyxsJKM+sSczIcuwCTIH8zeHbKIK5DD
 wBeg==
X-Gm-Message-State: AAQBX9fENPOfehq1m16vDbkWVN2PdYlCU7EI6SPEOHGIsELvL86lnj6n
 jrS2QKNWr2285nJVOujJsdS2j/agbHKFdBfSlZ4=
X-Google-Smtp-Source: AKy350YkoyPaRHKZkPYCLHhxndq8IG5SXV3P76C2DXYtwl+paX2VDQRNe3TVc2D9T8Or2GZrN5txItlbzLuSELr1m0s=
X-Received: by 2002:a67:d60c:0:b0:425:969d:3709 with SMTP id
 n12-20020a67d60c000000b00425969d3709mr3701596vsj.3.1680670829703; Tue, 04 Apr
 2023 22:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230309135403.102703-1-ivan.klokov@syntacore.com>
In-Reply-To: <20230309135403.102703-1-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:00:03 +1000
Message-ID: <CAKmqyKNr85_OhFUwT-zCMuHpiJ9mq6d9bBEN5DS--zWGwCOcxA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Add RVV registers to log
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 philmd@linaro.org, wangyanan55@huawei.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:00:33 -0000

On Fri, Mar 10, 2023 at 12:01=E2=80=AFAM Ivan Klokov <ivan.klokov@syntacore=
.com> wrote:
>
> Added QEMU option 'rvv' to add RISC-V RVV registers to log like regular r=
egs.
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
> ---
> v2:
>    - fix option name
>    - fix byte ordering
> ---
>  accel/tcg/cpu-exec.c  |  3 +++
>  include/hw/core/cpu.h |  2 ++
>  include/qemu/log.h    |  1 +
>  target/riscv/cpu.c    | 59 ++++++++++++++++++++++++++++++++++++++++++-
>  util/log.c            |  2 ++
>  5 files changed, 66 insertions(+), 1 deletion(-)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 56aaf58b9d..0dca69fccb 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -319,6 +319,9 @@ static void log_cpu_exec(target_ulong pc, CPUState *c=
pu,
>  #if defined(TARGET_I386)
>                  flags |=3D CPU_DUMP_CCOP;
>  #endif
> +                if (qemu_loglevel_mask(CPU_LOG_TB_VPU)) {
> +                    flags |=3D CPU_DUMP_VPU;
> +                }

Can you separate these core changes into a seperate patch? It allows
others to see the changes and review them

>                  cpu_dump_state(cpu, logfile, flags);
>                  qemu_log_unlock(logfile);
>              }
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 75689bff02..7c9d25ff45 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -545,11 +545,13 @@ GuestPanicInformation *cpu_get_crash_info(CPUState =
*cpu);
>   * @CPU_DUMP_CODE:
>   * @CPU_DUMP_FPU: dump FPU register state, not just integer
>   * @CPU_DUMP_CCOP: dump info about TCG QEMU's condition code optimizatio=
n state
> + * @CPU_DUMP_VPU: dump VPU registers
>   */
>  enum CPUDumpFlags {
>      CPU_DUMP_CODE =3D 0x00010000,
>      CPU_DUMP_FPU  =3D 0x00020000,
>      CPU_DUMP_CCOP =3D 0x00040000,
> +    CPU_DUMP_VPU  =3D 0x00080000,
>  };
>
>  /**
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index c5643d8dd5..df59bfabcd 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -35,6 +35,7 @@ bool qemu_log_separate(void);
>  /* LOG_STRACE is used for user-mode strace logging. */
>  #define LOG_STRACE         (1 << 19)
>  #define LOG_PER_THREAD     (1 << 20)
> +#define CPU_LOG_TB_VPU     (1 << 21)
>
>  /* Lock/unlock output. */
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5bc0005cc7..0b16c9c8e3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -172,6 +172,14 @@ const char * const riscv_fpr_regnames[] =3D {
>    "f30/ft10", "f31/ft11"
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
> @@ -422,7 +430,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *=
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
> @@ -506,6 +515,54 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE =
*f, int flags)
>              }
>          }
>      }
> +    if (riscv_has_ext(env, RVV)) {
> +        if (flags & CPU_DUMP_VPU) {

You can just combine these into a single statement to reduce the indentatio=
n

> +
> +            static const int dump_rvv_csrs[] =3D {
> +                        CSR_VSTART,
> +                        CSR_VXSAT,
> +                        CSR_VXRM,
> +                        CSR_VCSR,
> +                        CSR_VL,
> +                        CSR_VTYPE,
> +                        CSR_VLENB,
> +                    };
> +            for (int i =3D 0; i < ARRAY_SIZE(dump_rvv_csrs); ++i) {
> +                int csrno =3D dump_rvv_csrs[i];
> +                target_ulong val =3D 0;
> +                RISCVException res =3D riscv_csrrw_debug(env, csrno, &va=
l, 0, 0);
> +
> +                /*
> +                 * Rely on the smode, hmode, etc, predicates within csr.=
c
> +                 * to do the filtering of the registers that are present=
.
> +                 */
> +                if (res =3D=3D RISCV_EXCP_NONE) {
> +                    qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
> +                                 csr_ops[csrno].name, val);
> +                }
> +            }
> +            uint16_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
> +
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
> +            for (i =3D 0; i < 32; i++) {
> +                qemu_fprintf(f, " %-8s ", riscv_rvv_regnames[i]);
> +                p =3D (uint8_t *)env->vreg;
> +                for (j =3D vlenb - 1 ; j >=3D 0; j--) {
> +                    qemu_fprintf(f, "%02x", *(p + i * vlenb + BYTE(j)));
> +                }
> +                qemu_fprintf(f, "\n");
> +            }
> +        }
> +    }
>  }
>
>  static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
> diff --git a/util/log.c b/util/log.c
> index 7837ff9917..93dccee7b8 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -495,6 +495,8 @@ const QEMULogItem qemu_log_items[] =3D {
>        "log every user-mode syscall, its input, and its result" },
>      { LOG_PER_THREAD, "tid",
>        "open a separate log file per thread; filename must contain '%d'" =
},
> +    { CPU_LOG_TB_VPU, "vpu",
> +      "include VPU registers in the 'cpu' logging" },

Overall looks fine to me, I would like an Ack from others about adding
a new log item though

Alistair

>      { 0, NULL, NULL },
>  };
>
> --
> 2.34.1
>
>

