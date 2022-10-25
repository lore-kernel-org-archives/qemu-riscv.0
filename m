Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1on9Y8-0001z9-JN
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 22:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1on9Y7-0001yx-TL; Mon, 24 Oct 2022 22:20:15 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1on9Y6-00041m-0O; Mon, 24 Oct 2022 22:20:15 -0400
Received: by mail-pg1-x530.google.com with SMTP id q71so10262517pgq.8;
 Mon, 24 Oct 2022 19:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uv/wE81/zWTfnFs2ZgkIgNycUuOUxvgfJh+AfaDNfFo=;
 b=jW4OVkCvxm3TSM1u2fZFAAWPxE1pftmrqnGGx9CLIqjvzMu9RfMqVFmBFj0lNhIK0H
 Ph0DM/jGQ2e60k2ddvUfkWfDIwP5MfaKjTz4BFs+n7XvaD/dvMMIt5w05aAViq+icx32
 r/DpVgAEZv9PDQedvqip/h+gnzqTdyOWRY5i5L88h/W6D2pEQb+8UtkntFQn8xzDtju3
 wqKxXayCn8ehEzA6iNBx/S6cF0Fz8YWfwvsIltO9I2QonDzr7aGbUYeXqVDgH0/4001+
 q+p/dZVOEJN9uKRjUDR1IlKZTGmyvYh0dl8B1bGMzqroZ090ZqpUmwsoTkMO2Ybgta0W
 ysUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uv/wE81/zWTfnFs2ZgkIgNycUuOUxvgfJh+AfaDNfFo=;
 b=k/xpBtuKlbOOboafKFxBLoxHMtef5lCweHrjnKapwCwq/Mym0+Rbf4azC6dJEYLsWs
 fptzsdIuDZSOjTsSAuwqsp+3Ffa5N7y6RjNWHN2IWHihsbhK02aVL6yGg8oOtc44dAS1
 RtwzbPQ4W39UQysKb4DG91/Fp88gP6cpZZZ9qNPzSyIdxsd2uU6AwSwFa0Yn+KJnntZM
 xAIOKJGV0Cs8JIhmMIkQnS7EkCmky1tZjnNVco+x54Im0L3QgWBV/M12HwdWUuHGiHSX
 hPbZK2MZS7cfjI7qvwMgl/anJ7NTlY8a4gmfAz3DhdwUrKylpQQVW/upAju/idOmoPNy
 /izg==
X-Gm-Message-State: ACrzQf14hkFO5q/ngDn1hI6UiQUO1HQU6YPOB7D4792G1qWpK8SHsTuA
 SUdyp63uo21yjmE8hn/7qDs2/KcGaayQC7jZ7gQ=
X-Google-Smtp-Source: AMsMyM4LxXsYSj3Rzu5Q1B6J+eiCjP2UCz3r+WoQL369B9kTBSM6mOMSuwk00jyBauPUp5njorTT8ZarbZ3LaMjhYKs=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr30608055pgi.406.1666664411977; Mon, 24
 Oct 2022 19:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220909152258.2568942-1-leon@is.currently.online>
 <CAKmqyKMfZXarM1g8PdhAqcgZzDyq6RY3R94cYhOo80WXiCv5aA@mail.gmail.com>
 <8735bjqz8f.fsf@silicon.host.schuermann.io>
In-Reply-To: <8735bjqz8f.fsf@silicon.host.schuermann.io>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Oct 2022 12:19:35 +1000
Message-ID: <CAKmqyKO7=LS9JbMyCKg3C5U3-vNJiQTEDR59atwMGoCSpF3C2g@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/pmp: fix non-translated page size address
 checks w/ MPU
To: Leon Schuermann <leon@is.currently.online>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Tue, 25 Oct 2022 02:20:16 -0000

On Thu, Oct 20, 2022 at 7:29 AM Leon Schuermann
<leon@is.currently.online> wrote:
>
> Alistair Francis <alistair23@gmail.com> writes:
> >> @@ -310,10 +311,17 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> >>      }
> >>
> >>      if (size == 0) {
> >> -        if (riscv_feature(env, RISCV_FEATURE_MMU)) {
> >> +        if (riscv_cpu_mxl(env) == MXL_RV32) {
> >> +            satp_mode = SATP32_MODE;
> >> +        } else {
> >> +            satp_mode = SATP64_MODE;
> >> +        }
> >> +
> >> +        if (riscv_feature(env, RISCV_FEATURE_MMU)
> >> +            && get_field(env->satp, satp_mode)) {
> >>              /*
> >> -             * If size is unknown (0), assume that all bytes
> >> -             * from addr to the end of the page will be accessed.
> >> +             * If size is unknown (0) and virtual memory is enabled, assume that
> >> +             * all bytes from addr to the end of the page will be accessed.
> >>               */
> >>              pmp_size = -(addr | TARGET_PAGE_MASK);
> >
> > I'm not sure if we need this at all.
> >
> > This function is only called from get_physical_address_pmp() which
> > then calculates the maximum size using pmp_is_range_in_tlb().
>
> I'm by no means an expert on QEMU and the TCG, so I've spun up GDB to
> trace down why exactly this function is called with a `size = 0`
> argument. It seems that there are, generally, two code paths to this
> function for instruction fetching:
>
> 1. From `get_page_addr_code`: this will invoke `tlb_fill` with
>    `size = 0` to check whether an entire page is accessible and can be
>    translated given the current MMU / PMP configuration. In my
>    particular example, it may rightfully fail then. `get_page_addr_code`
>    can handle this and will subsequently cause an MMU protection check
>    to be run for each instruction translated.
>
> 2. From `riscv_tr_translate_insn` through `cpu_lduw_code`, which will
>    execute `tlb_fill` with `size = 2` (to try and decode a compressed
>    instruction), assuming that the above check failed.
>
> So far, so good. In this context, it actually makes sense for
> `pmp_hart_has_privs` to interpret `size = 0` to mean whether the entire
> page is allowed to be accessed.
>
> > I suspect that we could just use sizeof(target_ulong) as the fallback
> > for every time size == 0. Then pmp_is_range_in_tlb() will set the
> > tlb_size to the maximum possible size of the PMP region.
>
> Given the above, I don't think that this is correct either. The PMP
> check would pass even for non-page sized regions, but the entire page
> would be accessible through the TCG's TLB, as a consequence of
> `get_page_addr_code`.

If we pass a size smaller than the page, it won't be cached in the
TLB, so that should be ok.

A few PMP improvements have gone into
https://github.com/alistair23/qemu/tree/riscv-to-apply.next. It might
be worth checking to see if that fixes the issue you are seeing.
Otherwise I think defaulting to the xlen should be ok.

Alistair

>
>
> In the current implementation, `get_page_addr_code_hostp` calls
> `tlb_fill`, which in turn invokes the RISC-V TCG op `tlb_fill` with the
> parameter `probe = false`. This in turn raises a PMP exception in the
> CPU, whereas `get_page_addr_code` would seem to expect this a failing
> `tlb_fill` to be side-effect free, such that the MMU protection checks
> can be re-run per instruction in the TCG code generation phase.
>
> I think that this is sufficient evidence to conclude that my initial
> patch is actually incorrect, however I am unsure as to how this issue
> can be solved proper. One approach which seems to work is to change
> `get_page_addr_code_hostp` to use a non-faulting page-table read
> instead:
>
> @@ -1510,11 +1510,15 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
>      uintptr_t mmu_idx = cpu_mmu_index(env, true);
>      uintptr_t index = tlb_index(env, mmu_idx, addr);
>      CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
> +    CPUState *cs = env_cpu(env);
> +    CPUClass *cc = CPU_GET_CLASS(cs);
>      void *p;
>
>      if (unlikely(!tlb_hit(entry->addr_code, addr))) {
>          if (!VICTIM_TLB_HIT(addr_code, addr)) {
> -            tlb_fill(env_cpu(env), addr, 0, MMU_INST_FETCH, mmu_idx, 0);
> +            // Nonfaulting page-table read:
> +            cc->tcg_ops->tlb_fill(cs, addr, 0, MMU_INST_FETCH, mmu_idx, true,
> +                                  0);
>              index = tlb_index(env, mmu_idx, addr);
>              entry = tlb_entry(env, mmu_idx, addr);
>
>
> However, given this touches the generic TCG implementation, I cannot
> judge whether this is correct or has any unintended side effects for
> other targets. If this is correct, I'd be happy to send a proper patch.
>
> -Leon

