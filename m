Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1glVXc-0000hD-8j
	for mharc-qemu-riscv@gnu.org; Mon, 21 Jan 2019 04:06:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1glVXY-0000g1-Tz
	for qemu-riscv@nongnu.org; Mon, 21 Jan 2019 04:06:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1glVXX-0005SZ-7Y
	for qemu-riscv@nongnu.org; Mon, 21 Jan 2019 04:06:44 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:51398)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1glVXX-0005Rg-0U; Mon, 21 Jan 2019 04:06:43 -0500
Received: from magmaria.uni-paderborn.de ([131.234.189.24]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 amazonia)
	id 1glVXU-0005XI-8x; Mon, 21 Jan 2019 10:06:40 +0100
Received: from mail.uni-paderborn.de by magmaria with queue id 3092488-3;
	Mon, 21 Jan 2019 09:06:39 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
To: Richard Henderson <richard.henderson@linaro.org>,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
	<20190118131456.32451-13-kbastian@mail.uni-paderborn.de>
	<8eb4c646-4580-c2f0-653c-55a2350a6309@linaro.org>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <f71b9f43-373c-9715-b34c-b6c2678afe57@mail.uni-paderborn.de>
Date: Mon, 21 Jan 2019 10:06:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <8eb4c646-4580-c2f0-653c-55a2350a6309@linaro.org>
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
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 12/35] target/riscv:
 Convert RV32F insns to decodetree
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
X-List-Received-Date: Mon, 21 Jan 2019 09:06:46 -0000


On 1/19/19 10:51 PM, Richard Henderson wrote:
> On 1/19/19 12:14 AM, Bastian Koppelmann wrote:
>> +static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)
>> +{
>> +    REQUIRE_FPU;
>> +    if (a->rs1 == a->rs2) { /* FNEG */
>> +        tcg_gen_xori_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], INT32_MIN);
>> +    } else {
>> +        TCGv_i64 t0 = tcg_temp_new_i64();
>> +        tcg_gen_not_i64(t0, cpu_fpr[a->rs2]);
>> +        tcg_gen_deposit_i64(cpu_fpr[a->rd], t0, cpu_fpr[a->rs1], 0, 31);
>> +        tcg_temp_free_i64(t0);
>> +    }
>> +    return true;
>> +}
>> +
>> +static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s *a)
>> +{
>> +    REQUIRE_FPU;
>> +    if (a->rs1 == a->rs2) { /* FABS */
>> +        tcg_gen_andi_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], ~INT32_MIN);
> Not an issue with this patch set, since you are just moving existing code.
>
> However, while I'm thinking about it:
>
> It just occured to me that these uses of INT32_MIN are not ideal, in that they
> are (signed) -0x80000000 and not 0x0000000080000000ull.
>
> In particular, FNEG will remove the NaN-box of the 32-bit value.
>
> Similarly with the construction of fsgnjn_s wrt not + deposit.  It might be
> better to simply xor the sign bit rather than not the whole 64-bit value.
>
> Have you tried using RISU to compare these sorts of results vs real hardware,
> or spike?


No I haven't run it against spike or real hardware. My tests consist of 
'does fedora still boot without errors' and running the riscv-tests.


Cheers,

Bastian


