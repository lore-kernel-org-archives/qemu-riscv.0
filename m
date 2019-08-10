Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwGVp-0005SV-4K
	for mharc-qemu-riscv@gnu.org; Fri, 09 Aug 2019 21:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48288)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hwGVl-0005LB-VD
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 21:49:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hwGVk-00006I-WF
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 21:49:37 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:39037)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hwGVi-00004r-Ij; Fri, 09 Aug 2019 21:49:34 -0400
Received: by mail-lj1-x244.google.com with SMTP id x4so1541729ljj.6;
 Fri, 09 Aug 2019 18:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y9QH/w9l5qJnuHMWLHU+oaiciYxpU02we5mfBx6Z8Sk=;
 b=nqvhIiFRjOaqdtUUBBSUg+r8aIBM1h6zDK2BH3U1xBVyEZ6nPfDFz57ymTe06uQ1BS
 tXCSmPRFrI88zCkzEMnVTe9mO+F+95f6lSvZ7Wu2o50+AQoZMq7sOaCkswK4aVo34Jy8
 zs6r/r0hEmD4NLtQEO3ofn13Pe/6u63Bd1w3vms6gaJdv6ApAHQzRC4Gc8zr8tEguknE
 TRrCpmpbuFx2GNxuM44zQyBlG6S1lTh4TDgvld8+4eN4lHtjkCk06KiHnz2eN0axGq8j
 Nqb38yjx9kxbJdVRyjBRApNO3rQCuUuJ8EhEJUvbSTHJYMAwUI2uTNl2Eor4igPyKnMH
 e8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y9QH/w9l5qJnuHMWLHU+oaiciYxpU02we5mfBx6Z8Sk=;
 b=DZ5ROetgCbG5RaZ+PWtItv1skCaWs4XyJ7Qov1Pi//bY6GKh7eSjzu269Afth2RSAs
 N+bUeXvEOBmdNcJkKSWaQvUYUwwUpGXX0svUihcked90efcxqPHi5HqYgndUvkt7A/yu
 aJF4BoYu16X+NfDm6qS2UOH2y3x5UF184kmZqCRHSvlV4DDgeUMontwzaKl8vLYWelas
 zmCo65QCB+GYM1jsPA20BYUyZvjob6svGfc9vGiU0iCHdDY2oS8FPI6ukz8hAO3QR+16
 u9hX9u32Jkg6z7x0XMaUP6ejm+BxCWfURXQeodKhtUgyVDa9Pj3LzoAIR0Xv+ulTd9LV
 /wGw==
X-Gm-Message-State: APjAAAU/vROEcZ6vrHeQ5A0LgIa6/mbv6KeYWYDmlNkHkjKWXPpCvAvN
 /muOuWQrDc4ujspyiXPT1Qy+yD56OVkAfLjxwhA=
X-Google-Smtp-Source: APXvYqz4490Al0TsQSvB5U1w5hgxDoR4JeL9yDJNF4rcbvkRhBFCOZPiZDakFwOdIwBdEIbZigPsTIYeWp+UfIC6WTk=
X-Received: by 2002:a2e:b4c9:: with SMTP id r9mr11145450ljm.196.1565401772211; 
 Fri, 09 Aug 2019 18:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <1564577101-29020-1-git-send-email-bmeng.cn@gmail.com>
 <1565232570-29296-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565232570-29296-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Aug 2019 18:49:05 -0700
Message-ID: <CAKmqyKPQ0z-VtiebdtBqhBocgGkgeLLbtcawhwss0YpoYZyH2A@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2] riscv: rv32: Root page
 table address can be larger than 32-bit
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
X-List-Received-Date: Sat, 10 Aug 2019 01:49:39 -0000

On Wed, Aug 7, 2019 at 7:50 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> For RV32, the root page table's PPN has 22 bits hence its address
> bits could be larger than the maximum bits that target_ulong is
> able to represent. Use hwaddr instead.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - promote ppn, env->satp/env->sptbl to hwaddr otherwise the page
>   table base will not be correctly calculated
>
>  target/riscv/cpu_helper.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e32b612..b2b4f3a 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -176,12 +176,12 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>
>      *prot = 0;
>
> -    target_ulong base;
> +    hwaddr base;
>      int levels, ptidxbits, ptesize, vm, sum;
>      int mxr = get_field(env->mstatus, MSTATUS_MXR);
>
>      if (env->priv_ver >= PRIV_VERSION_1_10_0) {
> -        base = get_field(env->satp, SATP_PPN) << PGSHIFT;
> +        base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
>          sum = get_field(env->mstatus, MSTATUS_SUM);
>          vm = get_field(env->satp, SATP_MODE);
>          switch (vm) {
> @@ -201,7 +201,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>            g_assert_not_reached();
>          }
>      } else {
> -        base = env->sptbr << PGSHIFT;
> +        base = (hwaddr)(env->sptbr) << PGSHIFT;
>          sum = !get_field(env->mstatus, MSTATUS_PUM);
>          vm = get_field(env->mstatus, MSTATUS_VM);
>          switch (vm) {
> @@ -239,7 +239,7 @@ restart:
>                             ((1 << ptidxbits) - 1);
>
>          /* check that physical address of PTE is legal */
> -        target_ulong pte_addr = base + idx * ptesize;
> +        hwaddr pte_addr = base + idx * ptesize;
>
>          if (riscv_feature(env, RISCV_FEATURE_PMP) &&
>              !pmp_hart_has_privs(env, pte_addr, sizeof(target_ulong),
> @@ -251,7 +251,7 @@ restart:
>  #elif defined(TARGET_RISCV64)
>          target_ulong pte = ldq_phys(cs->as, pte_addr);
>  #endif
> -        target_ulong ppn = pte >> PTE_PPN_SHIFT;
> +        hwaddr ppn = pte >> PTE_PPN_SHIFT;
>
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
> --
> 2.7.4
>
>

