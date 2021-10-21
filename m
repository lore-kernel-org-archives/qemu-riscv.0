Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdPBx-0008UM-4d
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 23:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdPBu-0008Rx-EN; Wed, 20 Oct 2021 23:56:30 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:35685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdPBs-0006bb-Sm; Wed, 20 Oct 2021 23:56:30 -0400
Received: by mail-il1-x132.google.com with SMTP id k3so24407324ilu.2;
 Wed, 20 Oct 2021 20:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=afR8Dz+dAOb0WF9kUPyQz/FYT6XDG9HG3Dp3S4kuoYM=;
 b=CkFBvsBzeA2mRiIECxE6jYkf0FZ5SGfzA6h0vcC8qzlhyadASvtQawSAgbayMEVvC0
 nT9JHjw8QEj0LYAkKoL85TvIkzlxVlS7Z26JrgzCzdSFJFZxeoB280HHoDKS8eBc4xbd
 iA3q9+ZIbWj1TQbol7hR7ejsEImxYBA98MS/aQPaAaSfIn3SPCo+153oJ1psoPt59GHg
 zKPZobSP0RPa3nLh2QXDnDfH6rkfOZhIyJ4xVvZIFEUj8X1LNRAM0zEbEWA0MeE/Qj6a
 Cp4j1U+h2J6q/EEf0ldJROJ7ZP1bWKEiZuWsPdlk72HFOwRuOfpwMKM25TpDdqwLFPDh
 hZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=afR8Dz+dAOb0WF9kUPyQz/FYT6XDG9HG3Dp3S4kuoYM=;
 b=k+TTnUIbtxMpHaWMPwA6d7u2OdDgwCWF/q4MqDn4mLMsU0vDx3ItZixVAt9sOdAZRs
 AAHiDci+nPgrZ/cKIG9mmDk/kZBSgYsU1tSI/jIwHvrkn2IcsZwMYQzTJS0CSoot2aEl
 1eTbP+hmQDoJnvDgsBGpOeknnEv2mMjVJ1gsiZp44boug/ICon9ZsJiaVOQUTEnrELPN
 c3VMzr1rU9WdaViy2Jopap+bj4QJr94y7pOID+cP5Tt7QY72ib6MoDFT7iZiTFbcO9/F
 +2TfEsls/AVlHC6AuRrRg/M0hvRNRsVQbKawYjil5OEOk5LhycIb2V1NduzOwIOGqmzG
 4cHQ==
X-Gm-Message-State: AOAM532wbkWuftHkeGRojinpnSIV/zBvRA4e8qEMpxY3VlTif0vDW9DR
 H/v6kh5yrlS/p5w9d4m+O/kTN4Pa6zh07GZFsr4=
X-Google-Smtp-Source: ABdhPJwSa/yRdUBWiqS9uO73eCr4yUCkumQUlln0FiB4fBoVMs9qAnWr81Yte1nO24ZE6k/Qh0jiBNXQ9Ugwz8CjMOo=
X-Received: by 2002:a05:6e02:214a:: with SMTP id
 d10mr2111916ilv.290.1634788587413; 
 Wed, 20 Oct 2021 20:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
 <20211020101935.1369682-5-space.monkey.delivers@gmail.com>
In-Reply-To: <20211020101935.1369682-5-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 13:56:01 +1000
Message-ID: <CAKmqyKOiE-m1SWKpDgKcoQAD-Lb7ze3YcoOHHRjh9FzgdmeTRA@mail.gmail.com>
Subject: Re: [PATCH v15 4/8] [RISCV_PM] Add J extension state description
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 03:56:30 -0000

On Wed, Oct 20, 2021 at 8:24 PM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/machine.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 16a08302da..ae82f82525 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -84,6 +84,14 @@ static bool vector_needed(void *opaque)
>      return riscv_has_ext(env, RVV);
>  }
>
> +static bool pointermasking_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    return riscv_has_ext(env, RVJ);
> +}
> +
>  static const VMStateDescription vmstate_vector = {
>      .name = "cpu/vector",
>      .version_id = 1,
> @@ -138,6 +146,24 @@ static const VMStateDescription vmstate_hyper = {
>      }
>  };
>
> +static const VMStateDescription vmstate_pointermasking = {
> +    .name = "cpu/pointer_masking",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = pointermasking_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINTTL(env.mmte, RISCVCPU),
> +        VMSTATE_UINTTL(env.mpmmask, RISCVCPU),
> +        VMSTATE_UINTTL(env.mpmbase, RISCVCPU),
> +        VMSTATE_UINTTL(env.spmmask, RISCVCPU),
> +        VMSTATE_UINTTL(env.spmbase, RISCVCPU),
> +        VMSTATE_UINTTL(env.upmmask, RISCVCPU),
> +        VMSTATE_UINTTL(env.upmbase, RISCVCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
>      .version_id = 2,
> @@ -189,6 +215,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          &vmstate_pmp,
>          &vmstate_hyper,
>          &vmstate_vector,
> +        &vmstate_pointermasking,
>          NULL
>      }
>  };
> --
> 2.30.2
>
>

