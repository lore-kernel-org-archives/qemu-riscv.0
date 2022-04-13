Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1neX8M-0005qx-2W
	for mharc-qemu-riscv@gnu.org; Wed, 13 Apr 2022 03:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1neX7z-0005nH-6G; Wed, 13 Apr 2022 03:09:32 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:37769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1neX7s-00066k-AJ; Wed, 13 Apr 2022 03:09:18 -0400
Received: by mail-io1-xd34.google.com with SMTP id p21so894852ioj.4;
 Wed, 13 Apr 2022 00:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1O1VvMcvqQL4NFoBg/JIBC33I3IIyl+GYTCn41EDN7o=;
 b=B7S5K9zQSuINJU6hElOc4TIGgGBpw1QFMugNWBrKUPepELubOByvs+I+19T/KUdnmf
 st2/tAVqOQoBbNaqJuhO0H/ZedAAj/4tA/G6PUO70+eKklzF17v1YltpNqF/W+1vztJY
 sFcKn33lRih7P/pXci4Ho1KSBGtDn7cA647hmENgM62/M+an5kd2sJtMg24Op2QJjYEj
 cftFxzNUkN9zzpZ41VplZYUH4kcqu9uQq689Wdkx/tNqN/Hg8N2rce7kS/SZR8Iz2Hdi
 CAhbadNOMriaKe21N0fb7CkFzzCEEBDV5MXaUKGDmxm75hWQCXAh9dknpn1nxL+R1tXe
 Thgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1O1VvMcvqQL4NFoBg/JIBC33I3IIyl+GYTCn41EDN7o=;
 b=oM/CXgpJOQMV8ENXxvQAnmABRRPHKU6mwYsiQU5cegNy9tuZpkxN+lGOxIB+Nu95gn
 J/e1su4eniagZEEhMQZKHPutzq9xIFdhEAeT71Iy7o21C3jpnX4YdkIXI9VhWnT8yyal
 Ww8vfJUwDFlxkw3ubMLONrudjuA6rf00hjQVrkgtAWHaayc4HRaVNPzInEJVP8hIyGZ5
 sb8QjchLE6bZaaD1YGfE+cMtjJ0j1iwRFYaYUGghSy78oKCveo3cSzUmo24DgzzYHEfc
 B+splrJ/3d09LJc8H1qZ0k9yhXOVDr48TPicLhT5UWHiZ4l5gg1QKkoST5hRezrG5fpY
 DmzQ==
X-Gm-Message-State: AOAM5323pm8uYruRueOYVnqLC0Q5KL8hrM+ih6XrROmK3xkg+Zx4TFOJ
 E7M6P70Tq+uBlfM1MlzwmXrXmnpvYeNCVPmRxC4=
X-Google-Smtp-Source: ABdhPJwpZI0+mEwf0h+FVqYu0wD9hdPexis35rmkO1UMMpcJGHFgNiBjgI2tM4pcACPA1tZVca96n/rXOKGAcybIX8M=
X-Received: by 2002:a5d:948a:0:b0:64d:23a4:9afa with SMTP id
 v10-20020a5d948a000000b0064d23a49afamr10973669ioj.114.1649833754580; Wed, 13
 Apr 2022 00:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220331000127.2107823-1-atishp@rivosinc.com>
 <20220331000127.2107823-13-atishp@rivosinc.com>
In-Reply-To: <20220331000127.2107823-13-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Apr 2022 17:08:48 +1000
Message-ID: <CAKmqyKPN9+y64=ujDsQ=X0ZGsRQ9WrDxjmMEfE5BABn_3Am1BQ@mail.gmail.com>
Subject: Re: [PATCH v7 12/12] target/riscv: Update the privilege field for
 sscofpmf CSRs
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Wed, 13 Apr 2022 07:09:37 -0000

On Thu, Mar 31, 2022 at 10:31 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The sscofpmf extension was ratified as a part of priv spec v1.12.
> Mark the csr_ops accordingly.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 90 ++++++++++++++++++++++++++++++----------------
>  1 file changed, 60 insertions(+), 30 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 20bdae7fe354..b2221b6beeeb 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3873,63 +3873,92 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                                                         write_mhpmevent },
>
>      [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT4H]    = { "mhpmevent4h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT5H]    = { "mhpmevent5h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT6H]    = { "mhpmevent6h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT7H]    = { "mhpmevent7h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT8H]    = { "mhpmevent8h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT9H]    = { "mhpmevent9h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                          write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT10H]   = { "mhpmevent10h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT11H]   = { "mhpmevent11h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT12H]   = { "mhpmevent12h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT13H]   = { "mhpmevent13h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT14H]   = { "mhpmevent14h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT15H]   = { "mhpmevent15h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT16H]   = { "mhpmevent16h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT17H]   = { "mhpmevent17h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT18H]   = { "mhpmevent18h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT19H]   = { "mhpmevent19h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT20H]   = { "mhpmevent20h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT21H]   = { "mhpmevent21h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT22H]   = { "mhpmevent22h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT23H]   = { "mhpmevent23h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT24H]   = { "mhpmevent24h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT25H]   = { "mhpmevent25h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT26H]   = { "mhpmevent26h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT27H]   = { "mhpmevent27h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT28H]   = { "mhpmevent28h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT29H]   = { "mhpmevent29h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT30H]   = { "mhpmevent30h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MHPMEVENT31H]   = { "mhpmevent31h",    sscofpmf,  read_mhpmeventh,
> -                                                       write_mhpmeventh},
> +                                                           write_mhpmeventh,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>
>      [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_hpmcounterh },
>      [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_hpmcounterh },
> @@ -4019,7 +4048,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                                                         write_mhpmcounterh },
>      [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf },
> +    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
> +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>
>  #endif /* !CONFIG_USER_ONLY */
>  };
> --
> 2.25.1
>
>

