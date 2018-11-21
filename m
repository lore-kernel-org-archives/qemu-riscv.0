Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPY1c-0005xY-Lg
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 14:19:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPY1a-0005vz-4b
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:18:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPY1Y-0007rT-V3
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:18:58 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:41111)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPY1W-0007oh-6u; Wed, 21 Nov 2018 14:18:54 -0500
Received: by mail-lj1-x244.google.com with SMTP id z80-v6so5833522ljb.8;
	Wed, 21 Nov 2018 11:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Xh9inzM6FqvsP5ckv8wI44rXNBMcaXXnS5XxMNA9PhI=;
	b=P0WagUdI+b5t6xOrZTqhRC8QhLOHqQGOo/D/NK49pp9qw+1DL8XerSKnf1vMLUtNgy
	qojcXHYJILduTQBgGEUoTktDMVpd82q6OBEl1KfVNuOXlnD9yzLX6hpK5AIt3aouQvlm
	TPWP/9k9lDJ7WG4Ga9ROBNUQFW06z96coPKECRQztbU7s+VdV93A8VTGoq6hYyGTxDVm
	5y4yljaMviGHAxCDlY6pEGfyygIkRGpGgWcRtMm4d9xnu/U75s8t8meXdd0HCLsIdiKz
	B1+KhhsZDlR71fcw3Q6iqP95dokk1dB8FNdIkehuO1mGYDzlVyOL+WW4vOjF8BswvuOI
	ORxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xh9inzM6FqvsP5ckv8wI44rXNBMcaXXnS5XxMNA9PhI=;
	b=Zu22Uwj7SJfDQqqtPQMu8eBgu+jtkq4LZBu6JuItioIYPMJ4nGgNZ8GMM/+/RmPOj9
	A1XU6u+5V8hKNx99a4HAhDnnnc7BqidDu9BDkRAWgBqbTiUf/AyQ2ckvTbILa0LEJOCE
	v6792j2FxBgwYKC4bChf9m3VnOQRlG1pHFaHd8kGYEQDdtWC83150lX3xVfOxw+lEMaw
	JTU8VDyeeT1GUJ10AXcKZw9kEVD9oOontcF10YOCuGhAY/KscWMi6OP3Fx+fXwukzkGP
	YIZCl+Bgj9AXgDKkSh7/9VU109ME1a6q11fp7felH5DWYvGVpswMuRT0T2uxi8LrzFPD
	bwZQ==
X-Gm-Message-State: AA+aEWZV/anvQr8nDMRzeCuc2pbqZetuenG3rrY4VQQSOnR5QC7oHmuK
	AG9frDnpTrDZyHDxv3OvV+zzpexAK7oE6jzg/PQ=
X-Google-Smtp-Source: AJdET5fDVjwXRt70H/uunfHEyOtRmXUkxEsqasmvTH2oOVNLY9x8QqSBpHw3/2Wb4IurrxNlSw8Y07IPolwE9FVnC40=
X-Received: by 2002:a2e:4601:: with SMTP id
	t1-v6mr5232718lja.111.1542827932327; 
	Wed, 21 Nov 2018 11:18:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<85a3fe487514f4cb659ef7e6b88762ebc567c1b8.1542819633.git.alistair.francis@wdc.com>
	<e7398997-ba1a-9182-6be0-da8e43e920df@deltatee.com>
	<CAKmqyKMtTqi=D-PKZFnt40MaA8+e6Sj8nUr0VmBFajScw1MYng@mail.gmail.com>
	<ffd80fff-55bf-0578-4fe5-00f07ef6bdc6@deltatee.com>
	<CAKmqyKMhpAPXFF5cQkqKYcNjD5aciDW7Ek53+W=1XNp3RGFLmw@mail.gmail.com>
	<1abdea1e-57bd-b841-a924-259baa3b9033@deltatee.com>
In-Reply-To: <1abdea1e-57bd-b841-a924-259baa3b9033@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 11:18:25 -0800
Message-ID: <CAKmqyKP2yrQax=+qO6q5qncLdUNUpWY2PGW1eCgO104p7CzV6g@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 5/6] hw/riscv/sifive_u: Connect
 the Xilinx PCIe
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
X-List-Received-Date: Wed, 21 Nov 2018 19:18:58 -0000

On Wed, Nov 21, 2018 at 11:15 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2018-11-21 12:02 p.m., Alistair Francis wrote:
> > On Wed, Nov 21, 2018 at 10:50 AM Logan Gunthorpe <logang@deltatee.com> wrote:
> >>
> >>
> >>
> >> On 2018-11-21 11:32 a.m., Alistair Francis wrote:
> >>> That seems like either a kernel or bbl issue.
> >>>
> >>> You need to make sure that bbl doesn't edit the device tree (to add
> >>> the Microsemi device or remove the Xilinx one) and ensure your kernel
> >>> supports the Xilinx one.
> >>
> >> Ok, how do I stop bbl from editing the device tree? I have a kernel with
> >> Xilinx PCI support but it fails initializing on that machine (see below).
> >
> > You should just be able to edit the source, grep for "microsemi".
>
> I don't see any "microsemi" in my riscv-pk source...

msemi maybe?

The compatible sting is: ms-pf,axi-pcie-host

Alistair

>
> Logan

