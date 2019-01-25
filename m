Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn9yJ-0003MG-Qu
	for mharc-qemu-riscv@gnu.org; Fri, 25 Jan 2019 17:29:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gn9yH-0003Kq-Sg
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 17:29:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gn9yF-0006gG-Sp
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 17:29:09 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46880)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gn9yA-0006cC-7h; Fri, 25 Jan 2019 17:29:03 -0500
Received: by mail-pl1-x643.google.com with SMTP id t13so5153853ply.13;
	Fri, 25 Jan 2019 14:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qSeSCHOqRAoEdaFmDAcRgxN54zNW5wUffKREjweaQ48=;
	b=lwbVWH1WXrb4IM5r+F8cljIuOQLpFeboTkkZ7IgdvfATJjEmaR64EHh24NHKBhly10
	OJsZnVglQEigmFJ+Plg26E6iXTwIUIteARFplUJQc9Bh+5w189vuZG+R8duUzPco4/Ah
	M8+ABtYaMZ4Eb3EIDcG05ibT+3+P/FYndSaG4SEKqPNZqm+7zP4epdZEaQdc23AbcYQO
	q5ANCiGdPhqmM9NoHT55ROrWDhwaqICKMIffL+lypPXIH/YM/zL7dzkY9Smawd0mUSJi
	OZnG8reSjqsK6hNGnubcGWkWWGp8uubRHqnRpdcZtAFk7c4OcxihaUULfxS8qP6WS6NR
	oUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qSeSCHOqRAoEdaFmDAcRgxN54zNW5wUffKREjweaQ48=;
	b=Hf1dGoYNNZWnKQG5LvL2gpzUL3U/OCFZb75cCiu61Ksp2ViutPdofqQHChINnTRLXn
	7mHlHJ2On6lJRd514iK9gUS4ayjkA2SXeH8WC9bmGIBYDdZcfZ8sDZs1hy4iahFijyT4
	PCZrue/OrSlemVzPJKfChUuWMW7E7wj8eLndTELqGU+mQZhOQnLuJw7jlVzObWkgAMyo
	ZKp69EHKoUuPg46toV5M/wMFsD5blMP4DHcpca/08Rz8oOkwVHGbHCjMNolDgH5Ne+R3
	Bixs1c3XYHx7uTXT1ziJy/4My5E9NmUai35Hp70jLRez65IvW/z4AuhgXktvSTDYi8q3
	qNrA==
X-Gm-Message-State: AJcUukdGhGQWW4NTQdXoiKXMlrACV4e3kkWLSAMgiExdfbvKQiz2hQuq
	8o3FSxLVRl6MBE3yDI5QKPD5k7GG
X-Google-Smtp-Source: ALg8bN6GHrebV7BdkTMvjeqbBhVQ/lAzLhZxXc3GZkNIJspmzTrIlrysfVbrTXbpS5RmJL05j4nlvA==
X-Received: by 2002:a17:902:2c83:: with SMTP id
	n3mr12978968plb.104.1548455340271; 
	Fri, 25 Jan 2019 14:29:00 -0800 (PST)
Received: from [10.196.159.136] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	e16sm32526792pfn.46.2019.01.25.14.28.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 14:28:59 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
	<20190123092538.8004-29-kbastian@mail.uni-paderborn.de>
From: Alistair <alistair23@gmail.com>
Message-ID: <4dd52d4c-5c17-bf31-553d-1368494a63aa@gmail.com>
Date: Fri, 25 Jan 2019 14:28:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190123092538.8004-29-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 28/35] target/riscv: Rename
 trans_arith to gen_arith
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
X-List-Received-Date: Fri, 25 Jan 2019 22:29:11 -0000

On 1/23/19 1:25 AM, Bastian Koppelmann wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   target/riscv/insn_trans/trans_rvi.inc.c | 18 +++++++++---------
>   target/riscv/insn_trans/trans_rvm.inc.c | 14 +++++++-------
>   target/riscv/translate.c                |  4 ++--
>   3 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
> index eac79f076f..904ae44968 100644
> --- a/target/riscv/insn_trans/trans_rvi.inc.c
> +++ b/target/riscv/insn_trans/trans_rvi.inc.c
> @@ -307,12 +307,12 @@ static bool trans_srai(DisasContext *ctx, arg_srai *a)
>   
>   static bool trans_add(DisasContext *ctx, arg_add *a)
>   {
> -    return trans_arith(ctx, a, &tcg_gen_add_tl);
> +    return gen_arith(ctx, a, &tcg_gen_add_tl);
>   }
>   
>   static bool trans_sub(DisasContext *ctx, arg_sub *a)
>   {
> -    return trans_arith(ctx, a, &tcg_gen_sub_tl);
> +    return gen_arith(ctx, a, &tcg_gen_sub_tl);
>   }
>   
>   static bool trans_sll(DisasContext *ctx, arg_sll *a)
> @@ -322,17 +322,17 @@ static bool trans_sll(DisasContext *ctx, arg_sll *a)
>   
>   static bool trans_slt(DisasContext *ctx, arg_slt *a)
>   {
> -    return trans_arith(ctx, a, &gen_slt);
> +    return gen_arith(ctx, a, &gen_slt);
>   }
>   
>   static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
>   {
> -    return trans_arith(ctx, a, &gen_sltu);
> +    return gen_arith(ctx, a, &gen_sltu);
>   }
>   
>   static bool trans_xor(DisasContext *ctx, arg_xor *a)
>   {
> -    return trans_arith(ctx, a, &tcg_gen_xor_tl);
> +    return gen_arith(ctx, a, &tcg_gen_xor_tl);
>   }
>   
>   static bool trans_srl(DisasContext *ctx, arg_srl *a)
> @@ -347,12 +347,12 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a)
>   
>   static bool trans_or(DisasContext *ctx, arg_or *a)
>   {
> -    return trans_arith(ctx, a, &tcg_gen_or_tl);
> +    return gen_arith(ctx, a, &tcg_gen_or_tl);
>   }
>   
>   static bool trans_and(DisasContext *ctx, arg_and *a)
>   {
> -    return trans_arith(ctx, a, &tcg_gen_and_tl);
> +    return gen_arith(ctx, a, &tcg_gen_and_tl);
>   }
>   
>   #ifdef TARGET_RISCV64
> @@ -399,12 +399,12 @@ static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
>   
>   static bool trans_addw(DisasContext *ctx, arg_addw *a)
>   {
> -    return trans_arith(ctx, a, &gen_addw);
> +    return gen_arith(ctx, a, &gen_addw);
>   }
>   
>   static bool trans_subw(DisasContext *ctx, arg_subw *a)
>   {
> -    return trans_arith(ctx, a, &gen_subw);
> +    return gen_arith(ctx, a, &gen_subw);
>   }
>   
>   static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
> diff --git a/target/riscv/insn_trans/trans_rvm.inc.c b/target/riscv/insn_trans/trans_rvm.inc.c
> index 949f59ddb2..5844d6f5be 100644
> --- a/target/riscv/insn_trans/trans_rvm.inc.c
> +++ b/target/riscv/insn_trans/trans_rvm.inc.c
> @@ -21,7 +21,7 @@
>   
>   static bool trans_mul(DisasContext *ctx, arg_mul *a)
>   {
> -    return trans_arith(ctx, a, &tcg_gen_mul_tl);
> +    return gen_arith(ctx, a, &tcg_gen_mul_tl);
>   }
>   
>   static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
> @@ -41,7 +41,7 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
>   
>   static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
>   {
> -    return trans_arith(ctx, a, &gen_mulhsu);
> +    return gen_arith(ctx, a, &gen_mulhsu);
>   }
>   
>   static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
> @@ -61,28 +61,28 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
>   
>   static bool trans_div(DisasContext *ctx, arg_div *a)
>   {
> -    return trans_arith(ctx, a, &gen_div);
> +    return gen_arith(ctx, a, &gen_div);
>   }
>   
>   static bool trans_divu(DisasContext *ctx, arg_divu *a)
>   {
> -    return trans_arith(ctx, a, &gen_divu);
> +    return gen_arith(ctx, a, &gen_divu);
>   }
>   
>   static bool trans_rem(DisasContext *ctx, arg_rem *a)
>   {
> -    return trans_arith(ctx, a, &gen_rem);
> +    return gen_arith(ctx, a, &gen_rem);
>   }
>   
>   static bool trans_remu(DisasContext *ctx, arg_remu *a)
>   {
> -    return trans_arith(ctx, a, &gen_remu);
> +    return gen_arith(ctx, a, &gen_remu);
>   }
>   
>   #ifdef TARGET_RISCV64
>   static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
>   {
> -    return trans_arith(ctx, a, &gen_mulw);
> +    return gen_arith(ctx, a, &gen_mulw);
>   }
>   
>   static bool trans_divw(DisasContext *ctx, arg_divw *a)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 6a722a0045..d0b0fca12b 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -577,8 +577,8 @@ static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
>   
>   #endif
>   
> -static bool trans_arith(DisasContext *ctx, arg_r *a,
> -                        void(*func)(TCGv, TCGv, TCGv))
> +static bool gen_arith(DisasContext *ctx, arg_r *a,
> +                      void(*func)(TCGv, TCGv, TCGv))
>   {
>       TCGv source1, source2;
>       source1 = tcg_temp_new();
> 

