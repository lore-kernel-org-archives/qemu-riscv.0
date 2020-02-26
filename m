Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j71lh-00085q-Ds
	for mharc-qemu-riscv@gnu.org; Wed, 26 Feb 2020 13:50:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34683)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j71le-00085T-PI
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 13:50:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j71lc-0002wn-FT
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 13:50:46 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:46566)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j71lZ-0002ZH-I6; Wed, 26 Feb 2020 13:50:41 -0500
Received: by mail-lf1-x143.google.com with SMTP id v6so82184lfo.13;
 Wed, 26 Feb 2020 10:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yv3YoUZ10EqvfDbbfjuSqfWF3p8xi1b29Ul8Kmyb7ZQ=;
 b=i5uS9ADIxeOEyT8O++STl0cJA4WGl/R0/urPk1UaB1IWR/vsmmU6qyG6XR/o8jj1uU
 8vc/EEuVtE75MfymNaePhlxzM5YyxhFGEo5WUA8IUHCHoYI+1CFqd07hqjHQyWkCcuzU
 93f2Y71tKyg1FUbjnxfou3jAxcS24qPOHNF+388BdLqxo3iQ8eG0DTQWhelSg6+OdyQ1
 alpVR4E2B9180ZEGWliw3v26V7O5Qxp5n0EHQ4K6noNng6mHw/emQjrXxXkdlTBydymq
 drxiJnq7nQd4eikmxf0QydHFXN9qzoquhUtkNR9xw/BJ0may+CGIpJezG2nWTkWLgH4O
 5xNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yv3YoUZ10EqvfDbbfjuSqfWF3p8xi1b29Ul8Kmyb7ZQ=;
 b=oOpf+2DtJtP9dW42l09NzZa5S/KOKMaYUa+kaccMb56OWq9r7joHngoeg7yfEKn8U0
 dEoVawoLE4KCAL2a/fTbiM3OyGsowwpqmzHZZY1+YW63xirl/sYs08QeppH4AsqBRanJ
 vfYfhzjvqrlbawGZRn91yOgjjMnenipkHuZfNC53Dj1+ov4tWimn4x4cp6mnRf7nper6
 BfBtw73xevIE/U+AG18BUIje5PQpAeBWybjOtju2VvxpGW23OHWGQ9JhxHKCqkLM8rkg
 32A+wcGR90JuZfaFdksv7KmxRRlKr5paIQzj0yPxetjrYMTEP6z9YdoHrX+h4ztX2WWO
 SVag==
X-Gm-Message-State: ANhLgQ0BMQ6BVJ4A055AXY+ZD6TTLNFiEHSaKmASp/T027ks1NTmMUun
 5c+fjJuSuRCaeeb8m2tqHD2uUbZNbD3O5Whk4JM=
X-Google-Smtp-Source: ADFU+vt6LrTcQGJPxCAOa/o9qIJlDIpBUE5vkDaDr7Gi0/SkV2juW4GJ3CIanT5pEaouZ9IMCyuThDvBG1G5u2IPdmY=
X-Received: by 2002:ac2:5111:: with SMTP id q17mr29166lfb.51.1582743039708;
 Wed, 26 Feb 2020 10:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20200221094531.61894-1-zhiwei_liu@c-sky.com>
 <20200221094531.61894-4-zhiwei_liu@c-sky.com>
In-Reply-To: <20200221094531.61894-4-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Feb 2020 10:42:55 -0800
Message-ID: <CAKmqyKP7pOnG4LU-1gvY1h1TMuKQVEMSeAcCs1LKxKU61jELCQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] target/riscv: support vector extension csr
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
X-List-Received-Date: Wed, 26 Feb 2020 18:50:48 -0000

On Fri, Feb 21, 2020 at 1:45 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> The v0.7.1 specification does not define vector status within mstatus.
> A future revision will define the privileged portion of the vector status.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu_bits.h | 15 +++++++++
>  target/riscv/csr.c      | 75 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 89 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index e99834856c..1f588ebc14 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -29,6 +29,14 @@
>  #define FSR_NXA             (FPEXC_NX << FSR_AEXC_SHIFT)
>  #define FSR_AEXC            (FSR_NVA | FSR_OFA | FSR_UFA | FSR_DZA | FSR_NXA)
>
> +/* Vector Fixed-Point round model */
> +#define FSR_VXRM_SHIFT      9
> +#define FSR_VXRM            (0x3 << FSR_VXRM_SHIFT)

Shouldn't these be FSCR_*?

> +
> +/* Vector Fixed-Point saturation flag */
> +#define FSR_VXSAT_SHIFT     8
> +#define FSR_VXSAT           (0x1 << FSR_VXSAT_SHIFT)

Same here, FCSR_*

> +
>  /* Control and Status Registers */
>
>  /* User Trap Setup */
> @@ -48,6 +56,13 @@
>  #define CSR_FRM             0x002
>  #define CSR_FCSR            0x003
>
> +/* User Vector CSRs */
> +#define CSR_VSTART          0x008
> +#define CSR_VXSAT           0x009
> +#define CSR_VXRM            0x00a
> +#define CSR_VL              0xc20
> +#define CSR_VTYPE           0xc21
> +
>  /* User Timers and Counters */
>  #define CSR_CYCLE           0xc00
>  #define CSR_TIME            0xc01
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0e34c292c5..9cd2b418bf 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -46,6 +46,10 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>  static int fs(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> +    /* loose check condition for fcsr in vector extension */
> +    if ((csrno == CSR_FCSR) && (env->misa & RVV)) {
> +        return 0;
> +    }
>      if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
> @@ -53,6 +57,14 @@ static int fs(CPURISCVState *env, int csrno)
>      return 0;
>  }
>
> +static int vs(CPURISCVState *env, int csrno)
> +{
> +    if (env->misa & RVV) {
> +        return 0;
> +    }
> +    return -1;
> +}
> +
>  static int ctr(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> @@ -160,6 +172,10 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
>  #endif
>      *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
>          | (env->frm << FSR_RD_SHIFT);
> +    if (vs(env, csrno) >= 0) {
> +        *val |= (env->vxrm << FSR_VXRM_SHIFT)
> +                | (env->vxsat << FSR_VXSAT_SHIFT);
> +    }
>      return 0;
>  }
>
> @@ -172,10 +188,62 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
>      env->mstatus |= MSTATUS_FS;
>  #endif
>      env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
> +    if (vs(env, csrno) >= 0) {
> +        env->vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
> +        env->vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
> +    }
>      riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
>      return 0;
>  }
>
> +static int read_vtype(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vtype;
> +    return 0;
> +}
> +
> +static int read_vl(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vl;
> +    return 0;
> +}
> +
> +static int read_vxrm(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vxrm;
> +    return 0;
> +}
> +
> +static int read_vxsat(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vxsat;
> +    return 0;
> +}
> +
> +static int read_vstart(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vstart;
> +    return 0;
> +}
> +
> +static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vxrm = val;
> +    return 0;
> +}
> +
> +static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vxsat = val;
> +    return 0;
> +}
> +
> +static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vstart = val;
> +    return 0;
> +}

Can you keep these in read/write order? So read_vxrm() then
write_vxrm() for example.

Otherwise the patch looks good :)

Alistair

> +
>  /* User Timers and Counters */
>  static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> @@ -877,7 +945,12 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_FFLAGS] =              { fs,   read_fflags,      write_fflags      },
>      [CSR_FRM] =                 { fs,   read_frm,         write_frm         },
>      [CSR_FCSR] =                { fs,   read_fcsr,        write_fcsr        },
> -
> +    /* Vector CSRs */
> +    [CSR_VSTART] =              { vs,   read_vstart,      write_vstart      },
> +    [CSR_VXSAT] =               { vs,   read_vxsat,       write_vxsat       },
> +    [CSR_VXRM] =                { vs,   read_vxrm,        write_vxrm        },
> +    [CSR_VL] =                  { vs,   read_vl                             },
> +    [CSR_VTYPE] =               { vs,   read_vtype                          },
>      /* User Timers and Counters */
>      [CSR_CYCLE] =               { ctr,  read_instret                        },
>      [CSR_INSTRET] =             { ctr,  read_instret                        },
> --
> 2.23.0
>

