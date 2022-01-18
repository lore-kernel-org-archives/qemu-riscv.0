Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9fHZ-0002GN-IJ
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 22:35:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9fHY-0002Fd-Sq
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 22:35:40 -0500
Received: from [2a00:1450:4864:20::32e] (port=54069
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9fHX-0005yo-4n
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 22:35:40 -0500
Received: by mail-wm1-x32e.google.com with SMTP id k5so15547979wmj.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 19:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pbDD03Y7Qsc6UwYMr1HiaRz68uU4srZHqUHsMKsrisc=;
 b=lT7f4g6oAgl7Sbfl65sF79JSqHfejF7fl7GkCUs7njCnVih6l+eoEkgMSVolACBA2I
 1coouJtJCfT0CluXR9ji5UZx1dInP0ACE/II7U2QGVYOmMfoxAJdMsA7fcl356HbYqg+
 fJz8yL36GVCtSKjb3uWQ53ur/hLyXWaB8XtUiwJK4Bb3ix7OL+ACLy3xuF5ArDCQWqD9
 /MgGkjT5mTDZhd9NvlgZgWjqXzIKwZo/AVk4KKJW6gEuF77uyJl4ok6fz4fv+H0NPEUS
 xhL+dT3+8jzNgWmRm2J2RP/izuQeYC0uat8juFXzcW4VckfXlwUeMzsENJ1Ol47MyIlK
 gMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pbDD03Y7Qsc6UwYMr1HiaRz68uU4srZHqUHsMKsrisc=;
 b=dKmFdo11ofc+t8pGpsvoTGRUtaCMMqo3ZSgeyjUKuBHMhnZcPUyd17Xn+vexBNbkTq
 KjIAMsluo/v9a9esQiPuYfXJ0TeEVlnXkz4/T+JvSNPAsfA6m8RTsJlUz7miJBUa37/g
 EHGTLv2g0trun3XNMvd6amN1IPhdhJ3O7vjAnw6t6eqCBhaPCQ65x1fQtPsdmiV6XEtj
 hF8jVsNqsed+cLLytaZ8bcazLWeOtLlNMMj4LC756WG2X7xqEVpQH/ojQYFINf9sv8ZJ
 f3Tx5wrHksFKTpEB3i+YyMWNBX4gBju7jLc+IHWhDgLmqj0JzOQmkhZ8J1DTLNGT4bFn
 Pwaw==
X-Gm-Message-State: AOAM532+I2BoNSJE1WsNJyip0EZnn8N0sXCIhnElfTdhQHgLkdz+jRm6
 Vq7WsfqLGs6zR8Hf1ki3naZpNh9UV1vr0a+BY0sv5w==
X-Google-Smtp-Source: ABdhPJz2wGPYG5rNWB08K0mhtNcStKtipm1LcTTDRUw/cXUW9QLBDtAVsWgpBpfgNJfxDjqjpx9EwOSmVEuIR/ZnrCw=
X-Received: by 2002:a05:6000:1286:: with SMTP id
 f6mr21970456wrx.346.1642476933221; 
 Mon, 17 Jan 2022 19:35:33 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-6-liweiwei@iscas.ac.cn>
In-Reply-To: <20220118011711.7243-6-liweiwei@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Jan 2022 09:05:21 +0530
Message-ID: <CAAhSdy3bMG3htJSCMsT9HjrYXQP5XZk8y_8KN7pXjPoNPzc58w@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] target/riscv: add support for svpbmt extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, wangjunqiang@iscas.ac.cn, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32e;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 03:35:41 -0000

On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - add PTE_PBMT bits: It uses two PTE bits, but otherwise has no effect on QEMU, since QEMU is sequentially consistent and doesn't model PMAs currently
> - add PTE_PBMT bit check for inner PTE
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Anup Patel <anup@brainfault.org>
> ---
>  target/riscv/cpu.c        | 1 +
>  target/riscv/cpu.h        | 1 +
>  target/riscv/cpu_bits.h   | 2 ++
>  target/riscv/cpu_helper.c | 4 +++-
>  4 files changed, 7 insertions(+), 1 deletion(-)
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
> index 5501e9698b..24b7eb2b1f 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -486,7 +486,9 @@ typedef enum {
>  #define PTE_A               0x040 /* Accessed */
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
> +#define PTE_PBMT            0x6000000000000000 /* Page-based memory types */
>  #define PTE_N               0x8000000000000000 /* NAPOT translation */
> +#define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
>
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index c276760c7f..9fffaccffb 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -625,9 +625,11 @@ restart:
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
>              return TRANSLATE_FAIL;
> +        } else if (!cpu->cfg.ext_svpbmt && (pte & (target_ulong)PTE_PBMT)) {

Rather than, type-casting defines here you can simply define
ULL constants. E.g.
#define PTE_PBMT            0x6000000000000000ULL

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

Regards,
Anup

