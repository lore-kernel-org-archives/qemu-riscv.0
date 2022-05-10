Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noNup-00023n-7k
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 07:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1noNum-00021S-Om; Tue, 10 May 2022 07:20:29 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:47788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1noNuj-0003x9-MJ; Tue, 10 May 2022 07:20:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 28F0E300089;
 Tue, 10 May 2022 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652181614;
 bh=c+RaZDUF0KkM7iGjBXe89tRjjM68aGEnsYrNnzPdNkU=;
 h=Message-ID:Date:Mime-Version:From:Subject:To:Cc:References:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 b=RBoZDm3Awj6bxuMDUfYR6F79upXB2Xh3tXrt/15t94NdF4PenPik0QGWfe8MVfhLx
 DpWhwOtHttPaKZ5g20fUPlnHxqi5RxpA86WqxYeYzbCSY7aN5/9swZlofaz3SbRwyI
 3yMnY8f5ggozu9UnolXBKsqm2+3ddhJjM1FHdi7g=
Message-ID: <3192ea7d-1e0f-930f-9a40-cdeecfafdcab@irq.a4lg.com>
Date: Tue, 10 May 2022 20:20:10 +0900
Mime-Version: 1.0
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: Re: [PATCH 2/2] target/riscv: Add short-isa-string option
To: Alistair Francis <alistair23@gmail.com>
Cc: Frank Chang <frank.chang@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <cover.1650777360.git.research_trasio@irq.a4lg.com>
 <51c9f2ce37e6d1483317710ddd1e14be74a61e69.1650777360.git.research_trasio@irq.a4lg.com>
 <CAKmqyKPw-qtNm3nnLx-ZtE2Z7P2K6E3AH3B633B4nYj2m_4fMw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAKmqyKPw-qtNm3nnLx-ZtE2Z7P2K6E3AH3B633B4nYj2m_4fMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 10 May 2022 11:20:30 -0000

On 2022/05/09 18:51, Alistair Francis wrote:
> On Sun, Apr 24, 2022 at 7:22 AM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>>
>> Because some operating systems don't correctly parse long ISA extension
>> string, this commit adds short-isa-string boolean option to disable
>> generating long ISA extension strings on Device Tree.
>>
>> Operating Systems which short-isa-string might be helpful:
>>
>> 1.  Linux (5.17 or earlier)
>> 2.  FreeBSD (at least 14.0-CURRENT)
>> 3.  OpenBSD (at least current development version)
>>
>> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
>> ---
>>  target/riscv/cpu.c | 5 ++++-
>>  target/riscv/cpu.h | 2 ++
>>  2 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index c765f7ff00..9718cd0e7e 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -834,6 +834,8 @@ static Property riscv_cpu_properties[] = {
>>      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>>
>>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
>> +
>> +    DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>
>> @@ -989,7 +991,8 @@ char *riscv_isa_string(RISCVCPU *cpu)
>>          }
>>      }
>>      *p = '\0';
>> -    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>> +    if (!cpu->cfg.short_isa_string)
>> +        riscv_isa_string_ext(cpu, &isa_str, maxlen);
> 
> I don't love this, the long strings are part of the ISA, it seems
> strange to add an option to disable them.
> 
> Can you provide more details on what this breaks?
> 
> Alistair

I don't like it either but I think this is necessary for (at least) a few
years (as a workaround).

Images for testing:
<https://a4lg.com/downloads/archives/tmp/2022-05-10/qemu-issue-reproduction-20220510.tar.xz>
Use latest (development version of) QEMU to reproduce.

- Linux 5.15 (FPU support enabled)
- Busybox 1.35.0 (use of FPU disabled, -march=rv64imac -mabi=lp64)


Config 1. `-cpu rv64,g=on,f=on,d=on,zfinx=off,zdinx=off'

This is generic RV64.
ISA string is "rv64imafdch_zba_zbb_zbc_zbs".

With this ISA, it works.  ...Actually, it misunderstands Zbc extension as
`Z', `B' and `C' extensions (which might cause problems on other
configurations) in Linux 5.15 but... not now.


Config 2. `-cpu rv64,g=off,f=off,d=off,zfinx=on,zdinx=on'

This is generic RV64 but with floating point using GPRs (Zfinx and Zdinx).
ISA string is "rv64imach_zfinx_zdinx_zba_zbb_zbc_zbs".

OK, this is the problem.  If you try to run userland (Busybox-based), it
crashes on __fstate_restore function in kernel.

[    0.619174] Oops - illegal instruction [#1]
[    0.619544] Modules linked in:
[    0.619913] CPU: 0 PID: 1 Comm: init Not tainted 5.15.0 #47
[    0.620594] Hardware name: riscv-virtio,qemu (DT)
[    0.621142] epc : __fstate_restore+0x12/0x8c
[    0.621858]  ra : start_thread+0x28/0x5a
[    0.623463] epc : ffffffff80005332 ra : ffffffff80003352 sp : ffffffd00060bc90
[    0.624291]  gp : ffffffff812e6e38 tp : ffffffe001630000 t0 : 0000000000000000
[    0.625194]  t1 : 0000000000006000 t2 : 0000000000000000 s0 : ffffffd00060bcc0
[    0.626448]  s1 : ffffffd00060bee0 a0 : ffffffe001630900 a1 : 000000000001054c
[    0.627431]  a2 : 0000000000000900 a3 : 0000000000000000 a4 : 0000000000000000
[    0.627983]  a5 : 0000000000002020 a6 : 000000000000000c a7 : 0000000000000000
[    0.629473]  s2 : 0000003ff4473e10 s3 : 000000000001054c s4 : 0000003ff4473ff2
[    0.630798]  s5 : 0000003ffffffff8 s6 : 000000000001054c s7 : 0000000000040000
[    0.631623]  s8 : 0000003ff4473e38 s9 : 0000003ff4473e38 s10: ffffffe002083600
[    0.632310]  s11: ffffffe002070000 t3 : 000000000000000e t4 : 0000000000000000
[    0.633080]  t5 : 0000000000000180 t6 : 0000000000040000
[    0.633648] status: 0000000200000120 badaddr: 0000000000053007 cause: 0000000000000002
[    0.635025] [<ffffffff80005332>] __fstate_restore+0x12/0x8c
[    0.635771] [<ffffffff8017eb1a>] load_elf_binary+0xe16/0xe4a
[    0.636149] [<ffffffff8012c97a>] bprm_execve+0x1e4/0x468
[    0.636603] [<ffffffff8012d646>] kernel_execve+0xdc/0x142
[    0.636943] [<ffffffff80709158>] run_init_process+0x90/0x9e
[    0.637493] [<ffffffff807136a2>] kernel_init+0x72/0x104
[    0.638390] [<ffffffff80003008>] ret_from_exception+0x0/0xc
[    0.639513] ---[ end trace e4dec1a155401c43 ]---
[    0.640489] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

Apparently, it crashes as follows:

1.  Linux (-5.17) misunderstands `Zfinx' and `Zdinx' extensions as I, F, D,
    N, X and Z single-letter extensions and thinks FPU with dedicated
    registers is there.
2.  Because of that, the kernel tries to initialize FP registers from
    memory using `fld' instruction but this is a part of `D' extension,
    not `Zdinx'.
3.  Illegal instruction trap is generated and the kernel panics.


As you can see, many operating systems currently in use still don't
correctly understand long ISA strings:

>> 1.  Linux (5.17 or earlier)
>> 2.  FreeBSD (at least 14.0-CURRENT)
>> 3.  OpenBSD (at least current development version)

...and it affects in-kernel behavior directly!  That means, we still need
something to prevent multi-letter extension names from appearing in
"riscv,isa" DeviceTree ISA string.  That's the purpose of this option.

I am preparing for PATCH v2 (which "moves" Zhinx*, instead of removing) so
please wait for it (this commit will be unchanged but will reflect your
comment).

Tsukasa

> 
>>      return isa_str;
>>  }
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 34c22d5d3b..5b7fe32218 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -408,6 +408,8 @@ struct RISCVCPUConfig {
>>      bool aia;
>>      bool debug;
>>      uint64_t resetvec;
>> +
>> +    bool short_isa_string;
>>  };
>>
>>  typedef struct RISCVCPUConfig RISCVCPUConfig;
>> --
>> 2.32.0
>>
> 

