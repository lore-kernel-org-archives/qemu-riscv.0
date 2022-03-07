Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nR2te-0008HN-1z
	for mharc-qemu-riscv@gnu.org; Sun, 06 Mar 2022 21:14:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nR2tc-0008Gp-JQ; Sun, 06 Mar 2022 21:14:48 -0500
Received: from [2607:f8b0:4864:20::12d] (port=34573
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nR2ta-0007QR-Tf; Sun, 06 Mar 2022 21:14:48 -0500
Received: by mail-il1-x12d.google.com with SMTP id h7so2361434ile.1;
 Sun, 06 Mar 2022 18:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rKsSB6aVlVBmdIvqhEDjDLnRzOt2FGJymI4pYjkls/c=;
 b=nJMas7lm8pfMZYx+i2UGtYd0SnXnlcbZ3i50UU6vd5fMEyDdzJdSPK5CcPJaINY7QC
 NX2u3BYX+QTa0RKqO6yBhNFJYAMKNw/zP9nk8hVBYD96wZNsl81mciLa43va+Mr52XBd
 qF0AayHSivMXqoK8ESVhrfaBDixe5oEWNXhyMi/B0eaFYRYb5DvOauAUOPSSdYgmPV45
 qukZmAvFA+qk57vpcNHAjbDnvFkhkvjDYcrCt7Ca9Xq14xfmLFDplKv1QjLoGv6BIDhT
 s5dP3TiwtUYZB2kCj6g50VtVnsrtmM8O5r3UmbbzSsES4Q0XqM87EKArBcumsvxpNazr
 wB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rKsSB6aVlVBmdIvqhEDjDLnRzOt2FGJymI4pYjkls/c=;
 b=iR34LjtViZzBw0P912Xjf9SSMYl2rQxOTcwTGdcBeRXIappnJ1k3lmJpEl0+ahtqq+
 1WJedhCoMus+7C0z02CjpW72QgPIUmsv8CuMJ8aS9YYKWjRc8MUnyI7361qFeHSvqPFh
 1JWwUDTSX2OrqFbtOENHTe57rjAipNc5gWJi0sNhscf0BOk3Tlak9lahMOOL35RofEFn
 JOfZQV75FGwNFw5Yj+JkZDjLBPPy3Qm9ebWaWP+8jEJDgU9gCSEWCHogE7vz7Hl0DkFK
 Dx0jNDJLvGrtD/KomZjGYY/rXmgtRvyDMBeTGiB/GI6bwMhhKCVN0nHtJV+m0EhUNlHv
 A+3g==
X-Gm-Message-State: AOAM532qkhjpin0yaOFqUVvQbR3r1/WD/Rl8C6loCXYkb7IapbAicvoS
 wB9KUivAoeJWz3SOcFE5uFRmzMqqblbo96rIxPI=
X-Google-Smtp-Source: ABdhPJyuU5nUJ9NiSnDdQvA0fk+XxMyCkcLHHOK/gEwgoDv5cAiR+p5AM8lLd3R9sKnk0k+CKN1TXO3yzOS+iqtw/0k=
X-Received: by 2002:a92:c246:0:b0:2c2:740d:1c12 with SMTP id
 k6-20020a92c246000000b002c2740d1c12mr9201923ilo.55.1646619285488; Sun, 06 Mar
 2022 18:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20220303185440.512391-1-atishp@rivosinc.com>
In-Reply-To: <20220303185440.512391-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 7 Mar 2022 12:14:19 +1000
Message-ID: <CAKmqyKPpEzk_QrCte6m=SRwCZL-1+osFa9j28N6q9nYzKwo-pg@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Privilege version update
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Mon, 07 Mar 2022 02:14:48 -0000

On Fri, Mar 4, 2022 at 4:59 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> RISC-V International (RVI) has ratified many RISC-V ISA extensions recently[1].
> The privileged specification version is also upgraded to v1.12. It means
> certain CSRs introduced in v1.12 should only be accessible only if the
> priv specification version supported is equal or greater than v1.12.
> Doing this check in predicate function is not scalable as there will be
> new CSRs introduced in the future versions of the privileged specification.
>
> This series tries to address this problem by adding a field in the csr_ops
> which can be checked in csrrw function before invoking the predicate function.
> To keep the code churn to minimum, it is assumed that the minimum version of
> the privilege version supported for any CSR is v1.10 unless specified
> explicitly in the csr_ops table. Any new CSRs introduced in v1.12 have been
> updated accordingly.
>
> This will work fine for any ratified extensions. However, it is bit unclear
> what should be done for the stable draft extensions. My suggestion is not
> to update the priv field in the CSR ops table until the extension is
> marked experimental (i.e. not frozen/ratified). Once the extension is
> ratified and graduated from experimental to available stage, the privileged
> spec version should be updated in the csr table if required. I am open to
> other suggestions as well.
>
> [1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions
>
> Changes from v4->v5:
> 1. Rebased on top of riscv-to-apply.next
>
> Changes from v3->v4:
> 1. Added reviewed-by tags.
> 2. Improved the commit text in PATCH 3 & 6.
>
> Changes from v2->v3:
> 1. Only update the bits defined in *envcfg CSR
>
> Changes from v1->v2:
> 1. Unified both [m/h]envcfg & [m/h]envcfgh into one.
> 2. Changed the priv spec version enumeration
> 3. Improved csr_ops table to provide better redability.
> 4. Fixed the compilation error for CONFIG_USER_ONLY
> 5. Rebased on top of the AIA series.
>
> Atish Patra (6):
> target/riscv: Define simpler privileged spec version numbering
> target/riscv: Add the privileged spec version 1.12.0
> target/riscv: Introduce privilege version field in the CSR ops.
> target/riscv: Add support for mconfigptr
> target/riscv: Add *envcfg* CSRs support
> target/riscv: Enable privileged spec version 1.12

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> target/riscv/cpu.c      |   8 +-
> target/riscv/cpu.h      |  15 ++-
> target/riscv/cpu_bits.h |  40 ++++++++
> target/riscv/csr.c      | 217 +++++++++++++++++++++++++++++++++-------
> target/riscv/machine.c  |  23 +++++
> 5 files changed, 263 insertions(+), 40 deletions(-)
>
> --
> 2.30.2
>
>

