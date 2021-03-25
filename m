Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lPWTl-0007HJ-1l
	for mharc-qemu-riscv@gnu.org; Thu, 25 Mar 2021 16:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lPWTk-0007FG-0k; Thu, 25 Mar 2021 16:21:16 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:34767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lPWTg-0006cY-5Y; Thu, 25 Mar 2021 16:21:15 -0400
Received: by mail-il1-x133.google.com with SMTP id u2so3239343ilk.1;
 Thu, 25 Mar 2021 13:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OnncyjV4V+jOrLDw/zKcMlCnelP5FWDhQtRnigqlw/E=;
 b=hqfTVr2/NIpMPiggrjg3xSJTGirkNX5f0vWxLTqonlm4eJWU9TAq8o7IALZ+p+rDBU
 z3npuJATMeJSIqL1JeUI81EqUbEMxn3JOajei5gUdbGhjLRF9gh9RzRHjn6+J2JFMb4f
 UPKcmC0GOWbhxkWMvgmWmKsVmP9opeUB19UplPbAyHcLNLN8OxgVzyB/DwlRJmDo5t19
 DZpcZiqlvNp1+s6ATGhwyeqL4QsVlhlzUJmoHkEQ/WQK53OUgM0g/ign9HLphXUI3NCB
 OgRP1LWCsJdnxLilZ/5X6zJsx1svOKlKTcByzPtVfmTH9T4FDDnFywuT5invTwP4MqGq
 XfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OnncyjV4V+jOrLDw/zKcMlCnelP5FWDhQtRnigqlw/E=;
 b=tm8C+vtE/yZNVplKtqBWM/gPwOZjNgAIWbzc+BldUbiW5gOd2ceU7LkmquNe04KYm0
 MECyiO/Dv0KcRHoc608BiJkE5FoAOnplTmvrMIXKknGNhVXQZj2JX9+7fNfP6UYvQF+0
 FTg8VfkU2UoPXl+FpwyWvMqhc4wtM+Utgwzfs0jBsIpt4Gw+O84TIn2Be9xwnD5ABVfu
 EG4eWVEjehkeKI3d3C1Zr04lGlPkVtUS6iuI5sKUy8ka8r+FM/97lMw1w+ea6jAS6MfC
 Q0AIbiN/lruiKcvNm67EYdSwY4oOPqsObrgrUmCtxFSFlbFVwi5QYrpmPWRvmhGyHx8L
 JOFw==
X-Gm-Message-State: AOAM531ZddhyW5LoEHVPq0F+KJw7rujme0dkakf3ekWKxa+77Gr40/eg
 ykcUO90poreKp8shU3dFi7yIDt4qnnvpvGAm8PE=
X-Google-Smtp-Source: ABdhPJzN7Qz6PPHsi9gGv53wPx9PQaEN5eFq5TFvdB1DeMMpCBN1TV1BXsZr13rmba+dsrxaemZD+1onCj2lxVIQwLI=
X-Received: by 2002:a92:da89:: with SMTP id u9mr4428798iln.131.1616703669998; 
 Thu, 25 Mar 2021 13:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210325094150.28918-1-dylan@andestech.com>
In-Reply-To: <20210325094150.28918-1-dylan@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 Mar 2021 16:19:09 -0400
Message-ID: <CAKmqyKMGROe+k8=f=_Vw8eLwo-PF-ENQeoD+WSte_G8dRHmatg@mail.gmail.com>
Subject: Re: [PATCH V3] target/riscv: Align the data type of reset vector
 address
To: Dylan Jhong <dylan@andestech.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "Ruinland Chuan-Tzu Tsa(((((((((()" <ruinland@andestech.com>,
 Bin Meng <bmeng.cn@gmail.com>, x5710999x@gmail.com, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Thu, 25 Mar 2021 20:21:16 -0000

On Thu, Mar 25, 2021 at 5:43 AM Dylan Jhong <dylan@andestech.com> wrote:
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> ---
>  target/riscv/cpu.c | 6 +++++-
>  target/riscv/cpu.h | 2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d6ed80f6b..8a5f18bcb0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -137,7 +137,7 @@ static void set_feature(CPURISCVState *env, int feature)
>      env->features |= (1ULL << feature);
>  }
>
> -static void set_resetvec(CPURISCVState *env, int resetvec)
> +static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
>  {
>  #ifndef CONFIG_USER_ONLY
>      env->resetvec = resetvec;
> @@ -554,7 +554,11 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> +#if defined(TARGET_RISCV32)
> +    DEFINE_PROP_UINT32("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> +#elif defined(TARGET_RISCV64)
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> +#endif

Thanks for the patch!

I don't want to introduce any more define(TARGET_* macros as we are
trying to make RISC-V QEMU xlen independent.

The hexagon port has an example of how you can use target_ulong here:

    DEFINE_PROP_UNSIGNED("lldb-stack-adjust", HexagonCPU, lldb_stack_adjust,
                         0, qdev_prop_uint32, target_ulong);

can you do something like that instead?

Alistair

>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0a33d387ba..d9d7891666 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -303,7 +303,7 @@ struct RISCVCPU {
>          uint16_t elen;
>          bool mmu;
>          bool pmp;
> -        uint64_t resetvec;
> +        target_ulong resetvec;
>      } cfg;
>  };
>
> --
> 2.17.1
>
>

