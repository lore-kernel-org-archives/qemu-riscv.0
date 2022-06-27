Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5s7y-0007za-Sx
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jun 2022 13:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5s7y-0007wL-4d
 for qemu-riscv@nongnu.org; Mon, 27 Jun 2022 13:02:22 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5s7v-0001LK-Ha
 for qemu-riscv@nongnu.org; Mon, 27 Jun 2022 13:02:20 -0400
Received: by mail-ed1-x534.google.com with SMTP id fd6so13970840edb.5
 for <qemu-riscv@nongnu.org>; Mon, 27 Jun 2022 10:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jm97EEskwj2lSxTO+8KzbfVf+emGlvpaptWBWKR7Lv0=;
 b=RjHbjE+LSW+XoRBGzf27AKadlsgM6VrYVOWW4ies+bqMbb0NcXj+6dSOJ6Ydz9Vvvz
 7He8QId5QagVh7fvZqz4Zw3dlT5NB6slQMgxXFArf5LoVUrqhwsGDTmB2DX7aWa2eN3k
 D3jwz68RJLk0DP2dM1NQB127Pe0zlqrdkZNWoy5LjJJe9PB3pqBMfDEQ5prcmzR9SAyZ
 I67z9NDO1WQ8H+Gbwb2WFG3IHW2ATYNyWtnQNLJJ6yIzR7bZxKtbhO//saeKDqcpdh04
 G0IY61mWvkqHmq99sN5GZr3wjn/2IrM2dpEM7hvPfNcE5NQHVxTd9kMPf6qhWBbtKt2n
 09Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jm97EEskwj2lSxTO+8KzbfVf+emGlvpaptWBWKR7Lv0=;
 b=CV7jYn5gN7asCGeY63NUH9orbY/Y/fC0Crj2U1EwHUniUKHgQ3gWajF2IJGosMpeMK
 Yz2s8UrJDmUyomWcMr4qVhyzKDWmgA1zy0VgbVH3Mbmoy1uwa1HLB9ApnEDbRhuPbfdG
 CpD3nrpm35FJLAqCkxwy64UM9O4eUgPLoXFWi+sbYroeYexmGYRW/v/UBASSIAmoY+7j
 ZZYAeKMEh3xH7UHE8kmVpXxbQyNKFoMATpv/5mS0po4BwrbTN1UQ8nLtTNfXAJgfGwjy
 Wm8AxRsvqvO6r61nm+8FlQJKW6u6v0Vmh/VoszHbGp6Sfg6ZnmmV9PtchleTJAsoLwfn
 KEQw==
X-Gm-Message-State: AJIora9dQzdsJjkb2y4mHAq6U2UzgK7OMxZU3zKACmpCWCqdwvANEsSM
 L+b0d1MNfHWmSBsTzJUdq4JMElQPnx+DwRVBI9A/RInmpyE=
X-Google-Smtp-Source: AGRyM1tYeR56vtjZoiiZZJCmyno5FFYnL1U/pcLMZdii92nfxusKfwxiyEU8h5SwY5wp3lf9Q1HtddQkStKChgoCdNE=
X-Received: by 2002:a05:6402:154a:b0:435:5261:f776 with SMTP id
 p10-20020a056402154a00b004355261f776mr17458414edx.118.1656349337892; Mon, 27
 Jun 2022 10:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220627164956.1516487-1-rpathak@ventanamicro.com>
In-Reply-To: <20220627164956.1516487-1-rpathak@ventanamicro.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Mon, 27 Jun 2022 22:31:41 +0530
Message-ID: <CA+Oz1=ZmTp__w8tJ-CZLw3NX-+dfDU5BYDu6OR2kfbjpaRjwkQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix user-mode build issue because mhartid
To: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <apatel@ventanamicro.com>, 
 Rahul Pathak <rpathakmailbox@gmail.com>, victor.colombo@eldorado.org.br
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=rpathak@ventanamicro.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 27 Jun 2022 17:02:22 -0000

Sorry for spamming but my send-email script misbehaved
and sent the v2 patch two times. Please ignore one of
the v2 patch

On Mon, Jun 27, 2022 at 10:20 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> mhartid csr is not available in user-mode code path and
> user-mode build fails because of its reference in
> riscv_cpu_realize function
>
> Commit causing the issue is currently in Alistair's
> riscv-to-apply.next branch and need to be squashed there.
>
> Fixes: 7ecee770d40 ("target/riscv: Force disable extensions if priv spec version does not match")
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> ---
>
> Changes in V2:
> - remove the stray format specifier
> - add the Fixes tag and reference to external tree
> ---
>  target/riscv/cpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e4ec05abf4..509923f15e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -636,9 +636,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
>              (env->priv_ver < isa_edata_arr[i].min_version)) {
>              isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> +#ifndef CONFIG_USER_ONLY
>              warn_report("disabling %s extension for hart 0x%lx because "
>                          "privilege spec version does not match",
>                          isa_edata_arr[i].name, (unsigned long)env->mhartid);
> +#else
> +            warn_report("disabling %s extension for hart because "
> +                        "privilege spec version does not match",
> +                        isa_edata_arr[i].name);
> +#endif
>          }
>      }
>
> --
> 2.34.1
>


-- 

Thanks
Rahul Pathak

