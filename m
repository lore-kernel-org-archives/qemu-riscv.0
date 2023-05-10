Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BD3C77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:18:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwjhU-0004wl-9O; Wed, 10 May 2023 09:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjhT-0004wA-AR
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:17:47 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjhR-0003mq-Io
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:17:47 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f42bcf5df1so19583735e9.3
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683724664; x=1686316664;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFriCZonhOuk6sv5IQYLJJX2xl2EvXiMAlMqHv/V1Yk=;
 b=iZs+aJT7D9xRmbb5tR0YQhjxdelKCGKqh3+CtZhMoMZi4eKIG0g01UzmCy4WjnXhZU
 TDaT3o109yRLm3lpMGWOkqbErQkVnEhw2zIhmCQLtbs9WqUu38KZ9j0JtRQQCxSbkfRk
 VLKq62hOHSNmqFsw+d4Q0vQLyvaTnYnd4sH1c3VVnAje6ndktM7J+8VxHVuJLx/n6G9f
 2TreLAR48Kat0OBuKY/P4ag9HDtYGRk0Yfp4SBcOi8SlJZge8vHaG7LtpNdgps/ZewWx
 CaTKLthBEyFXOixiOz+sx3IMnXFE9YYzz3MkUkRhzU2/FL8SnoldnnKLM+g/Afnpau/r
 dm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683724664; x=1686316664;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hFriCZonhOuk6sv5IQYLJJX2xl2EvXiMAlMqHv/V1Yk=;
 b=GlrlFDJIr1QKzAiML37PX1eQc1zym0zoYH3wQlz9Hga+sGFVyqRscJiVTVPb+xgYdI
 l3yX4PrMa3ixv91icknycOKPT7LFykkTgPYhbSYUFSaA4gGplxD3xDJZxbC11trCCdbi
 1omKGfkbOwzORfAlh3zFwCIBmWdhCgPpqq/N+q6x+kq+KPFYWWp2ZKdybcP1l/m4eiwK
 0aL5DaKW9qiAheOjenZEav3k5EjlkgZ0oBafXUWHS+KSYmMWVE7FZq0nbNwwm256JOMb
 h06WCZUiVzvnoi67gtKRUD3ams5Zv3XB149veHxL9PQlXhTFVGLrPQiVdqJIvfNpbYDy
 OLyA==
X-Gm-Message-State: AC+VfDzRkQnin5FXFLhyZSf1gCE8JZjJFmYxKahNQdVvTSVNnJkJPegC
 543+QxzMgQpV+8UChgmHCXbYaQ==
X-Google-Smtp-Source: ACHHUZ45pFE5DSmDCOoMgBcrdPyfL29FaJQVMIYRcYfDbdk3ItROYy0dA4WSKqzqwLVk6WlbI+5CFw==
X-Received: by 2002:a7b:ca42:0:b0:3f1:6fb3:ffcc with SMTP id
 m2-20020a7bca42000000b003f16fb3ffccmr11524030wml.22.1683724663793; 
 Wed, 10 May 2023 06:17:43 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a5d4e49000000b003047ea78b42sm17117181wrt.43.2023.05.10.06.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:17:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 20A431FFBB;
 Wed, 10 May 2023 14:17:43 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-16-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 15/30] tcg/loongarch64: Convert tcg_out_qemu_{ld,
 st}_slow_path
Date: Wed, 10 May 2023 14:17:33 +0100
In-reply-to: <20230506072235.597467-16-richard.henderson@linaro.org>
Message-ID: <87y1lw72bs.fsf@linaro.org>
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

