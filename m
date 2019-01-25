Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn9zG-0003vz-DJ
	for mharc-qemu-riscv@gnu.org; Fri, 25 Jan 2019 17:30:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gn9zD-0003sO-J4
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 17:30:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gn9zC-0007XG-H8
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 17:30:07 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:36739)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gn9z2-00077F-HR; Fri, 25 Jan 2019 17:29:59 -0500
Received: by mail-pl1-x642.google.com with SMTP id g9so5180920plo.3;
	Fri, 25 Jan 2019 14:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NtkbCEfkDfwUeczp/zBZ3dDoeT5kny+0wR+EQzyp4Fw=;
	b=s2h0mHbxx40tcqA97BAHKT80t5p+vwNBAazdK1kNhWpMqehOK0V03TZBVK4AiOXVoY
	tgaiBrEH3HHM6a0bFVHd4nNnxZGhGMcuFSZUjy6jMSIxxYVPjQfSYNmrHft/QZiG+Rkn
	KkwORbvPGf/7DAR02b8LlW21cwmGW3uUUFh2q4AnKs2uOylCHRGvXGMh6PAV9/tIHHYs
	jMnr3yOQKf2wEBkTWJvrbWvAySE+zjYPoHdKvpl3JVcc6AL8EORcXUo6A4yhzEJMYWPQ
	G2BCQ3mFjVJKOMaUErXbEqo/AiUxeCiDJV1MXxD0/v+v24c0qYT4vloqbI3X1c9seG1w
	N95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NtkbCEfkDfwUeczp/zBZ3dDoeT5kny+0wR+EQzyp4Fw=;
	b=r67aKpORbsS9gsMkgd3lG0Hw2OyowbAdV8Dfq48fs4Qvkkl+p1Wu6A8XrH/ACSjWPv
	zkxY8CFIj8OYe6ALduo5oWsLUfQPAigSqOBN7QDnU3ig/9YSeYuu8EC1bRWWACMRZ5xX
	bLAUgQtkQIgF/XfjnPcuyU7sFHxFYXmIErMraX6gnGdziJptlxjaVSM8eiOQgOgiZ2Tj
	9OW/D73FU3ywEAVbJdNkBRvcy8vj7Y0Wc61RrVA3XubInI6mg9xzrEx2pg9MvAKlXxOd
	zPT8EzKol6GVwpMKB83kFVLCDS43Gx9ZsEhwlhE2I25rgb9Vs7Yz39oXX8a/tXz+fh2A
	oT9g==
X-Gm-Message-State: AJcUukdIY/mN5O68zDZU+AcZg7tyXU8Ow2xEemfZImHJmJbeX6Xe7oZJ
	XLw5UyGQ5a+20uFA3kTBPqkEmrDP
X-Google-Smtp-Source: ALg8bN40jdMWZV5RLKJ8A3LUuz/McjAyEbtuzrO6+DQb1B2kbbZQUx8YPre/Inn3D2zYfPksGiBpSw==
X-Received: by 2002:a17:902:968d:: with SMTP id
	n13mr13086456plp.109.1548455374651; 
	Fri, 25 Jan 2019 14:29:34 -0800 (PST)
Received: from [10.196.159.136] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	l5sm34250734pgp.82.2019.01.25.14.29.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 14:29:33 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
	<20190123092538.8004-31-kbastian@mail.uni-paderborn.de>
From: Alistair <alistair23@gmail.com>
Message-ID: <14f6462f-ea46-7e1a-d03a-bed324f9d88b@gmail.com>
Date: Fri, 25 Jan 2019 14:29:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190123092538.8004-31-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 30/35] target/riscv: Remove
 decode_RV32_64G()
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
X-List-Received-Date: Fri, 25 Jan 2019 22:30:08 -0000

On 1/23/19 1:25 AM, Bastian Koppelmann wrote:
> decodetree handles all instructions now so the fallback is not necessary
> anymore.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   target/riscv/translate.c | 23 +----------------------
>   1 file changed, 1 insertion(+), 22 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0e37beb68e..b0251b3518 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -600,26 +600,6 @@ bool decode_insn16(DisasContext *ctx, uint16_t insn);
>   #include "decode_insn16.inc.c"
>   #include "insn_trans/trans_rvc.inc.c"
>   
> -static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
> -{
> -    uint32_t op;
> -
> -    /* We do not do misaligned address check here: the address should never be
> -     * misaligned at this point. Instructions that set PC must do the check,
> -     * since epc must be the address of the instruction that caused us to
> -     * perform the misaligned instruction fetch */
> -
> -    op = MASK_OP_MAJOR(ctx->opcode);
> -
> -    switch (op) {
> -    case OPC_RISC_SYSTEM:
> -        break;
> -    default:
> -        gen_exception_illegal(ctx);
> -        break;
> -    }
> -}
> -
>   static void decode_opc(DisasContext *ctx)
>   {
>       /* check for compressed insn */
> @@ -636,8 +616,7 @@ static void decode_opc(DisasContext *ctx)
>       } else {
>           ctx->pc_succ_insn = ctx->base.pc_next + 4;
>           if (!decode_insn32(ctx, ctx->opcode)) {
> -            /* fallback to old decoder */
> -            decode_RV32_64G(ctx->env, ctx);
> +            gen_exception_illegal(ctx);
>           }
>       }
>   }
> 

