Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgyD6-000483-OY
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 21:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgyD5-00047h-CP; Mon, 27 Mar 2023 21:33:15 -0400
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgyD2-0007UM-Dm; Mon, 27 Mar 2023 21:33:14 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VeqwvwI_1679967182; 
Received: from 30.221.98.176(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeqwvwI_1679967182) by smtp.aliyun-inc.com;
 Tue, 28 Mar 2023 09:33:02 +0800
Message-ID: <075a0bde-0d28-75e1-097f-f5218403b23d@linux.alibaba.com>
Date: Tue, 28 Mar 2023 09:33:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 13/25] target/riscv: Introduce mmuidx_priv
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 fei2.wu@intel.com
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-14-richard.henderson@linaro.org>
 <a4e87eab-aace-a17b-fef5-5c5b1118a561@linux.alibaba.com>
 <6b21f385-96fd-78f4-bdba-ed552bf2464a@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <6b21f385-96fd-78f4-bdba-ed552bf2464a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Tue, 28 Mar 2023 01:33:15 -0000


On 2023/3/28 0:29, Richard Henderson wrote:
> On 3/26/23 19:07, LIU Zhiwei wrote:
>>> +static inline int mmuidx_priv(int mmu_idx)
>>> +{
>>> +    int ret = mmu_idx & 3;
>>> +    if (ret == MMUIdx_S_SUM) {
>>> +        ret = PRV_S;
>>> +    }
>>> +    return ret;
>>> +}
>>> +
>>
>> Can we remove the PRIV from the tb flags after we have this function?
>
> No, because this is the priv of the memory operation as modified by 
> e.g. MPRV, not the true cpu priv.

For this implementation, we explicitly use the tb flags for mmu index. I 
think it is the reason why we have to maintain the redundant privilege 
in tb flags.
It may be better to only store machine states into tb flags. Can we just 
pass everything that we need, for example, the priv and sum, and then 
implicitly
calculate the ctx->mem_idx in disas_init_fn?

I remember that you give the similar suggestion in the comment process

https://mail.gnu.org/archive/html/qemu-riscv/2023-03/msg00566.html

Best Regards,
Zhiwei

>
>
> r~

