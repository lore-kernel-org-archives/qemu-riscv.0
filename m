Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D716DC7EE22
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:14:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwjds-0001Lf-F7; Wed, 10 May 2023 09:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjdp-0001Hv-Qc
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:14:02 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjdl-0002yo-Qu
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:14:01 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f42d937d2eso10649995e9.2
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683724435; x=1686316435;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fkPitXG+2pvHy4Df7CTJN2gV9Q5lQg3x6ti74ywiyR4=;
 b=pdYvUbNf4Q/WjBbI7aUT1X8lO9Ix3X8Fx4Ro5Hz5YN3aNnHFG8qIMPXqGKuqVpNyoQ
 hv4rCh62x2cQLvccENJ5+dXZqJuGFySH/TFpZGtRQ7gqbFkogbqOyjS+ex5JV6Y9BBEI
 aCxhlvDI1qlwJMWy2xYZWduxBbiNLVaQ6Jp+3QYRlBo7mqc1eeRA/B68nRL+dj3MNeAN
 eoBYZxzfVYjxLBJn2RLWQFRbfastLpqO29Ml+R20AtYsbuSZPxGF5jeLIpGVJg6yMX1V
 uyY+/O0qVUQx2a6u7ScVT86TXUrqMTecgeorBz7hlUcvOxS3NcXC4td0XEvakAt5RwML
 CVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683724435; x=1686316435;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fkPitXG+2pvHy4Df7CTJN2gV9Q5lQg3x6ti74ywiyR4=;
 b=ifXeadKcgqn4RDjaCInBsSw9FLYI72pSTTArD/c1IJqUAicrpQcyt8zULPpBHIuxjj
 GsBb0WN5t2JOGzlak7jbzlc4flJD3fZgelSwR1Oj9GMYEd880KOAE3t84DhsqLzh5xk2
 JX8I9UsPldgX0V9z9uWAHXEmrJzefHheem5rez+++BH/TK4USWJqNWx6askX2Ny5q4IZ
 I+q4yuJI/AmLkrqOVn0i1fJ6pgUhFaESJv7sZ0LCncvFjTJPMMCMYor/HPHfd36I5N5F
 uRs7McqyiFP8UxmyRscyyy3wd97ZwcIdZNdAWUM8AYR8pgLg/EzSiyFOhsiP4BS0TtUR
 5ieQ==
X-Gm-Message-State: AC+VfDzBXMxQ7WSv7PNh/GT/Qm1AYtk2c31mOZUV+dBbUzKDcvwJzuKm
 zX1ijxBDrIMweyM37NGJ57tzrA==
X-Google-Smtp-Source: ACHHUZ5mt2pqy1Xrj/SJ28YboBm/ETIG7k6OTLiabevOL3y1986sS92+sZ56kYkT/Lvg+78+xJRzpA==
X-Received: by 2002:a7b:c5d3:0:b0:3f1:6ef6:c9d0 with SMTP id
 n19-20020a7bc5d3000000b003f16ef6c9d0mr11671780wmk.17.1683724435205; 
 Wed, 10 May 2023 06:13:55 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a7bc34b000000b003f195d2f1a9sm22686412wmj.15.2023.05.10.06.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:13:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 950631FFBB;
 Wed, 10 May 2023 14:13:54 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-13-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 12/30] tcg/i386: Convert tcg_out_qemu_st_slow_path
Date: Wed, 10 May 2023 14:13:45 +0100
In-reply-to: <20230506072235.597467-13-richard.henderson@linaro.org>
Message-ID: <87bkis8h2l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Use tcg_out_st_helper_args.  This eliminates the use of a tail call to
> the store helper.  This may or may not be an improvement, depending on
> the call/return branch prediction of the host microarchitecture.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

