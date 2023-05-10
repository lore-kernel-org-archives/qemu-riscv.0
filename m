Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54377C77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:41:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwk4A-0005BE-9H; Wed, 10 May 2023 09:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk48-000578-O8
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:41:12 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk46-0008DS-32
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:41:11 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f450815d02so7131755e9.0
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726068; x=1686318068;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rnf9Eoqgvr831wszE6QYdNiWnaNBmkEZZwX9tcpWpVw=;
 b=unHxTO2ck2D4IzCcah0Xg9bCM7MFm2ayUXJBekyqWJuxpVNMJS3fT0DniV4OqbbS78
 +J980DuqTcBsEAFwy9teQqxQ2MuDvu0TT3BIYftaAh89oE5FvdvuFf2/TFRwTimGAnFo
 pCg8HZxNhbLRZKpxMvTQiPttUnGxrq1G5OVETzgoVmFFihbVd2aN7zF569CaLD+TXGeR
 9qPpRlgCiD+wNwux7N2gIOGy6qNlyDaQ6QGJCJfFSw9sNI6DzboIDvG5LaxuAd+P5IkG
 7x1bb4vC2ydmV0rbQeoDEJZgmBY4d/Lo5VQ22ZSHmZ9aPuKTP0CBgMUvHCFovVV7IUiN
 CYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726068; x=1686318068;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Rnf9Eoqgvr831wszE6QYdNiWnaNBmkEZZwX9tcpWpVw=;
 b=eJ+Mddpf8OiINFwwY+UB5sNqoSL0a/Xxeyk1wcy1FiTakpGZQGLybH5XROCUVNyhWv
 VGSJrcJJ2FuIzWtQQKT/7iTHzHkILFyWvUwpu4taOjWsRBECZcEFebHSHmqQ0JgWktdE
 WvdmSJiZpRYnyfgHXjzcPUSOYE7SGyAD7RrZEZnkUylDjpqHHr5azO21xdw1u8+jt6Ma
 NRmtJQrfMO8uvpB9zCuT/rk7UJcvzTXLSmlEpB4tnryLKoBVXOeP3FAKlTvsH7BRM+gr
 OJNLzwR9g4tJ/c1pWzgm+ylBOVspSbQvIYC2mhDTbnCEUF6zsDB6DyuEcdKGLzuRsxEJ
 yGIA==
X-Gm-Message-State: AC+VfDwyL/QG8CP5y2hre4wRgRIpYkIxqvTk8pY1gkIQuKUOAQ2/8apA
 F2fR/bcdC5dkrmk2/R9lyLOy5Q==
X-Google-Smtp-Source: ACHHUZ6NWg9JbDWyzHw02oqmjmHT+PtyAg84hM8b6slhiKz0o7dizDc+CgnesqoqaV2Isp1U9X6zzA==
X-Received: by 2002:a05:600c:214f:b0:3f4:23b9:eed2 with SMTP id
 v15-20020a05600c214f00b003f423b9eed2mr7710410wml.38.1683726068589; 
 Wed, 10 May 2023 06:41:08 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a7bc44f000000b003f4e3ed98ffsm870308wmi.35.2023.05.10.06.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:41:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E45561FFBB;
 Wed, 10 May 2023 14:41:07 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-19-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 18/30] tcg/riscv: Convert tcg_out_qemu_{ld,
 st}_slow_path
Date: Wed, 10 May 2023 14:40:55 +0100
In-reply-to: <20230506072235.597467-19-richard.henderson@linaro.org>
Message-ID: <87lehw718s.fsf@linaro.org>
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

> Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
> and tcg_out_st_helper_args.
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

