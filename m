Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A50F606A322
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JgLCMFxa
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMP4J-00086d-3X; Thu, 29 Oct 2026 08:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP49-00083F-6a
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 08:17:09 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP44-0000L6-0S
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 08:17:08 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-82380b0f55dso1063692a34.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 05:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793276223; x=1793881023; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6+HcOXlYI99FtRrRVkPstOSHsJIVF902rBA7j+R2XE0=;
 b=JgLCMFxa5BkUGXXF4UEoGq+i/6jTvRvtam+YiMyrtXWLTvaQwDZHOzMod4NCVxrYKv
 K6HPbBIZKlaSRa969QmQH/amNvJ6biNQpmOIXaaNLIV+IS1OboSY6yGk+70mpNeHEs3E
 uJLkervktwxat18jAlR2mPeZ5vIirSXwEPldcmRH8cb/qCuG4SSBUbhRSDffn06oH51L
 4tuw4olDp+8vT0EruKKV+4zemFOzY1+2AsaJVC5L44git+tFYvo5bekIT0JK54YYCgCi
 bIC8/EvpKPiwDFIzBUjP9SKfcwoGJtYJ87V0llz6pkc9laJckZtJHzA8zNI4StmRgJUc
 1cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793276223; x=1793881023;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6+HcOXlYI99FtRrRVkPstOSHsJIVF902rBA7j+R2XE0=;
 b=YK1Wk8VYQl1eiAHHXBRS0Nuq5fyW05GwoTLnwxsrNsmootSdghGjQ9aarVoLBQ3+Ba
 gs9kF/mlEKwb+EwsL3dwqhdC4SDYKiMaGO+d3F/mpEmKm3/j5ExlrI7B0Qv6VWvNBcq5
 9TrotP9fLQH1lgn59fr4HSJE9nEGQOH5nCe06dBA8m5sqUn6hGFqWsoq4Gl1gQQIjGVC
 9Yy83FkrlmQWJ2g1Qp5f6+L2J2+ybR5vGhjSoMSG9Eukj7VYSWZll9HXcEwSv4w9RaeV
 E5M1ssfnjWIkbDh92n+0exgn9Iul1tF156KLCgFAcEzm0JwA7BoGnIv/VyCOmN0+Vd17
 uEnw==
X-Gm-Message-State: AFq9FYLGyy5Zgkn8PmDjk2vJ5+JEANbEewJRGIwAc4Tb/lygHr8x7UzD
 1jUKmPM5tGhJO5WDkI7f0C7iTMmQs320XaMxV0CGEpAyZkGlH0b3BK7UzAXz8tc87R8=
X-Gm-Gg: AYBFou3EtdKC0Z6mTShbHMXFGRgPzMaDaJZUQxKaFeBnbSCLRmHYZS4N55bcjFe2Zii
 xKzOJGVrEljTXP5PK+Xiz7Sr0U9cuzFhUAukmZfCYmiyhwjNPQPNiZOlDJGa+MuSvG59FfA9i0W
 QiG1mPSP2PbY+eaAb2PrYOqYMJEzIg0Ct4DuXpQeiuMape5f7oEr+v1qXx70RWa/2zXov/F7m35
 W1snHYljBwxDG+OotGM4pZgkVUXbdD/9d2jo3zm1+vsMtbY+eLoG7ALVwXxAvNxN1+4kNz/4VHP
 mtIWu8qg2zy2BEs94Ef/v9GYAKVUo1VS8tsXbsS7DUC0BOYhLbfI/X4rwRkuX5P8L/YhSlWlLll
 LFLdY0dgBF5PEMJfyEssaJ5fNGwid8n1AR6xTpA832VF9Pn9DZhGmEjO/LQnAITkCY8bAF61vQg
 EEHkKDHeEiXsEkur7o79uKCFfJBxcxwhghEejRjD+pCKgVOQYeZj8VXKKrppf+TQZPqaU+o3Niu
 8a9poxMPuMkYbvkSZ9Awiw/hw/AbuwDdmcstB3l+9rjjg711XmHbLtpwVt+4fDhgLw/v+CkTreM
 DH9zHWUi+aoGn6O2t+PRRyKn1wLMaRVUdnKYH0NmZ7WP
X-Received: by 2002:a05:6830:310d:b0:81f:92c9:1f80 with SMTP id
 46e09a7af769-85aba231383mr6806151a34.16.1793276222704; 
 Thu, 29 Oct 2026 05:17:02 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85b1f43671esm4450677a34.5.2026.10.29.05.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 05:17:02 -0700 (PDT)
Message-ID: <cf5661cb-da82-4000-b7db-77d27623233e@linaro.org>
Date: Thu, 29 Oct 2026 07:16:59 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] tcg/riscv64: Use a uimm5 encoder for vector shift
 immediates
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-arm@nongnu.org
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
 <20261028143330.6518-3-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261028143330.6518-3-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/26 09:33, Philippe Mathieu-Daudé wrote:
> RVV shift .vi forms take an unsigned 5-bit immediate, but
> encode_vi() checks for simm5, so shift counts 16..31 trip
> the debug assertion (and are undefined behaviour in release
> builds).
> 
> Add encode_vi_u() and use it in tcg_out_vshifti().
> 
> Fixes: 006352d69f14 ("tcg/riscv64: Assert immediate in range ...")
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   tcg/riscv64/tcg-target.c.inc | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

