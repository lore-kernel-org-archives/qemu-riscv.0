Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmY9u-0006aD-P6
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 06:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmY9r-0006Sv-SX; Wed, 12 Apr 2023 06:56:59 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmY9p-0000qP-CV; Wed, 12 Apr 2023 06:56:59 -0400
Received: by mail-vs1-xe29.google.com with SMTP id a9so10373778vsh.3;
 Wed, 12 Apr 2023 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681297016; x=1683889016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QYlb4Qyw1fGYcNYtO/0Xg4tnomxVNR6RJOccbhLeXCc=;
 b=m3xvuxa9l/yreUAsuEzrSjjqbeB/nsw+WW30c+it9jBPk5zEA7LR12uBR9RIhLPvUT
 zrQlcUeVItGPTkVsNfbKk+hEA3DdftXjsXqtnbaB/0/6rBzghLx5DxR45PjuVX9oTUqY
 vPqLd7GHyyURfIgsH8hlJK76xp4Np1P1G2BLZFIztAnNRsS2lKFcDiKxpMCRW8K7O2sx
 XBpkyg6u/zIooStqL3gh7sVzcTFHhopTm5SXKqyti7gCdTIJzAQsU4cFDfPGZIHeVNfI
 UV+ZQr9hKt85k8P37uJvjRobyJRSflUbUdfwBMei/Xn71QktTkNbIC5wB5JjQGx5MQKZ
 A3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681297016; x=1683889016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QYlb4Qyw1fGYcNYtO/0Xg4tnomxVNR6RJOccbhLeXCc=;
 b=hO+JjkIcEmSICuUneUzR6Zvm8CYVHv4aaTEC8K6NfzMXkHT1cTtsJ5OkTiq+NajauD
 pISdAhx9n7PY/N+wcPUjIK6hx3aG/MqrdzibVCZjmpszaY1/F/5l1if5sAckt0N3fqYQ
 dWpvqpbACm6teLLwZyliE1hhCsc0H2YrM/O8+8tPpvTLx+NqhEjN6olKTQ60l34Y0pAN
 qjhzihlA7k1RhwPSCTxmPB7e9in5qZBouKVMBU0QfEPu6tu0tC/Tlv6vzfHTpa1vznJm
 zuHPC9pnp/aMPAQmRJZz0hxwnlc3fXibhSAo49u7vFkZDUIsF3ghvTyXb8snoWr+qcH4
 khnA==
X-Gm-Message-State: AAQBX9cdZQfmvAtCoRpkDmsxzl1RBHKG1s4U31TcjbKAdhsI7g4ivuvC
 hRMWcrUfmeFXxpuAihMPGvgZ73aeRXYiri+RdU0=
X-Google-Smtp-Source: AKy350ZqKNt7ZJX2mWAvjYt+v6sFbWAOlzp7snbeSneDAXHXBxzo3DtT2VPPrhOMxgDarnZk+pZdWshyWRQ7kAoRHXg=
X-Received: by 2002:a67:d38e:0:b0:425:d39f:3882 with SMTP id
 b14-20020a67d38e000000b00425d39f3882mr8479186vsj.3.1681297015758; Wed, 12 Apr
 2023 03:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230410124451.15929-1-ivan.klokov@syntacore.com>
 <20230410124451.15929-2-ivan.klokov@syntacore.com>
In-Reply-To: <20230410124451.15929-2-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Apr 2023 20:56:29 +1000
Message-ID: <CAKmqyKNH6cQzLcLJDQXStJpW-pTJD7EtWgoX7GwRzy1wi73V8A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] util/log: Add vector registers to log
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 philmd@linaro.org, wangyanan55@huawei.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 10:57:01 -0000

On Mon, Apr 10, 2023 at 10:46=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore=
.com> wrote:
>
> Added QEMU option 'vpu' to log vector extension registers such as gpr\fpu=
.
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  accel/tcg/cpu-exec.c  | 3 +++
>  include/hw/core/cpu.h | 2 ++
>  include/qemu/log.h    | 1 +
>  util/log.c            | 2 ++
>  4 files changed, 8 insertions(+)
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
>      { 0, NULL, NULL },
>  };
>
> --
> 2.34.1
>
>

