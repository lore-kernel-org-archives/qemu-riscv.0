Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkaqp-0002Za-0C
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 21:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkaql-0002Z2-6E; Thu, 06 Apr 2023 21:25:11 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkaqi-0003oK-DA; Thu, 06 Apr 2023 21:25:10 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAD3O5zrcC9k4_xcAA--.16323S2;
 Fri, 07 Apr 2023 09:25:00 +0800 (CST)
Message-ID: <8584b1cd-d7eb-2169-410f-7cc7224568e9@iscas.ac.cn>
Date: Fri, 7 Apr 2023 09:24:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/2] target/riscv: Legalize MPP value in write_mstatus
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230406072555.21927-1-liweiwei@iscas.ac.cn>
 <20230406072555.21927-3-liweiwei@iscas.ac.cn>
 <8bbf3df9-1e90-7976-7273-41cab3e96881@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <8bbf3df9-1e90-7976-7273-41cab3e96881@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD3O5zrcC9k4_xcAA--.16323S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWfuF48urW3tr4xWr18Grg_yoW8XrWUpr
 4ktr4UJryUJw1kXr1UJr4UWFyUAr47Gw1UJrn5Ja4jyF4DJr1vqr4UXr1agry7Jr4xJr4U
 Aw4UX34DZ347JFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
 IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
 MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
 WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
 6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
 BIdaVFxhVjvjDU0xZFpf9x0JUp6wZUUUUU=
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.224,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 07 Apr 2023 01:25:12 -0000


On 2023/4/7 03:33, Richard Henderson wrote:
> On 4/6/23 00:25, Weiwei Li wrote:
>> +static target_ulong legalize_mpp(CPURISCVState *env, target_ulong 
>> old_mpp,
>> +                                 target_ulong val)
>> +{
>> +    target_ulong new_mpp = get_field(val, MSTATUS_MPP);
>> +    bool mpp_invalid = (new_mpp == PRV_S && !riscv_has_ext(env, 
>> RVS)) ||
>> +                       (new_mpp == PRV_U && !riscv_has_ext(env, 
>> RVU)) ||
>> +                       (new_mpp == PRV_H);
>> +
>> +    /* Remain field unchanged if new_mpp value is invalid */
>> +    return mpp_invalid ? set_field(val, MSTATUS_MPP, old_mpp) : val;
>> +}
>
> Does anyone find PRV_H confusing, since that's not what it is?
> I think it would be nice to remove it entirely.
I agree. Maybe PRV_RESERVED is more readable in some cases.
>
> This function might be better as
>
>     bool valid = false;
>
>     switch (new_mpp) {
>     case PRV_M:
>         valid = true;
>         break;
>     case PRV_S:
>         valid = riscv_has_ext(env, RVS);
>         break;
>     case PRV_U:
>         valid = riscv_has_ext(env, RVU);
>         break;
>     }
>     if (!valid) {
>         val = set_field(...);
>     }
>     return val;
>
>
OK. This is more readable. I'll update this.

Regards,

Weiwei Li

> r~


