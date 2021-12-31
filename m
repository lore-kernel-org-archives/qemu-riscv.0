Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n37gS-0003qc-28
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 21:30:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n37gI-0003qA-5O; Thu, 30 Dec 2021 21:30:13 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:53778 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n37gF-00027y-0V; Thu, 30 Dec 2021 21:30:09 -0500
Received: from [192.168.0.102] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADX3loka85hWM3vBA--.21766S2;
 Fri, 31 Dec 2021 10:29:57 +0800 (CST)
Subject: Re: [PATCH v3 1/7] target/riscv: rvk: add cfg properties for zbk* and
 zk*
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com,
 luruibo2000@163.com, lustrew@foxmail.com
References: <20211230143058.7352-1-liweiwei@iscas.ac.cn>
 <20211230143058.7352-2-liweiwei@iscas.ac.cn>
 <CAEUhbmWjnGxJ2DtrQkEVD+JAXgivPDAbwoSf+y4up6dDcvjNgQ@mail.gmail.com>
From: liweiwei <liweiwei@iscas.ac.cn>
Message-ID: <c43057cb-c582-bf52-b55c-4cb153bfa317@iscas.ac.cn>
Date: Fri, 31 Dec 2021 10:29:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWjnGxJ2DtrQkEVD+JAXgivPDAbwoSf+y4up6dDcvjNgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowADX3loka85hWM3vBA--.21766S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFykKF4DJF1UAw4fCryDWrg_yoW8uFy8p3
 y5Ga15Ar9rAryxCw4fZFyUKF1rWwn7GryIga9rtFn3GrWIkrWfJF4qkw429F4vqF4FvF1a
 gF1YkF1qkFsrAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20x
 vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 31 Dec 2021 02:30:18 -0000


在 2021/12/31 上午10:04, Bin Meng 写道:
> On Thu, Dec 30, 2021 at 10:32 PM liweiwei <liweiwei@iscas.ac.cn> wrote:
>> Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
>> Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
> nits: looks like the best practice of the name is:
>
> Weiwei Li and Junqiang Wang
>
Thanks for your comment.  I'll update this later.
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   target/riscv/cpu.c | 23 +++++++++++++++++++++++
>>   target/riscv/cpu.h | 13 +++++++++++++
>>   2 files changed, 36 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 6ef3314bce..961c5f4334 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -491,6 +491,29 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>               cpu->cfg.ext_d = true;
>>           }
>>
>> +        if (cpu->cfg.ext_zk) {
>> +            cpu->cfg.ext_zkn = true;
>> +            cpu->cfg.ext_zkr = true;
>> +            cpu->cfg.ext_zkt = true;
>> +        }
>> +
>> +        if (cpu->cfg.ext_zkn) {
>> +            cpu->cfg.ext_zbkb = true;
>> +            cpu->cfg.ext_zbkc = true;
>> +            cpu->cfg.ext_zbkx = true;
>> +            cpu->cfg.ext_zkne = true;
>> +            cpu->cfg.ext_zknd = true;
>> +            cpu->cfg.ext_zknh = true;
>> +        }
>> +
>> +        if (cpu->cfg.ext_zks) {
>> +            cpu->cfg.ext_zbkb = true;
>> +            cpu->cfg.ext_zbkc = true;
>> +            cpu->cfg.ext_zbkx = true;
>> +            cpu->cfg.ext_zksed = true;
>> +            cpu->cfg.ext_zksh = true;
>> +        }
>> +
>>           /* Set the ISA extensions, checks should have happened above */
>>           if (cpu->cfg.ext_i) {
>>               ext |= RVI;
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index dc10f27093..edca7118ff 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -311,7 +311,20 @@ struct RISCVCPU {
>>           bool ext_zba;
>>           bool ext_zbb;
>>           bool ext_zbc;
>> +        bool ext_zbkb;
>> +        bool ext_zbkc;
>> +        bool ext_zbkx;
>>           bool ext_zbs;
>> +        bool ext_zk;
>> +        bool ext_zkn;
>> +        bool ext_zknd;
>> +        bool ext_zkne;
>> +        bool ext_zknh;
>> +        bool ext_zkr;
>> +        bool ext_zks;
>> +        bool ext_zksed;
>> +        bool ext_zksh;
>> +        bool ext_zkt;
>>           bool ext_counters;
>>           bool ext_ifencei;
>>           bool ext_icsr;
>> --
> Regards,
> Bin


