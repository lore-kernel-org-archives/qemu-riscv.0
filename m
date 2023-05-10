Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B075C77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:51:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwkDR-0004im-Tq; Wed, 10 May 2023 09:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkDI-0004Kh-EZ
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:50:45 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkDG-0002T5-BD
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:50:40 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f42c865534so18816325e9.2
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726636; x=1686318636;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MKIgKMtjqWfps3oJrIiV/S12t/h6AXqL5Ni7k2To8pA=;
 b=bDVB6NZmIjco1KXTU2s0dCHlJzNOXINJrkTJDp9X7hUQjh+bbYJjcNTel7ONbLqxZ4
 nawrNp9yiydiRMNHer3VF5vyi2MzuzNuSqxzrYXggrEtKByRkrIylR4yW5JqoBTW8z6m
 walr5BBmMUnsGt3al8mfv5LDU4/4QHYAmzlFMTXivDXPHysoT5vMafc5ODgPJtmYSF+i
 QLPC+7RmogoSuFwg24GS6XVEf9of85fmMKc/7gpF+fKqOXZ5dsHlHyUY2FDGK46t61Py
 ZMnkJccQ6SP9q65KSyjiN2d8coe4dJOeTCFDSr0DPRxI/AjhRZEzvhPbWOG3aDFsLpuj
 Jebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726636; x=1686318636;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MKIgKMtjqWfps3oJrIiV/S12t/h6AXqL5Ni7k2To8pA=;
 b=GGspRIgfX80BknpUbkkDHlgGsKuLgbW+ay2xT0CMvLKLvVLgaPBWokadqGxGggUo1X
 90ZgVe9pj+iodPC/sUG8UzXmwJtbExSDPZ7oCpOjtgW/GqDGsh5E3QEVDT1UN/Wq6Unf
 Cs6H1t4VdmxvZ6VeCUDul3PfTx8K8+CMDasJjR1T37mT9VuT++gv7ljxuYRbWy/gEnbZ
 8T1LU2qmgL+NJ/Xv9nClgLRTH/fy7EwKD+em08rFSNobbdgwqc5bLuKOPVmIxgmWNqlM
 Y6DSFI2YcUciGW2i/5LxwRwhVjMtmZgwINXovN6iEePzLis+ee10wI2zILE0sYZ1gYVn
 AR7A==
X-Gm-Message-State: AC+VfDypgjuzyLK9A0NpeQMFx8GL41zrOQXMb7wOQRbIJVU3i0Xu3C+7
 H61eFoqHbXS87f3rfBluhs4Z8Z3/qLb9Hgils+isjA==
X-Google-Smtp-Source: ACHHUZ6hOgy13Wmi6d2X0NrR8O4SHXG8e3AWauCZHR/SgZUeAnKt4y4eGebNmDBznT/uXSl8WYK5LA==
X-Received: by 2002:a7b:c84a:0:b0:3f4:241a:e648 with SMTP id
 c10-20020a7bc84a000000b003f4241ae648mr8618799wml.24.1683726636089; 
 Wed, 10 May 2023 06:50:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a1ccc05000000b003ee5fa61f45sm22763687wmb.3.2023.05.10.06.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:50:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 730241FFBB;
 Wed, 10 May 2023 14:50:35 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-24-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 23/30] tcg/mips: Simplify constraints on qemu_ld/st
Date: Wed, 10 May 2023 14:50:27 +0100
In-reply-to: <20230506072235.597467-24-richard.henderson@linaro.org>
Message-ID: <87zg6c5m8k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

> The softmmu tlb uses TCG_REG_TMP[0-3], not any of the normally available
> registers.  Now that we handle overlap betwen inputs and helper arguments,
> and have eliminated use of A0, we can allow any allocatable reg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

