Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi9Bf-0002rY-Ih
	for mharc-qemu-riscv@gnu.org; Wed, 03 Nov 2021 01:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi9Bd-0002q8-OS; Wed, 03 Nov 2021 01:51:49 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:41473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi9Bc-0002FV-5S; Wed, 03 Nov 2021 01:51:49 -0400
Received: by mail-io1-xd31.google.com with SMTP id p193so1441233iod.8;
 Tue, 02 Nov 2021 22:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4sPIuDWOw9vlWXedB7FqfxfMHcH1ukR1cVT3HfAyz5o=;
 b=N0b/cSLGdmEciNj2EUUxAp/GmJ7tqBX8dnSqn+7MMG5jgZ6uXyeT9kZrQ38hVYlC8t
 2/XQp7xi+ykBxoAUZS8jxc/csoTDatY6tCOrNhH20aseB26xXTM6a8uMnX2qVfKmGZo2
 ifZUaOVmQTwPfjkx5QMHVSVNp1jR3pYoNEeKqcKFXM7zolDHl/UK7RTn5iY6gItTu3Nh
 juy9jtqwliHyQBxm/qYprfCRj156CzJbq9mMq2AHQpdCcKI98eJuw0RoMTM5T2A/nULp
 GBmyK5co+Yxbwrrvr9JfDGJP57p8dRGZq3/BiBuFbBAgA6Hd+CBnTihvXM4W7Vx8HCQS
 fjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4sPIuDWOw9vlWXedB7FqfxfMHcH1ukR1cVT3HfAyz5o=;
 b=QT37dYSJZJMhs0JwSD4x1GgPzcyjy0cLfqVAI4+zQCV3FF4zjuS5WGSrdcvRKkadEt
 L00ytgY6HVtixraOgQ6Sk/+OTvKFqEhhQGZ6zEppX7d2zRjU4hOufSN39iA0Bc5AMAco
 jiHn9l8uKib1PMuzU/pxmUii70cPZIQTkowl2fZBpEIv1jBd7mR0GepX7mzzF7bOq6fv
 Hj2uJEWbNxbr339Tru7/d/qaBYEyY3FqxEGV1igL6jFMul7I5pQU9M2Ng4pcAUhhlAIT
 qkDwT4Xbs8fyn1DwEAMqbTR+AeBXChIOMfObZjsOVRKvuRbXRn7nUCM69aF+khsckavq
 krdg==
X-Gm-Message-State: AOAM530Etc6B3Z9sZIvy9Lmdf7M5DnFYlcG5hRV0F/7UdlARhljxxWEq
 OifHi5198gh+b7c7qsVsUw4AYqVQL79n9YuhxkY=
X-Google-Smtp-Source: ABdhPJwta5sp7S+vvJzHYJr7khm4mVPikeZikdmz05WXNdO8czyHkAHlT1i6amfyIMaxPJmULWtgkTxzdTDhe1UHKSo=
X-Received: by 2002:a5e:c80c:: with SMTP id y12mr28837663iol.16.1635918706632; 
 Tue, 02 Nov 2021 22:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-6-atish.patra@wdc.com>
In-Reply-To: <20211025195601.245631-6-atish.patra@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Nov 2021 15:51:20 +1000
Message-ID: <CAKmqyKOg-TSeLb4xMySFN6c=eaqSgovhDVTRv+Eca0bU1+wHmg@mail.gmail.com>
Subject: Re: [ PATCH v3 05/10] target/riscv: Implement mcountinhibit CSR
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Wed, 03 Nov 2021 05:51:50 -0000

On Tue, Oct 26, 2021 at 6:05 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> As per the privilege specification v1.11, mcountinhibit allows to start/stop
> a pmu counter selectively.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h      |  2 ++
>  target/riscv/cpu_bits.h |  4 ++++
>  target/riscv/csr.c      | 25 +++++++++++++++++++++++++
>  target/riscv/machine.c  |  5 +++--
>  4 files changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d0a722e7cbe1..b421eefa623f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -217,6 +217,8 @@ struct CPURISCVState {
>      target_ulong scounteren;
>      target_ulong mcounteren;
>
> +    target_ulong mcountinhibit;
> +
>      target_ulong sscratch;
>      target_ulong mscratch;
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 999187a9ee2d..72b1485e621f 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -275,6 +275,10 @@
>  #define CSR_MHPMCOUNTER29   0xb1d
>  #define CSR_MHPMCOUNTER30   0xb1e
>  #define CSR_MHPMCOUNTER31   0xb1f
> +
> +/* Machine counter-inhibit register */
> +#define CSR_MCOUNTINHIBIT   0x320
> +
>  #define CSR_MHPMEVENT3      0x323
>  #define CSR_MHPMEVENT4      0x324
>  #define CSR_MHPMEVENT5      0x325
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index a7249eaf917f..faf02e12ec34 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -766,6 +766,28 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
> +                                         target_ulong *val)
> +{
> +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    *val = env->mcountinhibit;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
> +                                          target_ulong val)
> +{
> +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    env->mcountinhibit = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_mcounteren(CPURISCVState *env, int csrno,
>                                        target_ulong *val)
>  {
> @@ -1780,6 +1802,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
>      [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
>
> +    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",   any,    read_mcountinhibit,
> +                                                       write_mcountinhibit },
> +
>      [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
>      [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
>      [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 16a08302daff..20dea0843604 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -140,8 +140,8 @@ static const VMStateDescription vmstate_hyper = {
>
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> +    .version_id = 3,
> +    .minimum_version_id = 3,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> @@ -177,6 +177,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL(env.mtval, RISCVCPU),
>          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
> +        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
>          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> --
> 2.31.1
>
>

