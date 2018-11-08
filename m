Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKpBq-0007uy-Kz
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 13:38:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gKpBo-0007tr-Mm
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:38:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gKpBn-0006DC-S5
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:38:00 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:45756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gKpBl-0006A5-LY; Thu, 08 Nov 2018 13:37:57 -0500
Received: by mail-lf1-x143.google.com with SMTP id b20so14924328lfa.12;
	Thu, 08 Nov 2018 10:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4FDgkvdWN9Ri4KerhOLlfH0oPRW/Ha1AIy2ZeVqnIe8=;
	b=QumruCPnDBS13dPpN+FyhiEYpSFnYyYS4BZgcG6BmYkUomLf3iAtYoRX6IyONnrBU+
	z6cKAQqldW+61iwL90ftNlr3DqBwbTKounYaVEmfkSnqSdnN/CvfmNpfAw+Mk/hJ7ga1
	kMmgtKifTH0AQI3LNWqBFmobB0PZxnnke09pLH+9qIamc+N3TSlVDleLD0UZRabDlha5
	dMWyWXt864iOIpVtiz2YKGbohtNXsnfwvIzgvgUmyiTOh6iXOHF9rClCfn7l47GOpM6i
	Tmak+/dcjRhLfB60co559O3c9CCffSgeSNpJAivdeh0pKBuxGZCosxPnGhHxbxAsDdw3
	BofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4FDgkvdWN9Ri4KerhOLlfH0oPRW/Ha1AIy2ZeVqnIe8=;
	b=Z6TCg6HoVxiRfwsCYyxv29HAe+D6tw9KLGMPzKL8ycQnUp6rHqi1P+WgeDg2Dr1gnY
	nbr5rkmB3IhSiWC4HJhK5QSPRPQomW7xJAoqEx5dLuzCPlDn1M27T8k7ouAA9yvQgywj
	dX8Kjk3H3OMEYxvmvfmYQaExf4WI3f74gqyk+qj49PKkWyr6M6Hb38vs0NHJvs1IEppX
	ZJJ2GRaTbt19CpLAVn1hMRVGJY1twVmJIZ28YCqMgtWmjQ/PS5mUCR9BG56PEOd/Up5d
	RSuMfsZgqe7Oq0hNH0UlVEDP7jnKIc3rmonO6J8H+o72SmqY7dSPWTkyGE19CtbzMeje
	NoqQ==
X-Gm-Message-State: AGRZ1gIM+5Zd55m+IwkSpGjcNxeuRsGmcXcfFAp8IVc8dmkb94YkY00L
	38ymyeqBDNxLkLcNa5oGQGnTJGaI2JPUBv5cTYM=
X-Google-Smtp-Source: AJdET5fHtDR2dxAyZKea9hhHdHRS3j12Pv0WSZCn1BjEd7N2Iqio94RPBO3CY+0Kd+Js2+zOsfPAm1IUlpvQD+QHc6M=
X-Received: by 2002:a19:8fce:: with SMTP id s75mr3400378lfk.151.1541702276275; 
	Thu, 08 Nov 2018 10:37:56 -0800 (PST)
MIME-Version: 1.0
References: <1793576616012e06e68cd9e0215eb907ff2ef12b.1541627403.git.alistair.francis@wdc.com>
	<mhng-2f508723-0da1-4d97-9e9e-cbc12898023f@palmer-si-x1c4>
In-Reply-To: <mhng-2f508723-0da1-4d97-9e9e-cbc12898023f@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Nov 2018 10:37:28 -0800
Message-ID: <CAKmqyKOXRVE_9fvrXMTXgtruV=UndnBC2oPPS7Qowqt=aqWP1g@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [PATCH for 3.1 v1 1/1] hw/riscv/virt: Free the
 test device tree node name
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
X-List-Received-Date: Thu, 08 Nov 2018 18:38:01 -0000

On Wed, Nov 7, 2018 at 6:38 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 07 Nov 2018 13:51:45 PST (-0800), Alistair Francis wrote:
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/virt.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 4a137a503c..2b38f89070 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -240,6 +240,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> >      qemu_fdt_setprop_cells(fdt, nodename, "reg",
> >          0x0, memmap[VIRT_TEST].base,
> >          0x0, memmap[VIRT_TEST].size);
> > +    g_free(nodename);
> >
> >      nodename = g_strdup_printf("/uart@%lx",
> >          (long)memmap[VIRT_UART0].base);
> > --
> > 2.19.1
>
> Thanks.  I got a bit behind this week so I didn't send the pre-PR, but I indent
> to send a PR tomorrow.  That PR currently only contains this patch.

There should be two patches. One for spike and one for the virt machine.

Alistair

