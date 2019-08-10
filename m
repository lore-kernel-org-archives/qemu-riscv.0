Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwRqS-0005Ti-26
	for mharc-qemu-riscv@gnu.org; Sat, 10 Aug 2019 09:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34811)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1hwRqQ-0005QH-6h
 for qemu-riscv@nongnu.org; Sat, 10 Aug 2019 09:55:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1hwRqP-0002wV-2j
 for qemu-riscv@nongnu.org; Sat, 10 Aug 2019 09:55:42 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:46944)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1hwRqJ-0002go-9w; Sat, 10 Aug 2019 09:55:35 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06809141|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.21291-0.0138966-0.773193; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03312; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.F9j9.MS_1565445321; 
Received: from 192.168.79.129(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.F9j9.MS_1565445321)
 by smtp.aliyun-inc.com(10.147.43.230);
 Sat, 10 Aug 2019 21:55:23 +0800
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, bastian@mail.uni-paderborn.de
References: <97a6ae9f-2845-4a3c-2a31-367787622268@c-sky.com>
 <CAKmqyKMqCKS_-rxZ2WYEn+m2gDom27rd2f2FCe0LmVs9brPcAQ@mail.gmail.com>
From: LIU ZhiWei <zhiwei_liu@c-sky.com>
Message-ID: <c502163b-ed8a-89d1-6437-9b0f49e88a84@c-sky.com>
Date: Sat, 10 Aug 2019 06:55:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMqCKS_-rxZ2WYEn+m2gDom27rd2f2FCe0LmVs9brPcAQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------0D1310E34583DB98C0DB2255"
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 121.197.200.217
Subject: Re: [Qemu-riscv] [Qemu-devel] RISC-V: Vector && DSP Extension
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
X-List-Received-Date: Sat, 10 Aug 2019 13:55:43 -0000

This is a multi-part message in MIME format.
--------------0D1310E34583DB98C0DB2255
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/9/19 6:54 PM, Alistair Francis wrote:
> On Thu, Aug 8, 2019 at 2:52 AM liuzhiwei <zhiwei_liu@c-sky.com> wrote:
>> Hi all,
>>
>>      My workmate  and I have been working on Vector & Dsp extension, and
>> I'd like to share develop status  with folks.
> Cool!
>
>>      The spec references for  Vector extension is riscv-v-spec-0.7.1, and
>> riscv-p-spec-0.5 for DSP extension. The code of vector extension is
>> ready and under testing,  the first patch will be sent about two weeks
>> later. After that we will forward working on DSP extension, and send the
>> first patch in middle  October.
> What code are you talking about? Is this QEMU code?

Hi Alistair,

It's the QEMU code I have been working on these days, which implements Vector extension. It is under testing,
and will be sent later.

>>       Could the maintainers  tell me whether the specs referenced are
>> appropriate? Is anyone working on these extensions?  I'd like to get
>> your status, and maybe discuss questions and work togather.
> Just use the latest (master) from the ISA spec git repo.

I will follow your advice.Thanks for your attention to this matter.

Best Regards,

Zhiwei

>
> I don't know anyone doing vector work for QEMU. It would be very
> useful, but everyone is busy with something at the moment
> unfortunately.
>
> Alistair
>
>> Best Regards
>>
>> LIU Zhiwei
>>
>>
>>

--------------0D1310E34583DB98C0DB2255
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/9/19 6:54 PM, Alistair Francis
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAKmqyKMqCKS_-rxZ2WYEn+m2gDom27rd2f2FCe0LmVs9brPcAQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Aug 8, 2019 at 2:52 AM liuzhiwei <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@c-sky.com">&lt;zhiwei_liu@c-sky.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Hi all,

    My workmate  and I have been working on Vector &amp; Dsp extension, and
I'd like to share develop status  with folks.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Cool!

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
    The spec references for  Vector extension is riscv-v-spec-0.7.1, and
riscv-p-spec-0.5 for DSP extension. The code of vector extension is
ready and under testing,  the first patch will be sent about two weeks
later. After that we will forward working on DSP extension, and send the
first patch in middle  October.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What code are you talking about? Is this QEMU code?
</pre>
    </blockquote>
    <pre>Hi Alistair,

It's the QEMU code I have been working on these days, which implements Vector extension. It is under testing,
and will be sent later.
</pre>
    <blockquote type="cite"
cite="mid:CAKmqyKMqCKS_-rxZ2WYEn+m2gDom27rd2f2FCe0LmVs9brPcAQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
     Could the maintainers  tell me whether the specs referenced are
appropriate? Is anyone working on these extensions?  I'd like to get
your status, and maybe discuss questions and work togather.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Just use the latest (master) from the ISA spec git repo.</pre>
    </blockquote>
    <pre>I will follow your advice.Thanks for your attention to this matter.

Best Regards,

Zhiwei</pre>
    <blockquote type="cite"
cite="mid:CAKmqyKMqCKS_-rxZ2WYEn+m2gDom27rd2f2FCe0LmVs9brPcAQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

I don't know anyone doing vector work for QEMU. It would be very
useful, but everyone is busy with something at the moment
unfortunately.

Alistair

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Best Regards

LIU Zhiwei



</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0D1310E34583DB98C0DB2255--

