Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E72C624DE
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 15:57:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2WIQ-0003s7-RZ; Fri, 04 Sep 2026 11:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x2WIP-0003rb-Vx
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 11:57:42 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x2WIN-0004NG-KH
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 11:57:41 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8588583a7c3so14328137b3.2
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 08:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788537458; cv=none;
 d=google.com; s=arc-20260327;
 b=eSO1aeduLSUCk5DCD56/+d5JajIPfeVVOrFIKeDZE6xvVT/jTlCFmnqDv1umZPsHGa
 G+1MChrzes7/t3qKqA1hUvROJ+WFdD2uIYSsUegvh07UDDKI4vfdMEzqF7z6yCysI4Y1
 4rxzdAtT1l9CIuk3AS0Y91ARI3CRGoDulwEtPL67VUs1hd1UGi9PxB6Mk/oW9LKygrw3
 Z3IzUwftnB9AT/DTcNjUb0GwhVUgl8PexmE6VpD6bytc1CShRfELEl4KKm6ITRx3xQzm
 JRMQW0qifNUFhL0ZSAtoxzT5t2Qb5X6YinVw2lkOsXxYK/kO/TFchMLCe8K6FnBPM1+r
 1iUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9x+a9V+XCDnZNdlCUrGxrg0BtmLiYzZzQf75J3U5oJM=;
 fh=SADFVfb5oTO+ZL7mF7Uq+JZ6TZQObeUVzsLg2PFege8=;
 b=K7RIZRTjDlNzPgVImUVDVmYgdXF0hbN831w2QWC7ORFiytBUrrQA+eNs785brBJSGO
 BJLGNehHWvgY2Ppei49jhXRgtXjnAmeZdu2RGr4aBN5RcPK54NieUbdnhQupIGJ8blNZ
 jV0eS8IMbn4tUbeBzkGqZraLiJjKnY12PWagrssCVG3KmiYDzKbF5fbpa+CThbQZHpKu
 dZo6rWWHRwuAy0gUvA6D6vC5QzXYa7TS/uLPiDlEYVj2sjTt6Qczx3jIqahan3MoQtnD
 cV6IuzElA67EM/QqV78pycWs2fsSdC3T/Bz48vxQMQdKOTBVAI7sGW5rTCH4PQJCvYte
 Ndvw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788537458; x=1789142258; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9x+a9V+XCDnZNdlCUrGxrg0BtmLiYzZzQf75J3U5oJM=;
 b=PzJbHxMU39LN7HdPo9WxAeDbpKvBIa82W855b8kHXLoBxs6HAJ3kj3gQU1Rsn272RU
 l680xt2f/o7L19Y7gWGbZupy2r3y9Fs0pCHZI5vy47P5Wuk6qV856wb7NvQ+uVHMiRaG
 HxB1leNHt6BwF/0Y6meMGuRmmOJhXrCTuRPkonG2RdGglwEwMkw1irlRLVeo+Epu+Tmw
 9ySeXzJ3PGzoq+Vaok+LAPmTkIeNaeHBGO5HdQ+JOGR4kng+nIzr4z2zQNyr1vEkbK4z
 C+Of7lXORnR9eh8ym22b03HuIYUtaVEvne3GLqbwMFGCKx0XN8rGRtsXIGo8S9qaPVYP
 s1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788537458; x=1789142258;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9x+a9V+XCDnZNdlCUrGxrg0BtmLiYzZzQf75J3U5oJM=;
 b=iLsNqzysdk1bviJM/5D9mF1AdqRaskWd8WikM8np+PMeNqFd5HaeR19aKG+wjydbE+
 DRIvqKqmuiBqVrjQMYCfuQ4JOfKPsSDuHl+sREDb0NontWKnQfer0Q7wRbnAzqZb3dh6
 gwbnLHFTZyRQtjRG9CdljxBEj+C/jjkC2tDbNOSjtQrDfeCYxqUKXE5g9ngYivnGknYW
 EHo/nKrNe2gSz3jAw0cFxXZuWO8uFGaxmeYXZ3J9xcZqnaopm3JWSbV70GK/JG5UnkGc
 jdunyVo4sMGEVhnLAu7GiIMKBhXIC3Z1KlXTGQI2PjU0CQlQT31zaNl2ODbpNonwVQtC
 7Dcw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzL5jpXnMJ0UaMZ6EZV37jGXhDadXlrZihzXW9xeWTfdwRa/qfuJgGm6fWWH9gjZNgGV5i/VGoXSynw@nongnu.org
X-Gm-Message-State: AFuF++l3iKqSIDdFtBVhXHMba3P3e1L4KmaxRTKKfI+xpNFNIs2YHaE0
 WwUNwReWKauL/7Vcl0vrrtE9iUi5NQdhBI1ra3nC5rqytt95TBxDq+p0Ej5uabMIe3fDhEw5Jhf
 X4fk4FpkVBMY4NnZTrcuI48k4dglEcYo1tUeIuYJsDg==
X-Gm-Gg: AYBFou15wt5dYutjV057+A+0vmUU+qMywJ2LW+QorkEtFhsALfwifr+uRCzW7WvXiNC
 K3ax5nVtSGRvI7KFFJZfezIb4ESwkj+1tSZ7W0hJFi8qz1XWSWu5ywcv89d96Ja9ohvB03PfXDn
 x5xfBBfHCIGftbURjXKJmn8FfWL+RUitCoCrNX/vgN3Pb7R6DLSwxWiI5mH+s4EjJ45zYcMiy5C
 woYsoNqcWwOJX7yq9Ch/loHWwI4z5UJnLW1O/uQsuI0kU5MFM19GFjlckhXZfS9gvC7si+puPB8
 8sgBPjAd+ezpOMY+ov9NZNt1ngus4g5ThUNTxDmgisnZmfPbZdunObTlddvwJGJ6KMUOtJW4/qW
 b4NE/wUtqWci/6S93iUJqn5yyo6G/E//eTx+ogdc=
X-Received: by 2002:a05:690c:f14:b0:870:107b:6359 with SMTP id
 00721157ae682-871246a70e1mr40941217b3.15.1788537457684; Fri, 04 Sep 2026
 08:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260904124604.2207440-1-alex.bennee@linaro.org>
 <18f4fdf4-1e8a-449f-a003-3bff20499a29@oss.qualcomm.com>
 <87h5k5owco.fsf@draig.linaro.org>
In-Reply-To: <87h5k5owco.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Sep 2026 16:57:25 +0100
X-Gm-Features: AcwNN1XE4CyLYGIF92hfZ0gbZM4pifKjPmbcheth8Ebwj6XNdKo7RICYpYMXzYg
Message-ID: <CAFEAcA-ive77P5GCVLswnz64VehJ3b8ewYK18KEs9bANSAzRQQ@mail.gmail.com>
Subject: Re: [PULL 000/105] move check-tcg into the meson build
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 qemu-riscv <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Fri, 4 Sept 2026 at 16:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:
>
> > On 4/9/26 14:44, Alex Benn=C3=83=C2=A9e wrote:
> >> The following changes since commit 99e54ab5e7a6efc945af6d5661842155d1f=
3fc7a:
> >>    Merge tag 'hw-misc-20260903' of https://github.com/philmd/qemu
> >> into staging (2026-09-03 16:43:24 +0100)
> >> are available in the Git repository at:
> >>    https://gitlab.com/stsquad/qemu.git
> >> tags/pull-11.1-check-tcg-meson-040926-1
> >> for you to fetch changes up to
> >> 26395b536c3ec0a857dffd6548d8ef49479dedad:
> >>    MAINTAINERS: add maintainer for tcg/tests meson infrastructure
> >> (2026-09-04 11:38:01 +0100)
> >> ----------------------------------------------------------------
> >> tests/tcg: conversion to meson
> >>    - remove unused variable from multiarch/memory
> >>    - standardise checking plugin output
> >>    - bump minimal meson to 1.6.0
> >>    - introduce meson plumbing for check-tcg
> >>    - return error code if docker probe fails
> >>    - add CI/self/mem test to gdbstub prot-none tests
> >>    - use raw opcode for fprcvt test in arm
> >>    - remove unused variables from gpc-test
> >>    - teach probe-gdb-support about mips
> >>    - identify or1k pc register
> >>    - port check-tcg logic to meson (all targets)
> >>    - update documentation
> >>    - add Pierrick as a maintainer for tests/tcg
> >> ----------------------------------------------------------------
> >> Pierrick Bouvier (105):
> >
> >>        tests/tcg/riscv64: add float reference files
> >>        tests/tcg/riscv64: user tests
> >>        tests/tcg/riscv64: system tests
> >
> > Some of these likely need to be updated for the latest RISCV merge:
> >
> > $ git diff --stat 99e54ab5e7a..d2843fbf802 tests/ | fgrep Makefile
> >  tests/tcg/riscv64/Makefile.softmmu-target |  14 ++++
> >
> > $ git log --oneline 99e54ab5e7a..d2843fbf802
> > tests/tcg/riscv64/Makefile.softmmu-target
> > 883a4d4da4d target/riscv: preserve vl on element-zero fault
> > bbdccc84fc3 tests/tcg/riscv64: Add tests for rv128 [ms]status
> >
> > (not sure if this can be done on top although)
>
> Merged inline, see v2:
>
>   Message-ID: <20260904150826.2331577-1-alex.bennee@linaro.org>
>   Date: Fri,  4 Sep 2026 16:08:26 +0100
>   Subject: [PULL v2 000/105] move check-tcg into the meson build
>   From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>

Thanks; I've abandoned testing v1 and am trying v2.

-- PMM

