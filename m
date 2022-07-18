Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDZt2-0000qY-EM
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jul 2022 19:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDZt0-0000ot-DZ; Mon, 18 Jul 2022 19:10:46 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDZsy-0006ni-RX; Mon, 18 Jul 2022 19:10:46 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 g4-20020a17090a290400b001f1f2b7379dso783606pjd.0; 
 Mon, 18 Jul 2022 16:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bZ2R7avgs1JfeV+HXMQdIL7tlDWUcDEEYyfmzT99d38=;
 b=ChPidpo/JYvE52Du3cieulYpv8wqtTvIx3O03C2ESqGFihvjFfo2A2ZkcgAJtwTBh8
 ZsP0YVMjK8f11nrhlvSVofcGQTkXokikua2EBvt1FM/ME5bfhEkt+VjpK18/Ndec3eBN
 YifuyWc2PvCzV4ijeybQtN7LTprtZ8a7X3Hz4HDLsXLtXzyJzWCosYkXsIPXjxchRK0l
 BzQUQZvGqeFkSj3u7dqMt/QUPxBIGdnh2LCyeGEi6HyhQ8Yz84aSEbX5WUe+obpnV2Bu
 VDTg16UtMRRn7xighOJt9nA/RNB7dJ1O1KDv0ZQ+PLCvvayrTSSqHETbtb6BMJ+BeLcS
 YjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bZ2R7avgs1JfeV+HXMQdIL7tlDWUcDEEYyfmzT99d38=;
 b=HLgbsaK3Fx2MViK2As+jRkRnBLB/+2gdm/F7pYOR5DpVC+wprPo4lrI9emsBK5G8rF
 zS2O0MmpocHEMb0BzjSEaEvcL07fq0UkxsoK4/oYVpvS7Q06DPpXxXE/3TRrLvCNglw2
 6B69Ii7cXE1fdFV9Wd/6VvC4DY0xcrvVycdgJ2/sLucow+T0Rkaui/jUOilah5HlocTs
 d65v8kks1Ldj6o6g3ImJcfJkXtUq9yi4Qlll6giWZvGhk+1Pv+EE4O97NrYKnwMAtHFi
 W+Ev+WtFEgADg1xrQK0JsFKVf0oXWYwRwAMGmuASxGQQzRUEkopzFbXHGSrDNf4A14Eq
 qa9Q==
X-Gm-Message-State: AJIora+UthfDSeCYLNTzlU2MLroQeNhbvu555zZ5Fqf85J4scyNw+Oj+
 wk/u+86SlS4thIkMn8TxDVQq7dyAkMyt0wZVqYA=
X-Google-Smtp-Source: AGRyM1uOFANOPdzRlOXZkfe9NdRKFtC7WbT/1dp/8V/5ZqOWOUZbgC6AhrgO2tYZcL1tzQBf7zJ+3VTBRbRZZWQfnFI=
X-Received: by 2002:a17:902:690a:b0:16c:f877:d89d with SMTP id
 j10-20020a170902690a00b0016cf877d89dmr4308010plk.25.1658185842031; Mon, 18
 Jul 2022 16:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220718130955.11899-1-liweiwei@iscas.ac.cn>
 <20220718130955.11899-6-liweiwei@iscas.ac.cn>
In-Reply-To: <20220718130955.11899-6-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jul 2022 09:10:15 +1000
Message-ID: <CAKmqyKPyG=A3+T=wLjEFHaHDu1MuYPxhA3KT-HqPAuKTKXh0jw@mail.gmail.com>
Subject: Re: [PATCH V3 5/6] target/riscv: Fix checks in hmode/hmode32
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 18 Jul 2022 23:10:46 -0000

On Mon, Jul 18, 2022 at 11:13 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Add check for the implicit dependence between H and S
>
> Csrs only existed in RV32 will not trigger virtual instruction fault
> when not in RV32 based on section 8.6.1 of riscv-privileged spec
> (draft-20220717)
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 5 +++++
>  target/riscv/csr.c | 9 ++-------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b8ce0959cb..455787a940 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -738,6 +738,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>
> +        if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
> +            error_setg(errp, "H extension implicitly requires S-mode");
> +            return;
> +        }
> +
>          if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
>              error_setg(errp, "F extension requires Zicsr");
>              return;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5c69dc838c..cf15aa67b7 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -311,8 +311,7 @@ static int aia_smode32(CPURISCVState *env, int csrno)
>
>  static RISCVException hmode(CPURISCVState *env, int csrno)
>  {
> -    if (riscv_has_ext(env, RVS) &&
> -        riscv_has_ext(env, RVH)) {
> +    if (riscv_has_ext(env, RVH)) {
>          /* Hypervisor extension is supported */
>          if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
>              env->priv == PRV_M) {
> @@ -328,11 +327,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
>  static RISCVException hmode32(CPURISCVState *env, int csrno)
>  {
>      if (riscv_cpu_mxl(env) != MXL_RV32) {
> -        if (!riscv_cpu_virt_enabled(env)) {
> -            return RISCV_EXCP_ILLEGAL_INST;
> -        } else {
> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -        }
> +        return RISCV_EXCP_ILLEGAL_INST;
>      }
>
>      return hmode(env, csrno);
> --
> 2.17.1
>
>

