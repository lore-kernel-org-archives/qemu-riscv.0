Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6JSQ-0000TH-4X
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jun 2022 18:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6JSO-0000T2-Bc; Tue, 28 Jun 2022 18:13:16 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6JSM-0000Gr-IU; Tue, 28 Jun 2022 18:13:15 -0400
Received: by mail-pf1-x433.google.com with SMTP id 65so13211410pfw.11;
 Tue, 28 Jun 2022 15:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tDZg9mjBgdklL4z1Cc8879U7ltxiF8io/sK3P45EuvE=;
 b=ft47DGbJZP+ZikKUcEZpwuYavkdisK+axPbygkzpGpFvRKFUfK2OZgpyHyILoz5IeN
 iq7zUd9IBVFbB0QMYmfKtC8j65lnhJpZ3m52265ftqE6oq5JEBre/u76F+XgOt5z8Ylu
 z9E6QUORiwB8vHzrSG8XHDxuOC4V8fRjuB99txjvMmhgMEicePLkx0loB6xYjjLAGGVU
 Fm08JCNvpPy82AF1dKv/G8fiOdOi3sNdRynULxQT+XtZS5yZPJTwjS52AUjXmQaq1Rc7
 dwjOpgYeKoO+kFCdoojENT9xiKUaSqNCYiVD8dLrztxcSXjsoMEsZhASz+UkE2u+licM
 kShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tDZg9mjBgdklL4z1Cc8879U7ltxiF8io/sK3P45EuvE=;
 b=nvRaEpQ+4sjYvdJMEX2DXivFav1EqA2wZVPo0I/8y/Jglzp0++EhbJZidhxTaAgymb
 xchdnYHdjp8yEeBVN7U1WDvxseDQWB5oknodlHSaC6t59LkBP+a86O5goyhlog3BROHk
 yPndnrHKrE8ro6qTFxIYH0ePkxute+kwYorRqI53vxAnZpBro3N6y6sNH4IaNIlRXgsh
 VAWSYez64E2U1B5iITBVg8kEz9XTpnfmeFOXhFfByo7aD6EQTm0L1Y5res5w4/iBFRRz
 VTkVSdj9bEAf0zt/UUyhBqWrfzirCcqJi5kB1eH4I8dJCLnGw5d7yIa9VPS3LxOAbbXK
 zofQ==
X-Gm-Message-State: AJIora9aVICUj3mEZV0/42gkpz2ekCOOut0ek/j1Q+0HzPLATxaVTIAj
 MmYOfG9HPRsZs/LJgGcpeGEcNYQHDQM5mIqBAkM=
X-Google-Smtp-Source: AGRyM1stj19bwReE6NiqkfRUkmEwUnjSEh+PMhw2O+FRPxxtFNGXw4tgxMYcJt4+9olkkwgJvi7vKM7OHW6QK0v6bAU=
X-Received: by 2002:a05:6a00:1306:b0:512:ca3d:392f with SMTP id
 j6-20020a056a00130600b00512ca3d392fmr5709100pfu.79.1656454392177; Tue, 28 Jun
 2022 15:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220628101737.786681-1-apatel@ventanamicro.com>
 <20220628101737.786681-3-apatel@ventanamicro.com>
In-Reply-To: <20220628101737.786681-3-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Jun 2022 08:12:45 +1000
Message-ID: <CAKmqyKMxLAnLkLrr8qfnorN9L3nf3OqsKN1Uzzvr2kLnuUkXhA@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] target/riscv: Set minumum priv spec version for
 mcountinhibit
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Tue, 28 Jun 2022 22:13:16 -0000

On Tue, Jun 28, 2022 at 8:23 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The minimum priv spec versino for mcountinhibit to v1.11 so that it
> is not available for v1.10 (or lower).
>
> Fixes: eab4776b2bad ("target/riscv: Add support for hpmcounters/hpmevents")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d65318dcc6..f7bfd2eab5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3944,7 +3944,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                                                         write_mhpmcounter },
>
>      [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",  any, read_mcountinhibit,
> -                                                    write_mcountinhibit },
> +               write_mcountinhibit, .min_priv_ver = PRIV_VERSION_1_11_0  },
>
>      [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_mhpmevent,
>                                                         write_mhpmevent },
> --
> 2.34.1
>
>

