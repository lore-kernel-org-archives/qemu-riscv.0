Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1koly1-00023v-UK
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 06:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1koly0-000235-RQ
 for qemu-riscv@nongnu.org; Mon, 14 Dec 2020 06:24:36 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kolxx-0000gS-UA
 for qemu-riscv@nongnu.org; Mon, 14 Dec 2020 06:24:36 -0500
Received: by mail-wm1-x343.google.com with SMTP id c133so1366354wme.4
 for <qemu-riscv@nongnu.org>; Mon, 14 Dec 2020 03:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/NSCbVd6e+qy7O5FsCXeMvWhTocDoPTA0meXlZiMzKs=;
 b=aRrUqYobwatuHi3+9cDc9iVJGCqBEx/OELizaPOvMviYNarPJOlHlFuHM2j8IgbkLN
 Bm/EiTvD0znwCxZ5nV+BaAZIEi2EoC1pVDMi7eW73OKYuLlGCziQC2qoXPCZTLFcMRxP
 YI5sru7kH+Ct7XLEIQ4pngv3ZstC1RRDFAn6lXUyWbkTveKUiW0lZwwj33LXHfqIGr+R
 KA98c4h/iHzVDtqqxuz3hkMwNEb9OlMTXWZLZoZHuqMvu1oq/j1rqjQmvWIvqyb3YzFc
 KW3bKk1NmcvqX6Mc1XPErkFEPlp3Y1rZ+N4Zab+J4+sRwamZ3TnGix6sfhYFD0Pyoy4H
 w3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/NSCbVd6e+qy7O5FsCXeMvWhTocDoPTA0meXlZiMzKs=;
 b=bgnOcL1kHv99MSSz8wCglxUWiZVqHLHgW/nZJhUGau8M1naQWFfQos3zwY9y/dqFEt
 ddrEw9+MWF87XgOMqsPj/1+sNyF+6HjMdTZ3xXp+1xt5VmXhuARUPBZHIh1Lds8qVU6N
 knXJR9VrDWM/XLiIAg/z6kZ7DS5ZrSZ7vjnYPwnUCGQ7ZtOuMjfIE30afH9IhTw8QY7o
 1pGN5MIRa6JEQJgm99qLhACqAhVfYr5IaMgwDmsiIeXMNqobBjj/8U9B/JqgAD97YDea
 1NqWkkYDp9WAVl3x6RmfSIpnxgF7WJs/MAsaNaBMtBpW1o2QAx8qRNEq8ON940WUqlkl
 /bjw==
X-Gm-Message-State: AOAM531LBnHg3x5lCskM7usT8Ug4cJQdeTuWpiVya0prZb6Lcu7sAs+m
 TsurgrSFJy5d0fOb4XKALFN+pA==
X-Google-Smtp-Source: ABdhPJxDXaswVqVsM0ax+x3tQzf8x3zaSBsmlR+J2v6KKfevaSAm5B/vu+/MlzTVUWcXfly3BLeQaA==
X-Received: by 2002:a7b:c925:: with SMTP id h5mr26756072wml.43.1607945072176; 
 Mon, 14 Dec 2020 03:24:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u10sm28839144wmd.43.2020.12.14.03.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 03:24:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 285731FF7E;
 Mon, 14 Dec 2020 11:24:30 +0000 (GMT)
References: <20201125213617.2496935-1-keithp@keithp.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Keith Packard <keithp@keithp.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Laurent Vivier
 <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: Re: [PATCH 0/8] Add RISC-V semihosting 0.2. Finish ARM semihosting 2.0
Date: Mon, 14 Dec 2020 11:24:23 +0000
In-reply-to: <20201125213617.2496935-1-keithp@keithp.com>
Message-ID: <873608vde9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 14 Dec 2020 11:24:37 -0000


Keith Packard <keithp@keithp.com> writes:

> This series adds support for RISC-V Semihosting, version 0.2 as
> specified here:
>
> 	https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2
>
> This specification references the ARM semihosting release 2.0 as specifie=
d here:
>
> 	https://static.docs.arm.com/100863/0200/semihosting.pdf
>
> That specification includes several semihosting calls which were not
> previously implemented. This series includes implementations for the
> remaining calls so that both RISC-V and ARM versions are now complete.
>
> Tests for release 2.0 can be found in picolibc on the semihost-2.0-all
> branch:
>
> 	https://github.com/picolibc/picolibc/tree/semihost-2.0-all
>
> These tests uncovered a bug in the SYS_HEAPINFO implementation for
> ARM, which has been fixed in this series as well.
>
> The series is structured as follows:
>
>  1. Move shared semihosting files
>  2. Change public common semihosting APIs
>  3. Change internal semihosting interfaces
>  4. Fix SYS_HEAPINFO crash on ARM
>  5. Add RISC-V semihosting implementation
>  6-8. Add missing semihosting operations from release 2.0
>
> Signed-off-by: Keith Packard <keithp@keithp.com>

Queued to semihosting/next, thanks.

--=20
Alex Benn=C3=A9e

