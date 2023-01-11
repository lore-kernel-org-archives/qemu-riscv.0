Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFVPW-0007pA-Uw
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 02:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pFVPC-0007A9-Qa; Wed, 11 Jan 2023 02:20:26 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pFVP8-0001ZN-2A; Wed, 11 Jan 2023 02:20:14 -0500
Received: from [192.168.3.184] (unknown [61.165.33.198])
 by APP-05 (Coremail) with SMTP id zQCowABXX+8YY75jzmApDA--.161S2;
 Wed, 11 Jan 2023 15:19:54 +0800 (CST)
Message-ID: <046ab74f-30f6-8dcb-d0e8-ba634a909d8d@iscas.ac.cn>
Date: Wed, 11 Jan 2023 15:19:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 0/9] support subsets of code size reduction extension
To: Alistair Francis <alistair23@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221228062028.29415-1-liweiwei@iscas.ac.cn>
 <CAKmqyKONF+C_xiUiM0aGww1yNVnx_-VRayK0sp+sn_gURA22=g@mail.gmail.com>
Content-Language: en-US
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <CAKmqyKONF+C_xiUiM0aGww1yNVnx_-VRayK0sp+sn_gURA22=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABXX+8YY75jzmApDA--.161S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1kAFWDAw1rGr47XrykuFg_yoW5KrWfpw
 4rGFWak398JryxJw4SqF1UXw1YvFsYgr4rJwn3Aw1kGa9IyrW3Jrs7K3W3Kw17JF1rWr1j
 9F1UCry3uw48AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [61.165.33.198]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 11 Jan 2023 07:20:30 -0000


On 2023/1/11 13:00, Alistair Francis wrote:
> On Wed, Dec 28, 2022 at 4:23 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> This patchset implements RISC-V Zc* extension v1.0.0.RC5.7 version instructions.
>>
>> Specification:
>> https://github.com/riscv/riscv-code-size-reduction/tree/main/Zc-specification
>>
>> The port is available here:
>> https://github.com/plctlab/plct-qemu/tree/plct-zce-upstream-v9
>>
>> To test Zc* implementation, specify cpu argument with 'x-zca=true,x-zcb=true,x-zcf=true,f=true" and "x-zcd=true,d=true" (or "x-zcmp=true,x-zcmt=true" with c or d=false) to enable Zca/Zcb/Zcf and Zcd(or Zcmp,Zcmt) extensions support.
>>
>>
>> This implementation can pass the basic zc tests from https://github.com/yulong-plct/zc-test
>>
>> v9:
>> * rebase on riscv-to-apply.next
>>
>> v8:
>> * improve disas support in Patch 9
>>
>> v7:
>> * Fix description for Zca
>>
>> v6：
>> * fix base address for jump table in Patch 7
>> * rebase on riscv-to-apply.next
>>
>> v5:
>> * fix exception unwind problem for cpu_ld*_code in helper of cm_jalt
>>
>> v4:
>> * improve Zcmp suggested by Richard
>> * fix stateen related check for Zcmt
>>
>> v3:
>> * update the solution for Zcf to the way of Zcd
>> * update Zcb to reuse gen_load/store
>> * use trans function instead of helper for push/pop
>>
>> v2:
>> * add check for relationship between Zca/Zcf/Zcd with C/F/D based on related discussion in review of Zc* spec
>> * separate c.fld{sp}/fsd{sp} with fld{sp}/fsd{sp} before support of zcmp/zcmt
>>
>> Weiwei Li (9):
>>    target/riscv: add cfg properties for Zc* extension
>>    target/riscv: add support for Zca extension
>>    target/riscv: add support for Zcf extension
>>    target/riscv: add support for Zcd extension
>>    target/riscv: add support for Zcb extension
>>    target/riscv: add support for Zcmp extension
>>    target/riscv: add support for Zcmt extension
>>    target/riscv: expose properties for Zc* extension
>>    disas/riscv.c: add disasm support for Zc*
> This series broke a range of boards that use specific CPUs. I have
> dropped it from my tree.
>
> Daniel has sent a series that should fix it though
> (https://www.mail-archive.com/qemu-devel@nongnu.org/msg930952.html). I
> have applied his fixes. Can you rebase this series on
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next, test to
> ensure the SiFive boards continue to work and then re-send the series?
>
> Alistair

This seems "C implies Zca" is not applied on specific CPUs and it'll be 
fixed if Zc* related check is

moved to riscv_cpu_validate_set_extensions just as  Daniel's series.

I'll rebase on it and test the CPUs in next version.

Regards,

Weiwei Li

>>   disas/riscv.c                             | 228 +++++++++++++++-
>>   target/riscv/cpu.c                        |  56 ++++
>>   target/riscv/cpu.h                        |  10 +
>>   target/riscv/cpu_bits.h                   |   7 +
>>   target/riscv/csr.c                        |  38 ++-
>>   target/riscv/helper.h                     |   3 +
>>   target/riscv/insn16.decode                |  63 ++++-
>>   target/riscv/insn_trans/trans_rvd.c.inc   |  18 ++
>>   target/riscv/insn_trans/trans_rvf.c.inc   |  18 ++
>>   target/riscv/insn_trans/trans_rvi.c.inc   |   4 +-
>>   target/riscv/insn_trans/trans_rvzce.c.inc | 313 ++++++++++++++++++++++
>>   target/riscv/machine.c                    |  19 ++
>>   target/riscv/meson.build                  |   3 +-
>>   target/riscv/translate.c                  |  15 +-
>>   target/riscv/zce_helper.c                 |  55 ++++
>>   15 files changed, 834 insertions(+), 16 deletions(-)
>>   create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc
>>   create mode 100644 target/riscv/zce_helper.c
>>
>> --
>> 2.25.1
>>
>>


