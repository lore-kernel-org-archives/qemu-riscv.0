Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n8N71-0006C9-L1
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jan 2022 08:59:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n8N70-00066O-8s
 for qemu-riscv@nongnu.org; Fri, 14 Jan 2022 08:59:26 -0500
Received: from [2a00:1450:4864:20::333] (port=37790
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n8N6v-0001Ic-4v
 for qemu-riscv@nongnu.org; Fri, 14 Jan 2022 08:59:25 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso7386460wmj.2
 for <qemu-riscv@nongnu.org>; Fri, 14 Jan 2022 05:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KtUcHSmge2QSVydb9urxGo3M98dxQbThYoAYxDnm36E=;
 b=Dym374zo4ti3y8QiZG0O2IPqrX8ysSGDF27HwmVq/EF0d+G55u+BPfdOMXY4h3u8id
 YUoRhn24EEgEAu6HX3KdCDwdQ4psgQtCDyKRPNIJcwFuy0lJQHxTfFB+/EObriXMnU+u
 5/htRmDYnpw3CUmMRUwH9I/R3x9oefV5N1TR2OZ4BVzeip/71x2ItUXkLdqutcjEMsus
 Nwg6mBsvaz+Vx1SeUSzPQEO4mVOnE/vUgMd0WmOtHa22Vxur7/cYOpYS3g0h72yNv8Ti
 Sci4ZQSsx1rHDPTECQ8XOeV/LKUp0zPWixK1Un5fG7UUxFu6or4psloOj31ghv+VSeDw
 ry0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KtUcHSmge2QSVydb9urxGo3M98dxQbThYoAYxDnm36E=;
 b=oZSM9wyRvr0X7vmpPmjux+q707BpmIQTO4xkeBikLjlWtgjgQhYjGKaUDCb/9QgJ2B
 6aTmbUeJ4VdwE7DtVRLZ4zCTBC66e2UT8jVn6XHI2Ov7mWt9TOs63js4KW17KEqlFYUu
 bs6XqoL07NpwulURkErQSp6lAhyvEJUT8ysWi46pbK0nSR3yMJu2pLAjHX5g+XbimfmH
 J9KUl2boDktiMR0GXtphsEAAwulJEzOP+DrCtOYLPPxc/Kq9MVtuCREQrLRT/W4JIAX4
 M1XnFvKP2U8WF/EtSf/tJNblKoWz2LqKNTjbuMFMPwkmc+9OMwPbG3vVeTj+nHtJf1d6
 qd3Q==
X-Gm-Message-State: AOAM5300eiCVnTWRb20qYsxEZin8pb8H9kvbAiGfww4r89HH02D0M5Bq
 iRyceXFOsD3PuyGXvMmHJqsQ79Gg569xR/bZRYCmkw==
X-Google-Smtp-Source: ABdhPJz5cx6wRliPErM59LhbOtL+E847KLJrSn24ULQlLlMaNDJoCadsQ4fgzxbDaem4qKl5PRNGCDZ5OCTocZ0G0Kk=
X-Received: by 2002:a1c:7709:: with SMTP id t9mr4389001wmi.176.1642168759191; 
 Fri, 14 Jan 2022 05:59:19 -0800 (PST)
MIME-Version: 1.0
References: <20220114014059.23300-1-liweiwei@iscas.ac.cn>
 <20220114014059.23300-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20220114014059.23300-4-liweiwei@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 14 Jan 2022 19:29:07 +0530
Message-ID: <CAAhSdy3pwbw8E7KnjQBguY83DbVYhX4LiLK2WBwb_A9KvyAivQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] target/riscv: add support for svpbmt extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, wangjunqiang@iscas.ac.cn, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::333;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Fri, 14 Jan 2022 13:59:26 -0000

On Fri, Jan 14, 2022 at 7:11 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> It uses two PTE bits, but otherwise has no effect on QEMU, since QEMU is sequentially consistent and doesn't model PMAs currently
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  target/riscv/cpu.c        | 1 +
>  target/riscv/cpu.h        | 1 +
>  target/riscv/cpu_bits.h   | 3 +++
>  target/riscv/cpu_helper.c | 9 ++++++++-
>  4 files changed, 13 insertions(+), 1 deletion(-)
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
> index 58ab85bca3..f90766e026 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -619,16 +619,23 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> -        hwaddr ppn = (pte & ~(target_ulong)PTE_N) >> PTE_PPN_SHIFT;
> +        hwaddr ppn = (pte & ~(target_ulong)PTE_ATTR) >> PTE_PPN_SHIFT;
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
> +            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N | PTE_PBMT)) {
> +                return TRANSLATE_FAIL;
> +            }

I think you should add a patch before PATCH1 to add following:

if (pte & (PTE_D | PTE_A | PTE_U)) {
    return TRANSLATE_FAIL;
}

The current PATCH1 should add PTE_N to the comparison and
this patch can add PTE_PBMT to the comparison.

>              base = ppn << PGSHIFT;
>          } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
>              /* Reserved leaf PTE flags: PTE_W */
> --
> 2.17.1
>

Apart from the minor comment above, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

