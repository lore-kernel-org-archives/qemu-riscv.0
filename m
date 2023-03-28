Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgznC-0006f5-CH
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 23:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgznA-0006Xk-Ik; Mon, 27 Mar 2023 23:14:36 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgzn8-0003yE-7v; Mon, 27 Mar 2023 23:14:36 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowACnZ9aTWyJkNOH0Fw--.48009S2;
 Tue, 28 Mar 2023 11:14:28 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------NG9F730OHqaTZgSWil2BTyR3"
Message-ID: <c24b5fb2-48d3-c187-f165-2aa98f225302@iscas.ac.cn>
Date: Tue, 28 Mar 2023 11:14:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com
Subject: Re: [PATCH 5/5] target/riscv: Add pointer mask support for
 instruction fetch
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-6-liweiwei@iscas.ac.cn>
 <8fed2551-a67d-cd53-f5a1-f089f980aa08@linaro.org>
 <ae53e46c-b7e2-c986-a797-06a2630cc393@iscas.ac.cn>
 <4593f151-8622-7c4e-9e32-1748917a9347@linux.alibaba.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <4593f151-8622-7c4e-9e32-1748917a9347@linux.alibaba.com>
X-CM-TRANSID: qwCowACnZ9aTWyJkNOH0Fw--.48009S2
X-Coremail-Antispam: 1UD129KBjvJXoWrKr4kCF1Duw48WF47Wry7Awb_yoW8JrWkpr
 1rAr48CrWkJr97tw4DZw17ZFyYkr1UJ3Wjkry0ka909ry5Xr1Svr1UWa9Fgr1DWrZ7Gw1U
 Aw4UXrW8uFn8t3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r106r15McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c
 0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mx8GjcxK6IxK0xIIj40E
 5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VU889N3UUUUU==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 28 Mar 2023 03:14:36 -0000

This is a multi-part message in MIME format.
--------------NG9F730OHqaTZgSWil2BTyR3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/3/28 10:31, LIU Zhiwei wrote:
>
> On 2023/3/28 9:55, liweiwei wrote:
>>
>> On 2023/3/28 02:04, Richard Henderson wrote:
>>> On 3/27/23 03:00, Weiwei Li wrote:
>>>> @@ -1248,6 +1265,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr 
>>>> address, int size,
>>>>       qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d 
>>>> mmu_idx %d\n",
>>>>                     __func__, address, access_type, mmu_idx);
>>>>   +    if (access_type == MMU_INST_FETCH) {
>>>> +        address = adjust_pc_address(env, address);
>>>> +    }
>>>
>>> Why do you want to do this so late, as opposed to earlier in 
>>> cpu_get_tb_cpu_state?
>>
>> In this way, the pc for tb may be different from the reg pc. 
> I don't understand.
>> Then the pc register will be wrong if sync from tb.
>
> I think you should give an explain here why it is wrong.
>
> Zhiwei

Assume the pc is 0x1fff 0000, pmmask is 0xf000 0000, if we adjust pc in  
cpu_get_tb_cpu_state,

then the tb->pc will be 0x0fff 0000.

If we sync pc from tb by riscv_cpu_synchronize_from_tb()

Then the pc will be updated to 0x0fff 0000 in this case, which will 
different from the original value.

I ignore many internal steps in above case. Any critical condition I 
missed? or any misunderstood?

Regards,

Weiwei Li

>
>>
>> Regards,
>>
>> Weiwei Li
>>
>>>
>>>
>>> r~
--------------NG9F730OHqaTZgSWil2BTyR3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/3/28 10:31, LIU Zhiwei wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4593f151-8622-7c4e-9e32-1748917a9347@linux.alibaba.com">
      <br>
      On 2023/3/28 9:55, liweiwei wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 2023/3/28 02:04, Richard Henderson wrote:
        <br>
        <blockquote type="cite">On 3/27/23 03:00, Weiwei Li wrote:
          <br>
          <blockquote type="cite">@@ -1248,6 +1265,10 @@ bool
            riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
            <br>
                  qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw
            %d mmu_idx %d\n",
            <br>
                                __func__, address, access_type,
            mmu_idx);
            <br>
              +    if (access_type == MMU_INST_FETCH) {
            <br>
            +        address = adjust_pc_address(env, address);
            <br>
            +    }
            <br>
          </blockquote>
          <br>
          Why do you want to do this so late, as opposed to earlier in
          cpu_get_tb_cpu_state?
          <br>
        </blockquote>
        <br>
        In this way, the pc for tb may be different from the reg pc. </blockquote>
      I don't understand.
      <br>
      <blockquote type="cite">Then the pc register will be wrong if sync
        from tb.
        <br>
      </blockquote>
      <br>
      I think you should give an explain here why it is wrong.
      <br>
      <br>
      Zhiwei
      <br>
    </blockquote>
    <p>Assume the pc is 0x1fff 0000, pmmask is 0xf000 0000, if we adjust
      pc in  cpu_get_tb_cpu_state,</p>
    <p>then the tb-&gt;pc will be 0x0fff 0000.</p>
    <p>If we sync pc from tb by <span style="color: #000000;">riscv_cpu_synchronize_from_tb()</span></p>
    <p><span style="color: #000000;">Then the pc will be updated to </span>0x0fff
      0000 in this case, which will different from the original value.</p>
    <p>I ignore many internal steps in above case. Any critical
      condition I missed? or any misunderstood?</p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
      <span style="color: #000000;"></span></p>
    <blockquote type="cite"
      cite="mid:4593f151-8622-7c4e-9e32-1748917a9347@linux.alibaba.com">
      <br>
      <blockquote type="cite">
        <br>
        Regards,
        <br>
        <br>
        Weiwei Li
        <br>
        <br>
        <blockquote type="cite">
          <br>
          <br>
          r~
          <br>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------NG9F730OHqaTZgSWil2BTyR3--


