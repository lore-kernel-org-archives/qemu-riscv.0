Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYkgo-0000eh-3h
	for mharc-qemu-riscv@gnu.org; Tue, 20 Apr 2021 03:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lYkgl-0000e2-GS; Tue, 20 Apr 2021 03:20:51 -0400
Received: from out28-4.mail.aliyun.com ([115.124.28.4]:52944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lYkgg-0003Bu-SU; Tue, 20 Apr 2021 03:20:51 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07513881|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0400275-0.000205803-0.959767;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.K0vmQ6x_1618903241; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.K0vmQ6x_1618903241) by smtp.aliyun-inc.com(10.147.40.7);
 Tue, 20 Apr 2021 15:20:41 +0800
Subject: Re: [RFC PATCH 00/11] RISC-V: support clic v0.9 specification
To: Alistair Francis <alistair23@gmail.com>
Cc: michaeljclark@mac.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <CAKmqyKPtV0PFdEfO0B5YFGC2i21OAmvBsY0ovUVdQwn3ttpcQA@mail.gmail.com>
 <beb2e320-60fb-db42-e4d6-3b4d5cb82a95@c-sky.com>
 <CAKmqyKN2JNRygh5aScLwQZYgmQF7-bpj=aCq=gx2TxxLpCgCrQ@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <89137bb9-4312-ac27-5c63-c0bab0f4c139@c-sky.com>
Date: Tue, 20 Apr 2021 15:20:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKN2JNRygh5aScLwQZYgmQF7-bpj=aCq=gx2TxxLpCgCrQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.4; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-4.mail.aliyun.com
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
X-List-Received-Date: Tue, 20 Apr 2021 07:20:51 -0000


On 2021/4/20 下午2:26, Alistair Francis wrote:
> On Tue, Apr 20, 2021 at 11:45 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>
>> On 2021/4/20 上午7:30, Alistair Francis wrote:
>>> On Fri, Apr 9, 2021 at 5:56 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>>> This patch set gives an implementation of "RISC-V Core-Local Interrupt
>>>> Controller(CLIC) Version 0.9-draft-20210217". It comes from [1], where
>>>> you can find the pdf format or the source code.
>>>>
>>>> I take over the job from Michael Clark, who gave the first implementation
>>>> of clic-v0.7 specification. If there is any copyright question, please
>>>> let me know.
>>> You need to make sure you leave all original copyright notices and SoB in place.
>> OK.
>>
>> Is it OK that keep the original copyright notices for new files and
>> your SoB in every patch,  Michael?
>>
>>>> Features:
>>>> 1. support four kinds of trigger types.
>>>> 2. Preserve the CSR WARL/WPRI semantics.
>>>> 3. Option to select different modes, such as M/S/U or M/U.
>>>> 4. At most 4096 interrupts.
>>>> 5. At most 1024 apertures.
>>>>
>>>> Todo:
>>>> 1. Encode the interrupt trigger information to exccode.
>>>> 2. Support complete CSR mclicbase when its number is fixed.
>>>> 3. Gave each aperture an independend address.
>>>>
>>>> It have passed my qtest case and freertos test. Welcome to have a try
>>>> for your hardware.
>>> It doesn't seem to be connected to any machine. How are you testing this?
>> There is a machine called SMARTL in my repository[1].  The qtest case
>> is  tests/qtest/test-riscv32-clic.c. If it's better, I can upstream the
>> machine together next version.
> I don't really want to add a new hardware device when it isn't
> connected to a machine. It would be great if we could connect it to a
> machine. If not SMARTL maybe we could add it as an option to the virt
> machine?
Currently it is good to  connect CLIC to virt machine.  I can fix it in 
the next version if it is OK for you.
> What is SMARTL? Is that a publically available board?

SMARTL is a fpga evaluation board.  We usually use it  to debug programs 
for XuanTie CPU serials.
It has a 32bit CPU, 1 UART,  4 timers, and the CLIC interrupt 
controller. I will give  a detailed documentation
when I upstream it.

There are still many other  RISC-V boards, but more complex. I plan to 
upstream the XuanTie CPU
and  some widely used boards after the P extension and CLIC.

Zhiwei

>
> Alistair
>
>> Zhiwei
>>
>> [1]https://github.com/romanheros/qemu, branch: riscv-clic-upstream-rfc
>>
>>
>>> Alistair
>>>
>>>> Any advice is welcomed. Thanks very much.
>>>>
>>>> Zhiwei
>>>>
>>>> [1] specification website: https://github.com/riscv/riscv-fast-interrupt.
>>>> [2] Michael Clark origin work: https://github.com/sifive/riscv-qemu/tree/sifive-clic.
>>>>
>>>>
>>>> LIU Zhiwei (11):
>>>>     target/riscv: Add CLIC CSR mintstatus
>>>>     target/riscv: Update CSR xintthresh in CLIC mode
>>>>     hw/intc: Add CLIC device
>>>>     target/riscv: Update CSR xie in CLIC mode
>>>>     target/riscv: Update CSR xip in CLIC mode
>>>>     target/riscv: Update CSR xtvec in CLIC mode
>>>>     target/riscv: Update CSR xtvt in CLIC mode
>>>>     target/riscv: Update CSR xnxti in CLIC mode
>>>>     target/riscv: Update CSR mclicbase in CLIC mode
>>>>     target/riscv: Update interrupt handling in CLIC mode
>>>>     target/riscv: Update interrupt return in CLIC mode
>>>>
>>>>    default-configs/devices/riscv32-softmmu.mak |   1 +
>>>>    default-configs/devices/riscv64-softmmu.mak |   1 +
>>>>    hw/intc/Kconfig                             |   3 +
>>>>    hw/intc/meson.build                         |   1 +
>>>>    hw/intc/riscv_clic.c                        | 836 ++++++++++++++++++++
>>>>    include/hw/intc/riscv_clic.h                | 103 +++
>>>>    target/riscv/cpu.h                          |   9 +
>>>>    target/riscv/cpu_bits.h                     |  32 +
>>>>    target/riscv/cpu_helper.c                   | 117 ++-
>>>>    target/riscv/csr.c                          | 247 +++++-
>>>>    target/riscv/op_helper.c                    |  25 +
>>>>    11 files changed, 1363 insertions(+), 12 deletions(-)
>>>>    create mode 100644 hw/intc/riscv_clic.c
>>>>    create mode 100644 include/hw/intc/riscv_clic.h
>>>>
>>>> --
>>>> 2.25.1
>>>>
>>>>

