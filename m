Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326F9C0218F
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 19:57:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tc8kQ-0000yW-B8; Sun, 26 Jan 2025 14:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc8jz-0000oa-DD
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 14:56:20 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc8jw-0002r2-Rg
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 14:56:19 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-216281bc30fso87165865ad.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Jan 2025 11:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737921375; x=1738526175; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oZaiNxyRumKDQ6iU0NUlyhjPpWDJhbWYeJfxDmaXxDo=;
 b=JZL6UjYCJECQDBbxNEF6jwfaHb5VToI/t67QEpU+Uwvbd8mkWlwCGfDyGVvE73/SM1
 5qMryd6hBrgRnrTasI6UPPR3M0lpgtdUMeLKQ5R6IX+Y8/JhSTnS1/RBuXyrQG93ENb6
 kWXo1H+MpexS1Ik/FnexChGBQXMB2pW/d7df/LEx2IDXvAZxJ7TY5dNnSNNNiThqlPkL
 zq5wC6phmIogafVSADYD0cXmnjj0n7qZaBmCSzDb+9N3Gmwz4iY1k6J/VKH71UY8HCwu
 WjnUIouTWukE4Lg3TjVVql+LaGsQcTcxeYlN7+/qG/T0NEs39fw2HYlsqPFHMT1EiaW5
 5h3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737921375; x=1738526175;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oZaiNxyRumKDQ6iU0NUlyhjPpWDJhbWYeJfxDmaXxDo=;
 b=syXXcqHGg/jLYs9oHCwIPqghFbNUa6aIBQCDuH3pXy7zjZE+u+QH/eIWhrGjatEIax
 UZKaeeclf6I6xjNrDM0jn4BhBP07K6RgXRfZ3zYdFN0D6LCj9FxrUWkNr2zcM6d2sMH5
 6nsgsZkYHgVwl6S0LdlKQjeocAWn0tCPuydIDbI8pUDebQ3Nz0vT5Czvghdn2VAGaiN+
 WJCp64qEi97g3Cq4o/4LxNPJYQ14yhBBm6nJBiQb0uub6Wbq5kRMsNCHQG/BWrp6ds4z
 uidvbxfQD59EJb7UJHyZWfh8K71J5hxUiAokiWdS5gRQ/u1KKhdSvBMb6JP+BJjTOVI5
 P2Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5mMIzxZrWmSxbOkYYom49SdYB7e0lO6Xd9EO0+idQ3ejL233Ca3IYXdDWIapOq2gqu0k8Rwpf8z7u@nongnu.org
X-Gm-Message-State: AOJu0Yz312cD8X0k0QAbRmM1S/b8DD/WViz+w48YY9R519mr0oaS6ZqT
 0gvAG+6w+zrNjAokNjIq9uyMnClIE6HF3zED+/CNAlRF0B9Kg/ZkA2oYNMnKMVs=
X-Gm-Gg: ASbGncuGgM1diq0B4NacLw1Shg4+bhwJv/H55bC1Rcuahv7je/DakU4rtTw3R+7Zx+b
 bT1opKO9EjP/nnX668QDdaCG/E0OJj+BmITgsU7XLd682mw4GUchjzRQZADu3zd5TShshnpf+0G
 pf4/b3txcPW9ok7g0zlJj2YhlmMfi8h99mSV9T/TVjDignjl0+l5Wcdj9dzUGkfwBJE/MTz9270
 h4VfIxP2OGGR+iH3fhefwU650T9mkmkLH1uPvoGvQgf9foouIboHD2KoYTXn1Ohy7gl0h5sqha1
 lwIT730psP3zTm9Gmo1HKSAwDkx4a8dxUkZwTV+l4S4irVA=
X-Google-Smtp-Source: AGHT+IHO4WMUbjm+0GYB5uvcZM2pATyJHyNJ2uKrCdmerCTV19qq9YWTnaUhr9U9sZ/t561e+9mUEA==
X-Received: by 2002:a17:902:e746:b0:215:97c5:52b4 with SMTP id
 d9443c01a7336-21c35631dd4mr526655615ad.39.1737921375406; 
 Sun, 26 Jan 2025 11:56:15 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da424ef28sm48976545ad.258.2025.01.26.11.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 11:56:14 -0800 (PST)
Message-ID: <51770df2-ecbb-47b9-b5c5-a60decf0f751@linaro.org>
Date: Sun, 26 Jan 2025 11:56:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] gdbstub: Check for TCG before calling tb_flush()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 1/23/25 15:43, Philippe Mathieu-Daudé wrote:
> Use the tcg_enabled() check so the compiler can elide
> the call when TCG isn't available, allowing to remove
> the tb_flush() stub.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/stubs/tcg-stub.c | 4 ----
>   gdbstub/system.c       | 5 ++++-
>   2 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

