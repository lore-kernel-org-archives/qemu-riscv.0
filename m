Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16AECEE351
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 20:18:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vLS8y-0002BP-DN; Tue, 18 Nov 2025 15:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vLS8u-0002Ae-Cw
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 15:17:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vLS8q-0000YV-U2
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 15:17:35 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so27564065e9.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Nov 2025 12:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763497051; x=1764101851; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0fsDbp266x/i7vzPqogyJHiihfg6OIpNQWatkbpvId8=;
 b=hpCtcQpIxa+hptsgcy3vWrmeaZSyqoguPIt7DO0qMtxt8peEjz0za28MZ0+En3nnUd
 zZHBYaBT2A8HlgSA+u1icVtg5K9HUl2vs/QK1zj9E+Gs6FM8uR0SZiJQeABuZHTJd671
 uphCswM/GCxZjYUSeQEH4rqgLrrtkSJNLkYinlYmjEzVzlfwXbLCOtfSnyF4mr9uLQ/k
 K2peT3/UxdFF61wZBC2w1FtddS0rcZH5b1mTbc4Jn0N09j5eSmbqnQMx4JUUO1kdZcVv
 1+zHbFucme27uCkseEqdsn7lN86smvwVXGSpMB5dePnRFImy2GmBaeNMTHqNO1A4BKff
 r8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497051; x=1764101851;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0fsDbp266x/i7vzPqogyJHiihfg6OIpNQWatkbpvId8=;
 b=Hg/uKmNnlpDYJGldsTmoMGxXuPZ605B532TLkZWoFQYMohxV9SD+hX++vFP/OGgXE4
 0V+sif2V+XCkPJL5Y5i2o47D1yVZ9o3gWb0A27EsV772C/eAig1yq/ZqSgissFqeOcM9
 NEniB8ziUEl8EfypuV6z3bEcypeWuFi5br21IVoujAEHKxe+n4tWNqK3gxSm36W9NfwF
 YuPbN3d+T33r9a+Jv5TwXoafQMtaJbwAoOO8pa5vjFWJcMY3R+uaM0yAoEccsq+MpjO9
 yR+Y0s5TKyKRY41ZPbYOsZUcjA0gGB55GR6quReSjcd0HG2jvMHn3xbAqh63lIZIx2z5
 TDVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeycVO6wj0kLt4HshyQnD+uOX3xMqBL/jxUD6PmL287SxvPMceZ6zNx1bRIIC63+d93rZ0jUjnTnn2@nongnu.org
X-Gm-Message-State: AOJu0YxW0vV8oR0gidTWfXhigQZaWvhkSSSfsmidMje5MHhlL+HptZ/6
 yrlNyG2pAzl9jMVjRbr3N/9qi4IVAAbHwHZn3s2huyov57AkZb3rNCi2MCEo54BO9lQ=
X-Gm-Gg: ASbGncsM3WPiCbKRRIW4h9/WY7skoEo9ygB9kVpUurQyzm6yp9jGm/Gm12xeGkgimto
 qERLgdFFqsgXbOXdDryYAVo8XHj6G+WrAzfPvRPaiOZIZRwXa65RDaTQCaUG9Z0UASxlCE6qu8j
 VfmDcpU3AdWZmKjbpBI3FR75FggYR8E/HcFoVvmAfiDxtYqpMRrUcJ/4ACMfv4/Zr0F1acAizp9
 FdXB9ZhivOw+KlEfCkOJfSR5wjoVCrJUtuh4ilqJ7efKcI8vYlnZG3y8L3krvgtMBL09jAmy6kK
 c81S+bRczskwsR+Xfgo3Yy2JjDpARRwvDtF7dKytksLRubkDILb8Myat3FUS6eEh212PEQHB9nK
 M1GnENaizMcz1VDP4MzkJn/D9atwQY9CKrzbSOlewjEWGDf5RUZfgjqhDA/A0AD2lGwJwuPyBzf
 /D8XvbHbjBEBNnYjtv0MX8iqIf5axSmTxclE8rMpbD2zRa8QzHaZ0WTh6OwZhhao6aauoEKmWR4
 ig=
X-Google-Smtp-Source: AGHT+IGIBA2WyROgLGXhq+Mazm6ZBzKqe1NWsoKEfPXlE4J3bLXYhVTPM3sHJBIIbzq7NcDocedLpQ==
X-Received: by 2002:a05:600c:6b66:b0:477:9a28:b09a with SMTP id
 5b1f17b1804b1-4779a28b24bmr96241525e9.0.1763497051232; 
 Tue, 18 Nov 2025 12:17:31 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b102a3a1sm7970765e9.9.2025.11.18.12.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 12:17:30 -0800 (PST)
Message-ID: <958b25bf-c930-4117-8378-e9f87621d2c3@linaro.org>
Date: Tue, 18 Nov 2025 21:17:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] target/riscv: Really use little endianness for
 128-bit loads/stores
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anton Johansson <anjo@rev.ng>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>
References: <20251010155045.78220-1-philmd@linaro.org>
 <20251010155045.78220-2-philmd@linaro.org>
 <88f8d901-b7b4-47e6-b209-f9375c5b95e1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <88f8d901-b7b4-47e6-b209-f9375c5b95e1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi Richard,

[Dropping Fabien Portas from Cc due to bouncing email]

On 10/10/25 20:44, Richard Henderson wrote:
> On 10/10/25 08:50, Philippe Mathieu-Daudé wrote:
>> Per commit a2f827ff4f4 ("target/riscv: accessors to registers upper
>> part and 128-bit load/store") description:
>>
>>   > The 128-bit ISA adds ldu, lq and sq. We provide support for these
>>   > instructions. Note that (a) we compute only 64-bit addresses to
>>   > actually access memory, cowardly utilizing the existing address
>>   > translation mechanism of QEMU, and (b) we assume for now
>>   > little-endian memory accesses.
>>
>>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> However this commit used MO_TE (target endianness) for the
>> gen_load_i128() and gen_store_i128() helpers. Likely it was
>> unnoticed because current targets are only built using little
>> endianness:
>>
>>    $ git grep -L TARGET_BIG_ENDIAN=y configs/targets/riscv*
>>    configs/targets/riscv32-linux-user.mak
>>    configs/targets/riscv32-softmmu.mak
>>    configs/targets/riscv64-bsd-user.mak
>>    configs/targets/riscv64-linux-user.mak
>>    configs/targets/riscv64-softmmu.mak
>>
>> Replace by MO_TE -> MO_LE to really use little endianness.
>>
>> Cc: Fabien Portas <fabien.portas@grenoble-inp.org>
>> Cc: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>> Fixes: a2f827ff4f4 ("target/riscv: accessors to registers upper part 
>> and 128-bit load/store")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/riscv/insn_trans/trans_rvi.c.inc | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/ 
>> insn_trans/trans_rvi.c.inc
>> index b9c71604687..df0b555176a 100644
>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>> @@ -389,9 +389,11 @@ static bool gen_load_i128(DisasContext *ctx, 
>> arg_lb *a, MemOp memop)
>>           }
>>       } else {
>>           /* assume little-endian memory access for now */
>> -        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, MO_TEUQ);
>> +        MemOp memop = MO_LEUQ;
>> +
>> +        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, memop);
>>           tcg_gen_addi_tl(addrl, addrl, 8);
>> -        tcg_gen_qemu_ld_tl(desth, addrl, ctx->mem_idx, MO_TEUQ);
>> +        tcg_gen_qemu_ld_tl(desth, addrl, ctx->mem_idx, memop);
>>       }
>>       gen_set_gpr128(ctx, a->rd, destl, desth);
>> @@ -494,9 +496,11 @@ static bool gen_store_i128(DisasContext *ctx, 
>> arg_sb *a, MemOp memop)
>>           tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, memop);
>>       } else {
>>           /* little-endian memory access assumed for now */
>> -        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, MO_TEUQ);
>> +        MemOp memop = MO_LEUQ;
>> +
>> +        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, memop);
>>           tcg_gen_addi_tl(addrl, addrl, 8);
>> -        tcg_gen_qemu_st_tl(src2h, addrl, ctx->mem_idx, MO_TEUQ);
>> +        tcg_gen_qemu_st_tl(src2h, addrl, ctx->mem_idx, memop);
>>       }
>>       return true;
>>   }
> 
> We fix this to use tcg_gen_qemu_{ld,st}_i128.

IIUC the target doesn't use TCGv_i128 but a pair of TCGv_i64
named cpu_gpr[] and cpu_gprh[] (i.e. see how gen_set_gpr128()
set them). Using tcg_gen_qemu_{ld,st}_i128() makes sense but
implies a huge internals rewrite, which 1/ I'm not willing to
do without tests and 2/ I won't have time to do because of
priorities. Could we proceed with this simple patch meanwhile?

Regards,

Phil.

