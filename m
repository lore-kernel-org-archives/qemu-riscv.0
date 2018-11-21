Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPa8L-0005ll-Ux
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 16:34:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPa8E-0005XD-4f
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 16:34:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPa1U-0001Lg-2X
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 16:27:03 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:44210)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPa1S-0001Jn-2V
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 16:26:58 -0500
Received: by mail-pl1-x642.google.com with SMTP id s5-v6so7227288plq.11
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 13:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=FyIX2f99k8gOOUCh3vMj1HBBMrIlNlQzimx1QbB16N0=;
	b=GQnC1mGeTh4D58JoyRAVu801PpumaIqgrwJH2WZyDM8pWk07ObS74YnrQT6xfZzLLx
	vjYW9Rhe+MgNYo9nPcvNs6UZrdYlHirKYfK6g6dwU6ZD4KwC+ilwx2188xLhKPXcW7yT
	gL09IaaMSyvQIOWr5gfJH46gE2KSbjBVx2dhw22Cq2asA4tfZ57lqsfba58qaXQ7q+aS
	DoVZRhtDtj2e3HzpmVyajTvZpbSgv3qpqT56B+EJhQyz67lpWoLJgrVYt3dfhbqI8tzK
	W+ipoDjW6geLaZtkJYSMY/Mes3VBAIb8RyEYYj2/kKnLlaUscPT/Op1of0MmRUSJmGKm
	2IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=FyIX2f99k8gOOUCh3vMj1HBBMrIlNlQzimx1QbB16N0=;
	b=gi6ULkAw2DG9YazMvwdXRr40Wur7M2AxXgcAq6SeYwSkcEs2wOVFfT7+jjBaWK2cpi
	KqJLTwRinVzvelxEk/JYpvbXKf1rRlu5TqlFx9ONhPzYg+BsGtZAvD5/GoRrXHAhViAM
	srhNvDlt7qpOiILwDb8m63uY0wEVhtGnco5skHlakp0gPKFo54VbcMOFcTMhDIavt1n2
	5pqv4fQBPSD9UlkaOdXRwmkk80k/jzmkvkDvC08eYb8WMQShrS5keK5ORsa73v4lMnv9
	u8HWtly9KtHGQ8UnKV+9wf4FN1qyIFk6IaF6e6WOk1SzSFfGv3R2tlOn2Gl0sFi5WwWZ
	z/ng==
X-Gm-Message-State: AA+aEWat663auZk7Ib5znrB3zKc0IyaOyieU2BM4cAibo35QuBWX7Uf+
	6VQtH0C/nic/kBSWkd1PiT9FLA==
X-Google-Smtp-Source: AFSGD/UIZeADBFXKfkKoHxsFIQZDNYLNnZGtZDRO9OM07QC8D3qjgV6FolnM5dOr8wYX5YQqcokgIg==
X-Received: by 2002:a17:902:aa4c:: with SMTP id
	c12mr5765517plr.48.1542835615149; 
	Wed, 21 Nov 2018 13:26:55 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	d2-v6sm54446239pfn.118.2018.11.21.13.26.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 13:26:54 -0800 (PST)
Date: Wed, 21 Nov 2018 13:26:54 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 13:26:07 PST (-0800)
In-Reply-To: <CAKmqyKMtTqi=D-PKZFnt40MaA8+e6Sj8nUr0VmBFajScw1MYng@mail.gmail.com>
CC: logang@deltatee.com, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	linux@roeck-us.net, abologna@redhat.com
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-ac7d7069-f2ae-45b5-a950-17410b48481f@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-3.2 v7 5/6]
 hw/riscv/sifive_u: Connect the Xilinx PCIe
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
X-List-Received-Date: Wed, 21 Nov 2018 21:34:04 -0000

On Wed, 21 Nov 2018 10:32:45 PST (-0800), alistair23@gmail.com wrote:
> On Wed, Nov 21, 2018 at 10:05 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>>
>>
>>
>> On 2018-11-21 10:02 a.m., Alistair Francis wrote:
>> > Connect the Xilinx PCIe device based on the information in the device
>> > tree stored in the ROM of the HiFish Unleashed board.
>>
>> I only briefly tested this patch but could not get any PCI devices to
>> come up with the sifive_u machine. Depending on the kernel I tried, it
>> either failed to initialize a Xilinx PCIe (likely due to a mismatch with
>> the DT) or it appears to successfully initialize a Microsemi device but
>> did not enumerate any devices underneath.
>
> That seems like either a kernel or bbl issue.
>
> You need to make sure that bbl doesn't edit the device tree (to add
> the Microsemi device or remove the Xilinx one) and ensure your kernel
> supports the Xilinx one.
>
>>
>> In any case, it would be nice if the Microsemi/Xilinx confusion was at
>> least explained in the commit message.
>
> What should we say? The QEMU machine accurately models the real
> hardware which reports a Xilinx PCIe. The confusion generally appears
> above QEMU where people are used to using the MicroSemi one.

I think the real issue here is that "sifive_u" doesn't actually fully describe 
the device we're trying to emulate.  Is it a:

* Generic SiFive U core?  In that case we just have a 64-bit core and 
  essentially no devices.  This is kind of useless.
* A HiFive Unleashed?  In that case there's no PCIe, as it requires an 
  expansion board.
* A HiFive Unleashed + VC707?  Here we have Xilinx PCIe.
* A HiFive Unleashed + Microsemi Expansion?  Here have Microsemi PCIe.

There's a tradeoff between accurately emulating the hardware and blowing up the 
amount of targets we support in QEMU.  We went through this discussion before 
and ended up where we are now, but maybe it's best to go have the discussion 
again?

