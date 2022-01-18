Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9jYn-0003dc-M5
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 03:09:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9jYJ-0003bY-1H; Tue, 18 Jan 2022 03:09:20 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:55056 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9jYE-0002Nw-3N; Tue, 18 Jan 2022 03:09:12 -0500
Received: from [192.168.0.102] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAB3fwOZdeZhGuF0Bg--.54775S2;
 Tue, 18 Jan 2022 16:08:58 +0800 (CST)
Subject: Re: [PATCH v4 4/7] target/riscv: rvk: add implementation of
 instructions for Zk*
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
 <20220111035124.9468-5-liweiwei@iscas.ac.cn>
 <CAKmqyKMAohGZQ0q2XuO8i=PYcNwveYy6GPajHGFNrxXZmR-wsA@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <c230dbb6-7fcb-2448-cd5d-f527df01cf7f@iscas.ac.cn>
Date: Tue, 18 Jan 2022 16:08:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMAohGZQ0q2XuO8i=PYcNwveYy6GPajHGFNrxXZmR-wsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAB3fwOZdeZhGuF0Bg--.54775S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCryfGF4kGr47Xry5XryrWFg_yoWruryfpr
 W5CFs0kFWUX343KrWfXF1YqryrJ395KF1DCFyxWr15A39xtrykZrnxG345KF48Xa18Cryj
 9FsrZr43ua4xtFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
 04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
 w20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8VbyDUUUU
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
X-List-Received-Date: Tue, 18 Jan 2022 08:09:37 -0000


在 2022/1/18 下午12:21, Alistair Francis 写道:
> On Tue, Jan 11, 2022 at 2:01 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
>> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/crypto_helper.c            | 446 ++++++++++++++++++++++
>>   target/riscv/helper.h                   |  37 ++
>>   target/riscv/insn32.decode              |  42 +++
>>   target/riscv/insn_trans/trans_rvk.c.inc | 467 ++++++++++++++++++++++++
>>   target/riscv/meson.build                |   3 +-
>>   target/riscv/translate.c                |   1 +
>>   6 files changed, 995 insertions(+), 1 deletion(-)
>>   create mode 100644 target/riscv/crypto_helper.c
>>   create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc
>>
>> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
>> new file mode 100644
>> index 0000000000..344eea4287
>> --- /dev/null
>> +++ b/target/riscv/crypto_helper.c
>> @@ -0,0 +1,446 @@
>> +/*
>> + * RISC-V Crypto Emulation Helpers for QEMU.
>> + *
>> + * Copyright (c) 2021 Ruibo Lu, luruibo2000@163.com
>> + * Copyright (c) 2021 Zewen Ye, lustrew@foxmail.com
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2 or later, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "exec/exec-all.h"
>> +#include "exec/helper-proto.h"
>> +#include "crypto/aes.h"
>> +#include "crypto/sm4.h"
>> +
>> +#define AES_XTIME(a) \
>> +    ((a << 1) ^ ((a & 0x80) ? 0x1b : 0))
>> +
>> +#define AES_GFMUL(a, b) (( \
>> +    (((b) & 0x1) ?                              (a)   : 0) ^ \
>> +    (((b) & 0x2) ?                     AES_XTIME(a)   : 0) ^ \
>> +    (((b) & 0x4) ?           AES_XTIME(AES_XTIME(a))  : 0) ^ \
>> +    (((b) & 0x8) ? AES_XTIME(AES_XTIME(AES_XTIME(a))) : 0)) & 0xFF)
>> +
>> +#define BY(X, I) ((X >> (8 * I)) & 0xFF)
>> +
>> +#define AES_SHIFROWS_LO(RS1, RS2) ( \
>> +    (((RS1 >> 24) & 0xFF) << 56) | \
>> +    (((RS2 >> 48) & 0xFF) << 48) | \
>> +    (((RS2 >>  8) & 0xFF) << 40) | \
>> +    (((RS1 >> 32) & 0xFF) << 32) | \
>> +    (((RS2 >> 56) & 0xFF) << 24) | \
>> +    (((RS2 >> 16) & 0xFF) << 16) | \
>> +    (((RS1 >> 40) & 0xFF) <<  8) | \
>> +    (((RS1 >>  0) & 0xFF) <<  0))
>> +
>> +#define AES_INVSHIFROWS_LO(RS1, RS2) ( \
>> +    (((RS2 >> 24) & 0xFF) << 56) | \
>> +    (((RS2 >> 48) & 0xFF) << 48) | \
>> +    (((RS1 >>  8) & 0xFF) << 40) | \
>> +    (((RS1 >> 32) & 0xFF) << 32) | \
>> +    (((RS1 >> 56) & 0xFF) << 24) | \
>> +    (((RS2 >> 16) & 0xFF) << 16) | \
>> +    (((RS2 >> 40) & 0xFF) <<  8) | \
>> +    (((RS1 >>  0) & 0xFF) <<  0))
>> +
>> +#define AES_MIXBYTE(COL, B0, B1, B2, B3) ( \
>> +              BY(COL, B3)     ^ \
>> +              BY(COL, B2)     ^ \
>> +    AES_GFMUL(BY(COL, B1), 3) ^ \
>> +    AES_GFMUL(BY(COL, B0), 2)   \
>> +)
>> +
>> +#define AES_MIXCOLUMN(COL) ( \
>> +    AES_MIXBYTE(COL, 3, 0, 1, 2) << 24 | \
>> +    AES_MIXBYTE(COL, 2, 3, 0, 1) << 16 | \
>> +    AES_MIXBYTE(COL, 1, 2, 3, 0) <<  8 | \
>> +    AES_MIXBYTE(COL, 0, 1, 2, 3) <<  0   \
>> +)
>> +
>> +#define AES_INVMIXBYTE(COL, B0, B1, B2, B3) ( \
>> +    AES_GFMUL(BY(COL, B3), 0x9) ^ \
>> +    AES_GFMUL(BY(COL, B2), 0xd) ^ \
>> +    AES_GFMUL(BY(COL, B1), 0xb) ^ \
>> +    AES_GFMUL(BY(COL, B0), 0xe)   \
>> +)
>> +
>> +#define AES_INVMIXCOLUMN(COL) ( \
>> +    AES_INVMIXBYTE(COL, 3, 0, 1, 2) << 24 | \
>> +    AES_INVMIXBYTE(COL, 2, 3, 0, 1) << 16 | \
>> +    AES_INVMIXBYTE(COL, 1, 2, 3, 0) <<  8 | \
>> +    AES_INVMIXBYTE(COL, 0, 1, 2, 3) <<  0   \
>> +)
>> +
>> +static inline uint32_t aes_mixcolumn_byte(uint8_t x, bool fwd)
>> +{
>> +    uint32_t u;
>> +    if (fwd) {
>> +        u = (AES_GFMUL(x, 3) << 24) |
>> +                          (x << 16) |
>> +                          (x <<  8) |
>> +            (AES_GFMUL(x, 2) <<  0);
>> +    } else {
>> +        u = (AES_GFMUL(x, 0xb) << 24) |
>> +            (AES_GFMUL(x, 0xd) << 16) |
>> +            (AES_GFMUL(x, 0x9) <<  8) |
>> +            (AES_GFMUL(x, 0xe) <<  0);
>> +    }
>> +    return u;
>> +}
>> +
>> +#define XLEN (8 * sizeof(target_ulong))
> I don't think this is used, but please don't hard coded xlen's.
> Everything should be dynamic based on the CPU xlen.
>
> It would also be great if you could split this patch up more. There is
> a lot being added here.
>
> Alistair

OK. Thanks for your comments. I'll delete XLEN and split this patch.

Regards,

Weiwei Li


