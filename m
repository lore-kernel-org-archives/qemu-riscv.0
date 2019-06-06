Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYrvj-0006eD-9M
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jun 2019 08:55:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1hYrvf-0006cU-TZ
	for qemu-riscv@nongnu.org; Thu, 06 Jun 2019 08:55:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1hYrve-0001Qw-Vr
	for qemu-riscv@nongnu.org; Thu, 06 Jun 2019 08:55:39 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:41192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
	id 1hYrve-00007s-PD; Thu, 06 Jun 2019 08:55:38 -0400
Received: by mail-ed1-x543.google.com with SMTP id p15so3172667eds.8;
	Thu, 06 Jun 2019 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qKOB3VuDlc0WnIjDjWXfVQ61z9FILkUE5p8n5dJH9dc=;
	b=HSRqDM0tkQEmFFNFlL+unjNbBWQvoAG9/CnVf9n/vhMBtPRbMmamPTPhForYIxZ/+p
	YITM5We/y5Z7jboRF8rImjP+C9bE/ARn2Fcy18nnX3b3vARt5GdLxj5Nj1NUbudBB4mw
	QMPTdw3mgrxxFWdNiuMQ8KU0rFPQATrvSzcouoYwvvUzlqXO9fb/GJJyJZqTBz2vuGGM
	HQ1exyIVdRoGkirKhgqbbPx+ZLwtAW0TJgxqEgpg/3+m9uzztzEJ+hLcX65x6Ba7QC95
	uqt09xDzHxNGFO+HWUo/evxK7wis2IeEMkE0hTou+rHmU3mQZn7JR9mJL40FGJXsHAUy
	XB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qKOB3VuDlc0WnIjDjWXfVQ61z9FILkUE5p8n5dJH9dc=;
	b=gtP/d2ht8WORSFuUplVwpUOqzJHUe75QyEtXC1ue25QO/LfHYVbuz7zfrPLj1ITyl2
	qXDXlLsBmEb8pmQ3WmPG2gDFOzT/hj1QO+L+gyLgSV625dyAdC7m4NHM3RY70e4+478i
	vwNNs3ifiCzLoB0ROzPLeanbjkhZq4x6AdCQSE6jKgyVmdiWuUKMIJ7oWaZIaQVppo33
	thXk2pND1idhbgDfhJACjz5vXsWkt8Knjy5gzkvQN6kRxYmYnz9orS7pmDmeo61pRr2o
	IqAJHbWzVSzBSAqQTPUZGE/oXOgQYAjxQh91DIQmY8CtRnzVOIEGlEbBF1u4NbhRauXo
	lO6Q==
X-Gm-Message-State: APjAAAWbyLisiREqSTawxxuf3/h78o6AVTXE4UGhsYOEbku3IZGzIaZ7
	+Em5Mq4jTbIygIwl/Z0T5pchLkNXsPww8bHFWt0=
X-Google-Smtp-Source: APXvYqwjGUkmJZOkoFUulGipThJG9uhva1jCC8X3EQmGowTjLHtn4+oDhgAMnT9rbETTeWhhvwY4vvSABAX2ppalOCU=
X-Received: by 2002:a17:906:1f55:: with SMTP id
	d21mr40274342ejk.87.1559825725039; 
	Thu, 06 Jun 2019 05:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <1559119921-6098-1-git-send-email-bmeng.cn@gmail.com>
	<CAKmqyKNAL8KtVgfCx6yhaNYEL=_wnZ5Vf1eSjxwtg0x6_q+UHw@mail.gmail.com>
	<CAEUhbmXLr3zXhbphXRvqfyW1FH9qo3yoPwnFoRoYNtbwkrBBKw@mail.gmail.com>
In-Reply-To: <CAEUhbmXLr3zXhbphXRvqfyW1FH9qo3yoPwnFoRoYNtbwkrBBKw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 6 Jun 2019 20:55:13 +0800
Message-ID: <CAEUhbmUAKoFPqBLVW4FHmiESaF8fqEtjqDb1LKf4ivG3g2z0ZQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: virt: Correct pci
 "bus-range" encoding
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
X-List-Received-Date: Thu, 06 Jun 2019 12:55:41 -0000

On Thu, May 30, 2019 at 11:36 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Thu, May 30, 2019 at 11:14 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Wed, May 29, 2019 at 1:52 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > The largest pci bus number should be calculated from ECAM size,
> > > instead of its base address.
> > >
> > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >
> > This seems ok, can you maybe explain what this fixes?
> >
>
> The logic is wrong, as the commit message said. With current wrong
> logic, the largest pci bus number encoded in "bus-ranges" property was
> wrongly set to 0x2ff in this case. Per pci spec, the bus number should
> not exceed 0xff.
>

Ping?

