Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZRck-0006t8-V0
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 02:16:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZRci-0006qv-2y
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 02:16:04 -0400
Received: from [2607:f8b0:4864:20::52e] (port=35826
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZRcg-0005BK-NL
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 02:16:03 -0400
Received: by mail-pg1-x52e.google.com with SMTP id z128so16767595pgz.2
 for <qemu-riscv@nongnu.org>; Tue, 29 Mar 2022 23:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zowoyxh+/jiR8XpKQ/4+kwFO7DqvS5ntnWO24EzrYa4=;
 b=qZh/i3KXOOTlkjzhHgKlxCkhWhv6CVuAhkZbTt6fQZRxCB3Nv8/pk9bqLlcQz6aeBk
 QCWIB9KjaDRXHvap1FNmaYvoW2OrK6wAqBLI8B28gy3/l3Atv+EcxL4sp/B4boV0ffhH
 cUltPVF5S68bbv/DMbVAECLM5c9/uJKLsKRutdz9s/yytvzxXtoPMb/T2AKbFOnWhy82
 mydl00xn9uAIRggjvj1SsUU/vLJh069epDV+QqCSkbie4yMq3Oh9Q9ILjlG47XHtb/Ow
 oSfkC/eScBFJ006SPgitz6F550ujQ51+ikwbGVrw8uBqSHNnJwSB7uw/nvFXvIjGVb5d
 Dtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zowoyxh+/jiR8XpKQ/4+kwFO7DqvS5ntnWO24EzrYa4=;
 b=1HCtAR/ml3QKFZy5clKjo7GlC/vMzZi61X3HwFVjRB4UlyaAcvn/8He6DaK5pso0R7
 B9xDFxGU9NV5HzgKDZsrtLw3xvcvT2iwOjeVrwjMiKmXhNdFOqvSMpBcgHrcXE0fAMEf
 1elgR24lMwwouba+uHTNbuJLazC4HO5Ixp+H2lWXpcVYMPMmlEoapctIk/2E3df/hZ4c
 iHJNHU7ykRVZi0WvoBLIk/GdW3btfJeZSzM5BFBwcpdOFdA/QVajheyAU7SkypOjUn1Q
 NcOITo/juftdSeJ8Ud3nUkC4A67VDNU+1yh++7o2atV8SdTwLMInuP85g9vzY+SfEz52
 YGEw==
X-Gm-Message-State: AOAM532OvlkI2xMnvanV0xA2uBHxBx+mJc/2R9wR4aXx4Hag6BdmwQag
 3aeJZbg9TClldYs56+3bhqJMt4v7I0RrdPH5jBS00a+uVXY=
X-Google-Smtp-Source: ABdhPJzrxpsg72RCTHMv9qZsbaPVfOnWixuyjQxwDFI96Q61wYVMDOOXgmagBU0H6J/41hgPtdzVWXBkIMfOZ8TjJ9s=
X-Received: by 2002:a05:6602:2c0b:b0:63d:dfb2:9a95 with SMTP id
 w11-20020a0566022c0b00b0063ddfb29a95mr11026477iov.93.1648620622123; Tue, 29
 Mar 2022 23:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220315192300.250310-1-idan.horowitz@gmail.com>
 <CAKmqyKPu71vO6WtqSHc_XjXrzCicj-_GRm+11njcRxYH3KhbQA@mail.gmail.com>
In-Reply-To: <CAKmqyKPu71vO6WtqSHc_XjXrzCicj-_GRm+11njcRxYH3KhbQA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 30 Mar 2022 16:09:56 +1000
Message-ID: <CAKmqyKNft_EE26PWDhsXe3juPE8h_z6RtdsCrqpB6Yj9qQO2YQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: Idan Horowitz <idan.horowitz@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Wed, 30 Mar 2022 06:16:04 -0000

On Wed, Mar 16, 2022 at 9:42 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Mar 16, 2022 at 5:26 AM Idan Horowitz <idan.horowitz@gmail.com> wrote:
> >
> > If the pages which control the translation of the currently executing
> > instructions are changed, and then the TLB is flushed using sfence.vma
> > we have to exit the current TB early, to ensure we don't execute stale
> > instructions.
> >
> > Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
>
> Thanks!
>
> Applied to riscv-to-apply.next

This results in failed Linux boots, I have dropped this patch

Alistair

