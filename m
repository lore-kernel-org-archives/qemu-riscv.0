Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5MZp-0001bS-Sl
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 01:48:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5MZj-0001Y8-89; Thu, 06 Jan 2022 01:48:39 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=40475
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5MZg-0003al-Sr; Thu, 06 Jan 2022 01:48:38 -0500
Received: by mail-io1-xd2e.google.com with SMTP id q5so1975701ioj.7;
 Wed, 05 Jan 2022 22:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R+IODdW14SUUsmk3u4dlBPdT56pjyvHBc0NcQcAIrfg=;
 b=Tr9AFq44C6+aoZcz7Ny53QFywGU2e5SoMsE7R4rQMc6xEc5BE0dI9RVkPXXtd24lIj
 A9I0sAQ5BAqs5kGYqxnPXv4Y7Y2gXJnor0T6z2Zz8NvafXis4CicFx6Y0sJFS7AZr533
 M4FJXVG+gX0NpfBoNzfw7TJtAeuA/kETQ07QTVFG/iACDH/9GQ3cQIlXqPIrNgjt2TZr
 LvgoRjbQgNS7hXDW8LeXUXAG2Ufoa8zji/ZaBSGGzKWXx4QautZTCVtvTzDLEuJfn71y
 8/+ju5LOBOK9KlR4axA/K/AnIIvTndWRX+hXMjMWbPaEbB0Vagkv6FuUEMe07/VSVksx
 XF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R+IODdW14SUUsmk3u4dlBPdT56pjyvHBc0NcQcAIrfg=;
 b=igqRRB8SEYfkS3rQ3Z3Jv05N9XvNdYGrVvxubDdJK7N+qqd3PQMYMgMrDrtaWfjHjA
 KrXnpl5n0bgwKda9kK+x65/WXz74fssrWIUzY9iiAUDuhLvQWWVq80REmZRVg4TcnNMO
 aailHMgzf10zQ+oiV/Fwlwa5PptdtNOj3vMQBHq+BULyzwCuh1Zo3BTTWTH4K4TDTko6
 iiR4M3GRq3nhJr0FCmeWX6T1WdY4jwSORU8JwgoOOVEdHxy2OtxzuRgHslk8lMTso5ba
 8mmbbgPEUfMaiVa8wTVETMm/hdogYtX8HkgYkI3U6QEJKqFXLBJMjUd2KZO+UEh0+BI/
 8Lgg==
X-Gm-Message-State: AOAM533a405i8LptYQKx1JLDEFAcHX7n7qGo11za3I3nl/dOn2AjgPZr
 XnNLT02DGnSEFvWTWpkI0ufvQlFizv87glh3WX8=
X-Google-Smtp-Source: ABdhPJxvr/EKm5ROOeuVIoU865qQs1cZ9J7eE6WRnnBMyjr2bTNBoyIEYYzej+G1RspfpQzCplA8LLvOJidviVkBO/A=
X-Received: by 2002:a05:6602:140c:: with SMTP id
 t12mr27262710iov.187.1641451715272; 
 Wed, 05 Jan 2022 22:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211213163834.170504-19-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211213163834.170504-19-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jan 2022 16:48:08 +1000
Message-ID: <CAKmqyKPqX0iGJ3T6+PDHvbF+MLHD=n4JqQt3Cs6ORd_sfQ5sxQ@mail.gmail.com>
Subject: Re: [PATCH v7 18/18] target/riscv: actual functions to realize crs
 128-bit insns
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 06 Jan 2022 06:48:40 -0000

On Tue, Dec 14, 2021 at 3:01 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> The csrs are accessed through function pointers: we add 128-bit read
> operations in the table for three csrs (writes fallback to the
> 64-bit version as the upper 64-bit information is handled elsewhere):
> - misa, as mxl is needed for proper operation,
> - mstatus and sstatus, to return sd
> In addition, we also add read and write accesses to the machine and
> supervisor scratch registers.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h      |   7 ++
>  target/riscv/cpu_bits.h |   3 +
>  target/riscv/csr.c      | 195 +++++++++++++++++++++++++++++++++-------
>  3 files changed, 175 insertions(+), 30 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 00e5081598..3e770e3d03 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -486,12 +486,19 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env,=
 int csrno,
>                                  Int128 *ret_value,
>                                  Int128 new_value, Int128 write_mask);
>
> +typedef RISCVException (*riscv_csr_read128_fn)(CPURISCVState *env, int c=
srno,
> +                                               Int128 *ret_value);
> +typedef RISCVException (*riscv_csr_write128_fn)(CPURISCVState *env, int =
csrno,
> +                                             Int128 new_value);
> +
>  typedef struct {
>      const char *name;
>      riscv_csr_predicate_fn predicate;
>      riscv_csr_read_fn read;
>      riscv_csr_write_fn write;
>      riscv_csr_op_fn op;
> +    riscv_csr_read128_fn read128;
> +    riscv_csr_write128_fn write128;
>  } riscv_csr_operations;
>
>  /* CSR function table constants */
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 9913fa9f77..390ba0a52f 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -392,6 +392,7 @@
>
>  #define MSTATUS32_SD        0x80000000
>  #define MSTATUS64_SD        0x8000000000000000ULL
> +#define MSTATUSH128_SD      0x8000000000000000ULL
>
>  #define MISA32_MXL          0xC0000000
>  #define MISA64_MXL          0xC000000000000000ULL
> @@ -413,6 +414,8 @@ typedef enum {
>  #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
>  #define SSTATUS_MXR         0x00080000
>
> +#define SSTATUS64_UXL       0x0000000300000000ULL
> +
>  #define SSTATUS32_SD        0x80000000
>  #define SSTATUS64_SD        0x8000000000000000ULL
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index dca9e19a64..404aa2f31d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -453,7 +453,7 @@ static const target_ulong vs_delegable_excps =3D DELE=
GABLE_EXCPS &
>        (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
>  static const target_ulong sstatus_v1_10_mask =3D SSTATUS_SIE | SSTATUS_S=
PIE |
>      SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
> -    SSTATUS_SUM | SSTATUS_MXR;
> +    SSTATUS_SUM | SSTATUS_MXR | (target_ulong)SSTATUS64_UXL;
>  static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP | MI=
P_UEIP;
>  static const target_ulong hip_writable_mask =3D MIP_VSSIP;
>  static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTIP |=
 MIP_VSEIP;
> @@ -498,6 +498,8 @@ static uint64_t add_status_sd(RISCVMXL xl, uint64_t s=
tatus)
>              return status | MSTATUS32_SD;
>          case MXL_RV64:
>              return status | MSTATUS64_SD;
> +        case MXL_RV128:
> +            return MSTATUSH128_SD;
>          default:
>              g_assert_not_reached();
>          }
> @@ -547,10 +549,11 @@ static RISCVException write_mstatus(CPURISCVState *=
env, int csrno,
>
>      mstatus =3D (mstatus & ~mask) | (val & mask);
>
> -    if (riscv_cpu_mxl(env) =3D=3D MXL_RV64) {
> +    RISCVMXL xl =3D riscv_cpu_mxl(env);
> +    if (xl > MXL_RV32) {
>          /* SXL and UXL fields are for now read only */
> -        mstatus =3D set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
> -        mstatus =3D set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
> +        mstatus =3D set_field(mstatus, MSTATUS64_SXL, xl);
> +        mstatus =3D set_field(mstatus, MSTATUS64_UXL, xl);
>      }
>      env->mstatus =3D mstatus;
>
> @@ -579,6 +582,20 @@ static RISCVException write_mstatush(CPURISCVState *=
env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException read_mstatus_i128(CPURISCVState *env, int csrno,
> +                                        Int128 *val)
> +{
> +    *val =3D int128_make128(env->mstatus, add_status_sd(MXL_RV128, env->=
mstatus));
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_misa_i128(CPURISCVState *env, int csrno,
> +                                     Int128 *val)
> +{
> +    *val =3D int128_make128(env->misa_ext, (uint64_t)MXL_RV128 << 62);
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_misa(CPURISCVState *env, int csrno,
>                                  target_ulong *val)
>  {
> @@ -736,6 +753,21 @@ static RISCVException write_mcounteren(CPURISCVState=
 *env, int csrno,
>  }
>
>  /* Machine Trap Handling */
> +static RISCVException read_mscratch_i128(CPURISCVState *env, int csrno,
> +                                         Int128 *val)
> +{
> +    *val =3D int128_make128(env->mscratch, env->mscratchh);
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mscratch_i128(CPURISCVState *env, int csrno,
> +                                          Int128 val)
> +{
> +    env->mscratch =3D int128_getlo(val);
> +    env->mscratchh =3D int128_gethi(val);
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_mscratch(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
>  {
> @@ -815,6 +847,16 @@ static RISCVException rmw_mip(CPURISCVState *env, in=
t csrno,
>  }
>
>  /* Supervisor Trap Setup */
> +static RISCVException read_sstatus_i128(CPURISCVState *env, int csrno,
> +                                        Int128 *val)
> +{
> +    uint64_t mask =3D sstatus_v1_10_mask;
> +    uint64_t sstatus =3D env->mstatus & mask;
> +
> +    *val =3D int128_make128(sstatus, add_status_sd(MXL_RV128, sstatus));
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_sstatus(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>  {
> @@ -908,6 +950,21 @@ static RISCVException write_scounteren(CPURISCVState=
 *env, int csrno,
>  }
>
>  /* Supervisor Trap Handling */
> +static RISCVException read_sscratch_i128(CPURISCVState *env, int csrno,
> +                                         Int128 *val)
> +{
> +    *val =3D int128_make128(env->sscratch, env->sscratchh);
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_sscratch_i128(CPURISCVState *env, int csrno,
> +                                          Int128 val)
> +{
> +    env->sscratch =3D int128_getlo(val);
> +    env->sscratchh =3D int128_gethi(val);
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_sscratch(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
>  {
> @@ -1708,16 +1765,13 @@ static RISCVException write_upmbase(CPURISCVState=
 *env, int csrno,
>   * csrrc  <->  riscv_csrrw(env, csrno, ret_value, 0, value);
>   */
>
> -RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
> -                           target_ulong *ret_value,
> -                           target_ulong new_value, target_ulong write_ma=
sk)
> +static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
> +                                               int csrno,
> +                                               bool write_mask,
> +                                               RISCVCPU *cpu)
>  {
> -    RISCVException ret;
> -    target_ulong old_value;
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -    int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
> -
>      /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fail=
s */
> +    int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
>  #if !defined(CONFIG_USER_ONLY)
>      int effective_priv =3D env->priv;
>
> @@ -1749,10 +1803,17 @@ RISCVException riscv_csrrw(CPURISCVState *env, in=
t csrno,
>      if (!csr_ops[csrno].predicate) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> -    ret =3D csr_ops[csrno].predicate(env, csrno);
> -    if (ret !=3D RISCV_EXCP_NONE) {
> -        return ret;
> -    }
> +
> +    return csr_ops[csrno].predicate(env, csrno);
> +}
> +
> +static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
> +                                       target_ulong *ret_value,
> +                                       target_ulong new_value,
> +                                       target_ulong write_mask)
> +{
> +    RISCVException ret;
> +    target_ulong old_value;
>
>      /* execute combined read/write operation if it exists */
>      if (csr_ops[csrno].op) {
> @@ -1788,20 +1849,89 @@ RISCVException riscv_csrrw(CPURISCVState *env, in=
t csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
> +                           target_ulong *ret_value,
> +                           target_ulong new_value, target_ulong write_ma=
sk)
> +{
> +    RISCVCPU *cpu =3D env_archcpu(env);
> +
> +    RISCVException ret =3D riscv_csrrw_check(env, csrno, write_mask, cpu=
);
> +    if (ret !=3D RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
> +    return riscv_csrrw_do64(env, csrno, ret_value, new_value, write_mask=
);
> +}
> +
> +static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
> +                                        Int128 *ret_value,
> +                                        Int128 new_value,
> +                                        Int128 write_mask)
> +{
> +    RISCVException ret;
> +    Int128 old_value;
> +
> +    /* read old value */
> +    ret =3D csr_ops[csrno].read128(env, csrno, &old_value);
> +    if (ret !=3D RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
> +    /* write value if writable and write mask set, otherwise drop writes=
 */
> +    if (int128_nz(write_mask)) {
> +        new_value =3D int128_or(int128_and(old_value, int128_not(write_m=
ask)),
> +                              int128_and(new_value, write_mask));
> +        if (csr_ops[csrno].write128) {
> +            ret =3D csr_ops[csrno].write128(env, csrno, new_value);
> +            if (ret !=3D RISCV_EXCP_NONE) {
> +                return ret;
> +            }
> +        } else if (csr_ops[csrno].write) {
> +            /* avoids having to write wrappers for all registers */
> +            ret =3D csr_ops[csrno].write(env, csrno, int128_getlo(new_va=
lue));
> +            if (ret !=3D RISCV_EXCP_NONE) {
> +                return ret;
> +            }
> +        }
> +    }
> +
> +    /* return old value */
> +    if (ret_value) {
> +        *ret_value =3D old_value;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
> -                               Int128 *ret_value,
> -                               Int128 new_value, Int128 write_mask)
> +                                Int128 *ret_value,
> +                                Int128 new_value, Int128 write_mask)
>  {
> -    /* fall back to 64-bit version for now */
> -    target_ulong ret_64;
> -    RISCVException ret =3D riscv_csrrw(env, csrno, &ret_64,
> -                                     int128_getlo(new_value),
> -                                     int128_getlo(write_mask));
> +    RISCVException ret;
> +    RISCVCPU *cpu =3D env_archcpu(env);
>
> -    if (ret_value) {
> -        *ret_value =3D int128_make64(ret_64);
> +    ret =3D riscv_csrrw_check(env, csrno, int128_nz(write_mask), cpu);
> +    if (ret !=3D RISCV_EXCP_NONE) {
> +        return ret;
>      }
>
> +    if (csr_ops[csrno].read128) {
> +        return riscv_csrrw_do128(env, csrno, ret_value, new_value, write=
_mask);
> +    }
> +
> +    /*
> +     * Fall back to 64-bit version for now, if the 128-bit alternative i=
sn't
> +     * at all defined.
> +     * Note, some CSRs don't need to extend to MXLEN (64 upper bits non
> +     * significant), for those, this fallback is correctly handling the =
accesses
> +     */
> +    target_ulong old_value;
> +    ret =3D riscv_csrrw_do64(env, csrno, &old_value,
> +                           int128_getlo(new_value),
> +                           int128_getlo(write_mask));
> +    if (ret =3D=3D RISCV_EXCP_NONE && ret_value) {
> +        *ret_value =3D int128_make64(old_value);
> +    }
>      return ret;
>  }
>
> @@ -1864,8 +1994,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_MHARTID]   =3D { "mhartid",   any,   read_mhartid },
>
>      /* Machine Trap Setup */
> -    [CSR_MSTATUS]     =3D { "mstatus",    any,   read_mstatus,     write=
_mstatus     },
> -    [CSR_MISA]        =3D { "misa",       any,   read_misa,        write=
_misa        },
> +    [CSR_MSTATUS]     =3D { "mstatus",    any,   read_mstatus,     write=
_mstatus, NULL,
> +                                               read_mstatus_i128        =
           },
> +    [CSR_MISA]        =3D { "misa",       any,   read_misa,        write=
_misa, NULL,
> +                                               read_misa_i128           =
           },
>      [CSR_MIDELEG]     =3D { "mideleg",    any,   read_mideleg,     write=
_mideleg     },
>      [CSR_MEDELEG]     =3D { "medeleg",    any,   read_medeleg,     write=
_medeleg     },
>      [CSR_MIE]         =3D { "mie",        any,   read_mie,         write=
_mie         },
> @@ -1875,20 +2007,23 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
>      [CSR_MSTATUSH]    =3D { "mstatush",   any32, read_mstatush,    write=
_mstatush    },
>
>      /* Machine Trap Handling */
> -    [CSR_MSCRATCH] =3D { "mscratch", any,  read_mscratch, write_mscratch=
 },
> +    [CSR_MSCRATCH] =3D { "mscratch", any,  read_mscratch,      write_msc=
ratch, NULL,
> +                                         read_mscratch_i128, write_mscra=
tch_i128   },
>      [CSR_MEPC]     =3D { "mepc",     any,  read_mepc,     write_mepc    =
 },
>      [CSR_MCAUSE]   =3D { "mcause",   any,  read_mcause,   write_mcause  =
 },
>      [CSR_MTVAL]    =3D { "mtval",    any,  read_mtval,    write_mtval   =
 },
>      [CSR_MIP]      =3D { "mip",      any,  NULL,    NULL, rmw_mip       =
 },
>
>      /* Supervisor Trap Setup */
> -    [CSR_SSTATUS]    =3D { "sstatus",    smode, read_sstatus,    write_s=
status    },
> +    [CSR_SSTATUS]    =3D { "sstatus",    smode, read_sstatus,    write_s=
status, NULL,
> +                                              read_sstatus_i128         =
        },
>      [CSR_SIE]        =3D { "sie",        smode, read_sie,        write_s=
ie        },
>      [CSR_STVEC]      =3D { "stvec",      smode, read_stvec,      write_s=
tvec      },
>      [CSR_SCOUNTEREN] =3D { "scounteren", smode, read_scounteren, write_s=
counteren },
>
>      /* Supervisor Trap Handling */
> -    [CSR_SSCRATCH] =3D { "sscratch", smode, read_sscratch, write_sscratc=
h },
> +    [CSR_SSCRATCH] =3D { "sscratch", smode, read_sscratch, write_sscratc=
h, NULL,
> +                                          read_sscratch_i128, write_sscr=
atch_i128  },
>      [CSR_SEPC]     =3D { "sepc",     smode, read_sepc,     write_sepc   =
  },
>      [CSR_SCAUSE]   =3D { "scause",   smode, read_scause,   write_scause =
  },
>      [CSR_STVAL]    =3D { "stval",    smode, read_stval,   write_stval   =
},
> --
> 2.34.1
>
>

