Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ph6XG-0003hJ-HF
	for mharc-qemu-riscv@gnu.org; Tue, 28 Mar 2023 06:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ph6XE-0003gn-51; Tue, 28 Mar 2023 06:26:36 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ph6XB-0000Nz-DD; Tue, 28 Mar 2023 06:26:35 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowADHzzPMwCJksq0_Cw--.13818S2;
 Tue, 28 Mar 2023 18:26:22 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------sKQNYS42uoaTnKs6ua4TRT6v"
Message-ID: <c0537d04-58d3-f445-686e-1be96ec95610@iscas.ac.cn>
Date: Tue, 28 Mar 2023 18:26:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com
Subject: Re: [PATCH 1/5] target/riscv: Fix effective address for pointer mask
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-2-liweiwei@iscas.ac.cn>
 <c0abfb39-56a7-a184-f134-bcb075908f57@linux.alibaba.com>
 <c1b60f5e-5bb8-5462-ae93-7813da4269bb@iscas.ac.cn>
 <389e5dd1-12fc-8b71-8e6a-74db1179fa47@linaro.org>
 <04639827-2706-69d8-56d9-5e278742168d@iscas.ac.cn>
 <241a90ec-b183-78d2-f2ba-9317cbad01dc@linux.alibaba.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <241a90ec-b183-78d2-f2ba-9317cbad01dc@linux.alibaba.com>
X-CM-TRANSID: zQCowADHzzPMwCJksq0_Cw--.13818S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1UCrW3CF1DZFyUtF1DZFb_yoW8Gw1xpr
 WrCr4FkrW0qwnakFZrJr1DXFy3GrykA3W7X34jka4UAry5Jw1Fvw10vrZ09rWv9r4IvrW2
 va1YqrWUZF1DZ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mx8GjcxK6IxK0xIIj40E5I8C
 rwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
 nxnUUI43ZEXa7VU1g4S7UUUUU==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 28 Mar 2023 10:26:36 -0000

This is a multi-part message in MIME format.
--------------sKQNYS42uoaTnKs6ua4TRT6v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/3/28 15:25, LIU Zhiwei wrote:
>
>
> On 2023/3/28 11:33, liweiwei wrote:
>>
>>
>> On 2023/3/28 11:18, Richard Henderson wrote:
>>> On 3/27/23 19:48, liweiwei wrote:
>>>>
>>>> On 2023/3/28 10:20, LIU Zhiwei wrote:
>>>>>
>>>>> On 2023/3/27 18:00, Weiwei Li wrote:
>>>>>> Since pointer mask works on effective address, and the xl works 
>>>>>> on the
>>>>>> generation of effective address, so xl related calculation should 
>>>>>> be done
>>>>>> before pointer mask.
>>>>>
>>>>> Incorrect. It has been done.
>>>>>
>>>>> When updating the pm_mask,  we have already considered the env->xl.
>>>>>
>>>>> You can see it in riscv_cpu_update_mask
>>>>>
>>>>>     if (env->xl == MXL_RV32) {
>>>>>         env->cur_pmmask = mask & UINT32_MAX;
>>>>>         env->cur_pmbase = base & UINT32_MAX;
>>>>>     } else {
>>>>>         env->cur_pmmask = mask;
>>>>>         env->cur_pmbase = base;
>>>>>     }
>>>>>
>>>> Yeah, I missed this part. Then we should ensure cur_pmmask/base is 
>>>> updated when xl changes.
>>>
>>> Is that even possible?  XL can change on priv level changes (SXL, UXL).
>>
>> Yeah. Not possible, since only UXL is changable currently, and 
>> SXL/UXL can only be changed in higher priv level.
>>
>> So the recompute for xl in write_mstatus() seems redundant.
>>
> I think you are almost right. But as we allow write XL field when in 
> debug mode, we seemly also need call this function for it.
>
Then,  cur_pmbase/mask also need update in this case.

Weiwei Li

> Zhiwei
>
>> Maybe there is a way to change current xl in future if misa.mxl is 
>> changable.
>>
>> Regards,
>>
>> Weiwei Li
>>
>>>
>>>
>>> r~
--------------sKQNYS42uoaTnKs6ua4TRT6v
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/3/28 15:25, LIU Zhiwei wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:241a90ec-b183-78d2-f2ba-9317cbad01dc@linux.alibaba.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2023/3/28 11:33, liweiwei wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:04639827-2706-69d8-56d9-5e278742168d@iscas.ac.cn">
        <meta http-equiv="Content-Type" content="text/html;
          charset=UTF-8">
        <p><br>
        </p>
        <div class="moz-cite-prefix">On 2023/3/28 11:18, Richard
          Henderson wrote:<br>
        </div>
        <blockquote type="cite"
          cite="mid:389e5dd1-12fc-8b71-8e6a-74db1179fa47@linaro.org">On
          3/27/23 19:48, liweiwei wrote: <br>
          <blockquote type="cite"> <br>
            On 2023/3/28 10:20, LIU Zhiwei wrote: <br>
            <blockquote type="cite"> <br>
              On 2023/3/27 18:00, Weiwei Li wrote: <br>
              <blockquote type="cite">Since pointer mask works on
                effective address, and the xl works on the <br>
                generation of effective address, so xl related
                calculation should be done <br>
                before pointer mask. <br>
              </blockquote>
              <br>
              Incorrect. It has been done. <br>
              <br>
              When updating the pm_mask,  we have already considered the
              env-&gt;xl. <br>
              <br>
              You can see it in riscv_cpu_update_mask <br>
              <br>
                  if (env-&gt;xl == MXL_RV32) { <br>
                      env-&gt;cur_pmmask = mask &amp; UINT32_MAX; <br>
                      env-&gt;cur_pmbase = base &amp; UINT32_MAX; <br>
                  } else { <br>
                      env-&gt;cur_pmmask = mask; <br>
                      env-&gt;cur_pmbase = base; <br>
                  } <br>
              <br>
            </blockquote>
            Yeah, I missed this part. Then we should ensure
            cur_pmmask/base is updated when xl changes. <br>
          </blockquote>
          <br>
          Is that even possible?  XL can change on priv level changes
          (SXL, UXL). <br>
        </blockquote>
        <p>Yeah. Not possible, since only UXL is changable currently,
          and SXL/UXL can only be changed in higher priv level.</p>
        <p>So the recompute for xl in <span style="color: #000000;">write_mstatus()
            seems redundant.</span></p>
      </blockquote>
      <p>I think you are almost right. But as we allow write XL field
        when in debug mode, we seemly also need call this function for
        it.</p>
    </blockquote>
    <p>Then,  cur_pmbase/mask also need update in this case.</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
      cite="mid:241a90ec-b183-78d2-f2ba-9317cbad01dc@linux.alibaba.com">
      <p>Zhiwei<br>
      </p>
      <blockquote type="cite"
        cite="mid:04639827-2706-69d8-56d9-5e278742168d@iscas.ac.cn">
        <p><span style="color: #000000;">Maybe there is a way to change
            current xl in future if misa.mxl is changable.</span></p>
        <p><span style="color: #000000;">Regards,</span></p>
        <p><span style="color: #000000;">Weiwei Li<br>
          </span></p>
        <blockquote type="cite"
          cite="mid:389e5dd1-12fc-8b71-8e6a-74db1179fa47@linaro.org"> <br>
          <br>
          r~ <br>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------sKQNYS42uoaTnKs6ua4TRT6v--


