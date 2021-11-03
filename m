Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi4lj-0007ky-Fr
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 21:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mi4lf-0007jl-VX; Tue, 02 Nov 2021 21:08:44 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:57398 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mi4ld-00030r-3v; Tue, 02 Nov 2021 21:08:43 -0400
Received: from [192.168.0.103] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAD3_78R4YFhiLgnBg--.5889S2;
 Wed, 03 Nov 2021 09:08:34 +0800 (CST)
Subject: Re: [RFC 4/6] target/riscv: rvk: add implementation of instructions
 for Zk*
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
 <20211102031128.17296-5-liweiwei@iscas.ac.cn>
 <345c3fc7-72f9-a5b8-1545-fe7835ed8905@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
Message-ID: <96831a41-5d70-68d4-49f7-3308be3f5f6d@iscas.ac.cn>
Date: Wed, 3 Nov 2021 09:08:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <345c3fc7-72f9-a5b8-1545-fe7835ed8905@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAD3_78R4YFhiLgnBg--.5889S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4DXr1Dur1fCF4UtFyxKrg_yoWDuFc_J3
 y8WrsrJr1UZayDKF45Ar17GFn3X3Z7AFyDKF4Fqr1j9ay0g397J342kFyxZw1rKry5JF9x
 G3W7G34UJrn8ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbSkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
 WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
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
X-List-Received-Date: Wed, 03 Nov 2021 01:08:45 -0000


在 2021/11/3 上午2:56, Richard Henderson 写道:
> On 11/1/21 11:11 PM, liweiwei wrote:
>> +uint8_t AES_ENC_SBOX[] = {
>> +  0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5,
>> +  0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
>> +  0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0,
>> +  0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
>
> Use "crypto/aes.h".
>
OK. I'll reuse this.
>
>> +/* SM4 forward SBox. SM4 has no inverse sbox. */
>> +static const uint8_t sm4_sbox[256] = {
>> +    0xD6, 0x90, 0xE9, 0xFE, 0xCC, 0xE1, 0x3D, 0xB7, 0x16, 0xB6, 
>> 0x14, 0xC2,
>> +    0x28, 0xFB, 0x2C, 0x05, 0x2B, 0x67, 0x9A, 0x76, 0x2A, 0xBE, 
>> 0x04, 0xC3,
>> +    0xAA, 0x44, 0x13, 0x26, 0x49, 0x86, 0x06, 0x99, 0x9C, 0x42, 
>> 0x50, 0xF4,
>
> Hmm.  We have an existing copy of this in target/arm/crypto_helper.c.  
> I think we should move that code out to a shared location like aes.
OK. I'll try to move it.
>
>> +#define sext_xlen(x) (((int64_t)(x) << (XLEN - 32)) >> (XLEN  - 32))
>
> This is (target_ulong)(int32_t)(x).
>
OK. I'll improve this.
>
> r~


