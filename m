Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDzrL-0003JR-FY
	for mharc-qemu-riscv@gnu.org; Wed, 11 Aug 2021 21:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mDzrG-0003Fy-4c; Wed, 11 Aug 2021 21:50:10 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:34489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mDzrE-0006Dq-MA; Wed, 11 Aug 2021 21:50:09 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id a93so8539340ybi.1;
 Wed, 11 Aug 2021 18:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=effbWKpzm7BzOABnJ82MnLshCA8/xfFegnLDOCOTUwg=;
 b=he94cOQzGWUzaK04WVGfdtJ+ZoKSNoNfPv+e+egHxwcCWLaTnBUbXjO8FWD0XZDLSK
 cCpK5iCnJCK5+7AynGMOuEvKxrI7YmI6dgDCoM56yEM9z+/4bFNSTdlKlzaaq5mKfYtF
 gyO12sdLeBGXPm8R69ui/lznY2i7Fz6UoJPaKnD/ZdzByK0emGn7Qcq3083VKw1CWrl/
 Rur081ivoznNWrPBHkgh1QjO2FEO8mrMMR/5cFzwKVsrz4zymI46bBQzY3B9TcId7UOk
 rHgFf+CYiQz746k1WW1ofVIKeaRfQAD29JuQ1y4zuv3tUK4JYLtXZeiWDQgNwi4lfdUR
 GEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=effbWKpzm7BzOABnJ82MnLshCA8/xfFegnLDOCOTUwg=;
 b=LSjcZLKB8F49fqTMuYaIVJ79+jpeLakgHory1cLLlvEzZnLQD35bTamzHSSNuGkf0R
 itGDAlkIflXy+YT/18DALaNa3NLTQfxLU+YoCbVy0EyvCdmonRAzvt9EY31h+TSBKqZs
 VYZWvRvItmhypl1nNQlDlbMYEBMLK+f0pMv5SavMpSaR5386Kh9wQeSOCvRQAaGYMwLK
 b78YqXMEG6mS2fa/XuvygczIKE1VVvEo0bJHJil3D/iFdle+uwsIeAUBY5VC85tcJtsa
 wOyO8AmWjx2IuRyOQpzhkOvMCwwvf/mjEWFYA5Ajn4EOYEKBi3vEjJPAc0PcEm4KnaE+
 GeaA==
X-Gm-Message-State: AOAM530fMxEmYbj8g0R63EI4ZMbHv68zUL4f6ILuRKHn6mPVCQVtTYZo
 uA78WO+3TuY8qHKDWIt1enkXYzuhjKXZVbNVjqA=
X-Google-Smtp-Source: ABdhPJwAp66qEV4R0Mdq/jQfgwUuofX/jGgYH3i6gmbuamO9Ai84kmzvCWnsWT3Tt/GJtZ3gYXIPcDVnhvMBF8vuJ94=
X-Received: by 2002:a25:6c04:: with SMTP id h4mr1265749ybc.122.1628733006939; 
 Wed, 11 Aug 2021 18:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210811144612.68674-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210811144612.68674-1-zhiwei_liu@c-sky.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 12 Aug 2021 09:49:56 +0800
Message-ID: <CAEUhbmVK32k271Z6gjFV8yMPFng6OoAvjfNXeR6fv4zMMoBYdg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Don't wrongly override isa version
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 12 Aug 2021 01:50:10 -0000

On Wed, Aug 11, 2021 at 10:46 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> For some cpu, the isa version has already been set in cpu init function.
> Thus only override the isa version when isa version is not set, or
> users set different isa version explicitly by cpu parameters.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Please include a changelog in the newer version in the future.

>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 991a6bb760..1a2b03d579 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -392,9 +392,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      RISCVCPU *cpu = RISCV_CPU(dev);
>      CPURISCVState *env = &cpu->env;
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
> -    int priv_version = PRIV_VERSION_1_11_0;
> -    int bext_version = BEXT_VERSION_0_93_0;
> -    int vext_version = VEXT_VERSION_0_07_1;
> +    int priv_version = 0;
>      target_ulong target_misa = env->misa;
>      Error *local_err = NULL;
>
> @@ -417,9 +415,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          }
>      }
>
> -    set_priv_version(env, priv_version);
> -    set_bext_version(env, bext_version);
> -    set_vext_version(env, vext_version);
> +    if (priv_version) {
> +        set_priv_version(env, priv_version);
> +    } else if (!env->priv_ver) {
> +        set_priv_version(env, PRIV_VERSION_1_11_0);
> +    }
>
>      if (cpu->cfg.mmu) {
>          set_feature(env, RISCV_FEATURE_MMU);
> @@ -497,6 +497,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              target_misa |= RVH;
>          }
>          if (cpu->cfg.ext_b) {
> +            int bext_version = BEXT_VERSION_0_93_0;
>              target_misa |= RVB;
>
>              if (cpu->cfg.bext_spec) {
> @@ -515,6 +516,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              set_bext_version(env, bext_version);
>          }
>          if (cpu->cfg.ext_v) {
> +            int vext_version = VEXT_VERSION_0_07_1;
>              target_misa |= RVV;
>              if (!is_power_of_2(cpu->cfg.vlen)) {
>                  error_setg(errp,
> --

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

