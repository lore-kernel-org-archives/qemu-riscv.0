Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNmCE-00073G-C6
	for mharc-qemu-riscv@gnu.org; Wed, 30 Sep 2020 20:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kNmCC-0006zF-6W; Wed, 30 Sep 2020 20:11:40 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:45655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kNmCA-0007Nm-F7; Wed, 30 Sep 2020 20:11:39 -0400
Received: by mail-io1-xd43.google.com with SMTP id y74so4626082iof.12;
 Wed, 30 Sep 2020 17:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ltOTc556RBt4jaX9hvbCi56xw/ZS5a78LIlu62T3V30=;
 b=d8tSKMM3wyfOUk2af1bL19XEMEXwUSnsfmkqT2guYmeMtwfNcaG6hduEVY4D0N9vqS
 oFjCcXaROptoqKEmvabOCRsdDzkWfLPwWV9dr29cxIPs97xB0zuxUSEkKqAaaGCihh8A
 fmaRs3LTbhjZ2TqzgsDXvSJLKtbns2Lkx0ijbTuv6OzMB22aOEKGaxyGkJZNmRC24/IR
 ejO9Xq3dEeXLi6vGmHFGv6argjckbxiOQUtZGMoufDlnsF3cahv24eXrZ1trSfVYe8UW
 tPp69p8HHSzvj4D3Xj91yf/CKRXiNGWpKS57uJLrxweTpWEBTir7lnrWtVue6xuI0jh6
 oGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ltOTc556RBt4jaX9hvbCi56xw/ZS5a78LIlu62T3V30=;
 b=LsD+1JKMak+dN6DNEUVDE3jTmkVyVe1/6/dGItejwhbITnI907+HCSQPA+2XOJIG4G
 mMlHDfdZtnW9WOC5A1GEWq0DDxOQ4a8U5XCNZ0nt6jCwz+8I2GxzvksykXkIZOjv3Nyn
 b4L/10nmjPKcq7ts2VC3e59FZPsDxzTNpYGqxmZiFK2eziqChxq6/aJKvxiyO0VvLmjV
 L1hRThbAV1oq76SdDKW+VsGHUfmESzrx9Kw6wqcMQG4LlWi+NeAtOq1Cf2KaLkjFnF8D
 B//FYtRQHSDfEmPhsGAOJojjF5BTULSFqx0/wKW1Ck+E1/FQcejNvVxBnEhskfoGCGBZ
 5jAQ==
X-Gm-Message-State: AOAM533l0mAOdwF1X4dnU+CbicfrpYMoP7Ao4e1JFyvTRiKTh2Uu2Dcz
 rFvktzW7sThYscnqNiT3vd199R9jN8C4SX1JsEs=
X-Google-Smtp-Source: ABdhPJwY1iKvTpZ+si8qFD/Ci5BnUPqY8FDmk3dIQ+BlZqZDrDLzgn7u9igcfPdoNN8rvEYXMYAi3cmJRA9/4n7b2lc=
X-Received: by 2002:a05:6602:15c5:: with SMTP id
 f5mr3567890iow.42.1601511096932; 
 Wed, 30 Sep 2020 17:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200824084158.1769-1-jiangyifei@huawei.com>
 <CAKmqyKOAAzhBqosJCFq9ww0T44EUZV1zqG+T1UPYAuebYbR1KQ@mail.gmail.com>
 <c1273b7d24f5488c845d81153e495b69@huawei.com>
In-Reply-To: <c1273b7d24f5488c845d81153e495b69@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 30 Sep 2020 17:00:14 -0700
Message-ID: <CAKmqyKO4w9WhMwCOE0A7WrA+QOxmO7=hVuzmDYBu3sYHLQOppA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: raise exception to HS-mode at
 get_physical_address
To: Jiangyifei <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, yinyipeng <yinyipeng1@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Wubin (H)" <wu.wubin@huawei.com>, 
 "dengkai (A)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
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
X-List-Received-Date: Thu, 01 Oct 2020 00:11:40 -0000

On Sun, Sep 27, 2020 at 12:54 AM Jiangyifei <jiangyifei@huawei.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Alistair Francis [mailto:alistair23@gmail.com]
> > Sent: Saturday, September 26, 2020 6:24 AM
> > To: Jiangyifei <jiangyifei@huawei.com>
> > Cc: qemu-devel@nongnu.org Developers <qemu-devel@nongnu.org>; open
> > list:RISC-V <qemu-riscv@nongnu.org>; Zhanghailiang
> > <zhang.zhanghailiang@huawei.com>; Sagar Karandikar
> > <sagark@eecs.berkeley.edu>; Bastian Koppelmann
> > <kbastian@mail.uni-paderborn.de>; Zhangxiaofeng (F)
> > <victor.zhangxiaofeng@huawei.com>; Alistair Francis
> > <Alistair.Francis@wdc.com>; yinyipeng <yinyipeng1@huawei.com>; Palmer
> > Dabbelt <palmer@dabbelt.com>; Wubin (H) <wu.wubin@huawei.com>;
> > dengkai (A) <dengkai1@huawei.com>
> > Subject: Re: [PATCH] target/riscv: raise exception to HS-mode at
> > get_physical_address
> >
> > On Mon, Aug 24, 2020 at 1:43 AM Yifei Jiang <jiangyifei@huawei.com> wrote:
> > >
> > > VS-stage translation at get_physical_address needs to translate pte
> > > address by G-stage translation. But the G-stage translation error can
> > > not be distinguished from VS-stage translation error in
> > > riscv_cpu_tlb_fill. On migration, destination needs to rebuild pte,
> > > and this G-stage translation error must be handled by HS-mode. So
> > > introduce TRANSLATE_STAGE2_FAIL so that riscv_cpu_tlb_fill could
> > > distinguish and raise it to HS-mode.
> > >
> > > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > > Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> >
> > Thanks for the patch!
> >
> > Sorry for the delay here.
> >
> > > ---
> > >  target/riscv/cpu.h        |  1 +
> > >  target/riscv/cpu_helper.c | 12 ++++++++++--
> > >  2 files changed, 11 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h index
> > > a804a5d0ba..8b3b368d6a 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -85,6 +85,7 @@ enum {
> > >  #define TRANSLATE_FAIL 1
> > >  #define TRANSLATE_SUCCESS 0
> > >  #define MMU_USER_IDX 3
> > > +#define TRANSLATE_G_STAGE_FAIL 4
> > >
> > >  #define MAX_RISCV_PMPS (16)
> > >
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index fd1d373b6f..1635b09c41 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -440,7 +440,10 @@ restart:
> > >                                                   mmu_idx,
> > false,
> > > true);
> > >
> > >              if (vbase_ret != TRANSLATE_SUCCESS) {
> > > -                return vbase_ret;
> > > +                env->guest_phys_fault_addr = (base |
> > > +                                              (addr &
> > > +
> > (TARGET_PAGE_SIZE -
> > > + 1))) >> 2;
> >
> > Can we set guest_phys_fault_addr in riscv_cpu_tlb_fill() instead?
>
> Hi Alistair,
>
> It's not easy to do that. The key is that the wrong address(the `base` variable) is not visible to riscv_cpu_tlb_fill().
> Because the wrong address may be from any level of PTE which can't be easily obtained by riscv_cpu_tlb_fill().
> The alternative is to add an out parameter in get_physical_address(). But it is not either elegant.
> What is your advice?

You are right. Good call.

In which case this looks like the right way to do this. Can you add a
small comment in riscv_cpu_tlb_fill() to indicate that
guest_phys_fault_addr has already been set when handling the error?
The TLB filling code is pretty complex so the more documentation the
better.

Alistair

>
> Best Regards,
> Yifei
>
> >
> > > +                return TRANSLATE_G_STAGE_FAIL;
> > >              }
> > >
> > >              pte_addr = vbase + idx * ptesize; @@ -728,12 +731,17 @@
> > > bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> > >          ret = get_physical_address(env, &pa, &prot, address,
> > access_type,
> > >                                     mmu_idx, true, true);
> > >
> > > +        if (ret == TRANSLATE_G_STAGE_FAIL) {
> > > +            first_stage_error = false;
> > > +            access_type = MMU_DATA_LOAD;
> > > +        }
> > > +
> > >          qemu_log_mask(CPU_LOG_MMU,
> > >                        "%s 1st-stage address=%" VADDR_PRIx "
> > ret %d physical "
> > >                        TARGET_FMT_plx " prot %d\n",
> > >                        __func__, address, ret, pa, prot);
> > >
> > > -        if (ret != TRANSLATE_FAIL) {
> > > +        if (ret != TRANSLATE_FAIL && ret != TRANSLATE_G_STAGE_FAIL) {
> >
> > Otherwise this patch looks correct.
> >
> > Alistair
> >
> > >              /* Second stage lookup */
> > >              im_address = pa;
> > >
> > > --
> > > 2.19.1
> > >
> > >
> > >

