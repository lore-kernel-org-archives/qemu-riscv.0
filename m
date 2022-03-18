Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nV2BV-0004nR-BV
	for mharc-qemu-riscv@gnu.org; Thu, 17 Mar 2022 22:17:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nV2BT-0004hA-79; Thu, 17 Mar 2022 22:17:43 -0400
Received: from [2607:f8b0:4864:20::12b] (port=41567
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nV2BR-0001UE-Rr; Thu, 17 Mar 2022 22:17:42 -0400
Received: by mail-il1-x12b.google.com with SMTP id b9so5000842ila.8;
 Thu, 17 Mar 2022 19:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FU8aQW3ScKD8zKIpN8izTE70fNJXm77kNkP7juKBRho=;
 b=GSGZaIBw811oV6PMm6sMG531y5Z+MVHgNlBAIyvv+yFtJp1cGxkRBuq1bLWN20fwcH
 NGRq5JTV9G7uL+TmOjNseztWWDS7vVq4DQ4K1jNmcO3VKkqWZhH5lgEifIyH6t5x70Rr
 svtowZRYWRlYHp0T9TJTiWwFFQRI4/wbWE7/TniPhSzx053FpmP8Qsvy7SL8GjpmxwgZ
 Rz+m0MfAKEF2tszK6Y6dvt0y/3d9lCzZi6+WnS85sQ2SdhFzPNHD49ewImV381qZ5II7
 Wl0tgqWuBDUw5FxA0f6eaCQwgjrWgRO8LWtqYXdjcn1weFQGlTm9QYxBuerMuRBxTavl
 pZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FU8aQW3ScKD8zKIpN8izTE70fNJXm77kNkP7juKBRho=;
 b=67JGVzUu9wJjynb/rLFOV0S+lttvdEIOKOBMdNsAmUAByNfIIk1NRdKbd6ytEeiCJs
 bhG5pqmzIbxZJMwjsKs+iWdc0urdoilrWXRNrdNZBZ35BG4UJc3s7ws2HSnrQ0eCA5KB
 y+rQ1P23a8HRpFtFwMkBB/oanqcY1/VYH4aOY5sAtSjUsnthJyQpFlnWNRNG8K8qx1yj
 vPuQ6hy1PuhRzE+mXaFlXW0Nz/ukxB0XXBm4wOI6EDwbVHRY1rwtPkMS4sYruUGOPIA2
 un5mpzY5lLFnDlLNa9f9cnidIynJhIFm6If4qaOxprSfh8M2eNMOB/GPPHdGw8rGfTku
 bs0A==
X-Gm-Message-State: AOAM53148pA0gndIqxpO95sxwQBnktbYdPg7IxNxyU/rzqq3UOWGi73y
 5+j3UiYRJauySINUslV4HMBhgM5Vmh1hUh2HXHM=
X-Google-Smtp-Source: ABdhPJz9jWCVxXbE4OjgvrLV0YwGKMUq990A/P9R6ItzKbPIHd2s/FCaYzl1F4mXag4/j04S8pjJmO90ec7GGozz8yw=
X-Received: by 2002:a92:6012:0:b0:2bd:fb5f:d627 with SMTP id
 u18-20020a926012000000b002bdfb5fd627mr3420772ilb.86.1647569860404; Thu, 17
 Mar 2022 19:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
 <20220315065529.62198-7-bmeng.cn@gmail.com>
In-Reply-To: <20220315065529.62198-7-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Mar 2022 12:17:14 +1000
Message-ID: <CAKmqyKOmD5ew=7zLVh0uDwBM2g0ofctOoKXd+5UZq55thSp7xw@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] target/riscv: cpu: Enable native debug feature
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 18 Mar 2022 02:17:43 -0000

On Tue, Mar 15, 2022 at 5:02 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Turn on native debug feature by default for all CPUs.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> (no changes since v3)
>
> Changes in v3:
> - enable debug feature by default for all CPUs
>
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ba9cc3bcd6..08266b163d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -788,7 +788,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> -    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
> +    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> --
> 2.25.1
>
>

