Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jglJM-0005Qi-9v
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jun 2020 04:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuzwnan@163.com>) id 1jgiKo-0004pu-0n
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 01:22:34 -0400
Received: from m12-13.163.com ([220.181.12.13]:55889)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liuzwnan@163.com>) id 1jgiKi-0000mx-Dw
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 01:22:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=nMXsy
 vEshJYaPBapwaGqWHI8SwfNUKFshYzc1RCMaq8=; b=e2MWPNiJiqYQPZ38IIOAV
 JYBhFUqOHXqL1V9+PBMZGz49xSjoZJJwZyCN6qK5Ff/EltOGmiHJX0Ws6KPIYy+j
 6DCTgMSGrAOURzVEC43c1SlIW2Xbe9q9zwC8q573+pHQFIR9diXkC1RABvgWFaZ5
 qYwFoEO5vKl2TIkrcdeW9s=
Received: from [30.225.208.46] (unknown [42.120.72.77])
 by smtp9 (Coremail) with SMTP id DcCowAAnL2MygdhePzh6EQ--.10014S2;
 Thu, 04 Jun 2020 13:05:56 +0800 (CST)
Subject: Re: [PATCH v5 07/11] hw/char: Initial commit of Ibex UART
To: Alistair Francis <alistair23@gmail.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng
 <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <cover.1590704015.git.alistair.francis@wdc.com>
 <73cce2d0edd0d41ba15df403a2096bfa70bf0565.1590704015.git.alistair.francis@wdc.com>
 <cc1a1671-b926-bb31-1ed2-d2920f0faf38@c-sky.com>
 <c9f16143-4e9b-a3a8-ffd3-12d43fd2e343@c-sky.com>
 <CAKmqyKM6rigjbDoFh0bfq8gJXJ=+H+onh=DXjCzhAijMCvR16Q@mail.gmail.com>
 <ec0a7545-1793-d1a9-fccf-068496cf1f0a@c-sky.com>
 <CAKmqyKOvv2HCpXoD+8E5q2S7JqSDfT7_z3+_=cKFLi+H92itjw@mail.gmail.com>
 <aa240d2d-42bb-b9dd-90f0-1a3051c2491f@c-sky.com>
 <CAKmqyKN3QBadrqzohWe0uwiCPcjU9WFHF_4j0dsKehszsZ4AWg@mail.gmail.com>
From: LIU Zhiwei <liuzwnan@163.com>
Message-ID: <a56ffc6e-037b-5120-f22c-f18d98e8a382@163.com>
Date: Thu, 4 Jun 2020 13:05:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKN3QBadrqzohWe0uwiCPcjU9WFHF_4j0dsKehszsZ4AWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: DcCowAAnL2MygdhePzh6EQ--.10014S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF17Cw45XF1rtF15GF1UGFg_yoWrAw1xpa
 yFgFWUtr4DJryFkwnFyr1UXr4jyFW3Jr45Xr95GrWak3s0gr1S9FWxKrWYka9rAr1Sgw1j
 v3WjvF9rZ3Z0vFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jPb18UUUUU=
X-Originating-IP: [42.120.72.77]
X-CM-SenderInfo: xolx64xqdqqiywtou0bp/1tbiNxs5ElWBg6wx9gABs6
Received-SPF: pass client-ip=220.181.12.13; envelope-from=liuzwnan@163.com;
 helo=m12-13.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:06:24
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Jun 2020 04:33:13 -0400
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
X-List-Received-Date: Thu, 04 Jun 2020 05:22:34 -0000



On 2020/6/4 12:35, Alistair Francis wrote:
> On Wed, Jun 3, 2020 at 6:59 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>
>>
>> On 2020/6/3 23:56, Alistair Francis wrote:
>>> On Wed, Jun 3, 2020 at 3:33 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>>> On 2020/6/3 1:54, Alistair Francis wrote:
>>>>> On Tue, Jun 2, 2020 at 5:28 AM LIU Zhiwei<zhiwei_liu@c-sky.com>  wrote:
>>>>>> Hi Alistair,
>>>>>>
>>>>>> There are still some questions I don't understand.
>>>>>>
>>>>>> 1. Is the baud rate  or fifo a necessary feature to simulate?
>>>>>> As you can see, qemu_chr_fe_write will send the byte as soon as possible.
>>>>>> When you want to transmit a byte through WDATA,  you can call
>>>>>> qemu_chr_fe_write directly.
>>>>> So qemu_chr_fe_write() will send the data straight away. This doesn't
>>>>> match what teh hardware does though. So by modelling a FIFO and a
>>>>> delay in sending we can better match the hardware.
>>>> I see many UARTs have similar features. Does the software really care about
>>>> these features? Usually I just want to print something to the terminal
>>>> through UART.
>>> In this case Tock (which is the OS used for OpenTitan) does car about
>>> these features as it relies on interrupts generated by the HW to
>>> complete the serial send task. It also just makes the QEMU model more
>>> accurate.
>> Fair enough. I see the "tx_watermark" interrupt, which needs the FIFO.
>> At least,
>> it can verify the ISP.
> Exactly :)
>
>>>> Most simulation in QEMU is for running software, not exactly the details
>>>> of hardware.
>>>> For example, we will not simulate the 16x oversamples in this UART.
>>> Agreed. Lots of UARTs don't bother modelling the delay from the
>>> hardware as generally it doesn't matter. In this case it does make a
>>> difference for the software and it makes the QEMU model more accurate,
>>> which is always a good thing.
>>>
>>>> There is no error here. Personally I  think it is necessary to simulate
>>>> the FIFO and baud rate,
>>>> maybe for supporting some backends.
>>> So baud rate doesn't need to be modelled as we aren't actually sending
>>> UART data, just pretending and then printing it.
>>>
>>>> Can someone give a reasonable answer for this question?
>>> Which question?
>> I see  the UART can work with many  different backends,  such as pty ,
>> file, socket and so on.
>> I wonder if this a backend, which has some requirements on the baud
> The backend should be independent so it doesn't matter what baud rate
> we choose here.
>
>> rate.  You can ignore it,
>> as it doesn't matter.
>>>>>> 2.  The baud rate calculation method is not strictly right.
>>>>>> I think when a byte write to FIFO,  char_tx_time * 8 is the correct time
>>>>>> to send the byte instead of
>>>>>> char_tx_time * 4.
>>>>> Do you mind explaining why 8 is correct instead of 4?
>>>> Usually write a byte to WDATA will trigger a uart_write_tx_fifo.
>>>> Translate a bit will take
>>>> char_tx_time. So it will take char_tx_time * 8 to transmit a byte.
>>> I see your point. I just used the 4 as that is what the Cadence one
>>> does. I don't think it matters too much as it's just the delay for a
>>> timer (that isn't used as an accurate timer).
>> Got it. Just a way to send the bytes at sometime later.
>>>>>> 3.  Why add a watch here?
>>>>> This is based on the Cadence UART implementation in QEMU (which does
>>>>> the same thing). This will trigger a callback when we can write more
>>>>> data or when the backend has hung up.
>>>> Many other serials do the same thing, like virtio-console and serial. So
>>>> it may be a common
>>>> interface here. I will try to understand it(Not yet).
>>> Yep, it's just a more complete model of that the HW does.
>> I try to boot a RISC-V Linux, and set a breakpoint  to a watch callback
>> function.
>> The breakpoint did't match.
>>
>> I just wonder if there is a case really need the callback function.
> AFAIK Linux doesn't support the Ibex UART (or Ibex at all) so it
> shouldn't be triggered.
I tried with the UART in the virt board.  It also registers the watch 
callback on
G_IO_HUP and G_IO_OUT.

However I will through the question alone in another mail.

After the two points addressed,

Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>

Zhiwei
>
> Alistair
>
>> Zhiwei
>>> Alistair



