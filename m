Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5607C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 07:53:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wumjE-000451-O2; Fri, 14 Aug 2026 03:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wumjC-00044E-Uh
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 03:53:22 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wumjB-0002vF-9c
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 03:53:22 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-836c718715fso9379687b3.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 00:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786694000; cv=none;
 d=google.com; s=arc-20260327;
 b=aHIdAPIRpfBKhpXICkgJAHDjqcIa2uIV0QnpsAWXgEOO54VVOxS0x9hHJ/h6PgBp3W
 TuROpo3tXcGm3uIsA54YmFpzFoUNpI830yrnHAJ2vt03kqOqfppt+DJvQalEAS1Y3Ubq
 yMK4hypik5vYl7//63Lnyjmef+83pVGvgDEzYMotUWVfO5g+UCJTkmcWD7gclgizd9FR
 0zUbdC2j8kdQNZHyQ5AulLma98MZhTutjmJC5W1PKPvFS2AUpJHgUyXMvB2gYqKFEAss
 bYQKMomaE3yGsvszR2z8P5QOXJrbdWOdfhdUHpUKXZAgpeV1Trr//72qz04pUYPw6V0Z
 zGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zxpahKhomwIfxYd+z+Isjdq+GaKEevimYu07RsoY91A=;
 fh=tS1RBONG2Od3evjSXEdggdev4c8D3m8ZNpBMhnmqPRM=;
 b=YOuRQMgs2eodIvrSl42Z9PnMywivc6OHtpr2srIg7gtb9o3YQyxonOACIsbFteAni5
 O4LAJFUPHdoFiSTDGUm1fRbv9Eb8zeZXQ/kzAwTyIVJb89bteKQ569hg/nqAlGifMbeO
 WykQlqe4ZhCAK40tGmvejePghD4tsqwluHRLMTQQcnIVUPfOSBqYEv72qH4rEGxTP6Vh
 9r6UXpBa+c2vx6xTQD+8PSdHeFXLCRGrl5P18ifCZTp4ZmvnS4a8OvBlaIri6Vj1/KbX
 InPf8V1o8ougpb+uJxxTV1PH/W7St/IEqyUnD/KVnFs1tx2ni0cTDnyMlTlUSpoN4t8x
 TqAA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786694000; x=1787298800; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=zxpahKhomwIfxYd+z+Isjdq+GaKEevimYu07RsoY91A=;
 b=BH8cXsGFIRHthr6Z6uJjT9QEXPcswpE91MCY7ZQQ9/sAgzLfZcqqB0VlBKesfEQBX8
 4tlWPGwGSkveSQ7YsVG1gXD0epa5jydqH06ZdRQVR5jRyv+DwyoGQ2YIWHtdSrFqtmzZ
 U+/YUY2OG4lYcdiVSHwh35JtG3TSsNkWRFuxaVaNjU22lbMDzDQmS2sDEC1Gpl+DpPni
 O1WFtHAz8L14Kf9ZmdIsxUUQjtXEneGaIjjTanJJvZyKK2bwpiYSxCQyZT2wwZoog3JQ
 XKjb3tJEbib3VDEYXdEuffDcKqP4T/Rk8a/DeKusPJA59XlqnXUAMUT1hYFQvYdXJwt7
 VmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786694000; x=1787298800;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zxpahKhomwIfxYd+z+Isjdq+GaKEevimYu07RsoY91A=;
 b=kHQ5ucSQr5VTMqaweQUAAilzkRQamJdBOLka5WNKkGEKpyYs2uCzCWSwc/PUBi/T86
 unT+CqjSVPqqLOGomWPr6bhnB8G4oeZAKWW04Q/chTmU1RUIyqx7Rwu0UNyrbcfz3L/t
 A6yHj60gZGaeB7MmnPKXRQUnpePUZR6YEEDepmYC2Iw988exa6nPVsJ65wtCKBt2F9O4
 OxsqPUOhHKlz7vYyU1dqEa0hVDmUh2tpc66ricUxnzteoSWz7i3CTWq/oVmQRRhcm/b0
 5IrWabMHtrUOuru8EgIZ/5WcMjVAYCwL/KTWSJnCcxwhkCpqYFilCGGHwGWupDdCrTMH
 mUAw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoeHZZczSdwePLZgacG0dwg1q5mmXJfrMEnpwXb2qVj6tOO8/oR+aXQu5RJrtjtZfFptVTzEy5hGm4g@nongnu.org
X-Gm-Message-State: AOJu0YxTTk1SGTe7WkM/3OZ/2aY5GWsO9HWVaEITdOxSCotlbNJREoSL
 XWWoybN2TDIWZs+apwcXMVpAunHDp522ZETQLmJXU9NMDf9OyA979T/1Yx+7zfRUu1guEVEQjfJ
 JlJE8NB8xS27V3jCs9JzD27A5gEwAKQQ=
X-Gm-Gg: AR+sD13AwnMAxrHJPUx7Ofp3THhCncmGf9sMV88Z5pN8y7+9giqQCAW6c3q5+7/7oZC
 XnOEfsgmOmaBnjShs5t5q6VOmyKe6LVhjibqkaiMjty050lCOseBwywhW9l0OvScbJmYF1nmVqa
 0A4qD0Af57miDudL47IL4d2IRSSS267F8kOr5pfusbu0QFz6e82C9V6WszWE7L5kcDzSh8mITKP
 fCei+tYU+NmW5zCsayIBW6EA6pRQC16shuK/TOGWJxJqpS130zaO8MR+MUB/FgG9oYGCZTIH+Rj
 DeiVF4uZHwc9d/yUm+ldqgJ8BxbeySX7srdjfLdkH4TLjo5Z1/Wl/Lk=
X-Received: by 2002:a05:690c:e647:b0:81c:e8ab:c4dd with SMTP id
 00721157ae682-8371356e7d9mr9143937b3.33.1786693999934; Fri, 14 Aug 2026
 00:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260809-feat-k230-cmu-v1-0-8792982c446c@gmail.com>
In-Reply-To: <20260809-feat-k230-cmu-v1-0-8792982c446c@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 Aug 2026 15:53:07 +0800
X-Gm-Features: AUfX_mzOoBgisoPjZ1H_MalKfjaVwJYBDgd9mnJ091tnoIx-BAG_IuUCPE-wGDI
Message-ID: <CAEUhbmVQid5yboTQzDTANT-zMEzLiJkom0qLfKRV-nP3nq5uaw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Kendryte K230 CMU register model
To: Simon Law <0860734llx@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, chao.liu@processmission.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 pierrick.bouvier@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hello,

On Sun, Aug 9, 2026 at 7:47=E2=80=AFPM Simon Law <0860734llx@gmail.com> wro=
te:
>
> The Kendryte K230 machine currently lacks the Clock Management Unit (CMU)
>   register interface required by the K230 SDK U-Boot and the Linux K230 c=
lock
>   driver. As a result, software probing the PLL and sysclk providers cann=
ot
>   observe the expected reset values or register update semantics.
>
>   This series adds a minimal, deterministic K230 CMU model.
>
>   The model covers:
>
>   - four PLL register blocks at 0x91102000..0x9110203f;
>   - the defined sysclk registers in the 0x91100000 window;
>   - the software-visible SPI2AXI_CLK_DIV register at sysclk offset 0x108;
>   - reset values and writable/reserved/read-only masks;
>   - PLL control write-enable semantics;
>   - write-one-to-trigger update behavior;
>   - deterministic PLL lock and initialization status;
>   - VMState for stable PLL and sysclk register state;
>   - qtest coverage for reset, masks, write-enable, W1T, status, sysclk
>     updates, unknown offsets, and system reset;
>   - K230 machine wiring and user-facing documentation.
>
>   The model intentionally does not propagate clock frequencies to QEMU de=
vices or
>   change CPU execution speed. Peripheral reset, power control, and the
>   guest-initiated K230 reboot backend remain outside the scope of this se=
ries.
>   Those functions require separate reset/power models and a matching Open=
SBI
>   backend.
>
>   The implementation is based only on the existing K230 machine and does =
not
>   depend on unmerged RMU, Timer, SPI, or SDHCI device series.
>
>   Testing:
>   - QTEST_QEMU_BINARY=3D/workspace/qemu/build/qemu-system-riscv64
>     /workspace/qemu/build/tests/qtest/k230-cmu-test
>     (10/10 subtests passed)
>   - QTEST_QEMU_BINARY=3D/workspace/qemu/build/qemu-system-riscv64
>     /workspace/qemu/build/tests/qtest/k230-wdt-test
>     (7/7 subtests passed)
>   - K230 direct Linux boot and K230 U-Boot boot
>   - Linux K230 clock probe and clk_summary validation
>   - CMU source/destination migration smoke
>
> Signed-off-by: Simon Law <0860734llx@gmail.com>

Is this clock modeling a must-have to make U-Boot or Linux boot on the
QEMU k230 machine?

Is an unimplemented region enough to make the software happy?

Regards,
Bin

