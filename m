Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouimG-0006aJ-8U
	for mharc-qemu-riscv@gnu.org; Mon, 14 Nov 2022 18:22:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ouigH-0005tn-IJ; Mon, 14 Nov 2022 18:16:07 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ouPyh-0008Cx-22; Sun, 13 Nov 2022 22:17:46 -0500
Received: from [192.168.3.6] (unknown [180.165.240.202])
 by APP-05 (Coremail) with SMTP id zQCowAD3_LRIs3Fj0Kl6CQ--.45314S2;
 Mon, 14 Nov 2022 11:17:30 +0800 (CST)
Message-ID: <abd875a9-7dda-8c73-8481-47d383ddc0c8@iscas.ac.cn>
Date: Mon, 14 Nov 2022 11:17:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: liweiwei@iscas.ac.cn, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v2 2/8] target/riscv: add support for Zca and Zcf
 extensions
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20221113023251.11047-1-liweiwei@iscas.ac.cn>
 <20221113023251.11047-3-liweiwei@iscas.ac.cn>
 <f41a1fe4-a564-5ca6-b52c-c3c4256ad241@linaro.org>
Content-Language: en-US
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <f41a1fe4-a564-5ca6-b52c-c3c4256ad241@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_LRIs3Fj0Kl6CQ--.45314S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur4xZFWxGr48Cw4Utw43ZFb_yoWfuFc_Jr
 4UGr1UXw1jvr4rtr17Gr1UXry7Cr1jyw4Utr4Yya18XF1UJFn8Aws8C3s5Ar1UKa15Jr17
 Cr15Ja13JF1UtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUU
 U==
X-Originating-IP: [180.165.240.202]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 14 Nov 2022 23:16:17 -0000


On 2022/11/14 05:40, Richard Henderson wrote:
> On 11/13/22 12:32, Weiwei Li wrote:
>> +        } else if ((get_xl_max(ctx) == MXL_RV32) &&
>> +            !ctx->cfg_ptr->ext_zcf &&
>> +            (((opcode & 0xe003) == 0x6000) ||
>> +             ((opcode & 0xe003) == 0x6002) ||
>> +             ((opcode & 0xe003) == 0xe000) ||
>> +             ((opcode & 0xe003) == 0xe002))) {
>>               gen_exception_illegal(ctx);
>
> Why aren't you using the same c_flw solution that you do for Zcd?
Yeah, it's OK for zcf intructions to use the c_flw solution.

I tried to remain the original logic for Zcf and Zcd instructions, 
However, this way is not suitable for Zcd instructions

since zcmp/zcmt instructions will overlap their encodings(but not the 
same).  So I changed the way of Zcd instructions.

Regards,

Weiwei Li

>
>
> r~


