Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKfuG-0000b9-W3
	for mharc-qemu-riscv@gnu.org; Fri, 12 Mar 2021 06:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKfuF-0000a4-A4
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 06:24:35 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKfuD-0004FJ-Ll
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 06:24:34 -0500
Received: by mail-ed1-x536.google.com with SMTP id bx7so7420887edb.12
 for <qemu-riscv@nongnu.org>; Fri, 12 Mar 2021 03:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jdrERCIId53JZOmbF/W+6yOqQeKiCLJGK0R9ZuscgJc=;
 b=n0c966vgojfYkIBr9pbnsU1wVasOtU9V6dqqI9lTWaY8H1RHE8ZWDxKeluMDCBt9lL
 d8TNpiQ5cZJo6nCo6DUiAny3lKbja0mYK1Gp3E/1wL1H28KmIqWzxjdMZO8XDGWqbBMX
 vGIq0Xfwiy0SAcDnuwfI9qWArrev590dDPdSp0032mV4qI93nTN+NkVUT64g7JmgwFRY
 pR62iFp8RxTSXBUfsGpE2TJLeggZI598n2rxkWBXBloQfyAY6np2xy1DfX05ydlDySdt
 lMCahzkH1nBQkny0CIZSXcAdcY8eN/vA2Ri7Kdi4oOlZEgJwFk37ezdNBomXN5B5rcC1
 Tz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jdrERCIId53JZOmbF/W+6yOqQeKiCLJGK0R9ZuscgJc=;
 b=XGYiFQbgJNjc4IketWPCnA18DTjlZ0o/9cKdhtnzj0nJFjuG/UoA4xPrGYN5Rw9Oyv
 9meMu6EDsJPD7eHVIU3FnmhW10aX9bJZBuGxE/ondHtiHVeefAJ2BDZANvdJg7iT5VM5
 GqKkU53ir5YHHzST480IY0kq/l9BYDKRt3oU9gDn4MfJvHHssIbP/lHudGBosvoq/M2Q
 ttBeRRVtKH1kAkFE6wgWhaWhucAvTq6yXcnR8uHKIxfJpTuSCvarNi4eVw4/GMYLmZ2d
 09vBQncLk+tCoyeS4YrLWH2DXsI+j8w489Wlu3vWMKPgNo64URW3aYhOfEgh9WElHNky
 s5jQ==
X-Gm-Message-State: AOAM530dmZoOVDe0oWZTk/CTpw+GBS29InfQ8FHtvNZWfCKUFJzMyRC5
 5Cod+RYpsJt3f3F1Mp2JyF/k+A==
X-Google-Smtp-Source: ABdhPJwj5/uZJnuk9PypIlzMwzaGxeqLqotY+U1lF5MRaSko59hSrWbo7cH+oyy9ENuPg49w5+KfaA==
X-Received: by 2002:aa7:d588:: with SMTP id r8mr13467295edq.88.1615548271754; 
 Fri, 12 Mar 2021 03:24:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c19sm2772387edu.20.2021.03.12.03.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 03:24:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 350231FF7E;
 Fri, 12 Mar 2021 11:24:30 +0000 (GMT)
References: <20210312102029.17017-1-alex.bennee@linaro.org>
 <20210312102029.17017-6-alex.bennee@linaro.org>
 <CAFEAcA_7OKauefw7ehAnqF6jmaqWPvNyVba+G2wg+xxsUgpZhQ@mail.gmail.com>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Keith Packard
 <keithp@keithp.com>, qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v5 5/5] tests/tcg: add HeapInfo checking to semihosting
 test
Date: Fri, 12 Mar 2021 11:23:05 +0000
In-reply-to: <CAFEAcA_7OKauefw7ehAnqF6jmaqWPvNyVba+G2wg+xxsUgpZhQ@mail.gmail.com>
Message-ID: <87a6r8ehsi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 12 Mar 2021 11:24:35 -0000


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 12 Mar 2021 at 10:31, Alex Benn=3DC3=3DA9e <alex.bennee@linaro.or=
g> wro=3D
> te:
>>
>> Query the SYS_HEAPINFO semicall and do some basic verification of the
>> information via libc calls.
>
> Are we both testing system emulation and linux-user, or just one of the t=
wo=3D
> ?

Currently just linux-user. There is no inherent reason we couldn't add a
system emulation test but I felt that was already reasonably exercised
by your semihosting tests.

> (Not that I want to hold this up if we're only testing one, but coverage
> of both, including M-profile, seems like it would be useful; cf also
> https://bugs.launchpad.net/qemu/+bug/1918302 which is M-profile system-em=
ul=3D
> ation
> SYS_HEAPINFO being broken in 5.2.)
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

