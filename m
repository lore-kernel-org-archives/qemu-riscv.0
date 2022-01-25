Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCHNq-00047P-UD
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jan 2022 03:40:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1nCHNo-00042J-Th; Tue, 25 Jan 2022 03:40:57 -0500
Received: from [2604:1380:4601:e00::1] (port=58988 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1nCHNk-0005o9-5K; Tue, 25 Jan 2022 03:40:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83D36B816AC;
 Tue, 25 Jan 2022 08:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366D7C340E8;
 Tue, 25 Jan 2022 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643100044;
 bh=RvyyTV1mjeLOVQtSvBpW/K8G6qrd01tVeGM3YDZviSc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rBX1aY+mLO4N4tOcmu95c7Mnj7dWAUKtjAY9YZRg5NxfZ4TJmAYMrgXEtWTI/FXt4
 unFBJYzVdbyUHaGVkCgtjFeKMiPEjf8EBOfGgwBILkvTS1Op9PYLO6xFKq4chhzlRC
 zoshWKvQiAAwhPY2JKLKxa9pWF6rd3baAMz6ddeQLEn6yBjY6ReSAVGeefUdbM2lUw
 +27XoXVPuLRe9eHIxpQM7xhgaEnSVh6Y2MvXjiUbOCq+jUSiR3n1YMXoa+A/mcMSFx
 IIS6OUv2q6MS5ElKMiaxQvxPSYWS8G5B7H6nw8CI2OEnkheRyTPpXDSIbFVQL+tc+8
 f7z19HgpFagbw==
Received: by mail-vk1-f177.google.com with SMTP id w17so7778517vko.9;
 Tue, 25 Jan 2022 00:40:44 -0800 (PST)
X-Gm-Message-State: AOAM532uAc6Ouj6hNgzEJvYLF9rzK8wDfAvL4ouOwjyddnBoGpchdddG
 3aIdIb0lhn08g/Aif+jm4uIgi+d0XstzYfv9aGA=
X-Google-Smtp-Source: ABdhPJw4o28sdW3VACgcAVB3u7wH5fvLmB0XH0EVoibJwmN5SR8DTwOXcg00M4mjcCV1Mgy7k8PuDc7QeCRIPdA/41A=
X-Received: by 2002:a05:6122:787:: with SMTP id
 k7mr4616901vkr.28.1643100043236; 
 Tue, 25 Jan 2022 00:40:43 -0800 (PST)
MIME-Version: 1.0
References: <20220125064536.7869-1-liweiwei@iscas.ac.cn>
 <20220125064536.7869-2-liweiwei@iscas.ac.cn>
 <0a70c29c-0d59-24bb-73a8-652e26761d48@c-sky.com>
In-Reply-To: <0a70c29c-0d59-24bb-73a8-652e26761d48@c-sky.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 25 Jan 2022 16:40:32 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQT619yKoeFdH8-qaCmuQxSn9qar02SUTLO44gi=QmSsA@mail.gmail.com>
Message-ID: <CAJF2gTQT619yKoeFdH8-qaCmuQxSn9qar02SUTLO44gi=QmSsA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>, Anup Patel <anup@brainfault.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Ren Guo <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4601:e00::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=guoren@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 25 Jan 2022 08:40:57 -0000

On Tue, Jan 25, 2022 at 4:34 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2022/1/25 14:45, Weiwei Li wrote:
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> > need to ignore them. They cannot be a part of ppn.
> >
> > 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
> >     4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> >     4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> >
> > 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
> >
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > Cc: Liu Zhiwei <zhiwei_liu@c-sky.com>
> > Cc: Bin Meng <bmeng.cn@gmail.com>
> > Cc: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >   target/riscv/cpu.h        | 13 +++++++++++++
> >   target/riscv/cpu_bits.h   |  7 +++++++
> >   target/riscv/cpu_helper.c | 14 +++++++++++++-
> >   3 files changed, 33 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 55635d68d5..45de8faaca 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -341,6 +341,8 @@ struct RISCVCPU {
> >           bool ext_counters;
> >           bool ext_ifencei;
> >           bool ext_icsr;
> > +        bool ext_svnapot;
> > +        bool ext_svpbmt;
> >           bool ext_zfh;
> >           bool ext_zfhmin;
> >           bool ext_zve32f;
> > @@ -495,6 +497,17 @@ static inline int riscv_cpu_xlen(CPURISCVState *env)
> >       return 16 << env->xl;
> >   }
> >
> > +#ifndef CONFIG_USER_ONLY
> > +#ifdef TARGET_RISCV32
> > +#define riscv_cpu_sxl(env)  ((void)(env), MXL_RV32)
> > +#else
> > +static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
> > +{
> > +    return get_field(env->mstatus, MSTATUS64_SXL);
> > +}
> > +#endif
> > +#endif
> > +
>
> Perhaps an interface also works for user mode is better.
>
> +#ifdef TARGET_RISCV32
> +#define riscv_cpu_sxl(env)  ((void)(env), MXL_RV32)
> +#else
> +static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    return env->misa_mxl;
> +#else
> +    return get_field(env->mstatus, MSTATUS64_SXL);
> +#endif
> +}
> +#endif
> +
>
> >   /*
> >    * Encode LMUL to lmul as follows:
> >    *     LMUL    vlmul    lmul
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 7c87433645..37b622fbfa 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -493,6 +493,13 @@ typedef enum {
> >   /* Page table PPN shift amount */
> >   #define PTE_PPN_SHIFT       10
> >
> > +/* Page table PPN mask */
> > +#if defined(TARGET_RISCV32)
> > +#define PTE_PPN_MASK        0xFFFFFC00UL
> > +#elif defined(TARGET_RISCV64)
> > +#define PTE_PPN_MASK        0x3FFFFFFFFFFC00ULL
> > +#endif
> > +
>
> No need to define PTE_PPN_MASK for TARGET_RISCV32.

ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;

pte is target_ulong, so types are different.

TARGET_RISCV32: is 32bit.
TARGET_RISCV64: is 64bit.

>
> >   /* Leaf page shift amount */
> >   #define PGSHIFT             12
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 327a2c4f1d..2a921bedfd 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -622,7 +622,19 @@ restart:
> >               return TRANSLATE_FAIL;
> >           }
> >
> > -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> > +        hwaddr ppn;
> > +        RISCVCPU *cpu = env_archcpu(env);
> > +
> > +        if (riscv_cpu_sxl(env) == MXL_RV32) {
> > +            ppn = pte >> PTE_PPN_SHIFT;
> > +        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
> > +            ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> > +        } else {
> > +            ppn = pte >> PTE_PPN_SHIFT;
> > +            if ((pte & ~PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
> > +                return TRANSLATE_FAIL;
> > +            }
> > +        }
> >
> >           if (!(pte & PTE_V)) {
> >               /* Invalid PTE */
>
> Otherwise,
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Thanks,
> Zhiwei
>
>
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

