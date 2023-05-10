Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B802C7EE22
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 09:09:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwfpI-0001yP-CE; Wed, 10 May 2023 05:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfpE-0001wC-7r
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 05:09:32 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfpC-0000AG-Ii
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 05:09:31 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3078d1c8828so3984758f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 02:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683709769; x=1686301769;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9SOIkiXkIyM4o7q0Y7vJZZZ40jzNxRUDcb201kohD/k=;
 b=rPXmwnKqsRJiEQ2emr8gASXuXRVHXMt3/uhEA5VtoYHmoSNIiOrhctpcSSGfDYxRdD
 Eh41CbCH7y0f3eC5ynFuoWzYZiO6A0ub41TKEBbyAmV1nx0ZePP/SuGWWehk8GkbnKFS
 elRaE1ZG0tNQmMXTIDCuT66A3EKlzwu5HeG2M9Lis2gWK+noqUMLEPl/10RZkPCMCgtT
 xKbHIJdhlKQbqINOx9jNWAsCgbYWlU3ntbzwhp1a5peKO7dMIuZ1p1lIigyFfYFfclJc
 B857mD8ht0WgNYI6yHGY8lMMQ4h7qK2/T3/hHi9BZNO8joQGMVpeweAowIIagKUrlyQ0
 WdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709769; x=1686301769;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9SOIkiXkIyM4o7q0Y7vJZZZ40jzNxRUDcb201kohD/k=;
 b=E4VeJomVBOMyaxMdBgan7iOQHvFkUbocTDxfEROJvpyx0rImiTGADcH+fTsM8qkWmT
 aWI4AaFDJttU3umKrcBayKbGLGBej+av6L/LUvz0njz2Ns06vWauoGvM/+hBKsLNYKaK
 a3mDUigg2DIQdYkXXSQ7PgvHp68Q6uhs5JCOngAH6/0RFnRuBjla13QIMAxisnsHfWte
 f//ItQB0Unrg1GM20oUu5phwWKf6xANqh37/SDcluH1jxNpVTZXCKoPGayjPPlhq3Ouf
 oUSBRa27gbTmXW4NPPOHGtYSVYYW/Z5vwBO8Gku+z+4nkrC7Jm/UGZi4wm6xJzCNVZg1
 +4eQ==
X-Gm-Message-State: AC+VfDwcmtuIF3c9gt4dxYOP23vs9aWusp9ylLsji8xqy0fOhla4hZgy
 kmKKLaGab3+gS8Gba7kUD8o7Nw==
X-Google-Smtp-Source: ACHHUZ4Z7Y23gI1risy1Zvs33eXbu6zEtjglCdqXQkpkH5soxorm0B2MiRNDs47VFn+6VYHeWDq0gg==
X-Received: by 2002:a5d:658c:0:b0:306:4442:4c7a with SMTP id
 q12-20020a5d658c000000b0030644424c7amr10975296wru.33.1683709768882; 
 Wed, 10 May 2023 02:09:28 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d4e8f000000b0030629536e64sm16776452wru.30.2023.05.10.02.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:09:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 075EC1FFBB;
 Wed, 10 May 2023 10:09:28 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-7-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 06/30] tcg/mips: Introduce prepare_host_addr
Date: Wed, 10 May 2023 10:09:19 +0100
In-reply-to: <20230506072235.597467-7-richard.henderson@linaro.org>
Message-ID: <87a5yca6yg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

