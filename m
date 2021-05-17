Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liSUA-00014g-JF
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 21:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSU7-000144-04; Sun, 16 May 2021 21:55:55 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:35509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSU3-00014S-KM; Sun, 16 May 2021 21:55:53 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id i4so6503567ybe.2;
 Sun, 16 May 2021 18:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SWdGHnNm35rrHmmCHWr85QqUsNhtShOhtSqragF8j/M=;
 b=YeIbwzFQNxJDYYcGb5DTD0CMwde2bDm0j9CeXZV6Z1Ve9tt3rW4GkmAVENxeUwTLPC
 JcSsmALqkLJ0pC6H2o8o8VSzkGXnyOrtu6guQWkJbREA9rWARRyMwmtsJ38bvjdNVxzZ
 yaLO0TraicNc1jLzjDC2StUoP+L2NrPjzIuSHjUWFjcKpPFjmMkxcSylFkvY6LtvuILl
 t/9EF/5Vl9r3ng/SesQK7hDIwPU4ytAsYIq73908iSUuloMcW2YMNsSEu+aTym4Mlpu6
 JyDjxQefNbvLDYyQrUe0VTrHPN28duqQdtML+s53w7kAIJXWUDWRt5gKYUQvIHZ0aybQ
 EqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SWdGHnNm35rrHmmCHWr85QqUsNhtShOhtSqragF8j/M=;
 b=bvAYHzgIBhTeqFwpJCSRPKHQMuPvD16jC4QzTDIQ4TxfgKw2sLMxb60ZBKUhL6RSBT
 PbNtFrj/sJ1aNSTELS4oa2QEcrSvNG0U0Iii75WwkDCDaDBpLrnBRJvJc1fhOFXW2maO
 34bp9lJiTVwUJWD8PUQxLDhckepj8RoH7Uc4VhTaG7pSTVHZ/2BP6MZ2PLqjrtK8k9ce
 ih5FcS//OG1gxmyvf7UbotmUPjIhPGA7OPvd+Ydf9FziiNOVip9gAmj9yhT2Qi/eUHhh
 4lGIID2UlL+Vb5q4A4xcyhd5vkH3AwmW+Ek2yhMx4s/WDwGr5cxUof2U2gQwN7aGlCZn
 YXCA==
X-Gm-Message-State: AOAM530LipC9HDFkoStHnHHs2Kq880Awopc6PDGKNtHsguyLS2LSKuCw
 IbvBRxb1Og0DnfzPq0fRYZhN9vkA2p8jbD2Twho=
X-Google-Smtp-Source: ABdhPJzs8tsgewi6Pe6R9iyXVBHuJXUgVuouDqM0gr+vrG8Ry5PW2cfW+Yds5mWOKEVONzNNqnkcCwNIhqkroN/Q5Vw=
X-Received: by 2002:a05:6902:1543:: with SMTP id
 r3mr46415391ybu.332.1621216548919; 
 Sun, 16 May 2021 18:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-7-philmd@redhat.com>
In-Reply-To: <20210515173716.358295-7-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 09:55:37 +0800
Message-ID: <CAEUhbmUKRhq0th3A9266qZXmf3Nxn=3=OAc2xtaTAWkteUxt-A@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] hw/riscv/Kconfig: Add missing dependency
 MICROCHIP_PFSOC -> SERIAL
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 17 May 2021 01:55:56 -0000

On Sun, May 16, 2021 at 1:44 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Commit a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART
> emulation") added a dependency on the SERIAL model, but forgot to
> add the Kconfig selector.
> Add the dependency to the MCHP_PFSOC_MMUART symbol to fix when
> building the MICROCHIP_PFSOC machine stand-alone:
>
>   /usr/bin/ld: libcommon.fa.p/hw_char_mchp_pfsoc_mmuart.c.o: in function =
`mchp_pfsoc_mmuart_create':
>   hw/char/mchp_pfsoc_mmuart.c:79: undefined reference to `serial_mm_init'
>
> Fixes: a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART emulatio=
n")
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/char/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

