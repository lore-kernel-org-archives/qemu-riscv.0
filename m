Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miUkX-0003IF-2n
	for mharc-qemu-riscv@gnu.org; Thu, 04 Nov 2021 00:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1miUkV-0003Et-HU; Thu, 04 Nov 2021 00:53:15 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:33783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1miUkT-0000Zb-Se; Thu, 04 Nov 2021 00:53:15 -0400
Received: by mail-io1-xd2d.google.com with SMTP id z206so5629333iof.0;
 Wed, 03 Nov 2021 21:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k0yU8KNgspa+wZFzYooCw4axOC8BAYss7iJrlzjQjdI=;
 b=PTAb84+Ukvy7L/IodJyaZ22j6RHLjJyg0ZHIM+E+2rp2xVvUHKsmlPbLcCIkT04cR6
 2cFj+FQgZCViZ9gQg/zRkfbYCiEWVi9nS5ubEBade6pQrOciYLFdSmVVsuPGLJYS7RHl
 MtjhWJkwfwK1lXtfBJHKXjL3c8h5VEoyLbLLjRuNmKeW70GKXtSte//AeXzeC0BNi6cj
 NPl1z772ySDtQNjfBL8FOHFL9H0MvqOiSVP3hxD9gQNL+rffSR8taobv4i6uqlCCDcyU
 AvtC1CskWUghWQdGw22T6iIJfdAc8oe2sEXz8yr7+mf6WwSP9ctkqxvmUXF8u0tpdhX0
 eQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0yU8KNgspa+wZFzYooCw4axOC8BAYss7iJrlzjQjdI=;
 b=EYI7pmMH9ifPQEE7T6kWJDzS320NDb/lvL33ecITM1+rQkSiLVCMCbpDRYwlzc/k+U
 Gii8OfKT56FQDN/eOwxrw3/1Y1VU/8+k0u7xvXvTjnHzpe/Ge9SyEBFqeGwADDoKC1FS
 TFjjWarRafHZ/6yl4nkeV6POgcYoh5uSwkxXTerrnxyPQ+FDdsnip5qIP/Ne9B9wqTPs
 dmPSKLisKICWiDdW5qHmQnAUAoAb1SG0eYi/UziL5H3YyRpOlZcgf0nMn+y0KQojAT0B
 SiBSXk4nOKUURcpKNFv1zA2/gxlRJfpEpKy+MJj4uPc5lehmtiO0CR70aeUQ/MfEGD9f
 dIaw==
X-Gm-Message-State: AOAM532q6AExYcUhuN3+6C2p+aoyOBKZdDqPXM9k3l/PArobvoUTGHiI
 JJAqqHi+Vi6X6T1Eer1XxnCWKPOO8cUSt1S/uwcR8AUvDRoq0jyL
X-Google-Smtp-Source: ABdhPJzge1NMAkYn/dH2xVc9rh05b+EqYeKxfi+lKsXUN4vmXlrt6XhQjLfApoKHX/5ly60XzbJeqfGVFYi0V6wdPqM=
X-Received: by 2002:a05:6602:2e8c:: with SMTP id
 m12mr34334336iow.91.1636001592490; 
 Wed, 03 Nov 2021 21:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-9-anup.patel@wdc.com>
In-Reply-To: <20211026064227.2014502-9-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Nov 2021 14:52:46 +1000
Message-ID: <CAKmqyKOQm1Cz39vmaz0McP6OD=GoOptL0BxC+z6bzFwUCnx0pQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/22] target/riscv: Allow AIA device emulation to set
 ireg rmw callback
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Thu, 04 Nov 2021 04:53:15 -0000

On Tue, Oct 26, 2021 at 6:00 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The AIA device emulation (such as AIA IMSIC) should be able to set
> (or provide) AIA ireg read-modify-write callback for each privilege
> level of a RISC-V HART.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  target/riscv/cpu.h        | 19 +++++++++++++++++++
>  target/riscv/cpu_helper.c | 14 ++++++++++++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7182fadd21..ef4298dc69 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -239,6 +239,18 @@ struct CPURISCVState {
>      uint64_t (*rdtime_fn)(uint32_t);
>      uint32_t rdtime_fn_arg;
>
> +    /* machine specific AIA ireg read-modify-write callback */
> +#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein) \
> +    ((((__vgein) & 0x3f) << 24) | (((__virt) & 0x1) << 20) | \
> +     (((__priv) & 0x3) << 16) | (__isel & 0xffff))
> +#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
> +#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
> +#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 20) & 0x1)
> +#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 24) & 0x3f)

These should be added when they are used

Alistair

> +    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
> +        target_ulong *val, target_ulong new_val, target_ulong write_mask);
> +    void *aia_ireg_rmw_fn_arg[4];
> +
>      /* True if in debugger mode.  */
>      bool debugger;
>  #endif
> @@ -380,6 +392,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
>  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
>  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
>                               uint32_t arg);
> +void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
> +                                   int (*rmw_fn)(void *arg,
> +                                                 target_ulong reg,
> +                                                 target_ulong *val,
> +                                                 target_ulong new_val,
> +                                                 target_ulong write_mask),
> +                                   void *rmw_fn_arg);
>  #endif
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 04df3792a8..d70def1da8 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -375,6 +375,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
>      env->rdtime_fn_arg = arg;
>  }
>
> +void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
> +                                   int (*rmw_fn)(void *arg,
> +                                                 target_ulong reg,
> +                                                 target_ulong *val,
> +                                                 target_ulong new_val,
> +                                                 target_ulong write_mask),
> +                                   void *rmw_fn_arg)
> +{
> +    if (priv <= PRV_M) {
> +        env->aia_ireg_rmw_fn[priv] = rmw_fn;
> +        env->aia_ireg_rmw_fn_arg[priv] = rmw_fn_arg;
> +    }
> +}
> +
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>  {
>      if (newpriv > PRV_M) {
> --
> 2.25.1
>
>

