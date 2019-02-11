Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtLJ9-0002Jc-Ae
	for mharc-qemu-riscv@gnu.org; Mon, 11 Feb 2019 18:48:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gtLJ6-0002Ir-ID
	for qemu-riscv@nongnu.org; Mon, 11 Feb 2019 18:48:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gtLFv-0003es-KV
	for qemu-riscv@nongnu.org; Mon, 11 Feb 2019 18:44:56 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:40968)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gtLFu-0003Kc-6b; Mon, 11 Feb 2019 18:44:54 -0500
Received: by mail-lj1-x244.google.com with SMTP id e17-v6so578379lja.8;
	Mon, 11 Feb 2019 15:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XeTmi5rcEbruuRp2nnvRBJPgj6PAFmTOM5VEmY7fwss=;
	b=I3Qxme2DxGIuIbJPhzrNwnimNZE5a6KId+Xb+QjJdQHvu3Lzaz2N4KC9/uMzesA3+b
	Hh9nvrXlPYL3iteGU3HWhQnbFyJ8KJswBJwaGNqZppLpZ9G2bKii5fs4P2jki1Nqa37R
	3dRMW/g8pLbHCEnB9hXrFJAD9l9wEy3KXDVHEborsciw+/RgKwYVKaEm2wJo9E3erAPm
	lUnsALeI9I/pmVQzBhZeFMWwYKcHmUkYlLIYfTahe3nCPg4AD6LLYn/gLtKvPC33x3ei
	q5uuOTXo1B0pwM6F/63/pkRHWr8OtC1c0GpQfF98dfllR0vmEFw1rSZ08Y+EPnsRauSt
	1PMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XeTmi5rcEbruuRp2nnvRBJPgj6PAFmTOM5VEmY7fwss=;
	b=ZeCPGyJY8SRGizxIt0V4Qt3n8ZDKZ/qV+ouG9L0MnepRRSTFfB1Y00SDllw1miG+Jg
	pSz91ejwVA7gSSLDw+ARsEqiOFWOBbD13+if+IWEX/4A7hUrOQuNwf1oAgzc9GjNEQpR
	J1QHkuxyqNhbU5eWfN3mM89wc051TOByhtUGbIEvJ+i46bgfz1/oD4rDiELfbkKTmoSo
	YRA54vjLi1telHDLCDTNdi7vCu+e+96UjLpAdHDtlSmZbm4AURu2DxRk5ZSnm4sht3XR
	mgb9Do8E7HUSLjYE6rLx7GTBHmQO9HeKussDRsq54kC2da2z8tV+0vulVvzKCQfUzhbm
	BRQQ==
X-Gm-Message-State: AHQUAuYikvqcYYXHgUPhYUduY93JWUaVpNT8UW/ms+s//jPqEhNPEUAK
	sZfyokgzJ+XiPtctsSPMLbmbE1qvtDKVkAlEc9Q=
X-Google-Smtp-Source: AHgI3IauIP6tJmL3S9CJANn58JpIbfQy0jIevX8HV/BOuHQMjlSP2uyni1M/No3p+9g8XnRlVLZejYjFS4uTSAzwdgU=
X-Received: by 2002:a2e:9516:: with SMTP id
	f22-v6mr406356ljh.191.1549928678019; 
	Mon, 11 Feb 2019 15:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
In-Reply-To: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Feb 2019 15:43:57 -0800
Message-ID: <CAKmqyKPXLgqqnQn3hMiE=6XPB9hyh2yu=E6zEYnMOiMd54XNgA@mail.gmail.com>
To: Lukas Auer <lukas.auer@aisec.fraunhofer.de>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, Michael Clark <mjc@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] hw/riscv/virt: re-add
 machine-specific compatible string to /soc/ node
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
X-List-Received-Date: Mon, 11 Feb 2019 23:48:13 -0000

On Sun, Feb 10, 2019 at 2:12 PM Lukas Auer
<lukas.auer@aisec.fraunhofer.de> wrote:
>
> Re-add the previous compatible string "riscv-virtio-soc" to the soc
> device tree node to allow U-Boot and Linux to bind machine-specific
> drivers to it. The current compatible string "simple-bus" is retained.
>
> This is required by U-Boot to bind devices early, as part of the
> pre-relocation driver model.
>
> Fixes: 53f54508dae6("hw/riscv/virtio: Set the soc device tree node as a
> simple-bus")
> Signed-off-by: Lukas Auer <lukas.auer@aisec.fraunhofer.de>

This looks fine to me.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/virt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3e8b19c668..c53bb905ff 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -157,6 +157,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>      char *nodename;
>      uint32_t plic_phandle, phandle = 1;
>      int i;
> +    const char soc_compat[] = "riscv-virtio-soc\0simple-bus";
>
>      fdt = s->fdt = create_device_tree(&s->fdt_size);
>      if (!fdt) {
> @@ -171,7 +172,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/soc");
>      qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
> -    qemu_fdt_setprop_string(fdt, "/soc", "compatible", "simple-bus");
> +    qemu_fdt_setprop(fdt, "/soc", "compatible", soc_compat, sizeof(soc_compat));
>      qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
>      qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
>
> --
> 2.20.1
>
>

