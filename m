Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmUJu-0000xQ-6I
	for mharc-qemu-riscv@gnu.org; Wed, 23 Jan 2019 21:00:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gmUJr-0000vq-Sl
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 21:00:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gmUJq-0000hk-3k
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 21:00:39 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37675)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gmUJp-0000ge-Ry
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 21:00:37 -0500
Received: by mail-pg1-x544.google.com with SMTP id c25so1946234pgb.4
	for <qemu-riscv@nongnu.org>; Wed, 23 Jan 2019 18:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=pKDqipHoyREXeV6Nx8rAfdhOowvNXR9ld1M4rzhFLt0=;
	b=WdpI9CDYF+Zjdj7E7fWUnblNYkO9u6aHj0eIfEYnDSspFjmRzcJ+jUhCxC4R2Y6hJv
	WFYgpQGuBQkUXZUxAl2esxBJ/rEv2z5cGkn3d9TRJ1AX6M5ceDdIkFqCVPNoXuW6vEj9
	0cUh2N1rzKPFvnM7faT47f/ulh4x5PEcmzUY4CvaKIOsmEM488JPehuw45rCp45UGHPs
	lVko2xPkWnprcAJlNxPUvZ0aHWnXiPVt6+OmFLIg5F2XvUISJI3Npy/H0ur9CdSbQ17m
	VKFjDrt7GHR5NfVXVxp9vXZsDKGpdP7C5g8NCS3X+f4/BOJcFR5gmBR84G5GkKTM4Dhy
	ModQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=pKDqipHoyREXeV6Nx8rAfdhOowvNXR9ld1M4rzhFLt0=;
	b=ZFZnmMpdD2scZ+YeW+2LUUC5/0FrirLNQ5QJ238xguj9BRfZWg/xLwuv5NH2y53iDC
	SFbv/arZyR1orSLOKY8dYu+1bFg/AKlZgbSDZADEOoNjWsWTsDWJ23MKV3qRbSxH5n2W
	SngCoW+mR5FXsnvotazTBsPWS77pyvm2JvAmXBqky8zB5LLUZSCYZe8oaXrcGBgcppTj
	SwsqsankKNbLJJqAda8Y3i4A0pWWOq3h1V/Olc08HpNyFsqnDZkv9DC12hzmpEkeK38z
	6wOBqiWEyNBAeiujUDjpusyhkeCGVD9LPsh3yiKjxXt3kESLH9XgBfTo1eqqN3alpbdT
	HXNg==
X-Gm-Message-State: AJcUukdHb9KyoPqK8NP96Kvb7kbdHEm0QBxXWb/M6GKB+jaaQWTXjjVu
	VANT8OPNgX5RoRNzGrvxqBLXpg==
X-Google-Smtp-Source: ALg8bN6cG+4ymxQmxlOUIQrwAzNqKzIPnRZUrnWupJLlRhYnfaULX1NdaMCdQBLd027lQODmFy4ULQ==
X-Received: by 2002:a62:9913:: with SMTP id d19mr4477941pfe.107.1548295234754; 
	Wed, 23 Jan 2019 18:00:34 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	t24sm38607851pfm.127.2019.01.23.18.00.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 18:00:33 -0800 (PST)
Date: Wed, 23 Jan 2019 18:00:33 -0800 (PST)
X-Google-Original-Date: Wed, 23 Jan 2019 17:37:39 PST (-0800)
In-Reply-To: <CAKmqyKN+PEt8=z_OUHngj5w6V6ZQ4r+U4uEDFrFayWXo8S+1tA@mail.gmail.com>
CC: philmd@redhat.com, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	agraf@suse.de
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-283ef773-6344-48c3-a18d-c321084aba4d@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 1/1] riscv: Ensure the
 kernel start address is correctly cast
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
X-List-Received-Date: Thu, 24 Jan 2019 02:00:41 -0000

On Tue, 15 Jan 2019 13:09:28 PST (-0800), alistair23@gmail.com wrote:
> On Mon, Jan 14, 2019 at 2:58 AM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> Hi Alistair,
>>
>> On 1/12/19 2:17 AM, Alistair Francis wrote:
>> > Cast the kernel start address to the target bit length.
>> >
>> > This ensures that we calculate the initrd offset to a valid address for
>> > the architecture.
>>
>> Can you add an example of the failure symptoms?
>
> I can.

Should I be waiting for a v3?

>
>>
>> >
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > Suggested-by: Alexander Graf <agraf@suse.de>
>> > Reported-by: Alexander Graf <agraf@suse.de>
>> > ---
>> > v2:
>> >  - Remove old comment
>> >  hw/riscv/sifive_e.c | 2 +-
>> >  hw/riscv/sifive_u.c | 2 +-
>> >  hw/riscv/spike.c    | 2 +-
>> >  hw/riscv/virt.c     | 2 +-
>> >  4 files changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
>> > index 5d9d65ff29..e5d7fc548e 100644
>> > --- a/hw/riscv/sifive_e.c
>> > +++ b/hw/riscv/sifive_e.c
>> > @@ -74,7 +74,7 @@ static const struct MemmapEntry {
>> >      [SIFIVE_E_DTIM] =     { 0x80000000,     0x4000 }
>> >  };
>> >
>> > -static uint64_t load_kernel(const char *kernel_filename)
>> > +static target_ulong load_kernel(const char *kernel_filename)
>> >  {
>> >      uint64_t kernel_entry, kernel_high;
>>
>> Shouldn't you update load_elf() and co now to take target_ulong
>> arguments? This would fix this error generically for all archs.
>
> That is an option, but as load_elf() is called by every other machine
> I don't want to break them. It's entirely possible that other machines
> rely on this behaviour and changing it will break them.
>
> Alistair
>
>>
>> >
>> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> > index 3bd3b67507..3b3acec377 100644
>> > --- a/hw/riscv/sifive_u.c
>> > +++ b/hw/riscv/sifive_u.c
>> > @@ -65,7 +65,7 @@ static const struct MemmapEntry {
>> >
>> >  #define GEM_REVISION        0x10070109
>> >
>> > -static uint64_t load_kernel(const char *kernel_filename)
>> > +static target_ulong load_kernel(const char *kernel_filename)
>> >  {
>> >      uint64_t kernel_entry, kernel_high;
>> >
>> > diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>> > index 268df04c3c..79cb4c1282 100644
>> > --- a/hw/riscv/spike.c
>> > +++ b/hw/riscv/spike.c
>> > @@ -53,7 +53,7 @@ static const struct MemmapEntry {
>> >      [SPIKE_DRAM] =     { 0x80000000,        0x0 },
>> >  };
>> >
>> > -static uint64_t load_kernel(const char *kernel_filename)
>> > +static target_ulong load_kernel(const char *kernel_filename)
>> >  {
>> >      uint64_t kernel_entry, kernel_high;
>> >
>> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> > index e7f0716fb6..648462b18c 100644
>> > --- a/hw/riscv/virt.c
>> > +++ b/hw/riscv/virt.c
>> > @@ -62,7 +62,7 @@ static const struct MemmapEntry {
>> >      [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
>> >  };
>> >
>> > -static uint64_t load_kernel(const char *kernel_filename)
>> > +static target_ulong load_kernel(const char *kernel_filename)
>> >  {
>> >      uint64_t kernel_entry, kernel_high;
>> >
>> >

