Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjXAS-0006jb-Da
	for mharc-qemu-riscv@gnu.org; Tue, 15 Jan 2019 17:26:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gjXAQ-0006hw-D2
	for qemu-riscv@nongnu.org; Tue, 15 Jan 2019 17:26:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gjXAO-0003Fj-Qz
	for qemu-riscv@nongnu.org; Tue, 15 Jan 2019 17:26:42 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:36356)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gjX9y-0002zG-O9; Tue, 15 Jan 2019 17:26:16 -0500
Received: by mail-lj1-x243.google.com with SMTP id g11-v6so3778770ljk.3;
	Tue, 15 Jan 2019 14:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8IIZLuGrm+rzdxMdUD6LynG/OF6LhNWcu4O/PHL2NVs=;
	b=GDoYhWDFB8TlZ/rZdcQOhDsachiUcV/xxcQwwwaR/I6pWhoMowdlPLtG2UIx/lw7mB
	bKA/9AiKmLNPwNE4SPJLwC7fk8obGfYHJxX7NLggXTNMhyIylXwtm9pmXSdS5ebEg4to
	spVmVoRqBVSTCiot6qf5+8BL+5OqN6gLRxB9vq3rR/oQyp2fW2iLKcRXgJjfNTjZgUHr
	EnVLh3ws4eLjnYp5kvcw7+Z/RxKErFRUyiUXYQvWcP+SZIffKFvez//4y3ELPPQLeAhU
	fdBHjJh0t6LtohrsVrfhzPYtmI2GM+/YxDMjbXXg/6sLKupVE82Jj3wH+fvotV54mljI
	qodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8IIZLuGrm+rzdxMdUD6LynG/OF6LhNWcu4O/PHL2NVs=;
	b=ooanLLN/PZsDrNL3yjOjQAvktOJmOH1e89IZa4I4q+PbwWFrOKEY7xWkKwAgiQsUkA
	2KFLh/eAvvxnXEcg+2GSBiKT4oquq2nRLX1H+HhwracJfPiFU8fxvEWD/V1pi+A9saCO
	qBryXYa0ZAh67wsCtMmglBjD/tTKtUKHjjCHk/97WanqBWa/0OWPJGke5GwpUFB1zBH7
	cP0Mlde1UmzQVMZR2vhRPVJu2hxwcDgV0qIVAtWi2FaYXbj1O20UrHSVuOPVXnnJIYXr
	cDXb0ZIgSASVI5hJoScR54/8mxxtDNs2V3GmuRhOPQ+UfNJQqv4u23UUP3lAfG1fVlFq
	gCPA==
X-Gm-Message-State: AJcUukcAB900pmhunTan6bE9LXhjN4uYT6MJ+8/R/T0w2kXlOCtO8Z1X
	joEcxFxNnLdIa+anNresB0Fup5z6VM2dZIjvYS0=
X-Google-Smtp-Source: ALg8bN6NfDNKcDjKwk2ISyVcL++ylvaMgNLDTdOhOAjqgOKk7wnuezs0B3lRqarSMVHpiTdh34YECY/ecB/DK1S8ZTE=
X-Received: by 2002:a2e:131a:: with SMTP id
	26-v6mr4474001ljt.107.1547591171756; 
	Tue, 15 Jan 2019 14:26:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547510220.git.alistair.francis@wdc.com>
	<b17f45cb9053318f20ca2a5b2167afa96c1f933a.1547510220.git.alistair.francis@wdc.com>
	<62009a7b-877b-9c7d-7844-4eaa1930e9ff@linaro.org>
In-Reply-To: <62009a7b-877b-9c7d-7844-4eaa1930e9ff@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Jan 2019 14:25:44 -0800
Message-ID: <CAKmqyKOgQLX3Feh=g2ytdiSbFaedWdExpVVjMt6v+SUqxRYhzQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 5/8] RISC-V: Add priv_ver
 to DisasContext
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
X-List-Received-Date: Tue, 15 Jan 2019 22:26:43 -0000

On Tue, Jan 15, 2019 at 2:24 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/15/19 10:58 AM, Alistair Francis wrote:
> > -static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
> > +static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
>
> Why change this?  I know there is variation in the naming, but my
> preferred default mapping is CPUState *cs, RISCVCPU *cpu.

Good point, I have changed it back to cs.

Alistair

>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~

