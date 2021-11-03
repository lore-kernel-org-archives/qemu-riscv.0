Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi4jY-00056n-G6
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 21:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mi4jX-00054l-2m; Tue, 02 Nov 2021 21:06:31 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:56706 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mi4jT-0002h6-94; Tue, 02 Nov 2021 21:06:30 -0400
Received: from [192.168.0.103] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACXnamJ4IFh9qsnBg--.15201S2;
 Wed, 03 Nov 2021 09:06:17 +0800 (CST)
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
From: liweiwei <liweiwei@iscas.ac.cn>
Message-ID: <83e80e8f-485a-84b9-10e6-bac7d54850e1@iscas.ac.cn>
Date: Wed, 3 Nov 2021 09:06:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <85f8f249-a54c-0ad6-a3bf-7bc4f072251b@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowACXnamJ4IFh9qsnBg--.15201S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZry5AFW8tFWrZFyUuryDWrg_yoW3Kwc_Jw
 48KrnrWr4UJr48Kr15Zr1kZry5tr42yF1Yqrs8A3W8WF18JF98Jr1rtwn5Crn5K3yUAry5
 Jr18Jw13G3WjqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbh8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
 WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
 Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnXdbUUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Wed, 03 Nov 2021 01:06:31 -0000


在 2021/11/3 上午1:56, Richard Henderson 写道:
> On 11/1/21 11:11 PM, liweiwei wrote:
>> +        if (cpu->cfg.ext_zk) {
>> +            cpu->cfg.ext_zbkb = true;
>> +            cpu->cfg.ext_zbkc = true;
>> +            cpu->cfg.ext_zbkx = true;
>> +            cpu->cfg.ext_zknd = true;
>> +            cpu->cfg.ext_zkne = true;
>> +            cpu->cfg.ext_zknh = true;
>> +            cpu->cfg.ext_zkr = true;
>> +        }
>
> Section 2.12 lists instead the larger Zkn, Zks, Zkt extensions.
> I think it's better to follow that.
>
OK. I'll replace this with setting ext_zkn, ext_zks, ext_zkt true. By 
the way, Zkt only includes partial RVI/M/C instructions. Is it 
neccessary to distinguish them?
>
> r~


