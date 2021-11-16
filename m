Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmouo-0005dD-4k
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 22:13:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmoum-0005YX-A8; Mon, 15 Nov 2021 22:13:44 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=40677
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmouk-0001ij-To; Mon, 15 Nov 2021 22:13:43 -0500
Received: by mail-io1-xd2a.google.com with SMTP id r8so24162999iog.7;
 Mon, 15 Nov 2021 19:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XF8jRG7OGLr2+wMWOv+CefocHGRDs1owIplFqz+snIM=;
 b=cSjtHnIDWlxyDCW3gioNpKVwzxyDhnqQNO1ZGQsAxUAhCe3uWSEPTcTEURvnbN7v6+
 WvuuwhRckS1tVH/dZK2f/k+Fuk9naU3HZV6mt0IYrq0C28w1ik4uyRqmjdpm1R3zyByF
 k3QybrlrKUtRscCd7Gr4Tfwbjtj4fSgvDYTTEukKDoJSUqNubUMdgxn9xAhezCev4xeC
 rPrMFWU0BcfbdUGhrvqqnJtwv6KnyCjpZ4ZykVxVffejlHIAbyXdOqe9qJB47VwUfUV4
 dAMyR/JmPtxysG40emEJW+/Ewo8LIdfXRsL1PUs5cZQ0WH3aDpGZto8oPazfmILRsKB7
 qtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XF8jRG7OGLr2+wMWOv+CefocHGRDs1owIplFqz+snIM=;
 b=jQSEZ+DHVnfx2TLao75zl187rcWyCn23iinDDpWUAq/sR55vqgnOs/fqRjlBhdrSsi
 LDz2H3MeR6QMbSXxGQqnOJqdQaTqWQJHHyHxeyMVOpIs1gcygkh2tFgEVaj7Gpgir7Hs
 NvFi4kNOQGGBxuO2pIT36K364UgmF3H62L2JWXMV5YcylNL2FgsFz8qfhlVPXBcLqZk8
 yIIpSPsn6MDe84h1krqfTNlNDeOlgOkoRQJeI4v8zeCgZ/Uvu5VMrkTA2JTTUhSq63qJ
 JlB6Kpj5o+W+X0mlUlhErj5zELX0ce8mlKA7alvWSQpojPd9dWWlXXX4Fw6vijfnxdeA
 j/9g==
X-Gm-Message-State: AOAM531/T63jFNCMLiKM+ErA25E+yn7l/8ututVBm76vq44lGhMQdAJy
 fNUb/W9KneRoEYT/aGIBn/8P0A/od91ycvWaMjo=
X-Google-Smtp-Source: ABdhPJyXirRiTA+G9Ckqkc6L4B9bK5OLTi9mok8qVqslyMg29QfXuoQfjBwwwNKyxZY1WpZRWhcyCVT8IscrZ7AW4f0=
X-Received: by 2002:a05:6638:d84:: with SMTP id
 l4mr2898942jaj.18.1637032421734; 
 Mon, 15 Nov 2021 19:13:41 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-7-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-7-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Nov 2021 13:13:15 +1000
Message-ID: <CAKmqyKPLXOopWbpTHKLfJxF0u0Ojv+x4ZHeZOE-nkZLhB9Uyrw@mail.gmail.com>
Subject: Re: [PATCH v4 06/20] target/riscv: Relax debug check for pm write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Tue, 16 Nov 2021 03:13:44 -0000

On Fri, Nov 12, 2021 at 2:12 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9f41954894..74c0b788fd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1445,6 +1445,9 @@ static bool check_pm_current_disabled(CPURISCVState *env, int csrno)
>      int csr_priv = get_field(csrno, 0x300);
>      int pm_current;
>
> +    if (env->debugger) {
> +        return false;
> +    }
>      /*
>       * If priv lvls differ that means we're accessing csr from higher priv lvl,
>       * so allow the access
> --
> 2.25.1
>
>

