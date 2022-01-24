Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nBx9o-00017q-DD
	for mharc-qemu-riscv@gnu.org; Mon, 24 Jan 2022 06:05:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nBx9l-00016Q-2E; Mon, 24 Jan 2022 06:05:05 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:51606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nBx9i-0005xr-LL; Mon, 24 Jan 2022 06:05:04 -0500
Received: from mailhub.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 4F80240287;
 Mon, 24 Jan 2022 12:04:59 +0100 (CET)
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by mailhub.u-ga.fr (Postfix) with ESMTP id 4CBA810006E;
 Mon, 24 Jan 2022 12:04:59 +0100 (CET)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 36CEB60067;
 Mon, 24 Jan 2022 12:04:59 +0100 (CET)
Received: from [147.171.165.10] (pers-165-10.vpn.u-ga.fr [147.171.165.10])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 6F42414005C;
 Mon, 24 Jan 2022 12:04:58 +0100 (CET)
Message-ID: <f71dafee-e836-6949-050a-0fe17662957d@univ-grenoble-alpes.fr>
Date: Mon, 24 Jan 2022 12:04:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com
References: <20220124074940.363064-1-frederic.petrot@univ-grenoble-alpes.fr>
 <dcab99a5-4c85-0434-d094-90c7429ba479@c-sky.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH] target/riscv: correct "code should not be reached" for
 x-rv128
In-Reply-To: <dcab99a5-4c85-0434-d094-90c7429ba479@c-sky.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 24 Jan 2022 11:05:06 -0000

Le 24/01/2022 à 09:47, LIU Zhiwei a écrit :
> 
> On 2022/1/24 下午3:49, Frédéric Pétrot wrote:
>> The addition of uxl support in gdbstub adds a few checks on the maximum
>> register length, but omitted MXL_RV128, leading to the occurence of
>> "code should not be reached" in a few places.
>> This patch makes rv128 react as rv64 for gdb, as previously.
> 
> If that is case for rv128, you should also add
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1cb0436187..5ada71e5bf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -528,9 +528,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       switch (env->misa_mxl_max) {
>   #ifdef TARGET_RISCV64
>       case MXL_RV64:
> -        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
> -        break;
>       case MXL_RV128:
> +        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
>           break;

   Thanks Zhiwei for pointing that out, I resend a patch with that too.
   Strangely enough, I didn't bump into that case.

> Still I don't know why we should make rv128 react as rv64 for gdb?

   Well, I should surely do what is necessary to have a working 128-bit
   connection to gdb, but it has a bit of influence on other stuff than qemu,
   e.g. when I configure the gdb-xml file with bitsize 128, gdb tests the
   xlens and returns "bfd requires xlen 8, but target has xlen 16", and
   after that no register can be queried.
   Gdb checks what is called "arch features" and knows only about ELFCLASS32
   and ELFCLASS64, so we are stuck for now.

   Thanks,
   Frédéric

> 
> Thanks,
> Zhiwei
> 
>>
>> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>> ---
>>   target/riscv/gdbstub.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
>> index f531a74c2f..9ed049c29e 100644
>> --- a/target/riscv/gdbstub.c
>> +++ b/target/riscv/gdbstub.c
>> @@ -64,6 +64,7 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray 
>> *mem_buf, int n)
>>       case MXL_RV32:
>>           return gdb_get_reg32(mem_buf, tmp);
>>       case MXL_RV64:
>> +    case MXL_RV128:
>>           return gdb_get_reg64(mem_buf, tmp);
>>       default:
>>           g_assert_not_reached();
>> @@ -84,6 +85,7 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t 
>> *mem_buf, int n)
>>           length = 4;
>>           break;
>>       case MXL_RV64:
>> +    case MXL_RV128:
>>           if (env->xl < MXL_RV64) {
>>               tmp = (int32_t)ldq_p(mem_buf);
>>           } else {
>> @@ -420,6 +422,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>>                                    1, "riscv-32bit-virtual.xml", 0);
>>           break;
>>       case MXL_RV64:
>> +    case MXL_RV128:
>>           gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
>>                                    riscv_gdb_set_virtual,
>>                                    1, "riscv-64bit-virtual.xml", 0);

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

