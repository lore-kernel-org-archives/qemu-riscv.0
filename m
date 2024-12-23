Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8046E7718B
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 16:29:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tPlJ8-0001UM-P4; Mon, 23 Dec 2024 11:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tPlJ6-0001Tj-UK
 for qemu-riscv@nongnu.org; Mon, 23 Dec 2024 11:29:24 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tPlJ4-0004Pt-3Q
 for qemu-riscv@nongnu.org; Mon, 23 Dec 2024 11:29:24 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43618283d48so32357395e9.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Dec 2024 08:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734971360; x=1735576160; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cvOlv5tQioQ4u3aXYsfz5x1SOijsn7NLXaLikJkyybY=;
 b=B1BceDJekwZ5qgpThfbhZbW97UmKbv5aMonoli8KA9C+WuzME0096GKXYb7OaQ26Dc
 RBU0/uV6WHLvc3LscHWxbEsdXtbZt59SysMLFfgR9oB82VnM+BSvxBeVYyBFJpYLUoq1
 ws+oySGgsFNNMYopJ/FSj9mRev7IjAtNSl+1g2jj3tUlcbwR9YiY2H82GIvItvKidpeg
 9h6i1qhDzfzaYPGjQndrGz0EiP5j1hb7u4t6eyQTkLLAZBVEcjAtNOTDYu0wtVYA0Htt
 GA8e0g1DND6WpgQlT4VQFOWGXQUdM3rfPlRC8uro4dB+jCyghVtihx5ewCl/xEt6wVEG
 7fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734971360; x=1735576160;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cvOlv5tQioQ4u3aXYsfz5x1SOijsn7NLXaLikJkyybY=;
 b=VIvAdYIuPZOtN7VP2QcjjgOpJH9GRt6R00PwzkRHoFUS8KyO9Mt46PBsndq2sh9UVe
 do5WP9ZVqmmFulT4no717L+eg6CvYQI3l2bZK31oWF/QTDgzub+vMHCrgi/awnZY1ipG
 MlPgzmIjlW924v/6UOxxWbIS/xFszqw0IcV0SurD6oFJUYvbHtPtK3JUVyB5MqJBO287
 DUL2T2XxdFbmU45WrjA4ZuWzb5RCdf8rZ3NQ6OXheNeqM2CxkPoEuBTTNZIhn1e8570+
 LRKmf8xGOlRpGYZ1Wfkge8lJXGQ6MmbzgGK9EDcPKNPEaOP6mJ+Gq1hBDPvMxyZUz5BN
 jGgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDF4gXddXWvLKCj36/uHJfuZPHwU/RRzxACKFloGj0fU/03JHOXdLgqPMnimdZRnkTFx57Hh5mMSjj@nongnu.org
X-Gm-Message-State: AOJu0Yxode5MXuaHUX+zXyHnEqOF9xogOyuXgSw6JDLHd+QV5ANM1kIs
 xxTypTux7WJPmeJCcF3S+WbvdAeVoSO3VmJd+fyECsS0/QTsFEyN1AAtJ523GS4=
X-Gm-Gg: ASbGncsf7hDgF4L0NfTGeLBMJ3BYJTT+qhnvu18tMkglGfjLg8vrGizEu82TitKhkxO
 v3CRRwP5YAy5G9Ps3ykyyIQh0WThZp0AfHQbRuavfzUW7/Wtqz7r46Xj1I5ruCoX07E3yxpvdaA
 +l50SJXPslDwzZnFJHEXgMWoFjce7Wjj07JzzBhx2u0PHJ53bB+UJDNc7GMPJcokQjy98AZIejJ
 YKIUEAslChYsvbADQaJNO64wEEBKUZl2amR+yy+tGg1qMekEy2AmMqyG4cF6DHvLTyJPRwQobfZ
 EJDGRV77O1tw4BgIeZw=
X-Google-Smtp-Source: AGHT+IHXloTob8qhc6hjhiXbNOoToSs1EV8md/IyAhw2Z4E5BFdPaA7I/WM7shYhOL5oWHGuR15zMQ==
X-Received: by 2002:a05:600c:4a83:b0:436:1aa6:b8ee with SMTP id
 5b1f17b1804b1-4366d356735mr97671865e9.2.1734971359957; 
 Mon, 23 Dec 2024 08:29:19 -0800 (PST)
Received: from [10.89.88.213] (51.171.88.92.rev.sfr.net. [92.88.171.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366128a44fsm140231775e9.43.2024.12.23.08.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2024 08:29:19 -0800 (PST)
Message-ID: <d861c401-483e-488d-a03c-cb11d0e80bf3@linaro.org>
Date: Mon, 23 Dec 2024 17:29:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 05/15] MAINTAINERS: Add myself as maintainer for
 apple-gfx, reviewer for HVF
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
 balaton@eik.bme.hu, Roman Bolshakov <rbolshakov@ddn.com>
References: <20241218202036.80064-1-phil@philjordan.eu>
 <20241218202036.80064-6-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241218202036.80064-6-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 18/12/24 21:20, Phil Dennis-Jordan wrote:
> I'm happy to take responsibility for the macOS PV graphics code. As
> HVF patches don't seem to get much attention at the moment, I'm also
> adding myself as designated reviewer for HVF and x86 HVF to try and
> improve that.
> 
> I anticipate that the resulting workload should be covered by the
> funding I'm receiving for improving Qemu in combination with macOS. As
> of right now this runs out at the end of 2024; I expect the workload on
> apple-gfx should be relatively minor and manageable in my spare time
> beyond that. I may have to remove myself from more general HVF duties
> once the contract runs out if it's more than I can manage.
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Roman Bolshakov <rbolshakov@ddn.com>
> ---
>   MAINTAINERS | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


