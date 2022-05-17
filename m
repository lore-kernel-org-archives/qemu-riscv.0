Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqmn7-0006XW-RR
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 22:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqmn5-0006WU-GG; Mon, 16 May 2022 22:18:27 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:41791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqmn3-0000cV-Pv; Mon, 16 May 2022 22:18:27 -0400
Received: by mail-il1-x12e.google.com with SMTP id o16so3271719ilq.8;
 Mon, 16 May 2022 19:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aEwxJEDzXAkLHSRpsSsP4AqQJt4ah+Y+SL0xcwwUOvU=;
 b=GDBdubkEMhW9NdXPPTwFzzGJN+CaPufh/TP96OgW7GFnLVHnhu9zy9Ul5j7nDkVf/l
 +tAKX7VlO3qDaZBmzLdLnJrdxlRUFAKZCOkp6COrp5LwcgKvSFTSSicVdtbXtuCt3RIR
 GQ5DTLynp7x8gExU6pMwN0GTk6KVl2PS+VxkDE6dESVjmMJxat/4N2+3b+E+Vd3thEPw
 GXVsguk+wKk0yDrytm7SmhKmbQvkI3Px7vsPvsMNp7OFZaZTDMT/FxyaoBRU7UleVZJm
 GBNX17cHRr7A6byOat7d8hR1peXX22pvyH4ASZk57ycWWXY4XL4K1FrwAgw5kO78kY6j
 Zkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aEwxJEDzXAkLHSRpsSsP4AqQJt4ah+Y+SL0xcwwUOvU=;
 b=bvzoGr+a3Sr+F1t3hSKkawz7OIv9T8QoekC2OcL05/GXb3R3g1folJHTG1w+zO1Xi1
 ZhQyXEXBYgIHDaq2sEyKMALx5JCdlaMdS3beI5knELOomysn3qBTCkuEfSk+dLpBEdSJ
 FPoCKDjf2/G4Gvw3Py4U6+jN02xbZGAGkdrAQYKzORIE8C9/HNDwdVAEPeuhyD8bY+J3
 YYBbhO2ECtqaA6ynK/haTpmKJoTV+vO3alO4+YICULw93wQatpiZaf8a+Y3x2x+rvq5t
 peACRXyCQrZhtIaJ4ScsMuJ1SAmY8rlteSnxMe+HoUIYeO2Uv0cSIQabJhBJu3DMejA7
 Q0hg==
X-Gm-Message-State: AOAM5327QLfCBSUCgzy+rNRMpFQUUklNkemB9e66VOtM8xYo0JVYeP//
 inMTYaTQSsPHGOcUK+++rpVjek0+UKsqNsPhlb8=
X-Google-Smtp-Source: ABdhPJxW0bQnV99K28Nywwn+yOw8sjUVH/jm22h2tkvibOsaRKsoI8qoLXPkuLgmgQKv9N3F++RcankfVv1CUtWnosk=
X-Received: by 2002:a05:6e02:170b:b0:2cf:9f8f:afdf with SMTP id
 u11-20020a056e02170b00b002cf9f8fafdfmr10981056ill.260.1652753904189; Mon, 16
 May 2022 19:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652435138.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 12:17:58 +1000
Message-ID: <CAKmqyKPN14vxZwvT=Vt-tckN3=JOKQK8UoVxLza3XiJFyTq9QA@mail.gmail.com>
Subject: Re: [PATCH 0/5] target/riscv: Enhanced ISA extension checks
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Tue, 17 May 2022 02:18:27 -0000

On Fri, May 13, 2022 at 7:46 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> Hello,
>
> This is another patchset for RISC-V ISA extension / feature handling.
>
> Aside from coding style fix / refactoring patch (PATCH 1 and 5), this
> patchset contains two changes:
>
>
>
> 1. "G" extension handling
>
> 1.A. "G" extension expansion (PATCH 3)
>
> On ISA version 20190608 or later, "G" expands to "IMAFD_Zicsr_Zifencei",
> not just "IMAFD" (this is because "Zicsr" and "Zifencei" extensions are
> splitted from "I").  Because both "Zicsr" and "Zifencei" are enabled by
> default, it should be safe to change "G" extension expansion.
>
> 1.B. Disable "G" by default (PATCH 2)
>
> This seems quite odd but I have a good reason.  While "G" is enabled by
> default, all "I", "M", "A", "F", "D", "Zicsr" and "Zifencei" are also
> enabled by default, making default "G" expansion useless.
>
> There's more.  If we want to change detailed configuration of a RV32/RV64
> CPU and want to disable some, for example, "F" and "D", we must also
> disable "G".  This is obviously bloat.
>
> This doesn't work:
>     -cpu rv64,f=off,d=off
>
> This does work (but bloat):
>     -cpu rv64,g=off,f=off,d=off
>
> Disabling "G" suppresses such problem and mostly harmless, too.
>
>
>
> 2. Floating point arithmetic consistency (PATCH 4)
>
> With -cpu option, we can configure details of RISC-V CPU emulated by QEMU.
> However, we can set some invalid combinations that would make FP arithmetic
> effectively unusable (and invalid on RISC-V ISA specification).
>
> -   F requires Zicsr
> -   Zfinx requires Zicsr
> -   Zfh/Zfhmin require F
> -   D requires F
> -   V requires D
>
> Reproducing this kind of problem requires manually disabling certain
> extensions (because all "Zicsr", "F" and "D" are enabled by default).  So,
> I consider that just making an error message (when unsatisfied) should be
> enough, not implying related extensions like "zk*" properties.
>
>
> Note that this checking only works on any, rv32 and rv64.  On other CPUs
> (for example, sifive-u54), it sets nonzero `misa' value on corresponding
> `set_misa' call (c.f. in rv64_sifive_u_cpu_init in target/riscv/cpu.c) and
> consistency checks are skipped (because nonzero `misa' value is set prior
> to RISC-V CPU realization process).
>
> I think we generally use generic "rv32" or "rv64" on heavy customizing so I
> don't think this is not a big problem.  Still, we could fix this later
> (e.g. by setting properties on CPU init function or by checking some
> consistency problems even if previously-set `misa' is nonzero).
>
>
>
>
> Tsukasa OI (5):
>   target/riscv: Fix "G" extension expansion typing
>   target/riscv: Disable "G" by default
>   target/riscv: Change "G" expansion
>   target/riscv: FP extension requirements
>   target/riscv: Move/refactor ISA extension checks

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c | 62 +++++++++++++++++++++++++++++++++-------------
>  1 file changed, 45 insertions(+), 17 deletions(-)
>
>
> base-commit: 178bacb66d98d9ee7a702b9f2a4dfcd88b72a9ab
> --
> 2.34.1
>

