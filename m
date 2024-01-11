Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F259C47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:01:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNvcY-0007Ky-US; Thu, 11 Jan 2024 09:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNvcW-0007JX-Gq
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 09:01:20 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNvcU-0006cq-J4
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 09:01:20 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a28f66dc7ffso1157281166b.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 06:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704981673; x=1705586473; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h2RpPuGEzbLXO/q/GxO4Zqvt8tldWX4SahttPk2YlGY=;
 b=mjbEP/5Czqm6w4+cQ6oHNMlamPBGwc8U4uouXYdLe6dSOm23tIGxQYzOoRsiJ70AX0
 Xbh4w4FlH7D51lYX+OQOmeyu17I9+MKD3QRf4HjU+N1G+m2UUwtmp53GuhcxRgZV8+Kx
 04NWfIcl3j2i+5vKZQLWJYIQR/bq3SUSxB6jdnaGHatlmUNPNzgvjF97R9YANMzeI8fl
 0umQxyYQZBTYBkpXb5ug4lOvJGrjC9FAaemPmwYXcrjLatGikojICGnUtQRwsI6NvAZr
 R4NUiKqrLfs/oA3GyDFvcl0p0TV8hKlOi19yvoklcSvKP6HQQxG4I01vEm4lVEZ5KyhH
 dXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704981673; x=1705586473;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h2RpPuGEzbLXO/q/GxO4Zqvt8tldWX4SahttPk2YlGY=;
 b=vuvlcjJLujICP8JUmt9NvMNu7JoIXBglE/H3d2WIhWlCLGX9Xlyst1FL2n3SdDYHe4
 n+yqKRLQrAEEQbPWNki2IPhezruy0XyzXO9iO51heNvw5SAQptqwNABjV+Exs1e0tuVM
 BnKtDgVr2VvLqzecDSL5QNIPblPkixUEligVRoIHBnhgFHeX31CK+E8kNyIQ1S5n0MDq
 bXNsBgizCdytHUAh4Z+aozVUc49BV2HvTezvlmvlNG7yH4Px7/Dl2NqP+4bucCR8SRmh
 n+evYO7fefTvxgcP+653jxkqjbpmvTY1Ba7ORrKZImQhC4BJSgHJHBw9CrpT6D70JJ7Y
 kQpA==
X-Gm-Message-State: AOJu0YzSnTmJh8XGwjzoh0PDEfZHww0EmLDOP8cRkYnoHS+Lp2T7UA9I
 Y0MFdQ8QwGSu4B20Xp4fKBHlQEZFi31WWA==
X-Google-Smtp-Source: AGHT+IGcWANbw87s/pDAASQo0NAdJFu8b2B5QcVIq5BEGgMbk6bZ7fUKghDc+/ZCqix/Dq8gHhpb/g==
X-Received: by 2002:a17:907:9488:b0:a28:f6a2:ca7c with SMTP id
 dm8-20020a170907948800b00a28f6a2ca7cmr1065105ejc.17.1704981673304; 
 Thu, 11 Jan 2024 06:01:13 -0800 (PST)
Received: from [192.168.69.100] (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr.
 [176.184.43.236]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b00a2c5ec21e0esm575137ejj.85.2024.01.11.06.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 06:01:12 -0800 (PST)
Message-ID: <00b95fa5-b289-4476-b1eb-e97bc6f9986b@linaro.org>
Date: Thu, 11 Jan 2024 15:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 42/43] docs/devel: lift example and plugin API sections
 up
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-43-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240103173349.398526-43-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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

On 3/1/24 18:33, Alex Bennée wrote:
> This makes them a bit more visible in the TCG emulation menu rather
> than hiding them away bellow the ToC limit.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/tcg-plugins.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


