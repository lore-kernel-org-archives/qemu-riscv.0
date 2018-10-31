Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHysX-0007TX-7T
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 18:22:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHysV-0007TM-HG
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:22:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHysQ-0002nV-GZ
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:22:19 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:45657)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHysQ-0002mg-9b
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:22:14 -0400
Received: by mail-ed1-x543.google.com with SMTP id t10-v6so14993539eds.12
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 15:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Dg8h2Jgry/6RgdvyK+0YZRuNO7rmlIBJcrgaUhqBr/Q=;
	b=Z4o0bf0YUaMZdYnIx13Ml9LfnX7SSvjjWcnPYWHFEQIg5PISqHdZFgp+ST6GwYMffX
	YIaC/T37Ix11djMXzQb0aqGrdB122hBv1KpFqg7UXmmIOjcgxA1WgUb8YFxQWa/wqkgi
	CbbJyYxtANm+zfRm012qzDoy2OIgcjQb78ULo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Dg8h2Jgry/6RgdvyK+0YZRuNO7rmlIBJcrgaUhqBr/Q=;
	b=a0lFWOWkZM4vlIvO7pFbSN8nMKHUeFzx+IEntprkLuF93HDK2n9FqPT99TVRoXSurH
	6iXGYMEgl+LxQ7ESeGb/R8xmvEtBSO3LDPWXwBsweFjdWjhNw4aZrwQyVYlnnSRuidUP
	AK8QMXKGuivh6T+7Y/AIYvzCJOIyTMHhN0irIrLvPdYzvMqmwmWeU5oeaydqkreF2inf
	1LHumInhg6RMMCvb7mLneSjkm97eotBYt8js47+sBtK4+OnQ199kD4awJvTBavxY+TX/
	WOuTG707t2HlVXb8D5WJRB/soVXZPZR85sVK0WEfEUrmt+BMijIhUF+vy7L+6iJJ7s85
	OExg==
X-Gm-Message-State: AGRZ1gICu2VKpmomkOcJ8ofpsR+/xceYB2jOYu/Y8SefPFRekLEIGusx
	0nLlRCcMCFufNFINgb0g0bZtm2ClpFg=
X-Google-Smtp-Source: AJdET5elab/IRXMA4C2CbP+FaaGvgT5GrsEdDhcvl38kB0JpuqcOEzbb99SHkOT/TZ9BBb8DuRc2uA==
X-Received: by 2002:a17:906:8cb:: with SMTP id
	o11-v6mr2672423eje.16.1541024531415; 
	Wed, 31 Oct 2018 15:22:11 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	f22-v6sm4654394ejf.43.2018.10.31.15.22.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 15:22:10 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-25-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <16797a6b-1b0b-1f83-1aef-5cc5a8ff90e6@linaro.org>
Date: Wed, 31 Oct 2018 22:18:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-25-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-riscv] [PATCH v3 24/35] target/riscv: Move
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
X-List-Received-Date: Wed, 31 Oct 2018 22:22:20 -0000

On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
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
> +        tcg_gen_shli_tl(t, t, a->shamt);
> +
> +        gen_set_gpr(a->rd, t);
> +        tcg_temp_free(t);
> +    } /* NOP otherwise */
>      return true;
>  }
>  
>  static bool trans_srli(DisasContext *ctx, arg_srli *a)
>  {
> -    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_I, a->rd, a->rs1, a->shamt);
> +    if (a->rd != 0) {
> +        TCGv t = tcg_temp_new();
> +        gen_get_gpr(t, a->rs1);
> +        tcg_gen_shri_tl(t, t, a->shamt);
> +        gen_set_gpr(a->rd, t);
> +        tcg_temp_free(t);
> +    } /* NOP otherwise */
>      return true;
>  }
>  
>  static bool trans_srai(DisasContext *ctx, arg_srai *a)
>  {
> -    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_I, a->rd, a->rs1, a->shamt | 0x400);
> +    if (a->rd != 0) {
> +        TCGv t = tcg_temp_new();
> +        gen_get_gpr(t, a->rs1);
> +        tcg_gen_sari_tl(t, t, a->shamt);
> +        gen_set_gpr(a->rd, t);
> +        tcg_temp_free(t);
> +    } /* NOP otherwise */
>      return true;
>  }

Surely the shri and sari functions need the same shamt >= TARGET_LONG_BITS
check as slli.  Otherwise RV32 shri should definitely produce an assert in
tcg_gen_shri_tl.

I did wonder about changing the decode of the shift functions such that only
the top two bits of the imm are reserved for secondary parsing of the shift
type, and the other 10 bits are passed down into trans_foo.  At which point the
TARGET_LONG_BITS check takes care of other illegalities.

Which means that the parsing for slli and slliw are identical, and also that
for the far future when RV128 is a thing, we don't have to change the parsing.


r~

