Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPaBF-0007ei-Va
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 16:37:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPaBD-0007cj-SN
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 16:37:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPaBD-0001Q1-24
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 16:37:03 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37248)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPaBC-0001M3-Mc
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 16:37:02 -0500
Received: by mail-pl1-x641.google.com with SMTP id b5so7278389plr.4
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 13:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=WfNOsXBwFp5fTAqz3Qg/esgYy8IRyKfnPpO9fz05aNY=;
	b=gY7AGrvK+j8QKvaVSCN/6mW+5QTm/CHUGKsTwTzK9phaa97QgVUGczng+F1/gRaasz
	aWknk5ig3kQo/u11GUr5x4JQVfMf7dEuFHODInKqaa6WIUCXdBgSEg7iEUr6GUyg6xRC
	xlDgS7gcr6gEMR7e2/wB1ZvUUS9DLzI/GGngT1U6IrjqWZbTo7P8vdcjnnVuuSLT7r5B
	o4IVxBohTHHmIigALzhv52+QFA4eD32baM0YhiDmzKcoQ/UtzYD3u3Qnni60fHWOE4bQ
	Flol4r1nAmfBvSVnLpvr08qLNPIOqkx91Ty+WC79BJDBsN/Gjx4igsSI+pFBe0mThCKg
	8Gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=WfNOsXBwFp5fTAqz3Qg/esgYy8IRyKfnPpO9fz05aNY=;
	b=ULWGyJGG2nt39UWKtfn0fov6IGZGovkVE/WETBmSHPuF3sdfgUIjQeZeLsnuKc4rX+
	AAsPucTk0OTumGkPnX2SAwpMZre2T3pOtF1c6h/xb1s7PV4dcqFnCkDQgb2SbaaIt8SZ
	tx5Yt7rmo9xOW3dkQuygUox/josx7Psx7anSeUoDJETw+E/uvj62E/Y01je3yJeJBEwD
	LBRFn+Wd54NUYjxoAARiPgrr+aWLcZpsrwp52YvMj6YkxgZg28JXryD6NZbTgzPR2LNc
	SeElECGjQYnaUOZm1KCxrK7AOODSIeD2wbtBFeCK01K19f76qO0y/BUbY1k3TcMiqZF8
	aEQg==
X-Gm-Message-State: AGRZ1gLF4RO7fcyvsusqX7/o/3CmZhjkAsh0qZZHlKIVhJrGQpPo2YBZ
	n5kPRvP928XaFczgCPptatXTtg==
X-Google-Smtp-Source: AJdET5ezDXuHc1p4K+mQ0Ij60w8xVrQNF7mMHTJA/Xk8h+Z18PJVkvXv1WPzlNpwAHdjw2B4VVzXZw==
X-Received: by 2002:a62:1043:: with SMTP id
	y64-v6mr8712172pfi.79.1542836220877; 
	Wed, 21 Nov 2018 13:37:00 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	f64sm105693775pfh.0.2018.11.21.13.36.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 13:37:00 -0800 (PST)
Date: Wed, 21 Nov 2018 13:37:00 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 13:36:39 PST (-0800)
In-Reply-To: <CAKmqyKM1pf1zJVMuqZvocN07LxDGrRjoSNLojt=06UbN4P-bpg@mail.gmail.com>
CC: logang@deltatee.com, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	linux@roeck-us.net, abologna@redhat.com
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-ad48cd5f-383f-427e-9bd6-db4947b3839f@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Wed, 21 Nov 2018 21:37:04 -0000

On Wed, 21 Nov 2018 11:21:40 PST (-0800), alistair23@gmail.com wrote:
> On Wed, Nov 21, 2018 at 11:19 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>>
>>
>>
>> On 2018-11-21 12:16 p.m., Alistair Francis wrote:
>> >>> Do you see the MicroSemi PCIe probe in your dmesg?
>> >>
>> >> I do when I have a kernel with microsemi PCI Support (specifically the
>> >> one included in the bbl you sent us a while back).
>> >
>> > Yeah, so you need to make sure that doesn't happen.
>>
>> Well, I also have a kernel (one I've built myself) without microsemi
>> support, but with Xilinx support and it also doesn't work (see my dmesg
>> logs I sent).
>
> So this one should work.
>
>>
>> > For people who have modified the standard bbl to edit the device tree
>> > before passing it to Linux to add the MicroSemi PCIe node, it won't
>> > work. That's a very small number of people who have modified the
>> > standard boot loader. I don't think we need to document how those
>> > people get back to the default set-up.
>>
>> I have not done that. And it's not working for me.
>
> If you haven't done this then how can Linux know to probe the
> MicroSemi PCIe root complex?

BBL passes this through from the FSBL, which has the DTB compiled in:

https://github.com/sifive/freedom-u540-c000-bootloader/blob/master/fsbl/ux00_fsbl.dts#L405

