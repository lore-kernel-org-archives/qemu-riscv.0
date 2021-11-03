Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi9JN-0008Ph-7h
	for mharc-qemu-riscv@gnu.org; Wed, 03 Nov 2021 01:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi9JL-0008PP-GD; Wed, 03 Nov 2021 01:59:47 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:41522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi9JK-0003KE-0L; Wed, 03 Nov 2021 01:59:47 -0400
Received: by mail-io1-xd33.google.com with SMTP id p193so1454647iod.8;
 Tue, 02 Nov 2021 22:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z6qKtCw7KkdgXoUYDZMGal0231xBhV3C1bWK38SqF1Y=;
 b=Nr2h39XW8TPCx6blCrKFC1dQ7ruAWSmTCSol0DAUV2N7uwwK5s5nluIRPZ5OYOV+wm
 qmU2xnqBDpNPX04xOL+WBIENVkNVRsVUabLNwuXfK2mHv5YimzH0DPvmKLFnzqssBOU5
 zT67zHKvH4YqjrYFDs2grX3EnXZGCgt9j7Svuj55z4v+NOsfO8oc0Vm0cdVx8O91xdfv
 AT/VpwjuzIdQlF9qhmNTokO3+qKco21Ls1f4VE0NwNMER7W126tVSqzKcd4dYAyAdDiS
 NGNeOv6I2wE0jkRGa/Z265n1nQvFUlwutm3TBETdCuM1lutxB1jN4jwfN2AE/ZPNYgOY
 Z5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z6qKtCw7KkdgXoUYDZMGal0231xBhV3C1bWK38SqF1Y=;
 b=4W4kQdg/b7eOlESllxKdDY8fhonNim5ATDExyvq3DHJepVQIGPAnBjlA1LtMYFWTF5
 BWr+qb5JdSg5bIVGYRxP8UTnLsThFkzH5GIO/pwJHlls+Qq+hKSXP7OFkbRUE9k8mGQf
 qEsR3xG9+Pn0MW0f+yJ6ty3A4m1fxxqQCGhGmdhUXqyKB7t9f40m7/Y7EgAgn36702bu
 Zes2ihOG4HrUn/3UBMVuUfWbFtk5VAssM4ytuUEqFMSOhuHoNQg0ldn3NYscUphNnJj4
 48nhjmlhyNVuLoUVRG9sMtBsDSXoBkw/nmFBkss9BFzvI10I47sLgSxIcyKSZet3NXdm
 ZdbA==
X-Gm-Message-State: AOAM530hWZ23JiPIjnasXBz3V0cPJCH3mzB4Yq0zVWuTl54qupBIEEHM
 gjz/RHVS/tcAL4qTIzCNqHhU50pmuciZ8Ffg8aE=
X-Google-Smtp-Source: ABdhPJwGmFtgV4QDqq50J2yiHKWLMSpDfknV0Uto2vPeKM24aUPcExbxF8+ggpnOQKh5/Ct2xZR7I13gbih84OgeZIY=
X-Received: by 2002:a05:6602:2434:: with SMTP id
 g20mr2319923iob.57.1635919184681; 
 Tue, 02 Nov 2021 22:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211030135513.18517-1-bin.meng@windriver.com>
 <20211030135513.18517-5-bin.meng@windriver.com>
In-Reply-To: <20211030135513.18517-5-bin.meng@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Nov 2021 15:59:18 +1000
Message-ID: <CAKmqyKPp1qecL9icfRq+_waK7tJUt-UqRmmsbB9EesaptYxjgw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] target/riscv: cpu: Add a config option for native
 debug
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Wed, 03 Nov 2021 05:59:47 -0000

On Sat, Oct 30, 2021 at 11:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Add a config option to enable support for native M-mode debug.
> This is disabled by default and can be enabled with 'debug=true'.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - change the config option to 'disabled' by default
>
>  target/riscv/cpu.h | 2 ++
>  target/riscv/cpu.c | 5 +++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 1fb13e8b94..b2301425c2 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -75,6 +75,7 @@ enum {
>      RISCV_FEATURE_MMU,
>      RISCV_FEATURE_PMP,
>      RISCV_FEATURE_EPMP,
> +    RISCV_FEATURE_DEBUG,
>      RISCV_FEATURE_MISA
>  };
>
> @@ -327,6 +328,7 @@ struct RISCVCPU {
>          bool mmu;
>          bool pmp;
>          bool epmp;
> +        bool debug;
>          uint64_t resetvec;
>      } cfg;
>  };
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7061ae05fb..84116768ce 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -448,6 +448,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          }
>      }
>
> +    if (cpu->cfg.debug) {
> +        set_feature(env, RISCV_FEATURE_DEBUG);
> +    }
> +
>      set_resetvec(env, cpu->cfg.resetvec);
>
>      /* Validate that MISA_MXL is set properly. */
> @@ -631,6 +635,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> +    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
>
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>
> --
> 2.25.1
>
>

