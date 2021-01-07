Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kxYxD-0000FK-Ka
	for mharc-qemu-riscv@gnu.org; Thu, 07 Jan 2021 12:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kxYxB-00009t-90; Thu, 07 Jan 2021 12:20:05 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:46495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kxYx9-00045J-9F; Thu, 07 Jan 2021 12:20:04 -0500
Received: by mail-il1-x130.google.com with SMTP id 75so7404038ilv.13;
 Thu, 07 Jan 2021 09:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ptcMxe9Nv82uu4oxcfnXc+mpUaxY1oKqsL8yWJb7fS0=;
 b=X1nScLwpP6JgOPzsHdRK41lvP0lB7+i5Cic101pCMRIlw4RVzKO7JxuyFO/l5Y2MI6
 8Aas4DQFaY9Mqyy1iPTf1iP4wsf9fhOaIJ6EPJcBR9kmy1srkboX779DVXrmp2iW4a7V
 Wgg+XksyfZH2sPAI+kKHw3omTod0Wf5iuil0E4FiBGM0/0cHrgdIHD9HcIt1QM9vXFRI
 5mkB5v++kRH68gtL3St65AoTxU9SWqm7MDoIaOv08ZUW9WzF5igE8lBfaWGue8azQmdY
 hgiX+GUugGdzq/ckiKHqBnyYU1sHocZDO/ciLjhD7e6f9l+ZtLuyVtO/aKyMbFRmnOV9
 8owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ptcMxe9Nv82uu4oxcfnXc+mpUaxY1oKqsL8yWJb7fS0=;
 b=NTuBkxCM/OJo0Ggd8kmPZMFSPun0rS5N1Off2vOftk5uGKCRwwmy8hSmYfr1NvJB7y
 Ts8kDiyNXTMvraXyoO829I3OQnv1E7yluObm/qG8nhGO5RKnhfbL961nAC0qdMpJbQ08
 +vPyaEOqX41JcEw35GOa9Oe/5xNPAIWvnY+cFAWEbq9kBBkeO1gRAwIKyJHpeC6oHG+5
 8DsVKqvsvBV1ph96prPc9FBxIzgQ5xTGXHnmzESBUdU8SpGh1BuH2J/p7VHmOV1impdV
 LRb2ZJX8jjfGl/mRSAIDnWB1iOnVotiLXJXEmUWHYF8mff3pRsMwU/CkbqsNkz/7nTr6
 i9lg==
X-Gm-Message-State: AOAM531F2T1AnGpwjvOXA8oChpUM8wJyC3O44gAQ4Taa/JJR0E9jY6DP
 U7mbXrMgiFPQ7rZSDbnyac2zCAXs8++MC2WQWdI=
X-Google-Smtp-Source: ABdhPJzQPyDFut/EvllcjoJdeYqDylzVn4KQaWMGgUBMFkbOEp9Nrd7uio748m5vTckRfcAC9fb2xcbH8xxUrgE0LU8=
X-Received: by 2002:a92:dc0f:: with SMTP id t15mr9955096iln.267.1610040002077; 
 Thu, 07 Jan 2021 09:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20201223192553.332508-1-atish.patra@wdc.com>
In-Reply-To: <20201223192553.332508-1-atish.patra@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Jan 2021 09:19:35 -0800
Message-ID: <CAKmqyKO7uRewgKZz9V5BP5Xnqw8HWaCruaQta1JK_HvzmhdR+Q@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv/pmp: Raise exception if no PMP entry is
 configured
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Thu, 07 Jan 2021 17:20:05 -0000

On Wed, Dec 23, 2020 at 11:26 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> As per the privilege specification, any access from S/U mode should fail
> if no pmp region is configured.

This doesn't sound right, the spec says:

"If no PMP entry matches an S-mode or U-mode access, but at least one
PMP entry is implemented, the access fails."

I don't see anything saying that an access will fail if there are no
PMP regions configred.

Alistair

>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
> Changes from v2->v1
> 1. Removed the static from the function definition
> ---
>  target/riscv/op_helper.c | 5 +++++
>  target/riscv/pmp.c       | 4 ++--
>  target/riscv/pmp.h       | 1 +
>  3 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index d55def76cffd..1eddcb94de7e 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -150,6 +150,11 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
>
>      uint64_t mstatus = env->mstatus;
>      target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
> +
> +    if (!pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +    }
> +
>      target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV);
>      mstatus = set_field(mstatus, MSTATUS_MIE,
>                          get_field(mstatus, MSTATUS_MPIE));
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 2eda8e1e2f07..80d0334e1bfc 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -74,7 +74,7 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
>  /*
>   * Count the number of active rules.
>   */
> -static inline uint32_t pmp_get_num_rules(CPURISCVState *env)
> +uint32_t pmp_get_num_rules(CPURISCVState *env)
>  {
>       return env->pmp_state.num_rules;
>  }
> @@ -237,7 +237,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>
>      /* Short cut if no rules */
>      if (0 == pmp_get_num_rules(env)) {
> -        return true;
> +        return (env->priv == PRV_M) ? true : false;
>      }
>
>      if (size == 0) {
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index 6c6b4c9befe8..c8d5ef4a694e 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -64,5 +64,6 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
>                           target_ulong *tlb_size);
>  void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>  void pmp_update_rule_nums(CPURISCVState *env);
> +uint32_t pmp_get_num_rules(CPURISCVState *env);
>
>  #endif
> --
> 2.25.1
>
>

