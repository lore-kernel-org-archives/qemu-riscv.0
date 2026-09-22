Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62F2C982F1
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 07:17:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x8ukp-0007CN-Hc; Tue, 22 Sep 2026 03:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x8ukk-0007BK-IL
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 03:17:22 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x8ukh-0000wq-Hd
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 03:17:22 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49d1fb0cf5eso26458095e9.3
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 00:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790061437; x=1790666237; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=LtpFaprIJbE5lud7P9rdRXmKqWACPbXQVY1+W2J+5eA=;
 b=eHBBDer1fT28zcb7Xaf+XKgntfEk/VJqQJ+968TdaFk4rhcTCRZzm1IWwJYn15mXio
 A4gH8kP0D/xVsACX4DxcORjN7+/k3PsHt1vwYKc5Ont4pXPHH83Go/vktj0zcpb7EPC/
 E04S8nhSRD9QimVVQaUu1EdZ6APaWb1/hOeHe1rD5Fuoew6LmpvynTOMmHJWS+9KuL3P
 oA9FPgWViSbywo9lh9jmLfbRmvba+zj5PwhkI+5T9P6dg5QaYsi8PtISWrJFjWaGrQ9H
 9sOLyaBs/2otIWBmV20DcaNSuAo0MKmVNlPBGITJY8Ben7p+yvtyvwdY6mwYqfa7Tkni
 iYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790061437; x=1790666237;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LtpFaprIJbE5lud7P9rdRXmKqWACPbXQVY1+W2J+5eA=;
 b=s9yGRPZrHOetc5x26iiJA5+Po6iFLjUgiJHN0h+sh/XqJcH5IrlRzgOkmgUEAF0xMm
 HMSN3baJk1J9lC7fSgad0Icb/FQYAgxHm0jzFSA0BBiuyv8jVrWEy8AyRYjGgg3q/6SL
 zIr752/AO/c0TUDnHFSKXEbjNSKiqVR5xHDpfPpB284qTGring0B8ixj48UXPU8nUbWs
 x+Hjd75HSndb415ddvoHhyiwM/5NrLb2twvljd2vrlC5+ZC7HQjzaXbxkK8rEAU0C9ta
 uGltPymtz61l/I6T1m31Jqo73EwgFrJe/3pTExjbJprnl0PfLFnXyL/IweAwyNdfewMl
 3qPA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwvUgKIsVVdSq/GSXULf2szAzTMAHQWDVKOpm/B1+/JoEECsYSDNLMho9rWnS4qgw6EmQBYpzdA6MBR@nongnu.org
X-Gm-Message-State: AFuF++mKhJ8vddsqJ/brX4qfUkqAh1pMk9mtAXRr1h/Wc5mPypVXT+3I
 AsGYR9TLUMwtwCiyRgLD470U/uwOMKROPc9ikuBRVIvnIx36on3IwzejNeFqMHMBGYw=
X-Gm-Gg: AYBFou1LrYwjTwCUamh8Xa4LcmAJ68nUBCe0B4yw2mmRwaM1+WGdcXJY5j1TsZyhRfZ
 E/1FxmSkbQRiqe1rVxYbdhAUgnye++i5OxV4UAs7i1rZDs3B4QTbKSOOeAIkbA1W20zNkYhZ9vH
 DR67OVuJ+hFTHYAsoBCXsOWKtImV2Cz+9ZtvEuRHYBlKYSRbT77oBIBHs0yEwdRB/lEXuc5GS2s
 D6YGyCxBi40bspxkeKh03XAHqY1kAgvRTwVQnIX3AaG3psJ1dxefdIBwb9RJIWFInK5foP5sxGm
 aRWzoECXpFFSnoKbJxbynyAh+iTI0yf7HSbgn23a4MT0CjplNBLWCjXzx6Y8tfhjOsEPc+IobSQ
 DttTSpOttVAe3QVx5kQ4tUpTbLE4C++fqZTosam99rC//Tsvhk0IZi03PeFAoaHboNyebBDN2Bh
 b/aiwq8z/eQE/R0XHadqhAzQ7gShap3VFcK+rIj+WlcGoNuefhpT2k0611k8u38rlp1xZDKA==
X-Received: by 2002:a05:600c:3b29:b0:49d:2450:68ac with SMTP id
 5b1f17b1804b1-49fc566e6e0mr181145125e9.5.1790061437562; 
 Tue, 22 Sep 2026 00:17:17 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48862774882sm2812191f8f.13.2026.09.22.00.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 00:17:16 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9A3C35F8F3;
 Tue, 22 Sep 2026 08:17:15 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>,  Daniel Henrique Barboza
 <daniel.barboza@oss.qualcomm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,  Weiwei Li
 <liwei1518@gmail.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,  Chao
 Liu <chao.liu@processmission.com>,  Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,  Michael Ellerman
 <mpe@kernel.org>,  Portia Stephens <portias@oss.tenstorrent.com>,
 qemu-riscv@nongnu.org,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH 08/12] tests/tcg/aarch64: Don't leak memory-sve CFLAGS
In-Reply-To: <20260827050953.67184-9-joel@jms.id.au> (Joel Stanley's message
 of "Thu, 27 Aug 2026 14:39:47 +0930")
References: <20260827050953.67184-1-joel@jms.id.au>
 <20260827050953.67184-9-joel@jms.id.au>
User-Agent: mu4e 1.14.4-pre4; emacs 30.1
Date: Tue, 22 Sep 2026 08:17:15 +0100
Message-ID: <8733v121s4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x10.google.com
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

Joel Stanley <joel@jms.id.au> writes:

> The CFLAGS are added to prerequisites, so if memory-sve causes a build
> of printf.o and boot.o, they will be compiled with -march=3Darmv8.1-a+sve
> -O3, and the executables that link printf.o and boot.o after that will
> also get SVE instructions.
>
> https://www.gnu.org/software/make/manual/html_node/Suppressing-Inheritanc=
e.html
>
> By marking the rule 'private' printf.o and boot.o won't be built with
> SVE, which avoids SVE for other binaries, and is okay for the memory-sve
> case.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  tests/tcg/aarch64/Makefile.softmmu-target | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch6=
4/Makefile.softmmu-target
> index 3f30be6c5d63..196a2afa50ee 100644
> --- a/tests/tcg/aarch64/Makefile.softmmu-target
> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
> @@ -51,7 +51,7 @@ memory: CFLAGS+=3D-DCHECK_UNALIGNED=3D1
>  memory-sve: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
>  	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) boot.o
>=20=20
> -memory-sve: CFLAGS+=3D-DCHECK_UNALIGNED=3D1 -march=3Darmv8.1-a+sve -O3
> +memory-sve: private CFLAGS+=3D-DCHECK_UNALIGNED=3D1 -march=3Darmv8.1-a+s=
ve
> -O3

Good catch. You will need to port this to meson now it is merged though.

>=20=20
>  gpc-test: gpc-test.c $(LINK_SCRIPT) vector_log_boot.o $(MINILIB_OBJS)
>  	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) vector_log_boot.o

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

