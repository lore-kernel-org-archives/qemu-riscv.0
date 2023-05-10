Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80BCC7EE24
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 09:12:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwfrS-0003vm-3u; Wed, 10 May 2023 05:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfrH-0003fK-H1
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 05:11:39 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfrE-0000oV-Ap
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 05:11:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3062b101ae1so4449404f8f.2
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683709894; x=1686301894;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZ3uAiHSniXfodcNdJp9MqKvf82xb+cKa02xvjJ/7/0=;
 b=htoIUAGaTqUfO1aVSdxcnQaUgRbWV+S3EsdCQMsdaIsA28tYXMEuXnkFMJTAA242Dg
 1HyXSmkEp+TwjROWShQW0d/NKAD85lmwbZVYytqrGj4MaQXbEv/DpUXxM5kOhm0/+5eN
 ENTAy5qapqXRaxU9XY8Ko4PViLuD5wcqEYMxVj3Zw+1PLNR0no2UHiL3K5I0WhkzELlu
 Lqknbse1HicwLJaCp8EqxAluFxATTo5OpBMbSSF6GCfikTqhn1bmG6YsO8YRAest3dn0
 Hf1qngvW0l6ZlR0Fzzrbrwp9uys9brtgNoxpbl9+gKMeEvPtgTrVfTEz2NK/H5TzSvPV
 Ruew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709894; x=1686301894;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vZ3uAiHSniXfodcNdJp9MqKvf82xb+cKa02xvjJ/7/0=;
 b=DZyWAg1+bjE7caRHyqD7CYbd9T3KQIXPrvwSKIIqrDiGfCP9Mnvi4+gI4PQdaSGpXl
 oQeS0VC29tYR2lD7W4z7bWvwZ472mhLnCNEFPl1KRkYWq+BcrOnuN3L9S9Lj/s8o3n0l
 LpXHpwqh09vNkJGBv6EnJ8CWmxjgbMRKMK5rH+qJ/57gM3HZ17VO4B/FM0veq+BMkFva
 YS7+2ED41pYP/BmoujOzH/4IPH7PvNeGHET5CVnxWj341D5qnVfAbbYapD/hCTzEPCKz
 2g4yC9FxsU8cS52F/jgPpftJNK32v1LtKhZNALF2VmndulaqJDWeHrMfsUP8eZn4DLlt
 sWXQ==
X-Gm-Message-State: AC+VfDyTib1ZaEW5MnM0DWQdgyUZlq7bykNVNjc5FWR/a4qWsSmJrL+Y
 cqAVOsy9q1p7i3iP1dC1+r0/8Q==
X-Google-Smtp-Source: ACHHUZ4mPqlwWLUZK7izPhbejiwGhpGfZfFVJxB2SVaUgDZfiI4o0bX2HlHoDX9/YsaYSmGq5cyyLw==
X-Received: by 2002:adf:f887:0:b0:307:9256:3210 with SMTP id
 u7-20020adff887000000b0030792563210mr7884362wrp.1.1683709894691; 
 Wed, 10 May 2023 02:11:34 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfff92000000b00307bc4e39e5sm663209wrr.117.2023.05.10.02.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:11:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CCCE11FFBB;
 Wed, 10 May 2023 10:11:33 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-9-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 08/30] tcg/riscv: Introduce prepare_host_addr
Date: Wed, 10 May 2023 10:11:22 +0100
In-reply-to: <20230506072235.597467-9-richard.henderson@linaro.org>
Message-ID: <871qjoa6uy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
> into one function that returns TCGReg and TCGLabelQemuLdst.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

