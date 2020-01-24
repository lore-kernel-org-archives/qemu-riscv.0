Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuwPx-0000y2-De
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jan 2020 05:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iuwPv-0000xl-NL
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 05:42:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iuwPu-0002fn-D5
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 05:42:23 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38519)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iuwPu-0002dz-4z
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 05:42:22 -0500
Received: by mail-wr1-x441.google.com with SMTP id y17so1387105wrh.5
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2020 02:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=56X4lhl7aUsrpjShD+4augsF21pKrzc55x7wSaRwTgQ=;
 b=NUP+aFt/Wp2O9lVrcoF3I3kWqJitIZlkZpebR+wHFsHCLre7xhIAlbkFh2GeenmL+/
 GRiThvSbYjYHnhI5lolFYa+WzX83NEHxqRPx6AuYavPzrvdyTOtpKYQ1iQlDeUq4SuKQ
 63YQinYBVHbFCLyT1iiQx8d9BvXXa4FqkGpa90/kpFtt8OC465xr2jWR5vwI8xXLlCeg
 0/TiF/BxdwQckmKN2yYUNSNVI8OXiqffkVyF6mxs/JT1NDqUS1vf/B/XkJF0FdjFOO4g
 NFSehBuQTeUKFJeKeD/EUbw8khXQfnPGRztK8QWkLvtxUmXAlbYSYUlV+tMhHxqzFKDa
 IXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=56X4lhl7aUsrpjShD+4augsF21pKrzc55x7wSaRwTgQ=;
 b=GF1GJuwJbCS8dfxNZjnGNGDptxd29oO+gRC+9/NOn+WjEPbUgAXeH//QAm2kkR36AI
 rYNf6K3JCbL8xPtl21qJMyn68e7+Tkwc1a+K2m2S6YHQwnkxsaJw2FzbFUraEgNDO9T6
 nWO2q8zyoEULi8Fpuaf19It4C7AUdMcQVmrm2Q7orcBXRRVPoeULSY1xzNb3xk3zkaln
 +9u88uLw8atxnBS4buuJ/EFtgF+2xh0jHkGZ/TT1H+xifWjTqHNcSmHIKnTKUtUM7TOi
 fO+BrdadSEhImySZb4xypVgsLCTnuYBmQH492Al/QN5c2FO8ajWQts1vVlAmTmGSPzuq
 Nytw==
X-Gm-Message-State: APjAAAVf89Nx+apfkdBvrd4+H2ghF78U83sln7YkeEhnCMDrOSngLYoM
 N2ayHTRqebxeyCiKFUmTkrlPBQ==
X-Google-Smtp-Source: APXvYqw2ELldAEOVUsONVf6STrTmfIEZ4vnSByUyHFX7DixVZ6YtEb4zeLjZ+IjXNAxJ7zoH/8sGfQ==
X-Received: by 2002:adf:fa43:: with SMTP id y3mr3544652wrr.65.1579862540848;
 Fri, 24 Jan 2020 02:42:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f1sm7021817wro.85.2020.01.24.02.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 02:42:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 18C7A1FF87;
 Fri, 24 Jan 2020 10:42:19 +0000 (GMT)
References: <20200124005131.16276-1-f4bug@amsat.org>
 <20200124005131.16276-13-f4bug@amsat.org>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, mrolnik@gmail.com, richard.henderson@linaro.org,
 me@xcancerberox.com.ar, Alistair Francis <Alistair.Francis@wdc.com>, Paolo
 Bonzini <pbonzini@redhat.com>, S.E.Harris@kent.ac.uk, thuth@redhat.com,
 qemu-riscv@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, imammedo@redhat.com, Markus
 Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Fam
 Zheng <fam@euphon.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eric Blake <eblake@redhat.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, aleksandar.m.mail@gmail.com, =?utf-8?Q?Marc-A?=
 =?utf-8?Q?ndr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, dovgaluk@ispras.ru, Eduardo Habkost
 <ehabkost@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH rc2 12/25] hw/timer: Add limited support for Atmel 16
 bit timer peripheral
In-reply-to: <20200124005131.16276-13-f4bug@amsat.org>
Date: Fri, 24 Jan 2020 10:42:19 +0000
Message-ID: <875zh1yw38.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-List-Received-Date: Fri, 24 Jan 2020 10:42:24 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> From: Michael Rolnik <mrolnik@gmail.com>
>
> These were designed to facilitate testing but should provide enough
> function to be useful in other contexts.  Only a subset of the functions
> of each peripheral is implemented, mainly due to the lack of a standard
> way to handle electrical connections (like GPIO pins).
>
> Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
> Message-Id: <20200118191416.19934-13-mrolnik@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> [rth: Squash info mtree fixes and a file rename from f4bug, which was:]
> Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [PMD: Use qemu_log_mask(LOG_UNIMP), replace goto by return]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
<snip>
> --- /dev/null
> +++ b/include/hw/timer/atmel_timer16.h
> @@ -0,0 +1,94 @@
> +/*
> + * Atmel AVR 16 bit timer
> + *
> + * Copyright (c) 2018 University of Kent
> + * Author: Ed Robbins

No sign off from the author here?
> --- /dev/null
> +++ b/hw/timer/atmel_timer16.c
> @@ -0,0 +1,605 @@
<snip>
> +
> +/* Helper macros */
> +#define VAL16(l, h) ((h << 8) | l)
> +#define DB_PRINT(fmt, args...) /* Nothing */
> +/*#define DB_PRINT(fmt, args...) printf("%s: " fmt "\n", __func__, ##
> args)*/

Format strings are likely to bitrot. Either use a if (GATE) or
tracepoints.

<snip>

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

