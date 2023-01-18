Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIH8N-0006B2-9I
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 17:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIH8L-0006AY-Fr; Wed, 18 Jan 2023 17:42:17 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIH8K-0002eb-2i; Wed, 18 Jan 2023 17:42:17 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id 187so310743vsv.10;
 Wed, 18 Jan 2023 14:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uMTygGtvu9QDzRsEHTqZjArkniSbvHqg2cfy0eZ9Ca8=;
 b=ixxvLDGSBBzGaELE2ixcl/f9IQ5d8g2x653GsysiBfxiUpfVxNmjENjXlm2JYyTWZQ
 ncEsnNRTn6bOyvayLHZ27nZLwefSYpc1xUF6HgdqBi6bJ69KkXEAYKLJMQ0JwdvKejwN
 h8B02nJ3BmIXSbIZYaPJFb8BpR/RTxew+vf5uUlXXo9cf1mpmt40n1at1h9ma9z9PzgR
 3nkt+YCrpCa8PkhgN6CZIKcLxkUhIDq10yYlQvqZGVhFlX3POVRkUTgTgm/3xUkuAdEp
 Dc+S5JHDH5MRaYiWU1LaclIrBnXkod8+iox5cHjIXxOSsypnRv2qJHZ+A/gX5WCSlLC9
 lXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uMTygGtvu9QDzRsEHTqZjArkniSbvHqg2cfy0eZ9Ca8=;
 b=uc6OTHK3kAiiqXrxH0p6CkpT/KkPCoFSFEZ72USXNAfYBkIaYJDvO6/11SB+azt6uG
 DE7dDW0OMfgTvHw5LWqWaNB2kggvqyogG9UJMumtggl4qkcTfADV8NJ+mP4UNAZIEXqf
 oV2QIhDJ4H1Nx6AS0/DViOptbTVc7V2YX10PXlykq3s7d2iDQFpZ7NbeZTPx3QsgKny+
 QS2KML9QsUEMdFIrm042G0/h4yL23teg20PfvdU1530UgarOQHVorfUMRlpo5Sf0NBtJ
 oBqZuHtLADl3APXMyvWj1z7EpSwnhxzpsGprpfuT4uxJQg5nL0JPeIruARVh0yJId/wc
 SFIg==
X-Gm-Message-State: AFqh2kqwBAT6LDSK8iOJ5qNPHxh8FIcerxSW43N8pYhrn5DTKh2sC/6P
 lSqixzYtgOpheMqFqzr9yhsF4cDAcAl1fYSzTjY=
X-Google-Smtp-Source: AMrXdXuwi7BC2xb2J0pKWi8dRY+00Gtj/YoYnqFmZDC3KAGzknAVcenfIB1TU/ZBfkgBHTpeqC4OwuQg0TZdN6hz5Pc=
X-Received: by 2002:a67:e14a:0:b0:3d3:f10a:4f56 with SMTP id
 o10-20020a67e14a000000b003d3f10a4f56mr1183786vsl.10.1674081734376; Wed, 18
 Jan 2023 14:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20230117230415.354239-1-richard.henderson@linaro.org>
In-Reply-To: <20230117230415.354239-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 08:41:48 +1000
Message-ID: <CAKmqyKPdn8ANwHRqfVOQUoArKVbtCZwMpcPYCB4PBQ=F0kGTZw@mail.gmail.com>
Subject: Re: [PATCH] tcg/riscv: Use tcg_pcrel_diff in tcg_out_ldst
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 18 Jan 2023 22:42:17 -0000

On Wed, Jan 18, 2023 at 9:05 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We failed to update this with the w^x split, so misses the fact
> that true pc-relative offsets are usually small.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  tcg/riscv/tcg-target.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index fc0edd811f..01cb67ef7b 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -599,7 +599,7 @@ static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
>      intptr_t imm12 = sextreg(offset, 0, 12);
>
>      if (offset != imm12) {
> -        intptr_t diff = offset - (uintptr_t)s->code_ptr;
> +        intptr_t diff = tcg_pcrel_diff(s, (void *)offset);
>
>          if (addr == TCG_REG_ZERO && diff == (int32_t)diff) {
>              imm12 = sextreg(diff, 0, 12);
> --
> 2.34.1
>
>

