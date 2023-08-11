Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8541EC001DB
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 12:08:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUQwN-00041R-Qa; Fri, 11 Aug 2023 08:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUQw6-0003wF-PZ
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 08:08:15 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUQw3-0002ul-7Y
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 08:08:08 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b9dc1bff38so28677771fa.1
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 05:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691755685; x=1692360485;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ndQEBja9XdSNCO3BDSnJc/BVCJ7aH9kI+WenktxzA8o=;
 b=giPLu4gu3lWYuAaVRJbmMefAG1G6H9QxIXDdgL5msg5Mhl3UVKe/yP14dxX5N7eRn+
 b9t5XsXeBJgAMP5XI6GmOaCWaQrX1pN2rCL+J7fGHsDT20krk0UOh/8uB4oEBMcOsyaC
 G78nCXTWY+AMUj1oVZ2KgmQnplmezVjs9sbMvH0gWRkYvf8PQxNOexe9QHLWg1SJg2nB
 t37rgYMt6xerxDn0fqqCGGhiW4FVkChB77AdFlFPZ8sz3n5bHlBbxUn2GSToxu2X2IJu
 bOGtIRAqLN1xoH9UFMGq+tqJ/uz6z7bk4SxcVhgpaSrHr3vkgYLFV30VjpmME2BbiSR6
 pZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691755685; x=1692360485;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ndQEBja9XdSNCO3BDSnJc/BVCJ7aH9kI+WenktxzA8o=;
 b=b/M8p0sqlYmkQffPUz6D5+Bjlf6yz5t5HnGbiRCY6unvkGQsl6vq0Asg2zzt3sNkIx
 Z7alvDrlsRfF4Ua0hr+OaJmFVTWqLGsmVuFUwShRvbtIFTeMEFUdgroEkJuaEdo0wSIB
 HdglatYyNfwezC0Z2c24dLRb63YwDRI1lrwT9buI9WLzlLdeQ4uQVBpE9PH0nd7XOXVS
 NsjGqLXFwoxFTcroBg+sOSW+ESmZ13WgFhWG8d5LxN1nrkqYndx3vIHjM2gO4+RyjeRM
 8DcInJH9bH1G5i4IODQi0X89wIwEy2SHyxBi7y0tJF0XaAakmhqwHUxmLRM5VrS5NJZB
 76+g==
X-Gm-Message-State: AOJu0YyKt+U9PDyC3NdTW1W7PeuNX6Hu9LLAkU1Vk7fRXfTXvy79NgbH
 KAXKPtlUEDUTcEzEoHBg1O74cvUO5p+JBWrZ4eu4dg==
X-Google-Smtp-Source: AGHT+IEA3ApV7WKGjVUrpMODHQIn9x4YWsIlLu2rOojH1j+IXhkePB/JZWLCjUKUbjECGZRx60PVMfoGd/jA7YJnKco=
X-Received: by 2002:a05:6512:1320:b0:4fd:d3aa:e425 with SMTP id
 x32-20020a056512132000b004fdd3aae425mr1381540lfu.27.1691755685028; Fri, 11
 Aug 2023 05:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-22-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 13:07:54 +0100
Message-ID: <CAFEAcA8kDbOkbV3227OJ8xodkFmH+nDTZrEDzXGf4Piaeo-ypg@mail.gmail.com>
Subject: Re: [PATCH 21/24] tcg/i386: Use CMP+SBB in tcg_out_setcond
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22f.google.com
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

On Tue, 8 Aug 2023 at 04:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the carry bit to optimize some forms of setcond.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

