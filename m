Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDkVy-0005rW-Dv
	for mharc-qemu-riscv@gnu.org; Wed, 11 Aug 2021 05:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mDkVv-0005pL-Md; Wed, 11 Aug 2021 05:27:08 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:46688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mDkVu-0005WV-77; Wed, 11 Aug 2021 05:27:07 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id k65so3252449yba.13;
 Wed, 11 Aug 2021 02:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vn2WSiytS/ICNdAummAe25jU+YXSVH8uxM+WI1Ny3EM=;
 b=k2LXAFxZ9CeCdR18fSp6CKHzXpwmCqQ4fWDK+j73IASjhovDqS3AhWQv1Ax741i5Ly
 MzOhLaZchDd0WilVrpZDK+q48NO3aHK6xC8bVOKfdE/Xb1JDkXL7PR+AuQRkUi5cVp07
 K7UPBMQSef8fd0XQ6zbWC6mjwACXjFFlwXfqhozo7YmAipG61tw8GGxx+5tg1bdsNK18
 vnSQQyEo9z9RslGjMl1yTLjgehfkuVh37zWfOytAciNDsm+8Nrwnf8qwBt6RZ8NZbsKT
 hUsLGmxhCaqsk/VKW9DN12M9Gmr7l6eaV3Aw5R8W0ezmmOVRTBUiQkcvf3B+VL5gJHOe
 6ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vn2WSiytS/ICNdAummAe25jU+YXSVH8uxM+WI1Ny3EM=;
 b=J8VfTuVk5lnmDyA+No4g7oCZ563yWdgkz/ZBo9VjkJLG9SF1YCQw5yOV+iBvd8x33/
 RMctmjXrOAWCD8MAZxlg/gATelKIynfSB8TXQQ/JcAI8vEuJy1XCJfhKVkSu5GYxu8Cz
 tP70N+U17c02QtjV2ts+gX/Zb1z2umVMg3pir7ElHCskmOE48zjehaMY/bKnwI4QfdoW
 1NfoZf5paNnFd2DfMZqz1mnVT1FImOBND36m7/qmGOVJpMUHd+Y1NgggIEukF/VO1U0T
 iKPiArV9Tmo8t7mBpVOMg5EADX4yrtpM8ND2OVc/3Ypl2vqdOsooNH42U2Bwo3G2guzr
 O2EQ==
X-Gm-Message-State: AOAM530hPmYQ6dZ3DaVXK8vbPRSsWm3YigS9aTsAJ1JFnFVa1POLj2i9
 a5ap/H2LmpBFzmdWG27gqUHbDNq7LBt6/3vDp/0=
X-Google-Smtp-Source: ABdhPJwhP8Yaa+66noxpIjXruv+1aiQMoKvusjiZljY/pPIunJXffim3Ko6v77Yt5aOjVD+LAAUfXc5gYoVJ/vl6fxg=
X-Received: by 2002:a25:6d44:: with SMTP id i65mr41813086ybc.517.1628674023239; 
 Wed, 11 Aug 2021 02:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210810033310.7252-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210810033310.7252-1-zhiwei_liu@c-sky.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 11 Aug 2021 17:26:52 +0800
Message-ID: <CAEUhbmUdLzc7Xt0VEFQaOPRWy-BZqv-p_9pipSzOVzQ+6mo-ig@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Don't wrongly overide isa version
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
X-List-Received-Date: Wed, 11 Aug 2021 09:27:09 -0000

On Tue, Aug 10, 2021 at 11:35 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> For some cpu, the isa version has already been set in cpu init function.
> Thus only overide the isa version when isa version is not set, or

typo: override, please fix the commit title as well

> users set different isa version explicitly by cpu parameters.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 991a6bb760..425efba0c8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -392,9 +392,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      RISCVCPU *cpu = RISCV_CPU(dev);
>      CPURISCVState *env = &cpu->env;
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
> -    int priv_version = PRIV_VERSION_1_11_0;
> -    int bext_version = BEXT_VERSION_0_93_0;
> -    int vext_version = VEXT_VERSION_0_07_1;
> +    int priv_version = env->priv_ver;
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
> +    if (!env->priv_ver) {
> +        set_priv_version(env, PRIV_VERSION_1_11_0);
> +    } else if (env->priv_ver != priv_version) {
> +        set_priv_version(env, priv_version);
> +    }

This logic seems incorrect to me. So if cpu init function does not set
the priv, and cfg set it to v1.10, v1.11 will be set in the new logic.

The previous logic makes sure the cfg value overrides the cpu init
value which seems to be intended.

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

Regards,
Bin

