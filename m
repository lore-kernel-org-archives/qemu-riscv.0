Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB07DC7EE22
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 08:53:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwfZN-0000jA-9B; Wed, 10 May 2023 04:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfZM-0000if-82
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 04:53:08 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfZK-00049Q-Az
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 04:53:07 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b425so1505985e9.2
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 01:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683708785; x=1686300785;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9SOIkiXkIyM4o7q0Y7vJZZZ40jzNxRUDcb201kohD/k=;
 b=uLt4QKTGmzQb1LAGuCCYQSUJMbH7tyStonlphWgOlZhomK/BjLsJvBBvlsjWpMh4JX
 6Jxjnao4Yt0oPkOfPBJw/0aGh3Ke5fI73tG7ch94h4mMmDYb0jhmzJReNQLyPa9TwbTi
 KoF9gWkMo66Oza9jFTem9CLxJ9nRtm8qAvmo4wtoImnt0VsAr7WghQFGXaKLPwPSMpzq
 sreJCpqYovAOQeM5jejjG5qPb4YOA2/jQAXAZn1Vr/T74quWgyrI6z8KY2KAFm9IrkVa
 AWJlHlbL39cttVnbmciBkM5UIiSG6h3LMEtb2DmN/R5L3QRMitXZ6vn3x+jkVqxD7867
 +75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683708785; x=1686300785;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9SOIkiXkIyM4o7q0Y7vJZZZ40jzNxRUDcb201kohD/k=;
 b=eCW7RY0xiH3XzYaeSkR1tZwerXeYrH3BbqNJ0v95tGLCLlTcY3uv47pk5ekGQak7Bf
 DAKh3ngbD88dKu/yyoVfz0NcWx6q/lqkb3oRf8Ro4G+Puf9Jl3LAX7vqBP77MPhu+DIc
 /XC1Fb19SYf7WE+r4cidJ7rDmBQ3tgaADjKm7JGza9NwmBVqfrcUk0Mny/Cr5pB2/MzA
 QVbcGU4yEojkEtC+cqTeygh/kBoHlKfglBvK/e2Mca0Zf1ZgZWrn8uwumdp26zMncPU7
 36VdVV6VpL0Zp6fIjiOu6cOwTVZ68eeT8IWyAVCDrxPhutM/u0IqWFoc0KSoJwDDjXLg
 p5/w==
X-Gm-Message-State: AC+VfDzRUGZ2ste0uWcYW6cR+l/r6kDFn0TM3Ir1RrmsZwronKBZ1rHt
 oV84stQ3gq8i4Kh7099JFlKh9w==
X-Google-Smtp-Source: ACHHUZ60qoTtI7SJ4nHyoeYOR2vRUCedeall9C5uVD8NKqUGApgLqcPe1MCP5xLFxi/nZ0VUkT84VA==
X-Received: by 2002:a1c:f211:0:b0:3ef:8b0:dbb1 with SMTP id
 s17-20020a1cf211000000b003ef08b0dbb1mr11594581wmc.7.1683708784906; 
 Wed, 10 May 2023 01:53:04 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j10-20020adff54a000000b00304b5b2f5ffsm16718349wrp.53.2023.05.10.01.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:53:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 16D2B1FFBB;
 Wed, 10 May 2023 09:53:04 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-4-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 03/30] tcg/aarch64: Introduce prepare_host_addr
Date: Wed, 10 May 2023 09:52:54 +0100
In-reply-to: <20230506072235.597467-4-richard.henderson@linaro.org>
Message-ID: <87mt2ca7pr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

> Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
> and some code that lived in both tcg_out_qemu_ld and tcg_out_qemu_st
> into one function that returns HostAddress and TCGLabelQemuLdst structure=
s.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

