Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqk8X-0000cF-R5
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 19:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqk8W-0000aZ-Rj; Mon, 16 May 2022 19:28:24 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:34477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqk8V-0007xh-3W; Mon, 16 May 2022 19:28:24 -0400
Received: by mail-io1-xd2b.google.com with SMTP id r27so17694257iot.1;
 Mon, 16 May 2022 16:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XA/JwoKYhzCMnepQhLiEenyOsSrsZ0A3mc5Ajqs9vyY=;
 b=TP1kdTS/Vo4ynOEDKwQpm0Y6HMC0BUZE4UoZvZjj2zBCUVk4EPdFAh0+kUJ14rKU/N
 7Y/nkUwEnaUhsiFHf/USjfb3sA6aCPt/zgzsWdXZqw5H/cUytRS0Qj2k+IGYK+TlhG/K
 GvVfqz77VUFqpj3s+qxN8OMgXcwwZzzskHZ2NhW+a0C3s7oPDaI5nXjsksGCt4ro0NX7
 GCrmCGsSDHsP9dwaXovmMHMc+HHajO8b7/9VIkK9z+9HNPny1bswlXyqqZGjT5E69Nik
 EDSepPnz3zkp2UWhPaiPHp1tCpBrX/XHMZp0kdp26XeLiOKWJsPN06sBKR25+9ZAdwCZ
 ZZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XA/JwoKYhzCMnepQhLiEenyOsSrsZ0A3mc5Ajqs9vyY=;
 b=gk8kEHbIQXlONndeDzn3RlyOBAQ/kEe/acle9DytUffyLsIx/k6LRYDIJU8gnawbw/
 a+1RSRgMZDLBejwRhqkNBUrNw19M2eWE2h1GcJk8fdRdNhG2Qavrl340atwFbOnQpFPx
 zddn+2mv1pM4tw6r/KiyrXKr6a8mLzZMuJpJnMN1MwDIUCpq01aIBwPfbydPxQzF5mi/
 S7GbmgKe6d9JaAQO0j5kbvV2VYcsZteFNlropbXfrdGSGxQk0yUv8IXGcb7PaGX4wB/O
 IlJUVErRh6DM/9XKvy8BKKqh9G+NE6oXywx/b4gkg0X95M6LoWVVKPSzjwehlaWaHHCD
 4fNA==
X-Gm-Message-State: AOAM531ie2bNZ26cYMfWu6Wo9HyYYMItJvPgv+XpbGtX7ng08QUUpKNr
 O/+77fVJW7R1eBQQGfQN2Dz1i0+5NEs7TuGmFKo=
X-Google-Smtp-Source: ABdhPJwq0gi3ERwVYCiUrn9sSU7qpNUFZuB6mmSczoCMBtYCTfiS9hdvgfao1bZXgyOnGGVkFyaEKU/cv4iGouZuAVU=
X-Received: by 2002:a05:6638:dc7:b0:32b:a483:16b8 with SMTP id
 m7-20020a0566380dc700b0032ba48316b8mr10533503jaj.66.1652743701570; Mon, 16
 May 2022 16:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652181972.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652181972.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 09:27:55 +1000
Message-ID: <CAKmqyKM0A2rDna7MaqBoQBDz79CfVK=1Ck-f_isdDnJ3Kihjvw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] target/riscv: ISA string conversion fix and
 enhancement
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Mon, 16 May 2022 23:28:25 -0000

On Tue, May 10, 2022 at 9:29 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> Hello,
>
> There is two issues related to RISC-V ISA extension string
> I want to be fixed before QEMU 7.1 release.
>
> This is PATCH v2.
>
> For details, see cover letter of PATCH v1.
> <https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg03817.html>
>
>
>
> PATCH v1 -> PATCH v2:
>
> I decided to "move" Zhinx*, not to remove them tentativelly.
>
> Because, although I disagree with Weiwei's opinion (on canonical
> ordering, Z* multi-letter extensions are ordered by second character;
> that should reflect closely related single-letter extension but that
> didn't happened on Zhinx*), ordering of "H" is reviewed and going to be
> right after "V".
>
> I considered this is safe enough (despite its "unratified" status):
>
> 1.  Zhinx and Zhinxmin are minor extensions
> 2.  Extension ordering is going to be not that important in the future
>     (by upcoming rules) but we have reasons to make extension ordering
>     canonical as possible for toolchain compatibility (for now).
>
>
>
>
> Tsukasa OI (2):
>   target/riscv: Move Zhinx* extensions on ISA string
>   target/riscv: Add short-isa-string option
>
>  target/riscv/cpu.c | 9 ++++++---
>  target/riscv/cpu.h | 2 ++
>  2 files changed, 8 insertions(+), 3 deletions(-)

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>
> base-commit: 178bacb66d98d9ee7a702b9f2a4dfcd88b72a9ab
> --
> 2.34.1
>

