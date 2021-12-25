Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n0xiA-0005nb-3J
	for mharc-qemu-riscv@gnu.org; Fri, 24 Dec 2021 22:27:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0xi9-0005nN-2G; Fri, 24 Dec 2021 22:27:09 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:42482 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0xi6-0006cF-PS; Fri, 24 Dec 2021 22:27:08 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAD3zKWFj8Zh5v0dBQ--.1541S2;
 Sat, 25 Dec 2021 11:27:02 +0800 (CST)
Subject: Re: [PATCH 4/6] target/riscv: add support for zdinx
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-5-liweiwei@iscas.ac.cn>
 <39665e5f-f672-45d6-d3f1-39136a5c1c08@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
Message-ID: <201ca05d-d8cc-75fd-f284-4a6179791752@iscas.ac.cn>
Date: Sat, 25 Dec 2021 11:27:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <39665e5f-f672-45d6-d3f1-39136a5c1c08@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAD3zKWFj8Zh5v0dBQ--.1541S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF47Ar48Xw4UuF47Aw1UZFb_yoW3Zwb_Jw
 4kuFs2vr4UZay3Zr1vkr1fua47Ar4qvryrXFZ09rnrGF10q395Xw1fCas5Aa4aga98Grya
 9FyrJ343A3ZIgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbSkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
 CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj2jg7UUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.133,
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
X-List-Received-Date: Sat, 25 Dec 2021 03:27:09 -0000


在 2021/12/25 上午6:30, Richard Henderson 写道:
> On 12/23/21 7:49 PM, liweiwei wrote:
>>   static bool trans_fsgnj_d(DisasContext *ctx, arg_fsgnj_d *a)
>>   {
>> +    REQUIRE_FPU;
>> +    REQUIRE_ZDINX_OR_D(ctx);
>> +
>> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
>> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
>> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
>> +
>>       if (a->rs1 == a->rs2) { /* FMOV */
>
> Applies to the F version as well, but we should not assemble src2 when 
> we don't need it.
OK, I'll fix this.
>
>> - tcg_gen_mov_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
>> +        tcg_gen_mov_i64(dest, src1);
>
>
> I think this can just be dest = get_fpr_d(ctx, a->src1), leaving the 
> final "move" to gen_set_fpr_d.
OK. I'll update this.
>
>
> r~


