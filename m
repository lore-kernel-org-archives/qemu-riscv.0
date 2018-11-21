Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPanA-0004Bt-OX
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 17:16:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPan9-00049T-47
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:16:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPan7-0004YW-1Y
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:16:14 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38798)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPan2-0004J6-E4
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:16:10 -0500
Received: by mail-pl1-x644.google.com with SMTP id e5so7384818plb.5
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 14:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=/2Kk4VdtaugOIWhsgazECL1jtzyw7FxlpAg06TsmRFE=;
	b=cVDxs5vhYHtHQEGVTtTOhY4iAe5oPL8xugDiJYUWRqYetvc6/l6kebyLtDiPplW9KJ
	MWoHDJGxzVfA8/+hC5emgNWW2ZHQJcdyTp/LlI3g+RXZgRrzMZ3CEo5Me+UjMl2FgG2C
	n8teK4dcGwK5drf6AOptLXHMiyjYw8FSZjMQYNA94newQaIL2HjB1JwdAipcfKdD5TBi
	Grn4y/4KBB/Po5WlOYkr3kZFSju9EiETD/wtDiNLzdT4Jd4MvebeHHoY/mIvLXQZGmsx
	VvgzPvHKhAqpP92E5qAvnt32QhlJkQhBsGiRzN6648Gon+bUoBDm/r8/32ZfMenyvZYK
	j0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=/2Kk4VdtaugOIWhsgazECL1jtzyw7FxlpAg06TsmRFE=;
	b=Hb/XaDMPXz0fcfIGb04csNSHKE4VvfROel/I+GMsnAMyaYRviz4clgK8+ujzn/HHA2
	L7lGyJ8i97BW4vyiucw8wrPRuw1ZoxpNV51u9EWji31sbKl//D2q7eRxb5nM0TiQSTyf
	omPRo3mHh36eRTw7LPAeq9U4dy1Jbn0bVwyX2Y/1LL6gT1TcjfPm/mRPrISpmIQ47smL
	KFktCRQS3Vt0P5tXSCszCJVXERQnxKikVtAnvxLKmAE6yFOihfjf68jEONDNDNx8PzZJ
	/HXnbV5ImTqcUiBXsKzA6W6ChVm7OzBjfxIchrK4nP/h9KtI+7TsWXskZ9llZzXDgZnd
	AfnA==
X-Gm-Message-State: AA+aEWZ1mFAU5g3TjY+WID7lPMCuviL3l080QiJd+qOlJbd5mnvZi4M+
	2FcoTZNNrQtn+c/uwajszlbVsA==
X-Google-Smtp-Source: AFSGD/W9zifaBYi0uefdbIMsmxwa2hxrHZal75kIwSwaE2fZvB5SiVzPHM3eI2sRqAAAl6Eur4djfg==
X-Received: by 2002:a63:bf0b:: with SMTP id v11mr7790070pgf.302.1542838560170; 
	Wed, 21 Nov 2018 14:16:00 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	w2-v6sm53149558pfw.26.2018.11.21.14.15.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 14:15:59 -0800 (PST)
Date: Wed, 21 Nov 2018 14:15:59 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 14:14:39 PST (-0800)
In-Reply-To: <00f7a2ba-8eb1-77fd-1c4b-14e83e553bed@deltatee.com>
CC: alistair23@gmail.com, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	linux@roeck-us.net, abologna@redhat.com
From: Palmer Dabbelt <palmer@sifive.com>
To: logang@deltatee.com
Message-ID: <mhng-a407b21a-ace2-461c-8f27-ee95ed9c3d9b@palmer-si-x1c4>
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
X-List-Received-Date: Wed, 21 Nov 2018 22:16:16 -0000

On Wed, 21 Nov 2018 14:01:34 PST (-0800), logang@deltatee.com wrote:
>
>
> On 2018-11-21 2:54 p.m., Alistair Francis wrote:
>> The last time I tested this it worked (although I might not have
>> tested interrupts) and now it doesn't. Nothing has changed in the
>> series, my guest software has changed though. I can see the root
>> complex, but no devices underneath it.
>>
>> Sorry for the confusion with the MicroSemi PCIe root complex.
>>
>> I think I'll just drop this patch. It doesn't work for 32-bit guests,
>> but I would like to model the hardware so I don't want to change the
>> addresses. We can revisit this in the future along with the gpex high
>> MMIO support and USB support.
>
> Yeah, I'm less concerned about all the board variant stuff as I am about
> having something actually work. I don't want to have to jump through any
> bbl hoops or anything to use it if it doesn't work out of the box. And
> you're right, getting the virt pci support upstream seems more important
> and this issue can be revisited later.
>
> On an slight tangent: what root device do you use with the sifive_u
> machine? I can't find any virtual hardware that works. If I had PCI I
> could use NVMe, but that's not working. And for this reason I've only
> been using the 'virt' device.

I've only been using the virt device as well.

