Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8uVJ-0000Yr-Dx
	for mharc-qemu-riscv@gnu.org; Tue, 26 Mar 2019 18:25:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h8uVF-0000Cz-Ix
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 18:25:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h8uR6-0000Bc-TA
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 18:20:49 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:44549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h8uR5-0000B5-IF; Tue, 26 Mar 2019 18:20:47 -0400
Received: by mail-lj1-x241.google.com with SMTP id h16so8120798ljg.11;
	Tue, 26 Mar 2019 15:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N+R17ccxjzsApgKTqfojKuz9eLObRWgQdCrJJoJxatE=;
	b=jYqa7lChNHEEbq6L1BPMgveKvJ5/9qVdHDDGQWfcHoIkr1znoivvfa2lI2t1Fb1lcX
	syCU/IT+eYOTDXmIKdjwhHFfAbLLW8hrLugxb/WIaJuhb7u2aGD14Cky8/AJpnNMboRB
	PHYEUex29pFKTQRCEh77ZZQQYCH/0ZnznV73tQZK8mKmipUETGCO9lvcS3kpdLxYf2e9
	QJLVK1s2XfY2QkOjOr2sPUEJ5zjtbc1zZdoGXJw0+SgsvcnpvpvzIIoYcJ0DWFe17J34
	h91qmP9pkq7ecjwTPAgQKkZQSAU7VkPCCw+TT9Ee3LnI0yWLhBzI5vbzMoeEKUkq7juo
	8h3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N+R17ccxjzsApgKTqfojKuz9eLObRWgQdCrJJoJxatE=;
	b=D1B5GP2OOTrwfDwDuyWyY2i/oQvf7ZkdNNbnq5RO6FejntDWDx3zHYmwuobBNxA2lK
	gXNwg5G9e64y4izdvI8sz1XDJ3cxU4L136h6O2xe3+ZcLc97y+hRv7O20IcvRWsvJcta
	is0BGQCRjTfd/beR10UNsgZEb4e+llx2VOXdVSdJD6lS9Pc4tJkzZgE/9b/Rjtdj4F7Y
	iYFc+oOu+QeJgs+Nab3s9NZ/uw7nlDbI1MavyLX/yWt6Xsn2oe6v1wOt6RbN6XD8umIS
	rGtMlmTc0l+37yBohlTYKahZa9bXPmWgVBYrWsQUF+1+/x8jb/pS17GQqhreaxItcOub
	z2bA==
X-Gm-Message-State: APjAAAVWC5S2viv9kRRbCZEu0RUgtGuBPSuyb6WpavK0j3LgUjMesfGK
	Unp1ut45di7ccY709N9TF+gjbR5saf6QmT8K1hw=
X-Google-Smtp-Source: APXvYqysdPNi3yY9wH9/d7vET8ku+sznbX01aBq9Nu20m+adjQEvJY4iwRywbplUbX49NtJAxW/uk7W/5vulNFgdOeg=
X-Received: by 2002:a2e:8ec5:: with SMTP id e5mr17609225ljl.7.1553638846079;
	Tue, 26 Mar 2019 15:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553129005.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553129005.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Mar 2019 15:19:25 -0700
Message-ID: <CAKmqyKNwBe+mfDDDw3gW_avKCpNAfb=0Y6kngb4fJ+jEHpSuVg@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"palmer@sifive.com" <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [PATCH for 4.0 v1 0/5] Update the QEMU PLIC
 addresses
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
X-List-Received-Date: Tue, 26 Mar 2019 22:25:08 -0000

On Wed, Mar 20, 2019 at 5:45 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> This series updates the PLIC address to match the documentation.
>
> This fixes: https://github.com/riscv/opensbi/issues/97
>
> Alistair Francis (5):
>   riscv: plic: Fix incorrect irq calculation
>   riscv: sifive_u: Fix PLIC priority base offset and numbering
>   riscv: sifive_e: Fix PLIC priority base offset
>   riscv: virt: Fix PLIC priority base offset
>   riscv: plic: Log guest errors

Ping! Can this make it into 4.0?

Alistair

>
>  hw/riscv/sifive_plic.c      | 16 +++++++++++-----
>  hw/riscv/sifive_u.c         |  2 +-
>  include/hw/riscv/sifive_e.h |  2 +-
>  include/hw/riscv/sifive_u.h |  4 ++--
>  include/hw/riscv/virt.h     |  2 +-
>  5 files changed, 16 insertions(+), 10 deletions(-)
>
> --
> 2.21.0
>

