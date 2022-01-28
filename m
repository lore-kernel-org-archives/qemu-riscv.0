Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDINR-00064w-Br
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jan 2022 22:56:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1nDINO-0005vs-IG; Thu, 27 Jan 2022 22:56:43 -0500
Received: from [2604:1380:4601:e00::1] (port=34228 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1nDINL-0003xH-MA; Thu, 27 Jan 2022 22:56:42 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B017AB803F5;
 Fri, 28 Jan 2022 03:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E579C340EA;
 Fri, 28 Jan 2022 03:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643342194;
 bh=U1szvtpWegRHvQSYhTsG8yXFYSI7NcVDgog7QS+USDc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KnS6FK6OWE5Ws8dcmwWWhHCtRpt/iKCwObX+F1dPwxgCbZZrVwww30kLw7fBubCzN
 37uGH7A3ZJ96exLYVdAUmeF+ERnOPztcNunRV+a67MrJnmHrZki4n8BABiBXzIbr82
 xERbJHsaouNuKX3cuWuVPT0E+JgqRzjGY6zbtR0f67t3CyN3WAkwHT8waquHJG4/n3
 acZL747CUTR+5SlG+qTWIG5ID0Y81QjpcpLFVJZxTGAj1Uw1YZHCrD4RkMpyVkUr5A
 uWgQ4gBhWwhiTEAwuxqZpGhg2WsqbiWCxvcnP2cZNwAnok8K/Hg1YIqFp8D1iHd+tT
 //ayKbo5nYwEg==
Received: by mail-ua1-f48.google.com with SMTP id y4so7012523uad.1;
 Thu, 27 Jan 2022 19:56:34 -0800 (PST)
X-Gm-Message-State: AOAM532uUf2BF0dk46zv4rmNyvDVtxtv+kItkQ7iuNRrvzjngN70YyZY
 RVAFr4z6D9OYudYz2/ng/Z9wjkWwP1AJDhjiAKI=
X-Google-Smtp-Source: ABdhPJy5XXu9V/py5zZ4PPhhv/5RO2+C0OGDOtm3/ENf+mLr5Uwndcv7Up6FJWS6QEyrgvSX+DxR6VnpyaEHJRq//gg=
X-Received: by 2002:ab0:2092:: with SMTP id r18mr3285078uak.66.1643342193477; 
 Thu, 27 Jan 2022 19:56:33 -0800 (PST)
MIME-Version: 1.0
References: <20220125064536.7869-1-liweiwei@iscas.ac.cn>
 <20220125064536.7869-2-liweiwei@iscas.ac.cn>
 <0a70c29c-0d59-24bb-73a8-652e26761d48@c-sky.com>
 <CAJF2gTQT619yKoeFdH8-qaCmuQxSn9qar02SUTLO44gi=QmSsA@mail.gmail.com>
 <ef4bf292-d77b-7b59-feaf-c1760c2520af@c-sky.com>
 <CAJF2gTRaLbFUnOK6v4PLa0OrsvO=a3wov+QOdSR3W4PmPGjMBQ@mail.gmail.com>
 <20f17f8b-3997-9b46-f9b1-e559df4da148@iscas.ac.cn>
In-Reply-To: <20f17f8b-3997-9b46-f9b1-e559df4da148@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 28 Jan 2022 11:56:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQSQrEeGaR3TaAMdXeMupdq-YDCYy7ykyeUmsXLfmG5Dg@mail.gmail.com>
Message-ID: <CAJF2gTQSQrEeGaR3TaAMdXeMupdq-YDCYy7ykyeUmsXLfmG5Dg@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Ren Guo <ren_guo@c-sky.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4601:e00::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=guoren@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
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
X-List-Received-Date: Fri, 28 Jan 2022 03:56:43 -0000

On Tue, Jan 25, 2022 at 5:49 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/1/25 =E4=B8=8B=E5=8D=885:00, Guo Ren =E5=86=99=E9=81=93:
> > On Tue, Jan 25, 2022 at 4:54 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote=
:
> >>
> >> On 2022/1/25 16:40, Guo Ren wrote:
> >>> On Tue, Jan 25, 2022 at 4:34 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wro=
te:
> >>>> On 2022/1/25 14:45, Weiwei Li wrote:
> >>>>> From: Guo Ren <ren_guo@c-sky.com>
> >>>>>
> >>>>> Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> >>>>> need to ignore them. They cannot be a part of ppn.
> >>>>>
> >>>>> 1: The RISC-V Instruction Set Manual, Volume II: Privileged Archite=
cture
> >>>>>       4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> >>>>>       4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> >>>>>
> >>>>> 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpb=
mt-diff.pdf
> >>>>>
> >>>>> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> >>>>> Cc: Liu Zhiwei <zhiwei_liu@c-sky.com>
> >>>>> Cc: Bin Meng <bmeng.cn@gmail.com>
> >>>>> Cc: Alistair Francis <alistair.francis@wdc.com>
> >>>>> ---
> >>>>>     target/riscv/cpu.h        | 13 +++++++++++++
> >>>>>     target/riscv/cpu_bits.h   |  7 +++++++
> >>>>>     target/riscv/cpu_helper.c | 14 +++++++++++++-
> >>>>>     3 files changed, 33 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >>>>> index 55635d68d5..45de8faaca 100644
> >>>>> --- a/target/riscv/cpu.h
> >>>>> +++ b/target/riscv/cpu.h
> >>>>> @@ -341,6 +341,8 @@ struct RISCVCPU {
> >>>>>             bool ext_counters;
> >>>>>             bool ext_ifencei;
> >>>>>             bool ext_icsr;
> >>>>> +        bool ext_svnapot;
> >>>>> +        bool ext_svpbmt;
> >>>>>             bool ext_zfh;
> >>>>>             bool ext_zfhmin;
> >>>>>             bool ext_zve32f;
> >>>>> @@ -495,6 +497,17 @@ static inline int riscv_cpu_xlen(CPURISCVState=
 *env)
> >>>>>         return 16 << env->xl;
> >>>>>     }
> >>>>>
> >>>>> +#ifndef CONFIG_USER_ONLY
> >>>>> +#ifdef TARGET_RISCV32
> >>>>> +#define riscv_cpu_sxl(env)  ((void)(env), MXL_RV32)
> >>>>> +#else
> >>>>> +static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
> >>>>> +{
> >>>>> +    return get_field(env->mstatus, MSTATUS64_SXL);
> >>>>> +}
> >>>>> +#endif
> >>>>> +#endif
> >>>>> +
> >>>> Perhaps an interface also works for user mode is better.
> >>>>
> >>>> +#ifdef TARGET_RISCV32
> >>>> +#define riscv_cpu_sxl(env)  ((void)(env), MXL_RV32)
> >>>> +#else
> >>>> +static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
> >>>> +{
> >>>> +#ifdef CONFIG_USER_ONLY
> >>>> +    return env->misa_mxl;
> >>>> +#else
> >>>> +    return get_field(env->mstatus, MSTATUS64_SXL);
> >>>> +#endif
> >>>> +}
> >>>> +#endif
> >>>> +
> >>>>
> >>>>>     /*
> >>>>>      * Encode LMUL to lmul as follows:
> >>>>>      *     LMUL    vlmul    lmul
> >>>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> >>>>> index 7c87433645..37b622fbfa 100644
> >>>>> --- a/target/riscv/cpu_bits.h
> >>>>> +++ b/target/riscv/cpu_bits.h
> >>>>> @@ -493,6 +493,13 @@ typedef enum {
> >>>>>     /* Page table PPN shift amount */
> >>>>>     #define PTE_PPN_SHIFT       10
> >>>>>
> >>>>> +/* Page table PPN mask */
> >>>>> +#if defined(TARGET_RISCV32)
> >>>>> +#define PTE_PPN_MASK        0xFFFFFC00UL
> >>>>> +#elif defined(TARGET_RISCV64)
> >>>>> +#define PTE_PPN_MASK        0x3FFFFFFFFFFC00ULL
> >>>>> +#endif
> >>>>> +
> >>>> No need to define PTE_PPN_MASK for TARGET_RISCV32.
> >>> ppn =3D (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> >>>
> >>> pte is target_ulong, so types are different.
> >>>
> >>> TARGET_RISCV32: is 32bit.
> >>> TARGET_RISCV64: is 64bit.
> >>>
> >> I should make it more clear.  You will not use PTE_PPN_MASK on
> >> TARGET_RISCV32.
> >>>>>     /* Leaf page shift amount */
> >>>>>     #define PGSHIFT             12
> >>>>>
> >>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >>>>> index 327a2c4f1d..2a921bedfd 100644
> >>>>> --- a/target/riscv/cpu_helper.c
> >>>>> +++ b/target/riscv/cpu_helper.c
> >>>>> @@ -622,7 +622,19 @@ restart:
> >>>>>                 return TRANSLATE_FAIL;
> >>>>>             }
> >>>>>
> >>>>> -        hwaddr ppn =3D pte >> PTE_PPN_SHIFT;
> >>>>> +        hwaddr ppn;
> >>>>> +        RISCVCPU *cpu =3D env_archcpu(env);
> >>>>> +
> >>>>> +        if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
> >>>>> +            ppn =3D pte >> PTE_PPN_SHIFT;
> >> TARGET_RISCV32 will always come here. So no need to define PTE_PPN_MAS=
K
> >> for TARGET_RISCV32.
> > Oops, maybe we should use TARGET_LONG_SIZE =3D=3D 4
> >
> > #if TARGET_LONG_SIZE =3D=3D 4
> > typedef int32_t target_long;
> > typedef uint32_t target_ulong;
> > #define TARGET_FMT_lx "%08x"
> > #define TARGET_FMT_ld "%d"
> > #define TARGET_FMT_lu "%u"
> > #elif TARGET_LONG_SIZE =3D=3D 8
> > typedef int64_t target_long;
> > typedef uint64_t target_ulong;
> > #define TARGET_FMT_lx "%016" PRIx64
> > #define TARGET_FMT_ld "%" PRId64
> > #define TARGET_FMT_lu "%" PRIu64
> > #else
> > #error TARGET_LONG_SIZE undefined
> > #endif
> >
> TARGET_LONG_SIZE is related to TARGET_RISCV32 and TARGET_RISCV64.
>
> In RV32, the code will truely not reach there when executing. However the=
 code itself have different types for pte and PTE_PPN_MASK, and may cause c=
ompiler  warning.
>
> So if we only define PTE_PPN_MASK for RV64, maybe we can take type castin=
g here:
>
>    ppn =3D (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;

 (target_ulong)PTE_PPN_MASK seems (u32) 0x3FFFFFFFFFFC00ULL =3D 0xFFFFFC00U=
L

I'm okay with the above.

>
> Regards,
> Weiwei Li
>
> >> Thanks,
> >> Zhiwei
> >>
> >>>>> +        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
> >>>>> +            ppn =3D (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> >>>>> +        } else {
> >>>>> +            ppn =3D pte >> PTE_PPN_SHIFT;
> >>>>> +            if ((pte & ~PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
> >>>>> +                return TRANSLATE_FAIL;
> >>>>> +            }
> >>>>> +        }
> >>>>>
> >>>>>             if (!(pte & PTE_V)) {
> >>>>>                 /* Invalid PTE */
> >>>> Otherwise,
> >>>>
> >>>> Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> >>>>
> >>>> Thanks,
> >>>> Zhiwei
> >>>>
> >>>>
> >>>>
> >
> >
>
>


--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

