Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C40CC77B7D
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 09:11:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwfqc-00036E-4h; Wed, 10 May 2023 05:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfqV-000348-Uo
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 05:10:51 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfqS-0000dS-Ps
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 05:10:50 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f450815d0bso7929605e9.0
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683709847; x=1686301847;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9SOIkiXkIyM4o7q0Y7vJZZZ40jzNxRUDcb201kohD/k=;
 b=gWoJHtcjTnWCeJ96MEsMnvcYZUgKS3QemxAB+70vWFxri+evfa2UutY+x5a7Nor3xW
 UFI+fv4skfh65UXJIhpHj9mcUYDpO7JQe1LF0a6iZZrWLFx6y2A0HZ2Rxu0r/D4IOz1l
 wKflup6xf3cjQ6t9WXVyApYT/W+tvbuUa9AkhVzqdy0etsEnlfTvsQ1YrFbneH/w4805
 ic+juBAGC4SC1DS5gDSllfPAIoUjhSIiNcHCzgMoUD8KIWjoYBFWchUlWMmnRbhcYTBR
 28ww3ZIfjI9hLAdcF6Bh/0vdDMz5LS0T6dgaxtKXsYLhP29q+738aL6Z0stddC5mvzBz
 Ri7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709847; x=1686301847;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9SOIkiXkIyM4o7q0Y7vJZZZ40jzNxRUDcb201kohD/k=;
 b=NvpQfik/nkOkRPBK7jCmXzYu0IYRkVN6G53lfz1VKcwHSm7SvhLW9R5k5XegmpFdUs
 BqqTn/cZZscJAH2jyhloTg2kvl/mLagMda8qf1S2GyJxflAJmx/LdEb3n+8IeO8SRAV2
 UrUR0JVXGqXCqPSbvEe1O/STfwbC+c64Tx3zdwp5UUOYJU7LiLMMWWBqWshbnUigJrTI
 QDO2JcSVq4yQU+qBna+Grt/eVIcWIGBMokU2oRQybuyS7Ds21QDdwtngpYf5snBMV5Zc
 FoRGdJ44eBc3USvZzXjoVJdRIzhjkFh9N9nPEuj5RDPXTzbTULLEVOhA1Uo12l2XeMiL
 wzcg==
X-Gm-Message-State: AC+VfDy/IYOIQN3bglhB329sG+20gBDQGoIrOW0oM9AZ1/jR6DncTbcG
 GIG/36p0eKBo91+snGe3sGdMlomUFVIHyvbwDRVzCw==
X-Google-Smtp-Source: ACHHUZ6yWsluTjMYPkpc0sZvvRRho007h/YdriCbtHeDSQFYRpSiX+k/Rzy+sd8O8GklKwO3hxPo8g==
X-Received: by 2002:a05:600c:258:b0:3f4:20ec:75f1 with SMTP id
 24-20020a05600c025800b003f420ec75f1mr8931850wmj.33.1683709847060; 
 Wed, 10 May 2023 02:10:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g14-20020adff3ce000000b00300aee6c9cesm16817503wrp.20.2023.05.10.02.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:10:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D00B1FFBB;
 Wed, 10 May 2023 10:10:46 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-8-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 07/30] tcg/ppc: Introduce prepare_host_addr
Date: Wed, 10 May 2023 10:10:38 +0100
In-reply-to: <20230506072235.597467-8-richard.henderson@linaro.org>
Message-ID: <875y90a6w9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

