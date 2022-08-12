Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMUbJ-0001iR-7j
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 09:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMUbE-0001eQ-DX
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 09:21:16 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:43683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMUbC-00032u-Ri
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 09:21:16 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-328303afa6eso9602797b3.10
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xbMc+4ywE8v9x8fj8VxK87gIYSlFPEqmDqeh0q1o+KE=;
 b=fYOU4O9tqCdi0UlFd0QkXiLqRo0w/XwVoiXxwxS+HR+I5Wmzck1wiigJGoVzDOlWPR
 9zTCI1GiWz29y5Sf/Fs5QF+U8WaAuUEkx0Ufo/ZOW8pVaIaxb0f9qehbTDzfF0fh3s/S
 /kP15r6JhKoSEHceVxXlvRR8Qhn4hgfwoAKJ2lJnIwv1gIyBsTgp2wm7poJjSUJRqlCl
 IyyRDvzOZLHcuIT7z8FcKc2eOB0evnZcqQ8m6hFAIZ3zQKStNhaw4wfFSWZRAhTwK2V+
 NpKAwXZPpW+aryR42J+NWIEHJSroUA6Tr1i4pBkInlPU+Za+ZsnwSdwF3U0duyRL83ea
 xwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xbMc+4ywE8v9x8fj8VxK87gIYSlFPEqmDqeh0q1o+KE=;
 b=E9vqhQeSm4ff7X7timA1cBgDlLR4ppfiLom6bVoOp6Slwuka0Pr9XFQpnDM6BxnVl2
 bYXcR1qvK2/vo/8WfcDR8YDpt4Zv5I0jHna5Exssp7TWrs96OLm5M8K7VUX5ptm9QNlk
 1W83iPZ/VgFfctJ9YtXqRSjQGZ+Izu0hE+7XrQzUEz+9GMLInPgc9c+nRWQiW4eVIb6E
 kuNshcXtgg1TTPw5dHZlJZv43IddWErkXUrCWjkcyjWxM5Qrauuan3XmjoBvlevzOgif
 QvOX8vYlVZ+gc52K4s/VWNVDfAFWKgWRtF1HWTPTtaVeSkIyWOtZIW5raSKS/KpgZB9E
 u2vA==
X-Gm-Message-State: ACgBeo0ZNv5WBjBYqC7ckVDosx2BMMXQ/OBGwA8x4fgPNtFC09mYlLr8
 XqjNAJkgaNXJ2LkoVITPzIKToNVendjd/JfWSq6gOA==
X-Google-Smtp-Source: AA6agR4Vwmohq4RMzXEeLXR9ZP+Re6iFjq2/Y8JciEvzMpd3x88XgSg8cdkTR7rmlh1/oX52JqfHrVVWBnbdsV0Uv+w=
X-Received: by 2002:a81:13c5:0:b0:32a:8e40:d469 with SMTP id
 188-20020a8113c5000000b0032a8e40d469mr3939695ywt.64.1660310473715; Fri, 12
 Aug 2022 06:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
 <20220812131304.1674484-2-philipp.tomsich@vrull.eu>
In-Reply-To: <20220812131304.1674484-2-philipp.tomsich@vrull.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 14:21:02 +0100
Message-ID: <CAFEAcA9tQDu_4N+6QKhX66R5PtddXWkL-zmn1vDTDdQceCtHdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: fence: reconcile with specification
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 12 Aug 2022 13:21:17 -0000

On Fri, 12 Aug 2022 at 14:17, Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> Our decoding of fence-instructions is problematic in respect to the
> RISC-V ISA specification:
> - rs and rd are ignored, but need to be 0
> - fm is ignored
>
> This change adjusts the decode pattern to enfore rs and rd being 0,
> and validates the fm-field (together with pred/succ for FENCE.TSO) to
> determine whether a reserved instruction is specified.
>
> While the specification allows UNSPECIFIED behaviour for reserved
> instructions, we now always raise an illegal instruction exception.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
>
> ---
>
>  target/riscv/insn32.decode              |  2 +-
>  target/riscv/insn_trans/trans_rvi.c.inc | 19 ++++++++++++++++++-
>  2 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 089128c3dc..4e53df1b62 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -150,7 +150,7 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
>  sra      0100000 .....    ..... 101 ..... 0110011 @r
>  or       0000000 .....    ..... 110 ..... 0110011 @r
>  and      0000000 .....    ..... 111 ..... 0110011 @r
> -fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> +fence    fm:4 pred:4 succ:4 00000 000 00000 0001111
>  fence_i  000000000000     00000 001 00000 0001111
>  csrrw    ............     ..... 001 ..... 1110011 @csr
>  csrrs    ............     ..... 010 ..... 1110011 @csr
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index ca8e3d1ea1..515bb3b22a 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -795,7 +795,24 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
>
>  static bool trans_fence(DisasContext *ctx, arg_fence *a)
>  {
> -    /* FENCE is a full memory barrier. */
> +    switch (a->fm) {
> +    case 0b0000:
> +         /* normal fence */
> +         break;
> +
> +    case 0b0001:
> +         /* FENCE.TSO requires PRED and SUCC to be RW */
> +         if (a->pred != 0xb0011 || a->succ != 0b0011) {
> +            return false;
> +         }
> +         break;
> +
> +    default:
> +        /* reserved for future use */
> +        return false;
> +    }

I think it would be neater to do this decode in the
.decode file, rather than by hand in the trans function.

thanks
-- PMM

