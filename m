Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo3Sg-00031i-Jr
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 07:57:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3Se-0002ww-O1; Fri, 19 Nov 2021 07:57:48 -0500
Received: from [2607:f8b0:4864:20::12e] (port=45632
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3Sc-0000WJ-9C; Fri, 19 Nov 2021 07:57:48 -0500
Received: by mail-il1-x12e.google.com with SMTP id i12so10081321ila.12;
 Fri, 19 Nov 2021 04:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xLDB3O9Lsd4voAHIKL5OdHryF4ObCBcKnsYLhxBafg4=;
 b=fVLRdqGjzm9ZA7J2VXAVrXVX8GBQsQg4AN8B8J+IREUKLN8QhRySqkzzK+sg0CSmkA
 l5d/xtYZwEQuDuqj2bMg9HOuxvVxm7HTmeiWe4q4IgMaK/9Lv0EZiMLxmbs6lFAm1EYL
 DJVbhjO8dfe+Ik1j8GGVvc0jQIXETyfoU4F4e9wFwcKMSqEr3iUNVM577pX4WBd8ckKv
 0Yi8qPx/V65IB9RQkE0dKK1A29xwXUuMLB8CSsYT+KBP5nwJcumAbMwDGqIfp5zNqCRR
 cE2ss6+FV5XhEBTtDyCDRcFxoEcbHP/3ULZLgYVrPku6vGozGZEgdZbknK3lTBAWSQAb
 FTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xLDB3O9Lsd4voAHIKL5OdHryF4ObCBcKnsYLhxBafg4=;
 b=0pblv3IIGdX4jtCT+zevoJDRZQbJsWVhlGdwFrDZKBaOkHUx03OcltTF6IFzRueJvT
 w+JH/1uevor5MPApw/FrwJt5H8SRH7smTSCwCRjqIX8D+RBisJOSoZBZW3sWzabTBocA
 fpLGzjy1EzfHn/g9uRjeyb8sCERbaKxqF2I82AvVPtgill6nRoDBVTmH6nav3eKaczfU
 bWR83HIvvOVnNMCn85duyezKZaU01/10orCpynW+paQU0hEjKY34XJQGxnBymxA3hlD7
 cwrTmPkNYMO+TaxRKZmsGVP0DVaRjRijt474EJVuzPHKz4opDZ8A5Qa9vd4K/m5FJeTx
 /CwA==
X-Gm-Message-State: AOAM533XxzWIkB6uz1ddbQ7InB2mcgM45eoT1TYjyiBeoyYB0pIwtKv0
 zochltuHuMd5e0vBvLoh5aTRm05r8vUmwTi/fYw=
X-Google-Smtp-Source: ABdhPJwaWL/Pa4qERaMVc2ExtRJLzznhffdoOY+FmjyE9vH2+Bw1xDsKnnbz0rNyix4IAHP55RQe4IrorTSfQz0nGzI=
X-Received: by 2002:a92:cda2:: with SMTP id g2mr4651639ild.46.1637326664705;
 Fri, 19 Nov 2021 04:57:44 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 22:57:17 +1000
Message-ID: <CAKmqyKMg8bMjnkbDUBQhJy3VXnY=HTCne8D6uXFPceU4dezhTg@mail.gmail.com>
Subject: Re: [PATCH v4 00/20] Support UXL filed in xstatus
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Fri, 19 Nov 2021 12:57:49 -0000

On Fri, Nov 12, 2021 at 1:52 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> In this patch set, we process the pc reigsters writes,
> gdb reads and writes, and address calculation under
> different UXLEN settings.

Awesome!

Do you have steps on how to test this?

Alistair

>
> The patch set v4 mainly address Richard comments on v3.
> Patch 8, 18, 19, 20 have not been reviewed. Others have been reviewed or acked.
>
> v4:
>   Support SSTATUS64_UXL write
>   Bump vmstate version for vill split
>
> v3:
>   Merge gen_pm_adjust_address into a canonical address function
>   Adjust address for RVA with XLEN
>   Split pm_enabled into pm_mask_enabled and pm_base_enabled
>   Replace array of pm tcg globals with one scalar tcg global
>   Split and change patch sequence
>
> v2:
>   Split out vill from vtype
>   Remove context switch when xlen changes at exception
>   Use XL instead of OL in many places
>   Use pointer masking and XLEN for vector address
>   Define an common fuction to calculate address for ldst
>
>
> LIU Zhiwei (20):
>   target/riscv: Don't save pc when exception return
>   target/riscv: Sign extend pc for different XLEN
>   target/riscv: Ignore the pc bits above XLEN
>   target/riscv: Extend pc for runtime pc write
>   target/riscv: Use gdb xml according to max mxlen
>   target/riscv: Relax debug check for pm write
>   target/riscv: Adjust csr write mask with XLEN
>   target/riscv: Create current pm fields in env
>   target/riscv: Alloc tcg global for cur_pm[mask|base]
>   target/riscv: Calculate address according to XLEN
>   target/riscv: Split pm_enabled into mask and base
>   target/riscv: Split out the vill from vtype
>   target/riscv: Fix RESERVED field length in VTYPE
>   target/riscv: Adjust vsetvl according to XLEN
>   target/riscv: Remove VILL field in VTYPE
>   target/riscv: Ajdust vector atomic check with XLEN
>   target/riscv: Fix check range for first fault only
>   target/riscv: Adjust vector address with mask
>   target/riscv: Adjust scalar reg in vector with XLEN
>   target/riscv: Enable uxl field write
>
>  target/riscv/cpu.c                            | 23 +++++-
>  target/riscv/cpu.h                            | 13 +++-
>  target/riscv/cpu_bits.h                       |  2 +
>  target/riscv/cpu_helper.c                     | 66 ++++++++++++----
>  target/riscv/csr.c                            | 43 ++++++++++-
>  target/riscv/gdbstub.c                        | 71 ++++++++++++-----
>  target/riscv/helper.h                         |  6 +-
>  .../riscv/insn_trans/trans_privileged.c.inc   |  7 +-
>  target/riscv/insn_trans/trans_rva.c.inc       |  9 +--
>  target/riscv/insn_trans/trans_rvd.c.inc       | 19 +----
>  target/riscv/insn_trans/trans_rvf.c.inc       | 19 +----
>  target/riscv/insn_trans/trans_rvi.c.inc       | 22 +-----
>  target/riscv/insn_trans/trans_rvv.c.inc       | 51 ++++++++----
>  target/riscv/machine.c                        | 15 +++-
>  target/riscv/op_helper.c                      |  7 +-
>  target/riscv/translate.c                      | 77 +++++++++----------
>  target/riscv/vector_helper.c                  | 38 +++++----
>  17 files changed, 300 insertions(+), 188 deletions(-)
>
> --
> 2.25.1
>
>

