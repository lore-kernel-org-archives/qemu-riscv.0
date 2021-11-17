Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mn9G2-0007se-7m
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 19:57:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn9G0-0007rB-FV; Tue, 16 Nov 2021 19:57:00 -0500
Received: from [2607:f8b0:4864:20::d33] (port=40860
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn9Fy-0001OO-JC; Tue, 16 Nov 2021 19:57:00 -0500
Received: by mail-io1-xd33.google.com with SMTP id p23so919943iod.7;
 Tue, 16 Nov 2021 16:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F5/O94tdN4nIGju2b2lzekpHFOAVSQAm+Gscvjtesqk=;
 b=CIa/ULm57QV7Qj0qaGGLrZZCZsLyWq3Zj1qUyR5kA5XZwuBUY8lDEnr4AYDfGHpnzn
 5oeSouHnp329iHYRieaUMNOUJLDWgjUKziH+b3iVInMG/DgTd31s7haDmR0g+ErDMDv1
 5oI82ftKwuRJMW6rS0Cuw6dDSotrYYq9kWFoHGn7PkRw7LhjOBUC2ySOALROwbG7rvJr
 eaVBRqz0672EEwrYYikZkASulBgRitY6+7fLvz9rG186D4ayoax6uSpczgs8bZTve3/y
 92KMgWLorI3Jor5JY+n7BId/AlLeAptbGM5BUSvaDCEH8emsXm3wqLqk3elzKo55sUVm
 9XSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F5/O94tdN4nIGju2b2lzekpHFOAVSQAm+Gscvjtesqk=;
 b=nVof/BbE1jpNMkENweO8mnhKA+PSXFyzdLDSTXgISiTGrBvzzHvc+86jOZwc71ITBO
 SZz+AV2uS0ovqDHUq4bNSFGMD7cqj7bXuzdImklc+l0uubGxwWzUVKufKCl8kAx/wRk7
 W4QHoDMEoVb/3rKsGTNbpgMELlMwxn+nKm4U5zYg3vxSvjVv4uQZcHbcA0rttTCPyv8J
 QDvEecwxafNdtnfIxeuwbRaNFAuCp4n9TfwY9mnMET0trDa+CL0shMPj1G2+Bw1krK6m
 ka+9MlZ6WuiCfxPrlinLM8kG//gfQTsE38LOqMZReRfWnjwBQTSS3S6CfjbTVSifZTeg
 Z24w==
X-Gm-Message-State: AOAM530GwtfsSSKH/Ddxx6YKijm7JHIELXpuyX1U9Z97ZbEdWN2w4+Vl
 bRAUKa+TH2wEkw7Hw+7iAUfPhLYy/934Mnqq2sVRAaS83qk9CJH2uhY=
X-Google-Smtp-Source: ABdhPJyo+PrkFtuQ6ndnhxd0bmKh1fE0JoCqOwsVC+fFPa0JUZCIjnK7oH81Yej4npJ69SYCcBIbBhBk5aAMxyLe3Xk=
X-Received: by 2002:a6b:ea0a:: with SMTP id m10mr8120125ioc.91.1637110617254; 
 Tue, 16 Nov 2021 16:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20211030135513.18517-1-bin.meng@windriver.com>
 <20211030135513.18517-6-bin.meng@windriver.com>
In-Reply-To: <20211030135513.18517-6-bin.meng@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 Nov 2021 10:56:30 +1000
Message-ID: <CAKmqyKO04Sb2cpGD3=JQM7W=jmRp5LtND_10zS7Hmb1SsY7y7g@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] target/riscv: csr: Hook debug CSR read/write
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Wed, 17 Nov 2021 00:57:00 -0000

On Sun, Oct 31, 2021 at 12:03 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> This adds debug CSR read/write support to the RISC-V CSR RW table.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> (no changes since v1)
>
>  target/riscv/cpu.c |  6 +++++
>  target/riscv/csr.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 84116768ce..6f69ef4f50 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -575,6 +575,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>
>      riscv_cpu_register_gdb_regs_for_features(cs);
>
> +#ifndef CONFIG_USER_ONLY
> +    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
> +        riscv_trigger_init(env);

This function should be added here instead of patch 1

Alistair

> +    }
> +#endif
> +
>      qemu_init_vcpu(cs);
>      cpu_reset(cs);
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9f41954894..dc47ec8d3b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -219,6 +219,15 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
>
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
> +
> +static RISCVException debug(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    return RISCV_EXCP_ILLEGAL_INST;
> +}
>  #endif
>
>  /* User Floating-Point CSRs */
> @@ -1435,6 +1444,48 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException read_tselect(CPURISCVState *env, int csrno,
> +                                   target_ulong *val)
> +{
> +    *val = tselect_csr_read(env);
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_tselect(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    tselect_csr_write(env, val);
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_tdata(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    /* return 0 in tdata1 to end the trigger enumeration */
> +    if (env->trigger_cur >= TRIGGER_NUM && csrno == CSR_TDATA1) {
> +        *val = 0;
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!tdata_available(env, csrno - CSR_TDATA1)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    *val = tdata_csr_read(env, csrno - CSR_TDATA1);
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_tdata(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    if (!tdata_available(env, csrno - CSR_TDATA1)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    tdata_csr_write(env, csrno - CSR_TDATA1, val);
> +    return RISCV_EXCP_NONE;
> +}
> +
>  /*
>   * Functions to access Pointer Masking feature registers
>   * We have to check if current priv lvl could modify
> @@ -1931,6 +1982,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_PMPADDR14] =  { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr },
>      [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
>
> +    /* Debug CSRs */
> +    [CSR_TSELECT]   =  { "tselect", debug, read_tselect, write_tselect },
> +    [CSR_TDATA1]    =  { "tdata1",  debug, read_tdata,   write_tdata   },
> +    [CSR_TDATA2]    =  { "tdata2",  debug, read_tdata,   write_tdata   },
> +    [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
> +
>      /* User Pointer Masking */
>      [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,    write_umte    },
>      [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask, write_upmmask },
> --
> 2.25.1
>
>

