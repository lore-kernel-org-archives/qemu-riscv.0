Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D299CC02199
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 15:54:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tg4Bw-0002TQ-AX; Thu, 06 Feb 2025 10:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg4Bs-0002Oh-GU
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 10:53:20 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg4Bp-0006zk-EC
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 10:53:20 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e573136107bso902189276.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Feb 2025 07:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738857196; x=1739461996; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5H+hhL1ihPNFguVGpGNPg7yjivptPGHwTYAbDhAvvlo=;
 b=moMpPSGaIF1Z2l53excfJmI3m2RGycFC/x1xK9te+HNQ+D34/4ys/CrLue2DBAJvlf
 1O7J+2tl+KLQULcwtedCwvcjF6prDBsxdIHVt8olUlOtmYKM8lmn+W0TvUL3KUBTE+St
 6hyyg6OzY3S56XqQ73LCEdSynRkpfbobSE8OvS/hcrPVrjhyYe2fyEpAjQwTuWKga2py
 B17f1mcspC8hrHaKPm4/6adrxgPj/awOxLm0wtn8HXaRAVxOwsBA5iufSN/7vfht/w39
 9KMNoUpJsMZlT6GZl3BvaWZn2HmoP2+3IBNTgp+hjxmM4m60YsetjmxyoJDf/XDyoXV+
 IP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738857196; x=1739461996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5H+hhL1ihPNFguVGpGNPg7yjivptPGHwTYAbDhAvvlo=;
 b=tiuubVAp8ZhzulE0XDRECx7/5yqzgkrUxvqvO5tjywQljSNo92RQYM/BDEGH4HLqfp
 +QACNLdbckVUglx/sidRB+6D/3lGX7Zr8Oo0supmZw8saKZ0PiVUMxLgm92nTWfM11dz
 zCrsKVihTARUoSJKnAjSmvbQp/E/nTG+UFKCOunr/vVV1un8VnIv0nSSbeCsUjeRKA+u
 PrNvXvdbkZAfZSy5E4EpqtuDGwnDD9gzwZsNgTCLh8qdbvmd5FC1zM1o7u6W6nq18H3N
 +uytGRdtFZQMP0rerL7pNLXA8U2+I/K3/Mhnxt5oi/acQWg7DBDcIRFLmCStI9BraKVb
 mZuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnujUtK+bRjrzDdw9K76F3uDfb8Xd6bzT2MkAJ6nbtRVyO07QsqwfEOPhH1hWxyK+rSuCCsAbqBYMV@nongnu.org
X-Gm-Message-State: AOJu0YzWL4WafvZ07mEwceGJkPqihPqmSFhQnJCKn+lknXXYFHojy3FE
 nOY6xnR+oVZXL8rWKE0uDotexnvZ+hbvNZNIvlegNPcILaY+Pme0XgfhZ/IAldkA/fc+kXNhBpk
 k8vndgOgRR3NET/Ul/pw2nInU0JzbUMUfXCwCJg==
X-Gm-Gg: ASbGncs8xl5q/1jt8dob6mxnyuTw/Tacz2Zt3R3lO7MH56nf4wBSB0EFRlatHl6RDGM
 5xJppdUNC23oDd0JTEBfVDPx4GquKE1+ENkSTa2g24F3EfT4fFNOHxlcW6smkzgQMYIg2PINI5Q
 ==
X-Google-Smtp-Source: AGHT+IH7se20k+IcZxopIIGWe8rNYHJ9965GJoItdH8fQqtHWEKQS0HtpBHMWxVRa1dfLgNz384z5mQm92UIUKnjmUo=
X-Received: by 2002:a05:6902:218d:b0:e58:8e82:5345 with SMTP id
 3f1490d57ef6-e5b259d213dmr6055544276.4.1738857196284; Thu, 06 Feb 2025
 07:53:16 -0800 (PST)
MIME-Version: 1.0
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
 <20250203144048.2131117-8-alex.bennee@linaro.org>
In-Reply-To: <20250203144048.2131117-8-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 15:53:05 +0000
X-Gm-Features: AWEUYZnHiVWrLGi-2zGS-ZXL0vgR8vDSrhzcIVVztSk6rKPjoO_A4eVt_FUbanA
Message-ID: <CAFEAcA9SnRrYGZVkB_NF=VSkSDtRQSvQjOPSid+HN4997Mwxkg@mail.gmail.com>
Subject: Re: [PATCH 07/18] Revert "util/timer: avoid deadlock when shutting
 down"
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Hao Wu <wuhaotsh@google.com>, Peter Xu <peterx@redhat.com>,
 Warner Losh <imp@bsdimp.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Kyle Evans <kevans@freebsd.org>, 
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Bin Meng <bmeng.cn@gmail.com>, 
 qemu-rust@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Tyrone Ting <kfting@nuvoton.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 3 Feb 2025 at 14:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> This reverts commit bc02be4508d8753d1f6071b77d10f4661587df6f.
>
> Now we catch attempts to clock_step to the next timer when none are
> enabled we can revert the previous attempt to prevent deadlock. As
> long as a new target time is given we will move time forward even if
> no timers will fire. This is desirable for tests which are checking
> that nothing changes when things are disabled.
>
> Previously most tests got away with it because --enable-slirp always
> has a timer running while the test is active.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

