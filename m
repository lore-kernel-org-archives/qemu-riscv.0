Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjVyF-0005Pd-EJ
	for mharc-qemu-riscv@gnu.org; Tue, 15 Jan 2019 16:10:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gjVyD-0005OO-5E
	for qemu-riscv@nongnu.org; Tue, 15 Jan 2019 16:10:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gjVyC-0006AY-A1
	for qemu-riscv@nongnu.org; Tue, 15 Jan 2019 16:10:01 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40532)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gjVy9-00066O-Gu; Tue, 15 Jan 2019 16:09:57 -0500
Received: by mail-lj1-f196.google.com with SMTP id n18-v6so3602440lji.7;
	Tue, 15 Jan 2019 13:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Cdt//0HIvvd/w8G+G/hei023dumuTF3xxY6LPA6Jjqc=;
	b=sXhufJwJ8cNntVd/TP4WOll9MY5b4G1FQVJ/0KduBDZejgQlAv7XE/yQC0IcJwu00R
	F1k9VlQJOFHBfDQa7NR9AYHyMrd5swtY0BMCPNbgwWclNk7Cqonmq85nDLHCVPzb/ePy
	De1L4R6L3nd7Ddl3JcMYPg5+dWP8WCODk9Vr0ZpD0/+utPz09UGOFFdXk5Bmpdwp49cz
	BK7Tjzv6tjgFb6H3Tqt/ruft2LqZWwIFZcj7jc99KLwe8Ou9ouVmPw5RlFG5EgtYOYO/
	Oa1KHFRGdT+KqdilbAedAIsTCzZcgFQCrQIiVuWTqjDXPY3SIuyMFd0XBzul51sJIlYL
	CxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Cdt//0HIvvd/w8G+G/hei023dumuTF3xxY6LPA6Jjqc=;
	b=NBwPJSch1ngQwJs04k0E1sWjv6+817GtFO68rTQSHEf26/dcWn2XPNwVzjHT3x5JTw
	nz76/bJoj3HuZVH/B22xahcegw4t5TjSVyJdzeTtlK/6noWh1txpXAXvQYt1iyVfJE6u
	cQJIGKyymkPZAWVz9PqwRn0wAbBtH3kxdIHnvLocx5RVFF5PTnFekzftqb0JmehXnG36
	pGvAY5853fkQvoDAo+2JjUBGFFFIctbZmS2tHr/YRV98eZseceSi6jnAO+y18vtsu1kQ
	DxqZo9TTX8nv6vk46iB69udxIDe8zdzBB7jpc9VrSIcj8WcRkSjKEQZtOjSGWJ17LxUq
	MUhw==
X-Gm-Message-State: AJcUukeodLXBecTM7PQ1W/7CwIWq8TzCFK4xPK66m/5xTPETMKaZzOPX
	pvxC6QcfsuiTIxyHZxQR4QOQh6rc2Zz0Kpp5hSg=
X-Google-Smtp-Source: ALg8bN76O+0rUiGc7WnZKIMg2Wgt3qsqYd0ko+WFM+gyQAAztVtvFIZsC9X1PEQVRHKBALq5rUuvSaiCkPVjdSVVl8I=
X-Received: by 2002:a2e:4601:: with SMTP id
	t1-v6mr4331187lja.111.1547586595897; 
	Tue, 15 Jan 2019 13:09:55 -0800 (PST)
MIME-Version: 1.0
References: <d2ae859d3d73ec1897d78131e05a6cf6ba6c94b0.1547255794.git.alistair.francis@wdc.com>
	<56d71bbd-e86b-db1c-8d45-7dd229b87081@redhat.com>
In-Reply-To: <56d71bbd-e86b-db1c-8d45-7dd229b87081@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Jan 2019 13:09:28 -0800
Message-ID: <CAKmqyKN+PEt8=z_OUHngj5w6V6ZQ4r+U4uEDFrFayWXo8S+1tA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"agraf@suse.de" <agraf@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.208.196
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
X-List-Received-Date: Tue, 15 Jan 2019 21:10:02 -0000

On Mon, Jan 14, 2019 at 2:58 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Alistair,
>
> On 1/12/19 2:17 AM, Alistair Francis wrote:
> > Cast the kernel start address to the target bit length.
> >
> > This ensures that we calculate the initrd offset to a valid address for
> > the architecture.
>
> Can you add an example of the failure symptoms?

I can.

>
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > Suggested-by: Alexander Graf <agraf@suse.de>
> > Reported-by: Alexander Graf <agraf@suse.de>
> > ---
> > v2:
> >  - Remove old comment
> >  hw/riscv/sifive_e.c | 2 +-
> >  hw/riscv/sifive_u.c | 2 +-
> >  hw/riscv/spike.c    | 2 +-
> >  hw/riscv/virt.c     | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> > index 5d9d65ff29..e5d7fc548e 100644
> > --- a/hw/riscv/sifive_e.c
> > +++ b/hw/riscv/sifive_e.c
> > @@ -74,7 +74,7 @@ static const struct MemmapEntry {
> >      [SIFIVE_E_DTIM] =3D     { 0x80000000,     0x4000 }
> >  };
> >
> > -static uint64_t load_kernel(const char *kernel_filename)
> > +static target_ulong load_kernel(const char *kernel_filename)
> >  {
> >      uint64_t kernel_entry, kernel_high;
>
> Shouldn't you update load_elf() and co now to take target_ulong
> arguments? This would fix this error generically for all archs.

That is an option, but as load_elf() is called by every other machine
I don't want to break them. It's entirely possible that other machines
rely on this behaviour and changing it will break them.

Alistair

>
> >
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index 3bd3b67507..3b3acec377 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -65,7 +65,7 @@ static const struct MemmapEntry {
> >
> >  #define GEM_REVISION        0x10070109
> >
> > -static uint64_t load_kernel(const char *kernel_filename)
> > +static target_ulong load_kernel(const char *kernel_filename)
> >  {
> >      uint64_t kernel_entry, kernel_high;
> >
> > diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> > index 268df04c3c..79cb4c1282 100644
> > --- a/hw/riscv/spike.c
> > +++ b/hw/riscv/spike.c
> > @@ -53,7 +53,7 @@ static const struct MemmapEntry {
> >      [SPIKE_DRAM] =3D     { 0x80000000,        0x0 },
> >  };
> >
> > -static uint64_t load_kernel(const char *kernel_filename)
> > +static target_ulong load_kernel(const char *kernel_filename)
> >  {
> >      uint64_t kernel_entry, kernel_high;
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index e7f0716fb6..648462b18c 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -62,7 +62,7 @@ static const struct MemmapEntry {
> >      [VIRT_PCIE_ECAM] =3D   { 0x30000000,    0x10000000 },
> >  };
> >
> > -static uint64_t load_kernel(const char *kernel_filename)
> > +static target_ulong load_kernel(const char *kernel_filename)
> >  {
> >      uint64_t kernel_entry, kernel_high;
> >
> >

