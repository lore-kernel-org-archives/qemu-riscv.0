Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkyBK-000335-R2
	for mharc-qemu-riscv@gnu.org; Sat, 19 Jan 2019 16:29:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gkyBI-00032w-Ma
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 16:29:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gkyBG-0007gC-Hp
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 16:29:32 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:43120)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gkyBE-0007e3-Ew
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 16:29:30 -0500
Received: by mail-pg1-x531.google.com with SMTP id v28so7687096pgk.10
	for <qemu-riscv@nongnu.org>; Sat, 19 Jan 2019 13:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=0641h0HvuI29PrSxxWvbvDl+xPjRFs+wBypG8iyJqN8=;
	b=bt9K0qMcK44pniqHOFq6chZbBHAa0py0kZr2mOSDe+7Q8+FmAD7JPqPt8H4gCUkAXk
	7nE+hp3vTrMfyGmWiAda1VtdtellluPjSk8OwiHgHc9NxF/XfXUxGl8d7qZ3l9Bs/EwK
	hKJjnEFEhLzUfgrj7TiIknoSLq8Paa3M1En+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0641h0HvuI29PrSxxWvbvDl+xPjRFs+wBypG8iyJqN8=;
	b=UvJ7uGoSQWk8WrGUsRequXZksHUPLT9CnqAtEpwbsmE5rFTgzq+6K80B1cbvrk8xLd
	Esag3+vh1IA+/BGes8D+OWrbjfrfnuzC+lbfsMuGI7ST+SpiHtWNMkFEzHFaerLCQqdd
	R1ASvzvDdRSom6wCb6Zml0OTROBR6nmOD3ibiSmcR7/LOtukMmFd/WLWM8fB9MUR+eSP
	9TY3Kvs491VPwKhBnS2fkcWVBD9EVnA6Z+PWl01T+Uj0ZGcU89Q9YswbuFsf23wWzql1
	wKdono74KzrlPCipXBEca4OCMW42nrYz5Nh/xpb5VwK+1g4Fn9peKGsO87bFR/IQs92n
	XiVg==
X-Gm-Message-State: AJcUukdQFNVpEpgsBMoskezNvGG7gRgFWthKU2IJSbTgXiWSAdUXQDIe
	QnUdFY1TPfhY29EGkVfMjjaZIQ==
X-Google-Smtp-Source: ALg8bN4fgIfV8wOPBaLEUUoMG5FBDE8NFYnS2hHs31FbTz7r15frhr8GWYZcrvxwJGRzNMrjYiCsGg==
X-Received: by 2002:a63:9e58:: with SMTP id r24mr23292838pgo.264.1547933367149;
	Sat, 19 Jan 2019 13:29:27 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.gmail.com with ESMTPSA id
	y6sm14064476pfd.104.2019.01.19.13.29.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jan 2019 13:29:26 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
	<20190118131456.32451-8-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <74f85a7c-62d1-ca61-9820-7c4deeca4a05@linaro.org>
Date: Sun, 20 Jan 2019 08:29:21 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190118131456.32451-8-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::531
Subject: Re: [Qemu-riscv] [PATCH v4 07/35] target/riscv: Convert RVXI fence
 insns to decodetree
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
X-List-Received-Date: Sat, 19 Jan 2019 21:29:33 -0000

On 1/19/19 12:14 AM, Bastian Koppelmann wrote:
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> ---
>  target/riscv/insn32.decode              |  2 ++
>  target/riscv/insn_trans/trans_rvi.inc.c | 23 +++++++++++++++++++++++
>  target/riscv/translate.c                | 12 ------------
>  3 files changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 1f5bf1f6f9..804b721ca5 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -82,3 +82,5 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
>  sra      0100000 .....    ..... 101 ..... 0110011 @r
>  or       0000000 .....    ..... 110 ..... 0110011 @r
>  and      0000000 .....    ..... 111 ..... 0110011 @r
> +fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> +fence_i  ---- ----   ----   ----- 001 ----- 0001111
> diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
> index 01f751650a..138a8397d9 100644
> --- a/target/riscv/insn_trans/trans_rvi.inc.c
> +++ b/target/riscv/insn_trans/trans_rvi.inc.c
> @@ -318,3 +318,26 @@ static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
>      return true;
>  }
>  #endif
> +
> +static bool trans_fence(DisasContext *ctx, arg_fence *a)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    /* FENCE is a full memory barrier. */
> +    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
> +#endif
> +    return true;
> +}
> +
> +static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    /*
> +     * FENCE_I is a no-op in QEMU,
> +     * however we need to end the translation block
> +     */
> +    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> +    tcg_gen_exit_tb(NULL, 0);
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +#endif
> +    return true;

Rebase error.  You need to remove the ifdefs that were removed...


> -    case OPC_RISC_FENCE:
> -        if (ctx->opcode & 0x1000) {
> -            /* FENCE_I is a no-op in QEMU,
> -             * however we need to end the translation block */
> -            tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> -            tcg_gen_exit_tb(NULL, 0);
> -            ctx->base.is_jmp = DISAS_NORETURN;
> -        } else {
> -            /* FENCE is a full memory barrier. */
> -            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
> -        }
> -        break;

... from here.


r~

