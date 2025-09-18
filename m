Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BD7CAC59A
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 11:56:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uzDFQ-0007J6-FB; Thu, 18 Sep 2025 07:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uzDFN-0007Bs-QY
 for qemu-riscv@nongnu.org; Thu, 18 Sep 2025 07:56:22 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uzDFL-0004os-BH
 for qemu-riscv@nongnu.org; Thu, 18 Sep 2025 07:56:21 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso6695385e9.2
 for <qemu-riscv@nongnu.org>; Thu, 18 Sep 2025 04:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758196575; x=1758801375; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ea4dGLZwkNAAjB6aRS/oVWq8L6qzJHadECqmXARy89A=;
 b=KPx+iMM9ZQEGQeTuwDW/WJ63Z+mwphiSCu7LeFClH52pn4EBG4A+6aBjlDd8YTt8X4
 WeJoMWywqANbGV0QsbEBuAo3j7H+B8Y64fLW9PEupr7kXUPqDJrBNXBvkKhedmdDdpTj
 witkmlJSn7mqk+DvCtZqlPYx7/BxNKRjWCdEueVkqskvnOBsgk7EGQ1dSKUI96mjtwU7
 HzC+Rcp1fc2DjBGRCJehLpUH0ZDR4damy4AB3tev7rPlO3FcN2ty7NYWdrM6/dSAgKcG
 dUf/33xyMhwaD6Mvapf7pgxPMAOu/qUMZ1wUQzwTOkCFl5iH6e2MEURrVUbyWYkSUIQC
 MjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758196575; x=1758801375;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ea4dGLZwkNAAjB6aRS/oVWq8L6qzJHadECqmXARy89A=;
 b=X52MzMxbpoi1onKsS25G0+RYEpZ6Mtkf4nEHI0Ga5xtsgzqfYhGFQatkRYrnj21WeU
 1EsOZHpX67Dj8eSd/EwvF0zzYCO1u3f0hcpq08mk2AH8rAYuE0QTAYC4cXX7ELaAUsIp
 itBifmBiivnIPpkxLQNaHz5N9eJbHh5Y92ckGeALacqGL8W7pPsnXfyEXmc6uL8OErZA
 lHtd5PdnrXhAWrSUFbcRU1y7cbDagWE358SvzQ2erJD7/teTnNNpMSPEveObvLIqGJNq
 3vt5E+ExjdUhQ6aDQepSU74v/04ncYTaaZx5Mq/q23EJ8pbbu9bM0wL6io+6hVNsdneo
 q48g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0Yv0ndvklsC/B+8pt24xknK56bPZhoGdm7Z/BCyEV4H1BHEI0d6JuEvKGMNPc4XOdtkQevdTBH2mj@nongnu.org
X-Gm-Message-State: AOJu0YxdmIHXt/B0P7JnIHc1XnemaTYAckZatO2kh0pVSCG9vDddcDyS
 AKQR+/0M3JBMbV/ITbulA/QeWL+6D65ZuAVrleA7ZCIPzULJh9WAfaOVbJxHSeXa2vg=
X-Gm-Gg: ASbGnctM0lGHpieu0eIHzoL/ihuDMp8Ekf+OLgb/Z8dDD+IzM8YB+IO7gWSVNu6ztae
 Mq5A3iegAfbzOOVMUDi1CV36mjL1WhSJsu9yZQMdRJnpOmXkeA/3LZaryZfBtMw0BYamb1crIjW
 SFEA5fqNS+sOwPxpzFXd1BKVbUsnBCGAwxHunZolhh5s+6LPyiQzYNgiKU/HaFl+i7KaV71PzQF
 WYNFZCdA92qJ0fsBDbeLjE/Qx0HFeO8hk84volapwqMfLj+C5qYEZzA8VH8T0oieZDp952IKJpX
 OaGKoyNPXBC52E02+p9Onip804cCu06+owFvGCyGZV73wi0o5zaHtD1PVDbjiCsE/ST+gDOPYR3
 XXITH5yYXmoi0fYUKnLlGN56m/M5cKMTNDWx7NC8iYQ==
X-Google-Smtp-Source: AGHT+IGVamkNTcu9utD5pHxzuFfZ+jhfrZ9TwzK/0zXfYIby6q9QLkSPedCiw9zxurwYCpq6P6JcTQ==
X-Received: by 2002:a05:600c:1991:b0:45f:2869:c3b2 with SMTP id
 5b1f17b1804b1-462072d723emr55655395e9.33.1758196574857; 
 Thu, 18 Sep 2025 04:56:14 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f16272e4sm43170925e9.9.2025.09.18.04.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 04:56:14 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F02FC5F8AC;
 Thu, 18 Sep 2025 12:56:12 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Alistair Francis
 <alistair.francis@wdc.com>,  Weiwei Li <liwei1518@gmail.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  qemu-riscv@nongnu.org,
 richard.henderson@linaro.org,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  philmd@linaro.org,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 00/12] single-binary: compile once semihosting
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org> (Pierrick
 Bouvier's message of "Fri, 22 Aug 2025 08:00:46 -0700")
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Thu, 18 Sep 2025 12:56:12 +0100
Message-ID: <87ms6sm0tf.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> This series compiles once semihosting files in system mode.
> The most complicated file was semihosting/arm-compat-semi.c, which was ca=
refully
> cleaned in easy to understand steps.

Queued to semihosting/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

