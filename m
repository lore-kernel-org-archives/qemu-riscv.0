Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9BDC02181
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:08:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbN9m-0005Y1-SK; Fri, 24 Jan 2025 12:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN9K-0004re-Vd
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:07:20 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN9I-000549-IH
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:07:18 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2efded08c79so3527216a91.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738434; x=1738343234; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9HIhApHPUcItsyCSDsIoULth5Mm+x0u9g6ZWdn8PQzQ=;
 b=yGzGKQOaUD48z638PoNe4DB/iRWW+EQZxvrsh5HPY9lNqyenzpgP3QXoIIKVyt8gGx
 ZENMiIpAXV0+yaI6XUD7SZlKa3Oa7mWI6T5oiUlty36i90LcHgIBE6RCi1Ew0A+VVcBR
 dW7c+Nvb8PslCFesS7S2BAkZbiJ5+GseU//Fy5xahJdMglEaOZBKlCC/7hdGCC56+HjO
 gvWey2KaTYTivqtSvwtTCmUrA7ClJj5u68Xn90MHvnW909uaESX+7FflRTs+/zn3G6TI
 DXuJNYWOtQynMtbfqNj8jF+vEhqynMC0p4JaL7/QY0B5/bcYDvfixwrpKOe5wyxri+2H
 IAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738434; x=1738343234;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9HIhApHPUcItsyCSDsIoULth5Mm+x0u9g6ZWdn8PQzQ=;
 b=o63AEgQe+aIZrMlrfZ/ORoJxzst5Zsgk6xLvdfc6AA0l+XUwHlMEc6fodDIN/Usvhh
 oIaAMqq9DVB5U3XkpFBw319U1nE0ALGpoEtYyKPgROQT2HolRG4Fh3wYoyUf6mCT0bey
 qS1Y27cDgUZuEhYU4sCpsqkxTfWIlkya1nKOslFypVEZaaynfKOc+Qwb1SIb/rq+V9HI
 ODu55r6ZBzY1nJH1IXSqq7yCFnpvERtHwhprND4ptSXDtEwbkYzIiWRGtUbVXR9PENv7
 LgfMBgwIR6GJEsH8+b7GmgXFJLTBGx4aRKA0XGxyT6ZQBkeT3w6jacTgaMukpnFpb0SK
 lWPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5Cf9KgMsg6J0mk8Yi8XCqcjDP75gjuQTrZ878+9PkIWitfECjCyt5+nvANSvWKi9V2kHSdmdzasAd@nongnu.org
X-Gm-Message-State: AOJu0YzY8xcwe+UDw3NWKCbN2Bkh/8eI9PVSBnztF+Sc7E+HYOZzVWSl
 d2JVmh3wM9uPip6MOZJtq8kH63W/MeZD2KA5JzWaQIvs2q1Lg1xBj+zHn4zt4Ykv/qlufb+flfE
 v
X-Gm-Gg: ASbGnctd7iMXS0jlT1zR0wF0dy+DfFQ6Y4hUrCUhRj2B0aEIl8p4cRjRsXbv3/rex5E
 z5VR8ZWPhTbFIPwFku8PmP2FN2pGwm+bb2fFhq6/3UJ3TeirX3iW0wJijwsa2tKcAAeieNePWhS
 LW82ON0KxCLYWpxChySdM+MWeM/dYzR4aJUoLr1wg8hIHbsll2oKb8p+P/IUuu25E8u4ZuR/DKg
 LlmO8NriAiOhrYsSjuuNxtkpQaqTmph5uoSXNDNed1CLpu2tiMWGXDDm7tSXmhldpcAkaGSQyUL
 Ah68Llxir0srbwo43sC5giLs
X-Google-Smtp-Source: AGHT+IGuvC4H41KAWyICSvtvXJAn1n/1/p6ciomsUtc7hknZQVPxOcqPsXqUlJDCimSebwlSFwXX+w==
X-Received: by 2002:a17:90b:5344:b0:2ee:d63f:d73 with SMTP id
 98e67ed59e1d1-2f782c90af3mr47169962a91.11.1737738434530; 
 Fri, 24 Jan 2025 09:07:14 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa56147sm1994652a91.15.2025.01.24.09.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:07:14 -0800 (PST)
Message-ID: <6f83fee6-1149-45f9-ba1a-0b1965078951@linaro.org>
Date: Fri, 24 Jan 2025 09:07:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/28] target/hexagon: Remove CPUClass:has_work() handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-12-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Remove as unreachable code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/hexagon/cpu.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

