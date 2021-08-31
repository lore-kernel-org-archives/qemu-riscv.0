Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL6VI-00070n-Mz
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 12:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mL6VE-0006wL-Qh; Tue, 31 Aug 2021 12:20:49 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:34172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mL6V2-0007Hv-Po; Tue, 31 Aug 2021 12:20:48 -0400
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 07E0A41856;
 Tue, 31 Aug 2021 18:20:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1630426832;
 bh=uM/jh2SiuHcD61N4L9cUZcBdAbEUUOp9yvVN3JSFw2E=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=XPEYuCD33h11GMbBfyo/ivlBP62uTKcrisLRE1X83TvhkjkFf9iJjmpM39R7ARVnY
 VaOs6d+8+MuqcbnRleItv9GteHA1GfugcZlvKXykb5/a6D2cXT5hxPeljW/6czS8/Z
 VCA+vkzqiInp/gwNJ+L7YOF0b1kt4EOfEJo4HR2UWaMgNABfQyNKpNRD/4aqg9K9mJ
 FcB5P0+ykgvaf9dj5PuNHDt4AQ8h3RVUxvyEYRmKxmZ3lqPByAZhkoc/spIDOADwxT
 +NFH2LyDWi/4xu4SfXNGf6R1/4IvuBYAQGsN7PBZ73XQe2UoFzPIawKk9Z7veSkOa+
 05/HN/uxhUUWA==
Received: from smtps.univ-grenoble-alpes.fr (smtps1.u-ga.fr [152.77.1.30])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id 01916803C3;
 Tue, 31 Aug 2021 18:20:32 +0200 (CEST)
Received: from [147.171.132.208] (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 7018C187E19;
 Tue, 31 Aug 2021 18:20:31 +0200 (CEST)
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <CAKmqyKOiqe1wic+_0si7PTTCT62XqWXc3h=0LqCh229Q0x8R6A@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH 1/8] target/riscv: Settings for 128-bit extension support
Message-ID: <4800e7bc-d168-8f79-4e29-27bfadc6bca2@univ-grenoble-alpes.fr>
Date: Tue, 31 Aug 2021 18:20:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOiqe1wic+_0si7PTTCT62XqWXc3h=0LqCh229Q0x8R6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (110)
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 31 Aug 2021 16:20:50 -0000

Hello Alistair,

Le 31/08/2021 à 05:13, Alistair Francis a écrit :
> On Tue, Aug 31, 2021 at 5:26 AM Frédéric Pétrot
> <frederic.petrot@univ-grenoble-alpes.fr> wrote:
>>
>> Starting 128-bit extension support implies a few modifications in the
>> existing sources because checking for 32-bit is done by checking that
>> it is not 64-bit and vice-versa.
>> We now consider the 3 possible xlen values so as to allow correct
>> compilation for both existing targets while setting the compilation
>> framework so that it can also handle the riscv128-softmmu target.
>> This includes gdb configuration files, that are just the bare copy of the
>> 64-bit ones as gdb does not honor, yet, 128-bit CPUs.
>> To consider the 3 xlen values, we had to add a misah field, representing the
>> upper 64 bits of the misa register.
>>
>> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
>> ---
>>  configs/devices/riscv128-softmmu/default.mak | 16 ++++++
>>  configs/targets/riscv128-softmmu.mak         |  5 ++
>>  gdb-xml/riscv-128bit-cpu.xml                 | 48 ++++++++++++++++++
>>  gdb-xml/riscv-128bit-virtual.xml             | 12 +++++
>>  include/hw/riscv/sifive_cpu.h                |  4 ++
>>  target/riscv/Kconfig                         |  3 ++
>>  target/riscv/arch_dump.c                     |  3 +-
>>  target/riscv/cpu-param.h                     |  3 +-
>>  target/riscv/cpu.c                           | 51 +++++++++++++++++---
>>  target/riscv/cpu.h                           | 19 ++++++++
>>  target/riscv/gdbstub.c                       |  3 ++
>>  target/riscv/insn_trans/trans_rvd.c.inc      | 10 ++--
>>  target/riscv/insn_trans/trans_rvf.c.inc      |  2 +-
>>  target/riscv/translate.c                     | 45 ++++++++++++++++-
>>  14 files changed, 209 insertions(+), 15 deletions(-)
>>  create mode 100644 configs/devices/riscv128-softmmu/default.mak
>>  create mode 100644 configs/targets/riscv128-softmmu.mak
>>  create mode 100644 gdb-xml/riscv-128bit-cpu.xml
>>  create mode 100644 gdb-xml/riscv-128bit-virtual.xml
> 
> Hey!
> 
> Thanks for the patches!
> 
> Overall this patch looks good.

  Thanks for cheering!

> It would greatly help reviewing and the speed in which this can be
> merged if you can split it up more. A lot of these changes probably
> can be separate patches (for example a patch to add misah). I know it
> can sometimes seem a little silly, but it greatly helps with reviewing
> when patches are small and self contained.

  Ok, got it.
>>
>> diff --git a/configs/devices/riscv128-softmmu/default.mak b/configs/devices/riscv128-softmmu/default.mak
>> new file mode 100644
>> index 0000000000..31439dbcfe
>> --- /dev/null
>> +++ b/configs/devices/riscv128-softmmu/default.mak
>> @@ -0,0 +1,16 @@
>> +# Default configuration for riscv128-softmmu
>> +
>> +# Uncomment the following lines to disable these optional devices:
>> +#
>> +#CONFIG_PCI_DEVICES=n
>> +CONFIG_SEMIHOSTING=y
>> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>> +
>> +# Boards:
>> +#
>> +CONFIG_SPIKE=n
>> +CONFIG_SIFIVE_E=n
>> +CONFIG_SIFIVE_U=n
>> +CONFIG_RISCV_VIRT=y
>> +CONFIG_MICROCHIP_PFSOC=n
>> +CONFIG_SHAKTI_C=n
>> diff --git a/configs/targets/riscv128-softmmu.mak b/configs/targets/riscv128-softmmu.mak
>> new file mode 100644
>> index 0000000000..e300c43c8e
>> --- /dev/null
>> +++ b/configs/targets/riscv128-softmmu.mak
>> @@ -0,0 +1,5 @@
>> +TARGET_ARCH=riscv128
>> +TARGET_BASE_ARCH=riscv
>> +TARGET_SUPPORTS_MTTCG=y
>> +TARGET_XML_FILES= gdb-xml/riscv-128bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-128bit-virtual.xml
>> +TARGET_NEED_FDT=y
>> diff --git a/gdb-xml/riscv-128bit-cpu.xml b/gdb-xml/riscv-128bit-cpu.xml
>> new file mode 100644
>> index 0000000000..c98168148f
>> --- /dev/null
>> +++ b/gdb-xml/riscv-128bit-cpu.xml
>> @@ -0,0 +1,48 @@
>> +<?xml version="1.0"?>
>> +<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
>> +
>> +     Copying and distribution of this file, with or without modification,
>> +     are permitted in any medium without royalty provided the copyright
>> +     notice and this notice are preserved.  -->
>> +
>> +<!-- Register numbers are hard-coded in order to maintain backward
>> +     compatibility with older versions of tools that didn't use xml
>> +     register descriptions.  -->
>> +
>> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
>> +<!-- FIXME : All GPRs are marked as 64-bits since gdb doesn't like 128-bit registers for now. -->
>> +<feature name="org.gnu.gdb.riscv.cpu">
>> +  <reg name="zero" bitsize="64" type="int" regnum="0"/>
>> +  <reg name="ra" bitsize="64" type="code_ptr"/>
>> +  <reg name="sp" bitsize="64" type="data_ptr"/>
>> +  <reg name="gp" bitsize="64" type="data_ptr"/>
>> +  <reg name="tp" bitsize="64" type="data_ptr"/>
>> +  <reg name="t0" bitsize="64" type="int"/>
>> +  <reg name="t1" bitsize="64" type="int"/>
>> +  <reg name="t2" bitsize="64" type="int"/>
>> +  <reg name="fp" bitsize="64" type="data_ptr"/>
>> +  <reg name="s1" bitsize="64" type="int"/>
>> +  <reg name="a0" bitsize="64" type="int"/>
>> +  <reg name="a1" bitsize="64" type="int"/>
>> +  <reg name="a2" bitsize="64" type="int"/>
>> +  <reg name="a3" bitsize="64" type="int"/>
>> +  <reg name="a4" bitsize="64" type="int"/>
>> +  <reg name="a5" bitsize="64" type="int"/>
>> +  <reg name="a6" bitsize="64" type="int"/>
>> +  <reg name="a7" bitsize="64" type="int"/>
>> +  <reg name="s2" bitsize="64" type="int"/>
>> +  <reg name="s3" bitsize="64" type="int"/>
>> +  <reg name="s4" bitsize="64" type="int"/>
>> +  <reg name="s5" bitsize="64" type="int"/>
>> +  <reg name="s6" bitsize="64" type="int"/>
>> +  <reg name="s7" bitsize="64" type="int"/>
>> +  <reg name="s8" bitsize="64" type="int"/>
>> +  <reg name="s9" bitsize="64" type="int"/>
>> +  <reg name="s10" bitsize="64" type="int"/>
>> +  <reg name="s11" bitsize="64" type="int"/>
>> +  <reg name="t3" bitsize="64" type="int"/>
>> +  <reg name="t4" bitsize="64" type="int"/>
>> +  <reg name="t5" bitsize="64" type="int"/>
>> +  <reg name="t6" bitsize="64" type="int"/>
>> +  <reg name="pc" bitsize="64" type="code_ptr"/>
>> +</feature>
>> diff --git a/gdb-xml/riscv-128bit-virtual.xml b/gdb-xml/riscv-128bit-virtual.xml
>> new file mode 100644
>> index 0000000000..db9a0ff677
>> --- /dev/null
>> +++ b/gdb-xml/riscv-128bit-virtual.xml
>> @@ -0,0 +1,12 @@
>> +<?xml version="1.0"?>
>> +<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
>> +
>> +     Copying and distribution of this file, with or without modification,
>> +     are permitted in any medium without royalty provided the copyright
>> +     notice and this notice are preserved.  -->
>> +
>> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
>> +<!-- FIXME : priv marked as 64-bits since gdb doesn't like 128-bit registers for now. -->
>> +<feature name="org.gnu.gdb.riscv.virtual">
>> +  <reg name="priv" bitsize="64"/>
>> +</feature>
>> diff --git a/include/hw/riscv/sifive_cpu.h b/include/hw/riscv/sifive_cpu.h
>> index 136799633a..2fd441664f 100644
>> --- a/include/hw/riscv/sifive_cpu.hthat
>> +++ b/include/hw/riscv/sifive_cpu.h
>> @@ -26,6 +26,10 @@
>>  #elif defined(TARGET_RISCV64)
>>  #define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
>>  #define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
>> +#elif defined(TARGET_RISCV128)
>> +/* 128-bit uses 64-bit CPU for now, since no cpu implements RV128 */
>> +#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
>> +#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
>>  #endif
>>
>>  #endif /* HW_SIFIVE_CPU_H */
>> diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
>> index b9e5932f13..f9ea52a59a 100644
>> --- a/target/riscv/Kconfig
>> +++ b/target/riscv/Kconfig
>> @@ -3,3 +3,6 @@ config RISCV32
>>
>>  config RISCV64
>>      bool
>> +
>> +config RISCV128
>> +    bool
>> diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
>> index 709f621d82..f756ed2988 100644
>> --- a/target/riscv/arch_dump.c
>> +++ b/target/riscv/arch_dump.c
>> @@ -176,7 +176,8 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>>
>>      info->d_machine = EM_RISCV;
>>
>> -#if defined(TARGET_RISCV64)
>> +#if defined(TARGET_RISCV64) || defined(TARGET_RISCV128)
>> +    /* FIXME : No 128-bit ELF class exists (for now), use 64-bit one. */
>>      info->d_class = ELFCLASS64;
>>  #else
>>      info->d_class = ELFCLASS32;
>> diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
>> index 80eb615f93..e6d0651f60 100644
>> --- a/target/riscv/cpu-param.h
>> +++ b/target/riscv/cpu-param.h
>> @@ -8,7 +8,8 @@
>>  #ifndef RISCV_CPU_PARAM_H
>>  #define RISCV_CPU_PARAM_H 1
>>
>> -#if defined(TARGET_RISCV64)
>> +/* 64-bit target, since QEMU isn't built to have TARGET_LONG_BITS over 64 */
>> +#if defined(TARGET_RISCV64) || defined(TARGET_RISCV128)
>>  # define TARGET_LONG_BITS 64
>>  # define TARGET_PHYS_ADDR_SPACE_BITS 56 /* 44-bit PPN */
>>  # define TARGET_VIRT_ADDR_SPACE_BITS 48 /* sv48 */
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 991a6bb760..1f15026e9c 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -110,18 +110,38 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>>
>>  bool riscv_cpu_is_32bit(CPURISCVState *env)
>>  {
>> -    if (env->misa & RV64) {
>> -        return false;
>> -    }
>> +    return (env->misa & MXLEN_MASK) == RV32;
>> +}
>>
>> -    return true;
>> +bool riscv_cpu_is_64bit(CPURISCVState *env)
>> +{
>> +    return (env->misa & MXLEN_MASK) == RV64;
>>  }
>>
>> +#if defined(TARGET_RISCV128)
> 
> Don't add any TARGET_* defines.
> 
> We are trying to move to a point where the 64-bit RISC-V softmmu can
> run 32-bit CPUs. Ideally we want the same with 128-bit. You don't have
> to get that working, but don't add any compile time conditionals.
> 
> That applies to all code, not just this patch. Unless there is already
> a conditional TARGET_* compile please don't add one.

  Dully noted,
  Frédéric
> 
> Alistair
> 

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

