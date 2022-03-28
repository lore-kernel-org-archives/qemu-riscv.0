Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYp8L-0000sL-Iu
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 09:10:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nYp8H-0000na-Kp; Mon, 28 Mar 2022 09:10:05 -0400
Received: from [2401:2500:203:30b:4000:6bfe:4757:0] (port=59416
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nYp8A-00045M-Uy; Mon, 28 Mar 2022 09:10:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 9AAE7300089;
 Mon, 28 Mar 2022 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1648472994;
 bh=I0UcRbWfzamFNinJ2mg+IfK80/9rFYu+0morhS8Hnw0=;
 h=Message-ID:Date:Mime-Version:From:Subject:To:Cc:References:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 b=g1GIFLs9SlXHF6cYVP1+u+v9zVwCpE3iIsQH3OAOrHJKGvlCeWNqNffpodsjWVjpg
 eJ3lzv9+RF9yV3ae+uFuwAu1FuPPDjdFTsrsPGks4lhI2SMJWGo8kX/SzpM2bqXgzy
 kA9LvWXLCBhNDDKzJf2LGQX84zCNEiNjyYYRNaI4=
Message-ID: <dabea3df-b745-548a-289d-54e0440623cc@irq.a4lg.com>
Date: Mon, 28 Mar 2022 22:09:53 +0900
Mime-Version: 1.0
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: Re: [PATCH (PING) 1/1] target/riscv: misa to ISA string conversion fix
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
References: <cover.1648270894.git.research_trasio@irq.a4lg.com>
 <dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com>
 <CAKmqyKPGkdOJAXZjSKvk23RaNY01ZpUziG7hCHyc+0YbOqzstQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAKmqyKPGkdOJAXZjSKvk23RaNY01ZpUziG7hCHyc+0YbOqzstQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2401:2500:203:30b:4000:6bfe:4757:0 (failed)
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Mar 2022 13:10:06 -0000

Hi Alistair,

On 2022/03/28 8:29, Alistair Francis wrote:
> On Sat, Mar 26, 2022 at 3:46 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>>
>> Some bits in RISC-V `misa' CSR should not be reflected in the ISA
>> string.  For instance, `S' and `U' (represents existence of supervisor
>> and user mode, respectively) in `misa' CSR must not be copied since
>> neither `S' nor `U' are valid single-letter extensions.
> 
> Thanks for the patch.
> 
>>
>> This commit restricts which bits to copy from `misa' CSR to ISA string
>> with another fix: `C' extension should be preceded by `L' extension.
> 
> The L extension has been removed, so it probably makes more sense to
> just remove it at this stage instead of fixing the order.

Thanks.  I'll reflect this in v2.


> 
>>
>> It also clarifies that RISC-V extension order string is actually a
>> single-letter extension order list.
>>
>> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
>> ---
>>  target/riscv/cpu.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index ddda4906ff..84877cf24a 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -34,7 +34,7 @@
>>
>>  /* RISC-V CPU definitions */
>>
>> -static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>> +static const char riscv_single_letter_exts[] = "IEMAFDQLCBJTPVNH";
> 
> What about K?

Not having "K" in the string is completely intentional in PATCH v1.

riscv_single_letter_exts is intended to be valid single-letter
extensions (not canonical order of multi-letter Z* extensions).

Considering this (and the fact that we can remove "L"), correct fix to
this might be to "remove B and J", not to "add K".

"B", "K" and "J" are not going to be single-letter extensions (for now)
but prefixes of subextensions (Zb*, Zk* and non-ratified proposal(s?)
with Zj*).

For "B" and "J", this commit might help understanding it:
https://github.com/riscv/riscv-isa-manual/commit/c1c77c4902d5e7c58613d725d09d66a2a743da1c

For "K",
https://github.com/riscv/riscv-crypto/releases/tag/v0.9.3-scalar
    (with misa.K)
https://github.com/riscv/riscv-crypto/releases/tag/v0.9.4-scalar
    (WITHOUT misa.K)
https://github.com/riscv/riscv-crypto/releases/tag/v1.0.0-scalar
    (ratified; WITHOUT misa.K)
https://lists.riscv.org/g/tech-crypto-ext/topic/riscv_k_in_misa_risc_v/85354476

Dropped "N" and "T" extensions are to be removed, too.

Not-yet-ratified "P" could be removed for now but will be kept in v2.


> 
> Why not use IEMAFDQCBKJTPVNH instead?

I noticed the order "K" -> "J" (in the draft RISC-V ISA Manual).  That
will make a patch to GNU Binutils (that has "J" -> "K" order).

Thanks!

Tsukasa


> 
> Alistair
> 
>>
>>  const char * const riscv_int_regnames[] = {
>>    "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
>> @@ -901,12 +901,12 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>>  char *riscv_isa_string(RISCVCPU *cpu)
>>  {
>>      int i;
>> -    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) + 1;
>> +    const size_t maxlen = sizeof("rv128") + sizeof(riscv_single_letter_exts);
>>      char *isa_str = g_new(char, maxlen);
>>      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
>> -    for (i = 0; i < sizeof(riscv_exts); i++) {
>> -        if (cpu->env.misa_ext & RV(riscv_exts[i])) {
>> -            *p++ = qemu_tolower(riscv_exts[i]);
>> +    for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
>> +        if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
>> +            *p++ = qemu_tolower(riscv_single_letter_exts[i]);
>>          }
>>      }
>>      *p = '\0';
>> --
>> 2.32.0
>>
>>
> 

