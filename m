Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1my62J-0004Pl-Vj
	for mharc-qemu-riscv@gnu.org; Fri, 17 Dec 2021 00:44:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my62F-0004NA-Uo; Fri, 17 Dec 2021 00:44:05 -0500
Received: from [2607:f8b0:4864:20::130] (port=46903
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my62E-0007Kv-8x; Fri, 17 Dec 2021 00:44:03 -0500
Received: by mail-il1-x130.google.com with SMTP id s11so783845ilt.13;
 Thu, 16 Dec 2021 21:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5LTPXOS1W8BVbmDHaufae9dxVyQwLN9iyolUriwjOfQ=;
 b=FlMlQcLgEZ+2dulIWDuUN2d3tB2eGGNm8aL63A6YVS2a3c0OBwWsvIV7hp/zuvVeRv
 wdFwBRNoeMJiUX2QK62UuvCM0wY+/++8JP/a7C/lcEoyxR9a7Wbo9mUdl5jH8poPS0Mv
 FQG92iYDTRfVcbP+ARDQRlpZ0TnoW0mX2lDSlhZM74ZGmIUxDezTj9P83i7NPYjn+N0X
 9n4zJHoK/CYohNh/8dGUDe47Fcpk3S7r0Ti3DPIlDP8j6FuP51sNUMoZj17QwdAfIZtw
 3dYZTbOI4QsOEWmWMPhMjEhiqVBAdKnrdKImN6wJaRuelJdldK1TnBLM+/5ycKTEtGK2
 LtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5LTPXOS1W8BVbmDHaufae9dxVyQwLN9iyolUriwjOfQ=;
 b=ZIF20awS7+D4ZkhvWVm8si9tM70lneL74oKDN++j6xQXg9WUYLxx0HoCelZ2WZrqiY
 BBj5FRpjvxVr4C+ZHpWfqsfj8BUzX+AiRaCnikVT9tgK6J1F+IvR0lOnHrQPfyhDSOls
 iCTMnwKtpQUIeseGjRMNsXhm02UVFqjouXAKMqhs+Mgz8KHchDr8g/tYEN6ZKd0pS1Q3
 lZjEISI6rrCOliujWVcawcAW6w0VWhMLeeUD4y5vFIbz+zJTY2ieETaiFzQDO/I3VD/A
 8TQ14V1ow/2Q73fniviAUm7H6I9ftMs2x6F1zb1ruzW0oaSBNvADsWsuQw/KFbIy4VD3
 aDlw==
X-Gm-Message-State: AOAM533AQUKQJmdDVaHnQpxtoGFPEnXbkMX4PgFuHqkY/Z6tuwsj1F/N
 opaZlAuNAkCHM6+ktqJBftCLF7kIfWdayGu+G7I=
X-Google-Smtp-Source: ABdhPJzyiRI6gikVpTWmdwNkuPaiYw8cJ1rhgy7KYJaT+Fn3tnyfsahhLKELTRxND4VvRpccX0eBHd7YzmN/saJf7Ng=
X-Received: by 2002:a92:c802:: with SMTP id v2mr755391iln.208.1639719840756;
 Thu, 16 Dec 2021 21:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20211216051844.3921088-1-vineetg@rivosinc.com>
In-Reply-To: <20211216051844.3921088-1-vineetg@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Dec 2021 15:43:34 +1000
Message-ID: <CAKmqyKNtQj0vsjo5qf=Nk2RtRHn3xCqdmTjn4kHeeSP=E5JtXg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Enable bitmanip Zb[abcs] instructions
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 17 Dec 2021 05:44:05 -0000

On Thu, Dec 16, 2021 at 3:21 PM Vineet Gupta <vineetg@rivosinc.com> wrote:
>
> The bitmanip extension has now been ratified [1] and upstream tooling
> (gcc/binutils) support it too, so move them out of experimental and also
> enable by default (for better test exposure/coverage)
>
> [1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions
>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f81299812350..c00d59cd04b5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -635,10 +635,10 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>
>      /* These are experimental so mark with 'x-' */
> -    DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
> -    DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
> -    DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
> -    DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
> +    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
> +    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
> +    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
> +    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
> --
> 2.30.2
>
>

