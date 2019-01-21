Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1glVYh-0001Id-LB
	for mharc-qemu-riscv@gnu.org; Mon, 21 Jan 2019 04:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1glVYe-0001HH-EC
	for qemu-riscv@nongnu.org; Mon, 21 Jan 2019 04:07:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1glVYd-00065g-Qu
	for qemu-riscv@nongnu.org; Mon, 21 Jan 2019 04:07:52 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:56088)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1glVYW-000605-3p; Mon, 21 Jan 2019 04:07:44 -0500
Received: from magmaria.uni-paderborn.de ([131.234.189.24]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 spheron)
	id 1glVYT-0006wj-IH; Mon, 21 Jan 2019 10:07:41 +0100
Received: from mail.uni-paderborn.de by magmaria with queue id 3092490-3;
	Mon, 21 Jan 2019 09:07:40 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
To: Richard Henderson <richard.henderson@linaro.org>,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
	<20190118131456.32451-25-kbastian@mail.uni-paderborn.de>
	<50d95ed2-d8a4-0a05-f67c-0c18b5e87a33@linaro.org>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <037af0d2-b694-bd7d-0762-a6e2845482ac@mail.uni-paderborn.de>
Date: Mon, 21 Jan 2019 10:07:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <50d95ed2-d8a4-0a05-f67c-0c18b5e87a33@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.21.90016, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.18.5561000
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 24/35] target/riscv: Move
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
X-List-Received-Date: Mon, 21 Jan 2019 09:07:54 -0000


On 1/20/19 2:24 AM, Richard Henderson wrote:
> On 1/19/19 12:14 AM, Bastian Koppelmann wrote:
>>   static bool trans_slli(DisasContext *ctx, arg_slli *a)
>>   {
>> -    gen_arith_imm(ctx, OPC_RISC_SLLI, a->rd, a->rs1, a->shamt);
>> +    if (a->rd != 0) {
>> +        TCGv t = tcg_temp_new();
>> +        gen_get_gpr(t, a->rs1);
>> +
>> +        if (a->shamt >= TARGET_LONG_BITS) {
>> +            return false;
>> +        }
> I think the shmat test should be first, so that
>
> 	slli	r0, r1, 99
>
> produces SIGILL instead of translating to a nop.


Oh, that is a very good catch. Thanks.


Cheers,

Bastian


