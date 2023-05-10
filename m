Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E14C7EE22
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 09:00:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwffY-0004II-VF; Wed, 10 May 2023 04:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwffW-0004Hk-9a
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 04:59:30 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwffU-00056p-JN
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 04:59:29 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b425so1551265e9.2
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 01:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683709166; x=1686301166;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7WVQzTEjB4MCVOMpu/iEPlpMndQxnD0kSG+g3dB1Dsw=;
 b=KmmU2u/qdQbajiuc8y4gUqVT/0gWggLWsZIjtT8t/rqUwYVFDAQVgjl7nWiYONBSvF
 slRAXhrPmO1csuX1FJvfRvBd5i1C7fKhB8QVSuOH/keyem20OSu4Eb1etSC8Jfxhynyx
 p78Ek6K6DfZKA3EQx4DLAmZSl4WE79fPxeKXWME4fqA5wkcQV6rxzyVqx6V2MQsS1tq8
 G99wgaEbiQjUEj1tyqJefAdTYdJtz6HYzHBCBOB/M5O77Gu/UtoLnpc+bNxrN35xXCuo
 tOFk692UnZHzISga9NL7O7C3XH+lQgzpjmZHfHikFLgzCAw9FgCrFhpBsDv3hxXR7lbj
 /tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709166; x=1686301166;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7WVQzTEjB4MCVOMpu/iEPlpMndQxnD0kSG+g3dB1Dsw=;
 b=ER8UTAF8HODIaMQvJzO3WJ4HKk4HUfDFtVs1aKPPmsr8FZyLPL/QiO9BSZJyenlIZv
 cp69qEM4bGbFvXU2omuSeAMbxQlRLap2IYmLEx3bpDQY+cAUcIJOgCCU1MvOTyXY2R6l
 4QsQvqNd33zxnBH6lGeWjXMjGoypYC0XgNFaNNLIcGtopXgTbVCmuxWNmH8Uc+4LD+vZ
 HqY7+pPqWHOkHmiai82svQ/2dHjaXtAt3Q25TZVPyz8KFQMRi6JR1vPlCHuGRawRcrk7
 OgKEogknCZUnZkryTlpwECRY4egJ6iNXxUndGsCvAjVxO13X5ds29bwr95Ys5pZ8jr4v
 tkzw==
X-Gm-Message-State: AC+VfDwGa+53ATFWCGGVCuKsmqXhejwfl8d0z3PSXlZxosoGWGypmmg9
 dfB487b+qghNjYm3P2nGnYCfsg==
X-Google-Smtp-Source: ACHHUZ5NEsiThzOrBfl6wQE5Vvthg26LzS5ubBrg1jAni/Arutuxp6mmoeFOe5PtFhh1UkWzYbVr0g==
X-Received: by 2002:a7b:c3d9:0:b0:3f4:2d31:11b2 with SMTP id
 t25-20020a7bc3d9000000b003f42d3111b2mr2903713wmj.13.1683709166377; 
 Wed, 10 May 2023 01:59:26 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a5d6051000000b002e5ff05765esm16696683wrt.73.2023.05.10.01.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:59:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3BE31FFBB;
 Wed, 10 May 2023 09:59:25 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-5-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 04/30] tcg/arm: Introduce prepare_host_addr
Date: Wed, 10 May 2023 09:59:10 +0100
In-reply-to: <20230506072235.597467-5-richard.henderson@linaro.org>
Message-ID: <87ild0a7f6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

> Merge tcg_out_tlb_load, add_qemu_ldst_label, and some code that lived
> in both tcg_out_qemu_ld and tcg_out_qemu_st into one function that
> returns HostAddress and TCGLabelQemuLdst structures.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

