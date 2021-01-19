Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1tzp-00087c-N4
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 11:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1tzm-00083i-97; Tue, 19 Jan 2021 11:36:42 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:36979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1tzk-0007VP-7z; Tue, 19 Jan 2021 11:36:42 -0500
Received: by mail-io1-xd34.google.com with SMTP id d13so37559670ioy.4;
 Tue, 19 Jan 2021 08:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z/vzwFyZ6BZBjPqUDHRC/Sozjg+p7aS+gel5+0fESOc=;
 b=Z3CGhdB5qL7otqnFhTYr6F+3Loi+BusVHBfT3w/YGjCMhFwI7FzlYvdC9WsBCfN9lG
 yJCS0N4eY6Wox2T0eqzRK6HVdj4DTrJguwfQ30AWtYALCo/VVXwaxPM9HSSZbQ0hlQze
 Phvj+0RzSonUfhTf71M596wjz1Fbb8iSE1eC50OudYcjzx/5k0hUQ8lnZEi+2cNaQRCq
 gQ2tfGM+wE2wk3LopvJucapFxXM3CrjCItHMCGLYoYT8xXP4dBmJWXLqMsyBjxcngFYd
 a17pHW/cfsJlHMkqEozTSTq6IsyBFZaCKyP3Y+nzm3pyJdcZThiMahHdDedzT8DSSw6k
 SmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z/vzwFyZ6BZBjPqUDHRC/Sozjg+p7aS+gel5+0fESOc=;
 b=kAHsoyVzTinuMwPRcaQ7z9c9l+9AYeWaq6C6NyXhWhnWm9RVWMaUEzlYrN1ySOg72s
 z1ALmv4dZdCvTZFz4worzCvvZaL2VXjvjMNgmqAfpCl399QRly/NMlnbXP6hIazj3ezf
 IXNEqjQTl9qbw/3rzhI6EKlsOZve4+v9xB4QE+eXPR6rzRGQmPzX092RPALS2sWMJbiJ
 yfTzhqxch/yeiZI2z1gOye/H3kBVJQFZ5W307/2/plwZO1zcQGb5fiIfDqnmvWnqt0mp
 59uvOsYPAlfkX1D0dB/QW7j7hqFIJjTZ5C62Kd+FgCEmfvjF87bo2ztMsj9K1pllPllJ
 GrNg==
X-Gm-Message-State: AOAM533ODNVRi3ZVukm7tEjTdCsFmPm7oAOGyBNvz7flXZcg3tqYl4IV
 WJVQlITuJB4Yw8yPy4/vog968DzhqfSNCuOaIt0=
X-Google-Smtp-Source: ABdhPJyev1GydZWJvsFFIjPvShcE81VAJ25JxEnOkc8qT92HE02Y0PXFB94Sx2N4wF46ujhF3u57dX8/ZWi5zpjYpJU=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr4115776ild.267.1611074199025; 
 Tue, 19 Jan 2021 08:36:39 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-4-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-4-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 08:36:12 -0800
Message-ID: <CAKmqyKO2Z_B4FybCraycR49GLRAxYLObz185RKYf7A+jYqXseA@mail.gmail.com>
Subject: Re: [PATCH v6 03/72] target/riscv: rvv-1.0: add mstatus VS field
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jan 2021 16:36:44 -0000

On Tue, Jan 12, 2021 at 1:48 AM <frank.chang@sifive.com> wrote:
>
> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        |  7 +++++++
>  target/riscv/cpu_bits.h   |  1 +
>  target/riscv/cpu_helper.c | 15 ++++++++++++++-
>  target/riscv/csr.c        | 25 ++++++++++++++++++++++++-
>  4 files changed, 46 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b0281133e09..cd5c77114a4 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -325,6 +325,7 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
> +bool riscv_cpu_vector_enabled(CPURISCVState *env);
>  bool riscv_cpu_virt_enabled(CPURISCVState *env);
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
>  bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
> @@ -372,6 +373,7 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>  #define TB_FLAGS_PRIV_MMU_MASK                3
>  #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>  #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
> +#define TB_FLAGS_MSTATUS_VS MSTATUS_VS
>
>  typedef CPURISCVState CPUArchState;
>  typedef RISCVCPU ArchCPU;
> @@ -426,6 +428,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>
>  #ifdef CONFIG_USER_ONLY
>      flags |= TB_FLAGS_MSTATUS_FS;
> +    flags |= TB_FLAGS_MSTATUS_VS;
>  #else
>      flags |= cpu_mmu_index(env, 0);
>      if (riscv_cpu_fp_enabled(env)) {
> @@ -440,6 +443,10 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>              flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
>          }
>      }
> +
> +    if (riscv_cpu_vector_enabled(env)) {
> +        flags |= env->mstatus & MSTATUS_VS;
> +    }
>  #endif
>
>      *pflags = flags;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index b41e8836c3f..82c48b7b9be 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -370,6 +370,7 @@
>  #define MSTATUS_SPIE        0x00000020
>  #define MSTATUS_MPIE        0x00000080
>  #define MSTATUS_SPP         0x00000100
> +#define MSTATUS_VS          0x00000600
>  #define MSTATUS_MPP         0x00001800
>  #define MSTATUS_FS          0x00006000
>  #define MSTATUS_XS          0x00018000
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index a2afb95fa11..8f67263a49a 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -108,11 +108,24 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
>      return false;
>  }
>
> +/* Return true is vector support is currently enabled */
> +bool riscv_cpu_vector_enabled(CPURISCVState *env)
> +{
> +    if (env->mstatus & MSTATUS_VS) {
> +        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_VS)) {
> +            return false;
> +        }
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
>  void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
>  {
>      uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
>                              MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
> -                            MSTATUS64_UXL;
> +                            MSTATUS64_UXL | MSTATUS_VS;
>      bool current_virt = riscv_cpu_virt_enabled(env);
>
>      g_assert(riscv_has_ext(env, RVH));
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 10ab82ed1fc..50862df9e82 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -268,6 +268,7 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
>          return -RISCV_EXCP_ILLEGAL_INST;
>      }
>      env->mstatus |= MSTATUS_FS;
> +    env->mstatus |= MSTATUS_VS;
>  #endif
>      env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
>      if (vs(env, csrno) >= 0) {
> @@ -298,6 +299,13 @@ static int read_vxrm(CPURISCVState *env, int csrno, target_ulong *val)
>
>  static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
>  {
> +#if !defined(CONFIG_USER_ONLY)
> +    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
> +        return -1;
> +    }
> +    env->mstatus |= MSTATUS_VS;
> +#endif
> +
>      env->vxrm = val;
>      return 0;
>  }
> @@ -310,6 +318,13 @@ static int read_vxsat(CPURISCVState *env, int csrno, target_ulong *val)
>
>  static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
>  {
> +#if !defined(CONFIG_USER_ONLY)
> +    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
> +        return -1;
> +    }
> +    env->mstatus |= MSTATUS_VS;
> +#endif
> +
>      env->vxsat = val;
>      return 0;
>  }
> @@ -322,6 +337,13 @@ static int read_vstart(CPURISCVState *env, int csrno, target_ulong *val)
>
>  static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
>  {
> +#if !defined(CONFIG_USER_ONLY)
> +    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
> +        return -1;
> +    }
> +    env->mstatus |= MSTATUS_VS;
> +#endif
> +
>      env->vstart = val;
>      return 0;
>  }
> @@ -485,7 +507,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
>      mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
>          MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
>          MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
> -        MSTATUS_TW;
> +        MSTATUS_TW | MSTATUS_VS;
>
>      if (!riscv_cpu_is_32bit(env)) {
>          /*
> @@ -498,6 +520,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
>      mstatus = (mstatus & ~mask) | (val & mask);
>
>      dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
> +            ((mstatus & MSTATUS_VS) == MSTATUS_VS) |
>              ((mstatus & MSTATUS_XS) == MSTATUS_XS);
>      mstatus = set_field(mstatus, MSTATUS_SD, dirty);
>      env->mstatus = mstatus;
> --
> 2.17.1
>
>

