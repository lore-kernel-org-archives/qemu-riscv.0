Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXdaS-0000qb-5f
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 02:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1pXdaQ-0000pL-C8; Thu, 02 Mar 2023 02:42:46 -0500
Received: from forward502a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d502])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1pXdaO-0005ZW-Ay; Thu, 02 Mar 2023 02:42:46 -0500
Received: from vla5-04fcbc3a0ab0.qloud-c.yandex.net
 (vla5-04fcbc3a0ab0.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3484:0:640:4fc:bc3a])
 by forward502a.mail.yandex.net (Yandex) with ESMTP id 9DF7F5EA5C;
 Thu,  2 Mar 2023 10:42:36 +0300 (MSK)
Received: by vla5-04fcbc3a0ab0.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id ZgQSWmAcCKo1-4YwEXlZx; Thu, 02 Mar 2023 10:42:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1677742956; bh=ZSkj2TRVB91BGwA97FZrzk7X66I6A7mLY+Z7ScN7LtQ=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=OF4AdHF1irEoUzZdrS+8F1jAqRnoZnnlUQv7y+3NgwXH26W2fp6VzJKsg0FE5aC+p
 4Gg5dhUi1D3pcaySoOxsi1FdzWdXexKPYqlujqQdX+G88krkpz+h7n9wyGyCgrA5qV
 C+ycQbPR8+0A3vLMfbVS9rytfbrRXYeieV/hHE+w=
Authentication-Results: vla5-04fcbc3a0ab0.qloud-c.yandex.net;
 dkim=pass header.i=@syntacore.com
Message-ID: <7a5c6357-a148-2160-ba3f-96e6c6720bf9@syntacore.com>
Date: Thu, 2 Mar 2023 10:42:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] [PATCH] disas/riscv Fix ctzw disassemble
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, dbarboza@ventanamicro.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <mhng-542399b9-3e5e-4c0c-a5f5-97dbf16f7554@palmer-ri-x1c9a>
From: Ivan Klokov <ivan.klokov@syntacore.com>
In-Reply-To: <mhng-542399b9-3e5e-4c0c-a5f5-97dbf16f7554@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:d502;
 envelope-from=ivan.klokov@syntacore.com; helo=forward502a.mail.yandex.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Mar 2023 07:42:47 -0000

Hello, Palmer!

Thanks for your reviewing

I'm sorry, I sent V2 patch, but forgot to add the appropriate tag.

Please see 
https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg05278.html

It was also reviewed by Daniel Henrique Barboza and weiwei

02.03.2023 3:32, Palmer Dabbelt пишет:
> On Fri, 17 Feb 2023 07:45:14 PST (-0800), dbarboza@ventanamicro.com 
> wrote:
>>
>>
>> On 2/17/23 12:14, Ivan Klokov wrote:
>>> Due to typo in opcode list, ctzw is disassembled as clzw instruction.
>>>
>>
>> The code was added by 02c1b569a15b4b06a so I believe a "Fixes:" tag 
>> is in
>> order:
>>
>> Fixes: 02c1b569a15b ("disas/riscv: Add Zb[abcs] instructions")
>>
>>> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
>>> ---
>>>   disas/riscv.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/disas/riscv.c b/disas/riscv.c
>>> index ddda687c13..d0639cd047 100644
>>> --- a/disas/riscv.c
>>> +++ b/disas/riscv.c
>>> @@ -1644,7 +1644,7 @@ const rv_opcode_data opcode_data[] = {
>>>       { "minu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>>>       { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>>>       { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>>> -    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>>> +    { "ctzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>>>       { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>>
>>
>> Does the order matter here? This patch is putting ctzw before clzw, 
>> but 20 lines
>> or so before we have "clz" after "ctz".
>
> IIUC the ordering does matter: the values in rv_op_* need to match the 
> index of opcode_data[].  decode_inst_opcode() fills out rv_op_*, and 
> then the various decode bits (with format_inst() being the most 
> relevant as it looks at the name field).
>
> So unless I'm missing something, the correct patch should look like
>
>    diff --git a/disas/riscv.c b/disas/riscv.c
>    index ddda687c13..54455aaaa8 100644
>    --- a/disas/riscv.c
>    +++ b/disas/riscv.c
>    @@ -1645,7 +1645,7 @@ const rv_opcode_data opcode_data[] = {
>         { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>         { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>         { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>    -    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>    +    { "ctzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>         { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>         { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
>         { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>
> The threading seems to have gotten a little screwed up with the v2 so 
> sorry if
> I missed something, but I didn't see one with the ordering changed.  I 
> stuck
> what I think is a correct patch over at
> <https://github.com/qemu/qemu/commit/09da30795bcca53447a6f6f9dde4aa91a48f8a01>, 
>
> LMK if that's OK (or just send a v3).
>
>> If the order doesn't matter I think it would be nice to put ctzw 
>> after clzw.
>>
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>>       { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>>>       { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
>

