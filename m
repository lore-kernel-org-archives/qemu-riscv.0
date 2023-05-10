Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B38AC7EE22
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 09:27:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwg6h-0001mW-Eu; Wed, 10 May 2023 05:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwg6g-0001lb-8L
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 05:27:34 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwg6d-0003lH-Ov
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 05:27:34 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f42c865534so16049655e9.2
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 02:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683710850; x=1686302850;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfVBeOiLxMpg0GmqSrHHfMW8UgbJWOQeTSLauyEkpdQ=;
 b=l8VSUKnOg4gScxX37m/5vFBYLSmEj6dtuFr56BLHds5DG9zgdUTJbqb7TA+pYvnNZo
 U5slQTa/p/16x3yE3Zklqb0oaz5Gae1O0XOml0x82E094uHGlkz0CAYZLNM+muPh3YUF
 gk9/WGyiFWkdNIqInoQmRdG9zuLQaq9l6tIcAYxJ+iuRXYJtm+lzsKLNaOGneK9v7aS2
 7kC4g5PWlsdjBlOphWwMtIxR1avZnq3QPOiy2Q+wZN8f1EbrH90Y9oDe1cH2MTUOOwdE
 UlWXV97riZo1Dd9Bmsuxy9w3lXFj6qOTHaBHtEtroeWBZzi5J07yn4IkcFJnA08Jl5cX
 /6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683710850; x=1686302850;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KfVBeOiLxMpg0GmqSrHHfMW8UgbJWOQeTSLauyEkpdQ=;
 b=jbRYFE/2kkfrlAJCb/uPOSd29XL+Tr0/Mzaz4gU5NbeanxSxX+1ZB10KsLdA9f2Me+
 7EjTzBszkjCdxbrz+F67rYueCws1fsqDrYoRZz6dket1K6OAnjBOqJGcb80nvRdSpbig
 y4R8NU511jpzNdGnfCGzrihBXzh8xRchisKMMiqG+lwzZTXlovsk3bMB1s3DW7Ud9lhl
 egIdgm5HaO+71roZzP9n2Hmw7HHjP0EhHMjvW7toMFabk7rl6qmNeG+oltNLJTXZlKba
 tPURtxVM8zVO7x4h9akzB9ddcgokPUge5BzI1H6d1sGjaBuQqclg3dJfm3MtShaLhdem
 kHaA==
X-Gm-Message-State: AC+VfDx1kSdZCvHv+MqZJWLM0LKpXBcGjpqawq4Lk3JBWPouQ0ad2hlA
 SqFGTyLgCiDIooV6vcN9e7NhmQ==
X-Google-Smtp-Source: ACHHUZ7ZMxstqpdTUJ1zE1TDUQYOC7TISHErlOQ0KrDQJUgW89CzIfqoaS8aQvLbwehaD6ufeoLiuw==
X-Received: by 2002:a1c:4b19:0:b0:3f1:78d0:fc4e with SMTP id
 y25-20020a1c4b19000000b003f178d0fc4emr11678984wma.32.1683710850282; 
 Wed, 10 May 2023 02:27:30 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a1c4b07000000b003f4bef65a65sm832407wma.28.2023.05.10.02.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:27:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D26A1FFBB;
 Wed, 10 May 2023 10:27:29 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-10-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 09/30] tcg/s390x: Introduce prepare_host_addr
Date: Wed, 10 May 2023 10:27:21 +0100
In-reply-to: <20230506072235.597467-10-richard.henderson@linaro.org>
Message-ID: <87sfc48rjy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
> tcg_prepare_user_ldst, and some code that lived in both tcg_out_qemu_ld
> and tcg_out_qemu_st into one function that returns HostAddress and
> TCGLabelQemuLdst structures.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

