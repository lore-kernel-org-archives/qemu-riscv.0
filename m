Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWs0z-0005bM-3A
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 19:04:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gWs0w-0005Zp-BW
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 19:04:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gWs0v-0004B7-Ko
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 19:04:34 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:37213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gWs0t-00049r-Pn; Tue, 11 Dec 2018 19:04:31 -0500
Received: by mail-lj1-x244.google.com with SMTP id e5-v6so14669427lja.4;
	Tue, 11 Dec 2018 16:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SaMeLbbURK7Kf+Exr1yVQLBYI6vUostE0BbF8gzYdDE=;
	b=PeeyIvPnRM2ppmV7NI5YBnSoS2mcrFgR+ZcNA/3EwBHBWy/LCaSAX6y0zRCfV/i/4p
	X6e283TpMkFdP/lqF9C39eHA4X7mnVFYBMAdOTM29JW0GfVqSbpiHUP2262VB4816/d1
	OT/qk4H1R+ChdWUNEwxrwnAYdlcvF0OX+G4jaSolRxCja4SzV9HJGyW8xqmwEPrhKZM+
	zCAPMj+aBvWE4lANv9r5pTr2RdWW4j8pTTMxcdHPt+wBSdFdamJGxoGlwkXBr41FDZAt
	ESUpyfqZJh+NCs4PIzhgAjeHlr0iASa/LPTYTlz77Gziyl2+xFPi5ZIeHAlLRhGbJgQK
	VQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SaMeLbbURK7Kf+Exr1yVQLBYI6vUostE0BbF8gzYdDE=;
	b=L+s48MRh0XsZhIvG7NaW2ZCaMz1j5IYA53sLSyyPiRBRv3aS7Dp2CSB7cbPe6Mx89S
	Mr/Lj5jaOJXBYrRsdn481kQxuYHR/JBiDkVWxKJElpmKCoDN8/GIaFJxeI/hr5bFaJpr
	BSml4KkW0+6er+j67xkugCLn9XafKhrkHKZcSCc1ALWkqd67ncWYj3W7yURD3RwXl89m
	SITueG+T68ORQ4tfh/p7iqjk/I9e9pVBefSoN4edDH1nwiQtpPU+b//NEF0kzWZbaFGi
	QK+zhBZIlaDlWhMwaPpmXH27QAgeBycdjHy/THF1ubHOR946tyk4eqhA7qn/nt6T82Pe
	Zqug==
X-Gm-Message-State: AA+aEWYOefgne5r7Zh7NoePPMO+CTnK8bThV6ffw9lhLGe0idflKaYeT
	bWIxkuAPozXowWMULv4EhA8Yu8x4YiHXUSc27XQ=
X-Google-Smtp-Source: AFSGD/XV7uGXkOecD+9cERq8edz9Oy4xjHgvcZEOZ3eP16HnkggtQcXC6hlRUsVJIUCD1VGwVx5tESnZBCghGEy22Qo=
X-Received: by 2002:a2e:131a:: with SMTP id
	26-v6mr11965139ljt.107.1544573069741; 
	Tue, 11 Dec 2018 16:04:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1544229872.git.alistair.francis@wdc.com>
	<c1cbe33881d567ee4712128282e6fcc49a5736b5.1544229872.git.alistair.francis@wdc.com>
	<98465a90-99cc-bce6-8cde-5025a30b3785@linaro.org>
	<042678a6-6837-e272-e4fa-eb0a8f265e6b@linaro.org>
In-Reply-To: <042678a6-6837-e272-e4fa-eb0a8f265e6b@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Dec 2018 16:04:03 -0800
Message-ID: <CAKmqyKNGDCkqL1VzdLBm+dwVx6C9PTUP+amzHfZeqTifC1Ef7A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [RFC v3 19/24] riscv: tcg-target: Add the out op
 decoder
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2018 00:04:35 -0000

On Tue, Dec 11, 2018 at 2:45 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/10/18 11:56 AM, Richard Henderson wrote:
> > On 12/7/18 6:49 PM, Alistair Francis wrote:
> >> +    case INDEX_op_neg_i64:
> >> +        tcg_out_opc_imm(s, OPC_SUB, a0, TCG_REG_ZERO, a1);
> >
> > tcg_out_opc_reg.
> >
> >> +    case INDEX_op_mulsh_i32:
> >> +    case INDEX_op_mulsh_i64:
> >> +        tcg_out_opc_imm(s, OPC_MULH, a0, a1, a2);
> >> +        break;
> >> +
> >> +    case INDEX_op_muluh_i32:
> >> +    case INDEX_op_muluh_i64:
> >> +        tcg_out_opc_imm(s, OPC_MULHU, a0, a1, a2);
> >> +        break;
> >
> > Likewise.
>
> Incidentally, catching these sorts of errors is why tcg/s390 puts the format of
> the insn into the enum.  E.g.
>
> /* Emit an opcode with "type-checking" of the format.  */
> #define tcg_out_insn(S, FMT, OP, ...) \
>     glue(tcg_out_insn_,FMT)(S, glue(glue(FMT,_),OP), ## __VA_ARGS__)
>
>     tcg_out_insn(s, RR, AR, a0, a2);
>     tcg_out_insn(s, RRE, AGR, TCG_TMP0, index);
>
> /* All of the following instructions are prefixed with their instruction
>    format...  */
> typedef enum S390Opcode {
>     ...
>     RR_AR       = 0x1a,
>     RRE_AGR     = 0xb908,

That is really cool.

>
>
> I do something similar for tcg/aarch64, although that's more complicated due to
> the wide variety of formats.
>
> Whether you go back and retro-fit this scheme to your existing patch set is up
> to you.  But I think it could be worthwhile.

It looks like I'm ready to send a patch series (instead of an RFC) so
I might leave it for now. There are a range of improvements we can
work on in the future, this can be yet another one.

Alistair

>
>
> r~

