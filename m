Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91689CF8868
	for <qemu-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 01:22:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swtUu-0002tX-F2; Fri, 04 Oct 2024 21:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1swtUs-0002sv-Rk
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 21:22:14 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1swtUr-0005zx-0j
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 21:22:14 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-71de9e1f374so805373b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 18:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728091331; x=1728696131; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nVybPAeu0mGPl+eguL7yQ1IsL8HtCyFfGotJFqRE+FE=;
 b=j7OSidvcfky5Zogw+MJNoIFtLic3ECLpaZsS3uOP+jdpTeXQlHTgMFne3h6GjDi9mC
 OZkilQ3KnzxWEXuTh4hjc0pkBJmqMCYQvrTIr2ZLH8OB0eQds/vi8tH1jgMMp/V/GpQu
 GCteQOYWwV0GDwa3HfyhlpkZoaYWnwfEcpeEiFHEFLbVgoBPtBY/MHiGBISzoPexZaO5
 AtYc/2cJst7L5o2mSnuj1eVwELZvU73EJedzsA0a3ZqlOF1C8ZDAnmvrtAX3JYt7kkBB
 8ko/watG84OOiqisnde8snxrATxU62aqr4RApQNrKC5+ogMwoeBTQClPuoKDH9whd3yP
 Hdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728091331; x=1728696131;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nVybPAeu0mGPl+eguL7yQ1IsL8HtCyFfGotJFqRE+FE=;
 b=ZhVmpxL4sxokphQSfmh/KKNYJsMc/jFt1CmqBY2K+U80+x0YhS8C3iQEwKbHsWN6tZ
 6SgDZs3TBsjF0yXYU2byKrCx1ZPAFjeuNbz5GROmdjrbno3fUIx2R+skjPD9YHn1oaRQ
 PVcBShQ1BeBzoYN0WZOz+hoTg855gW2Ed/qcGIvZZLHiKf7mMPXFuWENgVw3mwz9Xxa5
 OiJmCmHY+pKwtYY8l/KL5x4PiL2fAnwG0eyk76T55TaWiL9Yqse/OvurkjL1vyXBVb6O
 XIeDsFVvFlY7XDbVwRSnNhTHdmGoVsC4ylWTYflxJ2wRC8c7IA/ZnysXfRAwzqeVRp7y
 0glw==
X-Gm-Message-State: AOJu0YwTfCGoWOX0zQyDP+ysdNFxwtrHVKdViZEFMQuiQbtcn300lQzo
 bgEH4WS7gqIVDOeKTJQkYA20Vn/OhM6qBcP5zpAIcHFl1CWKJvHuxRnG3qevD88=
X-Google-Smtp-Source: AGHT+IHiWkiYyDkyQUS1xYUjVdpyLonhfhWfUe0Jqr8F6BemJsOE/g94dl/pW3KrruuW/rXy93pupg==
X-Received: by 2002:a05:6a21:e90:b0:1d5:118e:5fe9 with SMTP id
 adf61e73a8af0-1d6dfae2ebcmr6500891637.44.1728091331458; 
 Fri, 04 Oct 2024 18:22:11 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d4530dsm511374b3a.102.2024.10.04.18.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 18:22:11 -0700 (PDT)
Message-ID: <8ad98013-9835-4607-a458-7c84395af871@linaro.org>
Date: Fri, 4 Oct 2024 18:22:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/25] target/loongarch: Use explicit little-endian
 LD/ST API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-ppc@nongnu.org
References: <20241004163042.85922-1-philmd@linaro.org>
 <20241004163042.85922-13-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241004163042.85922-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

On 10/4/24 09:30, Philippe Mathieu-Daudé wrote:
> The LoongArch architecture uses little endianness. Directly
> use the little-endian LD/ST API.
> 
> Mechanical change using:
> 
>    $ end=le; \
>      for acc in uw w l q tul; do \
>        sed -i -e "s/ld${acc}_p(/ld${acc}_${end}_p(/" \
>               -e "s/st${acc}_p(/st${acc}_${end}_p(/" \
>          $(git grep -wlE '(ld|st)t?u?[wlq]_p' target/loongarch/); \
>      done
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/loongarch/gdbstub.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

