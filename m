Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBXbp-0007M1-PD
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 03:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBXbn-0007LO-Ak; Thu, 05 Aug 2021 03:16:03 -0400
Received: from out28-75.mail.aliyun.com ([115.124.28.75]:37295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBXbi-0008KU-Ru; Thu, 05 Aug 2021 03:16:02 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1239193|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0150263-0.00069011-0.984284;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvfdKuw_1628147748; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvfdKuw_1628147748)
 by smtp.aliyun-inc.com(10.147.42.135);
 Thu, 05 Aug 2021 15:15:49 +0800
Subject: Re: [RFC PATCH 00/13] Support UXL field in mstatus
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <CAKmqyKOCRXbEhZrZSQN-X2ObrX=_aoxgyCsevE05LY9S-TS4hQ@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <a404e8dd-eb20-4d4a-6aa0-7c444b46c706@c-sky.com>
Date: Thu, 5 Aug 2021 15:14:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOCRXbEhZrZSQN-X2ObrX=_aoxgyCsevE05LY9S-TS4hQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.75; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-75.mail.aliyun.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 05 Aug 2021 07:16:03 -0000


On 2021/8/5 下午2:01, Alistair Francis wrote:
> On Thu, Aug 5, 2021 at 12:55 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>> This patch set implements UXL field in mstatus register. Programmer can change
>> UXLEN by writting to this field. So that you can run a 32 bit program
>> on a 64 bit CPU.
> Awesome! Do you have any steps for building a rootFS to test this?

Not yet.  It depends on Linux support which  will not start until  
October.  Maybe as a rough test,
we can run the 32 glibc test cases on qemu-riscv64 with an option 
uxl32=true(not implement yet).

Zhiwei

>
> Alistair
>
>> This patch set depends on one patch set by Richard Henderson
>> https://lists.gnu.org/archive/html/qemu-riscv/2021-07/msg00059.html.
>>
>> LIU Zhiwei (13):
>>    target/riscv: Add UXL to tb flags
>>    target/riscv: Support UXL32 for branch instructions
>>    target/riscv: Support UXL32 on 64-bit cpu for load/store
>>    target/riscv: Support UXL32 for slit/sltiu
>>    target/riscv: Support UXL32 for shift instruction
>>    target/riscv: Fix div instructions
>>    target/riscv: Support UXL32 for RVM
>>    target/riscv: Support UXL32 for vector instructions
>>    target/riscv: Support UXL32 for atomic instructions
>>    target/riscv: Support UXL32 for float instructions
>>    target/riscv: Fix srow
>>    target/riscv: Support UXL32 for RVB
>>    target/riscv: Changing the width of U-mode CSR
>>
>>   target/riscv/cpu.h                      |  18 +++
>>   target/riscv/csr.c                      |  42 +++++-
>>   target/riscv/insn_trans/trans_rva.c.inc |  36 ++++-
>>   target/riscv/insn_trans/trans_rvb.c.inc |  51 +++++--
>>   target/riscv/insn_trans/trans_rvd.c.inc |   4 +-
>>   target/riscv/insn_trans/trans_rvf.c.inc |   4 +-
>>   target/riscv/insn_trans/trans_rvi.c.inc |  62 ++++++--
>>   target/riscv/insn_trans/trans_rvm.c.inc |  24 ++-
>>   target/riscv/insn_trans/trans_rvv.c.inc |  44 +++---
>>   target/riscv/translate.c                | 186 ++++++++++++++++++++----
>>   target/riscv/vector_helper.c            |  54 +++++--
>>   11 files changed, 414 insertions(+), 111 deletions(-)
>>
>> --
>> 2.17.1
>>
>>

