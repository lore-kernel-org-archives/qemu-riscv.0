Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfioc-0005lE-Bl
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jun 2019 06:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39712)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hfioZ-0005hO-Dz
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:36:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hfioY-0002JC-1p
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:36:39 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42152)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hfioX-0002IC-QM
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:36:37 -0400
Received: by mail-wr1-f68.google.com with SMTP id x17so17235928wrl.9
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2019 03:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IQ7+V3DniYBOoFMX0jkddc3P0TO6h99nO32oIxeVGC4=;
 b=LNyHzOkVj2x++I+mC37Bg8KSZhfWelWNYgHDTV+PtUFDKkpQiouFOS3armO9q6a1xt
 sFb9X1kjSALWgtet7asJwYH+TSV1OGuIYWdXUK+YM7OGWLLXmVrscvkuJOvOMiEWdKSK
 ChGFf/bHJCkMp31U2Y1p1O3xU6DSq+S/WrWe8ki76z6HOHbvR3fZ32eOrTO2giHtqAEg
 bk9z6KFuF0V8V4+vmijhmTGnkqc/AOeDKNge5UrvSIth3cVEzlhu05bXyA/t9gfOzpEY
 m8bufXWJXWD8mpEW5pV9mAh3ujOrvOWSHaD+Kqs7NtUrTuGtMsTZVyp+XJ7XLzwIC6pG
 nYyg==
X-Gm-Message-State: APjAAAVBqsR6ZCLv/sKKAHwgCO+Uw9yksZ19O8AUdHZczTlQnqi+T07o
 Yb7w1I4M/1XZmiC9iFbC+TKpJw==
X-Google-Smtp-Source: APXvYqwmwdY9LMh4o3H5Co2dOIuOU6Ws2GVjNNbtjc8X146uuzD9s3FnykUSL7wvdi9htQyl1KM1PA==
X-Received: by 2002:adf:f812:: with SMTP id s18mr51140133wrp.32.1561458996792; 
 Tue, 25 Jun 2019 03:36:36 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id j7sm19028579wru.54.2019.06.25.03.36.35
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 03:36:36 -0700 (PDT)
To: Alistair Francis <alistair23@gmail.com>, Atish Patra <atish.patra@wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <20190624225446.22597-1-atish.patra@wdc.com>
 <CAKmqyKO28WO3QzQOOzJnFOA5J2Wjeg-MF5+BcoWWF+qO=+UTNA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <09df5e02-e241-1046-5051-909c53fe19b7@redhat.com>
Date: Tue, 25 Jun 2019 12:36:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKO28WO3QzQOOzJnFOA5J2Wjeg-MF5+BcoWWF+qO=+UTNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
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
X-List-Received-Date: Tue, 25 Jun 2019 10:36:40 -0000

On 6/25/19 1:24 AM, Alistair Francis wrote:
> On Mon, Jun 24, 2019 at 3:57 PM Atish Patra <atish.patra@wdc.com> wrote:
>>
>> Currently, there is no cpu topology defined in RISC-V.
>> Define a device tree node that clearly describes the
>> entire topology. This saves the trouble of scanning individual
>> cache to figure out the topology.
>>
>> Here is the linux kernel patch series that enables topology
>> for RISC-V.
>>
>> http://lists.infradead.org/pipermail/linux-riscv/2019-June/005072.html
>>
>> CPU topology after applying this patch in QEMU & above series in kernel
>>
>> / # cat /sys/devices/system/cpu/cpu2/topology/thread_siblings_list
>> 2
>> / # cat /sys/devices/system/cpu/cpu2/topology/physical_package_id
>> 0
>> / # cat /sys/devices/system/cpu/cpu2/topology/core_siblings_list
>> 0-7
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>  hw/riscv/virt.c | 21 +++++++++++++++++++--
>>  1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index 84d94d0c42d8..da0b8aa18747 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -203,9 +203,12 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>>          qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
>>          qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
>>          qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
>> +        qemu_fdt_setprop_cell(fdt, nodename, "phandle", cpu_phandle);
>> +        qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", cpu_phandle);
>> +        int intc_phandle = phandle++;
> 
> Don't declare variables in the middle of code. The variable must be
> declared at the start of a block.

I guess this has been relaxed since we allow GNU C99:

https://git.qemu.org/?p=qemu.git;a=commit;h=7be41675f7cb16be7c8d2554add7a63fa43781a8

> 
> With that fixed:
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Alistair
> 
>>          qemu_fdt_add_subnode(fdt, intc);
>> -        qemu_fdt_setprop_cell(fdt, intc, "phandle", cpu_phandle);
>> -        qemu_fdt_setprop_cell(fdt, intc, "linux,phandle", cpu_phandle);
>> +        qemu_fdt_setprop_cell(fdt, intc, "phandle", intc_phandle);
>> +        qemu_fdt_setprop_cell(fdt, intc, "linux,phandle", intc_phandle);
>>          qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
>>          qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
>>          qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
>> @@ -214,6 +217,20 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>>          g_free(nodename);
>>      }
>>
>> +    /* Add cpu-topology node */
>> +    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
>> +    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map/cluster0");
>> +    for (cpu = s->soc.num_harts - 1; cpu >= 0; cpu--) {
>> +        char *core_nodename = g_strdup_printf("/cpus/cpu-map/cluster0/core%d",
>> +                                              cpu);
>> +        char *cpu_nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
>> +        uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, cpu_nodename);
>> +        qemu_fdt_add_subnode(fdt, core_nodename);
>> +        qemu_fdt_setprop_cell(fdt, core_nodename, "cpu", intc_phandle);
>> +        g_free(core_nodename);
>> +        g_free(cpu_nodename);
>> +    }
>> +
>>      cells =  g_new0(uint32_t, s->soc.num_harts * 4);
>>      for (cpu = 0; cpu < s->soc.num_harts; cpu++) {
>>          nodename =
>> --
>> 2.21.0
>>
>>
> 

