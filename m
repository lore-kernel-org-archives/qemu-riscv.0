Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9Dhz-0003dI-0C
	for mharc-qemu-riscv@gnu.org; Wed, 27 Mar 2019 14:55:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h9Dhu-0003bJ-OV
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 14:55:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h9Dhq-0006FN-Uv
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 14:55:26 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:33228)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h9Dgk-0005Tu-Qc; Wed, 27 Mar 2019 14:54:15 -0400
Received: by mail-lf1-x141.google.com with SMTP id v14so12265401lfi.0;
	Wed, 27 Mar 2019 11:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4MNaBfl/QtwpVqpywl6sXQn48veW97MLsM8wa7nT8wM=;
	b=deFhZDwkebxxoNvlE9LYMZRHAD6ZsTOjgaVLi2waCf5RdXH+656CGrpiGCP7RsI3uK
	RSJ3CjUmZxWosp8hApmUMEH/66N/7CS7AoU3Jm84ntWBR2U6bPgo4el0mbLh0r3A9nyg
	sVL2hSIu7QCGGuKM8wZ1nkBn7tdMBDWVeXZomc+TO0q9h48M/gWZJeiDaDrRCcVNqnB9
	LZ+UgTT05oxCXVUJa9BNQDb3nxQZEmX3J3MgnSVN1j78WgZ4fCgL5xOTBWHv10KRxUzs
	h6jTE2Fit0R8Ep1e5lJ81CSp+fuJdAYp2GVNooBo5ce6gim4l13mBmEFtiMa5HqRCGTI
	mgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4MNaBfl/QtwpVqpywl6sXQn48veW97MLsM8wa7nT8wM=;
	b=Oxa0+ksOeWcSHMEGIEroaW8q9QOhHxeT0SVPhp8mi0r4YxWfhUpFFYuU8YcfXB5344
	psFuCvlYItxYEBq/MCG3W0HBU3CpnZBBO9W6nk5t7qMMPWruZBxXpw5Ws0f1uTvjOFM6
	KKy0T4eXyOxmTHSAH/HE0cudfB1+A0Nehs4O1Yvttchy6DGMrkbyERt5pef0AkhFQ9H1
	6i+sV4lOeSBf2s0P0+3eKJtL1LEFPuZOEaZ+SBs+OBQYrXrJ21MsXfaMCDX6IgPPkqmO
	tWfm4xadauhUDarzmezbxDHI9eIdt1cG4yOfapRdt4Wk9hmQmaxY5JXTQ4Vzdhmi7wEP
	cXhg==
X-Gm-Message-State: APjAAAU5QpPfDKFTFivt2r/3bkJwMNcbtkNlEbC61LCRu0Ajapsv1Kzf
	Qh9gv1NJFVUaJxgZueFQWcoOxwb5+bfvPm7YKz8=
X-Google-Smtp-Source: APXvYqx5vnEWOr9EtAE2JLdnlwqh6sEI2JsuCKalzsF2JVC3U1J7Q2B6Uq4a7Jy1+fh/Of8NLKaR2efZVCH6YIPUjUk=
X-Received: by 2002:ac2:42d4:: with SMTP id n20mr19130751lfl.21.1553712853361; 
	Wed, 27 Mar 2019 11:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553712571.git.alistair.francis@wdc.com>
	<51823496a00b8c8160f10b541275188b61dfd05d.1553712571.git.alistair.francis@wdc.com>
In-Reply-To: <51823496a00b8c8160f10b541275188b61dfd05d.1553712571.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 Mar 2019 11:52:53 -0700
Message-ID: <CAKmqyKOwK0gBUv3cn7RYAgbwhhUbfc1OBmmyNXnqwwWJj0HKxA@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"palmer@sifive.com" <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-riscv] [PATCH for 4.0 v2 2/2] riscv: plic: Log guest
 errors
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
X-List-Received-Date: Wed, 27 Mar 2019 18:55:27 -0000

On Wed, Mar 27, 2019 at 11:51 AM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> Instead of using error_report() to print guest errors let's use
> qemu_log_mask(LOG_GUEST_ERROR,...) to log the error.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

I dropped Philippe's review in this series.
This should be included from v1:

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Alistair

> ---
>  hw/riscv/sifive_plic.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
> index 70a85cd075..7f373d6c9d 100644
> --- a/hw/riscv/sifive_plic.c
> +++ b/hw/riscv/sifive_plic.c
> @@ -262,7 +262,9 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr=
 addr, unsigned size)
>      }
>
>  err:
> -    error_report("plic: invalid register read: %08x", (uint32_t)addr);
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
> +                  __func__, addr);
>      return 0;
>  }
>
> @@ -289,7 +291,9 @@ static void sifive_plic_write(void *opaque, hwaddr ad=
dr, uint64_t value,
>      } else if (addr >=3D plic->pending_base && /* 1 bit per source */
>                 addr < plic->pending_base + (plic->num_sources >> 3))
>      {
> -        error_report("plic: invalid pending write: %08x", (uint32_t)addr=
);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid pending write: 0x%" HWADDR_PRIx "",
> +                      __func__, addr);
>          return;
>      } else if (addr >=3D plic->enable_base && /* 1 bit per source */
>          addr < plic->enable_base + plic->num_addrs * plic->enable_stride=
)
> @@ -339,7 +343,9 @@ static void sifive_plic_write(void *opaque, hwaddr ad=
dr, uint64_t value,
>      }
>
>  err:
> -    error_report("plic: invalid register write: %08x", (uint32_t)addr);
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
> +                  __func__, addr);
>  }
>
>  static const MemoryRegionOps sifive_plic_ops =3D {
> --
> 2.21.0
>

