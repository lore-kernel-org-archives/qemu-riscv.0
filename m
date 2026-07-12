Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937BAC43458
	for <qemu-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 23:22:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wj3V2-0005VJ-4R; Sun, 12 Jul 2026 19:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wj3Us-0005Uq-6w
 for qemu-riscv@nongnu.org; Sun, 12 Jul 2026 19:22:07 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wj3Uq-0001uE-DG
 for qemu-riscv@nongnu.org; Sun, 12 Jul 2026 19:22:05 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-664a09bc459so4331816d50.1
 for <qemu-riscv@nongnu.org>; Sun, 12 Jul 2026 16:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783898523; cv=none;
 d=google.com; s=arc-20260327;
 b=Rxp1PA7uWOlglSd3hXDdP1c3SnXgKq+s6hFHs+J9EJgmNq8tBUyDeqVmpWWsmL/fpu
 JsuP19ZAsPooYjo53OekZNpG44CB7OjVRu2p/0iWYvrNGjxOUAGXSkCPxvwdnys+MSYc
 LJDQwHqTK0ZB0zMfTCmdLRKR+K6X51VQMGcLi3Uj3BDDWjTN171fw89SfFGZ5JXTiqAt
 NtNnookHreqVycQhjhXYEv5BxVapPzrPJxa5AW465HU9h7RKH/XbGpfS8Sk6neJNVPIc
 4LR+Wu9c3YKB85MslM5e7odEfi1quxtyTHGqL4XReECXSCBk4/yYk04bm9qaqljW9+HM
 oXuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=M3QbxB16zYHmA8LvrOxVawLXVLl9lp/I3a8ub6IlgLQ=;
 fh=0ysZnnFQx/NIy6pVqNEnUnQbkH+nx+5vlnS2jOoUKdk=;
 b=UhhP8maEzV/9oqQAcw497S11LkO3FfruQMheNZJuqvuRj1jEMGBBGKQZbMkXTH/A1s
 sYSueAr1xIPaq2IAcPrB9JG8hf7CXouaYZLwerzCzZAlXAKyvbT7EGQUxoMyq+3JzRUY
 boSKxmM4krJ7JWmr2700UabcuxGe68dYQvpLk86SmuWJDvbFfmAE4akRJKMQ+ogQlg0C
 oA1w3ZboZ4FhNA3dBXWh1C32KCMDboDA2ENxu6eK+Qa+RzFi4YtH9D+m6nS4CXxQ/LPH
 nwz7avEBjq+CoID/t+0drwgC0xA7Xdrp5D5gWDFWYQ3V9fe0imbT2vPJqN3iar8dZgKx
 FGeg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783898523; x=1784503323; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=M3QbxB16zYHmA8LvrOxVawLXVLl9lp/I3a8ub6IlgLQ=;
 b=L9Hj4K0lDRQilZGG1o8As2vB04rRtRx//SmUXbokviUjCtG++vHSF1e8qmN5+iq5eW
 aqnDmYPVP4oAaJvIDJyEj0LII6PxSiOFwFsq1Jzjo3XhFUhoxCcRVr9B4alYDsrK9ZF1
 EgHMAvFKk8F5dS79Bfhp7eIPLJQ2bMrY/f6CnkfZpMMFv74PBEIhPnmYf1FGOtj8zUuV
 X376eZY4a8/vHCn+3zSHwX/HodTcN3E9WzzVnbBwBS9J8r2FT5Ptde57b+d0+U+0ZA1P
 8EmEaVBeQ6hy33kY/kZtaRgo2E5wujqcEuNhsZjowuV9LgkIaAQkqBYfx6BZvfr472Ue
 MGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783898523; x=1784503323;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=M3QbxB16zYHmA8LvrOxVawLXVLl9lp/I3a8ub6IlgLQ=;
 b=dmU4T5DVt9ymRW4TqvwmKy0vV8IDBCXlEHVpT5EeProgwQjleIbp8KsQ7eaUwpn+Yq
 OBVZ35JRBk7z0hCscG1mmbRwSsXPO1JZmLZR0V3GIFchORS6LFzUnPlA9P/WJFvU39Qx
 2PwVAOz7NMg2WcqthNgYuCQepqhK8RTB2EJsq0rgg+d0ff18zi7iM0soCcnMcnfftOqB
 bsZI+R7907CQjxgBADhJhz3kdRkuP3a4f6zJDQA0RtaDsJZWFmrh3poqREEeHd58lCOb
 ji+zHOeeqRytY6oI2Q4WEFTGRknL5dwnShq3dm4gjoXQ5R4EV0SUw9nHjJXx5Pn5twnz
 lCpw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpptS8PDCVE/r/9aLULiNkJpsldeg67TTvk7q5WVug9dz9uxqrXc1OUmW0vt8j+k4WtrnEM6fyW6SGO@nongnu.org
X-Gm-Message-State: AOJu0YzysKoVGCMI15OlBKs+kZkp6TokZvbEZsuFl+NRecPM8B/S0BNz
 LTwfqsWcD4fjM94AQGwgE1WKBsMaNUuuN3+E0Pbt1e9zmqJyp95Ei6xaI40dwcQI9N5dHn21lN0
 90KC5r0+7J6WlK4SgniMPlNTujGnGRDA=
X-Gm-Gg: AfdE7cnRO6sHVmJa6aGGDDuN71+x/1VwU/W3uPUu00oGcYzv06lOrVIblDSopvvlbUl
 mjBV4crsbR2EtW9ZyshAawYu6Iy4rZe/fmTjb07m6kTjjVg9E0HdPn2z2Cd8nFttEBoueoke6Gd
 CiN6gCD9K+xjiFBX7gNir+C2Svj9OqCWtyAuI7vkHTySSP3B4RUVC+vPbxNeK3ItiDYYmf1JxqK
 YYaxdy0LvDrMov1IF0M2zsllM9xQLAyFmi6pqDAieAU67My39XeMTRopHHse7QRfaL5xtCZ
X-Received: by 2002:a53:cf0e:0:b0:667:8b91:244c with SMTP id
 956f58d0204a3-667d7f17737mr3832417d50.99.1783898523053; Sun, 12 Jul 2026
 16:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260710114305.2961898-1-armbru@redhat.com>
 <20260710114305.2961898-2-armbru@redhat.com>
 <CAEUhbmXaA6wpyUeVGL4Vn-zaP9LBFfmpTuWxDB=aMaXez_p=1w@mail.gmail.com>
 <20260712-prodigal-subscribe-759f57ab6d4e@spud>
In-Reply-To: <20260712-prodigal-subscribe-759f57ab6d4e@spud>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 13 Jul 2026 07:21:50 +0800
X-Gm-Features: AVVi8CfIcyyJwlOa9l0DbbGVlRctTot5epZaAhMqqxRLM3fWDdUcdbMHkkEEbqA
Message-ID: <CAEUhbmU66PUcuuWSL8i040XOU6j184ga-huToOULfEFrTrUp5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Mark "Microchip PolarFire SoC Icicle
 Kit" orphaned
To: Conor Dooley <conor@kernel.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 alistair23@gmail.com, 
 qemu-riscv@nongnu.org, bin.meng@processmission.com, mzamazal@redhat.com, 
 mst@redhat.com, sgarzare@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Jul 13, 2026 at 5:51=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sat, Jul 11, 2026 at 07:04:14PM +0800, Bin Meng wrote:
> > On Fri, Jul 10, 2026 at 7:44=E2=80=AFPM Markus Armbruster <armbru@redha=
t.com> wrote:
> > >
> > > Commit 4a16a1a7ad (MAINTAINERS: Remove Bin Meng from RISC-V
> > > maintainers, 2025-01-28) removed the only M:, but left S: Supported.
> > > This makes no sense.  Downgrade to S: Orphan.
> > >
> > > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > > ---
> > >  MAINTAINERS | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 576ef6fff5..aa2df9cbe3 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1761,7 +1761,7 @@ F: tests/tcg/riscv64/test-crc32.S
> > >
> > >  Microchip PolarFire SoC Icicle Kit
> > >  L: qemu-riscv@nongnu.org
> > > -S: Supported
> > > +S: Orphan
> > >  F: docs/system/riscv/microchip-icicle-kit.rst
> > >  F: hw/riscv/microchip_pfsoc.c
> > >  F: hw/char/mchp_pfsoc_mmuart.c
> > > --
> >
> > I plan to send a patch series to resurrect PolarFire SoC support.
>
> What does this resurrection constitute? The files aren't gone anywhere
> (yet, at least), so I take it you mean you'll be actively working on the
> platform?

Yes, I will rework HSS boot support to accommodate newer versions,
just as HSS was originally supported years ago.

Regards,
Bin

