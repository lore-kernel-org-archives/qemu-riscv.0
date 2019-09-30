Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iEt2b-0005Rz-Kh
	for mharc-qemu-riscv@gnu.org; Mon, 30 Sep 2019 06:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iEt2Z-0005PU-5h
 for qemu-riscv@nongnu.org; Mon, 30 Sep 2019 06:36:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iEt2X-0000EW-Vy
 for qemu-riscv@nongnu.org; Mon, 30 Sep 2019 06:36:26 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40546)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iEt2X-0000DU-Ob
 for qemu-riscv@nongnu.org; Mon, 30 Sep 2019 06:36:25 -0400
Received: by mail-oi1-x243.google.com with SMTP id k9so10641909oib.7
 for <qemu-riscv@nongnu.org>; Mon, 30 Sep 2019 03:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RIpIdKusdl+IE2Li/qyUEzusAPTfzSa89LvtdLMUo0g=;
 b=gcXan2xJP+z7JjARjErViz2CERrDuoztTZzKjyjJK8bI4YGb/FgB6+/L+RuyWE3sBZ
 O60PaQyQbG+vI2gDEk7pMyhzs1xOhQ3pZuZGBgliijP2kJuiAICf2dQlbZBDWofDHTSO
 zyipQVAuTFix0feS0Pho2617ib+M9uC8mCprFcjIoxobBMFWh7f/WFZst203p29W33y3
 Y3egtDXOuynsGn3Lp6C0/3Y3Nkk7JkhcRa1daminunout5uOc/ysZUCWejcp5py8BHw4
 H4XxWTZmZDUpdehFumvqFURMWF2dA23i/TrTrnRUIccstB43BbbXavG/KTYW4P0tmAKB
 GHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RIpIdKusdl+IE2Li/qyUEzusAPTfzSa89LvtdLMUo0g=;
 b=W4y8ZSYKnjF18FQKNczqtMF4edgz3tOQO8sTpqbUCy7y3s9Ec+IJCYfHnFzcA1K2nr
 8Vts8H+JykzXRWTish23bMVGzCk7umQMRHEzjO59tn1DPryf4ooHqfqggxIVogjCYomf
 yixq3u06evb0PBzCg0RJ7T2Dhatqd4hGpXvcFL6kt/II1Dt5o7FG1RQkn7gSTS1LEbK2
 OtdvI5LNu9DOoKbF+6iPu0OOWF30Ur28CPTkiyfBfq75QpwQG4voI/VWz+PupVPC5VEc
 lo7TMpq4FZV+AmXhcUZ+V0t2CWmt/Z+8CRbG1Tlkanj9IUFtvEGtE/KonMejq1cbCj+n
 b2ig==
X-Gm-Message-State: APjAAAVZ+UC544MmwyD5YRh8b+X9shoGwBeARvHwI5IHz2lEXpgKZ1T9
 sVAzWJsSbnkst/4iMBjVL4hYUqntmlva8C6oLjF2dg==
X-Google-Smtp-Source: APXvYqxYhOUnByla57bN4hLMfMV17by52x9MiPYPYIVih0/mKA/kbkkOpU9BEJDpUHnKoOQJrp64OCAfYLeF0MNxSJU=
X-Received: by 2002:aca:f54d:: with SMTP id t74mr17817001oih.170.1569839784454; 
 Mon, 30 Sep 2019 03:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org>
 <20190930092519.GB11996@redhat.com> <87impakrky.fsf@linaro.org>
In-Reply-To: <87impakrky.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Sep 2019 11:36:13 +0100
Message-ID: <CAFEAcA9TT9hpRF29CVdZ8h83+b_rwc0bRWeVNjC4PLPJkzdFOA@mail.gmail.com>
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>, 
 qemu-s390x <qemu-s390x@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-List-Received-Date: Mon, 30 Sep 2019 10:36:28 -0000

On Mon, 30 Sep 2019 at 11:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> So if lots of people still want 32 bit host support for TCG guests we
> can probably come up with something that keeps existing functionality
> ticking over while leaving the newer architectural features to 64 bit
> hosts only.

I don't think we should do that -- QEMU should offer the same
(emulated) functionality regardless of host.

thanks
-- PMM

