Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ov78G-0004r0-IX
	for mharc-qemu-riscv@gnu.org; Tue, 15 Nov 2022 20:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ov78F-0004p1-8T; Tue, 15 Nov 2022 20:22:27 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ov78B-0001XO-3j; Tue, 15 Nov 2022 20:22:26 -0500
Received: from [192.168.3.6] (unknown [61.165.37.238])
 by APP-01 (Coremail) with SMTP id qwCowAB3fY1AO3RjvSD3CQ--.4578S2;
 Wed, 16 Nov 2022 09:22:09 +0800 (CST)
Message-ID: <fded6fe8-0e16-73ed-e071-359b483d792a@iscas.ac.cn>
Date: Wed, 16 Nov 2022 09:22:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: liweiwei@iscas.ac.cn, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v2 5/8] target/riscv: add support for Zcmp extension
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20221113023251.11047-1-liweiwei@iscas.ac.cn>
 <20221113023251.11047-6-liweiwei@iscas.ac.cn>
 <9713c707-2828-5436-dbd4-60fbd18985f6@linaro.org>
Content-Language: en-US
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <9713c707-2828-5436-dbd4-60fbd18985f6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAB3fY1AO3RjvSD3CQ--.4578S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1kCF48uFy7tw15ur1xKrg_yoW8CFyxpF
 y8CrW7GFWkAw1rA3W09F15t347ArnrJ3WUtw13WF1UJrW5JFyjgrn5W3ya9w4DJFs7Xr4j
 vF4YvrWDZF98ZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
 zVAYIcxG8wCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
 x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
 UI43ZEXa7VUbLiSPUUUUU==
X-Originating-IP: [61.165.37.238]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Wed, 16 Nov 2022 01:22:27 -0000


On 2022/11/15 21:44, Richard Henderson wrote:
> On 11/13/22 12:32, Weiwei Li wrote:
>>   {
>>     sq              101  ... ... .. ... 10 @c_sqsp
>>     c_fsd           101   ......  ..... 10 @c_sdsp
>> +
>> +  # *** RV64 and RV32 Zcmp Extension ***
>> +  cm_push         101  11000  .... .. 10 @zcmp
>> +  cm_pop          101  11010  .... .. 10 @zcmp
>> +  cm_popret       101  11110  .... .. 10 @zcmp
>> +  cm_popretz      101  11100  .... .. 10 @zcmp
>> +  cm_mva01s       101  011 ... 11 ... 10 @cm_mv
>> +  cm_mvsa01       101  011 ... 01 ... 10 @cm_mv
>>   }
>
> There is no overlap in these, so they should be within nested [].
OK. I'll update these in next version.
>
>
>> diff --git a/target/riscv/zce_helper.c b/target/riscv/zce_helper.c
>> new file mode 100644
>> index 0000000000..1346de1367
>> --- /dev/null
>> +++ b/target/riscv/zce_helper.c
>> @@ -0,0 +1,210 @@
>> +/*
>> + * RISC-V Zc* extension Helpers for QEMU.
>> + *
>> + * Copyright (c) 2021-2022 PLCT Lab
>> + *
>> + * This program is free software; you can redistribute it and/or 
>> modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2 or later, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but 
>> WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of 
>> MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public 
>> License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License 
>> along with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>
> The entire contents of this helper file should be handled at 
> translation time.
>
>
OK. I'll try to translate them in next version.

Regards,

Weiwei Li

> r~


