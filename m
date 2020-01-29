Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iwpjW-0007VC-DV
	for mharc-qemu-riscv@gnu.org; Wed, 29 Jan 2020 10:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56802)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iwpjS-0007RO-VD
 for qemu-riscv@nongnu.org; Wed, 29 Jan 2020 10:58:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iwpjR-0005XP-Ej
 for qemu-riscv@nongnu.org; Wed, 29 Jan 2020 10:58:22 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33664)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iwpjR-0005Ux-7B
 for qemu-riscv@nongnu.org; Wed, 29 Jan 2020 10:58:21 -0500
Received: by mail-oi1-x244.google.com with SMTP id q81so221479oig.0
 for <qemu-riscv@nongnu.org>; Wed, 29 Jan 2020 07:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xREOXbAGrSczc9ttMRDemdVlY/CguXIIJAyyD1SVFlw=;
 b=XlqQa1Yjr0duEQyBW2haJk6+mOeD8eQofvemgcB+Qhw20fvWz6pSZuCfaZsk4lc5gM
 sLXXk/X1ZnhajFsyllCBOmbChvU5z2gn5wSLIDkGDZPj9aC0Py6nIQ6Xg23hoWspIxXZ
 CMFw+2kTFc3yxgD1dj8xK/WTRZEwbyC4FlraHBa57P+nSRMb6wm2kTZouf9JL57NWAds
 CUAdLYSNzSLo7NpK5jCCyyK5Mff+G/LY0QvvL1fuDfKbVVwlJh0j4rvCWi/lvs1xHr96
 aDUFgKPQ5U5u+eUuMDzOMT2eCpEMLKd22PGDkeGmlNKEGsoFKx6e4aDIa142i8GSXIOR
 40dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xREOXbAGrSczc9ttMRDemdVlY/CguXIIJAyyD1SVFlw=;
 b=RiqdtoOfCDim19lZmhDofUQ9Wn5TorTEtnG8zobVwSXRAUtvqoMkET1DjiwRo4dMdI
 TkOcGnEn0DlAwXoWdWlQnhapalJcTd49RZ7jNwjAR6qzSRntO07EcQWjIMKXRvqWmMT4
 SNadFZv1jauVf+DQfKIHtY16nLo2KBflbWGG5nSiTOwyZ4yHlJPNNF/f+MW/t8b1SSJS
 DEsDc5Q/OaUR+gJVmEJ8Gx9pEem4ndwkEOFeHxZtm0szMu2oXIlgkqDRZBOSKf2wNmP6
 3UgGZCBS+c/xMn07q9lmHDsMJOV9oG3gnYTEs0ShYUIxyiA3fgnQTCeubck91S+3wShb
 G7vw==
X-Gm-Message-State: APjAAAV7Vxa3zxNyD36mQn0yDInqJZ/ZKQ842wmo+vw52U0R8aoDyFVf
 QJdp2ggUU3o8q53XRV8hfasNDZSo1kp/YGFpRWy1/A==
X-Google-Smtp-Source: APXvYqxSjyTd1sHx3dlk1l6GRSfjlxkNfWlrrMceTItGFra1TSow2LVhKIOsGji21CA/xnORfFnq7aTz4lyh8dRubbs=
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr6887740oif.163.1580313499976; 
 Wed, 29 Jan 2020 07:58:19 -0800 (PST)
MIME-Version: 1.0
References: <20200128233224.515233-1-keithp@keithp.com>
In-Reply-To: <20200128233224.515233-1-keithp@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Jan 2020 15:58:08 +0000
Message-ID: <CAFEAcA_dD3eAfKvOGOoXe3NWKg1PiW8=s2Xk41w19Tk67R-R4A@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add semihosting support [v4]
To: Keith Packard <keithp@keithp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>, 
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-List-Received-Date: Wed, 29 Jan 2020 15:58:24 -0000

On Tue, 28 Jan 2020 at 23:34, Keith Packard via <qemu-devel@nongnu.org> wrote:
>
> Adapt the arm semihosting support code for RISCV. This implementation
> is based on the standard for RISC-V semihosting as documented in
>
>         https://riscv.org/specifications/
>
> Signed-off-by: Keith Packard <keithp@keithp.com>
>
> ---

> + *  ARM Semihosting is documented in:
> + *     Semihosting for AArch32 and AArch64 Release 2.0
> + *     https://static.docs.arm.com/100863/0200/semihosting.pdf

True but irrelevant. You need to refer to a proper
risc-v specification for your semihosting.

> +    case TARGET_SYS_EXIT:
> +    case TARGET_SYS_EXIT_EXTENDED:
> +        if (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 0) {
> +            /*
> +             * The A64 version of SYS_EXIT takes a parameter block,
> +             * so the application-exit type can return a subcode which
> +             * is the exit status code from the application.
> +             * SYS_EXIT_EXTENDED is an a new-in-v2.0 optional function
> +             * which allows A32/T32 guests to also provide a status code.
> +             */

This code and comment describe Arm semihosting, where we
made this bad decision about the API for 32-bit Arm, fixed
it for 64-bit Arm and then put in an extension to add the more
sensible API to 32-bit as a backwards-compatible new function.
Nobody else should make this API choice from the start.
What does RISC-V want to do here? This should be in
your specification.

> +            GET_ARG(0);
> +            GET_ARG(1);
> +
> +            if (arg0 == ADP_Stopped_ApplicationExit) {
> +                ret = arg1;
> +            } else {
> +                ret = 1;
> +            }
> +        } else {
> +            /*
> +             * The A32/T32 version of SYS_EXIT specifies only
> +             * Stopped_ApplicationExit as normal exit, but does not
> +             * allow the guest to specify the exit status code.
> +             * Everything else is considered an error.
> +             */
> +            ret = (args == ADP_Stopped_ApplicationExit) ? 0 : 1;
> +        }
> +        gdb_exit(env, ret);
> +        exit(ret);
> +    case TARGET_SYS_SYNCCACHE:
> +        /*
> +         * Clean the D-cache and invalidate the I-cache for the specified
> +         * virtual address range. This is a nop for us since we don't
> +         * implement caches. This is only present on A64.
> +         */
> +        if (sizeof(target_ulong) == 8) {
> +            return 0;
> +        }
> +        /* fall through -- invalid for A32/T32 */

Again, this is an Arm-ism, where the old A32 ABI
doesn't have this function but the new A64 one does. What
does RISC-V want to specify here?

> +    default:
> +        fprintf(stderr, "qemu: Unsupported SemiHosting SWI 0x%02x\n", nr);
> +        cpu_dump_state(cs, stderr, 0);
> +        abort();

This is repeating the Arm ABI mistake of allowing implementations
to just crash and burn if they're handed a function call they don't
recognize. Ideally it should be avoided in a new ABI.

> +    }
> +}

thanks
-- PMM

