Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n3XMt-0004nV-IP
	for mharc-qemu-riscv@gnu.org; Sat, 01 Jan 2022 00:55:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n3XMr-0004mV-3E; Sat, 01 Jan 2022 00:55:49 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:55984 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n3XMo-0007um-2L; Sat, 01 Jan 2022 00:55:48 -0500
Received: from [192.168.0.103] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAB3fZ3T7M9hGQSeBQ--.45452S2;
 Sat, 01 Jan 2022 13:55:32 +0800 (CST)
Subject: Re: [PATCH v2 2/6] target/riscv: hardwire mstatus.FS to zero when
 enable zfinx
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-3-liweiwei@iscas.ac.cn>
 <09ecdc1d-2f51-d5bf-1ecd-9ab6c132fd2e@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <4b38e2e8-f288-f53a-71a6-f34feafb18b4@iscas.ac.cn>
Date: Sat, 1 Jan 2022 13:55:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <09ecdc1d-2f51-d5bf-1ecd-9ab6c132fd2e@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAB3fZ3T7M9hGQSeBQ--.45452S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4Dtw1fXFW7ur48Aw4xZwb_yoW8Xry7pr
 ykJFW8GryUGr4kJ3WrJr1UWFyrJr1UG3WDAF18XFW5GF1UJr1j9F4UXrZFgrn7Ar4xXryj
 yw1UX34kZF4ayrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28Icx
 kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY
 6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
 Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sat, 01 Jan 2022 05:55:49 -0000

Thanks for your comments.

在 2022/1/1 上午3:56, Richard Henderson 写道:
> On 12/30/21 7:23 PM, Weiwei Li wrote:
>> @@ -363,6 +363,10 @@ static void riscv_cpu_reset(DeviceState *dev)
>>       env->misa_mxl = env->misa_mxl_max;
>>       env->priv = PRV_M;
>>       env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>> +    /* hardwire mstatus.FS to zero when enable zfinx */
>> +    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
>> +        env->mstatus &= ~MSTATUS_FS;
>> +    }
>
> This shouldn't be necessary because it should never have been set.
Yes, I think so. However, I have a question about MSTATUS_MIE and 
MSTATUS_MPRV, will they be set before cpu reset?
>
>> -    uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
>> +    uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM|
>>                               MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
>>                               MSTATUS64_UXL | MSTATUS_VS;
>> +    /* hardwire mstatus.FS to zero when enable zfinx */
>> +    if (!RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
>> +        mstatus_mask |= MSTATUS_FS;
>> +    }
>
> I would think it would be more correct to have a positive test for 
> RVF, rather than a negative test for ZFINX?
It may  deviate from the original value of mstatus_mask with a positive 
test for RVF.
>
>
> r~


