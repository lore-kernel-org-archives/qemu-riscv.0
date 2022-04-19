Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngfZz-0002NI-FF
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 00:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ngfZy-0002My-9C; Tue, 19 Apr 2022 00:35:06 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:33444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ngfZw-0001XF-Mr; Tue, 19 Apr 2022 00:35:06 -0400
Received: by mail-il1-x12a.google.com with SMTP id b5so9814350ile.0;
 Mon, 18 Apr 2022 21:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3jy5eE8kVpI/lftvBVmgsU8Chaa/OVlJQI4FFIM0A9U=;
 b=UsFHLiTJCTtiMi2sv+zAiQMNQ/wSQd1gXxSR+tV+FPj2HmNGI+BRJ2WyJwDT/ehUFT
 jhC1tgOxkoWSGYmcBl8YjKwZBKY/wvBEJ4Cgam4HBvKfofJciJ0/EtwOYnrycpa6tfd+
 kN3k/Up5y4w7zP9VyVe8PPHUhlQv0u3VC/klVXT7EvC5dWO2f3l5t1ptCXiDd5l1pcF/
 tfQUXa8cx9Z+6HlQptn1jodsqxbp9Her6xkZWRXIjSSM/XLehQA9omqoxZ/3L/4pcXZX
 JAprZ5ebZf7F8AYh8x25322Vq6THgn+rbWkgcuBXqym4wNoSDwWVPLp+SpPc/v4wvGCT
 ReUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3jy5eE8kVpI/lftvBVmgsU8Chaa/OVlJQI4FFIM0A9U=;
 b=6ikETyr+YVVG9bBfPhRlcxZM0CuZLxVymln0Myry5rBTkXOLcZRUInIIghUALAOC7A
 NG3itXW4BeU01bPrIRQEB7WhM2ZuNiWEAza5I6jNcXjQuWnA0rTbrmzEaUCAYbhVXN+A
 cPG7RpsrBCy4nfYVTL81Alqhh44nsXRrIlYgQU+jNAphGQeT++F+h6jRN4edwRQvCf8W
 0vSIRLXbASO6AgqnumnxE9N8Jy9zf+qTuoF6lcz/ThO1+X08wNm0/xwA7ugviig+R4vj
 t/OdTVl7Rvu2RWVYz1C+VgOqh4h82Nmyx1K3S0YllYNosgln39QrZT0mKf7fuAWDB9wf
 xj6Q==
X-Gm-Message-State: AOAM530ryh1cMLwjFPXAkLew33wi53PbsYQNw5hvu5V+ijEz1wJYk9RS
 WJMLJB9zC1jaXy6N1Ppo3ksgJuKJFwZ2HG8h7DA=
X-Google-Smtp-Source: ABdhPJzVWggctg4uCeUmBDzvUjtxJfRwJPWd9ETWCvPPV3g89egZLXOipjU0xHF0QpnvYMReixH/efhni3LkgnCAk9w=
X-Received: by 2002:a92:6012:0:b0:2bd:fb5f:d627 with SMTP id
 u18-20020a926012000000b002bdfb5fd627mr5937520ilb.86.1650342903215; Mon, 18
 Apr 2022 21:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <rq81o86n-17ps-92no-p65o-79o88476266@syhkavp.arg>
In-Reply-To: <rq81o86n-17ps-92no-p65o-79o88476266@syhkavp.arg>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Apr 2022 14:34:37 +1000
Message-ID: <CAKmqyKMSLvVjHgiw2h3SwLVORVP-ZSBwUDaD+aTaxSr9=JJ_zg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/pmp: fix NAPOT range computation overflow
To: Nicolas Pitre <nico@fluxnic.net>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Apr 2022 04:35:06 -0000

On Sat, Apr 9, 2022 at 2:25 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> There is an overflow with the current code where a pmpaddr value of
> 0x1fffffff is decoded as sa=0 and ea=0 whereas it should be sa=0 and
> ea=0xffffffff.
>
> Fix that by simplifying the computation. There is in fact no need for
> ctz64() nor special case for -1 to achieve proper results.
>
> Signed-off-by: Nicolas Pitre <nico@fluxnic.net>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
> This is in fact the same patch I posted yesterday but turns out its
> scope is far more important than I initially thought.
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 81b61bb65c..151da3fa08 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -141,17 +141,9 @@ static void pmp_decode_napot(target_ulong a, target_ulong *sa, target_ulong *ea)
>         0111...1111   2^(XLEN+2)-byte NAPOT range
>         1111...1111   Reserved
>      */
> -    if (a == -1) {
> -        *sa = 0u;
> -        *ea = -1;
> -        return;
> -    } else {
> -        target_ulong t1 = ctz64(~a);
> -        target_ulong base = (a & ~(((target_ulong)1 << t1) - 1)) << 2;
> -        target_ulong range = ((target_ulong)1 << (t1 + 3)) - 1;
> -        *sa = base;
> -        *ea = base + range;
> -    }
> +    a = (a << 2) | 0x3;
> +    *sa = a & (a + 1);
> +    *ea = a | (a + 1);
>  }
>
>  void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index)
>

