Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BDCE7718B
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Dec 2024 20:37:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tRH4X-00009F-Um; Fri, 27 Dec 2024 15:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tRH4H-00005J-Ck
 for qemu-riscv@nongnu.org; Fri, 27 Dec 2024 15:36:26 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tRH4C-0006uL-MN
 for qemu-riscv@nongnu.org; Fri, 27 Dec 2024 15:36:19 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso75170065e9.2
 for <qemu-riscv@nongnu.org>; Fri, 27 Dec 2024 12:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735331775; x=1735936575; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bJBzFpT7aUuy2BWNtvX33lOSAzbJvJLAWdbFR1icwUE=;
 b=Qj6Wlz31XY4y9JhmaY8SH3jfoR5DTRJqtSKfrPcm9Kz2m/PHq806qhMT3A2Rdl4GVr
 D6qZUYKGu1ZFyK9GlBIpEsOJ7RQhxfIsR/87RHpjURdFSDuzuFwY3qDPMhpLztqTMhnc
 mSW1HNJQeMlx7vBIdFtOkQDwIDXWt4IwLarDtZr7ZD3tfUinHoaGrXwAYz3xxlrTAu1g
 RgB8SBvZNnVupEE6UzTeRrTuEVpUu+5QIybjLODmGWN92lyYTEaS0+QSUQv5+F57dmx8
 bCx+hsrUWQVi2HFOt4kM52+FgckUHQ+B4SjR2IgcoIAs55sl2/Y7oK/Qr7OeU2WxInu4
 wPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735331775; x=1735936575;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJBzFpT7aUuy2BWNtvX33lOSAzbJvJLAWdbFR1icwUE=;
 b=v1+5IqOY8eCDx6fsmPJSynilyhMRcnoSQNg1xrNKJ+998ScKzysAwq4lDkTcBl/65O
 4gl3en+WF9/K6ubFykoBExC5kwbEeuO9Yxx0F51dJ05kY0HGeU5wdpfsVCGY14ci3S38
 /3JX6kRQE53lN+HHXMPKwRtDWQgBsGTKARgOzkXz0aNK2hAOknPek/gD0mstzAe0uMG2
 UcYRgfawIBUrsdZvTv8JFZpW74ziwV/WOpHU4S1EuTzYrKSdyhJdTkcjnRQHIzDRp+CT
 2UtxmIzsckTFdu2N7txg307M+9Uok8YT3wUECnN8xyeZEBaAX5vguQ5DPi7kwF2JVjjf
 DfbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgqTEokUOzYUjjlKrTRcSSIw/xAO/sVXMVmcJ6h1ERcTK7ff9Ebu1NDvJC7CicRXEpReN+zdgszVg8@nongnu.org
X-Gm-Message-State: AOJu0Yyl87hk/zS3f3lGYcF91x3BNnz2sDQZA8VeegSbXanVzYLg7Msz
 B/2LPn/vfRJCuPqHLECj1M5xYnwmpP7icNDEO7V7E1GIPaPJaUbiU/zIpkDkzuM=
X-Gm-Gg: ASbGncvoOJGnolU1uj+9b8i8GInsL8skLZt05cu5tKaignZc8M8viKkUgymmXPT1G/D
 6CKBQL9obCqO2sm5pZYmVD2oMHHKa2t1ZUJ1nlxBY0mw7FG6W1n1ts9PESaCplLXYvTh6cXk72m
 Cr2JA3b87MuNBirwwooCfQicoP0Uwtg7EdbiTkFNpsneasE3DKn7HuGlBkqob3+HXwFQNCHuVmZ
 wyCzM8mRBLvk6rCWc5hPpIiJt7Ss7XcIdmMzVBp2t+rDymGBrW1uiXZFQkuFkG0g+ZfY67eAfST
 AA+8kTT1OpYunPrVTreoOhoh
X-Google-Smtp-Source: AGHT+IHEExWh8P/Fs7GXDRSswUG/flN6CCrniwRZM9ozusP2KjufDudnImZHN3Q1FUc4lRg4dRuvqg==
X-Received: by 2002:a05:6000:1787:b0:386:3c21:b1ff with SMTP id
 ffacd0b85a97d-38a2240ffc3mr20593891f8f.58.1735331774957; 
 Fri, 27 Dec 2024 12:36:14 -0800 (PST)
Received: from [192.168.69.103] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436604e9c2csm277021315e9.43.2024.12.27.12.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Dec 2024 12:36:14 -0800 (PST)
Message-ID: <2ceda358-adce-42bd-9f29-9a2e441361f0@linaro.org>
Date: Fri, 27 Dec 2024 21:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 14/14] hw/vmapple/vmapple: Add vmapple machine type
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, akihiko.odaki@daynix.com,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
References: <20241223221645.29911-1-phil@philjordan.eu>
 <20241223221645.29911-15-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241223221645.29911-15-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 23/12/24 23:16, Phil Dennis-Jordan wrote:

> Known issues:
>   - Keyboard and mouse/tablet input is laggy. The reason for this is
>     that macOS's XHCI driver seems to expect interrupter mapping to
>     be disabled when MSI/MSI-X is unavailable. I have found a
>     workaround but discovered a bunch of other XHCI spec non-compliance
>     in the process, so I'm fixing all of those in a separate patch
>     set.

Should we wait for your XHCI fixes series to get reviewed first
so I can base this series on top (removing this comment) when merging?

