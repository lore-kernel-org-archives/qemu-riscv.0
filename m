Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07B6C7EE22
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 08:44:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwfR5-0007e9-Ru; Wed, 10 May 2023 04:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfR4-0007dN-7T
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 04:44:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfR2-0002pk-No
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 04:44:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so45497305e9.1
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683708271; x=1686300271;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gyU0kcV9vkZrsW69f1JBVp8THmK2dLQWbgwsuYgm31M=;
 b=in6ZgQNhPTS2Ltyo610mmfkO/DqHyNTyErOLdFy2stkNFiVHekJL1+rBR/+grp/mk+
 WDlJ6/JWDOqSFw1Ok6zkbfFZGA7WLEYSd9ShSUL/8WQKYVv+Vo03wNhuLQ0AAJ9RRwaM
 x75hC8UScxkbKjU7Ewkjd/7LHHK/KlriEEIDLsE2J/xhwoMhYHXx0rBgKwNGiDYOdxti
 Zc0tCHzelAcM61tu2UOLNbK+QiSwoZ3xT10nlCg7cFY6e0m01F8mGmCHbzNRfgGvLaA5
 XvFcmWO61VN9mEmn10vaQC4zz8arrLu2dmMofHg2R2YYg6FlcFDcMB6ojOjcC9cjkUC+
 T1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683708271; x=1686300271;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gyU0kcV9vkZrsW69f1JBVp8THmK2dLQWbgwsuYgm31M=;
 b=A7YdvroCVE8Gwg5zuKSA0AOj25PPQ2yNQVdNfeW7qNTLg/luR4+dOqwhwMIfdYumby
 1ZJSEpc/Kx4XrEaPlzWeybbLoy41kx9+fCLr4ghERFdibRVPH0/p7cckW4gZjKzNVacQ
 YZeP++W1i7Vzf6DDPbfMaDltXU7lueI7XLNqHQ82b4dH72ecFTc9ZFploPuAIwrsZ6a2
 RlS46+yIo5+HH1JwV9k7qemMW6dwLbXVg2XwV4xY5swGNBqLEgE065qZ24b/42fN7KsX
 wcr3P7Dx58b3LrQbwBVzKGcpXsZGjGr/u8Q9vxkLLB/fbcKGTodT+54BAkx+0T4fHBP1
 Gd+A==
X-Gm-Message-State: AC+VfDzTWXHP/KV4KH4gcfZormKcf52sl0fX6seeRAxCpCgysT5EL6Gr
 rxW+xVT7XPz0vUPjzcyo4zH/lw==
X-Google-Smtp-Source: ACHHUZ6wMUHZBiBy9puMpXUi5YmNQa7ZTcR4KgwipBtQXRx8mqlpYNcmbPpvks+lD7YVlk+NrrTNEg==
X-Received: by 2002:a1c:7c10:0:b0:3f4:2610:5cc1 with SMTP id
 x16-20020a1c7c10000000b003f426105cc1mr6929273wmc.1.1683708270812; 
 Wed, 10 May 2023 01:44:30 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a7bc4d6000000b003f049a42689sm21845194wmk.25.2023.05.10.01.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:44:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C97971FFBB;
 Wed, 10 May 2023 09:44:29 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-3-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 02/30] tcg/i386: Use indexed addressing for softmmu
 fast path
Date: Wed, 10 May 2023 09:44:18 +0100
In-reply-to: <20230506072235.597467-3-richard.henderson@linaro.org>
Message-ID: <87r0roa842.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Since tcg_out_{ld,st}_helper_args, the slow path no longer requires
> the address argument to be set up by the tlb load sequence.  Use a
> plain load for the addend and indexed addressing with the original
> input address register.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

