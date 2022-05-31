Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nvpVA-00034Q-ON
	for mharc-qemu-riscv@gnu.org; Mon, 30 May 2022 20:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nvpV8-000310-Ca; Mon, 30 May 2022 20:12:46 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:42138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nvpV6-0004Wr-CH; Mon, 30 May 2022 20:12:45 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so16215474fac.9; 
 Mon, 30 May 2022 17:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xgeGj4fJm/gjUi6c3f/PZ9X31QJWQoEDbT23yLh0YCY=;
 b=GSi9i2GlvMBOMRlJgddzYlSNUxeTrGP/hQe/QsXSv/F762DylxoFQ1R4bVvIuV89Y0
 TcE8yd7feusR1IwYrckeS7V8JtSBqZivtmqItg7FWonSHtcJIvG/mBSs2ze45+LT8Vve
 AGgZr9JVzkXeNlVhxSPT8t+AffO8fxHFySTdsfJjIAvdG+QuuXU55QgicTcYNdgKBUFv
 nx6KiSiME5flpoCbpXOlJ4JCfBATQgKVL0a9krVVk9dy2EiuYK8nD9jxmAuIbjJYS42C
 0ISg3Z1qKMZeELAY7xfGIguX481uXHs21dLqatKzRarVotbJrK+h7InXeP3LLAoK2Vzu
 sjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xgeGj4fJm/gjUi6c3f/PZ9X31QJWQoEDbT23yLh0YCY=;
 b=ySHPGYbUKJHpYSDajHV733n8Knr+Y9ydFnoAmFsHCdWb7W8nAU7ZQcQ9h+kLKcJng7
 3Au3fxnw7/QkXj+4ZkuofJ3RiYziQnQ2cZp4Fu1+s8TTf+MW3jqQWmfAmMshcpPnmoJC
 nQjzn2R7O+wzIAUoRoP8BWse43Dnv+hWozuzbMmL6bvjkfImS4RPCQar9NckHr7xMaTh
 ygIGAL+LJao2mGWPlH4rMpV1FHCCeKwTM93mp22cVACcF05EZvgXvetjIfNOO1rwp9Li
 RU4OaSjybzWocujxpJ55lF0LtO2FIbklT9k4iJL2PWLSxmhx+mSSMNtux90ibNRMVgKD
 R8Qg==
X-Gm-Message-State: AOAM531c8YBQ1hGzLalzuWbE7Z4/nfeCphcpjhUCLfzhRxz3v5FbHJKY
 UBS31wLoqNDpwfLMLkzuTrPBDSQ0gL1XbZ589n4=
X-Google-Smtp-Source: ABdhPJxipPNrBtlo/5vjVdftitEvsT9o5PA940rsd54PL2EQiGkMGkQP53Cdj0xHWAnyY17hBh4FTCLMtqEx4400bP4=
X-Received: by 2002:a05:6870:2047:b0:e9:1b34:fbe with SMTP id
 l7-20020a056870204700b000e91b340fbemr11937610oad.64.1653955962878; Mon, 30
 May 2022 17:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220523235057.123882-1-atishp@rivosinc.com>
 <20220523235057.123882-13-atishp@rivosinc.com>
In-Reply-To: <20220523235057.123882-13-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 May 2022 10:12:16 +1000
Message-ID: <CAKmqyKMWwGWtpcjSwtMr4f-z0-_9Fsb29DkaAae2FD5CUEv=ZQ@mail.gmail.com>
Subject: Re: [PATCH v9 12/12] target/riscv: Update the privilege field for
 sscofpmf CSRs
To: Atish Patra <atishp@rivosinc.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x2c.google.com
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
X-List-Received-Date: Tue, 31 May 2022 00:12:46 -0000

On Tue, May 24, 2022 at 9:59 AM Atish Patra <atishp@rivosinc.com> wrote:
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
> index e229f53c674d..c6105edd7a1a 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -4012,63 +4012,92 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
> @@ -4158,7 +4187,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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

