Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i3JtY-0002Kq-Vh
	for mharc-qemu-riscv@gnu.org; Thu, 29 Aug 2019 08:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46162)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1i3JtV-0002Gz-PF
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2019 08:51:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1i3JtU-0004wn-OS
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2019 08:51:17 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:54941)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1i3JtR-0004hU-Qw; Thu, 29 Aug 2019 08:51:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08202056|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.367247-0.0192661-0.613486; FP=0|0|0|0|0|-1|-1|-1;
 HT=e01a16367; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=12; RT=12; SR=0;
 TI=SMTPD_---.FL.ZmEX_1567083061; 
Received: from 172.16.28.187(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.FL.ZmEX_1567083061)
 by smtp.aliyun-inc.com(10.147.43.95); Thu, 29 Aug 2019 20:51:04 +0800
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: peter.maydell@linaro.org, palmer@sifive.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, riku.voipio@iki.fi, laurent@vivier.eu,
 Alistair.Francis@wdc.com, alex.bennee@linaro.org, aurelien@aurel32.net
References: <1566959818-38369-1-git-send-email-zhiwei_liu@c-sky.com>
 <ba8c7451-b0a7-0405-f881-0c6d0d8574fb@linaro.org>
 <3b85e9b6-8799-9682-9aaf-b688924cb52e@linaro.org>
From: liuzhiwei <zhiwei_liu@c-sky.com>
Message-ID: <841ebe5f-dd5e-c59d-d7e9-c246ad7741c0@c-sky.com>
Date: Thu, 29 Aug 2019 20:45:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <3b85e9b6-8799-9682-9aaf-b688924cb52e@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 121.197.200.217
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISCV: support riscv vector
 extension 0.7.1
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2019 12:51:19 -0000


On 2019/8/29 上午4:43, Richard Henderson wrote:
> On 8/28/19 11:54 AM, Richard Henderson wrote:
>> But it might be reasonable to include (VSTART == 0 && VL == VLMAX) as a
>> single bit.
> BTW, it is reasonable to check VSTART == 0 always.  Quoting the spec:
>
> # Implementations are permitted to raise illegal instruction exceptions
> # when attempting to execute a vector instruction with a value of vstart
> # that the implementation can never produce when executing that same
> # instruction with the same vtype setting.
>
> Since qemu will never interrupt a single instruction, each vector instruction
> will always run to completion, which clears VSTART.  Since QEMU will never
> produce a non-zero value of VSTART, it is allowed to trap on any non-zero
> setting of VSTART.
>
> I.e. it can be handled at translation time alongside VILL.

Hi, Richard

I am so sorry for the inconvenience. It is very kind of you to review 
the horrible long code and give so many comments.

Even in qemu,  it may be some situations that VSTART != 0. For example, 
a load instruction leads to a page fault exception in a middle position. 
If VSTART == 0,  some elements that had been loaded before the exception 
will be loaded once again.

Specially,  it may be a mistake if  the instruction restores execution 
with VSTART==  0.  When lmul == 1,

    "vlb v0 ,(a0), v0.t"

As v0 is the mask register,  if it is modified,  some part of it can't 
be used again.

It will take some time to address the other comments. After that I will 
split the patch into patch set with a cover letter in V2.

Thank you again for your review!

Best Regards,

Zhiwei

>
>
> r~
>

