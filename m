Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMG8v-000258-07
	for mharc-qemu-riscv@gnu.org; Tue, 16 Mar 2021 16:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMG8s-00021u-Pe; Tue, 16 Mar 2021 16:18:14 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:34289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMG8r-0001CF-5u; Tue, 16 Mar 2021 16:18:14 -0400
Received: by mail-qk1-x734.google.com with SMTP id t4so36699703qkp.1;
 Tue, 16 Mar 2021 13:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=37/rcsoLx5JAcHGPtL3MqQ34offFROAhpl1sEZt2aBo=;
 b=EbUKJiSmUBtOK+ZgeVSYv6rHvuRkzWCtnLeV6Pw8hBAtE1kowQ+CpQVETrF1HZIXlS
 CqNdWh4x+55R2lNmfe55PjzAXqeve8OHDd8KyDBRyFvpuRfEE152D+IjD/3wx+vXRf3q
 TENWYM6iy2R98aUSbfbPZJcCN1I2kL1wXo79UPZ9A6caVP3H9GzRFK2fFPE4RFoHF8J0
 SclsiBb8bpEbQsuBE4b3a8hj7ZWuHK7kSPcjt7nqMU3T0u7+jRIKs4xMGyD89gf+AIWp
 Ia6sTAB8C4V6W7IwUtPiVLFoUEvEWyH2lf4uHomH2SYvkUwZJjoxzPCUT4izg3eOadlI
 TUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=37/rcsoLx5JAcHGPtL3MqQ34offFROAhpl1sEZt2aBo=;
 b=TarK14XEqzC8R/JrnGIe8j/29c3/uGrbO5UnP9t2TtSY1YH5VHczp3Y78HVhecYQhg
 ksQVqKDY5fey33jZvBfFropVzGw5PF8PSaLNABvhEOntFDUUL0tob05Vhvl7V0qDBLtg
 LLXN1uNfEZnHOvJj9AskSIy3VVwfzdfPirLT+8VhzIwfOKTOB3jL3+CLxM+nlMUKBjWR
 7uqtIM19Rvr7HOlYz6lVoE5sjdkLlUcLHLtnGkdBdy96k1q5wwVFg8owzsjU/19XC4AC
 aGYaCNZlOn+I9BhuEfv9xQe4H7KedUgKWM4fPQwwTRyrupRgDfvvXguxXl37uyrJXiWQ
 SUYQ==
X-Gm-Message-State: AOAM532jVW7XXWzfnx3K+iifYmsGfY4jVJUEHMETnyiet48S5svKdt/E
 gaSdQO2TB4Db/KDUl44idAKYK1R0pTpTTp0qizBym5FvsaM=
X-Google-Smtp-Source: ABdhPJwioL2ylifEWWD2BXCjIDY6TfyZikU5TmoOuaTplKGwYfo9+krKZQNRj7xpUF6uJOA/EDxjaC4ETt9JQ684gTo=
X-Received: by 2002:a05:620a:13aa:: with SMTP id
 m10mr933029qki.164.1615925891834; 
 Tue, 16 Mar 2021 13:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210311103005.1400718-1-georg.kotheimer@kernkonzept.com>
In-Reply-To: <20210311103005.1400718-1-georg.kotheimer@kernkonzept.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Mar 2021 16:16:35 -0400
Message-ID: <CAKmqyKMOzUtvB=WWoF5Ltatg4U1OUZuAgiam6Gcvk8hYn=aTPA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Adjust privilege level for HLV(X)/HSV
 instructions
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x734.google.com
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
X-List-Received-Date: Tue, 16 Mar 2021 20:18:15 -0000

On Thu, Mar 11, 2021 at 5:32 AM Georg Kotheimer
<georg.kotheimer@kernkonzept.com> wrote:
>
> According to the specification the "field SPVP of hstatus controls the
> privilege level of the access" for the hypervisor virtual-machine load
> and store instructions HLV, HLVX and HSV.
>
> Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

