Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E140C77B7D
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 09:26:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwg5c-0000o8-2G; Wed, 10 May 2023 05:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwg5W-0000lk-QF
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 05:26:23 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwg5U-0003dt-AG
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 05:26:22 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f49bf0223cso4131945e9.1
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683710778; x=1686302778;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZ3uAiHSniXfodcNdJp9MqKvf82xb+cKa02xvjJ/7/0=;
 b=ZJPHxbdEKzs+Byar500+kpHElLU4uLt61GkeWaE83H0Bo1B4o5PXVwf7GUvKEKJCo1
 hzOybM8VAqBzFE3L4nhN5b67QhN37gzMqDAJPp6ta+9M+OPyCLqKZVRHy5w1jYLcX9X5
 n/hTCUSKutIMoqaXanTnosGDVUSP+bejNLmPTLLdqRminLXL3mh3vfFCX6UQRrj46kzp
 ENSJ8Dq1DAjQjzSMDeNZvGS4FZrC6ZP1GhcILSGJu2hPgYNYt1KvP1Bbjd9IvDq1N2fe
 Wcof/LQq9LJXHx4yrd3iajyg0g4E340CpiD99caYwSd+lbbFQDl7DQPa1R35KeCB4Igy
 W+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683710778; x=1686302778;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vZ3uAiHSniXfodcNdJp9MqKvf82xb+cKa02xvjJ/7/0=;
 b=NKwwfdxn/STokRJgT2Ze5B2ET4ZUCblTdBP99SEse/kxkPMFT6t6ddAe/qPB9y3DlN
 kQlykhZnG02luSTbA6HmtiVmR5QdDOSzSkGw7V1P0yPRSGOxvW4QVYk8yIv+EAA9zzBh
 AhHQ783llGtfw4s1fecLw3earG/7xlOrrD/NTk7agBMRAf9jX1j9s54Dl7kxuMsh3dmt
 cIbMrnI7MPJ3ZQ/TL6an28EKO2dp2K3i8O6OEoL2qlZBFQjXoBda+Tkh8KBRzWrntoAN
 QGQXrfsieg7uYeTG2NSWy27zKgV/krMBKIBEBlkLYpslZ/53oX8mOywMrQhPtOS221+G
 UX2w==
X-Gm-Message-State: AC+VfDwlcrT1O/BJkZBY2dCd1g6Z3BYQUCyVFV5YUg7iWpSuAZCUO4BV
 bSW3PQoVjmTLSUqMCJagPl1W3g==
X-Google-Smtp-Source: ACHHUZ6UhHZtUInomG3PIsrT/kC98yAqnGngWKIClxdN0dA7m0ugyfD9JruoxhB+OakovWg8wROllg==
X-Received: by 2002:a5d:43c4:0:b0:2f8:2d4:74ef with SMTP id
 v4-20020a5d43c4000000b002f802d474efmr12318425wrr.43.1683710778387; 
 Wed, 10 May 2023 02:26:18 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfff92000000b00307bc4e39e5sm704101wrr.117.2023.05.10.02.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:26:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7BDB51FFBB;
 Wed, 10 May 2023 10:26:17 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-9-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 08/30] tcg/riscv: Introduce prepare_host_addr
Date: Wed, 10 May 2023 10:26:10 +0100
In-reply-to: <20230506072235.597467-9-richard.henderson@linaro.org>
Message-ID: <87wn1g8rly.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
> into one function that returns TCGReg and TCGLabelQemuLdst.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

