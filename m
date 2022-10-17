Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1okS29-0000as-Kh
	for mharc-qemu-riscv@gnu.org; Mon, 17 Oct 2022 11:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1okS27-0000aV-VX; Mon, 17 Oct 2022 11:28:03 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:57004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1okS25-0006XZ-Br; Mon, 17 Oct 2022 11:28:03 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VSQZLMK_1666020469; 
Received: from 192.168.3.95(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VSQZLMK_1666020469) by smtp.aliyun-inc.com;
 Mon, 17 Oct 2022 23:27:49 +0800
Message-ID: <4841b154-bd05-c677-cfb4-46a350ddd0aa@linux.alibaba.com>
Date: Mon, 17 Oct 2022 23:27:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Question about TCG backend correctness
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
References: <4672400c-0084-3bf3-a596-7a42115301f0@linux.alibaba.com>
 <87lepeeno0.fsf@linaro.org>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <87lepeeno0.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.56;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-56.freemail.mail.aliyun.com
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
X-List-Received-Date: Mon, 17 Oct 2022 15:28:04 -0000


On 2022/10/17 18:30, Alex Bennée wrote:
> LIU Zhiwei <zhiwei_liu@linux.alibaba.com> writes:
>
>> Hi folks,
>>
>>      For TCG front end, we can test it with tools, such as RISU. But I
>> don't know if  there are some tools that can help
>> to verify the correctness of a TCG backend.
>>
>>      Can someone share the tools or the experience to debug RISC-V
>> backend?  Thanks very much.
> It's mostly down to inspection or debugging failures.
Agree.
>   Sometimes you can
> attempt to shake out bugs by running a stacked QEMU. e.g.
>
>     qemu-system-aarch64 on x86 host
>     qemu-system-aarch64 on qemu-system-riscv64 on x86 host
>
> and see if the two aarch64 guests run the same.
We currently depend on the guest behaviors to test the correctness of 
TCG backend. And if the guest doesn't
behave correctly, it is hard to find the exact bug in backend.

Maybe I can run RISU on qemu-aarch64(x86) and qemu-aarch64(risc-v) to 
check the RISC-V backend.

>   This of course gets very
> tricky running full OS kernels because as soon as time and async
> interrupts get involved you will get divergence anyway. This would work
> best with simple straight line test cases (e.g. check-tcg test cases).
>
> I've long wanted to have the ability to have TCG unit tests where a
> virtual processor could be defined for the purpose of directly
> exercising TCG.

We already have many ISAs as the front end of TCG. Will the virtual 
processor here be some
different?

> This would be mainly to check tcg_optimize() works
> correctly but no doubt could be extended to verify the eventual backend
> output. The problem with implementing such an approach has been the
> amount of boilerplate needed to define a simple frontend.
Sorry, I don't get it.
>   Maybe this
> will get simpler as we slowly move to a single binary build but there is
> still quite of lot of things TCG needs to know about the guest it is
> emulating.
>
> If you would like to attempt improve the testing situation for TCG and its
> backend I'm fully supportive.

If I can find a  good way, I really like to do some further work.

Thanks，
Zhiwei

>

