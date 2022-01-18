Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9fD8-0005Lo-4S
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 22:31:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9fD3-0005JE-1q
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 22:31:01 -0500
Received: from [2a00:1450:4864:20::32a] (port=55881
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9fCl-0005Ii-1z
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 22:30:48 -0500
Received: by mail-wm1-x32a.google.com with SMTP id c66so24633423wma.5
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 19:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WXixNQENw0ofQFg0k2+qJaD+/ihEPIpKWp5U9V+8KQE=;
 b=bic0RvFUr+Tsu0q5oljTq+A53V6mW+Y0A7GAaiwiU+zfgysJVPCysJzBMZ9xSOe9lb
 V4ruW6klKqiee0edH4i9JfSF2OMzcbUemzVAMhBj1101n+YVf4/pPanug07hinzJkDwQ
 CgDH9NK1c5yPLAkWw7kUDfjpykdTreeNs7IrkMS4AcAlg6zPv2lba+FeqUMh5yquyltz
 +TEwN0dSJzYysqzlNfJzEN9SLC7uq6zkwHwbixUgMojPLvMFLTMwlN1asNINSAthnVmD
 38voU/dTtEE/0PaUSfj3QelloRhp+wbdmHaVqyT4vvliooFJFPEYtBJ2ZX8JqUB5x7p/
 qGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WXixNQENw0ofQFg0k2+qJaD+/ihEPIpKWp5U9V+8KQE=;
 b=uXbX5IkeDKK8tFu50Y15NQN3Eoc9S1nbjvN9nqQOS8TjCvpBzqHWNc+shapSy6DfpH
 XwCwlVQOCg1ErK0qMfOOjFFlN62xFOrCmqbJe5eiJJO7Y9UHcnlAaVdVvq4CagyBVF4T
 QlM0t1dI5hcQXKPeTkvR5PYClYu2033zrJahNr7n/NOiYmTJ7CAFsRsng7m5aN8mU5yM
 Ri2VBDUJyk/PIMSiCH3UgBzwK5uH7UAvOEd7MKI3GsSn6W9CCiRMdW1i7D4PkNZH4CHv
 W9fezxZJ727XAmMosxJaX5VrRUAT/rwTZ5CqpKcCpsiFswudQs5cAntricARUDfDOE7r
 wnUQ==
X-Gm-Message-State: AOAM531wtuNnwnts+WaYCvM2OWgI9E3Q+8HD4OmujKWuiyb31b/FwgeD
 3tIiQ6rCe2i5dwHflxf11DuKcKd8I0f5tdjVP/aTXA==
X-Google-Smtp-Source: ABdhPJxKz89a8NGUAXscOC9XN/WPi3hDIVeFmKWPL4perXDzrEfCRgG41L5skrtBaNJG69JNGraE+eGlwcwzhnN1SgA=
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr24217880wmj.59.1642476641108; 
 Mon, 17 Jan 2022 19:30:41 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20220118011711.7243-2-liweiwei@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Jan 2022 09:00:29 +0530
Message-ID: <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, wangjunqiang@iscas.ac.cn, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32a;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Tue, 18 Jan 2022 03:31:01 -0000

On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
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
> 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h   | 7 +++++++
>  target/riscv/cpu_helper.c | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 5a6d49aa64..282cd8eecd 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -490,6 +490,13 @@ typedef enum {
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

Going forward we should avoid using target specific "#if"
so that we can use the same qemu-system-riscv64 for both
RV32 and RV64.

>  /* Leaf page shift amount */
>  #define PGSHIFT             12
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 434a83e66a..26608ddf1c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -619,7 +619,7 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;

Rather than using "#if", please use "xlen" comparison to extract
PPN correctly from PTE.

Regards,
Anup

>
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
> --
> 2.17.1
>

