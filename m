Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gl1r5-0000tP-Qq
	for mharc-qemu-riscv@gnu.org; Sat, 19 Jan 2019 20:24:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gl1r4-0000tD-3t
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 20:24:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gl1r3-00048e-Io
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 20:24:54 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39125)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gl1r3-000484-9m
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 20:24:53 -0500
Received: by mail-pg1-x541.google.com with SMTP id w6so7841680pgl.6
	for <qemu-riscv@nongnu.org>; Sat, 19 Jan 2019 17:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=v2PzXoo1eN4rgMSRgkD3HQdOBxuXDpndz+HqopHibH4=;
	b=eP/r9c2DyrBRS8IX//1PMeZF4+DPrx/8UEMCyGWDoCFSMpbVjaS9UEWeBuvvjd5TWM
	FlhFlZwDswFHKikeac6AGPJuCOXSQlbkCTg7yQIxHmBJYnBciXOpd5W+XhLxV7Dx/ki4
	0lxk0RAAhK2QKKN8Hg6hMOS68o0yGSFvz22Vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=v2PzXoo1eN4rgMSRgkD3HQdOBxuXDpndz+HqopHibH4=;
	b=D+0SsvKk6GEgDm4Wni1KA2wBTYS4WWqKsPkDXEW0C/qLfGrTVAaVoq/XJWIwJ8RvSf
	E9jG+rDxpbGtOE2onbN8rI4aAcUItk333BWK4Xr4LjhCgSXaPkD+hz92+r1lY3P7hcyO
	kQOOhvvHh3vtEGCUIGvEBfLJxCx9zTKXclygFAS74/Lexa+PtfXrEKnMlt/1DrBotYa2
	AaF00LNYti12pSYY7+re3nQlznDlGffggUFAjDwzUOt1Gwtlhe4+5STnlorB2K3Cj2wD
	1lnhc9eiLUKh73bhrEp+S4QwLbkvcIzFO0z+vj8RBTiMk+8p20YzV76sLzUUwiumcVut
	yrEQ==
X-Gm-Message-State: AJcUukd0N6IQIHmRMV+wfwxi9yiGf4O2pBOdW0XWQxsTByT06StPXJIj
	EDUzdmMeQ6azt/JKAltvWgB3Sg==
X-Google-Smtp-Source: ALg8bN5aHHPh7RQCecW8KFmyOLb+QUx0otfiCUANg5XuvH/f2qPW1+bxhl2ge2jQjJG7ZNrpPpk+Ew==
X-Received: by 2002:a63:85c6:: with SMTP id
	u189mr22521135pgd.156.1547947491627; 
	Sat, 19 Jan 2019 17:24:51 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.gmail.com with ESMTPSA id
	z191sm10727573pgd.74.2019.01.19.17.24.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jan 2019 17:24:50 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
	<20190118131456.32451-25-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <50d95ed2-d8a4-0a05-f67c-0c18b5e87a33@linaro.org>
Date: Sun, 20 Jan 2019 12:24:44 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190118131456.32451-25-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [PATCH v4 24/35] target/riscv: Move
 gen_arith_imm() decoding into trans_* functions
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
X-List-Received-Date: Sun, 20 Jan 2019 01:24:54 -0000

On 1/19/19 12:14 AM, Bastian Koppelmann wrote:
>  static bool trans_slli(DisasContext *ctx, arg_slli *a)
>  {
> -    gen_arith_imm(ctx, OPC_RISC_SLLI, a->rd, a->rs1, a->shamt);
> +    if (a->rd != 0) {
> +        TCGv t = tcg_temp_new();
> +        gen_get_gpr(t, a->rs1);
> +
> +        if (a->shamt >= TARGET_LONG_BITS) {
> +            return false;
> +        }

I think the shmat test should be first, so that

	slli	r0, r1, 99

produces SIGILL instead of translating to a nop.

>  static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
>  {
> -    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_IW , a->rd, a->rs1,
> -                  a->shamt | 0x400);
> +    TCGv t = tcg_temp_new();
> +    gen_get_gpr(t, a->rs1);
> +    tcg_gen_sextract_tl(t, t, a->shamt, 32 - a->shamt);
> +    /* sign-extend for W instructions */
> +    tcg_gen_ext32s_tl(t, t);

Sign extension of a sign-extracted value?


r~

