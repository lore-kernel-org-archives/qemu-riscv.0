Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6580DCD1284
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 12:02:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rut7s-0001PM-MJ; Thu, 11 Apr 2024 08:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rut7l-0001Du-IQ
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 08:01:49 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rut7i-0003JT-Jy
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 08:01:48 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56e2ac1c16aso8111740a12.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Apr 2024 05:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712836905; x=1713441705; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=veCA5XuoiI2x3nFfPCI/nxUC6o5oC93sOeqtZpyyTvE=;
 b=JwZ9+Kk0QuqtWx3r3zvma2I5YcnoxC919n0M2cyUYTLCa+44RE0tVfMU2WKAb/F+/G
 14O/RnZptmAWBLMHEfgMajo79rn6+q91/roHooA++p/MkMcAyTz1825Fv2mxf2L4nwq5
 CcyWLj/0ZaRJ7rBNT3wcp1PE4OQYh/X49qiE1uRPLyiO9Xc3SRDCH3KICv8Xa/k765So
 pD+A6igGglgihUIrzN5YUAxAOlcJhI0Ac8klZXilh/d6g0+sQbWq1Beba58GiP5eDo7v
 kCBRHdgOGJULcPzOfd7Cjdjkl5LS78UOBJbk2paBYGtWv7iM66MPGtrTxkI3U+5woGW1
 lkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712836905; x=1713441705;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=veCA5XuoiI2x3nFfPCI/nxUC6o5oC93sOeqtZpyyTvE=;
 b=ZPZsPhXaijolqiwCQi1eqzMyWuQt89n5uYwp2AxZkcMA50fBtP1qdOz8Z4KrcV6wSi
 UMd3L/u6NMnBHVx1v/yJzSSdK8YGPcAk3N4M/zjJjBbFT1h6SrKf1x+3IJ+BFDFCDcYL
 l8TEws5UeOzuxAsPVsJjn3hKVo4W/ClM/kGoSW9bpQBG2T5CMbxAOsrYzkcph6dm7dXC
 Il7LsKEmnls1kxUwLnltwKvdOS59ghOWCHuNDRtlN9HG+qQkwpX2wGQOsDQ7zzk4TKsw
 g57hdix1/LixiliSafEQWm210qN7qGzMf0UFepug+qQV7Mo5L0yWNYsxBv+vh8f7hqBt
 zB7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFjSjQrG4uzd+qIZ5isonvzbOCe3sYy3TlLh01zsegZ9RqnOX0ydLTEGrwiMhJtklfnK86I5Z99njraw5mV5hVbMpiNX0=
X-Gm-Message-State: AOJu0YwUT/rz+1OeTR437kH4VlEGbat2e3tdtyRYYdGdVWMyIniX2IWV
 waBftXaYS4EZK7QSNJrx2hRtKxfY6asNoRxz3JATepHh66ZouQcNuDiPPxZK0I3u6PB6eLdowtZ
 40YVwy6eZZHMFtIlhj2dR2FDvr5I2UDuPjehTvw==
X-Google-Smtp-Source: AGHT+IExzea7Wn0tfVctGqtaeBG5SG1R9SqwGSagyXwti6Uj7YGcwPfnnmemdyzA/8j/iIMcC6jmfUrsw0Qitixs/GI=
X-Received: by 2002:a50:cddb:0:b0:56e:7884:9c7 with SMTP id
 h27-20020a50cddb000000b0056e788409c7mr3957528edj.19.1712836905190; Thu, 11
 Apr 2024 05:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-2-philmd@linaro.org>
In-Reply-To: <20240411104340.6617-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Apr 2024 13:01:34 +0100
Message-ID: <CAFEAcA_N8yFY15v=QrCOAOPPPnsrfZk2Pqm_CBmxaj_8Gvf1xg@mail.gmail.com>
Subject: Re: [PATCH 1/9] disas/m68k: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Thu, 11 Apr 2024 at 11:44, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  disas/m68k.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

