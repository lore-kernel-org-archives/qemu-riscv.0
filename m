Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F60C77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:52:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwkEb-0006T6-0P; Wed, 10 May 2023 09:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkEU-0006QC-LU
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:51:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkEO-0002i0-5W
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:51:52 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f315735514so247459625e9.1
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726707; x=1686318707;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o1uHgwTJ9CnoDq6NHxbmiHJEBjSThWHogYuU6j2MTVE=;
 b=EElyz8Ti6JWnNwYijU7sk3VvfuXSmMakdbEK4I8a0v4ytIqhq7PnTvhWJTlGQ8cD9o
 z8E4c8FAQl2X0ZYn0vBN0yKl01O4P3n9qZuXVCiZ2q0JPd3vm0e/ob9ZOrkFocdwIRMI
 LOJExt8WLXZj5fGx7FuNy8MFpI1NbdBeSc7Xuss5e0S6c4kC7S90poAXspFIVJOQKFV0
 xmnQmvfyu0OzUVNPPjlKgmC09h5vRmTK4yfjvzrSSZl3a/nQRmpIi6eoejMzomrVSYzi
 vN36pQC+d3Lv1ijCmI9ye2/zfEx+Q8NX7XXMBlCycrpFnHPNxX94RdFfsKDg+Eug2Qtv
 AAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726707; x=1686318707;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=o1uHgwTJ9CnoDq6NHxbmiHJEBjSThWHogYuU6j2MTVE=;
 b=b5xiQZrKzjooPUHAwcL5M3XGWefDhC0uaid+aIAyf38BEaF5dn3JxNQT5qGs/VoCOK
 LgqcnGS/CaiEDX2uPTA9UoSIGR3xQAVe5n8CB5BlpvJ1LtRUXrjuBO2C92FA1+YuUFOa
 y4qfCS16vmBSohZhbe2n08ZGtxk1KCbdVOn6oyVRjR+AZgW4bAcx0vnzcCp/FKWM8qCa
 W6l6HViTYta1BGEmYnaPHhtna7fFd8Ab9GHCM8a3Qu/dzNGlIbPAiZERcmBENhRmptSS
 HBJfmj6gXbT8LgXd6T20PZBqdWRNAMInJN/3RJltiS//1UIrQ3NeyX1SxCJuBEKoqYTx
 G8Yg==
X-Gm-Message-State: AC+VfDyXB8suBEKw7t0E8zwk9ifDAV2NivHAPbVQ62hdnhEOAeTP49Fi
 2Cl5gZ9e8wyIydKtSLbu6iduNA==
X-Google-Smtp-Source: ACHHUZ4hLAvcMACl144gaKjOfp6UaaO9xhYCxZj8O7MepB57tP+S+vqQ1WGESi9n4c5d8kqCYvZqEw==
X-Received: by 2002:a1c:ed10:0:b0:3f1:731e:cdb1 with SMTP id
 l16-20020a1ced10000000b003f1731ecdb1mr11880561wmh.6.1683726706861; 
 Wed, 10 May 2023 06:51:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a7bc843000000b003f42314832fsm10907723wml.18.2023.05.10.06.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:51:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 131EE1FFBB;
 Wed, 10 May 2023 14:51:46 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-25-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, Daniel
 Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v5 24/30] tcg/ppc: Reorg tcg_out_tlb_read
Date: Wed, 10 May 2023 14:51:37 +0100
In-reply-to: <20230506072235.597467-25-richard.henderson@linaro.org>
Message-ID: <87v8h05m6l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

> Allocate TCG_REG_TMP2.  Use R0, TMP1, TMP2 instead of any of
> the normally allocated registers for the tlb load.
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

