Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMzMt-0007wv-EE
	for mharc-qemu-riscv@gnu.org; Thu, 18 Mar 2021 16:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMzMr-0007ud-Al; Thu, 18 Mar 2021 16:35:41 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:41922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMzMp-0005qQ-A7; Thu, 18 Mar 2021 16:35:41 -0400
Received: by mail-il1-x136.google.com with SMTP id r8so6104826ilo.8;
 Thu, 18 Mar 2021 13:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WMDX9Phh+bSWHe/t1G0uxpWBm+OwN2xH8fJ7cugUYMw=;
 b=YLCckbwcu2NIbeLa8gBcL+aGACdr1UnYpGVq0L/rs32ZSVnkTJuz20Hazo4rRJF7/+
 MehKGVU99YhjJSW3zajzV6CHLn+Qj2axf1s8iIE5eeLofTRyXmiOlpBHy/nU02Auk1/L
 svvsC7lZmzTYYIhxMM81z4ysFXG2GYsJ9EvgppQXD0re68MLE4JNBbha4eHhKambQkTK
 3Rh/EFU3vSVcYcSwJgJ2KpDcLmH5rcN9j0CBIx74bp4rVETfN9rYUj9YWeoQYWZTMGn6
 F+iiHh+JR7qH4hHOn8Y/m/2t1ke8wmwxCftxvO6Aj4b0R8v+DxHQxwtqZtXWOq5ydqZI
 iztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WMDX9Phh+bSWHe/t1G0uxpWBm+OwN2xH8fJ7cugUYMw=;
 b=P6rZioQxVgGvrDlNR9CM7+kI2RXUgiPWcTzCl8egUQ4Mss9LmyJMtPbsWSZPtTCmXR
 e5HLqndT4b5HTuZHTNAlduiFr9jnTirBoe1fukzqhVXUZoiawyVGL+PTKl6GEj6aGRty
 gljMoXmJPvmzCRMKYRy6tZg2YNv72jxqMSsW0Zb5u9Q/c6+IOJm9dmLWSUwKU2P8FXtI
 ZgheXiKH0V1kuHqs8/drnghbBCpUid3TR4vwdP/8d3TQDbNt2AFbKK051Apq1+hUtjl7
 KOn1pD0Ds7sBbZ0qDarEk2sqvEL1Dxw6BmRbESJOM6hCLtRsnHpin6VshbfJGBRcQRxN
 u57A==
X-Gm-Message-State: AOAM530DgcQG21MgurxZQB6mUfBE5YJVnkmZXPtl88Nuymqv0DuveqIU
 XC6JRYLjOiaK8ZwF8RdwLHgcLgtXtBNcCh2za/0=
X-Google-Smtp-Source: ABdhPJyRE3UGQ17T+gkWh5Bf3YObKeBwGyeDWT8vX4+aEL9FMnMelnQZVEa01kA8YcJqKhHaYsqgE4014HOZXh2inDI=
X-Received: by 2002:a92:d6cf:: with SMTP id z15mr327930ilp.40.1616099734942;
 Thu, 18 Mar 2021 13:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210311103005.1400718-1-georg.kotheimer@kernkonzept.com>
In-Reply-To: <20210311103005.1400718-1-georg.kotheimer@kernkonzept.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Mar 2021 16:33:45 -0400
Message-ID: <CAKmqyKPHFio8sbO2QUeZ7MdSpxa59Z7dW+8SHmjJPf8h4soqcw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Adjust privilege level for HLV(X)/HSV
 instructions
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Thu, 18 Mar 2021 20:35:41 -0000

On Thu, Mar 11, 2021 at 5:32 AM Georg Kotheimer
<georg.kotheimer@kernkonzept.com> wrote:
>
> According to the specification the "field SPVP of hstatus controls the
> privilege level of the access" for the hypervisor virtual-machine load
> and store instructions HLV, HLVX and HSV.
>
> Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 2f43939fb6..d0577b1e08 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -325,7 +325,11 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>          use_background = true;
>      }
>
> -    if (mode == PRV_M && access_type != MMU_INST_FETCH) {
> +    /* MPRV does not affect the virtual-machine load/store
> +       instructions, HLV, HLVX, and HSV. */
> +    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
> +        mode = get_field(env->hstatus, HSTATUS_SPVP);
> +    } else if (mode == PRV_M && access_type != MMU_INST_FETCH) {
>          if (get_field(env->mstatus, MSTATUS_MPRV)) {
>              mode = get_field(env->mstatus, MSTATUS_MPP);
>          }
> @@ -695,19 +699,18 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
>                    __func__, address, access_type, mmu_idx);
>
> -    if (mode == PRV_M && access_type != MMU_INST_FETCH) {
> -        if (get_field(env->mstatus, MSTATUS_MPRV)) {
> -            mode = get_field(env->mstatus, MSTATUS_MPP);
> +    /* MPRV does not affect the virtual-machine load/store
> +       instructions, HLV, HLVX, and HSV. */
> +    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
> +        mode = get_field(env->hstatus, HSTATUS_SPVP);
> +    } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
> +               get_field(env->mstatus, MSTATUS_MPRV)) {
> +        mode = get_field(env->mstatus, MSTATUS_MPP);
> +        if (riscv_has_ext(env, RVH) && get_field(env->mstatus, MSTATUS_MPV)) {
> +            two_stage_lookup = true;
>          }
>      }
>
> -    if (riscv_has_ext(env, RVH) && env->priv == PRV_M &&
> -        access_type != MMU_INST_FETCH &&
> -        get_field(env->mstatus, MSTATUS_MPRV) &&
> -        get_field(env->mstatus, MSTATUS_MPV)) {
> -        two_stage_lookup = true;
> -    }
> -
>      if (riscv_cpu_virt_enabled(env) ||
>          ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
>           access_type != MMU_INST_FETCH)) {
> --
> 2.30.1
>
>

