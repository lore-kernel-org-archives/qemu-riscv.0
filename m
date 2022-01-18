Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9gTC-0006dm-Gi
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 23:51:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9gTB-0006dY-8d; Mon, 17 Jan 2022 23:51:45 -0500
Received: from [2607:f8b0:4864:20::d34] (port=33300
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9gT9-0007a1-4o; Mon, 17 Jan 2022 23:51:44 -0500
Received: by mail-io1-xd34.google.com with SMTP id f24so18209787ioc.0;
 Mon, 17 Jan 2022 20:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vZLHZ0nXY4Lw2G9mNvY3jzc6+nKGgjGnZkA+7eAxpUA=;
 b=XBIqhHCAwlJupCkC8ziwgC9lwEHP1zND5C7n7k9+ZZwfTyi6M2HoqslfK1v5WKUj1h
 K0b1T/757y3JoqrfjDaEKxtLF6TW6AUYN8Oxa/RITLH0j8DUh+73olZ3PGkFQatuds10
 HSMyzwQV/hUDjkfquhSlSfkvTpBe7FZzQcwyPOWFw0KfiGSQkXZSfinYocFRJlUqf/l+
 MM4Etn7CdEieR9MNyvzyBJGzcMUFxQ9wFOtZIw4kIXk06DbQJvtfihhLNpokWg4+GNGt
 nYOBBLAXiBuHMVGtLM9HHvVvrypSwdNvt39l6R2bOAfPiRQKPSiHzH2PLFjXbVuVj38e
 yhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vZLHZ0nXY4Lw2G9mNvY3jzc6+nKGgjGnZkA+7eAxpUA=;
 b=uYHqy1LkhgCOhT54MuJ3Vw4/eaOCOg8I0DRD6oYMiTk/xHfGd3S30dy1hXPjgt4vb3
 BCWZpHORQKU3o3doXM2KAoLUYIx8e7VB95uhWD988wwA//ROEaP1Rj+VcA2elw1039F4
 pqJkZTqMUI94d54/rcUEcmSYvg3XOvSi3yeEpRBEugaevI8L4D1hxOn10MIcaRNNTKD1
 DvWq1nxtY4ebaJVmRFppFEBHKlqpRPT8WRd4beVTuv6Fk6aRBbJlOmriYBxJ0P7peepi
 xK5wK887cpcUKwrUAAM9QPSZuRHtnbIJXXtiFoBuHQEVFVemyFneTHXA5Z2BZ9EJosA3
 WNLQ==
X-Gm-Message-State: AOAM531D16Jft2gzEL032/zQcviOXMqSpTwezmXCmyUyOxNogEGzy01e
 jeBhpHqO40ImioLLbozrzk/ydJUQcwpu4/78tAA=
X-Google-Smtp-Source: ABdhPJwz9PifwbDrtkdYvTUOA/VWz2iRt7dJWWo30RwUR4L9gKK/Lgw307vlKYgeUkyqyZyH23f8Al1GQ5de5yg0EMw=
X-Received: by 2002:a05:6602:14cd:: with SMTP id
 b13mr6167868iow.57.1642481492455; 
 Mon, 17 Jan 2022 20:51:32 -0800 (PST)
MIME-Version: 1.0
References: <20220117071439.1841844-1-guoren@kernel.org>
In-Reply-To: <20220117071439.1841844-1-guoren@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 14:51:06 +1000
Message-ID: <CAKmqyKPjzGWuOoGyT9M3N5Bvf-MRnr6+bLGn5bYaXKaTOyT8gA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Ignore reserved bits in PTE for RV64
To: Guo Ren <guoren@kernel.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Guo Ren <ren_guo@c-sky.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 04:51:45 -0000

On Mon, Jan 17, 2022 at 5:18 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <ren_guo@c-sky.com>
>
> Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> need to ignore them. They cannot be a part of ppn.
>
> 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
>    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
>    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
>
> 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-dif=
f.pdf
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Cc: Weiwei Li <liweiwei@iscas.ac.cn>
> Cc: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>
> ---
>  Changelog V7:
>   - Update svpbmt reason in commit log
>
>  Changelog V6:
>   - Add Reviewer: Alistair Francis
>
>  Changelog V5:
>   - Add Reviewer and Tester: Bin Meng
>
>  Changelog V4:
>   - Change title to Ignore not Bugfix
>   - Use PTE_PPN_MASK for RV32 and RV64
>
>  Changelog V3:
>   - Use UUL define for PTE_RESERVED
>   - Keep ppn >> PTE_PPN_SHIFT
>
>  Changelog V2:
>   - Bugfix pte destroyed cause boot fail
>   - Change to AND with a mask instead of shifting both directions
> ---
>  target/riscv/cpu_bits.h   | 7 +++++++
>  target/riscv/cpu_helper.c | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 5106f0e769..fa22839d54 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -479,6 +479,13 @@ typedef enum {
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
>
> +/* Page table PPN mask */
> +#if defined(TARGET_RISCV32)
> +#define PTE_PPN_MASK        0xffffffffUL
> +#elif defined(TARGET_RISCV64)
> +#define PTE_PPN_MASK        0x3fffffffffffffULL
> +#endif
> +
>  /* Leaf page shift amount */
>  #define PGSHIFT             12
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 7945f687b4..06c5403fdd 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -619,7 +619,7 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> -        hwaddr ppn =3D pte >> PTE_PPN_SHIFT;
> +        hwaddr ppn =3D (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;

This will need to be dynamic based on get_xl()

It does look like we should check the existence of the extensions though:

"Bit 63 is reserved for use by the Svnapot extension in Chapter 5. If
Svnapot is not implemented, bit 63 remains reserved and must be zeroed
by software for forward compatibility, or else a page-fault exception
is raised. Bits 62=E2=80=9361 are reserved for use by the Svpbmt extension =
in
Chapter 6. If Svpbmt is not implemented, bits 62=E2=80=9361 remain reserved
and must be zeroed by software for forward compatibility, or else a
page-fault exception is raised."

Alistair

>
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
> --
> 2.25.1
>
>

