Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BB0606A32E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vrull.eu header.i=@vrull.eu header.a=rsa-sha256 header.s=google header.b=eUaKOCpU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVZ6j-00072A-TV; Mon, 23 Nov 2026 13:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1xVZ6e-00070u-37
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 13:49:36 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1xVZ6c-0006FE-2c
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 13:49:35 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6b8791443e0so299630a12.0
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 10:49:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459772; cv=none;
 d=google.com; s=arc-20260327;
 b=lcdn/hMWn71JRGqIc38bzZwpzhw/TcZ3HY7IswQpfgwszIda7oM5FsrUdD7I9UUh0r
 syn9mh9Zo2WbgtdScE0T7U0WLakW4MsLA1liEgwOr9z4vjllh52dnQgxnswMxqs4fijh
 zYtAqFH+sWfVzQiMZr33AGVOgGt5CYExiEyZHcRuzKKzrCqxtHptxZlingbpFveOuCAy
 aTEPytvN9yZV0G8UgBcHV77oJgAf99krwjaNLaCPSCW/2C70lPWfO7oFBDHYGZMuOets
 qyj+W0Tl0gafGdUHshi10wOX4ZvxF4TcZcXk+cRjwkVyoJ1PMo7StUWd2bpuoBGqlISh
 0IPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=pKHDD/HZlxxxAETWiEUVzrMeDP/1kL0olM4Cf7lrTew=;
 fh=+G0SfhKFOreL6LshUrZDVUm/NSEAXC3XcfMcqC4c/vc=;
 b=lp7/S1imnNLEAiIse9ndvsyEQVTmFUeDH4nzr5ORLBAUnfGzgn1Nhgb4VBC+QpsBfh
 wbo4hHAW1JAUEbXgwg3IpqdoTgc0uhZeof9wgaqbp7q6vbWvPeyr7+SYwMbrEew8acPL
 MNkh9794W3aYmY6YP1WFPdWG4zOwG3piIgJ+u3+9L9Cmv5iPdycE/eksNN7lY5AIe1th
 4JowgzR/BNPmDWN6foy+ryj7ejV3YsAaSnHQqYh5OlPBus2ECplRNYW7BtMQUvAXILVT
 EPU+8rlhex1hZjaFfiwTlEBHLCed0SmzcZi08khbmKeo/7ZzjBCmERBnWF9bDgLt68yH
 fdhQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1795459772; x=1796064572; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pKHDD/HZlxxxAETWiEUVzrMeDP/1kL0olM4Cf7lrTew=;
 b=eUaKOCpU/bT5ep/aKlOiGQFQUXMnAbkUBIrJPwjb4E4z5d08AWB9Xn9q/Wh29ZgBmI
 rnTRhHaQgvH5UJXXHKSIK0FR3lt/Tnkrva+4NtWJCUOOfhHe4Qqh+P0i0Ti4VMEUwDwx
 NwoP6UKHG+sRYe7S+ikP5EiXoSpRm7zDYpzOumc843ZRR7T2Ji0+Fm9qQYl5mK6/HZKr
 +cKuHW+Z6n6i0Ex+XRqTzLp7OY2sLf1R2hYqV8S7TWqSLM6qwUDHJdw1vlsYYoC5+UJi
 wHh74B93DxjT4Nwb31YZwfCJtDzfFi+kErWAJ4kC4SDRFtUgNHuLhIYV465bcH0x739f
 5CxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795459772; x=1796064572;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=pKHDD/HZlxxxAETWiEUVzrMeDP/1kL0olM4Cf7lrTew=;
 b=zdUUsMHcdMc58US6mqILQNq+I2+rPSINYklxUDGpdYrC7Ur8KAZBBg3VjBSvv/wD/u
 SFSG+0Mc4jrcdDiM3V2cENJ1UE1EJOs7BQpZ++sebFJDb+ZV5bqIYF8FhK910qmWuqXs
 aYWJ9xxxXdTAEeBsCZlUCzeomiMNipZQhkLa+vv0DfRpgB5e+G6WJzu3vzy3CQMC2FB8
 Y4gIWEJZ2pD2uwu0DyuAB9OwBGq55G26JQRUapPKgByjzJb8jpjDTfodVJaT6itsZdl4
 wkIzOL4D8gpsoqtH4yYU7gNhKaW54IGhW76RsH7DDkOzeszOvrCaXltFPwuuHst8lOuL
 rwnw==
X-Forwarded-Encrypted: i=1;
 AL+hErF2mxU9nDkuUIxvi060LN9Yl2K80fgxkDO6yb1qyugc5WrnX6AOiHUoygoYEuTbxWRWBY+/+EhkMxIq@nongnu.org
X-Gm-Message-State: APuU4Z+gFBwwVABxBqtsQnD1GG69BdC0ioGc/ZqvvCkBkn4eJ61fdHMk
 AJqfxqM29XUxVbtZpkBfQvUYEA9iJRG4L2/hPjpidYc+XJ2B9VZGm8Ycb+7Wzni31IfXv1H631j
 uylACfZtaEkEiYLFu+hMPtwbRwZgh20Hed+7swxSMWg==
X-Gm-Gg: AZFdTZeff9+SGi5sDtbGkutVv1I2lZaOWyh27F9Qa9ncpisD7Du+9ZvaTupjZJlX85w
 yIt7jHQnXn+AE0muSFEyPbtUspnbNE/jaBcSpzacLUAKm2X5W53739TSAlMlfGeszM5iVRa5exi
 tEYDvRpzKa5dt7FxEjtPZrj1hMxuJGAgFIwmol1rrKgU/xQqRYr8aweVbsjFz55D2/k0tzzrvDW
 9zCdqxZlL634NN3ajuNDauM2/qhWfgEE9wu7oTLI9WvKCBTz4UaqZs3wqs42Rfuw0+CoNZGNS2d
 imx9dSWFoxDY+BnMJath6w22ZTON9xseW3Ji/NPBUe5K1xa1fwvjBAs924KiP46dMZSJApcaqIC
 DXe9rIF1h0etE7jx/5MZefDpoOiDS207nMeO+uVKb3CY/VpVNsxpOElAZEAJH6TEoHuvc9KNK47
 Ha1kFAeB8si+tebA==
X-Received: by 2002:a17:906:6042:b0:c3f:98d4:dfda with SMTP id
 a640c23a62f3a-c513a5f04b2mr953179766b.3.1795459772424; Mon, 23 Nov 2026
 10:49:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-zl-master-v1-0-129f85e0f887@linux.alibaba.com>
 <20261118-zl-master-v1-2-129f85e0f887@linux.alibaba.com>
In-Reply-To: <20261118-zl-master-v1-2-129f85e0f887@linux.alibaba.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 23 Nov 2026 19:49:20 +0100
X-Gm-Features: Aa3M54qNa3prc_sQ1Gd7uYa_ZcR-5b3_ethxMj1Df-x6bgvqBysltt2D-q8HWIg
Message-ID: <CAAeLtUDcgjSJWKBzMeKMF2Ji1A71Cnv6EqMdMky-My9z-Azc0Q@mail.gmail.com>
Subject: Re: [PATCH RFC 2/8] target/riscv: Share instruction length helper
To: TANG Tiancheng <lyndra@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 at 10:03, TANG Tiancheng <lyndra@linux.alibaba.com> wrote:
>
> The translator and built-in disassembler duplicate the 16/32-bit length
> rule. Move it into a shared header.
>
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> ---
>  disas/riscv.c              |  9 ++-------
>  target/riscv/insn_length.h | 12 ++++++++++++
>  target/riscv/internals.h   |  6 +-----
>  3 files changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index eb4851b4cd4b14a43cc6592bd5011c6df53ec219..8c9e06b46f19efd6aa9f605ccd0bf3716fa62d44 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -21,6 +21,7 @@
>  #include "qemu/bitops.h"
>  #include "disas/dis-asm.h"
>  #include "target/riscv/cpu_cfg.h"
> +#include "target/riscv/insn_length.h"
>  #include "disas/riscv.h"
>
>  /* Vendor extensions */
> @@ -3170,12 +3171,6 @@ static bool check_constraints(rv_decode *dec, const rvc_constraint *c)
>      return true;
>  }
>
> -/* Same as insn_len() from target/riscv/internals.h */
> -static size_t inst_length(rv_inst inst)
> -{
> -    return (inst & 3) == 3 ? 4 : 2;
> -}
> -
>  /* format instruction */
>
>  static GString *format_inst(size_t tab, rv_decode *dec,
> @@ -3515,7 +3510,7 @@ print_insn_riscv(bfd_vma memaddr, struct disassemble_info *info, rv_isa isa)
>          }
>          inst |= ((rv_inst) bfd_getl16(packet)) << (8 * n);
>          if (n == 0) {
> -            len = inst_length(inst);
> +            len = insn_len(inst);
>          }
>      }
>
> diff --git a/target/riscv/insn_length.h b/target/riscv/insn_length.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..bfb3af0e6358249daf464fed670f09d7184d307b
> --- /dev/null
> +++ b/target/riscv/insn_length.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* RISC-V instruction length classification. */
> +
> +#ifndef TARGET_RISCV_INSN_LENGTH_H
> +#define TARGET_RISCV_INSN_LENGTH_H
> +
> +static inline int insn_len(uint16_t first_word)

Now that this lives in a header that disas/ includes, a riscv_ prefix
(riscv_insn_len) would match the helpers added in 4/8.


> +{
> +    return (first_word & 3) == 3 ? 4 : 2;
> +}
> +
> +#endif
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 5466879a4aa541db8d6753c7e1eec8f3128a99c8..2d48abeef5dea2cb9d0e97852495fed75d670ae1 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -23,6 +23,7 @@
>  #include "hw/core/registerfields.h"
>  #include "fpu/softfloat-types.h"
>  #include "target/riscv/cpu_bits.h"
> +#include "target/riscv/insn_length.h"
>
>  /*
>   * The current MMU Modes are:
> @@ -259,11 +260,6 @@ static inline target_ulong adjust_addr_virt(CPURISCVState *env,
>      return adjust_addr_body(env, addr, true);
>  }
>
> -static inline int insn_len(uint16_t first_word)
> -{
> -    return (first_word & 3) == 3 ? 4 : 2;
> -}
> -
>  int riscv_monitor_get_register_legacy(CPUState *cs, const char *name,
>                                        int64_t *pval);
>
>
> --
> 2.43.0
>
>

