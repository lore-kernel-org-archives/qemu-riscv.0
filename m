Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPan8-000490-Q7
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 17:16:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPan2-00043X-HF
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:16:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPamy-0004Nz-LJ
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:16:06 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44116)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPamw-0004Gu-I0
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 17:16:04 -0500
Received: by mail-pl1-x62d.google.com with SMTP id s5-v6so7374235plq.11
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 14:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=XVs9VR0gxvVNr2hTV9th3X0RlX2/LQxOF72uiYZBqKY=;
	b=K7Yq6mKM07Fn5SS9O+4If163lbLrPL3FDhg114YdFe8A5/P0Y+Bj6pyj4FfwJWrrBO
	ll4h4EpPCHTi7ywfOCAMO8TMXgv1u9pm1rI2gZGmpTCO0dCliKbkXzlCasodNpqpJLvo
	ehgL6kLGTKwuozRJKnyXOJTqdjO2pFM0x27mfLRD3qleYsC9UnVukXVxNjpLnopHls1v
	I+FIgIghrTRUefdx44g6y5bGZEbg8NFAe5s5XwATr8oB1pM6Gubh5VBmfPZQWLnGqWMk
	Yw5ySFPBfzc3zD2jFWLrPyhe6G7fhgru5Wq+74+WTE4tb7kAVG71VBNHex/LKbYxx9tU
	TwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=XVs9VR0gxvVNr2hTV9th3X0RlX2/LQxOF72uiYZBqKY=;
	b=GLp1M0eixh5K7QdlZXMyCKAr9L3S2uC1zQYH1nsgQjJNVAJMrOEKtZ4VB3wzL8zfg4
	qQa3duQ4GxDeJNLQi8qFjVatmwFd+076QL5ZrU9hRoEy2F4b5nfxLkop+oFrSIyCh3DA
	Z0jnJdurdSR4k0otu1pGI2dbkbNN0JRERgBMvwD+fthEywlhAg3RVEvKmbfeQInwgy+Q
	CarTnXntD6MbD0WRl02Z8uGkYxNNwj4DdY7j1x1fdI7Njl2sFdnDOftsQW05uFocGtGX
	NN4J2fxP+WWLE9UAIg9lA/kxtBBDo4UsG4DW0kVr7c3qXzRESlhp/iYUpl+KU+SVvYXE
	Wylw==
X-Gm-Message-State: AA+aEWb+jMLnaLySw17HzsqKjWBwq5H7Vk9oIYcDl8EfmNmMj9XSNLxq
	bortE66hAzqYGnplJve/6aYGJw==
X-Google-Smtp-Source: AFSGD/W6PVraQV1nZgwFwPY83sZOJxcgSPPJKt/fVMgW0pjHdg8WRFlq8/hEhYPFAXkywmT9hYOFMw==
X-Received: by 2002:a63:be4d:: with SMTP id g13mr7623721pgo.378.1542838558456; 
	Wed, 21 Nov 2018 14:15:58 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	r26-v6sm20360536pfk.157.2018.11.21.14.15.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 14:15:57 -0800 (PST)
Date: Wed, 21 Nov 2018 14:15:57 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 14:13:54 PST (-0800)
In-Reply-To: <CAKmqyKMZ7+xAPcks33omgaEjQig9b-BSDGMbZBfTDSzW8eiThg@mail.gmail.com>
CC: logang@deltatee.com, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	linux@roeck-us.net, abologna@redhat.com
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-03c7e6ba-b10e-4597-8383-c734fe78f4ad@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62d
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
X-List-Received-Date: Wed, 21 Nov 2018 22:16:13 -0000

On Wed, 21 Nov 2018 14:01:10 PST (-0800), alistair23@gmail.com wrote:
> On Wed, Nov 21, 2018 at 1:37 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 21 Nov 2018 11:21:40 PST (-0800), alistair23@gmail.com wrote:
>> > On Wed, Nov 21, 2018 at 11:19 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>> >>
>> >>
>> >>
>> >> On 2018-11-21 12:16 p.m., Alistair Francis wrote:
>> >> >>> Do you see the MicroSemi PCIe probe in your dmesg?
>> >> >>
>> >> >> I do when I have a kernel with microsemi PCI Support (specifically the
>> >> >> one included in the bbl you sent us a while back).
>> >> >
>> >> > Yeah, so you need to make sure that doesn't happen.
>> >>
>> >> Well, I also have a kernel (one I've built myself) without microsemi
>> >> support, but with Xilinx support and it also doesn't work (see my dmesg
>> >> logs I sent).
>> >
>> > So this one should work.
>> >
>> >>
>> >> > For people who have modified the standard bbl to edit the device tree
>> >> > before passing it to Linux to add the MicroSemi PCIe node, it won't
>> >> > work. That's a very small number of people who have modified the
>> >> > standard boot loader. I don't think we need to document how those
>> >> > people get back to the default set-up.
>> >>
>> >> I have not done that. And it's not working for me.
>> >
>> > If you haven't done this then how can Linux know to probe the
>> > MicroSemi PCIe root complex?
>>
>> BBL passes this through from the FSBL, which has the DTB compiled in:
>>
>> https://github.com/sifive/freedom-u540-c000-bootloader/blob/master/fsbl/ux00_fsbl.dts#L405
>
> That's fairly new though. Our boards show a Xilinx PCIe device.

Presumably you have the Xilinx motherboards, then?  That would mean you have a 
FSBL that was compiled with the device tree to match, which is the right thing 
to do.  Right now there's no way of probing for the motherboard, though at some 
point we designed a scheme to do so it's just not implemented yet.

