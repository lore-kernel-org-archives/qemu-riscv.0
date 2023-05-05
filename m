Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puvU1-0000gT-JE
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 09:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvU0-0000fw-Hs
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:28:24 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvTo-0001Sn-Qa
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:28:24 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so27131623a12.0
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 06:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683293288; x=1685885288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G1dhCNyDbz/C/k2Zw97YFzuMEVZFBNEZLBtUVP0klfs=;
 b=iTaNlcCZmH66puyNQtP7ho9mqjb5qc0/l+qmppyEuY/Lf35YGwMHFubNi/mZAJOFlt
 OHV9wmux/Oawc6FvxNVILNGN/ScOlqE9fi+xv/11/v0IT4afb23icq3xLantJERuaqI4
 CXVpAzuT80A7URBobIwreaPrvFiQQz0hoTmwTaFbfhsgPS9UdmUsQbR2SxMzWi644w/+
 vEiEXJCmXXIiJhcaPm3R8f+o6l+//MOyZbiUggieLfMsFNr7BXF7Dk6L/8iuWRqgEW0x
 iulIvjrRWw5nLhAaVhT598tEQbE+DHol+YqO+uYjgXPT9ZOS2vEItMJUji2bom9TOLuV
 eKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683293288; x=1685885288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G1dhCNyDbz/C/k2Zw97YFzuMEVZFBNEZLBtUVP0klfs=;
 b=apNnZfn3FZD2FEy5geNizmFbP1vleQppyShiBaOCTO0XRrIwJ7D5nDpV34m+Qm0PsA
 zLQpHu0j0KMKSANuE+E+PEjpHhc8Hga/EbhH75Ezi3AEydVr42aYtXdvGLmYDOIgBFLt
 2jgdd3R2x35AyPKW/HibV6T7XP9m/p7/5GkJtyO2+RwCTnvQKnofStvpf51/ISGJFXlF
 l34lIi0NEO8ZlAjS1V+0tkEBUwWaVmNJLNaXJlxsYdHZMZUPla59Fmn6kW8lf7aoacZ2
 ux6cr9g+1cZC2IWI0MzRXNyBO9gW2Oj5Kf7P/wdsiQjoGrEBPwBIIwZZyoTXvzvjsiDi
 gxpw==
X-Gm-Message-State: AC+VfDzp3kbDtfYK0G3qmpQVNduwYVzGOWqbBqKl3D2K1u+lS9FXHlYe
 Lo/KQ3qd5AHGmoIV7YXvVldsG8QEWoRNkp64QJ+NCw==
X-Google-Smtp-Source: ACHHUZ6Aqy7IQvmH4bSOZGhpcER003QFtFhULrY+2n08ICeGUjAiIF8n5otrWruQm0VdOreVX/6xWQPhXZCmMCe+q6g=
X-Received: by 2002:a05:6402:2794:b0:508:3c23:ae95 with SMTP id
 b20-20020a056402279400b005083c23ae95mr2135595ede.3.1683293288053; Fri, 05 May
 2023 06:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-53-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-53-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:27:57 +0100
Message-ID: <CAFEAcA8XQ2_GFyBCqW4N7p32dvkWe6B21bpHhOf48xHyc_petw@mail.gmail.com>
Subject: Re: [PATCH v4 52/57] tcg/i386: Honor 64-bit atomicity in 32-bit mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 May 2023 13:28:24 -0000

On Wed, 3 May 2023 at 08:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the fpu to perform 64-bit loads and stores.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -2091,7 +2095,20 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
>              datalo = datahi;
>              datahi = t;
>          }
> -        if (h.base == datalo || h.index == datalo) {
> +        if (h.atom == MO_64) {
> +            /*
> +             * Atomicity requires that we use use a single 8-byte load.
> +             * For simplicity and code size, always use the FPU for this.
> +             * Similar insns using SSE/AVX are merely larger.

I'm surprised there's no performance penalty for throwing old-school
FPU insns into what is presumably otherwise code that's only
using modern SSE.

> +             * Load from memory in one go, then store back to the stack,
> +             * from whence we can load into the correct integer regs.
> +             */
> +            tcg_out_modrm_sib_offset(s, OPC_ESCDF + h.seg, ESCDF_FILD_m64,
> +                                     h.base, h.index, 0, h.ofs);
> +            tcg_out_modrm_offset(s, OPC_ESCDF, ESCDF_FISTP_m64, TCG_REG_ESP, 0);
> +            tcg_out_modrm_offset(s, movop, datalo, TCG_REG_ESP, 0);
> +            tcg_out_modrm_offset(s, movop, datahi, TCG_REG_ESP, 4);
> +        } else if (h.base == datalo || h.index == datalo) {
>              tcg_out_modrm_sib_offset(s, OPC_LEA, datahi,
>                                       h.base, h.index, 0, h.ofs);
>              tcg_out_modrm_offset(s, movop + h.seg, datalo, datahi, 0);

I assume the caller has arranged that the top of the stack
is trashable at this point?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

