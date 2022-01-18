Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9jn8-0003js-Ua
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 03:24:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9jn7-0003ey-FL; Tue, 18 Jan 2022 03:24:33 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:58970 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9jn0-0004tJ-Nw; Tue, 18 Jan 2022 03:24:30 -0500
Received: from [192.168.0.102] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAB3VxQxeeZh5A91Bg--.55720S2;
 Tue, 18 Jan 2022 16:24:18 +0800 (CST)
Subject: Re: [PATCH v4 0/7] support subsets of scalar crypto extension
To: Alistair Francis <alistair23@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com,
 luruibo2000@163.com, lustrew@foxmail.com
References: <20220111035124.9468-1-liweiwei@iscas.ac.cn>
 <CAKmqyKOxD33qVpT1k3-BU1MRSZS3+vN-f7z-kaGQ0RhXWKhBqQ@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <a39932a0-ab57-3a13-a75f-b3d0bcffd51c@iscas.ac.cn>
Date: Tue, 18 Jan 2022 16:24:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOxD33qVpT1k3-BU1MRSZS3+vN-f7z-kaGQ0RhXWKhBqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAB3VxQxeeZh5A91Bg--.55720S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF17tw17CryxAF48Jr1DJrb_yoW5AFykpa
 1rG3yrC3y5JrZrGr1Sq3W8Jw15Xr4rur4fJwn3Jw1rA39xtrZ3JrZ2kw1akFnrJF18Wry2
 9a4UCw13uw4rAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
 kF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj2jg7UUUUU==
X-Originating-IP: [180.156.147.178]
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
X-List-Received-Date: Tue, 18 Jan 2022 08:24:34 -0000


在 2022/1/18 下午12:41, Alistair Francis 写道:
> On Tue, Jan 11, 2022 at 1:54 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> This patchset implements RISC-V scalar crypto extension v1.0.0 version instructions.
>> Partial instructions are reused from B-extension.
>>
>> Specification:
>> https://github.com/riscv/riscv-crypto
>>
>> The port is available here:
>> https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v4
>>
>> To test rvk implementation,  specify cpu argument with 'zks=true,zkn=true'
>> or
>> "zbkb=true,zbkc=true,zbkx=true,zknd=true,zkne=true,zknh=true,zksed=true,zksh=true,zkr=true"
>>   to enable  K-extension support.  This implementation can pass the ACT tests
>> for K with our extended act support for qemu (available at
>> https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v4-with-act)
>>
>> v4:
>> * drop "x-" in exposed properties
>> * delete unrelated changes
>>
>> v3:
>> * add extension check for SEED csr access
>>
>> v2:
>> * optimize implementation for brev8, xperm, zip, unzip
>> * use aes related sbox array from crypto/aes.h
>> * move sm4_sbox to crypto/sm4.c, and share it with target/arm
>>
>> Weiwei Li (7):
>>    target/riscv: rvk: add cfg properties for zbk* and zk*
>>    target/riscv: rvk: add implementation of instructions for Zbk*
>>    crypto include/crypto target/arm: move sm4_sbox to crypto
>>    target/riscv: rvk: add implementation of instructions for Zk*
>>    target/riscv: rvk: add CSR support for Zkr
>>    disas/riscv.c: rvk: add disas support for Zbk* and Zk* instructions
>>    target/riscv: rvk: expose zbk* and zk* properties
> Thanks for the patches!
>
> Overall this looks good, just some small comments on the individual patches.
>
> For the next version do you mind splitting the patches up a little bit
> more? That will make it easier and faster to review
>
> Alistair
>
Thanks for your comments. Sorry for the big patches. I'll divide them.

Regards,

Weiwei Li

>>   crypto/meson.build                      |   1 +
>>   crypto/sm4.c                            |  49 +++
>>   disas/riscv.c                           | 170 +++++++++
>>   include/crypto/sm4.h                    |   6 +
>>   target/arm/crypto_helper.c              |  36 +-
>>   target/riscv/bitmanip_helper.c          |  74 ++++
>>   target/riscv/cpu.c                      |  37 ++
>>   target/riscv/cpu.h                      |  13 +
>>   target/riscv/cpu_bits.h                 |   9 +
>>   target/riscv/crypto_helper.c            | 446 ++++++++++++++++++++++
>>   target/riscv/csr.c                      |  74 ++++
>>   target/riscv/helper.h                   |  42 +++
>>   target/riscv/insn32.decode              |  94 ++++-
>>   target/riscv/insn_trans/trans_rvb.c.inc | 127 ++++++-
>>   target/riscv/insn_trans/trans_rvk.c.inc | 467 ++++++++++++++++++++++++
>>   target/riscv/meson.build                |   3 +-
>>   target/riscv/pmp.h                      |   8 +-
>>   target/riscv/translate.c                |   8 +
>>   18 files changed, 1594 insertions(+), 70 deletions(-)
>>   create mode 100644 crypto/sm4.c
>>   create mode 100644 include/crypto/sm4.h
>>   create mode 100644 target/riscv/crypto_helper.c
>>   create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc
>>
>> --
>> 2.17.1
>>
>>


