Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPan0-00041q-Px
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 17:16:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPamy-0003zt-LT
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:16:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPams-0004GW-Ny
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:16:04 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:37665)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPamo-0004BZ-Nj
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:15:58 -0500
Received: by mail-pl1-x644.google.com with SMTP id b5so7393488plr.4
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 14:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=5jWUQHg6j2RZkclKZWSIRCw7zdGCTn8vouRqZkKSRGQ=;
	b=JnU7wgp+0eKRMGDaZnPyKwTavkPm0gC9KFOCpknSOUno709cAueG5A7A0LW4YPCsy1
	Lhi0pTKHhMQIDbfjNCv76VXMtUCYW67djIJcOcIZzP+okg/XFmXSWZV8E5Azdk9ASWC6
	kVUTU8QYYzBkne1LS/QFIo0t0WnrLo+/GYQAC2NwQ/amJKM1Vk69fci2fKHITmRuFyqx
	Yy7F0YT3cIR3uXyvmTb7YrlFHcwjQRH6af9ncB/2xJVdEbpNpx+WYaIj7ZlJlFH7C/xV
	28TXfx/rxhNZBiIP1MBz4riCOUaKrms64cTE8LljO76fPrGepHVZPI3omtkVodXC5xo8
	cbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=5jWUQHg6j2RZkclKZWSIRCw7zdGCTn8vouRqZkKSRGQ=;
	b=bXmyC8CL55jcnKY5se1jPguZw+yZ+JjA7PRRqoTpjrbC1UjDPWB+8MUGZOl3gVksk2
	gqLJD1tjvPKWe99HkPg//5R0aH0ZwIpvtkuc/VEChZ18S1/t0c0kEapXCUjDK4NWg+Y8
	LOG5TSXaIvDx6LiNtw9bZC865mrqcB89F8xqaiBP/1eQxFzGh1XzhY8O7yMfJJxGtp75
	iKZ6MDyArzFZs/FnpH7mYglHgwl+QlA/2f1ZCSvPjW1vUSyWM1KqsZ5LIaGRum1bv02N
	h2aG+vXYIVMYYfyLcooIDDGfM1pGGBoL85erlPqnW5Fy1kIsgDzZM9+Edj2svnlqzBBV
	keDA==
X-Gm-Message-State: AA+aEWbWQuWImLnQmUSdlCUMCwKD6QRWMpf2M/zq5lm/5HKFZrYWmZcG
	fYQjD7S1O/4R3heOTo4Axe7jTw==
X-Google-Smtp-Source: AFSGD/WMsRp1QblGZG8qm9nrhFStnEicpUUNOQX9bkOe2pA/pp63UjQiqTmz0OmV64FQCx3RqmcJxg==
X-Received: by 2002:a62:3c6:: with SMTP id 189-v6mr6715205pfd.19.1542838553258;
	Wed, 21 Nov 2018 14:15:53 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	u29sm56514081pgn.23.2018.11.21.14.15.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 14:15:52 -0800 (PST)
Date: Wed, 21 Nov 2018 14:15:52 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 14:10:05 PST (-0800)
In-Reply-To: <CAKmqyKM2pmF_D812mp1hcJe8KcLGiNz9vLpy7OpsbS0XxNwo+w@mail.gmail.com>
CC: logang@deltatee.com, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	linux@roeck-us.net, abologna@redhat.com
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-39e17271-363f-4e08-ba7e-779c2f46b54f@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Wed, 21 Nov 2018 22:16:06 -0000

On Wed, 21 Nov 2018 13:49:53 PST (-0800), alistair23@gmail.com wrote:
> On Wed, Nov 21, 2018 at 1:26 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 21 Nov 2018 10:32:45 PST (-0800), alistair23@gmail.com wrote:
>> > On Wed, Nov 21, 2018 at 10:05 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>> >>
>> >>
>> >>
>> >> On 2018-11-21 10:02 a.m., Alistair Francis wrote:
>> >> > Connect the Xilinx PCIe device based on the information in the device
>> >> > tree stored in the ROM of the HiFish Unleashed board.
>> >>
>> >> I only briefly tested this patch but could not get any PCI devices to
>> >> come up with the sifive_u machine. Depending on the kernel I tried, it
>> >> either failed to initialize a Xilinx PCIe (likely due to a mismatch with
>> >> the DT) or it appears to successfully initialize a Microsemi device but
>> >> did not enumerate any devices underneath.
>> >
>> > That seems like either a kernel or bbl issue.
>> >
>> > You need to make sure that bbl doesn't edit the device tree (to add
>> > the Microsemi device or remove the Xilinx one) and ensure your kernel
>> > supports the Xilinx one.
>> >
>> >>
>> >> In any case, it would be nice if the Microsemi/Xilinx confusion was at
>> >> least explained in the commit message.
>> >
>> > What should we say? The QEMU machine accurately models the real
>> > hardware which reports a Xilinx PCIe. The confusion generally appears
>> > above QEMU where people are used to using the MicroSemi one.
>>
>> I think the real issue here is that "sifive_u" doesn't actually fully describe
>> the device we're trying to emulate.  Is it a:
>>
>> * Generic SiFive U core?  In that case we just have a 64-bit core and
>>   essentially no devices.  This is kind of useless.
>> * A HiFive Unleashed?  In that case there's no PCIe, as it requires an
>>   expansion board.
>> * A HiFive Unleashed + VC707?  Here we have Xilinx PCIe.
>> * A HiFive Unleashed + Microsemi Expansion?  Here have Microsemi PCIe.
>
> This isn't even always consistent. For example the sifive_u machine
> exists for 32-bit cores, but the PCIe address reported by the hardware
> only works for 64-bit machines.
>
> So we need a trade off between accurately modelling the hardware or
> having 32-bit support.

Yep, there's another issue.

>> There's a tradeoff between accurately emulating the hardware and blowing up the
>> amount of targets we support in QEMU.  We went through this discussion before
>> and ended up where we are now, but maybe it's best to go have the discussion
>> again?
>
> Up to you, it is your board :)
>
> I think it makes more sense to remove these generic boards (that is
> what the virt board is for) and model real hardware boards.

That seems reasonable to me.  Is removing boards allowed?  If so I'd be OK 
renaming these to "sifive-hifive1" and "sifive-hifive-unleashed", and possibly 
adding a "sifive-hifive-unleashed-vc707" as it's possible to emulate most of 
that.  Then we at least have accurate names for the boards.

We do have an issue where I'd like to be able to have some system by which we 
can configure the memory map of the target, but maybe that's separate 
discussion.

