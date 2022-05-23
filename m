Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nt1gh-0003Nc-3d
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 02:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nt1gd-0003Kx-2Q; Mon, 23 May 2022 02:37:05 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:36717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nt1ga-0004o8-8Z; Mon, 23 May 2022 02:37:01 -0400
Received: by mail-io1-xd2d.google.com with SMTP id n145so4722406iod.3;
 Sun, 22 May 2022 23:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1gVejak+m9+GeZU0J4rV4z4IhP2lq+fJAUTyN8pzZsU=;
 b=JAnTMl7A8iEL4ujTAwLn6ElXOj7wf6Rol47x8G6XFTiEjViuovMOFO6n+A0NXkPCJC
 E/iqM5zHc7u+/lkjd7iwNIhyD9469xuByJcOb6ULphJ+Cwgo8UguV5ZB6VZpGSS8U2kq
 K0iA/UTiWs+eLsqA69cJyddYPUW1H3He2HrIt68C9H2Wdhir78LXMAc5NZeJnRL4I30A
 jLCLOOLUWVy2tw7p8mPsrWD1xO+zarcCU8bgXd9Y7sZpgalw93CejQmPdC4/WEonuNMw
 nnWY1ksBDI5lPH4trskbyESJ0hPuXBNxHYyR3zYUK96c5bQh09RFAunPEivcE9RbRhDz
 0Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1gVejak+m9+GeZU0J4rV4z4IhP2lq+fJAUTyN8pzZsU=;
 b=WG19IWmkee4x1wwJUzYXxh/A7ATyLaeqRhauj1NL9cI74zNq6SvH99bJglY7jBypX5
 ZqQkm2p4Ax3SWlUuTvQBp0LIdAmKVNFEr6fRwT7IHDOVqmL9kuNdViuydraNDqdm+Fqt
 4gGKfWE4g4n0qYyF/aoSKLghdqq4Edjv90vb6f+S9kHjqGJE0AykfVAg1iCGaiwOYW68
 bczt7VVbVGtPmzZgf2ZhIh21oaqyzqwqYzBRzajyF6TpamWpFoy+1DqwILFY5RgqJEYN
 H19xy+wiYCBTLSeemDmfpncH1N4576Sy0zGsHs/MIkrqAf+YwDhYYeuQPBfm1QpxAClz
 +rJg==
X-Gm-Message-State: AOAM533nQsqeMiZTGCbvh3Yw7pUppfulQkTYllbv2wWVXM1DKDc+HFUi
 g9cIgLDQwgu0cKpKr5KCiJrah5j6xZLzJj7XOOA=
X-Google-Smtp-Source: ABdhPJxGEjfhTulOSrdx2RqE+ZxImN71hv5MM0zbxYzLCbQhC2twMM4fb8PlkkutK2cd308PhheEBVrHt3yOpnzc6zU=
X-Received: by 2002:a05:6638:160d:b0:32b:d9d2:f2f2 with SMTP id
 x13-20020a056638160d00b0032bd9d2f2f2mr10509161jas.68.1653287818842; Sun, 22
 May 2022 23:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652435208.git.research_trasio@irq.a4lg.com>
 <794f7476c911de3bc459eb188c181a4119e10997.1652435208.git.research_trasio@irq.a4lg.com>
In-Reply-To: <794f7476c911de3bc459eb188c181a4119e10997.1652435208.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 May 2022 16:36:33 +1000
Message-ID: <CAKmqyKNFYseUvo67e6+huJcQzWH0SHcfrhqCW2FhLG5kTw+Adg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] target/riscv: Make property names lowercase
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, Dao Lu <daolu@rivosinc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Mon, 23 May 2022 06:37:06 -0000

On Fri, May 13, 2022 at 7:47 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> Many properties for extension names are just in lowercase.  On the other
> hand, following extension properties and "Counters" are capitalized.
>
> -   Zifencei
> -   Zicsr
> -   Zfh
> -   Zfhmin
> -   Zve32f
> -   Zve64f
>
> This commit chooses lowercase as primary property names but keeps
> capitalized names as aliases for compatibility.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>  target/riscv/cpu.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ccacdee215..16227a1ac5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -822,17 +822,26 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
> -    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> -    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> -    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> -    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> -    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> -    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> -    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
> +    DEFINE_PROP_BOOL("counters", RISCVCPU, cfg.ext_counters, true),
> +    DEFINE_PROP_BOOL("zifencei", RISCVCPU, cfg.ext_ifencei, true),
> +    DEFINE_PROP_BOOL("zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("zfh", RISCVCPU, cfg.ext_zfh, false),
> +    DEFINE_PROP_BOOL("zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> +    DEFINE_PROP_BOOL("zve32f", RISCVCPU, cfg.ext_zve32f, false),
> +    DEFINE_PROP_BOOL("zve64f", RISCVCPU, cfg.ext_zve64f, false),
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>
> +    /* Capitalized aliases */
> +    DEFINE_PROP("Counters", RISCVCPU, cfg.ext_counters, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zifencei", RISCVCPU, cfg.ext_ifencei, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zicsr", RISCVCPU, cfg.ext_icsr, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zfh", RISCVCPU, cfg.ext_zfh, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zfhmin", RISCVCPU, cfg.ext_zfhmin, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zve32f", RISCVCPU, cfg.ext_zve32f, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zve64f", RISCVCPU, cfg.ext_zve64f, qdev_prop_bool, bool),

Cool!

I think we should add a comment here saying not to do this for anything new.

Also, it's probably worth adding a deprecation note about the capital
names, then we can remove them in the future.

Alistair

> +
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> --
> 2.34.1
>

