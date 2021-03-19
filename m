Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNF9G-0001QK-Gt
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 09:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNF9E-0001LA-JH; Fri, 19 Mar 2021 09:26:40 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:43770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNF9B-0004E2-Rv; Fri, 19 Mar 2021 09:26:40 -0400
Received: by mail-il1-x130.google.com with SMTP id d2so7993649ilm.10;
 Fri, 19 Mar 2021 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EGxnHo6rhYvRulaCLuWojgNdIZVvwzc0ljEN6vPl4b8=;
 b=VPqUeK4N4HVX9ub0cJyNu8MfBuT7BSOuy45ekYn5QhqvXeXapW8IEtTrN/LT+KdeWQ
 vBkteV5JLjb7wCuHq9t0J814XGoDuy1Z0kwPzfT5usIl2eYAlIinKNFUyIWwlYG6JF2W
 Piyo5F1nnDB6cTf25X/gWe18hUwG7X0mCDrdueuPjT52o6S57JmGHRmnqWHsoElKYagD
 zFpEX02vtjQlydrL4U+Y7Ph+pcXPF+HBpbuZlqpbPsQRen2YzAR4YQs9Zq+gF0+XQDKE
 yYVlp390KaxWQNA63lYOC3UVImbrVhh/i7q5Rh77yqrCK8ePUTx+ffO7FrLW0Tjhfeb0
 gHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EGxnHo6rhYvRulaCLuWojgNdIZVvwzc0ljEN6vPl4b8=;
 b=az7Jt5KQpGk1P3/7+gOJz/jI5AheeCO6WLMD2w+ieJeN3imhVdTGqzCqmxmmmFhBfe
 JCDZCJiY7MVI8Og8JnUWI6FA8+8KSFgt1NQUmXPBMb6u5iGE4ZY0D21lyzrWpeMtPCG+
 gZvWaKVhr4nCJD7jOL3QkrEtx2PFQoisVfgp7NKW7P9DqbCeNGHogpVWpmQuF2t41qi+
 xMkox6cXAxAUgQctAie73BlV1IydU//XHXko3b3Lh73bXSNDd8TJnb/s44gMWvXumG7D
 RU9fOeNXnHJcd7NnJ1N5dT+oe/rxhla6hzergyRFRLMFy9gssRdkAgNHiIvP74wdqy2I
 tGcA==
X-Gm-Message-State: AOAM531sUCs5/LSnlQFWj1BONMOhAu2I+CsXbpImaRmQq6R0u0Jr58Ez
 WFtutbN2ArwMVCGKZhYZVfSk6ft4Tkjoa3N6u2k=
X-Google-Smtp-Source: ABdhPJygqsDad0+VdcpnH+Nl4iJHBh66ajMkMNJefcfy3rS967n86dx4NfHxWsAx0u8LpVw7JzKszYXyD2zHAPe1i/c=
X-Received: by 2002:a05:6e02:f81:: with SMTP id
 v1mr2697755ilo.267.1616160396052; 
 Fri, 19 Mar 2021 06:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210311094738.1376795-1-georg.kotheimer@kernkonzept.com>
In-Reply-To: <20210311094738.1376795-1-georg.kotheimer@kernkonzept.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Mar 2021 09:24:47 -0400
Message-ID: <CAKmqyKN37xAZ_nGWcSVjUWvqHX2XZAZ4VmYTCjUSg4DhfQKWkw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix read and write accesses to vsip and vsie
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Fri, 19 Mar 2021 13:26:41 -0000

On Thu, Mar 11, 2021 at 4:49 AM Georg Kotheimer
<georg.kotheimer@kernkonzept.com> wrote:
>
> The previous implementation was broken in many ways:
>  - Used mideleg instead of hideleg to mask accesses
>  - Used MIP_VSSIP instead of VS_MODE_INTERRUPTS to mask writes to vsie
>  - Did not shift between S bits and VS bits (VSEIP <-> SEIP, ...)
>
> Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 68 +++++++++++++++++++++++-----------------------
>  1 file changed, 34 insertions(+), 34 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fd2e6363f3..4a5b362ec1 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -748,30 +748,42 @@ static int write_sstatus(CPURISCVState *env, int csrno, target_ulong val)
>      return write_mstatus(env, CSR_MSTATUS, newval);
>  }
>
> +static int read_vsie(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    /* Shift the VS bits to their S bit location in vsie */
> +    *val = (env->mie & env->hideleg & VS_MODE_INTERRUPTS) >> 1;
> +    return 0;
> +}
> +
>  static int read_sie(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      if (riscv_cpu_virt_enabled(env)) {
> -        /* Tell the guest the VS bits, shifted to the S bit locations */
> -        *val = (env->mie & env->mideleg & VS_MODE_INTERRUPTS) >> 1;
> +        read_vsie(env, CSR_VSIE, val);
>      } else {
>          *val = env->mie & env->mideleg;
>      }
>      return 0;
>  }
>
> -static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
> +static int write_vsie(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    target_ulong newval;
> +    /* Shift the S bits to their VS bit location in mie */
> +    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) |
> +                          ((val << 1) & env->hideleg & VS_MODE_INTERRUPTS);
> +    return write_mie(env, CSR_MIE, newval);
> +}
>
> +static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
> +{
>      if (riscv_cpu_virt_enabled(env)) {
> -        /* Shift the guests S bits to VS */
> -        newval = (env->mie & ~VS_MODE_INTERRUPTS) |
> -                 ((val << 1) & VS_MODE_INTERRUPTS);
> +        write_vsie(env, CSR_VSIE, val);
>      } else {
> -        newval = (env->mie & ~S_MODE_INTERRUPTS) | (val & S_MODE_INTERRUPTS);
> +        target_ulong newval = (env->mie & ~S_MODE_INTERRUPTS) |
> +                              (val & S_MODE_INTERRUPTS);
> +        write_mie(env, CSR_MIE, newval);
>      }
>
> -    return write_mie(env, CSR_MIE, newval);
> +    return 0;
>  }
>
>  static int read_stvec(CPURISCVState *env, int csrno, target_ulong *val)
> @@ -852,17 +864,25 @@ static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> +static int rmw_vsip(CPURISCVState *env, int csrno, target_ulong *ret_value,
> +                    target_ulong new_value, target_ulong write_mask)
> +{
> +    /* Shift the S bits to their VS bit location in mip */
> +    int ret = rmw_mip(env, 0, ret_value, new_value << 1,
> +                      (write_mask << 1) & vsip_writable_mask & env->hideleg);
> +    *ret_value &= VS_MODE_INTERRUPTS;
> +    /* Shift the VS bits to their S bit location in vsip */
> +    *ret_value >>= 1;
> +    return ret;
> +}
> +
>  static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
>                     target_ulong new_value, target_ulong write_mask)
>  {
>      int ret;
>
>      if (riscv_cpu_virt_enabled(env)) {
> -        /* Shift the new values to line up with the VS bits */
> -        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value << 1,
> -                      (write_mask & sip_writable_mask) << 1 & env->mideleg);
> -        ret &= vsip_writable_mask;
> -        ret >>= 1;
> +        ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
>      } else {
>          ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
>                        write_mask & env->mideleg & sip_writable_mask);
> @@ -1121,26 +1141,6 @@ static int write_vsstatus(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> -static int rmw_vsip(CPURISCVState *env, int csrno, target_ulong *ret_value,
> -                    target_ulong new_value, target_ulong write_mask)
> -{
> -    int ret = rmw_mip(env, 0, ret_value, new_value,
> -                      write_mask & env->mideleg & vsip_writable_mask);
> -    return ret;
> -}
> -
> -static int read_vsie(CPURISCVState *env, int csrno, target_ulong *val)
> -{
> -    *val = env->mie & env->mideleg & VS_MODE_INTERRUPTS;
> -    return 0;
> -}
> -
> -static int write_vsie(CPURISCVState *env, int csrno, target_ulong val)
> -{
> -    target_ulong newval = (env->mie & ~env->mideleg) | (val & env->mideleg & MIP_VSSIP);
> -    return write_mie(env, CSR_MIE, newval);
> -}
> -
>  static int read_vstvec(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      *val = env->vstvec;
> --
> 2.30.1
>
>

