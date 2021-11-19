Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo4Bj-0006fD-Ej
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 08:44:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mo4Bg-0006aj-17; Fri, 19 Nov 2021 08:44:20 -0500
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:57897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mo4Bd-0006rK-0l; Fri, 19 Nov 2021 08:44:19 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07453869|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0844409-0.00048377-0.915075;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LvrIocs_1637329445; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LvrIocs_1637329445) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 19 Nov 2021 21:44:06 +0800
Subject: Re: [PATCH v4 00/20] Support UXL filed in xstatus
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <CAKmqyKMg8bMjnkbDUBQhJy3VXnY=HTCne8D6uXFPceU4dezhTg@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <6682e008-b597-74f9-a9b9-a237ce0a098f@c-sky.com>
Date: Fri, 19 Nov 2021 21:44:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMg8bMjnkbDUBQhJy3VXnY=HTCne8D6uXFPceU4dezhTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.149; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-149.mail.aliyun.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.727,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 19 Nov 2021 13:44:21 -0000


On 2021/11/19 下午8:57, Alistair Francis wrote:
> On Fri, Nov 12, 2021 at 1:52 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>> In this patch set, we process the pc reigsters writes,
>> gdb reads and writes, and address calculation under
>> different UXLEN settings.
> Awesome!
>
> Do you have steps on how to test this?

I have some little of weird tests. Compile 32 bit baremetal benchmarks, 
such as dhrystone and coremark, and run them on qemu-system-riscv64. 
These tests can pass.
These tests cases cover the most of instruction translation.

I think some assembling test cases covering  XLEN change are also 
needed. Not yet.

Thanks,
Zhiwei

>
> Alistair
>
>> The patch set v4 mainly address Richard comments on v3.
>> Patch 8, 18, 19, 20 have not been reviewed. Others have been reviewed or acked.
>>
>> v4:
>>    Support SSTATUS64_UXL write
>>    Bump vmstate version for vill split
>>
>> v3:
>>    Merge gen_pm_adjust_address into a canonical address function
>>    Adjust address for RVA with XLEN
>>    Split pm_enabled into pm_mask_enabled and pm_base_enabled
>>    Replace array of pm tcg globals with one scalar tcg global
>>    Split and change patch sequence
>>
>> v2:
>>    Split out vill from vtype
>>    Remove context switch when xlen changes at exception
>>    Use XL instead of OL in many places
>>    Use pointer masking and XLEN for vector address
>>    Define an common fuction to calculate address for ldst
>>
>>
>> LIU Zhiwei (20):
>>    target/riscv: Don't save pc when exception return
>>    target/riscv: Sign extend pc for different XLEN
>>    target/riscv: Ignore the pc bits above XLEN
>>    target/riscv: Extend pc for runtime pc write
>>    target/riscv: Use gdb xml according to max mxlen
>>    target/riscv: Relax debug check for pm write
>>    target/riscv: Adjust csr write mask with XLEN
>>    target/riscv: Create current pm fields in env
>>    target/riscv: Alloc tcg global for cur_pm[mask|base]
>>    target/riscv: Calculate address according to XLEN
>>    target/riscv: Split pm_enabled into mask and base
>>    target/riscv: Split out the vill from vtype
>>    target/riscv: Fix RESERVED field length in VTYPE
>>    target/riscv: Adjust vsetvl according to XLEN
>>    target/riscv: Remove VILL field in VTYPE
>>    target/riscv: Ajdust vector atomic check with XLEN
>>    target/riscv: Fix check range for first fault only
>>    target/riscv: Adjust vector address with mask
>>    target/riscv: Adjust scalar reg in vector with XLEN
>>    target/riscv: Enable uxl field write
>>
>>   target/riscv/cpu.c                            | 23 +++++-
>>   target/riscv/cpu.h                            | 13 +++-
>>   target/riscv/cpu_bits.h                       |  2 +
>>   target/riscv/cpu_helper.c                     | 66 ++++++++++++----
>>   target/riscv/csr.c                            | 43 ++++++++++-
>>   target/riscv/gdbstub.c                        | 71 ++++++++++++-----
>>   target/riscv/helper.h                         |  6 +-
>>   .../riscv/insn_trans/trans_privileged.c.inc   |  7 +-
>>   target/riscv/insn_trans/trans_rva.c.inc       |  9 +--
>>   target/riscv/insn_trans/trans_rvd.c.inc       | 19 +----
>>   target/riscv/insn_trans/trans_rvf.c.inc       | 19 +----
>>   target/riscv/insn_trans/trans_rvi.c.inc       | 22 +-----
>>   target/riscv/insn_trans/trans_rvv.c.inc       | 51 ++++++++----
>>   target/riscv/machine.c                        | 15 +++-
>>   target/riscv/op_helper.c                      |  7 +-
>>   target/riscv/translate.c                      | 77 +++++++++----------
>>   target/riscv/vector_helper.c                  | 38 +++++----
>>   17 files changed, 300 insertions(+), 188 deletions(-)
>>
>> --
>> 2.25.1
>>
>>

