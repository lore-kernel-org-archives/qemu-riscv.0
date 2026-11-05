Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F31606E54A
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oaT1V3+j
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOzvH-0004bu-12; Thu, 05 Nov 2026 11:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xOzvE-0004ac-IU
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 11:02:40 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xOzvC-0004eW-9O
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 11:02:40 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so19097325e9.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 08:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793894556; x=1794499356; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=iu/QW62tQvEwErXcWLjoRCam40BVpMeHXiQWa5SZTo8=;
 b=oaT1V3+j2H6bW368D4QsjGonm5+Ka4YiMV/qeuLEb6xyZDAM/WfNgEEnSE57BKwzji
 1VNVUbg2QvwxRrQwU3LmI5trwYGe+6gUiiVatJmSzwaxYyr1s8TCYF0h0Mmp2AkY8Fw0
 cZtoUW1fVblxJOeaCGu+4VcCDglKgZhkKR3grqofKDOfFmDJrMF+HoXYYcWQuJbrYsQC
 yg9AZ8AxyvsxLjUjSBEuR21UkAgokcrPgxmqpJWgR0kpY7U3Q2wwXnqmv//Yc3Y2chQ3
 2MdsezBLe2HEYEBOYwmPInx7xSK7EFk1qJ8GPwB3aGksPuAJOvNgq+P5Tx9aqX2OderX
 pyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793894556; x=1794499356;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iu/QW62tQvEwErXcWLjoRCam40BVpMeHXiQWa5SZTo8=;
 b=D+JzwZPMMmwWc2qPYd4axNDWOHK8Qgk7FonCyIYepv4YgPAMb3XjW4uzua7sg274xF
 C9YEiXjO4P9/jYpYG230K1IrXhMEsS/vVwa6hW3doA1kPhcFwu9Xbi5RXnSjBX+ukD2R
 sguSYNn6BFdmHRDPsv/xszU4HY/1vXYm/eAdCTTrlfbedX4efoRb3JG9PSObS0QvpYHm
 K/suwoc2SjQFM/og1d2C/WQ4/VqSoPJnB3Ly7w6IPYwiz2m40aZUnXO7+mKDUryLJ804
 EoGVxly/fwmNCPb1QazDd6ptC+vIz79cfhXYR7cfoNoKSTU1JINypvcwQQsSNj8jLJ9R
 q2Zg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz8kR9KD4lZPJ0xfeZDQmC2WDkBdzLS/qZy6SXMdM7kMobOYNTVHabZc7Vu/xfLK9pTn5PQkZ2vtsbn@nongnu.org
X-Gm-Message-State: APuU4Z8t4f/5A4DSq7U4I9hGsYL8PEC6RtswbYGbH+YKECMVCNP5Yt8d
 CPBNvBn/UgBsPZuX6voYLxE+8+Gsn60THIuBnU42TD5aPBaHV8JmJqLaQfVXML1A1m0=
X-Gm-Gg: AYBFou2dX6t5PLt+ndsoVdQKWuvX462EokUtYJc+q6Yu8K9ydKLzFrn9jmhMrhPFxVU
 /CZB2JS+jstqNIdzp3nj8HOwi/2KD72hivG5bfi4liYsZL2raAK6UnjwUsyWr38F7m7duEGk7GQ
 XfIbly4f/RZNtiwcY+NdFyU5LlPZfMaH6+Uh3RD9KwM2KooMwnQw1a6m2jkqN4y5trdHfgv710B
 U9gr7W9MgINa1/wWf+4VVf7F+N9nqDEufHB3IFrdPpyR2bbnDUy9kKPIc4ARp2i0mvmF1+hC9dv
 yvxym1m5C6RP7SSPFftZ6N90nP2H7T+9uanSmGaGCoPWnRpBJe57taTvD/Vab19ecxPwqFBoFoh
 +ZwUk9Lt6Mpc8vO/DW+8jZ0MxucmynDvuxjmPwUDvfMGPRCgLPprO0aV2V8SvGXb6P8YAa8sF+v
 FmNUtpMQIo9NELBPBgSOurjdKAfYAdqPyatNUTHfh7h1iI5P2DXe8PTm5IoQaHMdq7pioXnFJbp
 PapGBnXqLXJn7xuDqhROrXmTakrTtG8TVChYYaLIHTOvxQ3pwf+bjajDOxxJ7iWODzhLUrdnCcE
 zukKRj7xLNGODrrPZ/FK1CTBZN7fcHaiJeEbGelsxLHGTYTU9g==
X-Received: by 2002:a05:600c:c09b:b0:4b0:c1ae:829 with SMTP id
 5b1f17b1804b1-4b0c1ae0ad5mr232416905e9.30.1793894555794; 
 Thu, 05 Nov 2026 08:02:35 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b64809c39csm18122505e9.4.2026.11.05.08.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 08:02:34 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6F2235F8AF;
 Thu, 05 Nov 2026 16:02:33 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,  Tyrone Ting <kfting@nuvoton.com>,  Hao Wu
 <wuhaotsh@google.com>,  Fabiano Rosas <farosas@suse.de>,  Laurent Vivier
 <lvivier@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 02/17] tests/qtest/npcm7xx: Replace deprecated
 sprintf() with g_strdup_printf()
In-Reply-To: <20261105125203.40320-3-philmd@oss.qualcomm.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Nov 2026 13:51:47
 +0100")
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-3-philmd@oss.qualcomm.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Thu, 05 Nov 2026 16:02:33 +0000
Message-ID: <87jymr6zc6.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:

> Replace sprintf() by safer g_strdup_printf() to fill the QOM path
> and property names. This silences when using Apple clang 17.0.0:
>
>   ../tests/qtest/npcm7xx_adc-test.c:140:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_adc-test.c:322:9: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_pwm-test.c:244:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_pwm-test.c:245:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_pwm-test.c:255:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_pwm-test.c:256:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

