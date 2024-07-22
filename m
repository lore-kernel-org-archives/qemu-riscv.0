Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88161C3DA5D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 11:57:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sVrey-0005KD-GA; Mon, 22 Jul 2024 07:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVrew-0005BC-BA
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2024 07:56:54 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVreu-0005VW-OZ
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2024 07:56:54 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52efa16aad9so47844e87.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jul 2024 04:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721649410; x=1722254210; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GW53BARDoHWD00cOBNaBMr/nIXFp8X8VrLnIPXNfOYc=;
 b=tpF6/HHznAzles/kesbsNdG9niaCcRq36rZSzPo3jkU1wQq85vWx19HrftlXJC3KqW
 Jr/78XM3Y9mwdrovHbUBMyHzCwIlD7t5MF8VeUd1VD/cTmuTFBEtSrIL4IQOXdAnySNl
 J1PodGISWnERdjuBwF81Sf4QeMsc69EketA1a2Q435oyesMqRCRtOBnrkV2w1BDUkNO2
 z92DMlB9R8IPYFeBBeqNTMpZKq8/yHyZu1SY7l5fNhra2xI+UZOCUq/dMd0F0apXqPcr
 svU0yxpXMmP8GbbrPPw/AsI2zHPGa+Hgh7Xf84OmF/pfz3jm1ZlyefkocgSSwZBVcLYw
 kEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721649410; x=1722254210;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GW53BARDoHWD00cOBNaBMr/nIXFp8X8VrLnIPXNfOYc=;
 b=PkRnF/C+uk+wUjvbkvITtR36kVb5xm/tXMH1z06Tt1UvExykRRETZsE+gvfFydNDW4
 QsRsHOnBtacekc1UznJDfkCx3rqAkNwffkXXg2Syj9XFpAo3h10r32gI8T1OHj+M5lss
 DpHA9tRSSMVmE74UReITmI6/xaEvBNSHX0U9r4Sedf8oa7XoP2gPIGAmLVkBr8ZVFfBJ
 SK+824Lkm/LaojGpi0PyI4wUSUwNnKxpdWVdTY0d5DwoD3Ux0ZzXiJLebUn5xWriFhCJ
 py793GNtWECbMkCktbrveqPuIROeLAwuDOivrI8+iA07CKOikJF5wV9E/oCudReb5Anr
 0aWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJvbXnLmUfdYlZfLqRtRVQuAc07QsOui+R75wTJTjQnQ2v8owYfMRHviwDNiTw6vbdSB2OlQ0D69YNTE9q9EWkKnpZ540=
X-Gm-Message-State: AOJu0Yy7opMJd/H3dTVJ0Q9TItlgsYLuJiNbdqgKMorZZYmxJu8sCXuG
 6iz57sQD4aisfc8029jQriTaRUbDlRCxjFPlgHtlhk1KZsw2bnRmfxiR8jMEpEQcEnJp6TdZJZx
 6pnAUyDrYAW/Pke2gyDYNdb7Hp+qDZIe7zeRjeg==
X-Google-Smtp-Source: AGHT+IGJGQOfPTvYKB0SFLZP5usuIDbVStysQPsWc3u9+2G9gSzZMjlr8lzY2VpLGSZ8Rx6FpdmPMDIAU9bqAaTozls=
X-Received: by 2002:a05:6512:3d1a:b0:52e:7684:a385 with SMTP id
 2adb3069b0e04-52efb7e8f75mr4258408e87.52.1721649410248; Mon, 22 Jul 2024
 04:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
 <20240719010707.1319675-4-richard.henderson@linaro.org>
In-Reply-To: <20240719010707.1319675-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jul 2024 12:56:38 +0100
Message-ID: <CAFEAcA_+vkQfkDY9eYF02gQ_89CrCb8t8gW2wbo2m+3pHskK0w@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] target/arm: Use set/clear_helper_retaddr in SVE
 and SME helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12e.google.com
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

On Fri, 19 Jul 2024 at 02:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Avoid a race condition with munmap in another thread.
> Use around blocks that exclusively use "host_fn".
> Keep the blocks as small as possible, but without setting
> and clearing for every operation on one page.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

