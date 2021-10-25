Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1merPs-0002vy-VL
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 00:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1merPr-0002tp-9F; Mon, 25 Oct 2021 00:16:55 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:38575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1merPp-0003vT-Bk; Mon, 25 Oct 2021 00:16:54 -0400
Received: by mail-io1-xd32.google.com with SMTP id v65so2133848ioe.5;
 Sun, 24 Oct 2021 21:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o6cKj/Jn8LdqaISGjHvfX8ohl75K0o1GiJp/0/gIwQk=;
 b=F5L60HUBCjeXGKsIG598FOEaaiky8jPKiD/m+/EPWnZwqPTa7rudXRI6+6gmSDtI9M
 J0yNG09mtTAIFtzU4FnlF4RPfCfVLL8UCFBrFNrSOGGAHrc+F58OWxh8sVCcf39ssq7t
 d1Oeveb1FeJAFdE0JDmu41YSnASnFEV5Tq802NzvlZFoWhXrKwsx7k/xU4qyLBXw0iA/
 bvZ021AsRs6BvxIKqXupFAejJl2GuGcbpp33pEQXlJoEy339awq9j7c7GpEp8KqqaWcg
 ixetsSc3v1eOQh6DMpXc+hkDTA4fdLp8dW8cQzQ2Z8PoJGFNirKOECbjg6IW5z1sVvtR
 eBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o6cKj/Jn8LdqaISGjHvfX8ohl75K0o1GiJp/0/gIwQk=;
 b=RGBbb7JR5jEIyIqp1qAdcAHtlHB1k102HQ3o2TQmfSmfXOwq0JQ3UBTN/ynk4XaS4v
 4gmoAmLjadyloDsoxYcrDKuUpki8Dw1VJ5fC7ohTKr/4sNG29HqcMxZXRd+NKXBHUr8E
 5sq5emPggZTQoi5ASDY0xk5aXeQ8nSNNTzKsLzEgoXryL5ftEMcKd8yV/mlS4sISVxla
 s4sMXbdelYtqSkDMgy8n+6c7vBuP7l07B7BAv3LF3LT4DCpcDgvI4qyS/OXXwArds3Dv
 SzpuOkLFlDWC6OH+4t2izSNtCRt6tAF9kdmZaaHKh23nS47DVaiQX6o8PJ12rTP1NCmh
 pG7Q==
X-Gm-Message-State: AOAM532B5n56u/mzY243aboUhvv2wmDv2flWdAXNY7kLxKsPzONUgPYm
 +xOHNqHwF8Xn1FfsDlDx4X1RPat4oXlAJ+Sd3PM=
X-Google-Smtp-Source: ABdhPJzzUTKWkRmqTMDqOZCo2Dlx1ISTPfpgaxldxNTrEmCQVMS5qmAgGrIyDhzrmyOcgVjqbST1lHeLQDkP1uobBgI=
X-Received: by 2002:a05:6638:32a6:: with SMTP id
 f38mr8827956jav.63.1635135411883; 
 Sun, 24 Oct 2021 21:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
In-Reply-To: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Oct 2021 14:16:25 +1000
Message-ID: <CAKmqyKO9Ox7_YSiK68xoEQHe+fDHyVR5yga8nu4jHXGhHeCKFQ@mail.gmail.com>
Subject: Re: [PATCH v16 0/8] RISC-V Pointer Masking implementation
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 04:16:55 -0000

On Sat, Oct 23, 2021 at 4:23 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> v15:
> Renamed pm into pointer_masking in machine state.
>
> v14:
> Addressed Richard's comments from previous series.
>
> v13:
> Rebased QEMU and addressed Richard's comment.
>
> v12:
> Updated function for adjusting address with pointer masking to allocate and use temp register.
>
> v11:
> Addressed a few style issues Alistair mentioned in the previous review.
>
> If this patch series would be accepted, I think my further attention would be to:
> - Support pm for memory operations for RVV
> - Add proper csr and support pm for memory operations for Hypervisor mode
> - Support address wrapping on unaligned accesses as @Richard mentioned previously
>
> Thanks!
>
> Alexey Baturo (7):
>   [RISCV_PM] Add J-extension into RISC-V
>   [RISCV_PM] Add CSR defines for RISC-V PM extension
>   [RISCV_PM] Support CSRs required for RISC-V PM extension except for
>     the h-mode
>   [RISCV_PM] Add J extension state description
>   [RISCV_PM] Print new PM CSRs in QEMU logs
>   [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
>     instructions
>   [RISCV_PM] Allow experimental J-ext to be turned on
>
> Anatoly Parshintsev (1):
>   [RISCV_PM] Implement address masking functions required for RISC-V
>     Pointer Masking extension

Thanks!

Applied to riscv-to-apply.next

I added a "target/riscv: " prefix to each patch title to indicate that
the patches are for RISC-V.

Alistair

>
>  target/riscv/cpu.c                      |  13 ++
>  target/riscv/cpu.h                      |  15 ++
>  target/riscv/cpu_bits.h                 |  96 ++++++++
>  target/riscv/cpu_helper.c               |  18 ++
>  target/riscv/csr.c                      | 285 ++++++++++++++++++++++++
>  target/riscv/insn_trans/trans_rva.c.inc |   3 +
>  target/riscv/insn_trans/trans_rvd.c.inc |   2 +
>  target/riscv/insn_trans/trans_rvf.c.inc |   2 +
>  target/riscv/insn_trans/trans_rvi.c.inc |   2 +
>  target/riscv/machine.c                  |  27 +++
>  target/riscv/translate.c                |  43 ++++
>  11 files changed, 506 insertions(+)
>
> --
> 2.30.2
>
>

