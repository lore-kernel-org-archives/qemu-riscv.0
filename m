Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mn99x-0004Cn-9c
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 19:50:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn99v-0004CN-JR; Tue, 16 Nov 2021 19:50:43 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=37554
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn99t-0000he-Ng; Tue, 16 Nov 2021 19:50:43 -0500
Received: by mail-io1-xd2f.google.com with SMTP id k21so922751ioh.4;
 Tue, 16 Nov 2021 16:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+HS/paWT2eFGVH/zcbAFPxotBiJDf5u4svbGpY0J+Lw=;
 b=huwLl+mshb9MprsUjGP7h9v6bCQPfDtH10bCWXOC0nGHTfhSIq7cKUbHbndSfMlpFw
 w+Noei5QgxtOONfTtJ3K5+R/S+SICIcVFi2wjKB3jRY3vjD6c3JihPMRo6oFjiZFCsqI
 NsFwZFn904iX90WjWA77CHntbmGNdvBOKDjjKAZmZ+P/KabFqbK3g7WNBKYvkrFpkhfg
 vVO7u8NugI53EYRNIDlyluqhlyVdbXdrliyudUjZLZja/0T8R2YIcxKHLcLCia/yxZYD
 Z8rTQegPHaik0GxVu7eYIyLavdt3PxA2A+5Xr2FGW0OOsXc0bqGWB1sDfgJEKhbcsHNJ
 BCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+HS/paWT2eFGVH/zcbAFPxotBiJDf5u4svbGpY0J+Lw=;
 b=GINzG0SM0ZnSvb17D5mDLfLreVOXoLwe9SiBtUiMafe3LOC8QxleEcQJyvnb1VkuBL
 /Ko5A/JNAS0vxWD4P6aRej13x+ChEsrGBQtiCJrUxgWUJ5V3EH6K/TDPWxljSR0S1YId
 g/RGCjxqZnbxwdM5X+pTqMr3rvFMs9VJSV2bgW3S03OwWe1Dq8aW+Z4pdR5n3beUuvwP
 PSOu5Y2pk1ZN1S9csR/d32AG1aSTu5oKnK3BybDdV6c2K+1xFF0FYPBF23hDK7zIa9a0
 lWPc4+v3pfooj2Fo3x0R3BJ9+a8VmN1ZGLrNBX2H/0zx0EPbnZffnvEVsUhX9V8yjfsj
 pVAA==
X-Gm-Message-State: AOAM533+qJJ64lWoFwGZugF53BXBU8aq5hlyIR82rmwvHEFw9mLJR2nK
 SVVQnCvOFmL2ySScCFLPX2IkGPFjIwVgmBVm6O8=
X-Google-Smtp-Source: ABdhPJx4SCoNmfyrYJU6ZvZn5o+4F3BpgwDzcvLnxFPCOdF6NqCwNGGgo+NTH/+hXfdh8s8ilSinj0FiPICZVDV40do=
X-Received: by 2002:a05:6638:2656:: with SMTP id
 n22mr9466079jat.35.1637110240304; 
 Tue, 16 Nov 2021 16:50:40 -0800 (PST)
MIME-Version: 1.0
References: <20211030135513.18517-1-bin.meng@windriver.com>
 <20211030135513.18517-3-bin.meng@windriver.com>
In-Reply-To: <20211030135513.18517-3-bin.meng@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 Nov 2021 10:50:14 +1000
Message-ID: <CAKmqyKODNi6bq_6n4zk0cfx6Gax6Aj3Bjna044rgxkXwJuF9Bg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] target/riscv: machine: Add debug state description
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Wed, 17 Nov 2021 00:50:44 -0000

On Sat, Oct 30, 2021 at 11:56 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Add a subsection to machine.c to migrate debug CSR state.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - new patch: add debug state description
>
>  target/riscv/machine.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index ad8248ebfd..25aa3b38f7 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -164,6 +164,38 @@ static const VMStateDescription vmstate_pointermasking = {
>      }
>  };
>
> +static bool debug_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    return riscv_feature(env, RISCV_FEATURE_DEBUG);
> +}
> +
> +static const VMStateDescription vmstate_debug_type2 = {
> +    .name = "cpu/debug/type2",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINTTL(mcontrol, trigger_type2_t),
> +        VMSTATE_UINTTL(maddress, trigger_type2_t),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_debug = {
> +    .name = "cpu/debug",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = debug_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
> +        VMSTATE_STRUCT_ARRAY(env.trigger_type2, RISCVCPU, TRIGGER_TYPE2_NUM,
> +                             0, vmstate_debug_type2, trigger_type2_t),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
>      .version_id = 3,
> @@ -218,6 +250,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          &vmstate_hyper,
>          &vmstate_vector,
>          &vmstate_pointermasking,
> +        &vmstate_debug,
>          NULL
>      }
>  };
> --
> 2.25.1
>
>

