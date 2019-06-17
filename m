Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hd0Hh-0005RJ-P1
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jun 2019 18:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36449)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hd0HZ-0005NN-97
 for qemu-riscv@nongnu.org; Mon, 17 Jun 2019 18:39:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hd0HY-0004XN-Cj
 for qemu-riscv@nongnu.org; Mon, 17 Jun 2019 18:39:21 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37108)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hd0HW-0004S1-BC
 for qemu-riscv@nongnu.org; Mon, 17 Jun 2019 18:39:20 -0400
Received: by mail-pf1-x444.google.com with SMTP id 19so6437701pfa.4
 for <qemu-riscv@nongnu.org>; Mon, 17 Jun 2019 15:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8Ib9AHVpoMnLsjFKadmymVirMZiS1xyBiQ4dEr91e28=;
 b=aCDjJxcbhXXUfGDGDHyEy/AAi0c6tLpgrWu3vTNpTdWGRepfseRTMX6AHnFofkr9CD
 kc9ktqdDEfGuOu44uDAF74GCakznV7XLmJJ+utN1K1nByB0er3Hm299NFJYUE2S7/TpZ
 hjezfE2DyVJtMWX9YWMi0j7uiQ1MRSzqJjv6avCUYwNBqWiTkHCAiLa3omKBVSjqWPWR
 ds4cFVOf0f61MiVa6YkUTTP3ZPI66/ASu9v0RFAEfpzOPDHwuvviO8Jbflf8VdQNJuul
 0ElqbNGPm+jmAQJHg4Xt4kndP5FkYUZScQh0dyOSh9GfoUIu/zXqLmHtvcXwjrNl7zrY
 A5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Ib9AHVpoMnLsjFKadmymVirMZiS1xyBiQ4dEr91e28=;
 b=eP8y/aYma7eZJLeaTuL+tqeu4uwUGEPHm8kUGtnytqghh14FEQLMVnR8vTx1Q189hd
 jCeJ/yN8WAjokS5WRqZ/XuKLWIB4fBfMD8gdpLIudpAripfO2kY2jax5mo2Hv2dPvbA4
 /BQQLhgHhq1muG5oqc95lMiT1VKZtiHlWwIhDLyTofUucDx6YQZPmVEF6YRnLFMcYVfE
 1oSnQttUsm9/9NtK2U7kJmMwHLApkxPY2h8BpIzZF3B4wpRuYDLDuuCvx7u3khCcnD2r
 1I/SqIdm0QgEs0XVZgK2FgDumzqg5AshN5mOLyiEizfcaOOd9McLfqB6psiOZub46LVO
 SwNw==
X-Gm-Message-State: APjAAAXep4m/p11yrwCrslrBlsgOibNW6Yk51kihk9ZBxR14UgIYNCcU
 HuX2RyjPRJOafbq3upg6+wl20A==
X-Google-Smtp-Source: APXvYqxJrXMvcpi+oAA/LnQKr48m7ybmO4FVBqqrAQEg/tRBK7dQQ26iHpJsCmKmh2JrUeiO3MFLug==
X-Received: by 2002:a17:90a:dc86:: with SMTP id
 j6mr1391108pjv.141.1560811154821; 
 Mon, 17 Jun 2019 15:39:14 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id k13sm12765885pgq.45.2019.06.17.15.39.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 15:39:14 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, "Emilio G. Cota" <cota@braap.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-34-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <98e88256-7a88-b505-9bde-0836cf21c654@linaro.org>
Date: Mon, 17 Jun 2019 15:38:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614171200.21078-34-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 33/50] target/riscv: fetch
 code with translator_ld
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
X-List-Received-Date: Mon, 17 Jun 2019 22:39:23 -0000

On 6/14/19 10:11 AM, Alex Bennée wrote:
> +++ b/target/riscv/translate.c
> @@ -793,7 +793,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>      CPURISCVState *env = cpu->env_ptr;
>  
> -    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
> +    ctx->opcode = translator_ldl(env, ctx->base.pc_next);

I'll note for the riscv folks that this is an existing bug, reading too much in
the case of an RVC instruction.  This could well matter for the last 2-byte
instruction at the end of a page.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

