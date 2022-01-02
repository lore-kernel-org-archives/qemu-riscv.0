Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n3tom-0001O9-C0
	for mharc-qemu-riscv@gnu.org; Sun, 02 Jan 2022 00:54:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n3toi-0001Mc-PG; Sun, 02 Jan 2022 00:54:04 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:59454 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n3tog-0008Ih-B5; Sun, 02 Jan 2022 00:54:04 -0500
Received: from [192.168.0.103] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADX3lrwPdFhJAoFBQ--.49869S2;
 Sun, 02 Jan 2022 13:53:53 +0800 (CST)
Subject: Re: [PATCH v2 2/6] target/riscv: hardwire mstatus.FS to zero when
 enable zfinx
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-3-liweiwei@iscas.ac.cn>
 <09ecdc1d-2f51-d5bf-1ecd-9ab6c132fd2e@linaro.org>
 <4b38e2e8-f288-f53a-71a6-f34feafb18b4@iscas.ac.cn>
 <43631cc8-64c1-9998-f693-51bff18b0671@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <f744f8ac-77ad-95f0-7c13-d3c27d4fe4bf@iscas.ac.cn>
Date: Sun, 2 Jan 2022 13:53:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <43631cc8-64c1-9998-f693-51bff18b0671@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowADX3lrwPdFhJAoFBQ--.49869S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr48ZF18Ary7KFW7KrWfZrb_yoWfurb_Xr
 s29rsrA3yDCFWavw4vyrs3Wr92grZrAayxurWqgrWavw17trZrCF4Dur18tFWxAa1fWrnI
 kF1aq345u343WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbh8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
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
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sun, 02 Jan 2022 05:54:07 -0000


在 2022/1/2 上午3:46, Richard Henderson 写道:
> On 12/31/21 9:55 PM, Weiwei Li wrote:
>>> This shouldn't be necessary because it should never have been set.
>> Yes, I think so. However, I have a question about MSTATUS_MIE and 
>> MSTATUS_MPRV, will they be set before cpu reset?
>
> Yes, via warm reset.
Thanks. I'll fix this later.
>
>>> I would think it would be more correct to have a positive test for 
>>> RVF, rather than a negative test for ZFINX?
>> It may  deviate from the original value of mstatus_mask with a 
>> positive test for RVF.
>
> Oh, you mean misa_ext?  Hmm.  Interesting point.
>
> When F extension is not implemented, FS is either hardwired to zero 
> (without S-mode) or optionally zero.  So this looks like an existing 
> bug to be fixed.
>
OK.  There is similar logic in write_mstatus and .  I'll fix it too.

I'll also update write_frm,  write_fflags and write_fflags to have a 
positive test for RVF .

>
> r~


