Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKfxK-0004mt-9p
	for mharc-qemu-riscv@gnu.org; Fri, 12 Mar 2021 06:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKfxI-0004mM-Sp
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 06:27:44 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKfxH-0006SF-C5
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 06:27:44 -0500
Received: by mail-ed1-x52c.google.com with SMTP id y6so7422639eds.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Mar 2021 03:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b889pTV0jwB3xmSqwSho9uUp1GcV/P1V0b24gNrbczA=;
 b=ao4CmjR4yN4zkSdHs6Aoe9x5LE4uGnfRpvkjmWgeA9S0yplhIWfeGavx4WlHlbKEpH
 lst5QE1kYtmjJpjQ95aRUusLGgclreQdGoLhERp4IPPTeYjPFRcuaJS+H6UYRRrtamnV
 JCEZgN55/BFDlKhgykEUnLjyuqkOvMQdKuSFK0g6V4V1ViV9OZ6aNSLa16yUvaBzmfXW
 7rvSXcYfJzXMSicnoMSlN7EFcIWEmFt0zpjKZmKEgkOwtrCkaD4EJZZIXbNh5RNwJ2K8
 5NrwYGM5Ol0aEvpUusWD+rX9AAqcj/T3dOnMVzWHstbcVwmJJK3quM6cSNtr9ub+5Tlo
 yO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b889pTV0jwB3xmSqwSho9uUp1GcV/P1V0b24gNrbczA=;
 b=DRfDUD9FlWDLWLvWwi4udWzq5wDlYLA/lQcfD+8E2XHNb5kKLzZ0vRD2OWDwbOLvIx
 AcpsJFZI3srtAgzf44SsHS1iYk6IgbIaYG4dmGBwKPN7jul3EnSw6F/ygoCR1Hhszfds
 O/l7/h7kxyMEUhlLtMSMMoM4nkFHKnpI14c1/Wssm5oZHVXfPHrTrzNBLxFa4um4OItJ
 d8wd+3OOcG8xKr7o/symbDrtILASFSiNesNdYg6t6LwLd+B5zOmBrmr9jwWxQFOg5oja
 0ldlzckXgg/ygqyOJl+s4YOJTZB5h4Hrm6TdSrHQdgoJKz/F2Pm5fA49apnkgnOLRME2
 nZPA==
X-Gm-Message-State: AOAM531xfFz0cMZxVQMIzQIJAhaJr12duckqPgmqW5C6SumD5uJML9l/
 hItuNXb8CpYsmbxsq+DzbS4Jkwx/s/tX5QRk+cvlXA==
X-Google-Smtp-Source: ABdhPJzA8LLc96WBjtzYeaBVDWI+AIBFv1JxEmIdYQ+EVRGciJYS+W02eA3AzQ8fbZmyEroL9eLQwOrJF7gDHUP/F/Y=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr13333147edt.251.1615548462041; 
 Fri, 12 Mar 2021 03:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20210312102029.17017-1-alex.bennee@linaro.org>
 <20210312102029.17017-6-alex.bennee@linaro.org>
 <CAFEAcA_7OKauefw7ehAnqF6jmaqWPvNyVba+G2wg+xxsUgpZhQ@mail.gmail.com>
 <87a6r8ehsi.fsf@linaro.org>
In-Reply-To: <87a6r8ehsi.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 11:27:23 +0000
Message-ID: <CAFEAcA_0wKRcwpWODM23QaQi5qu86k=Y-2NHk4hWiz08oL98zQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] tests/tcg: add HeapInfo checking to semihosting
 test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Keith Packard <keithp@keithp.com>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-List-Received-Date: Fri, 12 Mar 2021 11:27:45 -0000

On Fri, 12 Mar 2021 at 11:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 12 Mar 2021 at 10:31, Alex Benn=3DC3=3DA9e <alex.bennee@linaro.=
org> wro=3D
> > te:
> >>
> >> Query the SYS_HEAPINFO semicall and do some basic verification of the
> >> information via libc calls.
> >
> > Are we both testing system emulation and linux-user, or just one of the=
 two=3D
> > ?
>
> Currently just linux-user. There is no inherent reason we couldn't add a
> system emulation test but I felt that was already reasonably exercised
> by your semihosting tests.

Do we run those automatically anywhere ? I agree that probably the
best thing is to get those into the CI loop somehow (and then put
a SYS_HEAPINFO test there.)

-- PMM

