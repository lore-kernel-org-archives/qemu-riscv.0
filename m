Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmB5w-00053d-Sx
	for mharc-qemu-riscv@gnu.org; Wed, 04 May 2022 05:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmB5u-00051C-6g; Wed, 04 May 2022 05:14:50 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:45028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmB5r-0001je-0W; Wed, 04 May 2022 05:14:49 -0400
Received: by mail-il1-x135.google.com with SMTP id o5so490865ils.11;
 Wed, 04 May 2022 02:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JhU/zBQhiskbwHjq1GRWUrseVgf3rpQdzN9S7AwLkbU=;
 b=lfikno+IqspIa/yDZTLWLWPBZqsYeD+d9GFU2wzF0D6tcVBnKiCuS+0vhIpg+tfN5O
 xYBTCOyhAojqblzZ3iXF0cIGSTY71F9pAQABgfPXznn1HgGiF8nPcuvE97ADag8y7cog
 QfAtVDnKiTNX/hnJR+M+yElaQEMfSUJYppCUVK6c9AzqbFTW77IeI15SXRep2AgizhOd
 xPqPOvb0W6JofNusBZwr2qT7Dq5UvOdqwh66LfKvwq3WzCJv4BAgrXWV/iQkac0PRAxr
 QXpZfNyY0nL8B5Q0S6aLINyEj605WAm91LVBNyc2EMJJR2RvVHfPMKDS/KmgoBIoOvUe
 /4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JhU/zBQhiskbwHjq1GRWUrseVgf3rpQdzN9S7AwLkbU=;
 b=6GgG+deJQj+iEWEPirMkhJ42WOnBxLs21dwcqSOL5wzuWPt2GCqVyXIleXpkDd2q4q
 qh7GWZzJTABwDMyk200Xr8bbpun8MGgrbTSEDh4GQ7us5lj7JmqrS7zButuXiBpT9GTZ
 jAKhy0mjq/FQE6IOTgT093ueLLV2sibFJFUmRGHe5QX/do2xzMxvrntR0txF+drUWBma
 G/1NiVZuRUeFiYiUOBwykowvuT/eGDUJYsryzZnnaAPnoAYCotE3lu0vT64BXO5QfS4P
 fPh8xqXJIIzrhmBM+rrWTyYfZem4+Xas3CXVON8rIAud3BnFJVrsr1spo74a9O8WHzR/
 UI2A==
X-Gm-Message-State: AOAM5311IIKqpAK0my5IDVLw488zpE0agw8GfaERsKx8nMdSQTNJtgp5
 ywDb4cY2rjhgch2cXNvJ4Y9FqGt5EudxoBKbnXo=
X-Google-Smtp-Source: ABdhPJyuZINklg70UWXqbs2EXBSOyRbttKfXml/hVGENS+FNLaZtzCvH1jjNxaS1fgYDxtsHVDhZLxjyGXsFry2+Loc=
X-Received: by 2002:a92:6012:0:b0:2bd:fb5f:d627 with SMTP id
 u18-20020a926012000000b002bdfb5fd627mr8186652ilb.86.1651655685552; Wed, 04
 May 2022 02:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220429153431.308829-1-apatel@ventanamicro.com>
 <20220429153431.308829-3-apatel@ventanamicro.com>
In-Reply-To: <20220429153431.308829-3-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 May 2022 19:14:19 +1000
Message-ID: <CAKmqyKMqWCUc18ETQFG7wV554wk3b481bEVrtyebFnsWz_gV9w@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/riscv: Add dummy mcountinhibit CSR for priv
 spec v1.11 or higher
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Wed, 04 May 2022 09:14:50 -0000

On Sat, Apr 30, 2022 at 2:13 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The mcountinhibit CSR is mandatory for priv spec v1.11 or higher. For
> implementation that don't want to implement can simply have a dummy
> mcountinhibit which always zero.
>
> Fixes: a4b2fa433125 ("target/riscv: Introduce privilege version field in
> the CSR ops.")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h | 3 +++
>  target/riscv/csr.c      | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 4d04b20d06..4a55c6a709 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -159,6 +159,9 @@
>  #define CSR_MTVEC           0x305
>  #define CSR_MCOUNTEREN      0x306
>
> +/* Machine Counter Setup */
> +#define CSR_MCOUNTINHIBIT   0x320
> +
>  /* 32-bit only */
>  #define CSR_MSTATUSH        0x310
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 2bf0a97196..e144ce7135 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3391,6 +3391,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
>      [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
>      [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
> +    [CSR_MCOUNTINHIBIT] = { "mcountinhibit", any, read_zero, write_ignore,
> +                                             .min_priv_ver = PRIV_VERSION_1_11_0 },
>
>      [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
>
> --
> 2.34.1
>
>

