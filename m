Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMhvs-0000sn-TZ
	for mharc-qemu-riscv@gnu.org; Wed, 17 Mar 2021 21:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMhvr-0000se-Rd; Wed, 17 Mar 2021 21:58:39 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:46208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMhvq-00021p-2D; Wed, 17 Mar 2021 21:58:39 -0400
Received: by mail-yb1-xb35.google.com with SMTP id h82so850157ybc.13;
 Wed, 17 Mar 2021 18:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M81rYKxtTy7FY9On3+9SUPbx9Fdn0saE3o9L+jQvg0s=;
 b=TJOs8uQZ4eC1IYpi0mKUdgrr/3mse3akQkMUG7/J2pLGBdA/kJy2XM4F++bT1ya7Lg
 lRISRymyCPVHNdmVsDPFFVoF2yMF7dRceUyMtaTGy+bsjb384Md0wpxOpWNFhigHlOEa
 fhtn238FLL0eqazn7af87dD6F6OSnuRNrd0GQajAjywzaNhhPbKNc435aeFYsWF+3jvJ
 bpB5/BGVMhTH+6XF7GAkOVGXcCdQ1/sc2wp4CWId9IAFglM5hMk2Wy10q1xiZH8MpPrh
 76/4IJAQ+VTNIH+imF0q2KEABoQ2nAsRME3FgWIX8RL+bKSC7aE5h1i5WAbRFQEPeXZw
 8auQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M81rYKxtTy7FY9On3+9SUPbx9Fdn0saE3o9L+jQvg0s=;
 b=FD+5/bIjAGzjB0IOMyFps9I2DGY7dqKqwHCzEpXFXtCDyhQ+wXiiR/24GrkRuxA6tN
 r9sS2rHIBze+ndJJGC2mE2C9n5DWN9YnBKpEQBJFev04ndjIewT5vye4MhcKQ2qkkJhZ
 Y2JBG66ki8fNqlgSJ4E4+sie1xflpsSJeyv3LN06QW9c8F+C1FtnQI10lhLobZrvudwZ
 LtvWBYeG2wuxlJ1O9YDWHe+Q4w2k/w2KFdIxprbBFAdAamhReLrsqlpNouke8lT65pIR
 sMqhxzaKJHu+ER9VZ4iiubgrpP0LhorKPrTC1IbLAzwBdjCpB8F5RFgBp3qhjjkoStQK
 akEA==
X-Gm-Message-State: AOAM531zZwSn1YdMffKR0LyWR5TzTapCvxk1Y39/XENIsx9CoWq+RPUn
 puX/u/6HTdD7qoklcwdEkEzc62OA2nhf64inWAk=
X-Google-Smtp-Source: ABdhPJwa5JEPMiZI+I+YuNtmTF1tpDkoAiFsjH7iXRPd3hjHytF8f7b8v7pCU5JbM6L5fILDzYDVwbOp3IGmMM900ao=
X-Received: by 2002:a5b:147:: with SMTP id c7mr8624444ybp.332.1616032716370;
 Wed, 17 Mar 2021 18:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616002766.git.alistair.francis@wdc.com>
 <685a79eb7992d8b780570501cdb784b607144f02.1616002766.git.alistair.francis@wdc.com>
In-Reply-To: <685a79eb7992d8b780570501cdb784b607144f02.1616002766.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 18 Mar 2021 09:58:25 +0800
Message-ID: <CAEUhbmVCmjFWs1SMh6ZLggC-i6wqXxwt9E6L_aXNuQvX8tPnuA@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] target/riscv: Convert the RISC-V exceptions to an
 enum
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 18 Mar 2021 01:58:40 -0000

On Thu, Mar 18, 2021 at 1:41 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h   | 44 ++++++++++++++++++++-------------------
>  target/riscv/cpu.c        |  2 +-
>  target/riscv/cpu_helper.c |  4 ++--
>  3 files changed, 26 insertions(+), 24 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index caf4599207..8ae404c32a 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -527,27 +527,29 @@
>  #define DEFAULT_RSTVEC      0x1000
>
>  /* Exception causes */
> -#define EXCP_NONE                                -1 /* sentinel value */
> -#define RISCV_EXCP_INST_ADDR_MIS                 0x0
> -#define RISCV_EXCP_INST_ACCESS_FAULT             0x1
> -#define RISCV_EXCP_ILLEGAL_INST                  0x2
> -#define RISCV_EXCP_BREAKPOINT                    0x3
> -#define RISCV_EXCP_LOAD_ADDR_MIS                 0x4
> -#define RISCV_EXCP_LOAD_ACCESS_FAULT             0x5
> -#define RISCV_EXCP_STORE_AMO_ADDR_MIS            0x6
> -#define RISCV_EXCP_STORE_AMO_ACCESS_FAULT        0x7
> -#define RISCV_EXCP_U_ECALL                       0x8
> -#define RISCV_EXCP_S_ECALL                      0x9
> -#define RISCV_EXCP_VS_ECALL                      0xa
> -#define RISCV_EXCP_M_ECALL                       0xb
> -#define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0 */
> -#define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0 */
> -#define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0 */
> -#define RISCV_EXCP_SEMIHOST                      0x10
> -#define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
> -#define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
> -#define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
> -#define RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT  0x17
> +typedef enum RiscVException {

nits: looking at other places in the RISC-V codes, I believe it's
better to name it "RISCVException"

> +    RISCV_EXCP_NONE = -1, /* sentinel value */
> +    RISCV_EXCP_INST_ADDR_MIS = 0x0,
> +    RISCV_EXCP_INST_ACCESS_FAULT = 0x1,
> +    RISCV_EXCP_ILLEGAL_INST = 0x2,
> +    RISCV_EXCP_BREAKPOINT = 0x3,
> +    RISCV_EXCP_LOAD_ADDR_MIS = 0x4,
> +    RISCV_EXCP_LOAD_ACCESS_FAULT = 0x5,
> +    RISCV_EXCP_STORE_AMO_ADDR_MIS = 0x6,
> +    RISCV_EXCP_STORE_AMO_ACCESS_FAULT = 0x7,
> +    RISCV_EXCP_U_ECALL = 0x8,
> +    RISCV_EXCP_S_ECALL = 0x9,
> +    RISCV_EXCP_VS_ECALL = 0xa,
> +    RISCV_EXCP_M_ECALL = 0xb,
> +    RISCV_EXCP_INST_PAGE_FAULT = 0xc, /* since: priv-1.10.0 */
> +    RISCV_EXCP_LOAD_PAGE_FAULT = 0xd, /* since: priv-1.10.0 */
> +    RISCV_EXCP_STORE_PAGE_FAULT = 0xf, /* since: priv-1.10.0 */
> +    RISCV_EXCP_SEMIHOST = 0x10,
> +    RISCV_EXCP_INST_GUEST_PAGE_FAULT = 0x14,
> +    RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT = 0x15,
> +    RISCV_EXCP_VIRT_INSTRUCTION_FAULT = 0x16,
> +    RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT = 0x17,
> +} RiscVException;
>
>  #define RISCV_EXCP_INT_FLAG                0x80000000
>  #define RISCV_EXCP_INT_MASK                0x7fffffff
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2a990f6253..63584b4a20 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -357,7 +357,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>      env->mcause = 0;
>      env->pc = env->resetvec;
>  #endif
> -    cs->exception_index = EXCP_NONE;
> +    cs->exception_index = RISCV_EXCP_NONE;
>      env->load_res = -1;
>      set_default_nan_mode(1, &env->fp_status);
>  }
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 83a6bcfad0..af702f65b1 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -72,7 +72,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>      if (irqs) {
>          return ctz64(irqs); /* since non-zero */
>      } else {
> -        return EXCP_NONE; /* indicates no pending interrupt */
> +        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
>      }
>  }
>  #endif
> @@ -1017,5 +1017,5 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>       */
>
>  #endif
> -    cs->exception_index = EXCP_NONE; /* mark handled to qemu */
> +    cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
>  }
> --

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

