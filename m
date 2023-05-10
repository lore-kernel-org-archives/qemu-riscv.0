Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7262C77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:50:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwkCp-00047R-3L; Wed, 10 May 2023 09:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkCn-0003x6-Gs
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:50:09 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkCh-00027d-FE
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:50:05 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-307c040797bso195712f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726601; x=1686318601;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6auvlv37Fi1hzFy+Wmiak3D0+JSZnTyE6fUN0VQfjIc=;
 b=xkpch263kILocWPpcz9+q1cbRJ/hkNyzKAq98GlTBz86qRaBrJt+XeRcQlvt/Z9PG+
 3yf8g3gePEPcgWf5I3ii+90JvZRDDomAgX/Ib1HQqGg0Y9HqCKRSyg/f/20slUoFQx7q
 oEpt3ATyXT5PhGtLHO/DH3EQ9UQwspDZ9XLUmWSkACfZBy3ze1luzsvPhwnVLYQAkaRK
 Ul9oRQGv00Hh0s3w4Ir4xbWA5N6MRYmucTkW2lLOuT5eBnvXB92U2lPttLwUkFlJyX4I
 ysoEHc4cyPkw64mHr6Xfx7getjqfMTq6JkjtX6zrUT4l63ptTDWjRZ1mEFyHD4zXPHg6
 fB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726601; x=1686318601;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6auvlv37Fi1hzFy+Wmiak3D0+JSZnTyE6fUN0VQfjIc=;
 b=E5eCRGKsTp+th2v03GL3YMtg7kDEfVX07KjIPb2uoPAcfSo0dozivHl43F2AHgc1Gy
 hXZ1qFdCo+moOGXp7NZ+42ggrrYbTBV0ISzI8z387aRonpmgWy7uSxZxtsZqTpv22h1X
 heBHOH1B8bLFTSqshGj/94NJNZAUkHaV/iN5vVLrykYHG4WhA0GTwY/OJj+H6fRtPTx0
 9Y0hUG7Tvdx/wh6yU4kDUR6fr+VRLowXYmJMstfUZ/J4zbZ/wgVEBwBhapWdXjjZQTjn
 negJbFxOt9QVe39T/N1+7Fpe4dURgGFM8ydGBdp1zGE00Sfcqcw4nHCFNgOKe5X5h6y/
 1fFw==
X-Gm-Message-State: AC+VfDwsic/WhV37KssrzSJth/jgQhlYCSZsbc/5a5/j+Y9evMUBe5J6
 lSFqh3iUcxqZ+JWQCelKIS4vqjHMEhhlW5zWlLhZxg==
X-Google-Smtp-Source: ACHHUZ5dLA8MLnjsPdw6oSitbUkcXxSOQVqiBMtQoZAsjR7Md8UvJEdgi9J9Im35bSiMV2Wu58Pn8g==
X-Received: by 2002:a5d:5589:0:b0:307:8666:a50e with SMTP id
 i9-20020a5d5589000000b003078666a50emr10030548wrv.67.1683726600785; 
 Wed, 10 May 2023 06:50:00 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm17529458wrq.82.2023.05.10.06.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:50:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 07BAF1FFBB;
 Wed, 10 May 2023 14:50:00 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-23-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 22/30] tcg/mips: Reorg tlb load within prepare_host_addr
Date: Wed, 10 May 2023 14:49:51 +0100
In-reply-to: <20230506072235.597467-23-richard.henderson@linaro.org>
Message-ID: <874jok70u0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Compare the address vs the tlb entry with sign-extended values.
> This simplifies the page+alignment mask constant, and the
> generation of the last byte address for the misaligned test.
>
> Move the tlb addend load up, and the zero-extension down.
>
> This frees up a register, which allows us use TMP3 as the returned base
> address register instead of A0, which we were using as a 5th temporary.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

