Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4mU9-0003Rx-0h
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 09:02:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1h4mTx-0002bl-Pw
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:02:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1h4mGL-0001J4-3K
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 08:48:38 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:39342)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1h4mGJ-0001I2-EA; Fri, 15 Mar 2019 08:48:35 -0400
Received: from magmaria.uni-paderborn.de ([131.234.189.24]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 spheron)
	id 1h4mGG-0003ga-I3; Fri, 15 Mar 2019 13:48:32 +0100
Received: from mail.uni-paderborn.de by magmaria with queue id 3206831-3;
	Fri, 15 Mar 2019 12:48:31 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: alistair23@gmail.com, Peter Maydell <peter.maydell@linaro.org>,
	peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <2d60f4a8-66ae-12e0-6de4-2440eab2459a@mail.uni-paderborn.de>
	<mhng-c6f37e6f-035e-4bdd-9853-de6c69edef3a@palmer-si-x1c4>
	<CANs6eMnXic+ypkQRrgCFuUKLe+Q9p00BYEDkoYbhT-rfiC0WBQ@mail.gmail.com>
	<3e79248f-bddb-f28a-0011-9ec8fdca000b@mail.uni-paderborn.de>
Message-ID: <48cee396-a001-3e37-b37b-2306166524cd@mail.uni-paderborn.de>
Date: Fri, 15 Mar 2019 13:48:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <3e79248f-bddb-f28a-0011-9ec8fdca000b@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US-large
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.3.15.124217, AntiVirus-Engine: 5.58.0,
	AntiVirus-Data: 2019.2.22.5580002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 17/29] target/riscv: Convert
 quadrant 1 of RVXC insns to decodetree
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
X-List-Received-Date: Fri, 15 Mar 2019 13:02:43 -0000


On 3/15/19 1:44 PM, Bastian Koppelmann wrote:
>
> On 3/15/19 1:07 PM, Palmer Dabbelt wrote:
>> On Fri, Mar 15, 2019 at 4:19 AM Palmer Dabbelt <palmer@sifive.com> 
>> wrote:
>>
>>> On Fri, 15 Mar 2019 02:06:07 PDT (-0700), Bastian Koppelmann wrote:
>>>> Hi Alistair
>>>>
>>>> On 3/14/19 9:28 PM, Alistair Francis wrote:
>>>>> On Wed, Mar 13, 2019 at 7:53 AM Palmer Dabbelt <palmer@sifive.com>
>>> wrote:
>>>>>> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>>>>>>
>>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>>>> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>>>>>> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
>>>>> This commit is the first bad commit in breaking 32-bit boot.
>>>>>
>>>>> It looks like the jal doesn't jump to the correct address:
>>>>>
>>>>> ----------------
>>>>> IN:
>>>>> 0x80000022:  00050433          add             s0,a0,zero
>>>>> 0x80000026:  000584b3          add             s1,a1,zero
>>>>> 0x8000002a:  2c79              jal ra,670          #
>>> 0x800002c8
>>>>> ----------------
>>>>> IN:
>>>>> 0x800002c8:  00000533          add a0,zero,zero
>>>>> 0x800002cc:  8082              ret
>>>>
>>>> Oops! Can you point me to the binary to reproduce this?
>>> I think I've traced it down to something simple: in my hello world 
>>> binary
>>> I see
>>>
>>>      20401a8c:       2a45                    jal     20401c3c <atexit>
>>>
>>> in the objdump, and I see
>>>
>>>      IN: _start
>>>      0x20401a8c:  2a45              jal ra,432          #
>>> 0x20401c3c
>>>
>>> but then QEMU jumps to 0x20401a9d.  I have a feeling it's something 
>>> wrong
>>> with
>>> gen_jal() that disappeared during the cleanups that we dropped in 
>>> order to
>>> fix
>>> the build issues.
>>>
>>> I'm running
>>>
>>>      ./riscv32-softmmu/qemu-system-riscv32 -machine sifive_e -kernel
>>> ~/work/sifive/freedom-e-sdk/software/hello/hello -nographic -d
>>> in_asm,out_asm,exec,cpu -singlestep |& tee out.log
>>>
>>> on the "hifive1" branch of github.com/palmer-dabbelt/qemu, which 
>>> just has
>>> a
>>> PRCI fixup that I forgot about and haven't sent upstream yet (I'll 
>>> do that
>>> after this issue).  The binary should be at
>>>
>>>      http://www.dabbelt.com/~palmer/hello.elf
>>>
>>> and the debug log at
>>>
>>>      http://www.dabbelt.com/~palmer/out.log
>>>
>>> You can build the binary from github.com/sifive/freedom-e-sdk via
>>>
>>>     make software PROGRAM=hello TARGET=sifive-hifive1
>>>
>>> using the riscv64-unknown-elf-gcc-20181127-x86_64-linux-ubuntu14 
>>> toolchain
>>> binaries from our website (newer ones should work, but probably won't
>>> produce
>>> exactly the same output).
>>>
>>> I'll poke around after grabbing some dinner...
>>>
>> OK, I'm pretty sure this is it:
>>
>> c_jal_addiw       001 .  .....  ..... 01 @ci #Note: parse rd and/or imm
>> manually
>
> Thanks for the digging. Yes this bug was fixed in the patches we 
> dropped :/. Heres the fix:
>
> diff --git a/target/riscv/insn_trans/trans_rvc.inc.c 
> b/target/riscv/insn_trans/trans_rvc.inc.c
> index bcdf64d3b7..5241a8414e 100644
> --- a/target/riscv/insn_trans/trans_rvc.inc.c
> +++ b/target/riscv/insn_trans/trans_rvc.inc.c
> @@ -88,7 +88,9 @@ static bool trans_c_jal_addiw(DisasContext *ctx, 
> arg_c_jal_addiw *a)
>  {
>  #ifdef TARGET_RISCV32
>      /* C.JAL */
> -    arg_jal arg = { .rd = 1, .imm = a->imm };
> +    arg_c_j tmp;
> +    extract_cj(&tmp, ctx->opcode);
Sorry, it's decode_insn16_extract_cj()


