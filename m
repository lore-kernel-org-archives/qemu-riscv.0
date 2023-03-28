Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ph05Y-0008AP-1L
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 23:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ph05W-00089z-9u; Mon, 27 Mar 2023 23:33:34 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ph05T-0002jq-Dz; Mon, 27 Mar 2023 23:33:34 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowACnZ9YDYCJksDT2Fw--.48096S2;
 Tue, 28 Mar 2023 11:33:24 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------cuP4ds9M9w7kIF59MpllUzR8"
Message-ID: <04639827-2706-69d8-56d9-5e278742168d@iscas.ac.cn>
Date: Tue, 28 Mar 2023 11:33:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com
Subject: Re: [PATCH 1/5] target/riscv: Fix effective address for pointer mask
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-2-liweiwei@iscas.ac.cn>
 <c0abfb39-56a7-a184-f134-bcb075908f57@linux.alibaba.com>
 <c1b60f5e-5bb8-5462-ae93-7813da4269bb@iscas.ac.cn>
 <389e5dd1-12fc-8b71-8e6a-74db1179fa47@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <389e5dd1-12fc-8b71-8e6a-74db1179fa47@linaro.org>
X-CM-TRANSID: qwCowACnZ9YDYCJksDT2Fw--.48096S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XrWruryfuw48trWfCF1fCrg_yoWkCwc_Wr
 WxGrZrWwn8Jaykuw15Jw15Zry8Zw42yr15tr1v9r17WryUJrZxJrsIgwn3Xws3GFsxWF9I
 kFZ8Xr1fA343XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2
 z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCjr7xvwVCIw2I0I7xG6c02
 F41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUtkuxUUUUU=
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
X-List-Received-Date: Tue, 28 Mar 2023 03:33:34 -0000

This is a multi-part message in MIME format.
--------------cuP4ds9M9w7kIF59MpllUzR8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/3/28 11:18, Richard Henderson wrote:
> On 3/27/23 19:48, liweiwei wrote:
>>
>> On 2023/3/28 10:20, LIU Zhiwei wrote:
>>>
>>> On 2023/3/27 18:00, Weiwei Li wrote:
>>>> Since pointer mask works on effective address, and the xl works on the
>>>> generation of effective address, so xl related calculation should 
>>>> be done
>>>> before pointer mask.
>>>
>>> Incorrect. It has been done.
>>>
>>> When updating the pm_mask,  we have already considered the env->xl.
>>>
>>> You can see it in riscv_cpu_update_mask
>>>
>>>     if (env->xl == MXL_RV32) {
>>>         env->cur_pmmask = mask & UINT32_MAX;
>>>         env->cur_pmbase = base & UINT32_MAX;
>>>     } else {
>>>         env->cur_pmmask = mask;
>>>         env->cur_pmbase = base;
>>>     }
>>>
>> Yeah, I missed this part. Then we should ensure cur_pmmask/base is 
>> updated when xl changes.
>
> Is that even possible?  XL can change on priv level changes (SXL, UXL).

Yeah. Not possible, since only UXL is changable currently, and SXL/UXL 
can only be changed in higher priv level.

So the recompute for xl in write_mstatus() seems redundant.

Maybe there is a way to change current xl in future if misa.mxl is 
changable.

Regards,

Weiwei Li

>
>
> r~
--------------cuP4ds9M9w7kIF59MpllUzR8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/3/28 11:18, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:389e5dd1-12fc-8b71-8e6a-74db1179fa47@linaro.org">On
      3/27/23 19:48, liweiwei wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 2023/3/28 10:20, LIU Zhiwei wrote:
        <br>
        <blockquote type="cite">
          <br>
          On 2023/3/27 18:00, Weiwei Li wrote:
          <br>
          <blockquote type="cite">Since pointer mask works on effective
            address, and the xl works on the
            <br>
            generation of effective address, so xl related calculation
            should be done
            <br>
            before pointer mask.
            <br>
          </blockquote>
          <br>
          Incorrect. It has been done.
          <br>
          <br>
          When updating the pm_mask,  we have already considered the
          env-&gt;xl.
          <br>
          <br>
          You can see it in riscv_cpu_update_mask
          <br>
          <br>
              if (env-&gt;xl == MXL_RV32) {
          <br>
                  env-&gt;cur_pmmask = mask &amp; UINT32_MAX;
          <br>
                  env-&gt;cur_pmbase = base &amp; UINT32_MAX;
          <br>
              } else {
          <br>
                  env-&gt;cur_pmmask = mask;
          <br>
                  env-&gt;cur_pmbase = base;
          <br>
              }
          <br>
          <br>
        </blockquote>
        Yeah, I missed this part. Then we should ensure cur_pmmask/base
        is updated when xl changes.
        <br>
      </blockquote>
      <br>
      Is that even possible?  XL can change on priv level changes (SXL,
      UXL).
      <br>
    </blockquote>
    <p>Yeah. Not possible, since only UXL is changable currently, and
      SXL/UXL can only be changed in higher priv level.</p>
    <p>So the recompute for xl in <span style="color: #000000;">write_mstatus()
        seems redundant.</span></p>
    <p><span style="color: #000000;">Maybe there is a way to change
        current xl in future if misa.mxl is changable.</span></p>
    <p><span style="color: #000000;">Regards,</span></p>
    <p><span style="color: #000000;">Weiwei Li<br>
      </span></p>
    <blockquote type="cite"
      cite="mid:389e5dd1-12fc-8b71-8e6a-74db1179fa47@linaro.org">
      <br>
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------cuP4ds9M9w7kIF59MpllUzR8--


