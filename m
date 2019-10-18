Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLX39-0002jl-5l
	for mharc-qemu-riscv@gnu.org; Fri, 18 Oct 2019 14:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iLX36-0002jY-GB
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 14:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iLX35-0001NA-CS
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 14:32:28 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34637)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iLX35-0001MX-4E
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 14:32:27 -0400
Received: by mail-pl1-x643.google.com with SMTP id k7so3260324pll.1
 for <qemu-riscv@nongnu.org>; Fri, 18 Oct 2019 11:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HAUmOseX66QM1+mqec9EYCYFOyrXvIYQaZDTqVpKx6I=;
 b=lwfcWTFWSws9MY8EpIVt7eX7/8JvOCW7NBaVld2Lky7pNKlghNybFWioHXgQSKl6jO
 GB+cwHa5MeL6kp1nYTjb9thNb7TXOXGExnZC7zaD3rF7R60px0GVpuR5mosx89dKDiOI
 ctaF7BsVmYkp/tqxtGjCc0WMUE0kFmuTxlf9xAKtJ/m3pCmtYaZrhdH2LCzdQQgjrImz
 ol6ME/spF7QBzbJPsn54rUG5SheQ+4clIsb9yP0G8tJdjzJxWTHhMyZX1aCijSYxpBBW
 vh8teXjyafgUdrDi2pp1wmznIsOJLaSYaUkecjU0hH7ZxP358mMbCowBV7asewT8mEGB
 k5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HAUmOseX66QM1+mqec9EYCYFOyrXvIYQaZDTqVpKx6I=;
 b=AwAPP3lh2fo0QiSxstqiCb3PxPYRgEBVzZJkMLQtiE4Mm4EajlYMVMKXjrRFqDBifQ
 qwNUr0v4K+BYkkllNDWkNIvDmWku5ea3s4C9d3/h3mnS18nzoHYoANZIR2uB9bMsnDm9
 Sqk7zT6V7y7iD64InxhkSOu8YLxiAVBL0AZXiSmc5f4qKHfvlt+7WQX2Mk/rz2HGXfL5
 PH3y4yBrBMRGo4q6JSINVDkBU1MCw2/PLkzQRlHwjrQhFmH35nG4RHvrKYRJpC4A/8de
 abHv8yD1B8YUZmXlSIVyQZ2sQUvuCV/xZIxpKahi+9JG3fdl9AvB/R1Wj1Dd3K2WTsAO
 jQ8g==
X-Gm-Message-State: APjAAAVZBzjxJrAIwAz8XkRyvRa9LzYUvEPQnCX3Q8KgI+srJp0O0InB
 vuetfuEN3cC20gvWrDHq3TOAbw==
X-Google-Smtp-Source: APXvYqxOknLzfIuZFLrgLbHtpStrxp2BeyZT9CBVMRRxVCPXe8hEfT/jagwj1NT/YQaZY60NLNOCFQ==
X-Received: by 2002:a17:902:209:: with SMTP id 9mr11896441plc.25.1571423546046; 
 Fri, 18 Oct 2019 11:32:26 -0700 (PDT)
Received: from localhost ([152.179.112.46])
 by smtp.gmail.com with ESMTPSA id v1sm11626338pfg.26.2019.10.18.11.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 11:32:25 -0700 (PDT)
Date: Fri, 18 Oct 2019 11:32:25 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Oct 2019 11:31:52 PDT (-0700)
Subject: Re: [PATCH v5 31/55] target/riscv: fetch code with translator_ld
In-Reply-To: <CAKmqyKPCYwYvD3hqJ1OW0KH3SjGpG7cypJw9V5sCg6bZ9ueUfw@mail.gmail.com>
CC: alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 sagark@eecs.berkeley.edu, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 robert.foley@futurewei.com, richard.henderson@linaro.org,
 peter.puhov@futurewei.com, aaron@os.amperecomputing.com, cota@braap.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: alex.bennee@linaro.org, alistair23@gmail.com
Message-ID: <mhng-50bafce3-ff74-4a1a-b3fe-cdc21a85e7af@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Fri, 18 Oct 2019 18:32:29 -0000

On Mon, 14 Oct 2019 10:59:07 PDT (-0700), alistair23@gmail.com wrote:
> On Mon, Oct 14, 2019 at 4:20 AM Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> From: "Emilio G. Cota" <cota@braap.org>
>>
>> Signed-off-by: Emilio G. Cota <cota@braap.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

and

Acked-by: Palmer Dabbelt <palmer@sifive.com>

as I'm assuming this will go in with the rest of the patch set.

>
> Alistair
>
>> ---
>>  target/riscv/translate.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index adeddb85f6..b26533d4fd 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -779,7 +779,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>>      CPURISCVState *env = cpu->env_ptr;
>>
>> -    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
>> +    ctx->opcode = translator_ldl(env, ctx->base.pc_next);
>>      decode_opc(ctx);
>>      ctx->base.pc_next = ctx->pc_succ_insn;
>>
>> --
>> 2.20.1
>>
>>

