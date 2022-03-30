Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZNl6-0005UF-Vk
	for mharc-qemu-riscv@gnu.org; Tue, 29 Mar 2022 22:08:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nZNl5-0005U1-Em; Tue, 29 Mar 2022 22:08:27 -0400
Received: from [2401:2500:203:30b:4000:6bfe:4757:0] (port=59486
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nZNl0-0003AB-Oz; Tue, 29 Mar 2022 22:08:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 56586300089;
 Wed, 30 Mar 2022 02:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1648606092;
 bh=a4PbTvU18/oG7XeSsYrmCPmu5icXnQsdYMwES4K01+k=;
 h=Message-ID:Date:Mime-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 b=ZSObCrj4mFBSLreBet7KRRA2ou31zdO43e7eS0kd/GcTx4P8utZtYobudSOQ7FRD+
 iuDOlH+3xYzFGikGxxbY/Z4XnkWKuu2TYqEa9HUTmav6zH8uBPKEkmc3MhN5hvnEtl
 JytE879YyvY/SiY18ly0UaTijAEIFq8p3xDwlt4c=
Message-ID: <0f15b9d2-9be3-41ae-9526-7585de860952@irq.a4lg.com>
Date: Wed, 30 Mar 2022 11:08:10 +0900
Mime-Version: 1.0
Subject: Re: [PATCH v2 1/1] target/riscv: misa to ISA string conversion fix
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>,
 Alistair Francis <alistair23@gmail.com>, Frank Chang <frank.chang@sifive.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <cover.1648473008.git.research_trasio@irq.a4lg.com>
 <4a4c11213a161a7eedabe46abe58b351bb0e2ef2.1648473008.git.research_trasio@irq.a4lg.com>
 <0b23307b-5427-0882-9bc6-bd2bd22f0c3d@univ-grenoble-alpes.fr>
From: Tsukasa OI <research_trasio@irq.a4lg.com>
In-Reply-To: <0b23307b-5427-0882-9bc6-bd2bd22f0c3d@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 30 Mar 2022 02:08:27 -0000

On 2022/03/30 1:29, Frédéric Pétrot wrote:
> Hello,
> 
> Le 28/03/2022 à 15:11, Tsukasa OI a écrit :
>> Some bits in RISC-V `misa' CSR should not be reflected in the ISA
>> string.  For instance, `S' and `U' (represents existence of supervisor
>> and user mode, respectively) in `misa' CSR must not be copied since
>> neither `S' nor `U' are valid single-letter extensions.
>>
>> This commit also removes all reserved/dropped single-letter "extensions"
>> from the list.
>>
>> -   "B": Not going to be a single-letter extension (misa.B is reserved).
>> -   "J": Not going to be a single-letter extension (misa.J is reserved).
>> -   "K": Not going to be a single-letter extension (misa.K is reserved).
>> -   "L": Dropped.
>> -   "N": Dropped.
>> -   "T": Dropped.
>>
>> It also clarifies that the variable `riscv_single_letter_exts' is a
>> single-letter extension order list.
>>
>> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
>> ---
>>   target/riscv/cpu.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index ddda4906ff..1f68c696eb 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -34,7 +34,7 @@
>>     /* RISC-V CPU definitions */
>>   -static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>> +static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
>>     const char * const riscv_int_regnames[] = {
>>     "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
>> @@ -901,12 +901,12 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>>   char *riscv_isa_string(RISCVCPU *cpu)
>>   {
>>       int i;
>> -    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) + 1;
>> +    const size_t maxlen = sizeof("rv128") + sizeof(riscv_single_letter_exts);
>>       char *isa_str = g_new(char, maxlen);
>>       char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
> 
> To avoid one dependency on TARGET_LONG_BITS that is not necessary now that we
> have mxl, I would suggest to replace the previous line with:
>      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d",
>                                   1 << (4 + cpu->env.misa_mxl_max));

LGTM except... that won't be a part of my patch (you are trying to fix
separate issue).  You can submit separate patch for this.

To comment, I like
	16 << cpu->env.misa_mxl_max
rather than
	1 << (4 + cpu->env.misa_mxl_max)
for consistency with target/riscv/gdbstub.c:
	int bitsize = 16 << env->misa_mxl_max;

Tsukasa

> 
> Frédéric
> 

