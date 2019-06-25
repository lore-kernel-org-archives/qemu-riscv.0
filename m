Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfjba-0005ay-Bm
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jun 2019 07:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53009)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hfjbX-0005a7-Od
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 07:27:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hfjbW-0001pt-Hr
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 07:27:15 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46375)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hfjbW-0001oT-BP
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 07:27:14 -0400
Received: by mail-wr1-f66.google.com with SMTP id n4so17382806wrw.13
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2019 04:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=huWTvh49i5FGsRTTKDZBDsk6B0l64V5qCSg46Ze010w=;
 b=UhvLzzC19w5UWI8WZQQLDAZpx8lxY/v5jFQn/yaZSd8cVJCyue3uA9p5ZTQ8Iyr3Y2
 10IjIODA+rZi9RDb6CPK2vJPxMuLDdthYHy6wRxoiaftRvRvlF+b+GN+6KnZVWhv+WKM
 AxHgtReXwM+NNewNShyq836Fg5PmMX3csJThNiI9BoyALp7T6w0ifT3A4xQeGl7wHme4
 9065/bA8Kpuz5UtOlwkzjGiebWqNagKqT1xZG0y/ot3b83X7IC4y5L0HAhrDVWdIYS2Y
 VAv8JeKLoB6SDkz99ZBLIkkDrLrL8ANDIt5gnEb8/qHchRCdZmcIr6RUwlV+E9ii3QVu
 yMtg==
X-Gm-Message-State: APjAAAWhok24hNpwkMjbaURjrUeHFYrfao/l9+XrwNwz4+xeKgSrHkA1
 GqWCJGjntLd9gQuAb9GZfDbNOw==
X-Google-Smtp-Source: APXvYqwtOfrgpWufmSanayc6gEzPAP9TWhOh8fQJjJJwpDWeq/TNbVFDpGvrhte8V4S1CKOheW4GYQ==
X-Received: by 2002:a5d:4841:: with SMTP id n1mr1176614wrs.320.1561462032941; 
 Tue, 25 Jun 2019 04:27:12 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id o126sm3525184wmo.1.2019.06.25.04.27.11
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 04:27:12 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Alistair Francis <alistair23@gmail.com>, Atish Patra
 <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20190624225446.22597-1-atish.patra@wdc.com>
 <CAKmqyKO28WO3QzQOOzJnFOA5J2Wjeg-MF5+BcoWWF+qO=+UTNA@mail.gmail.com>
 <09df5e02-e241-1046-5051-909c53fe19b7@redhat.com>
 <20190625104122.GC3139@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e91591ed-3a69-ff99-3953-c55beb3d88d3@redhat.com>
Date: Tue, 25 Jun 2019 13:27:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190625104122.GC3139@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: virt: Add cpu-topology
 DT node.
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
X-List-Received-Date: Tue, 25 Jun 2019 11:27:17 -0000

On 6/25/19 12:41 PM, Daniel P. Berrangé wrote:
> On Tue, Jun 25, 2019 at 12:36:35PM +0200, Philippe Mathieu-Daudé wrote:
>> On 6/25/19 1:24 AM, Alistair Francis wrote:
>>> On Mon, Jun 24, 2019 at 3:57 PM Atish Patra <atish.patra@wdc.com> wrote:
>>>>
>>>> Currently, there is no cpu topology defined in RISC-V.
>>>> Define a device tree node that clearly describes the
>>>> entire topology. This saves the trouble of scanning individual
>>>> cache to figure out the topology.
>>>>
>>>> Here is the linux kernel patch series that enables topology
>>>> for RISC-V.
>>>>
>>>> http://lists.infradead.org/pipermail/linux-riscv/2019-June/005072.html
>>>>
>>>> CPU topology after applying this patch in QEMU & above series in kernel
>>>>
>>>> / # cat /sys/devices/system/cpu/cpu2/topology/thread_siblings_list
>>>> 2
>>>> / # cat /sys/devices/system/cpu/cpu2/topology/physical_package_id
>>>> 0
>>>> / # cat /sys/devices/system/cpu/cpu2/topology/core_siblings_list
>>>> 0-7
>>>>
>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>> ---
>>>>  hw/riscv/virt.c | 21 +++++++++++++++++++--
>>>>  1 file changed, 19 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>>> index 84d94d0c42d8..da0b8aa18747 100644
>>>> --- a/hw/riscv/virt.c
>>>> +++ b/hw/riscv/virt.c
>>>> @@ -203,9 +203,12 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>>>>          qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
>>>>          qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
>>>>          qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
>>>> +        qemu_fdt_setprop_cell(fdt, nodename, "phandle", cpu_phandle);
>>>> +        qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", cpu_phandle);
>>>> +        int intc_phandle = phandle++;
>>>
>>> Don't declare variables in the middle of code. The variable must be
>>> declared at the start of a block.
>>
>> I guess this has been relaxed since we allow GNU C99:
> 
> Even though we allow GNU C99 I think it is undesirable to declare variables
> in the middle of methods. This is especially true when combined with "goto"
> as you end up with undefined / uninitialized vairable contents at the jump
> target, if we've jumped over the variable declaration.
> 
> We can't enforce location of variable declarations, but I'd really
> recommend we keep them all at the start of code blocks.

In this case I find it desirable:

  for (int i = 0; ...) {
    ...
  }

For the rest, I agree to keep them at the start of code block.

Regards,

Phil.

