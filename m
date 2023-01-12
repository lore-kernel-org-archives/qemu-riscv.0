Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFvNN-0008LD-1y
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 06:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFvNH-0008I0-Hn
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 06:04:00 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFvN1-0008Jt-1Z
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 06:03:44 -0500
Received: by mail-pf1-x42b.google.com with SMTP id c9so13523825pfj.5
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 03:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YRMIxmrMjxFmZ7KhnuQyQ4LQN+JFHEuz988Y3hBKhAY=;
 b=AE2aKbGlog+nDLpzx6+73PFOKcFOlk7OrHENBBiyt8FPDfJtjJp9iazQfWNk1uJlM0
 QhMv2+Ux9eLUuLYjgMZWUkvqrbE7es6WjuMPIEs60T4Ls+D9q0/MzjqYBaO5D/adYkBZ
 nLgcDr0VnC6f+kKHzeT+m/f66v9V7jsPZreL9Ref5zsYSVjUQMk+NCI/f3XlF9FD4h0p
 wOJxBBhwgklj8lzeQO0DR7laeFBaDePYrZfypE63u0O/Ijnim3Qg/vKTEBQfhWb/FDZ3
 bh9hcjDTqiCPNZ6NKrduBHZtkSr3wrmKYWvOgX+Ta+5LYTfWRaUENMdezVR8C8dPh7E4
 HGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YRMIxmrMjxFmZ7KhnuQyQ4LQN+JFHEuz988Y3hBKhAY=;
 b=YtjLPUI8wsGWcOMCMB825gb9lWZ6qHMTkMV9RCGtvlQU/jLsucwrA/ph7aRM0ndc+w
 MaxZmafNIL6TgPAXPUadc0c43BtOIRpHkoWyshsosxJLnSDzNwv9NRlol8C7E2wevCGW
 TV7jCTZ3J/GJ7cO9uUc6X61APNv8xkCWX2uDVu1PdqYCIGyYUR9zDeoyJK7gd268XytN
 W2eW+G+zcKOzpttFUrv80a2wvaFmUDU6MtlAZH7uaHRMNIPOPngnm5VlAjnQdSKhllyk
 Qi0TMMJKvyYGi+v4nSC11OKnf+XknuMU7FttsVYE2m3ciiw2xgoHFSAEpVzxyc/pjjPJ
 vjuA==
X-Gm-Message-State: AFqh2krbqjwzC+CPFW794uQDUJH4NIja3cbbt3bzHvN16aeBecAubDvk
 QTOVWU/tIzQbJTqiTclRsiLfOzLmT/MzgA3e+mkBgw==
X-Google-Smtp-Source: AMrXdXu5V4bX22nwNZjWYHOvPbmvbmEPrM5ZbLD1wZubhZ6omG79rXH/n1MH1qTGUPIgVjvQP0rVQQGio1U3g6Ik/Ao=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr4968225pgh.105.1673521421294; Thu, 12
 Jan 2023 03:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20230110212947.34557-1-philmd@linaro.org>
 <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
In-Reply-To: <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 11:03:29 +0000
Message-ID: <CAFEAcA-5054ZzubQbZuzb8=D1QfbfKgqwnr48r2kOx5p4=Rchg@mail.gmail.com>
Subject: Re: [PATCH] bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, ale@rev.ng, 
 qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jan 2023 11:04:02 -0000

On Tue, 10 Jan 2023 at 22:04, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Tue, 10 Jan 2023, Philippe Mathieu-Daud=C3=A9 wrote:
> > The 'hwaddr' type is defined in "exec/hwaddr.h" as:
> >
> >    hwaddr is the type of a physical address
> >   (its size can be different from 'target_ulong').
> >
> > All definitions use the 'HWADDR_' prefix, except TARGET_FMT_plx:
> >
> > $ fgrep define include/exec/hwaddr.h
> > #define HWADDR_H
> > #define HWADDR_BITS 64
> > #define HWADDR_MAX UINT64_MAX
> > #define TARGET_FMT_plx "%016" PRIx64
> >         ^^^^^^
> > #define HWADDR_PRId PRId64
> > #define HWADDR_PRIi PRIi64
> > #define HWADDR_PRIo PRIo64
> > #define HWADDR_PRIu PRIu64
> > #define HWADDR_PRIx PRIx64
>
> Why are there both TARGET_FMT_plx and HWADDR_PRIx? Why not just use
> HWADDR_PRIx instead?

TARGET_FMT_plx is part of a family of defines for printing
target_foo types; the rest are in cpu-defs.h. These all include the
'%' character. This is more convenient to use, but it's also
out-of-line with the C standard format macros like PRIx64.
The HWADDR_* macros take the approach of aligning with how you
use the C standard format macros.

As usual in QEMU, where there are two different ways of doing
things, it's probably because one of them is a lot older than
the other and written by a different person. In theory it would
be nice to apply some consistency here but it rarely seems
worth the effort of the bulk code edit.

thanks
-- PMM

