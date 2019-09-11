Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7y1H-0005vq-Pi
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58808)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1i7y18-0005mu-M0
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:30:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1i7y17-0000Q0-4h
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:30:22 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:34625)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1i7y0x-00007A-In; Wed, 11 Sep 2019 04:30:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3605D7456D6;
 Wed, 11 Sep 2019 10:30:00 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 04CEA7456CA; Wed, 11 Sep 2019 10:30:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 03AC47456D5;
 Wed, 11 Sep 2019 10:30:00 +0200 (CEST)
Date: Wed, 11 Sep 2019 10:29:59 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 "open list:PReP" <qemu-ppc@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, 
 "open list:S390-ccw boot" <qemu-s390x@nongnu.org>
In-Reply-To: <20190910193408.28917-3-alex.bennee@linaro.org>
Message-ID: <alpine.BSF.2.21.9999.1909111015260.4726@zero.eik.bme.hu>
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-3-alex.bennee@linaro.org>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1638113727-1568189959=:4726"
Content-ID: <alpine.BSF.2.21.9999.1909111026190.4726@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-riscv] [PATCH v1 2/4] elf: move elf.h to elf/elf.h and
 split out types
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2019 08:30:29 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1638113727-1568189959=:4726
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-ID: <alpine.BSF.2.21.9999.1909111026191.4726@zero.eik.bme.hu>
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Sep 2019, Alex Benn=E9e wrote:
> diff --git a/include/elf/elf-types.inc.h b/include/elf/elf-types.inc.h
> new file mode 100644
> index 00000000000..35163adb2b5
> --- /dev/null
> +++ b/include/elf/elf-types.inc.h
> @@ -0,0 +1,63 @@
> +/*
> + * Elf Type Specialisation
> + *
> + * Copyright (c) 2019
> + * Written by Alex Benn=E9e <alex.bennee@linaro.org>
> + *
> + * This code is licensed under the GNU .

You're missing end of licence sentence here. Also original file did not=20
have copyright and licence header so you may want to fix that too or leav=
e=20
it out here as well for consistency,

> + */
> +
> +#ifndef _ELF_TYPES_INC_H_
> +#define _ELF_TYPES_INC_H_
> +
> +#ifndef ELF_CLASS
> +#error you must define ELF_CLASS before including elf-types.inc.h
> +#else
> +
> +#if ELF_CLASS =3D=3D ELFCLASS32
> +
> +#define elfhdr      elf32_hdr
> +#define elf_phdr    elf32_phdr
> +#define elf_note    elf32_note
> +#define elf_shdr    elf32_shdr
> +#define elf_sym     elf32_sym
> +#define elf_addr_t  Elf32_Off
> +#define elf_rela    elf32_rela
> +
> +#ifdef ELF_USES_RELOCA
> +# define ELF_RELOC  Elf32_Rela
> +#else
> +# define ELF_RELOC  Elf32_Rel
> +#endif
> +
> +#ifndef ElfW
> +#  define ElfW(x)   Elf32_ ## x
> +#  define ELFW(x)   ELF32_ ## x
> +#endif
> +
> +#else /* ELF_CLASS =3D=3D ELFCLASS64 */
> +
> +#define elfhdr      elf64_hdr
> +#define elf_phdr    elf64_phdr
> +#define elf_note    elf64_note
> +#define elf_shdr    elf64_shdr
> +#define elf_sym     elf64_sym
> +#define elf_addr_t  Elf64_Off
> +#define elf_rela    elf64_rela
> +
> +#ifdef ELF_USES_RELOCA
> +# define ELF_RELOC  Elf64_Rela
> +#else
> +# define ELF_RELOC  Elf64_Rel
> +#endif
> +
> +#ifndef ElfW
> +#  define ElfW(x)   Elf64_ ## x
> +#  define ELFW(x)   ELF64_ ## x
> +#endif
> +
> +#endif /* ELF_CLASS =3D=3D ELFCLASS64 */
> +#endif /* ELF_CLASS */
> +#else
> +#error elf-types.inc.h should not be included twice in one compilation=
 unit
> +#endif /* _ELF_TYPES_INC_H_ */
> diff --git a/include/elf.h b/include/elf/elf.h
> similarity index 98%
> rename from include/elf.h
> rename to include/elf/elf.h
> index 3501e0c8d03..2e264c1a7a0 100644
> --- a/include/elf.h
> +++ b/include/elf/elf.h
> @@ -1696,49 +1696,7 @@ struct elf32_fdpic_loadmap {
> };
>
> #ifdef ELF_CLASS
> -#if ELF_CLASS =3D=3D ELFCLASS32
> -
> -#define elfhdr		elf32_hdr
> -#define elf_phdr	elf32_phdr
> -#define elf_note	elf32_note
> -#define elf_shdr	elf32_shdr
> -#define elf_sym		elf32_sym
> -#define elf_addr_t	Elf32_Off
> -#define elf_rela  elf32_rela
> -
> -#ifdef ELF_USES_RELOCA
> -# define ELF_RELOC      Elf32_Rela
> -#else
> -# define ELF_RELOC      Elf32_Rel
> -#endif
> -
> -#else
> -
> -#define elfhdr		elf64_hdr
> -#define elf_phdr	elf64_phdr
> -#define elf_note	elf64_note
> -#define elf_shdr	elf64_shdr
> -#define elf_sym		elf64_sym
> -#define elf_addr_t	Elf64_Off
> -#define elf_rela  elf64_rela
> -
> -#ifdef ELF_USES_RELOCA
> -# define ELF_RELOC      Elf64_Rela
> -#else
> -# define ELF_RELOC      Elf64_Rel
> -#endif
> -
> -#endif /* ELF_CLASS */
>
> -#ifndef ElfW
> -# if ELF_CLASS =3D=3D ELFCLASS32
> -#  define ElfW(x)  Elf32_ ## x
> -#  define ELFW(x)  ELF32_ ## x
> -# else
> -#  define ElfW(x)  Elf64_ ## x
> -#  define ELFW(x)  ELF64_ ## x
> -# endif
> -#endif
>
> #endif /* ELF_CLASS */

Is there anything remaining in this #ifdef ELF_CLASS after this patch? If=
=20
not why do you keep it?

Regards,
BALATON Zoltan
--3866299591-1638113727-1568189959=:4726--

