Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5ied-0002Hl-Pu
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jan 2022 01:23:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ieb-0002GF-9A; Fri, 07 Jan 2022 01:23:09 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:37132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ieY-0007U9-Kd; Fri, 07 Jan 2022 01:23:09 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 7666740486;
 Fri,  7 Jan 2022 07:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1641536583;
 bh=YcGmGIbeq/uu/H8/jqqrP/yP04ZopTr2P/xbaAFRbAw=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=oLMfKOO5B9y1+yYMFRKtLNff6ZBVwhjTWGIvrCp/ZGJXPCQtvuSMyy8eisPvH5n3P
 HqB7TmYUajTd++7lCJPHNtu+RmTOmPgj5noZYg9FUnh9MvXJv1xci8W4I7WI4KGGyo
 nhiW0Yyy5Z174ekUVokA7zOnY6GWai6QPbUiKiEERFKH4SkNGyceweBymGsJAOZTk9
 rlVYThWAMz6s6trkdqNUjw464Rwah8VjAvayCyIRoIT1we9aO0UfRSOjBSFqU+2d/4
 x2NYmbI+a18G1s9l3Nc5GZN+1E42b+hiTOQD91HHxXUEVmdHYsJuN40Tl0DEM11oB+
 8UWC4yUeIvlkQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 640D96005B;
 Fri,  7 Jan 2022 07:23:03 +0100 (CET)
Received: from [192.168.1.64] (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 639D040069;
 Fri,  7 Jan 2022 07:23:02 +0100 (CET)
Message-ID: <cb76d285-7071-c70d-3cb7-ad2978f400dd@univ-grenoble-alpes.fr>
Date: Fri, 7 Jan 2022 07:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: fr
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng
 <bin.meng@windriver.com>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20220106210108.138226-8-frederic.petrot@univ-grenoble-alpes.fr>
 <CAKmqyKMB-zZKNf-HRz-=RR+wtM7UHFo4wCJUiCwF0nJrH4OzOg@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v8 07/18] target/riscv: setup everything for rv64 to
 support rv128 execution
In-Reply-To: <CAKmqyKMB-zZKNf-HRz-=RR+wtM7UHFo4wCJUiCwF0nJrH4OzOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 07 Jan 2022 06:23:09 -0000

On 06/01/2022 22:24, Alistair Francis wrote:
> On Fri, Jan 7, 2022 at 7:04 AM Frédéric Pétrot
> <frederic.petrot@univ-grenoble-alpes.fr> wrote:
>>
>> This patch adds the support of the '-cpu rv128' option to
>> qemu-system-riscv64 so that we can indicate that we want to run rv128
>> executables.
>> Still, there is no support for 128-bit insns at that stage so qemu fails
>> miserably (as expected) if launched with this option.
>>
>> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   include/disas/dis-asm.h |  1 +
>>   target/riscv/cpu.h      |  1 +
>>   disas/riscv.c           |  5 +++++
>>   target/riscv/cpu.c      | 20 ++++++++++++++++++++
>>   target/riscv/gdbstub.c  |  5 +++++
>>   5 files changed, 32 insertions(+)
>>
>> diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
>> index 08e1beec85..102a1e7f50 100644
>> --- a/include/disas/dis-asm.h
>> +++ b/include/disas/dis-asm.h
>> @@ -459,6 +459,7 @@ int print_insn_nios2(bfd_vma, disassemble_info*);
>>   int print_insn_xtensa           (bfd_vma, disassemble_info*);
>>   int print_insn_riscv32          (bfd_vma, disassemble_info*);
>>   int print_insn_riscv64          (bfd_vma, disassemble_info*);
>> +int print_insn_riscv128         (bfd_vma, disassemble_info*);
>>   int print_insn_rx(bfd_vma, disassemble_info *);
>>   int print_insn_hexagon(bfd_vma, disassemble_info *);
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index fa5d238530..efe481f5fb 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -38,6 +38,7 @@
>>   #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>>   #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>>   #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
>> +#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("rv128")
> 
> As this series only adds partial support for 128-bit support, I think
> we should probably change this to "x-rv128". That way we indicate to
> users that it is experimental. That allows us more flexibility in the
> future to have breaking changes and will hopefully avoid confusion
> about the current state. What do you think? I can just make the change
> when I apply the patches.

   Sure, this is clearly experimental (the spec is a draft) and should be
   marked so, I totally agree. Please make the change as you suggest,

   Thanks,
   Frédéric

> 
> Alistair

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

