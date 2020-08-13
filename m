Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6Eub-0005uh-DZ
	for mharc-qemu-riscv@gnu.org; Thu, 13 Aug 2020 11:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k6EuZ-0005tv-W2; Thu, 13 Aug 2020 11:13:00 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:35729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k6EuY-0008BU-2j; Thu, 13 Aug 2020 11:12:59 -0400
Received: by mail-io1-xd44.google.com with SMTP id s189so7700777iod.2;
 Thu, 13 Aug 2020 08:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1PdrcMnk2+pLeGKf0LWQajnn+/kzAc69gaI14XWu8gg=;
 b=hTe7y/qirvDWOrlxKSfn/qoQrz0ffqv79Z1REpQaUAi9ya7aZViRkOBxmKwWEDMPPW
 N+c3hczdyhsnAGbmaAH3xhJYVlCcoFO0nJTK22IAXvfL+SuSdEDqYxKOX5FNicCJR1b9
 TcpnekLAucxLBM5GwsY8qZc5JK6csgOXzNBoC0TdxL8cI3AfE74e8y3S34Y3hZyW1e9p
 e8CrQi/gGLiYNaS0+UjYLtIWMKrJ0IZTN4sVbeKTiiAfPlZk3+FXVtNTf7ZoDy7dGLIu
 W4B4xavyouk3NKV+l5kbQdBvIR5Pr9uMLPmGKAOmfolc/TQK/+jYRONiJbL5HLEAUwD8
 SzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1PdrcMnk2+pLeGKf0LWQajnn+/kzAc69gaI14XWu8gg=;
 b=AFDL4NRrrJqdeo6WDIMgyAO2fLLMVb94hgxIj3n9U+nXFVUxzV14nlez4jLbK7aq0i
 tcN/CW3zyKd4zkrli4cgIpI8EGEDop6DJMC73Jy86RDviQPJuWFh2/dD+PMsfjuldUYA
 Z1kIYMfN/7vj2a4tIYmE7057rCVq4OyleaNEX+M8DCPcOuUbsEGTeAk5d2Oc4DfsXi24
 Co4ujLkixNUpdOk6BvV72iYGNW2TaBex9oUW1y5Mcez2YGY5LZSEeGMPPgY3MVobFflV
 GVbuxmWWpiWqzXl2+VwppYEsWcLUBZh7vdE+aXDeiNSAOIlXjyU/9KTz0yuOMvRyCf7E
 IdNw==
X-Gm-Message-State: AOAM533hKnk7cD98LEI7lUZrR/eXZJL3tXv2jDaMhbCsy1JPuMbrbLng
 pi8oYASnQs456zdNmPZZLnkl238CQacv8yppYyU=
X-Google-Smtp-Source: ABdhPJyYPam26j1mJJRtHlD6rxFg5LF0JoStb6V46GR8sfYhcWDAeW0whRXyVUHxjQ2+2yPjfHl5XSpUfUl8CVKhZoM=
X-Received: by 2002:a05:6638:248e:: with SMTP id
 x14mr5416401jat.135.1597331576450; 
 Thu, 13 Aug 2020 08:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595924470.git.zong.li@sifive.com>
 <6b0bf48662ef26ab4c15381a08e78a74ebd7ca79.1595924470.git.zong.li@sifive.com>
 <CAKmqyKNso-cTYuwxo5waxp9n8ifV2GR9v=x6aM-y0NjQTSsw+A@mail.gmail.com>
 <CANXhq0obkQ4MpbyaT6VZ_9SXmNkTixX3+4RrK=5m+gF2nyhZOA@mail.gmail.com>
In-Reply-To: <CANXhq0obkQ4MpbyaT6VZ_9SXmNkTixX3+4RrK=5m+gF2nyhZOA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 Aug 2020 08:02:29 -0700
Message-ID: <CAKmqyKOSVS-AUHEj8=84o58NoWP4tmNWJ5Gq_UNUEKSXsvtwrQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] target/riscv: Change the TLB page size depends on
 PMP entries.
To: Zong Li <zong.li@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 13 Aug 2020 15:13:00 -0000

On Wed, Aug 12, 2020 at 8:04 PM Zong Li <zong.li@sifive.com> wrote:
>
> On Wed, Aug 12, 2020 at 11:21 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, Jul 28, 2020 at 1:29 AM Zong Li <zong.li@sifive.com> wrote:
> > >
> > > The minimum granularity of PMP is 4 bytes, it is small than 4KB page
> > > size, therefore, the pmp checking would be ignored if its range doesn't
> > > start from the alignment of one page. This patch detects the pmp entries
> > > and sets the small page size to TLB if there is a PMP entry which cover
> > > the page size.
> > >
> > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > ---
> > >  target/riscv/cpu_helper.c | 10 ++++++--
> > >  target/riscv/pmp.c        | 52 +++++++++++++++++++++++++++++++++++++++
> > >  target/riscv/pmp.h        |  2 ++
> > >  3 files changed, 62 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index 2f337e418c..fd1d373b6f 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -693,6 +693,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> > >      bool first_stage_error = true;
> > >      int ret = TRANSLATE_FAIL;
> > >      int mode = mmu_idx;
> > > +    target_ulong tlb_size = 0;
> > >
> > >      env->guest_phys_fault_addr = 0;
> > >
> > > @@ -784,8 +785,13 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> > >      }
> > >
> > >      if (ret == TRANSLATE_SUCCESS) {
> > > -        tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
> > > -                     prot, mmu_idx, TARGET_PAGE_SIZE);
> > > +        if (pmp_is_range_in_tlb(env, pa & TARGET_PAGE_MASK, &tlb_size)) {
> > > +            tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
> > > +                         prot, mmu_idx, tlb_size);
> > > +        } else {
> > > +            tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
> > > +                         prot, mmu_idx, TARGET_PAGE_SIZE);
> > > +        }
> > >          return true;
> > >      } else if (probe) {
> > >          return false;
> > > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > > index aeba796484..adadf6e9ba 100644
> > > --- a/target/riscv/pmp.c
> > > +++ b/target/riscv/pmp.c
> > > @@ -393,3 +393,55 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
> > >
> > >      return val;
> > >  }
> > > +
> > > +/*
> > > + * Calculate the TLB size if the start address or the end address of
> > > + * PMP entry is presented in thie TLB page.
> > > + */
> > > +static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
> > > +    target_ulong tlb_sa, target_ulong tlb_ea)
> > > +{
> > > +    target_ulong pmp_sa = env->pmp_state.addr[pmp_index].sa;
> > > +    target_ulong pmp_ea = env->pmp_state.addr[pmp_index].ea;
> > > +
> > > +    if (pmp_sa >= tlb_sa && pmp_ea <= tlb_ea) {
> > > +        return pmp_ea - pmp_sa + 1;
> > > +    }
> > > +
> > > +    if (pmp_sa >= tlb_sa && pmp_sa <= tlb_ea && pmp_ea >= tlb_ea) {
> > > +        return tlb_ea - pmp_sa + 1;
> > > +    }
> > > +
> > > +    if (pmp_ea <= tlb_ea && pmp_ea >= tlb_sa && pmp_sa <= tlb_sa) {
> > > +        return pmp_ea - tlb_sa + 1;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +/*
> > > + * Check is there a PMP entry whcih range covers this page. If so,
> >
> > s/whcih/which/g
> >
> > I fixed this when apply it.
> >
> > > + * try to find the minimum granularity for the TLB size.
> > > + */
> > > +bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
> > > +    target_ulong *tlb_size)
> > > +{
> > > +    int i;
> > > +    target_ulong val;
> > > +    target_ulong tlb_ea = (tlb_sa + TARGET_PAGE_SIZE - 1);
> > > +
> > > +    for (i = 0; i < MAX_RISCV_PMPS; i++) {
> > > +        val = pmp_get_tlb_size(env, i, tlb_sa, tlb_ea);
> > > +        if (val) {
> > > +            if (*tlb_size == 0 || *tlb_size > val) {
> > > +                *tlb_size = val;
> > > +            }
> > > +        }
> > > +    }
> > > +
> > > +    if (*tlb_size != 0) {
> > > +        return true;
> > > +    }
> > > +
> > > +    return false;
> > > +}
> > > diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> > > index 8e19793132..c70f2ea4c4 100644
> > > --- a/target/riscv/pmp.h
> > > +++ b/target/riscv/pmp.h
> > > @@ -60,5 +60,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
> > >  target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
> > >  bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> > >      target_ulong size, pmp_priv_t priv, target_ulong mode);
> > > +bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
> > > +    target_ulong *tlb_size);
> >
> > The indentation is wrong here (as it is in the rest of the file). I
> > just fixed this up as well as the others when I applied it.
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >
> > I have applied patch 3 and 4 of this series. Patch 1 has already been
> > applied and patch 2 no longer applies due to a different fix, sorry
> > about that.
> >
>
> Thanks for your reviewing and applying. I don't follow with you about
> patch 2, could you please also forward the information or the fix to
> me?

This patch fixes the same problem and I find it a little simpler:
https://patchew.org/QEMU/20200812223045.96803-1-alistair.francis@wdc.com/20200812223045.96803-10-alistair.francis@wdc.com/

Alistair

>
> > Alistair
> >
> > >
> > >  #endif
> > > --
> > > 2.27.0
> > >
> > >

