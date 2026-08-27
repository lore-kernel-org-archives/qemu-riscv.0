Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411D3C61DC2
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 09:09:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzW6n-0006pF-3v; Thu, 27 Aug 2026 05:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzW6l-0006ou-Ma
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 05:09:15 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzW6k-0003xT-10
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 05:09:15 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-81f36179d72so32887817b3.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 02:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787821753; cv=none;
 d=google.com; s=arc-20260327;
 b=I+8qKrsabiKvC2lZ3ja4oLeWDXewQJyhQHvlq1vBlKmtKJBDlGVzJon7q2WGO7Pyi9
 nKOAQqyYIzIKKSqPuMkGfgN2EUmIPgB1Ksq68IapEqV9R3Uu5Us0y/L22d8Jval7Hwmv
 t7CnslR8msv8r7Xeq8d2QMB1D45zNDsrwL3bQgweuP5F0eafpHvan4uL02RCIzf75IcV
 6AW965SBAfvlQ/a3m/1TzzgTLeF7ZF7BQiFh5/IkOjFU9vOJnBnKandFs1fVdWQeJ87u
 uBIrL7ngZoLe2MfKlmH71nZ02UEqE5QLX3AdfL9e2ZJa7fDigPrMnJwYuzGfEO9AgsJM
 b+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nNeSuIzM80Ev2zL1czOqBtBwyX2vwQaGwFcIup6MpMc=;
 fh=r3J3rw38UcrJV0cBssFnlsynEnncF1B8gr68EvkN9bs=;
 b=sWRPUiTBWabU8IxQzUatK7fNK+likEwva4KIqOBqiM9Oc1f14sg25FwykXw8iBAXfk
 u8QTuI7dJO3s5kiXfIayqv1oX1zT5FUtQ6SC7aUxvLWtJj7hD3eQ795Yg4LuYlEu+ED2
 ByvoqzJZAOKetJURQ2pGr530W/1rXV2UrEswLk6dr1gP/RFUxBn43IZLsRmrzHxpxnTZ
 gks8M0sMv97k1e2jCL18/5z9N+XqgSOzxr3FXXibz3Hw3wf4XwH7zI1jDsWnY6WhtGxt
 eoJXp+xph6Rs8mmJRzOTCidldDHhtC9iHakrlJwX7Ow5WVSmfEEpNO41CtyTeVTRFBsv
 C6GQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787821753; x=1788426553; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=nNeSuIzM80Ev2zL1czOqBtBwyX2vwQaGwFcIup6MpMc=;
 b=qwog4xO5/n0NmkCFyjCqTMo4FT2zs2EmtXvIrBGorjUzPB/D9Aw6hOz4B9KRPMvi/Y
 NN6deAmYrz4AaEHFmloWFM6K5OUeL7VGXUAfaImM9OpKtK0Ko6P0Q6H+m0GObJpCNtGc
 xzC41LU8pMjJoEgRKlsJbA873AkNm4RK+GMNmr7ng0y/hVPuZRR29VpeWPu53LjnRRiJ
 Xwl2hRlJtxKr+nQBdq4EOJ4iyrLQgAUdIW7UXgiJdu05Fr4fz1vq1qXMOkCZruyeiaaS
 8ZWncLAxENQAvDmx5sT7hKS9GJeEm2+z2t7oSEd72oHe8BDh5ZdLWvC06EUHz7peluF3
 vfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787821753; x=1788426553;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=nNeSuIzM80Ev2zL1czOqBtBwyX2vwQaGwFcIup6MpMc=;
 b=GuadmqUw6pRGXKkPsmsOuZurLO5BXUX7ODIyBxfd46fRiW1JIRFbRwU5flSxVAWxh5
 Mwtb///EDQZZVqpxZech5LeuURcVSORFQEPRW+WbmncHOyZlmJviHz2sEZRJ1alh8NUX
 m0+w7YCY1XOfIb//HYbNxxnR0GkxKwpHm2bhA/GvX1Vm4YIl50RotdvukmCcVel/LWPQ
 3RllC9IqHjcNGkJa+jWTgnPNWMqhkfI5wh37QtWB05uQHtWvnKnuAkG12yKXzE54AaYB
 Nqmbq7eDEQL4PJvjTBQI3IojQOyXzrdxKKXnyZY7NQUDxrlBRQJekIIAC5U5PmDWDaC3
 X4+w==
X-Forwarded-Encrypted: i=1;
 AHgh+RrFCz/YHYkyBNy4h087Ec6HwEjcHFFwzzkmAAonaQXPBIe4CbiUbWv/A5lJkCeXudVEsKqHv8rxjCOn@nongnu.org
X-Gm-Message-State: AFuF++khgFiItf+jfLrOrW7chMCx/ZXWJ3mqNa3wv2CwjdbBLMc/OuOG
 fCSor0hzJ40YZyNQo7/ufnrMjfUh95OJxFL1qqkJ2dGgkbaqTuIol9ifFRGQI2cDEgIEP0+Zaqx
 pcB/QbGWNtcM1zf96z4NfCuvS5SJ890xs2CfU+SR+4Q==
X-Gm-Gg: AR+sD12ALVuMXZ+KUGQXpJxOLg8RIkmG7fYIl9Un5FkDbakGa6zelYLKZWfxjKhWrCj
 VWmAcnsJTZs6hnjW1R3U/ie6NxJWZYGr9QEXeL7QUBuuFCn35AcKR+6VNrPOEVzqqwamPrw+Gvo
 +ADPgJhZYx0K5uay8VrZm25+DbW/9IxeE+y2pOr2aTsUIlkvoMWQ4woUcdZqTOIrFGndqH4YNzB
 JyCeIitOTYxoUJ2qkCv+DEG05EGgZ/+lclN9XkQiUacrO4aMV0yJ4hb3Il/TO99MtJBwj3Hv5LJ
 fqHyxc+JBXNlipcuo5p7a1EnS5FY98ot2y0BuRNAP4uTJt0sfaiapzmIQlfdjkRg3eJE9wW4uPx
 nEJYR3bBdMujdmgdUnsG9wv9cW/X5THby+d0eiJM=
X-Received: by 2002:a05:690c:c50f:b0:858:d554:79e4 with SMTP id
 00721157ae682-858d5547cd3mr37363137b3.20.1787821752523; Thu, 27 Aug 2026
 02:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <20260825040452.1322251-4-stephensportia@gmail.com>
In-Reply-To: <20260825040452.1322251-4-stephensportia@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 10:09:01 +0100
X-Gm-Features: AcwNN1Xaft9WTF2mwWCVxtI7CYhEOz70afodYE300sE0wIN3NECIiYZJsbmOtus
Message-ID: <CAFEAcA8h4JwFFxnTQwxgC2HPAE_YA8CnLSgJo6pdhFcJeLyGmg@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm/strongarm: Fix dropped upper byte of ssi
 transfer
To: stephensportia@gmail.com
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-ppc@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Troy Lee <leetroy@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>, Joel Stanley <joel@jms.id.au>,
 Hao Wu <wuhaotsh@google.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, 25 Aug 2026 at 05:05, <stephensportia@gmail.com> wrote:
>
> From: Portia Stephens <portias@oss.tenstorrent.com>
>
> The strongarm model intends to transfer a 16-bit value over SSI. There
> is no machine using this model with a peripheral attached so it is
> impossible to know what the intended SSI peripheral is.
> There is no in-tree peripheral support for 16-bit transfer, update to
> use 8-bit transfer.

This is the strongarm synchronous serial port; the manual says it
"is used to interface to a variety of analog-to-digital converters,
audio and telecom codecs, memory chips and keypad controllers
as well as other miscellaneous serial devices". I don't know
if it's actually connected to anything on real 'collie' hardware,
but if it is then  I don't think QEMU's ever emulated the connected
hardware.

The data is between 4 and 16 bits long. I think the intention
both for this hardware and for QEMU's ssi_transfer() API
is that the guest software is supposed to know what the device
on the other end of the SSI connection is, and program the
controller appropriately. If it programs the controller to
transfer 16 bits to a device that only expects 8 then things
will go wrong in both hardware and QEMU; conversely if it
sends 8 bits to a device that needs 16 that will also break.

-- PMM

