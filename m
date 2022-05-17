Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqlEP-0003sZ-8h
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 20:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlEN-0003s5-M4; Mon, 16 May 2022 20:38:31 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:39793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlEM-00025Y-43; Mon, 16 May 2022 20:38:31 -0400
Received: by mail-io1-xd35.google.com with SMTP id e3so17773822ios.6;
 Mon, 16 May 2022 17:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BuWuBR7Rx+JyyMWooktEjGEJgVKSBig1nKAzb+lU36g=;
 b=BWXEJgrufUnqtmh3ISM3w4aCksgmLqHppVz8yyZIxu+RKlK+E0hDjBElBERUV0PT2O
 qrkDSdlv0tjPVL3SzS4amUn8sMxvba2sagEU/e6azdUhgcn1ThzAhDFH9OzHNrpojtuV
 HpOrChYcIITjNLlnIxGmfM0ZPTSXyW9Rlpi/HrYOIayuCeTG0nZxvZkJ3qObCE2EQlqz
 zwqjTZlbxzgdl7LdGIEAjJiB8/QE5ZCRkKHPUhYR2WiomUvnHndyTF2qHnxOdicpwkql
 pCqlGFfm6NCXxWWLaW3qSbkqi9+Hn9c22kuG4JTU9gWhmQYnXtJ04u7W6agnDw8dUqk9
 R9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BuWuBR7Rx+JyyMWooktEjGEJgVKSBig1nKAzb+lU36g=;
 b=AQbg8NqkCNLuVivCgnscyUAbL56EI4zNf8dIyfSHgTA4OmiMNxOfng1wsTLF4hSF9P
 cyScLFlBt7Xux5n6TcPQiNMIjjXdpWs4vixlMJDY86O+o/bXuSf8GAvPkLt0Y8W6aUj+
 DeiovjJxbk9X+5q5CJi31ODeiPNKU5fGocJ6ylZoTOwmyztPURa1tpzIjuUSr83+Gp8Y
 7wPPTeNaOv0Sg1j4MiUK2v1Qt5DA12FazE6ib3ZrMdQ8bFzYB1NOTwptmHtTgwvlrssr
 WVoB1V6opUO+HP2XDHBqWqiGcUZLWN1n9s2BTQJp/vOtiy6w3x/SFfyGjVPO6Rk5xSU6
 Bemw==
X-Gm-Message-State: AOAM531hu1F/FILnhNtZoLlTsPFYxx2ifIKXRH+zVXrM0JUTG9JRmNNW
 +Q4jbMYgV6l2uGoJC9xtRkZF/gWhuhSlD1KnZ5BRa6Ilnmk=
X-Google-Smtp-Source: ABdhPJw3oDM7AMuSSI+H54xkAbzA8CM3DoqOgDw9HZMRu0BGWkw+bIqranZ5u3/FzhVkgbGw1HojJ541iTfiqQuy8FU=
X-Received: by 2002:a05:6638:160d:b0:32b:d9d2:f2f2 with SMTP id
 x13-20020a056638160d00b0032bd9d2f2f2mr10429771jas.68.1652747908700; Mon, 16
 May 2022 17:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
 <91633f8349253656dd08bc8dc36498a9c7538b10.1652583332.git.research_trasio@irq.a4lg.com>
In-Reply-To: <91633f8349253656dd08bc8dc36498a9c7538b10.1652583332.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 10:38:02 +1000
Message-ID: <CAKmqyKO4sMK0tgPNh_DaN77CvJ-ChPt1sxsTnVOzn2+Zm7F6XQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] target/riscv: Fix coding style on "G" expansion
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Tue, 17 May 2022 00:38:32 -0000

On Sun, May 15, 2022 at 12:56 PM Tsukasa OI
<research_trasio@irq.a4lg.com> wrote:
>
> Because ext_? members are boolean variables, operator `&&' should be
> used instead of `&'.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ccacdee215..00bf26ec8b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -596,8 +596,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>
> -        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
> -                                cpu->cfg.ext_a & cpu->cfg.ext_f &
> +        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
> +                                cpu->cfg.ext_a && cpu->cfg.ext_f &&
>                                  cpu->cfg.ext_d)) {
>              warn_report("Setting G will also set IMAFD");
>              cpu->cfg.ext_i = true;
> --
> 2.34.1
>

