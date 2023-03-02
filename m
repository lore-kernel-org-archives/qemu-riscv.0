Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXYvS-0007cs-Gx
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 21:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXYvR-0007Zg-9K; Wed, 01 Mar 2023 21:44:09 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXYvO-0008N4-Lk; Wed, 01 Mar 2023 21:44:08 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R241e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VcvBco-_1677725019; 
Received: from 30.221.97.107(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VcvBco-_1677725019) by smtp.aliyun-inc.com;
 Thu, 02 Mar 2023 10:43:40 +0800
Message-ID: <8f026ece-1535-8b8f-aeff-ab4a90469fd7@linux.alibaba.com>
Date: Thu, 2 Mar 2023 10:43:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 05/18] target/riscv: gdbstub: Do not generate CSR XML
 if Zicsr is disabled
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: bmeng@tinylab.org, qemu-devel@nongnu.org, liweiwei@iscas.ac.cn,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <CAEUhbmWtg8+V44h7xgtggcORLww7kCv60DX+r3XYFTOrgzMtmA@mail.gmail.com>
 <mhng-4de827d1-bce4-4e30-b5d3-cd9e61e4b4db@palmer-ri-x1c9a>
 <CAEUhbmVGe3mtG+NXkLJ9yKcQEXUB8dsZiFDW=d1kmRzWR-Mrdg@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <CAEUhbmVGe3mtG+NXkLJ9yKcQEXUB8dsZiFDW=d1kmRzWR-Mrdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 02 Mar 2023 02:44:09 -0000


On 2023/3/2 8:30, Bin Meng wrote:
> On Thu, Mar 2, 2023 at 7:43 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> On Wed, 01 Mar 2023 01:55:34 PST (-0800), Bin Meng wrote:
>>> On Wed, Mar 1, 2023 at 5:52 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>>>>
>>>> On 2023/2/28 18:40, Bin Meng wrote:
>>>>> There is no need to generate the CSR XML if the Zicsr extension
>>>>> is not enabled.
>>>> Should we generate the FPU XML or Vector XML when Zicsr is not enabled?
>>> Good point. I think we should disable that too.
>> Seems reasonable.  Did you want to do that as part of a v3, or just as a
>> follow-on fix?
>>
> I looked at this further.
>
> The FPU / Vector XML is guarded by the " env->misa_ext" check. If
> Zicsr is disabled while F or V extension is off, QEMU will error out
> in riscv_cpu_realize() earlier before the gdbstub init.

Make sense.

Zhiwei

>
> So current patch should be fine.
>
> Regards,
> Bin

