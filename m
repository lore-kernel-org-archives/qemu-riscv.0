Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ph3i2-0006XS-9o
	for mharc-qemu-riscv@gnu.org; Tue, 28 Mar 2023 03:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1ph3i0-0006X8-An; Tue, 28 Mar 2023 03:25:32 -0400
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1ph3hx-00078p-NU; Tue, 28 Mar 2023 03:25:31 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R631e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Ves1J0s_1679988319; 
Received: from 30.221.98.176(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Ves1J0s_1679988319) by smtp.aliyun-inc.com;
 Tue, 28 Mar 2023 15:25:19 +0800
Content-Type: multipart/alternative;
 boundary="------------XXaN4xzUas9nW3l6NH5zc0A7"
Message-ID: <241a90ec-b183-78d2-f2ba-9317cbad01dc@linux.alibaba.com>
Date: Tue, 28 Mar 2023 15:25:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/5] target/riscv: Fix effective address for pointer mask
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-2-liweiwei@iscas.ac.cn>
 <c0abfb39-56a7-a184-f134-bcb075908f57@linux.alibaba.com>
 <c1b60f5e-5bb8-5462-ae93-7813da4269bb@iscas.ac.cn>
 <389e5dd1-12fc-8b71-8e6a-74db1179fa47@linaro.org>
 <04639827-2706-69d8-56d9-5e278742168d@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <04639827-2706-69d8-56d9-5e278742168d@iscas.ac.cn>
Received-SPF: pass client-ip=115.124.30.110;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-110.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Mar 2023 07:25:32 -0000

This is a multi-part message in MIME format.
--------------XXaN4xzUas9nW3l6NH5zc0A7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/3/28 11:33, liweiwei wrote:
>
>
> On 2023/3/28 11:18, Richard Henderson wrote:
>> On 3/27/23 19:48, liweiwei wrote:
>>>
>>> On 2023/3/28 10:20, LIU Zhiwei wrote:
>>>>
>>>> On 2023/3/27 18:00, Weiwei Li wrote:
>>>>> Since pointer mask works on effective address, and the xl works on 
>>>>> the
>>>>> generation of effective address, so xl related calculation should 
>>>>> be done
>>>>> before pointer mask.
>>>>
>>>> Incorrect. It has been done.
>>>>
>>>> When updating the pm_mask,  we have already considered the env->xl.
>>>>
>>>> You can see it in riscv_cpu_update_mask
>>>>
>>>>     if (env->xl == MXL_RV32) {
>>>>         env->cur_pmmask = mask & UINT32_MAX;
>>>>         env->cur_pmbase = base & UINT32_MAX;
>>>>     } else {
>>>>         env->cur_pmmask = mask;
>>>>         env->cur_pmbase = base;
>>>>     }
>>>>
>>> Yeah, I missed this part. Then we should ensure cur_pmmask/base is 
>>> updated when xl changes.
>>
>> Is that even possible?  XL can change on priv level changes (SXL, UXL).
>
> Yeah. Not possible, since only UXL is changable currently, and SXL/UXL 
> can only be changed in higher priv level.
>
> So the recompute for xl in write_mstatus() seems redundant.
>
I think you are almost right. But as we allow write XL field when in 
debug mode, we seemly also need call this function for it.

Zhiwei

> Maybe there is a way to change current xl in future if misa.mxl is 
> changable.
>
> Regards,
>
> Weiwei Li
>
>>
>>
>> r~
--------------XXaN4xzUas9nW3l6NH5zc0A7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/3/28 11:33, liweiwei wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:04639827-2706-69d8-56d9-5e278742168d@iscas.ac.cn">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2023/3/28 11:18, Richard Henderson
        wrote:<br>
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
              generation of effective address, so xl related calculation
              should be done <br>
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
      <p>Yeah. Not possible, since only UXL is changable currently, and
        SXL/UXL can only be changed in higher priv level.</p>
      <p>So the recompute for xl in <span style="color: #000000;">write_mstatus()
          seems redundant.</span></p>
    </blockquote>
    <p>I think you are almost right. But as we allow write XL field when
      in debug mode, we seemly also need call this function for it.</p>
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
  </body>
</html>

--------------XXaN4xzUas9nW3l6NH5zc0A7--

