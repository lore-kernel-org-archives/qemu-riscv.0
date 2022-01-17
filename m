Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9MIh-000770-3O
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 02:19:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1n9MIL-000740-LW; Mon, 17 Jan 2022 02:19:16 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:48534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1n9MI6-0000ic-8s; Mon, 17 Jan 2022 02:19:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C431FB80DF6;
 Mon, 17 Jan 2022 07:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF81C36AF5;
 Mon, 17 Jan 2022 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642403931;
 bh=wC6cuzoD+mGXxrTJ/7/TOTwSsBUF3MKuyrsJDusOiKw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ibVhGHINF52LuN0CB95cR3EZQtV3MZ1GJDZTvSrZuq00SLWIYmTFYCtTpMzoa4VSC
 1R64UKtU30idR0XaWfG5xdvnbMnzezOkTy439X2Mo5gf+7TLqqWJtR/b1Wb9cjumMy
 d64gja0bgZeMCNJrF7ff3NIMu92q0zkKGUx6kXZt9wsUg43kta4J6oROoAo0LidhVa
 rDXqfdjjFEPcwpy8Hat/L5j5OnvrMrxTcP5BP1PHoDmI2sFYsPpLRiLIEIEahg70JJ
 Jtf6uhfhM83xpd0E7MjyCGC7mHXEk0/CIVwcCK2FuN4H5UbcUsxVMfFE8HXSqVfC18
 v6Gh5VDGUmPDQ==
Received: by mail-vk1-f177.google.com with SMTP id g5so9839659vkg.0;
 Sun, 16 Jan 2022 23:18:51 -0800 (PST)
X-Gm-Message-State: AOAM532fugMv5/RWQj07TRQuRCgCrSjypp9nM6pbYF84jyEzqxB5ykqA
 P0Y8X0naxWoPNID9uiBe6SNCvCFKDaAKoZEvNjk=
X-Google-Smtp-Source: ABdhPJzcZPjL8sDn1EMcl24tIWpRG286vWEe0rhs4iD/nl6EFNpLP/o59mXD2tTu+XEeuPAdZTWKxmwoEPNJZiWBZ6c=
X-Received: by 2002:ac5:cbc8:: with SMTP id h8mr5583130vkn.8.1642403930431;
 Sun, 16 Jan 2022 23:18:50 -0800 (PST)
MIME-Version: 1.0
References: <20220116025925.29973-1-liweiwei@iscas.ac.cn>
 <20220116025925.29973-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20220116025925.29973-5-liweiwei@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 17 Jan 2022 15:18:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTh+L5PX2kAnAMQUeindidpW=tWRhAX_B0HwV4rFzsyBA@mail.gmail.com>
Message-ID: <CAJF2gTTh+L5PX2kAnAMQUeindidpW=tWRhAX_B0HwV4rFzsyBA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] target/riscv: add support for svpbmt extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, bin.meng@windriver.com, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75; envelope-from=guoren@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 17 Jan 2022 07:19:27 -0000

On Sun, Jan 16, 2022 at 11:08 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - add PTE_PBMT bits: It uses two PTE bits, but otherwise has no effect on QEMU, since QEMU is sequentially consistent and doesn't model PMAs currently
> - add PTE_PBMT bits check for inner PTE
> - add reserved bits check for all PTE
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  target/riscv/cpu.c        | 1 +
>  target/riscv/cpu.h        | 1 +
>  target/riscv/cpu_bits.h   | 3 +++
>  target/riscv/cpu_helper.c | 8 ++++++--
>  4 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 45ac98e06b..4f82bd00a3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -670,6 +670,7 @@ static Property riscv_cpu_properties[] = {
>
>      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> +    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
>
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c3d1845ca1..53f314c752 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -329,6 +329,7 @@ struct RISCVCPU {
>          bool ext_icsr;
>          bool ext_svinval;
>          bool ext_svnapot;
> +        bool ext_svpbmt;
>          bool ext_zfh;
>          bool ext_zfhmin;
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index bc23e3b523..ee294c1d0b 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -486,7 +486,10 @@ typedef enum {
>  #define PTE_A               0x040 /* Accessed */
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
> +#define PTE_RSVD            0x1FC0000000000000 /* Reserved for future use */
> +#define PTE_PBMT            0x6000000000000000 /* Page-based memory types */
>  #define PTE_N               0x8000000000000000 /* NAPOT translation */
> +#define PTE_ATTR            0xFFC0000000000000 /* All attributes bits */
>
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 832a2dd79c..f90766e026 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -619,17 +619,21 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> -        hwaddr ppn = (pte & ~(target_ulong)PTE_N) >> PTE_PPN_SHIFT;
> +        hwaddr ppn = (pte & ~(target_ulong)PTE_ATTR) >> PTE_PPN_SHIFT;
This would break rv32. Please ref:
https://lore.kernel.org/qemu-devel/1569456861-8502-1-git-send-email-guoren@kernel.org/

>
>          RISCVCPU *cpu = env_archcpu(env);
>          if (!cpu->cfg.ext_svnapot && (pte & PTE_N)) {
>              return TRANSLATE_FAIL;
> +        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT)) {
> +            return TRANSLATE_FAIL;
> +        } else if (pte & PTE_RSVD) {
> +            return TRANSLATE_FAIL;
>          } else if (!(pte & PTE_V)) {
>              /* Invalid PTE */
>              return TRANSLATE_FAIL;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>              /* Inner PTE, continue walking */
> -            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N)) {
> +            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N | PTE_PBMT)) {
>                  return TRANSLATE_FAIL;
>              }
>              base = ppn << PGSHIFT;
> --
> 2.17.1
>
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

