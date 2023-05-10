Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2B9C77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 09:06:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwfln-0000OR-If; Wed, 10 May 2023 05:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwflg-0000D0-5e
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 05:05:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfld-0007qH-Sd
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 05:05:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3062db220a3so4502183f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683709548; x=1686301548;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pemjz5gsxQvJFr3OHBPAfO76RVrjdn9gMWic7ZgGXfY=;
 b=TftCW/F/1UAMuLirzYhT1XNA5rgsGhV9F2nrfO/rnFzX0ipMOo4bZ5o1Vwgd7X7L74
 wyY77rrzcoBpYjFezvwVQ1l3T+pmbqP9IKLGUew9Z4oNtmDsrG++bOFnlhmcO+yOpl7t
 woIt1GC1MMhcdayt8+w4dF1xOCkWJbcHkwi/FB7UoN43zHXZQ3dAYr6lxUU9w7URK9vr
 UGqrtrejR8cvtpzvT7vz3qezmKWAPrffnaNrXfUifTTYu68pQDtG4fp0DC6Cr7J8xCR1
 yMfYydjwI6STZUvDREqOJbs+ErGeQgzySYQRdb8PcnL6S7qZi0aYCsTyaCBv0fpQwHn/
 yScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709548; x=1686301548;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Pemjz5gsxQvJFr3OHBPAfO76RVrjdn9gMWic7ZgGXfY=;
 b=OsHsERWkyXFRq8eLWQ3s+1h28A8AYga+aQEOcPab2UM1dG/5d0SDXz15cKQp3XmUke
 P98bRQ4wwXodm8I87QWwGZHyjXGEJLREWNJZ8QMginswEB5XLCmdQXx3rIA15O4M8kG8
 NFdh+v4MzrRxgyrNq8ZmK8VTn3hjBULVPJo/wydOQLQOU3ufRWICnTa3CWfQQtlo9kjt
 E+G/mWzL9uU81OLgPx2aYPAK65yyFPJE7L9FhX+KHm5ElQKWKl/daGds2/g0x2QLzYww
 ucbBxJ2sHEdeLJ9FveUbhKeVP+KNE3SvTPWtsratJuZPFysKY1ynLY9o2dR5yrLToTym
 QXSg==
X-Gm-Message-State: AC+VfDwLv+UHjfT7lrJEbhvEzUkR5VRjX4rTcO10uYkYYH3t6uZ5GnBq
 0bGOBscvG9nQG97vs/9bCS9xyg==
X-Google-Smtp-Source: ACHHUZ7XAyxFZmWNpZSc2KIfqyMKCpPl+vSe9EBuqjYf7ulHy9QWxlaytx85oB+odFzaxr9aTxhymQ==
X-Received: by 2002:a5d:6990:0:b0:306:2d15:fc35 with SMTP id
 g16-20020a5d6990000000b003062d15fc35mr11284074wru.37.1683709548317; 
 Wed, 10 May 2023 02:05:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k9-20020adfe8c9000000b0030642f5da27sm16678398wrn.37.2023.05.10.02.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:05:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86BE31FFBB;
 Wed, 10 May 2023 10:05:47 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-6-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 05/30] tcg/loongarch64: Introduce prepare_host_addr
Date: Wed, 10 May 2023 10:05:35 +0100
In-reply-to: <20230506072235.597467-6-richard.henderson@linaro.org>
Message-ID: <87ednoa74k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
> tcg_out_zext_addr_if_32_bit, and some code that lived in both
> tcg_out_qemu_ld and tcg_out_qemu_st into one function that returns
> HostAddress and TCGLabelQemuLdst structures.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

