Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puvMo-0003ds-9O
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 09:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvMh-0003Zl-Rw
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:20:53 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvMe-0006yc-U1
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:20:51 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc34b98edso2703541a12.3
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292848; x=1685884848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wOfsIYmGehy/PrmqaBmIeEzKTK4/WjPNoIZKiJF5Ryo=;
 b=TLrLp/BC2oyO/HPI0ycmB0htMiW2MXTqxSzvSVlYHeI6toMTWO+xke02S/R7TunZ10
 PCuQ3R89MvogknYuM/NsGF4hMNlia2k8GQodnCvisgTzAsPAX6oUmPXVA6e8YOL4UKTr
 a7M5DEtNecbyG2jiY4WUwhExw3K5OYhjlxr/QHGNaXmhFOiO0xYZDrG22VYREy6V96p2
 gnFt0Hcq2U/NEZiayjoVSl1QBdfdWhyYSLM9EStd9ycVk/91WFYxyZhV0Ot/hU///k9r
 qNQf9fY2ckhES3wCJmomHpATCk8MsQo+lfD1TTqP8/KvM3N/U679i4qyqsuG+lSY8lSG
 BG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292848; x=1685884848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wOfsIYmGehy/PrmqaBmIeEzKTK4/WjPNoIZKiJF5Ryo=;
 b=F0D3VORrykE3Q2fjEAEnkskQTfikH1ifOf6D2TM74f6R8FJs/nWnOQXLiPU6JtK41Y
 8NCl8Al0J1Hh6HTFe+7fBCgqtPnIwLDBp+sTEPER8XWEE49ucR5N9ojG1eRUhWjYNFaY
 lAZezWjTezCWtzC2u+WjeqZ1YNOf/I+mTWMG3RtsV/G7ts9QvIaamriRWQgN5gxRrkZK
 nE96OUcirhdWf7EGGqrwHha/vW0+t0ybbm6RsdqSk0SFpovPEPU9VfiZ9GDFcKlA1wvO
 ARlI3kJEEwdguJQB1NiIfSgBJIZr7mkZ48kbU7fyyOhGOeJdBTM+7OU66Fbn2+VIZEAa
 W8kg==
X-Gm-Message-State: AC+VfDwx6f2tUOzijoNXt4UNTyC57p2hF+ZH2/WEhB6gQYamArcKC6kr
 C+GmPtqRC+XejuwpHzk/gfFvoslNkFhVh99+sT/26A==
X-Google-Smtp-Source: ACHHUZ6Rqqpskuzb/F3uiX74cU6bnhROvEqLAs5P5shhn/hHScfyYe/jRSC2w9woxzL1mctpR/f1WlQbTTSf/GO/2/8=
X-Received: by 2002:aa7:d71a:0:b0:506:6008:995f with SMTP id
 t26-20020aa7d71a000000b005066008995fmr1390243edq.39.1683292847994; Fri, 05
 May 2023 06:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-52-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-52-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:20:37 +0100
Message-ID: <CAFEAcA-HNQinkZvwCrqg9OQZcQvoL+LeBgfFhHqvWorjye0Xfg@mail.gmail.com>
Subject: Re: [PATCH v4 51/57] tcg/sparc64: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 May 2023 13:20:53 -0000

On Wed, 3 May 2023 at 08:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> index bb23038529..4f9ec02b1f 100644
> --- a/tcg/sparc64/tcg-target.c.inc
> +++ b/tcg/sparc64/tcg-target.c.inc
> @@ -1028,11 +1028,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>  {
>      TCGLabelQemuLdst *ldst = NULL;
>      MemOp opc = get_memop(oi);
> -    unsigned a_bits = get_alignment_bits(opc);
> -    unsigned s_bits = opc & MO_SIZE;
> +    MemOp s_bits = opc & MO_SIZE;
> +    MemOp a_bits, atom_a, atom_u;
>      unsigned a_mask;
>
>      /* We don't support unaligned accesses. */
> +    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
> +                                    MO_ATOM_IFALIGN, false);
>      a_bits = MAX(a_bits, s_bits);
>      a_mask = (1u << a_bits) - 1;
>
> --

No changes to HostAddress struct again?

-- PMM

