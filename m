Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ggxBa-00077m-0M
	for mharc-qemu-riscv@gnu.org; Tue, 08 Jan 2019 14:37:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1ggxBX-00075Y-1h
	for qemu-riscv@nongnu.org; Tue, 08 Jan 2019 14:37:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1ggxBV-0008B6-71
	for qemu-riscv@nongnu.org; Tue, 08 Jan 2019 14:37:11 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34551)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1ggxBV-00082y-0n
	for qemu-riscv@nongnu.org; Tue, 08 Jan 2019 14:37:09 -0500
Received: by mail-pf1-x443.google.com with SMTP id h3so2422387pfg.1
	for <qemu-riscv@nongnu.org>; Tue, 08 Jan 2019 11:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=i2x6PpENGKZZDuKH/0obZdxaWDvODeIw82b9vGoneX8=;
	b=j15zLXpfXxOGW99VGXDKOMET3L9jqcrHWxSN43e5AlhEVE5Cac8hL4QEj8Luq/4DNQ
	G+6AHMBAkxQSOnTeyR8dn72ffloYhOypxWvDLyNhsjyVzHb1dwVNlbQkOQuRNmqKrKJJ
	nz1RYuCvV7Ug7bv/cpGvTraAVP/ncwRLFpUdJweBP3xoUY3rd0xD8trlVQNrf4VyBEHq
	lgQudA1m1kMU/DHFmwzVe/+NSXwCzxG8O8O5+TvangGij4OzkPHHGlW++DqP1PtpGDdJ
	SX7FcLSmCwyaL9LUx866aHEt097g9W2bspViNfJwhSr68y2+nGbLgAzGHZd167NAQw2r
	rGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=i2x6PpENGKZZDuKH/0obZdxaWDvODeIw82b9vGoneX8=;
	b=Uh3U5NbZXXldd/IARpAeeMp7RgymqOgaGYcbKJEZ56nUEkvwb6qiZX/rL+ubHvhcd3
	hg+03rYECy3KAOtbSJu2kTjdbh9rSGORODuNwtdJtuqYrFBjxg2Xu9TSKxnQDjvFl0GE
	8zwXr0URgodaBko8oy38+keENJcKCOcwLoWg/GRd8AE69U3lEi2xIvn+2Ui5hFcRR2BA
	sp/65WJv75cPChYP5liTuVqPqr1G+iuojVxN/u4PjEXA9z6wPlOqmEgMmuqiKOfqpjsU
	hkgim0BIHqCyb0VwmlkRfA+eICpMrEkFe3Q3d+YlAxzQBD6gMGUxEfTEMJ3RN4C0tZGG
	OMgg==
X-Gm-Message-State: AJcUukffJoKQot6OfkUyKBi69PKa3ncbGs7lPm6q+zBjOZDEhx3+IZCx
	gW7yv3mhz4mYE3BgCTEG9gh9i+m7wMo=
X-Google-Smtp-Source: ALg8bN4J6irPMscsawKsEYAXGqYL7Wuqdniw4XQdXk5kGifOJkBZmh0Wur/SadrtqmaBnykx6kIJBw==
X-Received: by 2002:a63:e545:: with SMTP id z5mr2663685pgj.195.1546976226379; 
	Tue, 08 Jan 2019 11:37:06 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	v89sm101861973pfj.164.2019.01.08.11.37.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 11:37:05 -0800 (PST)
Date: Tue, 08 Jan 2019 11:37:05 -0800 (PST)
X-Google-Original-Date: Tue, 08 Jan 2019 11:33:24 PST (-0800)
In-Reply-To: <CAFEAcA8t7V3XwkPCSKCPCd1qc=MxZcw2yjoHMW-NmTzGWMkbVQ@mail.gmail.com>
CC: qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Message-ID: <mhng-39a30073-8d69-47fa-863b-b38761d1e8de@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-riscv] Wiki Account Creation [Was Re: [PULL] RISC-V Changes
 for 3.2, Part 1]
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
X-List-Received-Date: Tue, 08 Jan 2019 19:37:11 -0000

On Thu, 03 Jan 2019 08:46:11 PST (-0800), Peter Maydell wrote:
> On Wed, 26 Dec 2018 at 17:20, Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> The following changes since commit b72566a4ffaddbc0c0c1f6f5ee91b42ab13ff429:
>>
>>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-patches-pull-request' into staging (2018-12-19 15:31:02 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-3.2-part1
>>
>> for you to fetch changes up to 7b91ae7d7944056c5e8045342e4039e978e43c82:
>>
>>   MAINTAINERS: Mark RISC-V as Supported (2018-12-21 07:57:15 -0800)
>>
>> ----------------------------------------------------------------
>> RISC-V Changes for 3.2, Part 1
>>
>> This pull request contains the first set of RISC-V patches I'd like to
>> target for the 3.2 development cycle.  It's really just a collection of
>> bug fixes with one major new feature: PCIe can now be attached to RISC-V
>> guests.
>>
>> This has passed my usual test of booting the latest Linux RC into a
>> Fedora disk image on the virt machine.
>>
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
> for any user-visible changes.

It looks like I don't have an account and I'm supposed to ask on qemu-devel for 
one.

