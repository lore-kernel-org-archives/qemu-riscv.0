Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHz82-0000cR-Lt
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 18:38:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHz80-0000af-9R
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:38:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHz7t-000408-33
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:38:19 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39597)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHz7s-0003zK-Hj
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:38:12 -0400
Received: by mail-wr1-x441.google.com with SMTP id r10-v6so18221585wrv.6
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 15:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=B6f1Dlg1jm/va4d6ri2qKVhrYIT5ty5hL6N4vI7fz1M=;
	b=E1T4j2us2xKvd1OLptjU8RiWEnRLNe2F6PbHzYop4HUygzdgS8Aq2CeTAfrb3kTeep
	5oF4qZPaA4bjk/zR1kRAEt7JOJk4h7dcj74+H+JWJetEuit46dcGlV3z08miOqVrD/7B
	ELi9QyWp2Ch4y4n7h21dW/i9Et03MoZCC6dn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=B6f1Dlg1jm/va4d6ri2qKVhrYIT5ty5hL6N4vI7fz1M=;
	b=AutphsadQDJP3YQaLc5C05LGTqhiXHYYWol2O5uy35KhzTCIX8Zb4bKbzI51i2TZvc
	uw2G704UxXoWT183MFxXBUJxFElyxKCF5ww1CbAgA50wWxXmLPye6W28ShQbC1dUKDOl
	lhozA4ehvzo9Mi1zH9ZBzdK3kAuV2ZF6KRL/puU6kq0lK1O1cC5XibXCz8mhoR2YQdIA
	xwzVkKKAJ1aND0DR4FI1XPPRHsmS8JmMgHNqBN5QR0RiTz6BEILB9EaOqw/y5P90mEh7
	+fWrI55NA1Cz84NVWSdUoW+3Wt/luJGMWrbMoVggJagw0NUvWax5TeYlXeIGWPvF6dCP
	AQvQ==
X-Gm-Message-State: AGRZ1gLlgqTgQOLuZ1oBBGPnPsGzpy51p1sxVXC+IMNfxEl3VP+PLGhj
	R5d1WooXFS2q1vTnkx7b7t6RnzHG0lE=
X-Google-Smtp-Source: AJdET5eyqyV0rx+cH7/cbhoMM/SIGgBgj42FwRQ9wzn23whxJTIpEC591IDz9g2FhZKykYGj058Z/Q==
X-Received: by 2002:adf:d0c5:: with SMTP id
	z5-v6mr4961310wrh.166.1541025490876; 
	Wed, 31 Oct 2018 15:38:10 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	b71-v6sm23542581wma.13.2018.10.31.15.38.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 15:38:10 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-27-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8818c4f3-7ff5-44c6-abbe-67489519ccde@linaro.org>
Date: Wed, 31 Oct 2018 22:38:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-27-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-riscv] [PATCH v3 26/35] target/riscv: Remove shift and
 slt insn manual decoding
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
X-List-Received-Date: Wed, 31 Oct 2018 22:38:21 -0000

On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
>  static bool trans_slt(DisasContext *ctx, arg_slt *a)
>  {
> -    gen_arith(ctx, OPC_RISC_SLT, a->rd, a->rs1, a->rs2);
> +    TCGv source1 = tcg_temp_new();
> +    TCGv source2 = tcg_temp_new();
> +
> +    gen_get_gpr(source1, a->rs1);
> +    gen_get_gpr(source2, a->rs2);
> +
> +    tcg_gen_setcond_tl(TCG_COND_LT, source1, source1, source2);

I do wonder about extracting this one line to gen_slt so that you can re-use
gen_arith and gen_arithi.

> +    tcg_gen_setcond_tl(TCG_COND_LTU, source1, source1, source2);

Similarly.

>  static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
>  {
> -    gen_arith(ctx, OPC_RISC_SLLW, a->rd, a->rs1, a->rs2);
> +    TCGv source1 = tcg_temp_new();
> +    TCGv source2 = tcg_temp_new();
> +
> +    gen_get_gpr(source1, a->rs1);
> +    gen_get_gpr(source2, a->rs2);
> +
> +    tcg_gen_andi_tl(source2, source2, 0x1F);
> +    tcg_gen_shl_tl(source1, source1, source2);
> +
> +    gen_set_gpr(a->rd, source1);

Missing the ext32s after the shift.

>  static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
>  {
> -    gen_arith(ctx, OPC_RISC_SRLW, a->rd, a->rs1, a->rs2);
> +    TCGv source1 = tcg_temp_new();
> +    TCGv source2 = tcg_temp_new();
> +
> +    gen_get_gpr(source1, a->rs1);
> +    gen_get_gpr(source2, a->rs2);
> +
> +    /* clear upper 32 */
> +    tcg_gen_ext32u_tl(source1, source1);
> +    tcg_gen_andi_tl(source2, source2, 0x1F);
> +    tcg_gen_shr_tl(source1, source1, source2);

Likewise.  (Consider source2 == 0.)

> -    case OPC_RISC_SRL:
> -        tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
> -        tcg_gen_shr_tl(source1, source1, source2);
> -        break;
...
> -    case OPC_RISC_SRA:
> -        tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
> -        tcg_gen_sar_tl(source1, source1, source2);
> -        break;

I see that the bugs are in the original though, so fixing them in a separate
patch is certainly ok.


r~

