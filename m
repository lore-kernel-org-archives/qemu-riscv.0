Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miAc1-0007E9-O5
	for mharc-qemu-riscv@gnu.org; Wed, 03 Nov 2021 03:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1miAbz-0007Dp-UD; Wed, 03 Nov 2021 03:23:07 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:49706 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1miAbw-0006NK-W4; Wed, 03 Nov 2021 03:23:07 -0400
Received: from [192.168.0.103] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAA3PQHLOIJhXqNkBg--.23044S2;
 Wed, 03 Nov 2021 15:22:52 +0800 (CST)
Subject: Re: [RFC 3/6] target/riscv: rvk: add flag support for
 Zk/Zkn/Zknd/Zknd/Zkne/Zknh/Zks/Zksed/Zksh/Zkr
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
 <20211102031128.17296-4-liweiwei@iscas.ac.cn>
 <85f8f249-a54c-0ad6-a3bf-7bc4f072251b@linaro.org>
 <83e80e8f-485a-84b9-10e6-bac7d54850e1@iscas.ac.cn>
 <70a3f6e6-26cd-103b-df44-ed86c2e8f10a@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
Message-ID: <5b06d731-8de7-058f-7938-e1eff9ad3aff@iscas.ac.cn>
Date: Wed, 3 Nov 2021 15:22:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <70a3f6e6-26cd-103b-df44-ed86c2e8f10a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAA3PQHLOIJhXqNkBg--.23044S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zry5XrWfJFy8tr4rZry7Wrg_yoW8Gr1Dpr
 ykJa1jyrWDJr18Gw4UXa4UGF9Iq3W8Aw1xX34Fq3ZrJrZrGF1aqr1UWw1q9F4Fgrs7JF1U
 Xr1UWr1DZrsxJrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
 CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj0JPtUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.549,
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
X-List-Received-Date: Wed, 03 Nov 2021 07:23:08 -0000


在 2021/11/3 上午9:21, Richard Henderson 写道:
> On 11/2/21 9:06 PM, liweiwei wrote:
>>
>> 在 2021/11/3 上午1:56, Richard Henderson 写道:
>>> On 11/1/21 11:11 PM, liweiwei wrote:
>>>> +        if (cpu->cfg.ext_zk) {
>>>> +            cpu->cfg.ext_zbkb = true;
>>>> +            cpu->cfg.ext_zbkc = true;
>>>> +            cpu->cfg.ext_zbkx = true;
>>>> +            cpu->cfg.ext_zknd = true;
>>>> +            cpu->cfg.ext_zkne = true;
>>>> +            cpu->cfg.ext_zknh = true;
>>>> +            cpu->cfg.ext_zkr = true;
>>>> +        }
>>>
>>> Section 2.12 lists instead the larger Zkn, Zks, Zkt extensions.
>>> I think it's better to follow that.
>>>
>> OK. I'll replace this with setting ext_zkn, ext_zks, ext_zkt true. By 
>> the way, Zkt only includes partial RVI/M/C instructions. Is it 
>> neccessary to distinguish them?
>
> I don't know if Zkt needs to be called out; it probably depends on 
> whether it is exposed to the guest via some MISA csr extension.
It seems not  exposed to the guest via some MISA csr extension. And it 
also doesn't define a set of instructions available in the core. It just 
restricts the set of instructions to have 'data-independent execution time'.
>
>
> r~


