Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osDub-00069D-Qi
	for mharc-qemu-riscv@gnu.org; Mon, 07 Nov 2022 21:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1osDuM-000662-Rw; Mon, 07 Nov 2022 21:00:11 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1osDuJ-0005Hq-JA; Mon, 07 Nov 2022 21:00:10 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R921e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VUGoIP6_1667872486; 
Received: from 30.221.97.117(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VUGoIP6_1667872486) by smtp.aliyun-inc.com;
 Tue, 08 Nov 2022 09:54:47 +0800
Content-Type: multipart/alternative;
 boundary="------------SP66Zx5wG9YOW8Nhqp0S9P8J"
Message-ID: <062197b1-7eb0-9cdd-663e-a0fae1389fae@linux.alibaba.com>
Date: Tue, 8 Nov 2022 09:54:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v1 1/4] target/riscv: Add itrigger support when icount is
 not enabled
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Alistair Francis <alistair23@gmail.com>, qemu-riscv@nongnu.org,
 Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 sergey.matyukevich@syntacore.com, vladimir.isaev@syntacore.com,
 anatoly.parshintsev@syntacore.com, philipp.tomsich@vrull.eu,
 zhiwei_liu@c-sky.com, qemu-devel@nongnu.org
References: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
 <20221013062946.7530-2-zhiwei_liu@linux.alibaba.com>
 <CAKmqyKNTyCvjjYOrgAttW36ygGBibTHjA_f1b5AAWp+pF-xAiA@mail.gmail.com>
 <ebdbec47-9dbe-e1a2-5033-9421710debb6@linux.alibaba.com>
 <87wn86g3i2.fsf@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <87wn86g3i2.fsf@linaro.org>
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
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
X-List-Received-Date: Tue, 08 Nov 2022 02:00:15 -0000

This is a multi-part message in MIME format.
--------------SP66Zx5wG9YOW8Nhqp0S9P8J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/11/7 23:58, Alex Bennée wrote:
> LIU Zhiwei<zhiwei_liu@linux.alibaba.com>  writes:
>
>> On 2022/11/7 9:37, Alistair Francis wrote:
>>> On Thu, Oct 13, 2022 at 4:32 PM LIU Zhiwei<zhiwei_liu@linux.alibaba.com>  wrote:
>>>> When icount is not enabled, there is no API in QEMU that can get the
>>>> guest instruction number.
>>>>
>>>> Translate the guest code in a way that each TB only has one instruction.
>>> I don't think this is a great idea.
>>>
>>> Why can't we just require icount be enabled if a user wants this? Or singlestep?
>> This feature will only be used by users who want to  run the native
>> gdb on Linux. If we run QEMU as a service,  after booting the kernel,
>> we can't predicate whether the users will use native gdb.
>>
>> Besides, icount can't be enabled on MTTCG currently (I am working on
>> this problem)
> I'm curious as to what your approach is going to be to solve this one?

Yes, I am interested in this problem.  But actually, I don't find a 
clear way.

For RR or MTTCG, timers using QEMU_CLOCK_VIRTUAL will set the total 
icount_budget.

  * For RR smp, every cpu has configured the total icount_budget.

  * For MTTCG smp, every cpu can't be configured the total
    icount_budget.  But we can split the icount_budget, such as divide
    by smp.cpus, to each core. If one core consumed its budget, it will
    wait for other cores.  Another way is to kick other cores and split
    the remaining icount_budget.

I am not sure if there are many other problems related.  It a difficult 
problem. Looking forward to your advice.

Thanks,
Zhiwei

>
--------------SP66Zx5wG9YOW8Nhqp0S9P8J
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/11/7 23:58, Alex Bennée wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87wn86g3i2.fsf@linaro.org">
      <pre class="moz-quote-pre" wrap="">
LIU Zhiwei <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@linux.alibaba.com">&lt;zhiwei_liu@linux.alibaba.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 2022/11/7 9:37, Alistair Francis wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Thu, Oct 13, 2022 at 4:32 PM LIU Zhiwei <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@linux.alibaba.com">&lt;zhiwei_liu@linux.alibaba.com&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">When icount is not enabled, there is no API in QEMU that can get the
guest instruction number.

Translate the guest code in a way that each TB only has one instruction.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I don't think this is a great idea.

Why can't we just require icount be enabled if a user wants this? Or singlestep?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This feature will only be used by users who want to  run the native
gdb on Linux. If we run QEMU as a service,  after booting the kernel,
we can't predicate whether the users will use native gdb.

Besides, icount can't be enabled on MTTCG currently (I am working on
this problem)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm curious as to what your approach is going to be to solve this one?</pre>
    </blockquote>
    <p>Yes, I am interested in this problem.  But actually, I don't find
      a clear way.<br>
    </p>
    <p>For RR or MTTCG, timers using QEMU_CLOCK_VIRTUAL will set the
      total icount_budget. </p>
    <ul>
      <li>For RR smp, every cpu has configured the total icount_budget.</li>
    </ul>
    <ul>
      <li>For MTTCG smp, every cpu can't be configured the total
        icount_budget.  But we can split the icount_budget, such as
        divide by smp.cpus, to each core. If one core consumed its
        budget, it will wait for other cores.  Another way is to kick
        other cores and split the remaining icount_budget.<br>
      </li>
    </ul>
    <p>I am not sure if there are many other problems related.  It a
      difficult problem. Looking forward to your advice.</p>
    <p>Thanks,<br>
      Zhiwei<br>
    </p>
    <blockquote type="cite" cite="mid:87wn86g3i2.fsf@linaro.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------SP66Zx5wG9YOW8Nhqp0S9P8J--

