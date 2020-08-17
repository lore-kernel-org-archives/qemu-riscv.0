Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7jQr-0002LY-4g
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 14:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k7jQo-0002IT-Iw; Mon, 17 Aug 2020 14:00:26 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:46443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k7jQm-0000iL-TK; Mon, 17 Aug 2020 14:00:26 -0400
Received: by mail-io1-xd42.google.com with SMTP id a5so18421643ioa.13;
 Mon, 17 Aug 2020 11:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NCNzXUKkCm417okyZTi7Dh5dWry84XmsjV5fHPAgirI=;
 b=sgFubLC0GeWr7Tc4Je0cbC2cnA//pk09sziIFxvbixZah8Msea95wJ4l7jPSiv7giz
 WvFCg9z/PldVaymCN92UPxkV8Bapht/UI+SPFQF2Y/mk66EydRcm37jtWXxT8uNbiKpe
 846Krvmc2e2FMYNMRfQLRijR/Ojrre2n+CGYXvtxLM7qJXTBX7Kt8Hp7SViNGmjhVes/
 TWFnt605v1HMiagGy9Q/qj7r0grblP+FGXaxymyIOzE7dQYosaJusJZrmqykAPfaAA5i
 UAXNKFHRkbZgPym0/dT7wnIyitmDZ2Q5bX4P3Ru7LHhTQge7/iYc5BAMPeJ5CTYXwDst
 /jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NCNzXUKkCm417okyZTi7Dh5dWry84XmsjV5fHPAgirI=;
 b=ZIlCdksegoAApSr9+2JFAzy0q5V+NX/JVTsiMuhveVDtYQD9mTSAWXG6jgWECzNCYr
 IKerRqKBQmIEEsc8WEesGeVqM0cpd9OruZwfcJkpsYY36eX2GnsTwrgtDzD5kJ8t2Ud/
 Z3cbrA3xIlDQC4xTOWseiFy229q9yh9oib+8iUzqXs5PKYqxcc46R6mcMEFV69HNLJyg
 jQ/i2/TOz5YOEaVCaw+2LOX3hnYRGX8YpOe5Y+vTyuxMoyKsxGrxj95iP1/0vcqoTbSR
 x3ajywUqAt9jVzjNYFmNSyuHHUj5bx2NQJD+gAvY8Ap6mGRGZsIP7NLf+wXmSOQAgk9H
 SjIw==
X-Gm-Message-State: AOAM5329URt3t141fI2tLF471cVG/F8z3E0WqxqJBzadk3OtMW+AFe9f
 64q3obQ8lR9wBgGRhZYo3FQSdX+TQdpv0NpjXrU=
X-Google-Smtp-Source: ABdhPJx+uFR4J1JZgTtGkESbcpzeJME6yDRmojks0yAjztlaX7/M+DewRcuA2UbzoyhPIh9qwMSW0AHCzYeA2g692I4=
X-Received: by 2002:a05:6638:1690:: with SMTP id
 f16mr15764196jat.91.1597687223315; 
 Mon, 17 Aug 2020 11:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
 <1597423256-14847-3-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1597423256-14847-3-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Aug 2020 10:49:51 -0700
Message-ID: <CAKmqyKMczvWVnJ0=bPenUHxwTmzDbfvw+qQD+FW2mXpJPL=LQg@mail.gmail.com>
Subject: Re: [PATCH 02/18] hw/riscv: hart: Add a new 'resetvec' property
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 17 Aug 2020 18:00:27 -0000

On Fri, Aug 14, 2020 at 9:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> RISC-V machines do not instantiate RISC-V CPUs directly, instead
> they do that via the hart array. Add a new property for the reset
> vector address to allow the value to be passed to the CPU, before
> CPU is realized.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/riscv_hart.c         | 3 +++
>  include/hw/riscv/riscv_hart.h | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index f59fe52..613ea2a 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -31,6 +31,8 @@ static Property riscv_harts_props[] = {
>      DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
>      DEFINE_PROP_UINT32("hartid-base", RISCVHartArrayState, hartid_base, 0),
>      DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
> +    DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
> +                       DEFAULT_RSTVEC),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -44,6 +46,7 @@ static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
>                                 char *cpu_type, Error **errp)
>  {
>      object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_type);
> +    qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
>      s->harts[idx].env.mhartid = s->hartid_base + idx;
>      qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
>      return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
> diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
> index c75856f..77aa4bc 100644
> --- a/include/hw/riscv/riscv_hart.h
> +++ b/include/hw/riscv/riscv_hart.h
> @@ -37,6 +37,7 @@ typedef struct RISCVHartArrayState {
>      uint32_t num_harts;
>      uint32_t hartid_base;
>      char *cpu_type;
> +    uint64_t resetvec;
>      RISCVCPU *harts;
>  } RISCVHartArrayState;
>
> --
> 2.7.4
>
>

