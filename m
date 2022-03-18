Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nV7CY-0002sS-DG
	for mharc-qemu-riscv@gnu.org; Fri, 18 Mar 2022 03:39:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nV7CW-0002pX-Hs; Fri, 18 Mar 2022 03:39:08 -0400
Received: from [2607:f8b0:4864:20::d2f] (port=40718
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nV7CU-0004EO-Ro; Fri, 18 Mar 2022 03:39:08 -0400
Received: by mail-io1-xd2f.google.com with SMTP id x4so8425846iop.7;
 Fri, 18 Mar 2022 00:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IStUsWQm7PSqsN6eak1dH4f4Hzc/CLdaduAHd3aB+E4=;
 b=httmhYORcN42ST85JA4HmFw18SlCDiHT9vrd8YB1JyP//iqqz02p5VPw3nv83trVox
 /ViWHGPDhMzD7wwoh0Hs2RsNPnuBahJNL2pJ2/fpZXVC0VwxdfNTTgHiz0J4XQu4/40J
 nxFDb6ld9ON3J+hwpU1JbARxA2qL9+WHQCJViWs/FJd7FQHZ/9dVDrRcvGM8FWJmidbQ
 SWm3prkt1KnTA7jtq6G5nr1GGWTEPurpctbAY9A3bBYHBic3wuWJdjjSIJuNxnIc87Jf
 qpRQ5A68ymFDOMUx6Y1VcGX5iPltHoiG+jgK+m5y+DnOJsCBK+9xd7ilBXQ3x+NseEmo
 FKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IStUsWQm7PSqsN6eak1dH4f4Hzc/CLdaduAHd3aB+E4=;
 b=1tm6d144Tckchu1G8BexzQcHICgxBTOHwq/zzr2hCVXbpdfMwNRX2exrYargSzd3aR
 yKhZr/fDXqe9YzR5qP1skdgLIQQegsQ9GeCcDUy3KEgtbWvBlmiLDK/Gg3WtJtq4t0b/
 RtB/Q77nFm1m8sqn3iBmn973kl2FiqQomaWJc/jgNtCLqv7F4tXplUyHTvWAlxUd2FRn
 85gZrmMfQNVk+mnNgBw6Cu9LrerHu2IJoo7A1B8bvZRhAZrhFRzxtm4gdlqu1cOt7WER
 OmWyFEDChKpUlCRdMge9pF8k2GWqqQZADb1lfFSAUJwWFWcFccn7xvT5UapOTSrE5xau
 y6Lw==
X-Gm-Message-State: AOAM532qY53inj6eMF2Na4XFVVrchn6ttaRfXE4c8K4LVlDnMxfQf298
 6C0bDAc3/6r7iJ4zUvuUhggVixCdj6KcSYp5EN8=
X-Google-Smtp-Source: ABdhPJyquwFy2f5cPWlDf1kjzdE167IvoFV9kRdyn6iBSgvkuvlI2yDBbK3S9kmGmO7Uk43hkBSbThXlc58g6AFxm1g=
X-Received: by 2002:a05:6602:2d05:b0:645:74b1:531a with SMTP id
 c5-20020a0566022d0500b0064574b1531amr3912156iow.203.1647589145456; Fri, 18
 Mar 2022 00:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
In-Reply-To: <20220315065529.62198-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Mar 2022 17:38:39 +1000
Message-ID: <CAKmqyKOtbkHh3eeUNegfmy0d6UtbEEHH3KwZ9kBp9AYmn98WyQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] target/riscv: Initial support for the Sdtrig
 extension via M-mode CSRs
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Fri, 18 Mar 2022 07:39:09 -0000

On Tue, Mar 15, 2022 at 5:17 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
>
> This adds initial support for the Sdtrig extension via the Trigger Module,
> as defined in the RISC-V Debug Specification [1].
>
> Only "Address / Data Match" trigger (type 2) is implemented as of now,
> which is mainly used for hardware breakpoint and watchpoint. The number
> of type 2 triggers implemented is 2, which is the number that we can
> find in the SiFive U54/U74 cores.
>
> [1] https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf
>
> Changes in v4:
> - mention Sdtrig extension in the commit
> - rename 'struct trigger_type2_t' to 'type2_trigger_t'
> - move riscv_trigger_init() call to riscv_cpu_reset()
>
> Changes in v3:
> - drop riscv_trigger_init(), which will be moved to patch #5
> - add riscv_trigger_init(), moved from patch #1 to this patch
> - enable debug feature by default for all CPUs
>
> Changes in v2:
> - new patch: add debug state description
> - use 0 instead of GETPC()
> - change the config option to 'disabled' by default
>
> Bin Meng (7):
>   target/riscv: Add initial support for the Sdtrig extension
>   target/riscv: machine: Add debug state description
>   target/riscv: debug: Implement debug related TCGCPUOps
>   target/riscv: cpu: Add a config option for native debug
>   target/riscv: csr: Hook debug CSR read/write
>   target/riscv: cpu: Enable native debug feature
>   hw/core: tcg-cpu-ops.h: Update comments of debug_check_watchpoint()

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  include/hw/core/tcg-cpu-ops.h |   1 +
>  target/riscv/cpu.h            |   9 +-
>  target/riscv/debug.h          | 114 +++++++++
>  target/riscv/cpu.c            |  12 +
>  target/riscv/csr.c            |  57 +++++
>  target/riscv/debug.c          | 441 ++++++++++++++++++++++++++++++++++
>  target/riscv/machine.c        |  32 +++
>  target/riscv/meson.build      |   1 +
>  8 files changed, 666 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/debug.h
>  create mode 100644 target/riscv/debug.c
>
> --
> 2.25.1
>
>

