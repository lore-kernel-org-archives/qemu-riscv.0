Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791B6C001DB
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 12:25:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qURCU-0002CR-61; Fri, 11 Aug 2023 08:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qURCS-0002CB-UX
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 08:25:05 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qURCQ-0007j3-S4
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 08:25:04 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so6304824a12.0
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691756701; x=1692361501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4aYHUM94VO3BDPln/7WJPRoSZyQ6oJgnhLNoV7ckoDA=;
 b=W+66tjE3TTjfaSeu8aewV2relsNCcXStzwCzuxE7gPdvA7lAiggBT3DiwM/mE+/As0
 OBdwtDmhqtoLNtcWL7EGAoCQKhr4Xgei2BS/30FuQGbISG6bszagA8c3rbilkqK0BfXA
 0VPZapFrV/sTVgkdZX4zwk2lNsESl4/wDN4koMkBc2/ZSXV9Gn15njDK6XIc60DlLWTD
 QPtmLeW0YzM2cIhxa90x5kyGUT4BPIMntGblEp77sBKrNrcNLq3FalayPHL++eqIXVU7
 Fwr85NTuretSVciPpwyyPpYNLUZq1/qThsNYT275nzBwS5P53VwbGyd6+jBsTQ2G+g7o
 HCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691756701; x=1692361501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4aYHUM94VO3BDPln/7WJPRoSZyQ6oJgnhLNoV7ckoDA=;
 b=QKR+WoRSnGh+NLw27a2AbogF5lG0Z3EJVEATCrDonqruNoC9b25oLkC3o23l18cYp/
 SGee621j/zS8XQkQlgOl3bIZaT9fWxwzk8HJqXnycbyccdP6JtQoV5Wp/q2WLNnpthQ3
 IK4BjjqvdVJhkDvRHI5izsWPUfbklqrPusPH4K7LW8FCwT93wBIWOOiEWKh5pI1v/BSD
 mRztWFsHbvM2K5i8sSx0yeCjgSqewZkhzekQ5PqqsHjR1al+D1Mr1nTIxuNJv4Is9p0r
 Q2vWMK2kg7lA1kg+0PznGczujRtAKlCHGvgYTy7vRQ7KHwvnE9qJ9raTOu73amPQtTHX
 trhA==
X-Gm-Message-State: AOJu0YxL3Ywv4A3FqBpREU13MIG5tXOAXnchYWWr6woc3oJrv3iWUfNe
 0XxBTqgi2N5hWhK/syxJb96idQIMXVacDlr9kB556EDP9HU86dZD
X-Google-Smtp-Source: AGHT+IGFVXUfAcdws8J5u6u+bAiGeoUqvhkt/pE4vmYpWhzQm5VZNn8oU2NWTaTQQ1hCDko7mFya8gQdPTxZoEvqPUU=
X-Received: by 2002:a05:6402:26c6:b0:522:ab20:368a with SMTP id
 x6-20020a05640226c600b00522ab20368amr6278244edd.13.1691756700333; Fri, 11 Aug
 2023 05:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-17-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 13:24:49 +0100
Message-ID: <CAFEAcA8FPkmcJM7evL6aCN4ZkQD76d6xaaOJXL=pB+Qq93rbZw@mail.gmail.com>
Subject: Re: [PATCH 16/24] tcg/sparc64: Implement negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On Tue, 8 Aug 2023 at 04:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

