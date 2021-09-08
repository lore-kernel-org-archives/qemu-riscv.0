Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNqYv-0000J6-0u
	for mharc-qemu-riscv@gnu.org; Wed, 08 Sep 2021 01:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNqYs-0000Gc-V7; Wed, 08 Sep 2021 01:55:54 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:43631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNqYr-0004vm-9o; Wed, 08 Sep 2021 01:55:54 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id c6so1886447ybm.10;
 Tue, 07 Sep 2021 22:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v8q60mt5Ej3v7B7uxMr/itsLyYbnc/Att2uODKJF4gk=;
 b=LCQEYezIiyvnX7UYVlDiSC0ySctpUKPGZ4c6V9LYppGGpWZlrticoiMagwTm7lvNQE
 vYXLnuPllbL31j8gd8TnO1gCX2oKiBmL6efKoZ/RWeSCEOaGK+Qw8w/ou+/EQrIyAwW5
 YLuUoGMVfidaHKwa9YjqhZZISL4LEDvJbrU/RLbYJW2/3oLNd6wCqpQI+1SH9corxQbk
 LnJeZBr2dQ+pqC0brqf10mUUZaLi07zR0qL7RdyQd3QW0nIbynPo5mXXVY/VKZwzExgb
 flJnGaO/d0Q+l66gR4Quw41Ul3ZyxOUs1pFqe4Av9xnbQ5tiW2kkDB8BJU2TPJQrKoLX
 sSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v8q60mt5Ej3v7B7uxMr/itsLyYbnc/Att2uODKJF4gk=;
 b=TV/acBJV74UtyhzUK/Lr9Um4ZOuxKpwy8nLYKKK10Fys6C7TelcHiFam5aopm7MgwP
 7j6ghVuxaFHAAxTcb+gNq2CK5c20U3kGzxBCJUQPUgvzZ8KzivxOcGgVx0T2GlfH4ebj
 NncQ+HM+prCgXWEEpl/3Qd2dYTrLdpMqhEnP3o1g9wDIn9KiGKl+glKXflPFTQSjMMqN
 UrzwoY0EszcMHIL62rAipk2YsnAEbC7Q1wtFVFmlwr5hzgBX4VKGsxHw0vSvXsp0ZCZr
 5gm8hzX6CyW/Jy1pYN3zNbqkhXKOIhMPlK/IuaIG/rpqEXLTQr9P5a6Yz5vf78DFcrb+
 mJ+g==
X-Gm-Message-State: AOAM530/YCtPPlE6Ve6TzdaOg4CYbPB4/X6sR1SJWjn85HOnHHwYakau
 vQqYlsMXGxtJRmK4wQAw/rVv9ppZN80czs47Z7Y=
X-Google-Smtp-Source: ABdhPJzcLWhGIcmiPgnDOPVPPyjbTMGly7Fdxp1huqClHtQK8uojav0cEso8BFcVE+bemkRAjCgMQ4R8sLRavg5yM1c=
X-Received: by 2002:a25:76c7:: with SMTP id r190mr2899095ybc.467.1631080551989; 
 Tue, 07 Sep 2021 22:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631076834.git.alistair.francis@wdc.com>
 <be4c59ab0a3468f1962671e7cf5a947c151d31d9.1631076834.git.alistair.francis@wdc.com>
In-Reply-To: <be4c59ab0a3468f1962671e7cf5a947c151d31d9.1631076834.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 13:55:42 +0800
Message-ID: <CAEUhbmUjg_LttOLwFMgZueA7L1aRSRTAdy78-EVybJ=a-ax-8w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/riscv: Set mtval and stval support
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
X-List-Received-Date: Wed, 08 Sep 2021 05:55:55 -0000

On Wed, Sep 8, 2021 at 12:55 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 1 +
>  target/riscv/cpu.c | 6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d11db1f031..5b0bbf2fca 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -309,6 +309,7 @@ struct RISCVCPU {
>          bool mmu;
>          bool pmp;
>          bool epmp;
> +        bool mtval_inst;
>          uint64_t resetvec;
>      } cfg;
>  };
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1a2b03d579..537f2af341 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -437,6 +437,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          }
>      }
>
> +    if (cpu->cfg.mtval_inst) {
> +        set_feature(env, RISCV_FEATURE_MTVAL_INST);
> +    }
> +
>      set_resetvec(env, cpu->cfg.resetvec);
>
>      /* If only XLEN is set for misa, then set misa from properties */
> @@ -600,7 +604,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> -
> +    DEFINE_PROP_BOOL("tval-inst", RISCVCPU, cfg.mtval_inst, true),

Should we tweak such on a per-CPU basis instead of globally enabling
it, e.g.: update sifive_u54 per the real hardware implementation?

>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>

Regards,
Bin

