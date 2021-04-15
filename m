Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWuuZ-00060q-V2
	for mharc-qemu-riscv@gnu.org; Thu, 15 Apr 2021 01:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lWuuX-00060b-CW; Thu, 15 Apr 2021 01:51:29 -0400
Received: from out28-3.mail.aliyun.com ([115.124.28.3]:54885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lWuuT-0003vy-UK; Thu, 15 Apr 2021 01:51:29 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07527663|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0488016-0.00547701-0.945721;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.K-EMDyX_1618465876; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.K-EMDyX_1618465876)
 by smtp.aliyun-inc.com(10.147.40.44); Thu, 15 Apr 2021 13:51:17 +0800
Subject: Re: [PATCH 00/38] target/riscv: support packed extension v0.9.2
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <17b7c38a-f780-0216-3e3b-fd0d2178c004@c-sky.com>
 <CAKmqyKM430xxwC+JyXBKwFiE4Y=1_mk4Qq3b3D+EKUszSneWRA@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <431e88e7-5a21-74ec-624e-99fc6f29d175@c-sky.com>
Date: Thu, 15 Apr 2021 13:50:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKM430xxwC+JyXBKwFiE4Y=1_mk4Qq3b3D+EKUszSneWRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.3; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-3.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 15 Apr 2021 05:51:29 -0000


On 2021/4/15 下午12:46, Alistair Francis wrote:
> On Tue, Apr 13, 2021 at 1:28 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>> ping +1.
>>
>> On 2021/2/12 下午11:02, LIU Zhiwei wrote:
>>> This patchset implements the packed extension for RISC-V on QEMU.
>>>
>>> This patchset have passed all my direct Linux user mode cases(RV64) and
>>> bare metal cases(RV32) on X86-64 Ubuntu host machine. I will later push
>>> these test cases to my repo(https://github.com/romanheros/qemu.git
>>> branch:packed-upstream-v1).
>>>
>>> I have ported packed extension on RISU, but I didn't find a simulator or
>>> hardware to compare with. If anyone have one, please let me know.
>>>
>>> Features:
>>>     * support specification packed extension v0.9.2(https://github.com/riscv/riscv-p-spec/)
>>>     * support basic packed extension.
>>>     * support Zp64.
>>>
>>> LIU Zhiwei (38):
>>>     target/riscv: implementation-defined constant parameters
>>>     target/riscv: Hoist vector functions
>>>     target/riscv: Fixup saturate subtract function
> Thanks for the patches and sorry for the long delay.
>
> I have applied patch 3 as it fixes a bug.
> As for the other patches they are on both my review queue and Palmer's
> review queue. It takes a lot of time to review these large patch
> series, especially as I haven't been involved with the extension
> development, so I have to both understand the extension and then
> review the code.
>
> If you would like to help speed things up you could review other
> patches. That way I will have more time left to review your patches.

No worries. I fully understand the great efforts needed to review so 
many patches. Firstly, I will try to review as many  as I send.

Zhiwei

> Alistair
>
>>>     target/riscv: 16-bit Addition & Subtraction Instructions
>>>     target/riscv: 8-bit Addition & Subtraction Instruction
>>>     target/riscv: SIMD 16-bit Shift Instructions
>>>     target/riscv: SIMD 8-bit Shift Instructions
>>>     target/riscv: SIMD 16-bit Compare Instructions
>>>     target/riscv: SIMD 8-bit Compare Instructions
>>>     target/riscv: SIMD 16-bit Multiply Instructions
>>>     target/riscv: SIMD 8-bit Multiply Instructions
>>>     target/riscv: SIMD 16-bit Miscellaneous Instructions
>>>     target/riscv: SIMD 8-bit Miscellaneous Instructions
>>>     target/riscv: 8-bit Unpacking Instructions
>>>     target/riscv: 16-bit Packing Instructions
>>>     target/riscv: Signed MSW 32x32 Multiply and Add Instructions
>>>     target/riscv: Signed MSW 32x16 Multiply and Add Instructions
>>>     target/riscv: Signed 16-bit Multiply 32-bit Add/Subtract Instructions
>>>     target/riscv: Signed 16-bit Multiply 64-bit Add/Subtract Instructions
>>>     target/riscv: Partial-SIMD Miscellaneous Instructions
>>>     target/riscv: 8-bit Multiply with 32-bit Add Instructions
>>>     target/riscv: 64-bit Add/Subtract Instructions
>>>     target/riscv: 32-bit Multiply 64-bit Add/Subtract Instructions
>>>     target/riscv: Signed 16-bit Multiply with 64-bit Add/Subtract
>>>       Instructions
>>>     target/riscv: Non-SIMD Q15 saturation ALU Instructions
>>>     target/riscv: Non-SIMD Q31 saturation ALU Instructions
>>>     target/riscv: 32-bit Computation Instructions
>>>     target/riscv: Non-SIMD Miscellaneous Instructions
>>>     target/riscv: RV64 Only SIMD 32-bit Add/Subtract Instructions
>>>     target/riscv: RV64 Only SIMD 32-bit Shift Instructions
>>>     target/riscv: RV64 Only SIMD 32-bit Miscellaneous Instructions
>>>     target/riscv: RV64 Only SIMD Q15 saturating Multiply Instructions
>>>     target/riscv: RV64 Only 32-bit Multiply Instructions
>>>     target/riscv: RV64 Only 32-bit Multiply & Add Instructions
>>>     target/riscv: RV64 Only 32-bit Parallel Multiply & Add Instructions
>>>     target/riscv: RV64 Only Non-SIMD 32-bit Shift Instructions
>>>     target/riscv: RV64 Only 32-bit Packing Instructions
>>>     target/riscv: configure and turn on packed extension from command line
>>>
>>>    target/riscv/cpu.c                      |   32 +
>>>    target/riscv/cpu.h                      |    6 +
>>>    target/riscv/helper.h                   |  332 ++
>>>    target/riscv/insn32-64.decode           |   93 +-
>>>    target/riscv/insn32.decode              |  285 ++
>>>    target/riscv/insn_trans/trans_rvp.c.inc | 1224 +++++++
>>>    target/riscv/internals.h                |   50 +
>>>    target/riscv/meson.build                |    1 +
>>>    target/riscv/packed_helper.c            | 3862 +++++++++++++++++++++++
>>>    target/riscv/translate.c                |    3 +
>>>    target/riscv/vector_helper.c            |   90 +-
>>>    11 files changed, 5912 insertions(+), 66 deletions(-)
>>>    create mode 100644 target/riscv/insn_trans/trans_rvp.c.inc
>>>    create mode 100644 target/riscv/packed_helper.c
>>>

