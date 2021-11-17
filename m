Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mn9HO-0001Bm-AT
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 19:58:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn9HN-0001BS-AJ; Tue, 16 Nov 2021 19:58:25 -0500
Received: from [2607:f8b0:4864:20::d31] (port=46846
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn9HL-0001Vm-S5; Tue, 16 Nov 2021 19:58:24 -0500
Received: by mail-io1-xd31.google.com with SMTP id k22so874604iol.13;
 Tue, 16 Nov 2021 16:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=inwvB+2f3Ke+LnwljSoUZ+PJaCIuLj+SQOpz9ICw90I=;
 b=ow3CUYTL0VDNjg4aB8aHE3NJLZ8zt2RCBxt7rOjBCgdoKrSV1zCVMBpJ0gk9DxL213
 nf8ZGQXbBzODhYYr8SMfRDAYGEVY0k39WcrinFrlO6oPfDkRT+AUwLUWUtmdpT5jtX13
 oOhQW+CzMmB3Lm5ymdOcmf5cfbvXg9BRWKEYirHLZrQX6cu2Invr0m9PSExcTu1QQq07
 bQzGE55KrIcLmlkTF/szzsHVAK/iwdR/CFJYBd/O7whfnWnPq2QNJC6wsIEBg0lQNhy5
 2m6rGwqC2lAF0alSHFmsu6w+aP44YoArZyiUoZUFDinshx5A+WoMSgLeqVPHvlO2Z1gS
 BA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=inwvB+2f3Ke+LnwljSoUZ+PJaCIuLj+SQOpz9ICw90I=;
 b=19bPFraTNFhc1soHr7FReH7Diz8fVH3mmL8sX1LmF/9i/lPZfdO3KR3YBllDwUSBQL
 3AzIZ2N6zAy6ZxXtu5zWWcHaoRiMezDwkDdBgBxSTArtC392BjLsig16Ex41YyCquauj
 ay7/KhwzxDwnpkE396sIqYsGxKu/aPWDQGEmTUaBoHh/JwMpNsQ8pEIIN6mVn5VY1XDV
 pjV0VYpYZXVzLUYWVz0cT376l9kqG0W0hhZaIB6bdR9Ls395W+vH1WqrQslA/gi4qoLC
 4aFR1ovEkMVJB7sUmV2JjTWAKIlvTfsAVfcHdl49nds0dFeSl8c/s5mgl+xCtZqc9t14
 UePg==
X-Gm-Message-State: AOAM532yjljavRWwT96zS29I3eBPEVBRyLUaVEMBFNmDxjh4Ddm9C7YO
 DKMzRUsDEs7IxZgJVmG7O19LvHQxn9RnPPbVi8I=
X-Google-Smtp-Source: ABdhPJyop+R0T4z6A9/3PTSjSauiuZn129evA2g8Epl3gIuPnXvoBJkxn28miA2TOcsHhOG9yTL5YoCRRikNW8g2r5w=
X-Received: by 2002:a02:9f0c:: with SMTP id z12mr9199412jal.117.1637110702653; 
 Tue, 16 Nov 2021 16:58:22 -0800 (PST)
MIME-Version: 1.0
References: <20211030135513.18517-1-bin.meng@windriver.com>
 <20211030135513.18517-7-bin.meng@windriver.com>
In-Reply-To: <20211030135513.18517-7-bin.meng@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 Nov 2021 10:57:56 +1000
Message-ID: <CAKmqyKOXtJMETp0MF_dza7mDz8KgLkEC4iHt4VFubDnsjdFPrQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] target/riscv: cpu: Enable native debug feature on
 virt and sifive_u CPUs
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Wed, 17 Nov 2021 00:58:25 -0000

On Sat, Oct 30, 2021 at 11:56 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Turn on native debug feature on virt and sifive_u CPUs.

Is there a reason why it's only these 2 machines? Could this be
enabled by default for all CPUs?

Alistair

>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> Changes in v2:
> - new patch: enable native debug feature on virt and sifive_u CPUs
>
>  target/riscv/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6f69ef4f50..b4d3c58dea 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -153,6 +153,7 @@ static void rv64_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV64, 0);
> +    qdev_prop_set_bit(DEVICE(obj), "debug", true);
>  }
>
>  static void rv64_sifive_u_cpu_init(Object *obj)
> @@ -160,6 +161,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +    qdev_prop_set_bit(DEVICE(obj), "debug", true);
>  }
>
>  static void rv64_sifive_e_cpu_init(Object *obj)
> @@ -175,6 +177,7 @@ static void rv32_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV32, 0);
> +    qdev_prop_set_bit(DEVICE(obj), "debug", true);
>  }
>
>  static void rv32_sifive_u_cpu_init(Object *obj)
> @@ -182,6 +185,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +    qdev_prop_set_bit(DEVICE(obj), "debug", true);
>  }
>
>  static void rv32_sifive_e_cpu_init(Object *obj)
> --
> 2.25.1
>
>

