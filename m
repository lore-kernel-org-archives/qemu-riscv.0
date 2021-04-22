Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZOMt-0000y2-6E
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 21:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lZOMr-0000vQ-7X; Wed, 21 Apr 2021 21:42:57 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:36829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lZOMp-000508-1N; Wed, 21 Apr 2021 21:42:57 -0400
Received: by mail-il1-x134.google.com with SMTP id p15so755056iln.3;
 Wed, 21 Apr 2021 18:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w/cXhI4jKYYny3K7schsKdtggbOGnStznEuG5YxSA38=;
 b=WoQTZtTMxCqBaUMbQT+yuwg161zOT9zm2L2xkdXBACDKKWcIYE2zLv21CrNmPi1Itb
 G92bv6EeaySE4WcQDkHpV5WovorlSN15pojZF+Knal9Cf0ckkj7JdOlsXZM1sPcrdWsR
 6FaRSzZVUwn5CyefhJDVV6wBEkeymPD0GVbXYpuyCpHF25Etv+nBGFfWptwMUePhz7Ko
 oqM8JDjiYcSwm7iAvdtc9cb3kI7KCukc2SuRQ5RYsAfDU2BucupcesU5xPI00ULczbQw
 IxVdhtsjSePqQg4qjbKwyeu9IPpMPTUXPnQzZzaOJb9izjaRb1JQZbAg67VceGqktprp
 26EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/cXhI4jKYYny3K7schsKdtggbOGnStznEuG5YxSA38=;
 b=BQc2dwyHqqoxDdMrqQW0+lZKhwzUMkfBl/CG9pat7Akf9H0lR/nOMApzyKWO+C0d2H
 GxqTiHcZTk4hyUIuljmH/jkNwKQfTTdyWd/NnigavHf2lz3UcTwJf/61BQozdVrD0oiN
 ttBv+F0HgB4cmdJmGjU5Q8ROVqTzAJw+FkDfvl2khoGPjkjAdxNrBo+Gm/Mk3ZmTOSYt
 Dt9nNAlZA1YK3/tVViwzECvdtuuVNY9P8JCgw070qBJP/rtp+UsEF+zHLmCa1qD41IiY
 dpIlHI5KKW2v27HLXCZ/cVWmMQr+ZXA8qI2uYvJZV4l1771jxR3Sya4/6LOS6gsJVV/1
 xziQ==
X-Gm-Message-State: AOAM532rChJ0252Fyj34Q6qBgSaRJt5TDdX+QlIQnBU0afWH4L7O9jl/
 YMHffG7XXcdfDlUpD6nLaJuglFxr9/2Yar5ebgQ=
X-Google-Smtp-Source: ABdhPJwfeR+fWZkX59XPliObQ23v34os/IkIJ3fFYoUNAKptd9dg1woXs8W7QIm39l67n+IMGDVaR3ieGCm22cM7s3k=
X-Received: by 2002:a05:6e02:5a2:: with SMTP id
 k2mr730429ils.177.1619055771162; 
 Wed, 21 Apr 2021 18:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210420013150.21992-1-frank.chang@sifive.com>
 <3b6b4967-d9bc-ec4f-4676-cb9df2b4930a@linaro.org>
In-Reply-To: <3b6b4967-d9bc-ec4f-4676-cb9df2b4930a@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Apr 2021 11:42:25 +1000
Message-ID: <CAKmqyKMKrNtqULUdQTdXAoHX8JS_dcRAQYx2MPbMiRtzJt6DWw@mail.gmail.com>
Subject: Re: [PATCH v2] fpu/softfloat: set invalid excp flag for RISC-V muladd
 instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 22 Apr 2021 01:42:57 -0000

On Thu, Apr 22, 2021 at 11:06 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/19/21 6:31 PM, frank.chang@sifive.com wrote:
> > +    return 3; /* deafult NaN */
>
> Late notice of spelling error: default.

Fixed when I applied it.

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> r~
>

