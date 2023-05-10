Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534B2C7EE22
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:17:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwjhI-0004ho-QM; Wed, 10 May 2023 09:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjhG-0004hM-LL
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:17:34 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjh2-0003iT-GO
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:17:34 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3075e802738so6434043f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683724639; x=1686316639;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OTpZQRRTqoW/VPiREC/JF0L5Pq0GPPrhgUSeM+XjIII=;
 b=drR3p3P+Bg/eD3JBHjznjn8FQSpIc7pab0DHjbpwbUjO0koyFMxqZb/ScaSz5y5Slo
 O8pQZD7dGpQ7jDAnO+kynsOL5xYENiW+1BIWHnOUflUNKFaRr0V5YMkCNw2tlr/nE7dl
 0pV8R0xfpZkCegUAvCeXYd3G9sNuvXvz6RUV6R84kST8kSEfSvpY2Hwjjf3Jqp570Pak
 1e5u+koiHyAgBlsJ8VBFkAX/+IM3QBUsuaecNDhRTvU+MiegUPN4oKeCxtnp5l2/Hljs
 LVq1aSF/TJWbW8kJbRbHLhJfgZ9JP3alizI7nHJpJmmeEer7VlYFMxTZi9DjZxQF/A9X
 rlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683724639; x=1686316639;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OTpZQRRTqoW/VPiREC/JF0L5Pq0GPPrhgUSeM+XjIII=;
 b=A8Lfw+c1OnRhjSNfNTxeuH5qkP+Xu5yVWydXNwWHvnbDhAkqVMMVe9NijrBqKU8DU3
 xp1ygGA7NMb0ucoJl8/XPZehcc5dDA9QKWag0VMhpG0eyc7XcmbHHnrQ5LDF8dL2Mfv7
 Pi7GCxII7BbGn8K8ylBEVSfsYtXpFT7PvD46V0vQoryIQFR/04o0FpK4L1737lVCl+ey
 k4X0TMSNQPd9aa0OuyJbRpKRi5JtRU4Z2aOYBuE4WIisAeUEfXpY7pWJoNJg5r4OXoDO
 oTYDrx5SnRg95x1tiQzqtoSR3Q62tHmuNM0LDWt4pVuJ1v3Iw9S6xYpvCgjzuh7a6iZb
 1KVQ==
X-Gm-Message-State: AC+VfDzOZNe7a2qW5WJsQ3ZmKK0e+C6GYycIjdNKgpaj+kQs3FsS7UKY
 hdcmM6fI9Q+DwEvPWGdNA+/5zg==
X-Google-Smtp-Source: ACHHUZ4+3p1tXaMS/0RT+VlIstv19BNhlorxu/VinVPNaaRVh/53kBOZ8rgP0fVlogBjabmUpTKtaw==
X-Received: by 2002:a5d:6a10:0:b0:307:7b7a:9fcf with SMTP id
 m16-20020a5d6a10000000b003077b7a9fcfmr11381689wru.20.1683724638738; 
 Wed, 10 May 2023 06:17:18 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a5d4206000000b0030630de6fbdsm17173707wrq.13.2023.05.10.06.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:17:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E7F211FFBB;
 Wed, 10 May 2023 14:17:17 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-15-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 14/30] tcg/arm: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Wed, 10 May 2023 14:17:11 +0100
In-reply-to: <20230506072235.597467-15-richard.henderson@linaro.org>
Message-ID: <8735448gwy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
> and tcg_out_st_helper_args.  This allows our local
> tcg_out_arg_* infrastructure to be removed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

