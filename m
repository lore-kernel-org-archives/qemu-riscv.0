Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nziQi-0003dP-6D
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jun 2022 13:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nziQe-0003d7-Gu
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 13:28:12 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nziQa-0002Hs-2q
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 13:28:09 -0400
Received: by mail-wr1-x42b.google.com with SMTP id o16so3679987wra.4
 for <qemu-riscv@nongnu.org>; Fri, 10 Jun 2022 10:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fLFYo+xTMbEr3j+Z6mFEOzuhLPJVbsNAE+aOQpP1BNM=;
 b=EiSutmWWEeIfczsVdYNkVE5aXkOrqahSJB42Ukc/9avgzAdYtoR7mHsbsBGoJOkNe2
 YGUfKeQO8oufFNQMu56Pr8bwqmPBnJzCGj4qLLct930FZtqasO7nedQ2RoJ+08/ZOvy6
 CMeEEswk6NxDJS9g1ny5FD+ksE+pa+g+aN+11Y8Me66ysGC/3FTMsPJy/nuwXDQJlfbD
 ZDOxO3ECsg8w+pfNqjfBiohxc44TIrIuhCDhk+lpN5+fGoLBywokyaducZm9Ynjyo4z5
 /u+t0w77gK8f9019OwoMhwkEI4lnjC39i9wkgP5D7PT320BDOXULp3PdeVVpyOj/5JXH
 qTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fLFYo+xTMbEr3j+Z6mFEOzuhLPJVbsNAE+aOQpP1BNM=;
 b=MNEQ2jesH7KwNQGlDo0Bg9KkxI0lylXCylXtYZjAaaUn9wyNeg7C/wemVLzo/Y6by1
 Msy1ZBiWmC1Ho/hMiYCKG+tJdStRbKcDBZ2snEYEGQEoptbwCqBZKmVvuPLpiThZiJ3D
 Pnw44BkIiLOzw6+LCmRy0yC2PakcJean4Mpj9FV+XP6UO6nof7dL0tvmP//4vf+KvBrR
 bBAr9e54PJnkzoeORK0YlejKOO7u0b0B+Xfl6i0l0OUgrNg72NMvYhZJDdigljs31yRp
 5omMFHQXT6CBemHq8UKJ+0S+3My3re4O4AOzkWjuQ72zfb5r8X1ZwJEVHKHfXoSedRJc
 phaA==
X-Gm-Message-State: AOAM531ITEayAmsk/x+WiyHRA/pEEFBQzqNeI4wUfq1rXqHMC0zzOcZ3
 6r9Obd62THdvJV7sj/B8PmIGYjKCcMs2Akn2LvK6SA==
X-Google-Smtp-Source: ABdhPJzzFKdWxxakEc/JB62QCmW3tGzHXMgw1rD74QZLNCEOHptdpJR5FBgR/K5aYF5nPjGOhTjN8DhKW1ISbKQaaVs=
X-Received: by 2002:a5d:6384:0:b0:210:5f39:53af with SMTP id
 p4-20020a5d6384000000b002105f3953afmr43343910wru.346.1654882086248; Fri, 10
 Jun 2022 10:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220609033011.752714-4-apatel@ventanamicro.com>
 <OSZP286MB1435EBB271F8E9EEF5E2EF95C6A69@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
 <CAAhSdy1zyiV9PgDCY+4ijrzfeAdJ44wfT0b5dY+NqXzieZo_KQ@mail.gmail.com>
 <TYYP286MB1439D28F79FE7CE82885DB9DC6A69@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYYP286MB1439D28F79FE7CE82885DB9DC6A69@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 10 Jun 2022 22:57:53 +0530
Message-ID: <CAAhSdy1-0aU2dMPe0WW=re_QXionheQzpfC-kcfOjOPZNn5EoA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
To: dramforever <dramforever@live.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::42b;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 10 Jun 2022 17:28:12 -0000

On Fri, Jun 10, 2022 at 5:20 PM dramforever <dramforever@live.com> wrote:
>
> >
> >> In addition, the various V-extension vector load/store instructions do not have
> >> defined transformations, so they should show up in [m|h]tinst as all zeros.
> > Okay, I will update.
> Just a clarification/suggestion: It might be easier to only write non-zero for
> instructions with currently defined transformation. Writing zero is always
> legal, but writing an undefined transformed instruction is not.
> >>> @@ -1355,18 +1558,31 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >>>      if (!async) {
> >>>          /* set tval to badaddr for traps with address information */
> >>>          switch (cause) {
> >>> -        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> >>>          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
> >>>          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
> >>> -        case RISCV_EXCP_INST_ADDR_MIS:
> >>> -        case RISCV_EXCP_INST_ACCESS_FAULT:
> >>>          case RISCV_EXCP_LOAD_ADDR_MIS:
> >>>          case RISCV_EXCP_STORE_AMO_ADDR_MIS:
> >>>          case RISCV_EXCP_LOAD_ACCESS_FAULT:
> >>>          case RISCV_EXCP_STORE_AMO_ACCESS_FAULT:
> >>> -        case RISCV_EXCP_INST_PAGE_FAULT:
> >>>          case RISCV_EXCP_LOAD_PAGE_FAULT:
> >>>          case RISCV_EXCP_STORE_PAGE_FAULT:
> >>> +            write_gva = env->two_stage_lookup;
> >>> +            tval = env->badaddr;
> >>> +            if (env->two_stage_indirect_lookup) {
> >>> +                /*
> >>> +                 * special pseudoinstruction for G-stage fault taken while
> >>> +                 * doing VS-stage page table walk.
> >>> +                 */
> >>> +                tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
> >>> +            } else {
> >>> +                /* transformed instruction for all other load/store faults */
> >>> +                tinst = riscv_transformed_insn(env, env->bins);
> >>> +            }
> >>> +            break;
> >>> +        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> >>> +        case RISCV_EXCP_INST_ADDR_MIS:
> >>> +        case RISCV_EXCP_INST_ACCESS_FAULT:
> >>> +        case RISCV_EXCP_INST_PAGE_FAULT:
> >>>              write_gva = env->two_stage_lookup;
> >>>              tval = env->badaddr;
> >>>              break;
> >> Instruction guest-page faults should set [m|h]tinst to one of the
> >> pseudoinstructions if env->two_stage_lookup is true. Otherwise it should set
> >> [m|h]tinst to zero.
> >>
> >> In any case, as this seems to be one of the first implementations of
> >> [m|h]tinst, it might be worthwhile to confirm with the spec authors and clarify
> >> any unclear bits before this gets released.
> > This is already handled because tinst is initialized to zero.
>
> If an instruction guest-page fault occurs due to a G-stage fault while doing
> VS-stage page table walk, i.e. env->two_stage_indirect_lookup is true (I had
> mistakenly wrote env->two_stage_lookup earlier), and the faulting guest
> physical address (env->guest_phys_fault_addr) is written to mtval2/htval,
> [m|h]tinst must be a pseudoinstruction and not zero. This case is not handled
> in the v5 patch.

The v5 patch is writing pseudoinstruction in [m|h]tinst when
env->two_stage_indirect_lookup is true.

Regards,
Anup

