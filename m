Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYdFM-0001um-6a
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 19:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYdFK-0001tr-Gn; Mon, 19 Apr 2021 19:24:02 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:36426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYdFI-0008Qp-Lz; Mon, 19 Apr 2021 19:24:02 -0400
Received: by mail-il1-x12c.google.com with SMTP id p15so19656590iln.3;
 Mon, 19 Apr 2021 16:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ZmjKgqNDYCalC4/D3jay8BqCIx7JZIhtyDUle357Gk=;
 b=eiRlfvZynUVX6n3vmukW/aOEva24fvIRyGw/B9RykxhVEOEqqCgLFpCwnjpXNxxeEk
 58JmLoJuKQM07M06jSrYgtjHqd3ThtJtJd3/nv5jf33P6xH9aqXezAYhKcqd/LfmgUB8
 2LwnaHM9NYVYy5ofvRXPF/DM91awBVn6NMO+ZSqtr08aWnoaSPYRWANDNXW77fEvJXh2
 woqQFcpecKqkc7z5wP/Z13vXK97V1I7bcuiZAvypLQJ0taPbvCD/+qUxBCmTa5pr8Y9F
 7bi181BIsk27iC5N3c9c9tzAQNjjMf4+vpkzoAXxHfbwmp/Wk7ZrC+q5af53HrrcX4No
 9CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ZmjKgqNDYCalC4/D3jay8BqCIx7JZIhtyDUle357Gk=;
 b=bs8RhGXjATVsS7k8+/qxdIJicxYBl7tXFSJfR4FplMydjfsj1AmHZjIEeaWPwsi2L0
 QC8HFckIkG/dukPmjRMr9TNd0vsOG5afomPHGW4ovkaOMAimYpA9Y4xJ6/6y0ge+8td5
 RMHoeBBLoarMzEra+ffq2EzFHjGoVtutvwgeV32E1FX2Xyo70BJzIX3clFW8KryN63kZ
 ZjZGHauHz4Vrf5A+PvkPqBXwQ6TWvKu2sLI4BEifGUvH+WkNgjdAsJOXHtzegmFHC1eI
 kNPaGaoXnswoKSuY//R+IX5qiE2GRb1ltZBJEDdGLSYQFVDg609pEuPmWIQVjbsNWGC7
 5zig==
X-Gm-Message-State: AOAM532MVplVKPS1A7wm4gkaeUyN2eteuxGFCdmwd8qOTPGICN7T5sJ+
 uMqo9ID+I+5p8CN6NiJ9FHPG8Qot8StWJXG4cvE=
X-Google-Smtp-Source: ABdhPJxCm7UOK+OTAnP3arVZCZ5NSuTwXnwEBdGqdJCnAoSmMVH378f57Twzb0j3o1ZGlUXRGsCejg+No5Qj+KLwrso=
X-Received: by 2002:a05:6e02:671:: with SMTP id
 l17mr19754295ilt.267.1618874639393; 
 Mon, 19 Apr 2021 16:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-2-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-2-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Apr 2021 09:23:33 +1000
Message-ID: <CAKmqyKMc4TiKgJKM8nUpGR+hWAyUAdjh8bG7chBAdsXq57-V5A@mail.gmail.com>
Subject: Re: [RFC PATCH 01/11] target/riscv: Add CLIC CSR mintstatus
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Mon, 19 Apr 2021 23:24:02 -0000

On Fri, Apr 9, 2021 at 5:52 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> CSR mintstatus holds the active interrupt level for each supported
> privilege mode. sintstatus, and user, uintstatus, provide restricted
> views of mintstatus.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu.h      |  2 ++
>  target/riscv/cpu_bits.h | 11 +++++++++++
>  target/riscv/csr.c      | 26 ++++++++++++++++++++++++++
>  3 files changed, 39 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0a33d387ba..1a44ca62c7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -159,6 +159,7 @@ struct CPURISCVState {
>      target_ulong mip;
>
>      uint32_t miclaim;
> +    uint32_t mintstatus; /* clic-spec */
>
>      target_ulong mie;
>      target_ulong mideleg;
> @@ -243,6 +244,7 @@ struct CPURISCVState {
>
>      /* Fields from here on are preserved across CPU reset. */
>      QEMUTimer *timer; /* Internal timer */
> +    void *clic;       /* clic interrupt controller */

This should be the CLIC type.

>  };
>
>  OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index caf4599207..c4ce6ec3d9 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -165,6 +165,7 @@
>  #define CSR_MCAUSE          0x342
>  #define CSR_MTVAL           0x343
>  #define CSR_MIP             0x344
> +#define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
>
>  /* Legacy Machine Trap Handling (priv v1.9.1) */
>  #define CSR_MBADADDR        0x343
> @@ -183,6 +184,7 @@
>  #define CSR_SCAUSE          0x142
>  #define CSR_STVAL           0x143
>  #define CSR_SIP             0x144
> +#define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
>
>  /* Legacy Supervisor Trap Handling (priv v1.9.1) */
>  #define CSR_SBADADDR        0x143
> @@ -585,6 +587,15 @@
>  #define SIP_STIP                           MIP_STIP
>  #define SIP_SEIP                           MIP_SEIP
>
> +/* mintstatus */
> +#define MINTSTATUS_MIL                     0xff000000 /* mil[7:0] */
> +#define MINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
> +#define MINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
> +
> +/* sintstatus */
> +#define SINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
> +#define SINTSTATUS_UIL                     0x000000ff /* uil[7:0] */

The bit fields in the comments are out of date.

Alistair

> +
>  /* MIE masks */
>  #define MIE_SEIE                           (1 << IRQ_S_EXT)
>  #define MIE_UEIE                           (1 << IRQ_U_EXT)
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d2585395bf..320b18ab60 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -188,6 +188,12 @@ static int pmp(CPURISCVState *env, int csrno)
>  {
>      return -!riscv_feature(env, RISCV_FEATURE_PMP);
>  }
> +
> +static int clic(CPURISCVState *env, int csrno)
> +{
> +    return !!env->clic;
> +}
> +
>  #endif
>
>  /* User Floating-Point CSRs */
> @@ -734,6 +740,12 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
>      return 0;
>  }
>
> +static int read_mintstatus(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->mintstatus;
> +    return 0;
> +}
> +
>  /* Supervisor Trap Setup */
>  static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> @@ -893,6 +905,13 @@ static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
>      return ret;
>  }
>
> +static int read_sintstatus(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    target_ulong mask = SINTSTATUS_SIL | SINTSTATUS_UIL;
> +    *val = env->mintstatus & mask;
> +    return 0;
> +}
> +
>  /* Supervisor Protection and Translation */
>  static int read_satp(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> @@ -1644,5 +1663,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", any32,  read_zero },
>      [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", any32,  read_zero },
>      [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", any32,  read_zero },
> +
> +    /* Machine Mode Core Level Interrupt Controller */
> +    [CSR_MINTSTATUS] = { "mintstatus", clic,  read_mintstatus },
> +
> +    /* Supervisor Mode Core Level Interrupt Controller */
> +    [CSR_SINTSTATUS] = { "sintstatus", clic,  read_sintstatus },
> +
>  #endif /* !CONFIG_USER_ONLY */
>  };
> --
> 2.25.1
>
>

