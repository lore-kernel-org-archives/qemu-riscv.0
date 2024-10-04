Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FB8CF8850
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 16:42:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swlNK-0002Dl-DS; Fri, 04 Oct 2024 12:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlNC-00024I-Oa
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:41:46 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlNB-0007Cf-0Q
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:41:46 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53988c54ec8so2788585e87.0
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 09:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728060103; x=1728664903; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kB3ZtAz3XEwZvlOLzS/NbhoRCoAtuz8HX62gKHoEQpw=;
 b=M0icU7F2VuYiSj9KTnn3A2f3rSQYFyvWoiCry9pxvmtiLZfWF63eOGxA2biM4WuPRK
 VQSKlu87Ckpaln0GY3H9ymol/p2J9gRpgabD2EC5UemYNnR3r2m2biCDolFNl+ROBuV4
 mQ2dJvPjFkyKREBf6KgaXh21X4hrWOUi0Ihr7aqjLvVC+Kpv3AZAhSlbAZbNTL713RF7
 srjk3BggUOVHJs3U64NAE3xZ7m38YyMsqBT/BiFlMudSf6DKksZt3sn+RA0L/I5IZgB9
 89N1eNA7BaTabvSZHN1tDtfSO2lCBzWvhsG7M9IYb90z1U4dVbV3w9WqCCOjTKVoygux
 O5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728060103; x=1728664903;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kB3ZtAz3XEwZvlOLzS/NbhoRCoAtuz8HX62gKHoEQpw=;
 b=OM01ul87sPhuxpWHxFqPqhvawDTmSNpg8L1CW92OwmGArLsabGwVwgf42a+5XkATno
 F8h1GCIM+GcoektFQ/VWvqF8G79uMc+gGrc9L+6tT4Kz46eDC3FMQyNwPXx2ivrPEOmA
 qsppO7xLTbfL9TgRtj3roy93FpsLF8x7JBu4OIqgR/NDRlgE7lmKCKDHF25vEWSgH5Tl
 N5fajM/Xg0RiXjwc9DGCsQ9dKAcBpwUjZk5jFTVcPqDJt7/diSoPKytFIrW3dupAOSF7
 f9n0fqfq9lJzvCoqMo2m6XLZnmEH0bZIVQrzUm+b2RA1zNEygGGaWnegHWfB82TM1GF/
 +Jig==
X-Gm-Message-State: AOJu0YzfzpfVxWaXBgN6mOgFM1MnfgQJ5P8ZdGFehScSjy91s+6K6o3D
 qGx1yKeTe6RNbLztI29Hqadtkqu8qui9lSmE+jk34qnXrnUm/9m+LidU3Zeznn4=
X-Google-Smtp-Source: AGHT+IHTzZyLnKKAduJSs3wJNzJl6SJnKRygY12UTU4C/h9iSNFiY0vz+TFehs7M6+JHAZ/+ng36WQ==
X-Received: by 2002:a05:6512:318e:b0:536:7cfb:6998 with SMTP id
 2adb3069b0e04-539ab89e01bmr2604563e87.35.1728060102940; 
 Fri, 04 Oct 2024 09:41:42 -0700 (PDT)
Received: from [192.168.132.175] ([91.223.100.150])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff1d12esm2651e87.175.2024.10.04.09.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 09:41:41 -0700 (PDT)
Message-ID: <7d0b35a9-52c4-4ec9-878d-06c1f54c599a@linaro.org>
Date: Fri, 4 Oct 2024 13:41:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/25] target/m68k: Use explicit big-endian LD/ST API
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-ppc@nongnu.org
References: <20241004163042.85922-1-philmd@linaro.org>
 <20241004163042.85922-19-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241004163042.85922-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
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

On 4/10/24 18:30, Philippe Mathieu-Daudé wrote:
> The M68K architecture uses big endianness. Directly use
> the big-endian LD/ST API.
> 
> Mechanical change using:
> 
>    $ end=be; \
>      for acc in uw w l q tul; do \
>        sed -i -e "s/ld${acc}_p(/ld${acc}_${end}_p(/" \
>               -e "s/st${acc}_p(/st${acc}_${end}_p(/" \
>          $(git grep -wlE '(ld|st)t?u?[wlq]_p' target/m68k/); \
>      done
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Per v1:
Reviewed-by: Thomas Huth <huth@tuxfamily.org>

> ---
>   target/m68k/gdbstub.c |  2 +-
>   target/m68k/helper.c  | 10 +++++-----
>   2 files changed, 6 insertions(+), 6 deletions(-)


