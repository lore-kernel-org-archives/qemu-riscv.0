Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n3XXM-0007c6-DL
	for mharc-qemu-riscv@gnu.org; Sat, 01 Jan 2022 01:06:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n3XXK-0007Yr-6g; Sat, 01 Jan 2022 01:06:38 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:57190 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n3XXI-0003np-2e; Sat, 01 Jan 2022 01:06:37 -0500
Received: from [192.168.0.103] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAC3vp5l789hPCueBQ--.55802S2;
 Sat, 01 Jan 2022 14:06:30 +0800 (CST)
Subject: Re: [PATCH v2 4/6] target/riscv: add support for zdinx
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-5-liweiwei@iscas.ac.cn>
 <71a505a1-fd9f-6cbd-2bbc-6bce301bf1f4@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <b0d1a433-7644-93ec-fa00-78da9dcec512@iscas.ac.cn>
Date: Sat, 1 Jan 2022 14:06:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <71a505a1-fd9f-6cbd-2bbc-6bce301bf1f4@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAC3vp5l789hPCueBQ--.55802S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF17Ww17Cr15Zw48uw1Dtrb_yoW3Grb_Jw
 4qgrnrXr1UJFW8Xr1xury5Zr97JF1jvw1rGrZIyFyUWFnxJrs5JF4rGas5Gr17Ca13Ar97
 ArWrJ3W3GF1YqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbSxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
 WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU08nYUUUUU
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
X-List-Received-Date: Sat, 01 Jan 2022 06:06:38 -0000


在 2022/1/1 上午4:07, Richard Henderson 写道:
> On 12/30/21 7:23 PM, Weiwei Li wrote:
>> +    if (reg_num != 0) {
>> +        switch (get_ol(ctx)) {
>
> get_xl, not get_ol, two instances.
>
>
>> +#ifdef TARGET_RISCV32
>> +    {
>> +        TCGv_i64 t = ftemp_new(ctx);
>> +        tcg_gen_concat_i32_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num 
>> + 1]);
>> +        return t;
>> +    }
>> +#else
>> +    {
>> +        TCGv_i64 t = ftemp_new(ctx);
>> +        tcg_gen_deposit_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 
>> 1], 32, 32);
>> +        return t;
>> +    }
>
> Unify these two cases and use tcg_gen_concat_tl_i64.

OK. I'll fix this.

>
>
> r~


