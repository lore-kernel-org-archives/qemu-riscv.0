Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nR2u2-0000Tx-Vg
	for mharc-qemu-riscv@gnu.org; Sun, 06 Mar 2022 21:15:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nR2tz-0000SC-1b; Sun, 06 Mar 2022 21:15:11 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=40825
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nR2tx-0007ev-EV; Sun, 06 Mar 2022 21:15:10 -0500
Received: by mail-io1-xd2f.google.com with SMTP id x4so583394iop.7;
 Sun, 06 Mar 2022 18:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=65oCB9nwvXCWbNUO+pbL6h9W1bWgHdN18FWgCo+w9Qo=;
 b=BT/NFHrExqwsiiVtuzJE85mz+xhoGfyOeTtJTk9kFUo1MHEPbg6W8Sgc7OzOPkDQ8W
 QlxXcqmBKnDLXslK2Sptwl5U4s5hF2adrPy7K1nzXEH2Hl3SOQViTim71yQXwc0uXkt+
 tCYAWvhToNvBsuLip4FQodfhxthKDpQQOg+5q7QrWBEQ1Gvv5/0QkPgn3aqevEmwoiTL
 zJPyrOiN0qBFQIhu/ReKgwmGNFO0GL4iQXtUu1zlfA4aTJttgMPjSgz0Rz7sFBgMTxnN
 sSJGHjDPu2XVFVzaCS3M6sXOSItHCgpp3XbkbeM4qDRV4m2OwPhk9iqPdcyROYXDr2/N
 GUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=65oCB9nwvXCWbNUO+pbL6h9W1bWgHdN18FWgCo+w9Qo=;
 b=3VjPrJDzE62EkMIY8vsBSyUHYoDr00JRFlHukzuTHQ/uBPngrwaPVfXM2DrujvRLsU
 3hhiNDVtusaB3spt+7MCpwhAy+ipdBuQhu4v1nrrI2FUHJiiUa778r0m1mu6yLCpl7q9
 UaJ+xslqWb5vyINNLgx3muneHX94RhoG6GluAjbfHQ2S9lw/GQuwwtoRfYLloXhOwlm4
 fdbuPR+Wq6u1Eby8vippMfsNwDxHUmw5yAQhpK9mbPxVLWhyjQ2V16JcHoZBIiw34ims
 eGMFxh1zn/lUQt/6Cjhrrzhf1huavtrSXT5xw+zfdR3c2cjq4cki+rSyo73z0ItRCeRi
 xWYQ==
X-Gm-Message-State: AOAM532J2PuUEyP3X2wl1A3Q5OQn7N5AMeJER04u9irTuiKJP/WALQTr
 LAuWPyf2VSI1RVW2iIkfilsI+WH073GWqHiU77M=
X-Google-Smtp-Source: ABdhPJyGsQfPoSREamdIhJHBnhLA8xaUeiyLy6QLIVV+KUT+tvULCiD+wlbJawcDNZykujiG8jcfy3SpZuAhtMCAnjE=
X-Received: by 2002:a05:6638:15ce:b0:317:b681:157b with SMTP id
 i14-20020a05663815ce00b00317b681157bmr4457411jat.66.1646619307120; Sun, 06
 Mar 2022 18:15:07 -0800 (PST)
MIME-Version: 1.0
References: <20220303185440.512391-1-atishp@rivosinc.com>
 <CAKmqyKPpEzk_QrCte6m=SRwCZL-1+osFa9j28N6q9nYzKwo-pg@mail.gmail.com>
In-Reply-To: <CAKmqyKPpEzk_QrCte6m=SRwCZL-1+osFa9j28N6q9nYzKwo-pg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 7 Mar 2022 12:14:41 +1000
Message-ID: <CAKmqyKPs5qcGgKKy-_fpwrsGe3TXR=09oBCB7VzjJUp9ctzE8A@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Privilege version update
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
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
X-List-Received-Date: Mon, 07 Mar 2022 02:15:11 -0000

On Mon, Mar 7, 2022 at 12:14 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Mar 4, 2022 at 4:59 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > RISC-V International (RVI) has ratified many RISC-V ISA extensions recently[1].
> > The privileged specification version is also upgraded to v1.12. It means
> > certain CSRs introduced in v1.12 should only be accessible only if the
> > priv specification version supported is equal or greater than v1.12.
> > Doing this check in predicate function is not scalable as there will be
> > new CSRs introduced in the future versions of the privileged specification.
> >
> > This series tries to address this problem by adding a field in the csr_ops
> > which can be checked in csrrw function before invoking the predicate function.
> > To keep the code churn to minimum, it is assumed that the minimum version of
> > the privilege version supported for any CSR is v1.10 unless specified
> > explicitly in the csr_ops table. Any new CSRs introduced in v1.12 have been
> > updated accordingly.
> >
> > This will work fine for any ratified extensions. However, it is bit unclear
> > what should be done for the stable draft extensions. My suggestion is not
> > to update the priv field in the CSR ops table until the extension is
> > marked experimental (i.e. not frozen/ratified). Once the extension is
> > ratified and graduated from experimental to available stage, the privileged
> > spec version should be updated in the csr table if required. I am open to
> > other suggestions as well.
> >
> > [1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions
> >
> > Changes from v4->v5:
> > 1. Rebased on top of riscv-to-apply.next
> >
> > Changes from v3->v4:
> > 1. Added reviewed-by tags.
> > 2. Improved the commit text in PATCH 3 & 6.
> >
> > Changes from v2->v3:
> > 1. Only update the bits defined in *envcfg CSR
> >
> > Changes from v1->v2:
> > 1. Unified both [m/h]envcfg & [m/h]envcfgh into one.
> > 2. Changed the priv spec version enumeration
> > 3. Improved csr_ops table to provide better redability.
> > 4. Fixed the compilation error for CONFIG_USER_ONLY
> > 5. Rebased on top of the AIA series.
> >
> > Atish Patra (6):
> > target/riscv: Define simpler privileged spec version numbering
> > target/riscv: Add the privileged spec version 1.12.0
> > target/riscv: Introduce privilege version field in the CSR ops.
> > target/riscv: Add support for mconfigptr
> > target/riscv: Add *envcfg* CSRs support
> > target/riscv: Enable privileged spec version 1.12
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Whoops, meant to say:

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> Alistair
>
> >
> > target/riscv/cpu.c      |   8 +-
> > target/riscv/cpu.h      |  15 ++-
> > target/riscv/cpu_bits.h |  40 ++++++++
> > target/riscv/csr.c      | 217 +++++++++++++++++++++++++++++++++-------
> > target/riscv/machine.c  |  23 +++++
> > 5 files changed, 263 insertions(+), 40 deletions(-)
> >
> > --
> > 2.30.2
> >
> >

