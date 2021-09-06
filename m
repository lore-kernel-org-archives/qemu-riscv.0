Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mN7GC-0005my-76
	for mharc-qemu-riscv@gnu.org; Mon, 06 Sep 2021 01:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN7GA-0005jB-J2; Mon, 06 Sep 2021 01:33:34 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:42731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN7G9-0001h7-2S; Mon, 06 Sep 2021 01:33:34 -0400
Received: by mail-io1-xd2a.google.com with SMTP id b10so7208983ioq.9;
 Sun, 05 Sep 2021 22:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qb5RwbQVf56o1iwkTaKvOXv+ypJsze8HF7szfbIJjuo=;
 b=ERu6qoYqaKKihjZWYjPu7RQ9GeJQxpiJtgGPuITooeHffFcjxnQMHnrPv4DN6uF8RV
 GvD/oQ8YBaK1MPe6CDPLbm+B+KPsdvs07ril2RJZKEPw4x4AHKacr8MhKLXTv8dEfpv5
 TDIOZhAjDRDZ3x7E4Ud6l+dbwQSY9wsH8CBNHUQTcqJcKbrPsq3ixU9KzL1AFZ72KeO/
 mYOpOfW3XRYiUgBfJw1uA4otqKqnehaEKSGd8KuJk4zrMenoc0k2Azm8GKXPXMu7bTaq
 egduSQW4x2oLT+L/1RScjYO9lg7elXU7pTp91RB4AqDLbS4dmH4XxyobQjdB2iBI9lx/
 v04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qb5RwbQVf56o1iwkTaKvOXv+ypJsze8HF7szfbIJjuo=;
 b=DM2ebgVll8c7ZGAZhqgnyGiXYhlTGtQULnVF+HLZRUtS97qWZ45lgR6sG2IqZipYXB
 lST+4Yjg0vY/H8IDhLjc2Jmx2FtkTJuKNPK6jrDQqau4ALvlLo1gCvgcZTWcWx4znKcX
 roPI2Y5iirgt3ucikLT+uesDXma8MvG9TaOzvPtoja0dtrNdQpbBnvsdEYvh4oWRFYRj
 Ki3y4sPS5/i/t5oDagwQT8FI3+6QMreTkAL2A2mcNAgjyg3hJkw5DCxBKz+AIFiuhZSR
 11enLPKLlGYN4R8l3NbsoeNdfpJh1hI/Mb3Fck9GWzhpCwM8LynpKonB9d/CAYgsitqy
 Merg==
X-Gm-Message-State: AOAM5324FYmd0u7RiDyPvFM4rs3RVYOs9ZOew5sv++HiWNIfZ5BzStBQ
 /NkIue0g0If0nRobyF9eG6ZE/9fSVNAPLXsrUME=
X-Google-Smtp-Source: ABdhPJy5WYFUmHohUSmLf1DeBLyxkVbt7Tmr7ncExSj8oeB+VgYQACVmAZcGu/PjgRU7wiFT5ioczyyBJr+EYvXBDpU=
X-Received: by 2002:a05:6638:1926:: with SMTP id
 p38mr3100369jal.18.1630906411681; 
 Sun, 05 Sep 2021 22:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-6-anup.patel@wdc.com>
In-Reply-To: <20210902112520.475901-6-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Sep 2021 15:33:05 +1000
Message-ID: <CAKmqyKNjenjONzvzEP51DsOr0gRVQUJNnEWFGecZvjHyvSXYgQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/22] target/riscv: Allow setting CPU feature from
 machine/device emulation
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Mon, 06 Sep 2021 05:33:34 -0000

On Thu, Sep 2, 2021 at 9:42 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The machine or device emulation should be able to force set certain
> CPU features because:
> 1) We can have certain CPU features which are in-general optional
>    but implemented by RISC-V CPUs on machine.
> 2) We can have devices which require certain CPU feature. For example,
>    AIA IMSIC devices expects AIA CSRs implemented by RISC-V CPUs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 11 +++--------
>  target/riscv/cpu.h |  5 +++++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0ade6ad144..9dc9d04923 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -137,11 +137,6 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
>      env->vext_ver = vext_ver;
>  }
>
> -static void set_feature(CPURISCVState *env, int feature)
> -{
> -    env->features |= (1ULL << feature);
> -}
> -
>  static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
>  {
>  #ifndef CONFIG_USER_ONLY
> @@ -423,18 +418,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      }
>
>      if (cpu->cfg.mmu) {
> -        set_feature(env, RISCV_FEATURE_MMU);
> +        riscv_set_feature(env, RISCV_FEATURE_MMU);
>      }
>
>      if (cpu->cfg.pmp) {
> -        set_feature(env, RISCV_FEATURE_PMP);
> +        riscv_set_feature(env, RISCV_FEATURE_PMP);
>
>          /*
>           * Enhanced PMP should only be available
>           * on harts with PMP support
>           */
>          if (cpu->cfg.epmp) {
> -            set_feature(env, RISCV_FEATURE_EPMP);
> +            riscv_set_feature(env, RISCV_FEATURE_EPMP);
>          }
>      }
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 59b36f758f..6fe1cc67e5 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -323,6 +323,11 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
>      return env->features & (1ULL << feature);
>  }
>
> +static inline void riscv_set_feature(CPURISCVState *env, int feature)
> +{
> +    env->features |= (1ULL << feature);
> +}
> +
>  #include "cpu_user.h"
>  #include "cpu_bits.h"
>
> --
> 2.25.1
>
>

