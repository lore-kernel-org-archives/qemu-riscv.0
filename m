Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED703CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 16:09:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3zNq-0007xp-9Z; Wed, 01 Oct 2025 12:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v3zNZ-0007ro-GG
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 12:08:36 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v3zNQ-0003bH-E4
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 12:08:32 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-71d60528734so465677b3.2
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759334897; x=1759939697; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1uhjImz1ARsjEJI8cAqVGDV5ReAvP4bsdRzz2Hi4V9c=;
 b=J/DL6Qekw3kALfj8U0KZyjh/WK5rgRPYQ6KzGhfJkejyZzvAijxxa3vcT1b0KNaXyc
 TDdeBPOfGb6BKO9r4RbxqYUuxEz5xsBIg+XUwC8o2bTcZU93QTuLUvBkMJMOFJjdaR52
 x+HiV9UkL+yoNVrRldvMg+pUOciydQA8oAxf3saELTRq9A0wRj7BjUuKNGHvsRAjFyKx
 daQHuPuHpsVG0odQ+rXUfO4QTnjgVfS1YzwbLt6hy6eE4En0hAL7xV7//m+jHHI2/EJq
 Bl9EJ85Sa8ilQsmMeZ1WwDnHQtH0leCjVwFIGYq8NpJ9j1ebXixysRLgOv3ZdtzM/mL2
 VCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759334897; x=1759939697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1uhjImz1ARsjEJI8cAqVGDV5ReAvP4bsdRzz2Hi4V9c=;
 b=SVcbk9qzOVvMxjmJ8wJITun7F6qigeaXm/fBgxAG1FOyu4xLJppvDjQkjfkGbGq67n
 0mlZPjGQ+HFAkwDeBdHWBFwJMxl43mFNLP68Y6YXHN8SqijcruvHfCfGjAnJ2PKm8/dK
 fKd6JBPzDHI/vE6+4hEbXQWaFk3lbd69wFJdzxMZhhTkov0j8U2PAQvSrOzR71XyeeAb
 JqWByh/4zgzvqsw0lLQsDQHAVqrTG7FRtiTh50BcEb2xMxWzimlx/yX9yxhapXVckS4m
 VjSK7g/LnAXJpVyoOuPGvPWGLTrIxh6E9st22/+fZnxyDCr6WPsn6qx0aKPF7PTqrhNe
 HnXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/+T9zfXvFJQmapcqh47mxUnxfCgvXOLwQHyv6a8O1ICDWlBJyY4Tw9aCzyTaovKRtQoSbem8oU+yL@nongnu.org
X-Gm-Message-State: AOJu0Yw+EJH8W7amPzQd/x3LFwZJ9HhwDnlj6aUWj5L029LQiWUdYR0s
 Lgl8Q+C8zEU2KnxOfyPcKpSM+ZovvhRVlmOAFgNgElQPYRo5dvE3Oq2XKpY9MB45WgNOw59Nb/j
 SZAyCOef0NnbCDgDmYxcYB5v3eIvQ36WeVVhaD7sosw==
X-Gm-Gg: ASbGncvB7qFiybYaEkviH8a2t6peryolMT2dVTnQSNov/dFwEY2sdpPw7/WcZnm+eSj
 2ZLQyNtNI57Vh6UkH/RmOPv51RIuWk3GU/zE7/eHydPfGnime9FM7PCWnH3hZyq71DvI1wVRX6C
 YfzBEQettizGdnQvobjPEMVo22yz4zcUS7obPBP4xdalDJ9zuGOSi8Hlmv7n9/wT+PtPdaMyvOK
 1zgEywwq1mM4BpZYAPo+d34cqYB6r0F8QQBookge+w=
X-Google-Smtp-Source: AGHT+IHoYmujh+ngr61sUEQChrIjRT7eIMmc3+Maq5QgQ/YNihIQq6LdvIUOvIYoA0mpB6KXjQYBWJm1phxDB5HlVF8=
X-Received: by 2002:a53:db09:0:b0:633:aff2:d73 with SMTP id
 956f58d0204a3-63b6fec8f93mr3901206d50.5.1759334897047; Wed, 01 Oct 2025
 09:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251001150529.14122-1-philmd@linaro.org>
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Oct 2025 17:08:04 +0100
X-Gm-Features: AS18NWCCjl9FtX38MysgzZN9RRCNI1ODO31lSIAWe3O_HbUNCUneU4cyytbeDdM
Message-ID: <CAFEAcA-daogqBPxt72qTM6BuMuD1wuw+vXZwxLUQftwY2FZk=w@mail.gmail.com>
Subject: Re: [PATCH 00/22] hw/core/cpu: Remove @CPUState::as field
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Wed, 1 Oct 2025 at 16:05, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Instead of using the convenient @CPUState::as shortcut, use
> cpu_get_address_space(asidx=3D0) to get the vCPU first address
> space.
>
> The goal is to reduce the risk of AS mis-use for targets
> that uses multiple ASes per vCPU.

I'm not sure I agree with this. The cpu->as is handy for
the large number of targets which only use one AddressSpace:
which is everything except arm and x86 right now.

Targets that use multiple address spaces need to be careful
about which AS they use by definition. Unless we have a
track record of code in those targets carelessly using
cpu->as when it should do something else, I'm not sure
that there's a benefit that makes it worth making the
"use the one and only AS this CPU will ever have" more awkward.

thanks
-- PMM

