Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKf9Q-0007R4-Fo
	for mharc-qemu-riscv@gnu.org; Fri, 12 Mar 2021 05:36:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKf9O-0007KH-Qv
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:36:10 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKf9L-0006Qe-WB
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:36:10 -0500
Received: by mail-ej1-x62a.google.com with SMTP id mj10so52396022ejb.5
 for <qemu-riscv@nongnu.org>; Fri, 12 Mar 2021 02:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QIlk9LvhQp53wile749dfAuASdvHoE4JnQgGoddGVB4=;
 b=Mqcl9s7Dgn8+/gDxpUKbBCgMIOZVwudNDLam7vNLMIdVEaMTCex7C8zyfhs9qgezxa
 Xhd5+pj3McheVojDJu5wEOHLD0rZpJbOqQktqY31/09aQbqDyXZx55N9sY+LQSRF8+/K
 7OXyVreZNM4SDchw4RbuqAd4sDSR49/kRsbANb+slk+biN5vKjNAtqfMzbo3+zh1OZNc
 XK/ovrhVZZtHEZQKQW4b1x5BWUYYfAmjPtoodk3L/O4ybUcjzeLIxA0hGDE96eWpAmAh
 JGM3f0k9QH3fBoUtVAb0UomiDDXZYzLb5esHTad+afD91yC/RVfABkT51Tse8htLXnS5
 dspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QIlk9LvhQp53wile749dfAuASdvHoE4JnQgGoddGVB4=;
 b=LLiWFM/XhKBgjmHXntyENJWb9ZoNLqKnUgAt8koAQyK1A3iwPDs29G0LMgEOpLUKAl
 lu5DlzVZroeLIVd0qqZn4hJSN3zYpm9RHpWGI0BEfIAopYXijFS2DwKD0XYbdjrA+8KN
 m1T/KjG/fNQ4tgXJtb+hittbKJ2i4pXmjAu8tsKiMGTPMQuQoA8B7FVuH129xKkpP0+1
 lffUV+V+KjUuEttcGmQw8nzv0zahBIoVPvUkKnOinqcpVBgDpPOIA3Gq+eme1m7lu7tk
 PnGHVh2HmRoJr1Q+nqmRXp1LhAbt6ARFPoNzvwDaAcnmQvJg69aVsEm2qXgBrLCekx1n
 w1Kg==
X-Gm-Message-State: AOAM533pjMSl0ybgWSKQ2XGvdowHqCzZfyO6tiXrk+Fjh5OFe83hbqFf
 JZfkmN42T2zVQhV0GQS+kr74lGL+7e9ND+MbTecuxA==
X-Google-Smtp-Source: ABdhPJw4USVVOR0Ybr8IytlIxpvuZYKIy+f2+7nt008f5Bo+OuGCccA0jkBRcayal0C4WaLq5B4xVgMgwBTay4ShYq4=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr7624608ejz.382.1615545366716; 
 Fri, 12 Mar 2021 02:36:06 -0800 (PST)
MIME-Version: 1.0
References: <20210312102029.17017-1-alex.bennee@linaro.org>
 <20210312102029.17017-6-alex.bennee@linaro.org>
In-Reply-To: <20210312102029.17017-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 10:35:48 +0000
Message-ID: <CAFEAcA_7OKauefw7ehAnqF6jmaqWPvNyVba+G2wg+xxsUgpZhQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] tests/tcg: add HeapInfo checking to semihosting
 test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Keith Packard <keithp@keithp.com>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Fri, 12 Mar 2021 10:36:11 -0000

On Fri, 12 Mar 2021 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Query the SYS_HEAPINFO semicall and do some basic verification of the
> information via libc calls.

Are we both testing system emulation and linux-user, or just one of the two=
?
(Not that I want to hold this up if we're only testing one, but coverage
of both, including M-profile, seems like it would be useful; cf also
https://bugs.launchpad.net/qemu/+bug/1918302 which is M-profile system-emul=
ation
SYS_HEAPINFO being broken in 5.2.)

thanks
-- PMM

