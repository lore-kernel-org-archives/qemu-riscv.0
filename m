Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l7Njy-0007dq-Vk
	for mharc-qemu-riscv@gnu.org; Wed, 03 Feb 2021 14:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l7Njx-0007b0-RF; Wed, 03 Feb 2021 14:23:01 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:44194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l7Njv-00024r-Sk; Wed, 03 Feb 2021 14:23:01 -0500
Received: by mail-io1-xd34.google.com with SMTP id j5so489645iog.11;
 Wed, 03 Feb 2021 11:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=osC5Zac+xNOTRaCQpM81ZoE0EIeTczb0uhROUmWlmtw=;
 b=vJGp3PvReHBU5rSDTgJy2TaEJz8udQqVX/y0gYSY7v4WcNfPXzI6a+t07SBIMZsw9N
 kJmcDVcJlRaCKAdc4+4HLkdL6Aytia7OJXpsfL9ZkZDmTZJrgslAMcBuaAAO5ottQbFG
 YltT8KRGSq3E2EGm8r6s31hF8Iyzf1RU7OSdE9g+K2T9BznE+yqLU+PVTkJEpGYS/Mfo
 5GafI5LnvK2hk4WHiIwTfL+L+avxJR7rZ0dIJxZSbH5XaRcQvsglbHShKny7erpbTGPs
 zPHVSHVZoF8RkMCuQT+pe8BxtmALLxOPx/vtx/AwQ+mTNo6KE4jaxlnZXmpEEppJg8xW
 ADoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=osC5Zac+xNOTRaCQpM81ZoE0EIeTczb0uhROUmWlmtw=;
 b=HnYETXN3UUMfTIpLxntIWyqah5jU1Y9NHwg+c7J0QAKvmrmTBJv77WFmnLw95gFvSI
 5+IVMOjEso+TXM4G96+LKD56thvLFLpDiB7qWr4Hv9P+CmMgC4AWKTdaLQrZKjqDUh6C
 9mhDeEQwuokXJaJdTjr8g+BAgKgivfC1VKvlJfxHc7ywVzCqUVqi2a7s5sc8Av2AHr+c
 WHx4gJihjFmv5uGjYbGOSIasQKorDvZoF2MwPc4SJkpNtaxDruQP11OFal3icUJDDdFx
 J0CxVdP8CPy6d4MbUUPx47aP0TCCpppcKO+BBkQD2J8laY4niojGdkRcBhaWjWY6XrY7
 hywg==
X-Gm-Message-State: AOAM532WqGsTeOnzV0vaF+R/82TDTUwOHg/H+H268HjOEVuE2LemNh9s
 EeSRlrvOJ0uC567uIX5tHQ5oOodkW9uoWw1IKO0=
X-Google-Smtp-Source: ABdhPJy8DG72woIC4M7Wrpl4ekM22GnU6QUr0tqdZjOEZxKLvdfDdCaX1Yf6HjYD3sfPg/N438MCGo6JmuVlqafWNkc=
X-Received: by 2002:a05:6638:3c8:: with SMTP id
 r8mr4325618jaq.135.1612380178225; 
 Wed, 03 Feb 2021 11:22:58 -0800 (PST)
MIME-Version: 1.0
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
In-Reply-To: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Feb 2021 11:22:32 -0800
Message-ID: <CAKmqyKP7tig8Lh=qktUnM+HMhZK0__qTgRXDeCayiZ-S0fyGTA@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] RISC-V Pointer Masking implementation
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, kupokupokupopo@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Feb 2021 19:23:02 -0000

On Sun, Jan 10, 2021 at 10:54 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Hi folks,
>
> Sorry it took me almost 3 month to provide the reply and fixes: it was a really busy EOY.
> This series contains fixed @Alistair suggestion on enabling J-ext.
>
> As for @Richard comments:
> - Indeed I've missed appending review-by to the approved commits. Now I've restored them except for the fourth commit. @Richard could you please tell if you think it's still ok to commit it as is, or should I support masking mem ops for RVV first?
> - These patches don't have any support for load/store masking for RVV and RVH extensions, so no support for special load/store for Hypervisor in particular.
>
> If this patch series would be accepted, I think my further attention would be to:
> - Support pm for memory operations for RVV
> - Add proper csr and support pm for memory operations for Hypervisor mode
> - Support address wrapping on unaligned accesses as @Richard mentioned previously

Overall this looks fine.

Unfortunately it doesn't look like there is a release of the pointer
masking spec. Until there is a release (a draft release counts) we
can't accept it. We need a version to point to so that we can say "we
support v0.1 of the RISC-V pointer masking spec". Otherwise we are
chasing a moving target and users don't know what version we do/don't
support.

Do you know the current state of the spec?

Alistair

>
> Thanks!
>
> Alexey Baturo (5):
>   [RISCV_PM] Add J-extension into RISC-V
>   [RISCV_PM] Support CSRs required for RISC-V PM extension except for
>     the ones required for hypervisor mode
>   [RISCV_PM] Print new PM CSRs in QEMU logs
>   [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
>     instructions
>   [RISCV_PM] Allow experimental J-ext to be turned on
>
> Anatoly Parshintsev (1):
>   [RISCV_PM] Implement address masking functions required for RISC-V
>     Pointer Masking extension
>
>  target/riscv/cpu.c                      |  30 +++
>  target/riscv/cpu.h                      |  33 +++
>  target/riscv/cpu_bits.h                 |  66 ++++++
>  target/riscv/csr.c                      | 271 ++++++++++++++++++++++++
>  target/riscv/insn_trans/trans_rva.c.inc |   3 +
>  target/riscv/insn_trans/trans_rvd.c.inc |   2 +
>  target/riscv/insn_trans/trans_rvf.c.inc |   2 +
>  target/riscv/insn_trans/trans_rvi.c.inc |   2 +
>  target/riscv/translate.c                |  44 ++++
>  9 files changed, 453 insertions(+)
>
> --
> 2.20.1
>
>

