Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puvLc-0002Om-C8
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 09:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvLa-0002NO-GA
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:19:42 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvLY-0006YB-L3
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:19:42 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50be0d835aaso3162997a12.3
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292779; x=1685884779;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IWhwwDCtf+VduCmmkFbrok/9YoNQdtaI1hIhqRrOGL8=;
 b=mWlq+eY+fiBn3jk1dItTl7M9TBZXz8oMpH3djM5UzGeb0PmrrXma+asnjS1PSlmian
 zegEozo8MadHSWWFbzJTLE60ZE2r531oc1mXOBFhKycbpodo9OX2xYGPpjbXPzRCBL6v
 aGDY6nN7xPCaM9B1lr8o7viaaIMbcC++xewl351ijOuaeX7ICWMcAbVrQ/8N3IP7AxNl
 ew0SeKP5gGlKyUNDpAODVOmYzxfmRCOHEpvMn9LqiE8f3Hv4mo5TLB2TztwxknbHJ7kU
 3uahKXvPt/8Am+wUHdL8H4GeO9bB575oiV0jAIJIePim1MvHhlx5LIAukJlg5hHI9zVT
 7IhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292779; x=1685884779;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IWhwwDCtf+VduCmmkFbrok/9YoNQdtaI1hIhqRrOGL8=;
 b=lPaEGmtDBSHs/9IeUosEkTEdVEBJiQdxMmqXeJQgJ6eU28wAU8z+/ROYM2QbASMW81
 YCNw+z5bZ1D4R9eEAZxnalrceJvKSL/B367DnWEbK3e2UEELXmtsTAQDl/uX6Py+Ju8T
 G+sln4YWYiG/vWjk5aduFr9Oik3SBc0dab3K+hqYBTP43sAPZ2dYJM4Fyu2pK9xY4Ef8
 TEE4zbxGN56fir6RkIuI9ZGQAKPJ1Tl8jHRP0rYc32Hc7/y0hn+K5f/YCU8E85n3XTkH
 rwtLGgpOefx9MxM4NKOZOSYRkCTs+aMXK4j7WujUo7tn6AMwBSgkFz9IlG0nI0g/kLJw
 DlMg==
X-Gm-Message-State: AC+VfDyVmODrkLck13WsN55QkoogJAgbHUqaozhbAJoc4bIiIbw5BwL+
 KCxzzCGdrSGKyEfnNauWTM2pxZY1rDDIv7zbvi2I9A==
X-Google-Smtp-Source: ACHHUZ5oHq9oweS9AEs0s7xunR14rb3lGHIZBeAfQTFs3ELRt1LKKp8tT7AgkE8P+WRrTaq9YIU/YGfIYnlf6KidJ20=
X-Received: by 2002:a05:6402:2145:b0:50b:f999:9dee with SMTP id
 bq5-20020a056402214500b0050bf9999deemr1473774edb.8.1683292779001; Fri, 05 May
 2023 06:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-50-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-50-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:19:28 +0100
Message-ID: <CAFEAcA9PQ2YpJLZsJZoZ516r3XCsii2zeRi+OPgGc_OOwNu1qA@mail.gmail.com>
Subject: Re: [PATCH v4 49/57] tcg/riscv: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-List-Received-Date: Fri, 05 May 2023 13:19:42 -0000

On Wed, 3 May 2023 at 08:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/riscv/tcg-target.c.inc | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 37870c89fc..4dd33c73e8 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -910,8 +910,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
>  {
>      TCGLabelQemuLdst *ldst = NULL;
>      MemOp opc = get_memop(oi);
> -    unsigned a_bits = get_alignment_bits(opc);
> -    unsigned a_mask = (1u << a_bits) - 1;
> +    MemOp a_bits, atom_a, atom_u;
> +    unsigned a_mask;
> +
> +    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
> +                                    MO_ATOM_IFALIGN, false);
> +    a_mask = (1u << a_bits) - 1;
>
>  #ifdef CONFIG_SOFTMMU
>      unsigned s_bits = opc & MO_SIZE;

Same remark as for ppc.

-- PMM

