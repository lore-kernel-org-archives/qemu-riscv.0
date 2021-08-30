Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKp1L-0002zF-Lz
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 17:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKp1K-0002xO-I0; Mon, 30 Aug 2021 17:40:46 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKp1I-0003VS-6h; Mon, 30 Aug 2021 17:40:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id i3so9722761wmq.3;
 Mon, 30 Aug 2021 14:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oX2OGbnzbccy5IFjTgp1jj2+IwrBnLFDn7gnE4X0tdQ=;
 b=oCluvLfPgVb+7mjEaJGMlvoEnDi686UVbvLW0N6e8viu8pAAV9dXmkxfGhOGXeUJUh
 y7M83oLMMTk2e//4hySqBHDUQyZMZxxWjR6dGkFCZhWRV23X/wD4qnp10WoHAZUcfbN6
 qfRKvqVluk6B0Vb7KQbp9g9mmozd9JxG0tnWomIRakD7MrrIxnC7qiJmH/Ui0/e90bGH
 F5WknEEImAsjnv+BLNjKeTcGlevtK03dSR/kbj+jS4w/1glt9898tvdG/U60HkRhfiwx
 7Yx4J0irjJ3QaEr+HMNbP0tedkWa5w6afhepf9vQybKN5Q3ZXjXBBkhXYtBFgPC4Jpzj
 8+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oX2OGbnzbccy5IFjTgp1jj2+IwrBnLFDn7gnE4X0tdQ=;
 b=WnmSY40US2W8MJ4ONgHVIxbPRg+RXox9B4f8jOh3uI22BXKcxXhur+MbpRNA/8b/dV
 Sc3ueebYYeLy46kVDbr4Tz1MKv61MXdmyJc1epn+JF7U1UtItTky9uwgUdpZ4hBFPHKh
 9M4tdxBs/UnrP8HQ4fJOH5gPwDKlirdnnLO81L5ZdcEzIrjzvet7VN6ezitTkJObA4x4
 /6xuNXlr9QnQOtT508h45Tzqq/MX79RmKbI870WHPZWw589asTLy3dmyXohWWxMyfHot
 dNGWyFgCXnUnnYaT3VhT5YgtuxMvNge1scnPvOfNt7oVJ+XReWa0XurlYY/zzZnutc2f
 g1iw==
X-Gm-Message-State: AOAM530iOw43wdYiXfGO+FoGNe8ySwQFJYTY6wR0s2ACNauQz0BM6Avc
 fthRcFHPH23Sr03ne0tRwkQ=
X-Google-Smtp-Source: ABdhPJwTPxDVPPYCJkcKmL4XYl6BFsmrGOER40ne6vgGj71VGTLZmUeGXet9D6pEQo2W/3qeVxhXkw==
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr976532wms.139.1630359641592; 
 Mon, 30 Aug 2021 14:40:41 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s12sm16729045wru.41.2021.08.30.14.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:40:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 4/8] target/riscv: 128-bit arithmetic and logic
 instructions
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-4-frederic.petrot@univ-grenoble-alpes.fr>
 <f9094de6-f36a-4da7-d5ef-9fa976ae4c18@amsat.org>
Message-ID: <653d064f-7020-dce0-a43b-6697e68b79b0@amsat.org>
Date: Mon, 30 Aug 2021 23:40:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f9094de6-f36a-4da7-d5ef-9fa976ae4c18@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 30 Aug 2021 21:40:46 -0000

On 8/30/21 11:38 PM, Philippe Mathieu-Daudé wrote:
> On 8/30/21 7:16 PM, Frédéric Pétrot wrote:
>> Adding the support for the 128-bit arithmetic and logic instructions.
>> Remember that all (i) instructions are now acting on 128-bit registers, that
>> a few others are added to cope with values that are held on 64 bits within
>> the 128-bit registers, and that the ones that cope with values on 32-bit
>> must also be modified for proper sign extension.
>> Most algorithms taken from Hackers' delight.
>>
>> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
>> ---
>>  target/riscv/insn32.decode              |  13 +
>>  target/riscv/insn_trans/trans_rvi.c.inc | 955 +++++++++++++++++++++++-
>>  target/riscv/translate.c                |  25 +
>>  3 files changed, 976 insertions(+), 17 deletions(-)
> 
>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
>> index 772330a766..0401ba3d69 100644
>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>> @@ -26,14 +26,20 @@ static bool trans_illegal(DisasContext *ctx, arg_empty *a)
>>  
>>  static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
>>  {
>> -     REQUIRE_64BIT(ctx);
>> -     return trans_illegal(ctx, a);
>> +    REQUIRE_64_OR_128BIT(ctx);
>> +    return trans_illegal(ctx, a);
>>  }
>>  
>>  static bool trans_lui(DisasContext *ctx, arg_lui *a)
>>  {
>>      if (a->rd != 0) {
>>          tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm);
>> +#if defined(TARGET_RISCV128)
>> +        if (is_128bit(ctx)) {
> 
> Maybe this could allow the compiler eventually elide the
> code and avoid superfluous #ifdef'ry:
> 
>            if (TARGET_LONG_BITS >= 128) {

Actually:

             if (TARGET_LONG_BITS >= 128 && is_128bit(ctx)) {

> 
>> +            tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd],
>> +                                 cpu_gpr[a->rd]);
>> +        }
>> +#endif
>>      }
>>      return true;
>>  }
> 

