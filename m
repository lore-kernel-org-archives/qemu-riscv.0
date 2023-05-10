Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A41C77B7D
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:41:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwk3l-0003xG-T3; Wed, 10 May 2023 09:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk3b-0003fp-H9
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:40:40 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk3Z-00084v-03
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:40:39 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3075e802738so6463052f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726035; x=1686318035;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G7WR4xvN/7yxHrxbjGZbYFIlybWl6z0TTWzZAII+iss=;
 b=s8rgnHPboK8fHnQN3j8v6UcZI4QKtifeNFLSm2NBmh9stpBNPNUa3dn4vFKPcW1QyY
 rGT18UvLtBAHysRK8jT+WBoxK1k5Md9RDL7A19k+R2XAKcwM6//SECswA05Qiddz7q9C
 bSnVb6OdZc7muLftgsuoCOA5BTnJsmtKwu2RzUlCOcblpTuU/6WLjrTQEuSLUwOsiRZC
 GQ7StFyqZQEGtbimJQZDdHSwPAETtU0qTIvLy9kdXaBFByINJObJLQG6rrDyUobs7wXj
 ZCgriYlcoE6Mb4vOgtx/B8DjXMtM2/nEZe4Q5kEs+yKF6deFuhqiYhnYG15kOfyc3Lpi
 YEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726035; x=1686318035;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=G7WR4xvN/7yxHrxbjGZbYFIlybWl6z0TTWzZAII+iss=;
 b=WlEAgecMfCu/URauQAsA4x7r0/HRTGtNtVoCjtj1n8DVpZKkcuf8YDZKJ50OdDpENB
 efy6xHrZXT9KN5dm4B/q2ZMiOlZsBUWZni/H4PKQSMSJ7Qd4ajmaGSWWHkP/3AAVKI9K
 kiZ7hmH6vIvEkDvETAHbJkafJELsrGg3U5ttiWo9a+1YTNt3yTTwhBbxxAYD9U4RiI6i
 4H3CdqXgLOfdllPYrcqJDz03v4DFk+adiYQ5xPa+7P0rBPIZMflvlG+mJGa2Jqzzauvx
 SNG44VfKx0/L86elBY5OizAkzo8tBaHL4J+1GSMXaw8zQypSOIuMn7gcFJwEIffKRHO0
 GTcA==
X-Gm-Message-State: AC+VfDx0GsvGUj5DS8fmhNBwKxpRtDvE+zexWsH36EhbbJ8aWAuj5dRw
 +BZsZg1t5VPnlZ/vQbbUsArHag==
X-Google-Smtp-Source: ACHHUZ4cbaoeKnAKca0skBOLar+u0s1SvaAkIzcO05Y7Ay2LHh8vCruvk4nIGjWNfZ/F/8c1oC5BvQ==
X-Received: by 2002:a5d:4dc1:0:b0:307:97d9:d9a with SMTP id
 f1-20020a5d4dc1000000b0030797d90d9amr7090831wru.13.1683726035419; 
 Wed, 10 May 2023 06:40:35 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z6-20020adff746000000b002f103ca90cdsm17426513wrp.101.2023.05.10.06.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:40:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A32021FFBB;
 Wed, 10 May 2023 14:40:34 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-18-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, Daniel
 Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v5 17/30] tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Wed, 10 May 2023 14:40:26 +0100
In-reply-to: <20230506072235.597467-18-richard.henderson@linaro.org>
Message-ID: <87pm78719p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

