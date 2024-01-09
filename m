Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7C3C46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 14:34:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNDB2-0005lZ-4D; Tue, 09 Jan 2024 09:34:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rNDAz-0005l1-KH
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 09:33:57 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rNDAv-0003gF-Rq
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 09:33:55 -0500
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50e72e3d435so2901590e87.2
 for <qemu-riscv@nongnu.org>; Tue, 09 Jan 2024 06:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704810832; x=1705415632; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cKpiQmUug1k+ONhUsi7k1absNM74ek0qI+Tl6MsSYKc=;
 b=uF2CD7CViqoXDZ25UxO31jeg9gqv0z1uIyZWqge/lhS55umEp05Cqa/N7PsK55EOOl
 KEg+H19UVrUSRtHXCi9LOUacMxLhokNaGOUn6L+2p29L8Idr0bSNp+vY981h/tRGTXmR
 1gk5MEmZxpl8JifsJ9UHcLw3sCdXhQdBQfewpJunXCI1+N7dW+VJSUztVRt6y8uyMga2
 B4C9DfNx8MGcftzvWaphbADzdCTqHPDSqO5H57ur9nKygCH07t0Rt3zmRmoiH4QAJpJx
 wJCO8ro3ydRz8XXZafb2cr0s+xusLIfJVdbQ/0oVc4Zb9jPq6eZ4yxPgvekionCJUdkI
 AU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704810832; x=1705415632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cKpiQmUug1k+ONhUsi7k1absNM74ek0qI+Tl6MsSYKc=;
 b=Vn8BLUKgfEqBmF1k5r/ZveObmENLSUS//YYdqn/kA0iwKoE8L8JAfjGuz1tVix+oqw
 mlFeJ4i747MwKp7mwhR5rT9tyq3ERyeHf5OnR+YBUDoL/Cqrdnvq7vjut1EI7cJCo9qN
 bxh3ijv+gDp08PUZqypYhHJ6STPn6sLDwpMyog13FgMCzMfzxVcwaBU+jgwgZ6VDLGjm
 bmGPXD79tMR42RvuVzksosO8ChygDWxXwoGSbsA8YHh+QYj+RwIdIJoKa2bfE8EQcK36
 c9C1ILmLX6dnILlfWTy7Ac8vS28pdMAdOCttqpIPiiTmHbn+HS4HpE/KiWvW/DpER05U
 IxWw==
X-Gm-Message-State: AOJu0YyByXhckCnAOlL8w7UItmJnQ/mfnhJ3cKeSiGIA3OFER6b9CwT0
 27xSj/7Wci9uEmSbGeTQnjfubCMASN44QaKKcE+ln1fijouF7A==
X-Google-Smtp-Source: AGHT+IE5m6xVtiy3AwYkC+7EfPfJcnlLrnRf1ru49SQoFHhaBXQ34RRr0IgipBBwh8OCveY0e3PagOB2iTLMwmSA91g=
X-Received: by 2002:a05:6512:b9d:b0:50e:6c1d:5dec with SMTP id
 b29-20020a0565120b9d00b0050e6c1d5decmr1962461lfv.23.1704810832007; Tue, 09
 Jan 2024 06:33:52 -0800 (PST)
MIME-Version: 1.0
References: <20240105154307.21385-1-philmd@linaro.org>
 <20240105154307.21385-30-philmd@linaro.org>
In-Reply-To: <20240105154307.21385-30-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2024 14:33:41 +0000
Message-ID: <CAFEAcA8P+kDHv_crqDmrbzzJHDpy1fe4T_tXsu8+nWggmjymgQ@mail.gmail.com>
Subject: Re: [PULL 29/71] hw/arm/virt: Check CPU type in
 machine_run_board_init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org, Gavin Shan <gshan@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 5 Jan 2024 at 15:46, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> From: Gavin Shan <gshan@redhat.com>
>
> Set mc->valid_cpu_types so that the user specified CPU type can be
> validated in machine_run_board_init(). We needn't to do the check
> by ourselves.

Hi; after this change if you try to use the 'virt' board from
qemu-system-arm with an invalid CPU type you get an odd
error message full of "(null)"s:

$ ./build/x86/qemu-system-arm -machine virt -cpu cortex-a9
qemu-system-arm: Invalid CPU model: cortex-a9
The valid models are: cortex-a7, cortex-a15, (null), (null), (null),
(null), (null), (null), (null), (null), (null), (null), (null), max

This seems to be because we print a "(null)" for every 64-bit
only CPU in the list, instead of either ignoring them or not
compiling them into the list in the first place.

https://gitlab.com/qemu-project/qemu/-/issues/2084

thanks
-- PMM

