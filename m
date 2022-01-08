Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n60KZ-0000Gm-7q
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jan 2022 20:15:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n60K4-00005o-Ky; Fri, 07 Jan 2022 20:15:20 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:35838 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n60K0-0003fN-6z; Fri, 07 Jan 2022 20:15:07 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAC3vp6N5dhhsdkABg--.32963S2;
 Sat, 08 Jan 2022 09:14:54 +0800 (CST)
Subject: Re: [PATCH v3 4/6] target/riscv: add support for zdinx
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20220107112749.981-1-liweiwei@iscas.ac.cn>
 <20220107112749.981-5-liweiwei@iscas.ac.cn>
 <3ad579d2-9b29-a635-48ec-64f63e9b5ed6@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <f1764629-d4af-9cf7-2a64-f1105e0364bd@iscas.ac.cn>
Date: Sat, 8 Jan 2022 09:14:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3ad579d2-9b29-a635-48ec-64f63e9b5ed6@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAC3vp6N5dhhsdkABg--.32963S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr1kZF4kCFWkGF4DJr1DWrg_yoW3JrX_Zw
 4rur4DWr42kFWIywn7Xr1fXFWDta4qy340qFWYkF1DCF1xJFZ3Kr4fC395tw4vga15Jr13
 Cry3J3sxJ3WvqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbSkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
 WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUj0JPtUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Sat, 08 Jan 2022 01:15:37 -0000

在 2022/1/8 上午4:54, Richard Henderson 写道:
> On 1/7/22 3:27 AM, Weiwei Li wrote:
>> +#define REQUIRE_EVEN(ctx, reg) do { \
>> +    if (ctx->ext_zdinx && (get_xl(ctx) == MXL_RV32) && \
>> +        (reg & 0x1)) { \
>> +        return false; \
>> +    } \
>> +} while (0)
>
> Parenthesis around reg.
>
>> +    REQUIRE_EVEN(ctx, a->rd);
>> +    REQUIRE_EVEN(ctx, a->rs1);
>> +    REQUIRE_EVEN(ctx, a->rs2);
>> +    REQUIRE_EVEN(ctx, a->rs3);
>
> I think these could all be combined:
>
>     REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2 | a->rs3);
Yeah, That's true. I'll update this.
>
> etc.
>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~


