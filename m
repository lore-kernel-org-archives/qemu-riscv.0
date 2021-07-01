Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lyn3U-0002gw-0r
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jun 2021 23:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lyn3S-0002gj-Lr; Wed, 30 Jun 2021 23:07:54 -0400
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:49884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lyn3P-0005wt-Hw; Wed, 30 Jun 2021 23:07:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08146886|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.149449-0.00134985-0.849202;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KaXecsh_1625108860; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KaXecsh_1625108860)
 by smtp.aliyun-inc.com(10.147.40.44); Thu, 01 Jul 2021 11:07:41 +0800
Subject: Re: [PATCH v3 00/37] target/riscv: support packed extension v0.9.4
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
 <CAKmqyKNw2Vr=fqGqnGBRF1mF6FAk-qn=ecNuSdrWAv1rGro7hw@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <6d8b64ac-8e93-282e-79c2-3145aadbec8b@c-sky.com>
Date: Thu, 1 Jul 2021 11:06:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNw2Vr=fqGqnGBRF1mF6FAk-qn=ecNuSdrWAv1rGro7hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.99; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-99.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 01 Jul 2021 03:07:55 -0000


On 2021/7/1 上午9:30, Alistair Francis wrote:
> On Thu, Jun 24, 2021 at 9:14 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>> This patchset implements the packed extension for RISC-V on QEMU.
>>
>> You can also find this patch set on my
>> repo(https://github.com/romanheros/qemu.git branch:packed-upstream-v3).
>>
>> Features:
>> * support specification packed extension
>>    v0.9.4(https://github.com/riscv/riscv-p-spec/)
>> * support basic packed extension.
>> * support Zpsoperand.
> There is now a 0.9.5, do you have plans to support that?

Thanks for pointing it out.

After review the latest change, I think it is small change. So I will 
not update the  implementation to v0.9.5.  I hope next supporting 
version is v1.0.

Thanks,
Zhiwei

>
> Alistair
>
>> v3:
>> * split 32 bit vector operations.
>>
>> v2:
>> * remove all the TARGET_RISCV64 macro.
>> * use tcg_gen_vec_* to accelabrate.
>> * update specficication to latest v0.9.4
>> * fix kmsxda32, kmsda32,kslra32,smal
>>
>> LIU Zhiwei (37):
>>    target/riscv: implementation-defined constant parameters
>>    target/riscv: Make the vector helper functions public
>>    target/riscv: 16-bit Addition & Subtraction Instructions
>>    target/riscv: 8-bit Addition & Subtraction Instruction
>>    target/riscv: SIMD 16-bit Shift Instructions
>>    target/riscv: SIMD 8-bit Shift Instructions
>>    target/riscv: SIMD 16-bit Compare Instructions
>>    target/riscv: SIMD 8-bit Compare Instructions
>>    target/riscv: SIMD 16-bit Multiply Instructions
>>    target/riscv: SIMD 8-bit Multiply Instructions
>>    target/riscv: SIMD 16-bit Miscellaneous Instructions
>>    target/riscv: SIMD 8-bit Miscellaneous Instructions
>>    target/riscv: 8-bit Unpacking Instructions
>>    target/riscv: 16-bit Packing Instructions
>>    target/riscv: Signed MSW 32x32 Multiply and Add Instructions
>>    target/riscv: Signed MSW 32x16 Multiply and Add Instructions
>>    target/riscv: Signed 16-bit Multiply 32-bit Add/Subtract Instructions
>>    target/riscv: Signed 16-bit Multiply 64-bit Add/Subtract Instructions
>>    target/riscv: Partial-SIMD Miscellaneous Instructions
>>    target/riscv: 8-bit Multiply with 32-bit Add Instructions
>>    target/riscv: 64-bit Add/Subtract Instructions
>>    target/riscv: 32-bit Multiply 64-bit Add/Subtract Instructions
>>    target/riscv: Signed 16-bit Multiply with 64-bit Add/Subtract
>>      Instructions
>>    target/riscv: Non-SIMD Q15 saturation ALU Instructions
>>    target/riscv: Non-SIMD Q31 saturation ALU Instructions
>>    target/riscv: 32-bit Computation Instructions
>>    target/riscv: Non-SIMD Miscellaneous Instructions
>>    target/riscv: RV64 Only SIMD 32-bit Add/Subtract Instructions
>>    target/riscv: RV64 Only SIMD 32-bit Shift Instructions
>>    target/riscv: RV64 Only SIMD 32-bit Miscellaneous Instructions
>>    target/riscv: RV64 Only SIMD Q15 saturating Multiply Instructions
>>    target/riscv: RV64 Only 32-bit Multiply Instructions
>>    target/riscv: RV64 Only 32-bit Multiply & Add Instructions
>>    target/riscv: RV64 Only 32-bit Parallel Multiply & Add Instructions
>>    target/riscv: RV64 Only Non-SIMD 32-bit Shift Instructions
>>    target/riscv: RV64 Only 32-bit Packing Instructions
>>    target/riscv: configure and turn on packed extension from command line
>>
>>   target/riscv/cpu.c                      |   34 +
>>   target/riscv/cpu.h                      |    6 +
>>   target/riscv/helper.h                   |  330 ++
>>   target/riscv/insn32.decode              |  370 +++
>>   target/riscv/insn_trans/trans_rvp.c.inc | 1155 +++++++
>>   target/riscv/internals.h                |   50 +
>>   target/riscv/meson.build                |    1 +
>>   target/riscv/packed_helper.c            | 3851 +++++++++++++++++++++++
>>   target/riscv/translate.c                |    3 +
>>   target/riscv/vector_helper.c            |   82 +-
>>   10 files changed, 5824 insertions(+), 58 deletions(-)
>>   create mode 100644 target/riscv/insn_trans/trans_rvp.c.inc
>>   create mode 100644 target/riscv/packed_helper.c
>>
>> --
>> 2.17.1
>>
>>

