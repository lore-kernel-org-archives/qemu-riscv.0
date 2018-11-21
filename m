Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPb6x-0005IZ-Kd
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 17:36:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPb6s-0005Fm-QH
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:36:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPb6o-0004lg-9q
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:36:38 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:37853)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPb6n-0004ON-WB
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:36:34 -0500
Received: by mail-pl1-x643.google.com with SMTP id b5so7454667plr.4
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 14:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=svTuEZCWUyO7shUJ+vP87HEFh/d2Lg+x+qu5srTWIVM=;
	b=LEIh9UibT2NFpfpjzsqXV09RYv9wXQyghgVS8bFU85/H+yivt93YPPBsOF4ij5Cafb
	Koi0Qc6npMOtD+Unn0CGheSRK/Q6myaBg8xqWynoH+ESYT0Q6Kg4sXoDVo6ziOCVkiGa
	3uoCejiyEgNIvF2S5qXtJQFB93wgraYM37zPSMDuxs6U+4FATaDA+5VdFIK5pjBDmM8m
	X5MnrkrnyGIKo/UnWuYORnwAaJJhQe1JBXYhl9m6+uHbp1qvYTunjJIv7EvVYrrAub7+
	r5aSfUE27UZcGJOyXJ8FB8/wTKvTa2r8bVp5hIMvMellwlTA4gXN6/p7FyljwhO23Mgl
	hcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=svTuEZCWUyO7shUJ+vP87HEFh/d2Lg+x+qu5srTWIVM=;
	b=gcIKbQzqQ9jlmrOrCMZEU06UQLK2485Uvf6nygQxj9pJbZeSiyf9PJK8jpWPV+XSfn
	FD4o0R5SHIYaFmh/RwrQ4g+n0NYZV3dbKZc5k8mWfPlB+SGgUKTGMP/k+jkkftuGY5dp
	7B7IyJttpLvnOS1fAqyr6/6m5CwVdvc2/G/a7WtgbL27kcR9pd5kj4YD+s2RXrYDsm7J
	Vb/UaU3w0UvRUecrKCBpKX7nIS/QspKDakM7OJQm8lJ7aYHcl3FnQVcFhhRN6tmwBAlm
	KkvrDQmDjJAqmMgaj2TNs7Z2FAF9CwCs7YQsXKokeJin1o2Ue4zv57ECcVJLIn/B47u9
	YSXw==
X-Gm-Message-State: AGRZ1gJD6Q7QLLxuOB/eocUVrCYvqcyJdNcotoOsohpLSs20BWcYEpo4
	hwSp7vRR13xk0GtHMnBAFuMrSg==
X-Google-Smtp-Source: AJdET5etiFVYIylEBmmpC7qzPLOlKmz3c8eCiGWZidD2F8OUXwHwe1I7p0d43xlhsiSf+e0pgmQzFg==
X-Received: by 2002:a62:670f:: with SMTP id b15mr8728670pfc.212.1542839783534; 
	Wed, 21 Nov 2018 14:36:23 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	d16sm47674689pgj.21.2018.11.21.14.36.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 14:36:22 -0800 (PST)
Date: Wed, 21 Nov 2018 14:36:22 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 14:36:20 PST (-0800)
In-Reply-To: <CAKmqyKNpSWpaUVzJobNPvB=_T+tXhGdiWPTkWmQxdKQf8SHbig@mail.gmail.com>
CC: logang@deltatee.com, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	linux@roeck-us.net, abologna@redhat.com
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-dc5c5bfa-47d8-41c6-8240-fdb97d24555e@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Wed, 21 Nov 2018 22:36:40 -0000

On Wed, 21 Nov 2018 14:23:13 PST (-0800), alistair23@gmail.com wrote:
> On Wed, Nov 21, 2018 at 2:15 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 21 Nov 2018 13:49:53 PST (-0800), alistair23@gmail.com wrote:
>> > On Wed, Nov 21, 2018 at 1:26 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>> >>
>> >> On Wed, 21 Nov 2018 10:32:45 PST (-0800), alistair23@gmail.com wrote:
>> >> > On Wed, Nov 21, 2018 at 10:05 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>> >> >>
>> >> >>
>> >> >>
>> >> >> On 2018-11-21 10:02 a.m., Alistair Francis wrote:
>> >> >> > Connect the Xilinx PCIe device based on the information in the device
>> >> >> > tree stored in the ROM of the HiFish Unleashed board.
>> >> >>
>> >> >> I only briefly tested this patch but could not get any PCI devices to
>> >> >> come up with the sifive_u machine. Depending on the kernel I tried, it
>> >> >> either failed to initialize a Xilinx PCIe (likely due to a mismatch with
>> >> >> the DT) or it appears to successfully initialize a Microsemi device but
>> >> >> did not enumerate any devices underneath.
>> >> >
>> >> > That seems like either a kernel or bbl issue.
>> >> >
>> >> > You need to make sure that bbl doesn't edit the device tree (to add
>> >> > the Microsemi device or remove the Xilinx one) and ensure your kernel
>> >> > supports the Xilinx one.
>> >> >
>> >> >>
>> >> >> In any case, it would be nice if the Microsemi/Xilinx confusion was at
>> >> >> least explained in the commit message.
>> >> >
>> >> > What should we say? The QEMU machine accurately models the real
>> >> > hardware which reports a Xilinx PCIe. The confusion generally appears
>> >> > above QEMU where people are used to using the MicroSemi one.
>> >>
>> >> I think the real issue here is that "sifive_u" doesn't actually fully describe
>> >> the device we're trying to emulate.  Is it a:
>> >>
>> >> * Generic SiFive U core?  In that case we just have a 64-bit core and
>> >>   essentially no devices.  This is kind of useless.
>> >> * A HiFive Unleashed?  In that case there's no PCIe, as it requires an
>> >>   expansion board.
>> >> * A HiFive Unleashed + VC707?  Here we have Xilinx PCIe.
>> >> * A HiFive Unleashed + Microsemi Expansion?  Here have Microsemi PCIe.
>> >
>> > This isn't even always consistent. For example the sifive_u machine
>> > exists for 32-bit cores, but the PCIe address reported by the hardware
>> > only works for 64-bit machines.
>> >
>> > So we need a trade off between accurately modelling the hardware or
>> > having 32-bit support.
>>
>> Yep, there's another issue.
>>
>> >> There's a tradeoff between accurately emulating the hardware and blowing up the
>> >> amount of targets we support in QEMU.  We went through this discussion before
>> >> and ended up where we are now, but maybe it's best to go have the discussion
>> >> again?
>> >
>> > Up to you, it is your board :)
>> >
>> > I think it makes more sense to remove these generic boards (that is
>> > what the virt board is for) and model real hardware boards.
>>
>> That seems reasonable to me.  Is removing boards allowed?  If so I'd be OK
>
> It's possible, but takes some releases and deprecation warnings.
>
> You can see info about it here:
> https://qemu.weilnetz.de/doc/qemu-doc.html#Deprecated-features
>
> As it sounds like no one uses sifive u board (you can't specify a
> rootFS) it probably isn't that bad to remove.

OK, I'll write a patch.

>> renaming these to "sifive-hifive1" and "sifive-hifive-unleashed", and possibly
>> adding a "sifive-hifive-unleashed-vc707" as it's possible to emulate most of
>> that.  Then we at least have accurate names for the boards.
>
> That sounds good to me.
>
>>
>> We do have an issue where I'd like to be able to have some system by which we
>> can configure the memory map of the target, but maybe that's separate
>> discussion.
>
> Yeah, that would also be nice, but I think is separate.
>
> Alistair

