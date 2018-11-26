Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRM9t-00073b-9t
	for mharc-qemu-riscv@gnu.org; Mon, 26 Nov 2018 14:03:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gRM9r-0006uJ-EM
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 14:03:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gRM9n-0007ug-7r
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 14:02:59 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46788)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gRM9n-0007uA-20
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 14:02:55 -0500
Received: by mail-pf1-x444.google.com with SMTP id c73so7016077pfe.13
	for <qemu-riscv@nongnu.org>; Mon, 26 Nov 2018 11:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=hHbtW2VHaK+EnawinuUSPTlpQGH1RdUKYX11fPP2M8g=;
	b=Q7FF9zXsW4ZolOI798p7JA3NVkyfNa55oMXr/iF9VqAQtLuVcMrDwBpkDPOMo807iO
	GfUggQekOuCFHWK8UDNECHn/bPUP9QbX0iOI96DpLBAORjMN5NjRN+Id2laJ+D8A32OT
	37YPNa5rROUzhvez0XsmJEcBJehss8jJP6NnSX1P8Ed8Rwi/NBu8Fw0vFbdPYFkilkzj
	RCgvPAegSDv2FtUe7s/Kh+8xjcztBVfECdFkZPat2gFcsk3cRUAdvZymZxTdvESTdO/H
	jNH5gu89zih8A7cRNW7T7XmzYv/kc69RaJEt0PLw9Jqfw5WUwM8NmlitdRP9Fc8gtmXO
	okmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=hHbtW2VHaK+EnawinuUSPTlpQGH1RdUKYX11fPP2M8g=;
	b=e22Z3gjZ54D4oYj5a0kjGH88FZHv3wSr0ocYi6JUlWwbjnZx1RQch8epWU/gwrVA9t
	HcKaAkLNDcTM7D85nE/xS1WTjXZ46E/HMtfLQgjRAqy196d8ybUTgt4QGNNBWd4N0v8l
	/CAHgX0UorYNwltKioL1tqdgtz16MLUazPNUIqpszKGNTVKOf/dPslHNbIv6asZAOqgJ
	aQ9wYL2nufkwbxT1uL5aQcj1wfCvLinq9jqVy8IkM46b1dDBwfyFFJjXCR9QLdBH2Gku
	KZKJgaiCU0i/byblS6j6ySb2tmodgmDzs3c0BtepRJLsYskaO7hTx6plmIZ8vSYvb+Jp
	A8/w==
X-Gm-Message-State: AA+aEWYBGuq8LRzk9DnfA6jnb9y6X3RNzHvXDcpDQcmkq0AkfBjhfq0E
	JE7EhvAbJ7NAqyOUMRd38JByxg==
X-Google-Smtp-Source: AFSGD/UZWHak8Mds1Li0QnTRafjTxAsIkpoZEu3OyHwM0EaPQSn5DYfI9L45MRJI13W6kkIMKLAz7Q==
X-Received: by 2002:a63:3546:: with SMTP id c67mr26441974pga.284.1543258973270;
	Mon, 26 Nov 2018 11:02:53 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	202sm1415666pfy.87.2018.11.26.11.02.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 11:02:52 -0800 (PST)
Date: Mon, 26 Nov 2018 11:02:52 -0800 (PST)
X-Google-Original-Date: Mon, 26 Nov 2018 11:02:06 PST (-0800)
In-Reply-To: <CAKmqyKMdNs4etff7rc0vDy_tmZf5deP1Geu0GchkENu+em5=+w@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org, agraf@suse.de
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-b345219b-56ea-4aee-b25e-95c762c54b49@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 1/1] riscv: virt: Cast the
 initrd start address to target bit length
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
X-List-Received-Date: Mon, 26 Nov 2018 19:03:01 -0000

On Wed, 21 Nov 2018 18:09:27 PST (-0800), alistair23@gmail.com wrote:
> On Wed, Nov 21, 2018 at 5:58 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 21 Nov 2018 14:34:44 PST (-0800), Alistair Francis wrote:
>> > Ensure that the calculate initrd offset points to a valid address for
>> > the architecture.
>> >
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > Suggested-by: Alexander Graf <agraf@suse.de>
>> > Reported-by: Alexander Graf <agraf@suse.de>
>> > ---
>> >  hw/riscv/virt.c | 7 ++++++-
>> >  1 file changed, 6 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> > index 2b38f89070..4467195fac 100644
>> > --- a/hw/riscv/virt.c
>> > +++ b/hw/riscv/virt.c
>> > @@ -85,7 +85,12 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
>> >       * halfway into RAM, and for boards with 256MB of RAM or more we put
>> >       * the initrd at 128MB.
>> >       */
>> > -    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
>> > +    /* As hwaddr is a 64-bit number we need to cast it for 32-bit */
>> > +#if defined(TARGET_RISCV32)
>> > +    *start = (uint32_t) (kernel_entry + MIN(mem_size / 2, 128ULL * MiB));
>> > +#elif defined(TARGET_RISCV64)
>> > +    *start = (uint64_t) (kernel_entry + MIN(mem_size / 2, 128 * MiB));
>> > +#endif
>> >
>> >      size = load_ramdisk(filename, *start, mem_size - *start);
>> >      if (size == -1) {
>> > --
>> > 2.19.1
>>
>> Maybe I'm missing something, but wouldn't something like
>>
>>     uint64_t start_unclobbered = kernel_entry + MIN(mem_size / 2, 128ULL * MiB);
>>     assert(start_unclobbered == (hwaddr)start_unclobbered);
>>     *start = (hwaddr)start_unclobbered;
>>
>> work better?  That should actually check this all lines up, as opposed to just
>> silently truncating a bad address.
>
> The problem is that hwaddr is always 64-bit.
>
> Stupidly I forgot about target_ulong, which should work basically the
> same as above. An assert() seems a little harsh though, Alex reported
> problem was fixed with just a cast.

OK, I must be misunderstanding the problem, then.  With the current code, isn't 
it possible to end up causing start to overflow a 32-bit address?  This would 
happen if kernel_entry is high, with IIUC is coming from the ELF to load and is 
therefor user input.  I think that's worth some sort of assertion, as it'll 
definitely blow up trying to enter the kernel (and possible before that, 
assuming there's no target memory where it overflows into).

This won't happen with the default Linux setup, but could happen if users are 
trying to do something weird.

