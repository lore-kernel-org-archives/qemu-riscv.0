Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5ocC-00036x-5h
	for mharc-qemu-riscv@gnu.org; Mon, 18 Mar 2019 05:31:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h5oc9-00033p-9l
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 05:31:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h5oc8-0000YN-A9
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 05:31:25 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:35729)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h5oc7-0000W6-He
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 05:31:24 -0400
Received: by mail-pg1-x543.google.com with SMTP id g8so314738pgf.2
	for <qemu-riscv@nongnu.org>; Mon, 18 Mar 2019 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=Z3a26uqi+4Q58CbpgzzVnIV3GFphPR4+x0F/quJ2rhk=;
	b=FNYsRUNyuA6ibCG0E71Vg8T611FAb9aWDweDwVqcnAl5EFov7iXdy2jRg6X48cv6yV
	2UlUdjmCdKORpDLjcdZY1PABDLTuNcSGGU9fy7qOpz7pQfBVZrTdUTFpiSGD1Yinun1o
	Ia18vCpJMBd0PixQI4ireQATNkF7nJm4/Gw71yhzEaFlCS5QeCkGkf3G9KWi3l56syfC
	D1tCAYPdGXLbj+7fAkiQk6knJ2n34HRYJO0A6QGPDYPfeFSC/hJMvIwr3SYnevJ7YVJp
	JuwDQZrJV/W+p1R0axZ1kbjNnXnpf+oKXvTHCjl3JYEDigekwlmBmeJAtNkPylElMw4U
	xXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=Z3a26uqi+4Q58CbpgzzVnIV3GFphPR4+x0F/quJ2rhk=;
	b=C//j7Krgsv7pdCNi9jwpi8OrBJaSVXscXKynyvyVG6zM0BlcTAjISYxRP3Ul7GViXe
	J+esFNe904Qlt808Dq4b76cbZeuwb6MkO9KJSpgyejCWzRh8PPXJ/5rWaee6QIbiXN8O
	dJEb43Lhf3BXbLTUQ0jIx/Qx+N3UsHsbk7Z1A9+lTWcJoPByfWS9ydpSJ8YcuwvI4NhE
	YcQf9SoVFDt9EgHJdUPFHduAPdqtaqqVtlRZ/hrkSeRnQcGqiNDYL3ZfyBYTRyaDFvA3
	zDr9Vy0exxCGR8AF4jIALjYP6/KvG+hSZPcnq++Lq3j0AKnyz8YWDcz2K3DDXg0Fu0sC
	ta0w==
X-Gm-Message-State: APjAAAV5JXTsJRW/hgS+zq68LC7UnO4RdecIs0/z/al/XuAS//d0iU7Q
	oYlS+kr6/vx/cZJNfPvoBtWddA==
X-Google-Smtp-Source: APXvYqydfbLfwJku8K2jIKrXI+GVPeELQwG4F3Ng0+3PX3orqG3w8IIWQ85qNUBH5eKvgV9WXrgBxA==
X-Received: by 2002:aa7:9313:: with SMTP id 19mr18037210pfj.173.1552901481130; 
	Mon, 18 Mar 2019 02:31:21 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	r86sm15793545pfa.82.2019.03.18.02.31.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 02:31:20 -0700 (PDT)
Date: Mon, 18 Mar 2019 02:31:20 -0700 (PDT)
X-Google-Original-Date: Mon, 18 Mar 2019 02:30:18 PDT (-0700)
In-Reply-To: <52be9b1c-772a-326a-584b-606fac5c6638@redhat.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org, alistair23@gmail.com,
	David Abdurachmanov <david.abdurachmanov@gmail.com>, 
	rjones@redhat.com, abologna@redhat.com
From: Palmer Dabbelt <palmer@sifive.com>
To: pbonzini@redhat.com
Message-ID: <mhng-7fbbd7d2-fbc9-4c3a-8c1c-4e66c25d54dd@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-riscv] [PATCH v1 1/1] riscv: plic: Set msi_nonbroken as
 true
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2019 09:31:26 -0000

On Mon, 18 Mar 2019 01:39:46 PDT (-0700), pbonzini@redhat.com wrote:
> On 15/03/19 21:05, Alistair Francis wrote:
>> Set msi_nonbroken as true for the PLIC.
>>
>> According to the comment located here:
>> https://git.qemu.org/?p=qemu.git;a=blob;f=hw/pci/msi.c;h=47d2b0f33c664533b8dbd5cb17faa8e6a01afe1f;hb=HEAD#l38
>> the msi_nonbroken variable should be set to true even if they don't
>> support MSI. In this case that is what we are doing as we don't support
>> MSI.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> Reported-by: Andrea Bolognani <abologna@redhat.com>
>> Reported-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
>> ---
>> This should allow working pcie-root-ports in QEMU and allow libvirt
>> to start using PCIe by default for RISC-V guests.
>>
>> hw/riscv/sifive_plic.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
>> index d12ec3fc9a..4b0537c912 100644
>> --- a/hw/riscv/sifive_plic.c
>> +++ b/hw/riscv/sifive_plic.c
>> @@ -22,6 +22,7 @@
>>  #include "qemu/log.h"
>>  #include "qemu/error-report.h"
>>  #include "hw/sysbus.h"
>> +#include "hw/pci/msi.h"
>>  #include "target/riscv/cpu.h"
>>  #include "hw/riscv/sifive_plic.h"
>>
>> @@ -443,6 +444,8 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
>>      plic->enable = g_new0(uint32_t, plic->bitfield_words * plic->num_addrs);
>>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
>>      qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
>> +
>> +    msi_nonbroken = true;
>>  }
>>
>>  static void sifive_plic_class_init(ObjectClass *klass, void *data)
>>
>
> I can queue this patch, and add the "select MSI" to CONFIG_SIFIVE.

Works for me.  Thanks!

