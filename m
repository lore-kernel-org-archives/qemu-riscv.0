Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB54C77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:58:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwkKh-0002nq-C5; Wed, 10 May 2023 09:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkKR-0002mJ-Bv
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:58:08 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkKO-0003yw-G6
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:58:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-306f2b42a86so4713744f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683727079; x=1686319079;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C+mA+ZG3cPhoTBZXUbZeQTduNPunyAITsiOepDFSgU0=;
 b=nV3mZ2ojH+nHj+maE2UUvxC2vFyzflT/uG+YpWHG0HHLGcaHeGEsE4/D+dBIA92kps
 tzLv8vaPPSp+HR34H/0qm+P+OF490lihPih0wRDrJyEcq9SumHCMVmj3ZzPQ60RUSIV7
 IJFmJ0zSYgosD9B4zRjmH7LPh1OsPULooKw/bSYLZpgu3acWaGPWsBhxcZR0w6RKMb2o
 fsqfy4MvGhar1UF1kfdVyQmkv3OBrQpHO+mH3sEoGY8X2fXeQhIAVUIkWNML2d6dyr+5
 h59XOVk7du+PylD+P9sWAa3OWdJEhXedRaO/Y+aky2R6PLqOCSaprmvEFhkqGoDaCHXp
 kmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683727079; x=1686319079;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=C+mA+ZG3cPhoTBZXUbZeQTduNPunyAITsiOepDFSgU0=;
 b=ggIiMB7YE4Dgh39xoiViPeBb7uSZ5EX72Gl5P6BkJ/qS6m/pw79yuVv9WMjcqP+wwV
 ZXa+ARafEn/f5Q7/lH9fO0hwQNl5qu+zv6fECaA9CuBF8mylnvGsTCOXsxjQJm5VsoaH
 7641kOBuFt5wa7bjNJU+MZPx3erd2tgeLxbvP1b0oro6pKGEsj/pfUB78ls4RZuVmgah
 FV8NTjofBlf/2rZ+22SpF0Vi995fVKQBZlPvEarJIHMQ96VZfXcHTdywYZC67APyaXyC
 CWHWoHHGdz3UokL9pTUPwIv05/l+/s5TmM/LSKhSmJqgDfJyCkfBG+hOL306rpuqpZvd
 fQ6Q==
X-Gm-Message-State: AC+VfDx3WMvfbYMKqcnKaMCobeT0MdWgD+RjxHNf/X6F81F9c6MOjp9m
 orhYdRyxzUe78nUHAEfHdLBU+g==
X-Google-Smtp-Source: ACHHUZ4xKWfzAAPd4pzGijHi52o2LGiwhCUtT3FA7WFrKgmtNHWCfj8V6xN01U3ZLlq/VhetwiwXNg==
X-Received: by 2002:a5d:4c49:0:b0:306:2c16:8361 with SMTP id
 n9-20020a5d4c49000000b003062c168361mr12358420wrt.22.1683727078720; 
 Wed, 10 May 2023 06:57:58 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a7bc843000000b003f31d44f0cbsm22967600wml.29.2023.05.10.06.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:57:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B60FB1FFBB;
 Wed, 10 May 2023 14:57:57 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-29-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v5 28/30] tcg/riscv: Simplify constraints on qemu_ld/st
Date: Wed, 10 May 2023 14:57:50 +0100
In-reply-to: <20230506072235.597467-29-richard.henderson@linaro.org>
Message-ID: <87edno5lwa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

> The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
> registers.  Now that we handle overlap betwen inputs and helper arguments,
> we can allow any allocatable reg.
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

