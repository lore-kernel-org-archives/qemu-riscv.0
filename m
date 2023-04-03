Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pj907-0000fz-WB
	for mharc-qemu-riscv@gnu.org; Sun, 02 Apr 2023 21:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pj906-0000fh-FI; Sun, 02 Apr 2023 21:28:50 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pj903-0005tt-PG; Sun, 02 Apr 2023 21:28:50 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowACXnVXFKypkUax7DQ--.54189S2;
 Mon, 03 Apr 2023 09:28:37 +0800 (CST)
Message-ID: <9abfb444-2d9d-f931-5a2f-bc8f57924446@iscas.ac.cn>
Date: Mon, 3 Apr 2023 09:28:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com
Subject: Re: [RESEND PATCH v5 4/6] target/riscv: Add support for PC-relative
 translation
To: Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230401124935.20997-1-liweiwei@iscas.ac.cn>
 <20230401124935.20997-5-liweiwei@iscas.ac.cn>
 <15b60df7-40ca-330c-faa9-daaa78b2000d@linux.alibaba.com>
 <7e87df52-cc1d-4a85-a83b-f12b80b7f040@iscas.ac.cn>
 <e0dc20a2-1a93-6c3d-b3e1-f62c7d1d61c9@linux.alibaba.com>
 <83dc4a04-1b26-dd72-63cb-940f8929b58f@linaro.org>
Content-Language: en-US
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <83dc4a04-1b26-dd72-63cb-940f8929b58f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACXnVXFKypkUax7DQ--.54189S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur4DAw13Xw15ur4rtry5urg_yoW3AFg_WF
 W7CF4DCwn09rWDXFs5try5XFyxJr1UWryDtrW8tFsrCr95Xa93Gr1kuFna9ws3uFZ5C3s7
 CwnIqFsxK34DXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb3AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.37,
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
X-List-Received-Date: Mon, 03 Apr 2023 01:28:50 -0000


On 2023/4/3 02:00, Richard Henderson wrote:
> On 4/2/23 06:17, LIU Zhiwei wrote:
>>>> Why set pc_save here?  IMHO, pc_save is a constant.
>>>
>>> pc_save is a value which is strictly related to the value of env->pc.
>>> real_pc = (old)env->pc + target_pc(from tb) - ctx->pc_save
>>
>> In this formula, the meaning of target_pc(from tb) doesn't match with 
>> gen_get_target_pc in the code. Its meaning in the code matches the 
>> real_pc in the formula. I think we should rename the 
>> gen_get_target_pc to gen_get_real_pc.
>
> Neither name is ideal, because it is also used for things that are not 
> "pc".
> See e.g. target/arm/, where this is called gen_pc_plus_diff.
>
OK. Acceptable to me.

Regards,

Weiwei Li

> This makes slightly more sense for uses like auipc and jalr.
>
>
> r~


