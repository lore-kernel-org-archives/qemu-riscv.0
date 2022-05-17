Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqm58-0005Qb-Lm
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 21:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqm56-0005KO-LI; Mon, 16 May 2022 21:33:00 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:32808 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqm53-00024p-23; Mon, 16 May 2022 21:33:00 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowACHjWU7+4JiwB6DBw--.53549S2;
 Tue, 17 May 2022 09:32:44 +0800 (CST)
Subject: Re: [PATCH 1/2] target/riscv: check 'I' and 'E' after checking 'G' in
 riscv_cpu_realize
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20220516033357.12371-1-liweiwei@iscas.ac.cn>
 <CAKmqyKPOs+-ZfO6iuXWdZDCuBTgrQEb6ySf8NPUgb2OBKfp_8A@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <37684438-0590-d676-ef26-18c00720666d@iscas.ac.cn>
Date: Tue, 17 May 2022 09:32:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPOs+-ZfO6iuXWdZDCuBTgrQEb6ySf8NPUgb2OBKfp_8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowACHjWU7+4JiwB6DBw--.53549S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7Kr1DGrWrAF13Gr1rJFb_yoW8uF4fpr
 18Ga1YyFWDJF4UGw4aq3WUKF18Wr1xA34xW3ykX3WIgrsakrnrAr1qkw1jgF4Fv3WFqa1f
 CF1akr98CrsrAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
 3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 17 May 2022 01:33:01 -0000


在 2022/5/17 上午8:23, Alistair Francis 写道:
> On Mon, May 16, 2022 at 1:36 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>   - setting ext_g will implicitly set ext_i
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   slirp              |  2 +-
>>   target/riscv/cpu.c | 23 ++++++++++++-----------
>>   2 files changed, 13 insertions(+), 12 deletions(-)
>>
>> diff --git a/slirp b/slirp
>> index 9d59bb775d..a88d9ace23 160000
>> --- a/slirp
>> +++ b/slirp
>> @@ -1 +1 @@
>> -Subproject commit 9d59bb775d6294c8b447a88512f7bb43f12a25a8
>> +Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
> Looks like you accidentally included a submodule change
>
> Alistair

Sorry. I'll fix this later.

Regards,

Weiwei Li

>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index ccacdee215..b12f69c584 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -583,6 +583,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>       if (env->misa_ext == 0) {
>>           uint32_t ext = 0;
>>
>> +        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
>> +                                cpu->cfg.ext_a & cpu->cfg.ext_f &
>> +                                cpu->cfg.ext_d)) {
>> +            warn_report("Setting G will also set IMAFD");
>> +            cpu->cfg.ext_i = true;
>> +            cpu->cfg.ext_m = true;
>> +            cpu->cfg.ext_a = true;
>> +            cpu->cfg.ext_f = true;
>> +            cpu->cfg.ext_d = true;
>> +        }
>> +
>> +
>>           /* Do some ISA extension error checking */
>>           if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
>>               error_setg(errp,
>> @@ -596,17 +608,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>               return;
>>           }
>>
>> -        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
>> -                                cpu->cfg.ext_a & cpu->cfg.ext_f &
>> -                                cpu->cfg.ext_d)) {
>> -            warn_report("Setting G will also set IMAFD");
>> -            cpu->cfg.ext_i = true;
>> -            cpu->cfg.ext_m = true;
>> -            cpu->cfg.ext_a = true;
>> -            cpu->cfg.ext_f = true;
>> -            cpu->cfg.ext_d = true;
>> -        }
>> -
>>           if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
>>               cpu->cfg.ext_zhinxmin) {
>>               cpu->cfg.ext_zfinx = true;
>> --
>> 2.17.1
>>
>>


