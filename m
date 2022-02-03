Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nFQaz-00012o-Cg
	for mharc-qemu-riscv@gnu.org; Wed, 02 Feb 2022 20:07:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nFQax-000127-IC; Wed, 02 Feb 2022 20:07:31 -0500
Received: from [2607:f8b0:4864:20::d35] (port=34528
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nFQau-0000Ou-8U; Wed, 02 Feb 2022 20:07:29 -0500
Received: by mail-io1-xd35.google.com with SMTP id i62so1359934ioa.1;
 Wed, 02 Feb 2022 17:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3HB1gB/yuOf4CEhGdZ7fkITTEnh55XnTT8AC+/7KKnQ=;
 b=I5XvLyzElWa9kc6xWSvMfckFcR9h4o82+lruERa4LsjSh2nfA2NJu5EPNmfng3boQo
 g/arIH26yJOsos8uSQkSVV5EGhQCkLMkqvjMY9VD0Iybr/mG8zHSwb36JBWBN4LQIWO9
 DSQyBB+JhHURQfXsWx69qqB5JEIUaXx7J5POetxdiM6RLDqB6aBlOMfeVBpjTb+ukOMt
 GyYjxGBnezUoHjjw2bMk282o1SXGTyK7FI9035h8u3fnN2u5gyVQSTP7FGa5SWpS7xOb
 bMrC1gsDDd0av5+sgozHDjnaXSIbAZkYeUitaNGMezTlFooBWGvZ+7MkI5+aNR9mPNeR
 eG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3HB1gB/yuOf4CEhGdZ7fkITTEnh55XnTT8AC+/7KKnQ=;
 b=YV5db+dS08iCb0GCrsveUPVpsGCjF4p6o2ym6AdcH9DAtNF5e8FV/3Ey7jAr66d+pO
 9vh2sPer53aGfULCIKBqtDWVS7WIdGDiT2YJbuXMZVDrjJhS7zYMgSqERoAPpur4KOl/
 k8CixUGBLxNHXQ142+1uJQgLClTdDjXZuGJ35L4kWNwzjqBSNNrNXDxvB3hpMHHiPwPW
 qCvVTsecOz7BmF+lYjZssnsnTJG+7UpVrtTQyem9kzt5EnyUDT2Q5CocpBzhpKplp6g0
 Xo/csPlb93yjRdd1zj2WbbFEUPk0/wGDXamNjZOmenyurA1qiYf2lMD3+2AONFQGvMON
 z2IQ==
X-Gm-Message-State: AOAM5313OnlZiToaCeQklgTrEyayADfnZ8SjMtMienCVeg8lS2sHfTop
 SldvhanZNizN2cei3hZsYIYU/H3m6NXAYl+kLBXmhLhjgyCdWA==
X-Google-Smtp-Source: ABdhPJx0XKB0nq5fexfRSlzAuyWQJqFflsLnFcnlcg1b7+0NyCbfWLNo3iAyGNqyfFQlTDOyQeBAGfkq5zzI85V53y4=
X-Received: by 2002:a02:9606:: with SMTP id c6mr15853099jai.169.1643850446303; 
 Wed, 02 Feb 2022 17:07:26 -0800 (PST)
MIME-Version: 1.0
References: <20220201142415.29980-1-liweiwei@iscas.ac.cn>
 <20220201142415.29980-6-liweiwei@iscas.ac.cn>
In-Reply-To: <20220201142415.29980-6-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Feb 2022 11:07:00 +1000
Message-ID: <CAKmqyKPUSqfJ2w=dgUcoPgeiHHj9DB3Fud-=MVdCZ+AriQzOpA@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] target/riscv: add support for svpbmt extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 03 Feb 2022 01:07:32 -0000

On Wed, Feb 2, 2022 at 2:13 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - add PTE_PBMT bits: It uses two PTE bits, but otherwise has no effect on QEMU, since QEMU is sequentially consistent and doesn't model PMAs currently
> - add PTE_PBMT bit check for inner PTE
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  target/riscv/cpu.c        | 1 +
>  target/riscv/cpu_bits.h   | 2 ++
>  target/riscv/cpu_helper.c | 4 +++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4442c4b81d..e231708ffb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -731,6 +731,7 @@ static Property riscv_cpu_properties[] = {
>
>      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> +    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
>
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 7abe9607ff..20ab4f4a0d 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -489,7 +489,9 @@ typedef enum {
>  #define PTE_A               0x040 /* Accessed */
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
> +#define PTE_PBMT            0x6000000000000000ULL /* Page-based memory types */
>  #define PTE_N               0x8000000000000000ULL /* NAPOT translation */
> +#define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
>
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 77b263c37e..f975de8213 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -640,9 +640,11 @@ restart:
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
>              return TRANSLATE_FAIL;
> +        } else if (!cpu->cfg.ext_svpbmt && (pte & (target_ulong)PTE_PBMT)) {

Same comment about the casts, I don't think they are required.

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +            return TRANSLATE_FAIL;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>              /* Inner PTE, continue walking */
> -            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_N)) {
> +            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_ATTR)) {
>                  return TRANSLATE_FAIL;
>              }
>              base = ppn << PGSHIFT;
> --
> 2.17.1
>
>

