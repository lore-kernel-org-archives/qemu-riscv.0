Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdYA6-00045U-Lk
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jun 2019 06:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60862)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hdYA3-00043o-78
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 06:49:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hdY9z-00037x-Tp
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 06:49:50 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42970)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hdY9x-00033R-Sa
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 06:49:47 -0400
Received: by mail-pl1-f196.google.com with SMTP id ay6so4823189plb.9
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2019 03:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=cO+uD4tBxnTjM9TJE7p2YYiyVobc6x86e1frLVztAEw=;
 b=mIvr8Rd/3jlRjnwDub0ZZgDrDzCiXUaJp0MrZKx1tiwcL9PgG6JjV+tAItmA6uw50G
 bUu6vT/mclOXmf0pGXHUksDcdUhr+//k63eJxNRUhUSdAZQvPiiqmD14gs9s5IpRIody
 pJWz8VAPrR4C5+PcSZ7rNsKWrNjBQvNe/3WVjMHzhmtlIob/DI8uAZuE2eKVssVIG3/e
 IpMGBhnzOdGFCP4YOzJl0q3ELzJZaKp8gXhKdY8z38mQFRPtGdm1tIKuu4RWp0W1iU3c
 qwjHR7NsXRTX9ksf+O3BI+xLqompVx73wpO6Rdstt7Qbaqd5RSbNyW7hN6CioZ7pq5ak
 X7bw==
X-Gm-Message-State: APjAAAXhmAFX7S5Qjd9RdYL/OFJc8MojhP6zxoq/uwv1JjnG33PwOZLt
 A+CZNkGKGvOpGHEiVZ4605R94Q==
X-Google-Smtp-Source: APXvYqxBVJ3OwPKMzyVrpF4E+z2snQn5sGC5CMn8g80rMe/hYYJrLUP5b5L6/xTh0XsGOx7HT7gZaw==
X-Received: by 2002:a17:902:f301:: with SMTP id
 gb1mr62608977plb.292.1560941381295; 
 Wed, 19 Jun 2019 03:49:41 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id p1sm19836410pff.74.2019.06.19.03.49.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 03:49:40 -0700 (PDT)
Date: Wed, 19 Jun 2019 03:49:40 -0700 (PDT)
X-Google-Original-Date: Wed, 19 Jun 2019 03:48:46 PDT (-0700)
In-Reply-To: <98e88256-7a88-b505-9bde-0836cf21c654@linaro.org>
CC: alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 sagark@eecs.berkeley.edu, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 cota@braap.org, Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-a709557f-be85-4a1e-9f95-d708e95c540e@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.196
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
X-List-Received-Date: Wed, 19 Jun 2019 10:49:52 -0000

On Mon, 17 Jun 2019 15:38:45 PDT (-0700), richard.henderson@linaro.org wrote:
> On 6/14/19 10:11 AM, Alex Bennée wrote:
>> +++ b/target/riscv/translate.c
>> @@ -793,7 +793,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>>      CPURISCVState *env = cpu->env_ptr;
>>
>> -    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
>> +    ctx->opcode = translator_ldl(env, ctx->base.pc_next);
>
> I'll note for the riscv folks that this is an existing bug, reading too much in
> the case of an RVC instruction.  This could well matter for the last 2-byte
> instruction at the end of a page.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks for pointing this out.  I'm checking the ISA semantics with Andrew to
make sure I've got it right, as there's some implicit wording in the document
that doesn't quite do what I'd expect it to.

