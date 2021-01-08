Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ky0Jp-0001Qi-7w
	for mharc-qemu-riscv@gnu.org; Fri, 08 Jan 2021 17:33:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0Jk-0001Pj-3A
 for qemu-riscv@nongnu.org; Fri, 08 Jan 2021 17:33:12 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0Jh-0004tc-4R
 for qemu-riscv@nongnu.org; Fri, 08 Jan 2021 17:33:11 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a12so10357920wrv.8
 for <qemu-riscv@nongnu.org>; Fri, 08 Jan 2021 14:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JV+V99tt4EQveY06Mm4McJZehVQDN620TryUZlVZr5U=;
 b=ZXkAe5PL5VggHFWOH407981UnXQ/rWErsV9kbX2N6oAwXK7eTTCsnp25uo17z5SNea
 j+1sIo3SaCMWZjlhqyM/YskpQieW2oTfL0WAS0CPpfDtc+C2B/q0t6sowRuet6YaMp24
 XFWY6TmZvD+AUjniaTNh5KyDmGDQTPb49an3BRsME7K7TavXb6YTu5L/LcKNa9EL8cCu
 9RKNlPE76N6SCulGWcdaIjfMoX/Rh5g8oQmhOL39m+0oLLQ2+wUBC+ad92U1mBXHBnNC
 HYVkOn3pnqRasr3JS5bXQu0oMYpLGcfNU2SoNn77W4Mfa4q2D5Lx1SBva01Q4qTK6va9
 +yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JV+V99tt4EQveY06Mm4McJZehVQDN620TryUZlVZr5U=;
 b=HAWJPdR8EOHv2K0KUObMNoRCZdp6aNE+uTatvtioy9/+bkcnCGMAUjasqMx7eA6tJ8
 /NWe4JrpRltNZ8aredRZWJSidDpfjGvVM6FuympXSKJFSg21Gc/kaZERhRf2ujSfFwAy
 HI/3v/O+oLDDguT1kpdmXHHSUD60Wt0veP/hIz0oKqX2GKkjXt1GFzjk5wJjpxUiSnp4
 i4rW4Ddp5Hv+op5ojVDQC4BX/27/H+Pf+rw/T9GgTsQU1Mx4q8uW12HXAbVHS0sDGUMb
 ORBxs6WEia3jyUObYVzcApAqioEkaHns/9LehkEW1HITxzJWnz/2JUXfi37RNRlCaYIu
 eXAw==
X-Gm-Message-State: AOAM530sdPq8n+70zSJ7C/FdMVJmKgkEY6Q6RmXOARbnHuqljAEaHqM0
 uiQnbeEWiPPpqGCwofgn3i+izQ==
X-Google-Smtp-Source: ABdhPJztM2AwqFao3hRN6xK5I88EEJLwP7ACRM+wdZ3IwRSwmVPLuc5oBddOreaQZtM09re12VwuYA==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr5361404wrt.223.1610145187532; 
 Fri, 08 Jan 2021 14:33:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c81sm13843090wmd.6.2021.01.08.14.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:33:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E5FC71FF7E;
 Fri,  8 Jan 2021 22:33:05 +0000 (GMT)
References: <20210107170717.2098982-1-keithp@keithp.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Keith Packard <keithp@keithp.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Laurent Vivier
 <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: Re: [PATCH 0/9] Add RISC-V semihosting 0.2. Finish ARM semihosting 2.0
Date: Fri, 08 Jan 2021 22:32:57 +0000
In-reply-to: <20210107170717.2098982-1-keithp@keithp.com>
Message-ID: <87turrys7y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Fri, 08 Jan 2021 22:33:12 -0000


Keith Packard <keithp@keithp.com> writes:

> This series adds support for RISC-V Semihosting, version 0.2 as
> specified here:
>
> 	https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2
>
> This specification references the ARM semihosting release 2.0 as
> specified here:
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
>  5-6. Add RISC-V semihosting implementation
>  7-9. Add missing semihosting operations from release 2.0

Queued to semihosting/next, thanks.

--=20
Alex Benn=C3=A9e

