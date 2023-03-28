Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgzwg-0004fl-F8
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 23:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgzwa-0004dE-60; Mon, 27 Mar 2023 23:24:20 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgzwX-0003Cr-L4; Mon, 27 Mar 2023 23:24:19 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R381e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VerHBDz_1679973847; 
Received: from 30.221.98.176(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VerHBDz_1679973847) by smtp.aliyun-inc.com;
 Tue, 28 Mar 2023 11:24:08 +0800
Message-ID: <b820a826-ba6d-4abc-ca12-22e19bc6a312@linux.alibaba.com>
Date: Tue, 28 Mar 2023 11:24:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/5] target/riscv: Fix effective address for pointer mask
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 liweiwei <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-2-liweiwei@iscas.ac.cn>
 <c0abfb39-56a7-a184-f134-bcb075908f57@linux.alibaba.com>
 <c1b60f5e-5bb8-5462-ae93-7813da4269bb@iscas.ac.cn>
 <389e5dd1-12fc-8b71-8e6a-74db1179fa47@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <389e5dd1-12fc-8b71-8e6a-74db1179fa47@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 28 Mar 2023 03:24:24 -0000


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

I think I have considered this.

https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg04366.html

Zhiwei

>
>
> r~

