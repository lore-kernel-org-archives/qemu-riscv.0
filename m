Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE84EC83F17
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 21:23:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ubQdL-0006IM-KS; Mon, 14 Jul 2025 17:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubP4n-0004RV-Tk
 for qemu-riscv@nongnu.org; Mon, 14 Jul 2025 15:43:01 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubP4m-0002MG-3c
 for qemu-riscv@nongnu.org; Mon, 14 Jul 2025 15:43:01 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45526dec171so34447435e9.2
 for <qemu-riscv@nongnu.org>; Mon, 14 Jul 2025 12:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752522178; x=1753126978; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+lFrh2ZQON1e3XRGw3qNs+I4bUE4joIBLy5ZQ2S5mtQ=;
 b=efl75ECpO0ABjtkN/obBKjSMTyI3Fm9ki/bUEIr45SHgXOF56OXocTbWna0LIw4DAq
 29CCPokqOWCrVDQoqGI+v99v4QxenvixUVHQyk0ILOy58EKHY27UbTtmlpZqTcuKkZ2E
 MbMfiADI8bGcPM1z45x/5rKkz0m4TLAypiJ1+cFT+ohinc4JOmCjiCMRAs0vanFL4zMx
 MpP1/2CE7oLGZBECrHwFz4wpgO7Lr6pofeBSijnAI6n1r5ilCHKPCg6fQrryILb8ZWgf
 rE2mFddKjLWn9Q9Ll9D5yXFdLkGyzsqf4jlOG+iI6E3uUHWRpSKnnj3MFe/iZvSZgz7s
 8Oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752522178; x=1753126978;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+lFrh2ZQON1e3XRGw3qNs+I4bUE4joIBLy5ZQ2S5mtQ=;
 b=MTwm7Q3TCBT9v9n4NXmJ5T3pVvqQk6IbkCQ3KZAeA4LDFCxYTDTP80ATazSvukqMi1
 LSyTPVn4tcxv9nbQcReMFZZkczIP1TWR0be5+l5S3Wpvm7N4mTFQUCzsrbVLaucz7Ktl
 zOqa51OCRd8TPiSzLZcFZGZpvyuyqSbzkoKFyIPrPHz7PeWKtCZLrMPswPimg+oeCWkc
 dZEZpv7X6WSE5kB4rsAr9VK3meSStQjEbEi+ZI/nYOf13E+h2PA4wpwAzVGf8g4PNIPP
 KbUp8rvRBgKM3xvguLM4/0GhAHDZ09edfRw52hCd5dIQuxeUjS9hWOGi6zRbhp0miSGK
 fGBg==
X-Gm-Message-State: AOJu0YxWnq42Bi4tO/2V+X5X4q177zqWf+wuwyQqKWciBQMCipgHwEo+
 Rnu+SVJswRcwFrmyCjnGsRd4bQyjz6wkPoo8MrSWbYwiQkX9loEID++GuUZrvN//WWE=
X-Gm-Gg: ASbGnctdh5JDajTuwDwXT7nun5uZVdTZM7nWypV1rrL+xnij/r3b66selKIirLKTr8S
 XwGjeNSCn4R6QiyP/zT3jVdgyKLiSvrJwkOOC0uY1SyrzA2Zo6N1GgCK6E04BgBbJ/0qc8m5+ww
 Dnz/QC1rn+OuhLSeqv6i9rAeEsgXBXdILMbI+YSFjS60+MngrtQT8zC7h9hxJYkeITQmKarMQSc
 XKHaABZ/34+kE801M2oUOiwXRVBq9j8WRMiAo+8guF+3TScTGIwmlzweAoA2NpMC8FlgO4z7m8O
 w4lssTm8o15+9/mOFvLpiNRtIj7P1dJq1e/qnk7QvkiUS7R+ohHdKS9PyBA1FZwzY6QU1PnpL9+
 taBF4b7YAp/6caPA7b16kxVi0BcyZHoVpmjAb+ikRkgCk8ZJXlIONhnk09gDq0tjHiw==
X-Google-Smtp-Source: AGHT+IGkPj2akqgdgfax5oXHuDcKzGx7SJKwgZl7TRASPFMh3IN/qEVxMYiLpZpt/bwjyOiuyBGXRw==
X-Received: by 2002:a05:600c:4f43:b0:456:2419:dc05 with SMTP id
 5b1f17b1804b1-4562419df47mr19491725e9.12.1752522178072; 
 Mon, 14 Jul 2025 12:42:58 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e26f7bsm13413503f8f.95.2025.07.14.12.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 12:42:55 -0700 (PDT)
Message-ID: <8f5cde41-225c-49c4-b7fb-1bc6d3ca7956@linaro.org>
Date: Mon, 14 Jul 2025 21:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: do not call GETPC() in
 check_ret_from_m_mode()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250714133739.1248296-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250714133739.1248296-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 14/7/25 15:37, Daniel Henrique Barboza wrote:
> GETPC() should always be called from the top level helper, e.g. the
> first helper that is called by the translation code. We stopped doing
> that in commit 3157a553ec, and then we introduced problems when
> unwinding the exceptions being thrown by helper_mret(), as reported by
> [1].
> 
> Call GETPC() at the top level helper and pass the value along.
> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/3020
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Fixes: 3157a553ec ("target/riscv: Add Smrnmi mnret instruction")
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/3020
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/op_helper.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


