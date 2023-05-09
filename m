Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF6DC7EE22
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 May 2023 14:34:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwOPq-0007gs-Vj; Tue, 09 May 2023 10:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwOPn-0007fi-Px
 for qemu-riscv@nongnu.org; Tue, 09 May 2023 10:34:07 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwOPl-00076y-2V
 for qemu-riscv@nongnu.org; Tue, 09 May 2023 10:34:07 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bcb4a81ceso10812224a12.2
 for <qemu-riscv@nongnu.org>; Tue, 09 May 2023 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683642842; x=1686234842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yitkHOatw+41xMWb2v58gR45bgh1aVCxP3+JcDGrWe4=;
 b=MnNBtGc1IyZ8dmNyzJgev0mvjZq/P8QhS1375O0BJxNDCBUIPjb0gChZOStI2gCE4r
 +7zTWrWV2y+KSTHRYvNgK1jtzP0VmTm6ijzeRQloVstXuiDWn25s12Yp+3gAHqYMOnk2
 IVY6ieJvyvI7Q1tlkxPGMOX66LhkFyXLJyhN+HHzbR9FGTTBV97ZKhL26oQqkIOfEqzC
 ojr4tae5nuNWQk6bRA084fAfdVbxifDy+EdQQkgVK93XAQUi+M5e0lMj+IfafNl7Qxms
 tuYVzEz6pld29nRqU+MXjErsmGOkIqsjmKpzvclLjUGqedcH2tNfx2wej1gWMsd7Kca8
 Vh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642842; x=1686234842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yitkHOatw+41xMWb2v58gR45bgh1aVCxP3+JcDGrWe4=;
 b=ZcyLaER8Q93M1qLDw1urFHA74Vu976EQk7S3nb/+K9X6njH2QsucUzSEsfWcLA0ayZ
 gQAV96xQv/3KBK2DGQ50grEYtXluhdiXmDJ+4wozxfp7BEEwskuRN4EuTn/YQ+FOZKu9
 PJNm4lbsvFzGQRPfrRgwvqiE0eJxvuB/Xnf3CjwVYOr+pN8XXbNX5NwEvy4koszkkEbB
 Tsb9HD/oeemYYDCmfVW26w0M/AuwyW3gaFDxKdc3Wn5yO87dkNQ7LNmKn6hLuZ9TOAY+
 BIkIp4AYUKGrlEmBVxd8c6qSM2G6/6/OOLOcfp4JaQe1rnTTIkyW+AUKjyyWl3+MtFsX
 w4kg==
X-Gm-Message-State: AC+VfDxtV/jY4/nP08yz5SyEux2zSpDpVuUCo3J6vbR06gcg2lbr1Nrr
 ada49Um00S1D/nLjjHKfdGdUoaESCx11wBK0g9Fbeg==
X-Google-Smtp-Source: ACHHUZ5gD5BJH4YVtu+jFcFneKbKmXftdOcOs3lBAEDCP44UNh+UXADB4yovPKbuR/9Anutb0u7Jz/5bveQVBBMIzUA=
X-Received: by 2002:a05:6402:194:b0:50d:9b59:4330 with SMTP id
 r20-20020a056402019400b0050d9b594330mr7632788edv.4.1683642842430; Tue, 09 May
 2023 07:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-7-richard.henderson@linaro.org>
 <CAFEAcA8muJ84GMqSBuU0P2YhfERM-kftfq07N8BVO2yG9p6jBw@mail.gmail.com>
 <8988fc6b-8f07-1ab7-663d-3392ca19f7f8@linaro.org>
 <CAFEAcA-79iL8=+143w1jxTG1WM-8NODqqgF4droY=avopm4a7g@mail.gmail.com>
 <434236ad-8348-1e42-23e6-3ed7d6c21366@linaro.org>
In-Reply-To: <434236ad-8348-1e42-23e6-3ed7d6c21366@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 15:33:51 +0100
Message-ID: <CAFEAcA8hXYK=o98FSG+X9Q4PyamPePaYvoSYdN3jHt4V0qikmw@mail.gmail.com>
Subject: Re: [PATCH v4 06/57] accel/tcg: Honor atomicity of loads
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Tue, 9 May 2023 at 15:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/9/23 13:04, Peter Maydell wrote:
> >> If the LDP is aligned mod 8, but not aligned mod 16, then both 8-byte operations must be
> >> (separately) atomic, and we return MO_64.
> >
> > So there's an implicit "at most 2 atomic sub-operations
> > inside a WITHIN16 load" restriction? i.e. you can't
> > use WITHIN16 to say "do this 8 byte load atomically but
> > if it's not in a 16-byte region do it with 4 2-byte loads",
> > even though in theory MO_ATOM_WITHIN16 | MO_ATMAX_2 | MO_8
> > would describe that ?
>
> Correct on both counts.  While you're right that this is a valid generalization, it's not
> something for which I've found a use case.

Yeah, that's fine -- but we should note the restrictions/
requirements in the doc comment for WITHIN16. (And maybe
an assert somewhere if there's somewhere convenient to
put it?)

thanks
-- PMM

