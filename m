Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miUoA-0005O1-1k
	for mharc-qemu-riscv@gnu.org; Thu, 04 Nov 2021 00:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1miUo8-0005MI-Gl; Thu, 04 Nov 2021 00:57:00 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:43906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1miUo6-0003BZ-LZ; Thu, 04 Nov 2021 00:57:00 -0400
Received: by mail-il1-x12e.google.com with SMTP id s14so4972312ilv.10;
 Wed, 03 Nov 2021 21:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aWSreHhHkHSP/YZ66P97FLl/QHb8JLJWRCgVr4lf1wg=;
 b=i4+bSfnLV2R0/TuJJw8HxighQ6x0hTDbJ32tSAWxo/zOH4fWNAhpii02nEfiC5hn5D
 H+Yhmcek5tTFHjvJl3mMSUfOgoHYxdTYTIpWR3A7nGJK+JNDv2YpnjJ0xMiPlXLY3jqM
 FPdfMDHnPrDdl9p6pyzCb64orbGtVBdoXEdFPE/n1WMJus9SOLSQQ11LOp5211A2NGOB
 IFfM6M5Z6pkyUK4jaDVlx7JWqbsWN2ZTvXRdzUhePO5j4DZ+/QWyD8aTw+KmB/wOQxSG
 U4q5W0d6/NGlck+uOMwv1kX2kUAjtX6khIJkwjDnJRg+pxrS9hBjXqAhDEo0IBVTwawG
 WUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aWSreHhHkHSP/YZ66P97FLl/QHb8JLJWRCgVr4lf1wg=;
 b=SqauBas5pb4B1a89tVT2LHZTEfnR+aRNAklzzfRFSQkn/p/0kfxk70MzeERQjnSTq0
 Mt/ymFWFvBqB1ry6Bv1eI62E5fr9bIoz3Ko5YlHBM0puzrhh7JYJG7ft6HmSvrANIFVZ
 d7R8tAWWfQeJ1Jczxqjl/kbe9QJY89Ty9q7e2SsJgvt6z616KZjHnd5EJj7qD4Ff1Wxb
 Cah4L4P6sB0G+hefVXAr9HUcKYNSU94gPPFeMq56ViXYz15K7CooDWiwDdi30z3zwr6s
 miQwWK1OmOMCe1MFIgjzz+INBt9IkvLroMJTMcMrZBebG83NAtAKN9LDFemxFl/n0i2y
 yM0Q==
X-Gm-Message-State: AOAM530Iw7q1BQ0zpLMqd5n2psBAWMKFkPMv82slux2BZi99Z2Yr3/PW
 B0uzQensrtqwJAxx0XXLS3p5Z6c5pcA3/1q9nWA=
X-Google-Smtp-Source: ABdhPJwv4VbiCYIUeXnfz1eLRnluLlXbyRD/oVMnf6XWcH+HWxtYWLnSAp5n+Ynwm3+h7L6cRX/mF+/nWU4KkQy4QL0=
X-Received: by 2002:a05:6e02:1a07:: with SMTP id
 s7mr4332250ild.290.1636001817083; 
 Wed, 03 Nov 2021 21:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-15-anup.patel@wdc.com>
In-Reply-To: <20211026064227.2014502-15-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Nov 2021 14:56:29 +1000
Message-ID: <CAKmqyKOkNwpufjn-DuLRUnY1+Epn=krWOEyvjAH69LbhD+9DNg@mail.gmail.com>
Subject: Re: [PATCH v4 14/22] target/riscv: Implement AIA xiselect and xireg
 CSRs
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Thu, 04 Nov 2021 04:57:00 -0000

On Tue, Oct 26, 2021 at 6:08 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The AIA specification defines [m|s|vs]iselect and [m|s|vs]ireg CSRs
> which allow indirect access to interrupt priority arrays and per-HART
> IMSIC registers. This patch implements AIA xiselect and xireg CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  target/riscv/cpu.h     |   7 ++
>  target/riscv/csr.c     | 174 +++++++++++++++++++++++++++++++++++++++++
>  target/riscv/machine.c |   3 +
>  3 files changed, 184 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 21d9c536ef..bf688eb1ea 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -183,6 +183,10 @@ struct CPURISCVState {
>      uint8_t miprio[64];
>      uint8_t siprio[64];
>
> +    /* AIA CSRs */
> +    target_ulong miselect;
> +    target_ulong siselect;
> +
>      /* Hypervisor CSRs */
>      target_ulong hstatus;
>      target_ulong hedeleg;
> @@ -212,6 +216,9 @@ struct CPURISCVState {
>      target_ulong vstval;
>      target_ulong vsatp;
>
> +    /* AIA VS-mode CSRs */
> +    target_ulong vsiselect;
> +
>      target_ulong mtval2;
>      target_ulong mtinst;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 69e857d1e5..e72220fd0f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -854,6 +854,168 @@ static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
>      return RISCV_EXCP_NONE;
>  }
>
> +static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_cpu_virt_enabled(env)) {
> +        return csrno;
> +    }
> +
> +    switch (csrno) {
> +    case CSR_SISELECT:
> +        return CSR_VSISELECT;
> +    case CSR_SIREG:
> +        return CSR_VSIREG;
> +    default:
> +        return csrno;
> +    };
> +}
> +
> +static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
> +                        target_ulong new_val, target_ulong wr_mask)
> +{
> +    target_ulong *iselect;
> +
> +    /* Translate CSR number for VS-mode */
> +    csrno = aia_xlate_vs_csrno(env, csrno);
> +
> +    /* Find the iselect CSR based on CSR number */
> +    switch (csrno) {
> +    case CSR_MISELECT:
> +        iselect = &env->miselect;
> +        break;
> +    case CSR_SISELECT:
> +        iselect = &env->siselect;
> +        break;
> +    case CSR_VSISELECT:
> +        iselect = &env->vsiselect;
> +        break;
> +    default:
> +         return RISCV_EXCP_ILLEGAL_INST;
> +    };
> +
> +    if (val) {
> +        *val = *iselect;
> +    }
> +
> +    wr_mask &= ISELECT_MASK;
> +    if (wr_mask) {
> +        *iselect = (*iselect & ~wr_mask) | (new_val & wr_mask);
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int rmw_iprio(target_ulong iselect, uint8_t *iprio,
> +                     target_ulong *val, target_ulong new_val,
> +                     target_ulong wr_mask, int ext_irq_no)
> +{
> +    int i, firq, nirqs;
> +    target_ulong old_val;
> +
> +    if (iselect < ISELECT_IPRIO0 || ISELECT_IPRIO15 < iselect) {
> +        return -EINVAL;
> +    }
> +#if TARGET_LONG_BITS == 64
> +    if (iselect & 0x1) {
> +        return -EINVAL;
> +    }
> +#endif
> +
> +    nirqs = 4 * (TARGET_LONG_BITS / 32);
> +    firq = ((iselect - ISELECT_IPRIO0) / (TARGET_LONG_BITS / 32)) * (nirqs);

Don't use TARGET_LONG_BITS, this should be checked at runtime instead

Alistair

