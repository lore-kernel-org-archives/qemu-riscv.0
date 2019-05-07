Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hO2mF-0003H8-T3
	for mharc-qemu-riscv@gnu.org; Tue, 07 May 2019 12:17:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hO2mD-0003FN-T2
	for qemu-riscv@nongnu.org; Tue, 07 May 2019 12:17:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hO2mC-0001mj-Ov
	for qemu-riscv@nongnu.org; Tue, 07 May 2019 12:17:09 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33630)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hO2mC-0001ld-H9
	for qemu-riscv@nongnu.org; Tue, 07 May 2019 12:17:08 -0400
Received: by mail-pf1-x444.google.com with SMTP id z28so8921468pfk.0
	for <qemu-riscv@nongnu.org>; Tue, 07 May 2019 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version;
	bh=e+3BRV4KH4f/9OHbxBp+qoXkQHe01WAU6hlC2OPSPQg=;
	b=RDe8C3jcxt5fWdY21i1WgcXJmHe0dLKPZCst64TBLHK37nZVxeWvpT/MVJo01w39tz
	Mdl3YWnfWjW7ycy6Go47Y8EXiElTUWUKXCS9DQwxglh8ZTH2w4eC4Q5MnAA7S+3+fnED
	sN54G7YGRmcJVE37Vua/6ZW8R/nvWYnkmtH3dSyKhHGApPWlwXwlEHT7ymxL9IMJuCpA
	OmvrchIreqN1vm0ABIYXlQrne1tagsK6/xK025WolR3qHlxqjs1GUV/0VeiNNazMlxcD
	iOTh+VtIlijRwC/ovkNldY96B4HXf8mYgdPYXqyi+tQrZQoUyeBAbWna6jLCthefIQGB
	DfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version;
	bh=e+3BRV4KH4f/9OHbxBp+qoXkQHe01WAU6hlC2OPSPQg=;
	b=hHMYjE1/8wNtocF/XX2HkiYCHvWEPHDb8lbXHc8oTPVI+b6aqlvgdh0/0nkRSTv23z
	AQmFb4oaPE4IZeE7wqrESPHvSmOUR4yDe6AMpLsKS6es1fNr/V/22zCFtPNZgoXuoNec
	nMfxupu1TkZgWQQyCKlJa3FXqs10DAldCqx3xbc8iN1USm7QZ/yaRnG5EExI/0tO7+Vv
	ODWaa3FOuTgg0o0d5OEef2dBwePodIGFv4L9TbJNOM5pEM8rYWtCnb3zpujvjuTBRkF4
	gcde5/kztHq2qpXKQ26gnUBxpmekmz2tHFCbJZEOKLxGA9DdyXqlTzw42kFjoasr266W
	VDsg==
X-Gm-Message-State: APjAAAUOSZz1QDMTLa0hUMW8OVr38yeZt9CyqRL1EFWrZvqFZvaVDum9
	6Lu1EZ7SCMX9CEIUhDGmReGDEdqeC3Y5/sx8mDAE4qAm7WayjfpMWZaRpuFoocBkeh24xFDcB5l
	bXNiWIKRk
X-Google-Smtp-Source: APXvYqwUSWHBkejDkKbesquaTLpAuI66Hkk3fr4YOsUALvPED1ZXn1AKj2a7AaVZPzqErkaRKdAI0Q==
X-Received: by 2002:a62:ea0a:: with SMTP id t10mr25560464pfh.236.1557245826607;
	Tue, 07 May 2019 09:17:06 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	r12sm18050914pfn.144.2019.05.07.09.17.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 09:17:05 -0700 (PDT)
Date: Tue, 07 May 2019 09:17:05 -0700 (PDT)
X-Google-Original-Date: Tue, 07 May 2019 09:17:01 PDT (-0700)
In-Reply-To: <8613364866adfb29aa32159f57448e3b8e0df734.camel@wdc.com>
CC: merker@debian.org, qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, vagrant@debian.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-e7868693-40cc-42d8-b01a-2f28cc22a31c@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-riscv] RISC-V: qemu should provide different "model"
 strings in DT for RV64 and RV32
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
X-List-Received-Date: Tue, 07 May 2019 16:17:11 -0000

On Mon, 06 May 2019 12:52:32 PDT (-0700), Alistair Francis wrote:
> On Mon, 2019-05-06 at 20:53 +0200, Karsten Merker wrote:
>> On Mon, May 06, 2019 at 02:33:29PM +0000, Alistair Francis wrote:
>> > On Sun, 2019-05-05 at 23:03 +0200, Karsten Merker wrote:
>> > > Hello,
>> > > 
>> > > while working on RISC-V support for the Debian flash-kernel packa
>> > > 
>> > > I have stumbled over a potential problem with the "model" string
>> > > that qemu sets in the DT that it generates for the "virt"
>> > > machine,
>> > > namely "riscv-virtio,qemu".
>> > > 
>> > > Some tools, among them flash-kernel, use the "model" string to
>> > > determine on which specific type of hardware they are running and
>> > > perform corresponding hardware-specific actions.  It looks like
>> > > qemu uses the same model string for both RV64 and RV32, which
>> > > makes it impossible to differentiate between the two. I would
>> > > therefore like to propose to make the model-string
>> > > XLEN-dependent, i.e. "riscv64-virtio,qemu" respectively
>> > > "riscv32-virtio,qemu".
>> > 
>> > This sounds fine to me.
>> > 
>> > Is there anything that already relies on the
>> > "riscv-virtio,qemu" compat string?
>> 
>> At least nothing that I am aware of.
>> 
>> > Maybe we can keep that and add a 32/64 bit one so we don't
>> > break anything that is already working.
>> 
>> AFAICS this isn't possible as according to the device-tree
>> specification the "model" property in DT can only have a single
>> value:
>> 
>>   Property name: model
>>   Value type: <string>
>> 
>> To allow for multiple values that would have to be
>> 
>>   Value type: <stringlist>
> 
> Ah, no worries. I think it's worth sending the patch. The 4.1
> development cycle has just opened so now seems like a good time to send
> it. We can then test to make sure nothing is broken before the next
> release.

I'd be OK with the change from "riscv-virtio,qemu" to "riscv64-virtio,qemu".
It's nominally an interface change, but I doubt anyone would be using it.  It's
probably best to check on sw-dev just to be sure.

-- 
The information transmitted is intended only for the person or entity to 
which it is addressed and may contain confidential and/or privileged 
material. If you are not the intended recipient of this message please do 
not read, copy, use or disclose this communication and notify the sender 
immediately. It should be noted that any review, retransmission, 
dissemination or other use of, or taking action or reliance upon, this 
information by persons or entities other than the intended recipient is 
prohibited.

