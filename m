Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1glVWE-0008Vv-19
	for mharc-qemu-riscv@gnu.org; Mon, 21 Jan 2019 04:05:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1glVW9-0008Vk-Sr
	for qemu-riscv@nongnu.org; Mon, 21 Jan 2019 04:05:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1glVW2-0004X6-4X
	for qemu-riscv@nongnu.org; Mon, 21 Jan 2019 04:05:15 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:39944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1glVW1-0004Vx-UW; Mon, 21 Jan 2019 04:05:10 -0500
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 zuban)
	id 1glVVy-0000yq-K9; Mon, 21 Jan 2019 10:05:06 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 3098319-5;
	Mon, 21 Jan 2019 09:05:04 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
To: Richard Henderson <richard.henderson@linaro.org>,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
	<20190118131456.32451-8-kbastian@mail.uni-paderborn.de>
	<74f85a7c-62d1-ca61-9820-7c4deeca4a05@linaro.org>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <3b4cde8c-a403-db62-2c36-34691610fea2@mail.uni-paderborn.de>
Date: Mon, 21 Jan 2019 10:05:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <74f85a7c-62d1-ca61-9820-7c4deeca4a05@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.21.85417, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.18.5561000
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 07/35] target/riscv:
 Convert RVXI fence insns to decodetree
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
X-List-Received-Date: Mon, 21 Jan 2019 09:05:20 -0000


On 1/19/19 10:29 PM, Richard Henderson wrote:
> On 1/19/19 12:14 AM, Bastian Koppelmann wrote:
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
>> ---
>>   target/riscv/insn32.decode              |  2 ++
>>   target/riscv/insn_trans/trans_rvi.inc.c | 23 +++++++++++++++++++++++
>>   target/riscv/translate.c                | 12 ------------
>>   3 files changed, 25 insertions(+), 12 deletions(-)
>>
>> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
>> index 1f5bf1f6f9..804b721ca5 100644
>> --- a/target/riscv/insn32.decode
>> +++ b/target/riscv/insn32.decode
>> @@ -82,3 +82,5 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
>>   sra      0100000 .....    ..... 101 ..... 0110011 @r
>>   or       0000000 .....    ..... 110 ..... 0110011 @r
>>   and      0000000 .....    ..... 111 ..... 0110011 @r
>> +fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
>> +fence_i  ---- ----   ----   ----- 001 ----- 0001111
>> diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
>> index 01f751650a..138a8397d9 100644
>> --- a/target/riscv/insn_trans/trans_rvi.inc.c
>> +++ b/target/riscv/insn_trans/trans_rvi.inc.c
>> @@ -318,3 +318,26 @@ static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
>>       return true;
>>   }
>>   #endif
>> +
>> +static bool trans_fence(DisasContext *ctx, arg_fence *a)
>> +{
>> +#ifndef CONFIG_USER_ONLY
>> +    /* FENCE is a full memory barrier. */
>> +    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
>> +#endif
>> +    return true;
>> +}
>> +
>> +static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
>> +{
>> +#ifndef CONFIG_USER_ONLY
>> +    /*
>> +     * FENCE_I is a no-op in QEMU,
>> +     * however we need to end the translation block
>> +     */
>> +    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
>> +    tcg_gen_exit_tb(NULL, 0);
>> +    ctx->base.is_jmp = DISAS_NORETURN;
>> +#endif
>> +    return true;
> Rebase error.  You need to remove the ifdefs that were removed...


Whoops, I guess that's what you get, if you don't touch a patchset for 
some time ;)



