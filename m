Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njrYo-0003ry-0k
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 19:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njrYm-0003qF-7u; Wed, 27 Apr 2022 19:59:04 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:43551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njrYk-0006vo-O7; Wed, 27 Apr 2022 19:59:03 -0400
Received: by mail-il1-x12e.google.com with SMTP id d3so987756ilr.10;
 Wed, 27 Apr 2022 16:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rf5u64GBZNghiERYC9BS0l9Tc2Y7ScmOrjgNs7VgyJc=;
 b=ItZyRhO/fy8Bp1sdq7FKVMOjDYyJqRNnOkTSlS1Xshpv5rI2YMW/bqrLaA2wID6L5z
 TTHUXiidtRxhsJ6+zjkQYJ5dSVshbY774CBXZMYptC+CGG/aCIc9e64Y8eNPTJJY8g5l
 3u4F/vjK1ABKADhL/96ypjUPr+8UBlbGe4ZkhSZvon0lYnDsjJ0h6o/VAgbA1LXC6b9W
 RK1h9zIivgR7Ai481CfmobjjLpzGoibeO23E0uGpIcQI0bCts8bOJPVR/wD8Xz5GXL4c
 3p5SiBuzNxKiLtm3eCj92OZonvLQoc+VJQlSJzHLVxY8nqFiFlOTqpdld/DxaJvAeYZX
 RzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rf5u64GBZNghiERYC9BS0l9Tc2Y7ScmOrjgNs7VgyJc=;
 b=7nSD9Pjl3asZjrLJbpLf5W4UhpKqLVSGgJ/NLAeAekPicNUfGKVwYathXkDB73jZjy
 2LqT2hwuEo1QLiv3MgalS2OqpHz5+5J5XQidpkyzKrjmcwQ+XWowgzvCw2cVik2jVRO+
 qKMV6gYjRtiZXSMu95raEQUHjGcpjHDnhA0xIU2JyOTlvwY+0qkaY3fA39AcqbARfDkJ
 pMJH1gRwsStJ4Rj3/E+D88M0/FN4cdzNNy8fNK1fhBBpyNitkZEAmy6jbVxb+TJu0TAv
 BykqJMNalRM48sweri8KnMYT6VNM3456xOKjnNuEOykSzwgzLGYCvCy7yuIRo9ZriLvY
 3OOg==
X-Gm-Message-State: AOAM533WFlTrwfUFTr4brMi/TnJDneS0H5Q6iU7WAucoZYlyaDfqFlfe
 zfyyWxST1DdibS+FC7pAlL8TAdcQkC8+S2Hqx0U=
X-Google-Smtp-Source: ABdhPJzzTIE+n4m0PA9e5uPBXFbbp9RLEyBxmM/NDIFzYj9Y+wBLeB0EBbWtu7p8+k9GkpTRUKZoWisPgEjzqyCyaU0=
X-Received: by 2002:a92:6012:0:b0:2bd:fb5f:d627 with SMTP id
 u18-20020a926012000000b002bdfb5fd627mr12135926ilb.86.1651103940393; Wed, 27
 Apr 2022 16:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1650777360.git.research_trasio@irq.a4lg.com>
 <cfda1d8da254f2e723e487f0c738c59d5891e492.1650777360.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cfda1d8da254f2e723e487f0c738c59d5891e492.1650777360.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Apr 2022 09:58:34 +1000
Message-ID: <CAKmqyKOx2Q3vjK5b51y1yrKS=f+08qzQFvCiS0iuDqBQ0wo41g@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Tentatively remove Zhinx* from ISA
 extension string
To: Tsukasa OI <research_trasio@irq.a4lg.com>, liweiwei <liweiwei@iscas.ac.cn>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Wed, 27 Apr 2022 23:59:04 -0000

On Sun, Apr 24, 2022 at 3:22 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> This commit disables ISA string conversion for Zhinx and Zhinxmin
> extensions for now.  Because extension category ordering of "H" is not
> ratified, their ordering is likely invalid.
>
> Once "H"-extension ordering is determined, we can add Zhinx* again.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Weiwei Li does this sound alright to you?

Alistair

> ---
>  target/riscv/cpu.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0c774056c5..c765f7ff00 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -954,8 +954,6 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>          ISA_EDATA_ENTRY(zfh, ext_zfh),
>          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> -        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> -        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
>          ISA_EDATA_ENTRY(zdinx, ext_zdinx),
>          ISA_EDATA_ENTRY(zba, ext_zba),
>          ISA_EDATA_ENTRY(zbb, ext_zbb),
> --
> 2.32.0
>

