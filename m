Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2F3C77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:43:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwk6W-0000J6-Tz; Wed, 10 May 2023 09:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk6H-0000Gv-AP
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:43:30 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk6F-0000Qq-0e
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:43:25 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f435658d23so13130805e9.3
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726201; x=1686318201;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WkdhEp5KLEKdXOq61mIo8u70VbTpAeq0C8R08mAZ3PA=;
 b=M7mkloJmByrwFy9/aVAiU0Mo4y2T/hqN1UOU8OICoAw/l7B0txlL5Qq4WaCUu+V0n6
 s+yj+u7en9M6ib7IG6zQ4KKl2LaNIFmvrfyiXU36/qeRJNVAgJn1bmAEfyg18RSdllpp
 AT6cipyqPJOpz7wm5D8H7+v/6snVhSdQJAVP0yB1Ocpws9BkH8VBMczFmJEK9shFSkRo
 LIZ0TpGmElNNmWwLrq66aUvClm0uV/73yNAV+WJdjgjMpAOreauUMJDJt54Pm/ssgEAS
 ViBUwBz8AGeABRqwtDi57NDMYIE0w4ziDSturtUytkn0IFXRP3JRYN8KobTcz+2PKiQq
 jnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726201; x=1686318201;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WkdhEp5KLEKdXOq61mIo8u70VbTpAeq0C8R08mAZ3PA=;
 b=KwhV2CYxVog4IJEygv4lrGSU8rxe0v1af7rU6Q6VhBMLBCywfZqOZMlixaKRTRZnY3
 S6e7R2Pqmc0Qh+usEtJHfEozZjgNbcwtKgX6jQcY+poRVt6G4WmqTvpkEqO+KyprGGdn
 Wm2yFAuTHrC6KVYNV7In0CRO47ZZtD2esoTflESpYfLBSJ5nQLD7wi6+qxarPq0G1mwE
 x7qlJDoeJOL/hSR79sRlKRdo2voewR6rRdGWjxnOwVvA96jKuC2mcxHxNxmQTg4oP+ZI
 MY0F0lis3EJgRG6LtLne3AJMdzHJhNqqN7hq8/AXdbaoOdUYCYjq0hH3Ex33i84exfD1
 1Ddg==
X-Gm-Message-State: AC+VfDyimK1kgwu6Bz4jomTQ2bMDbbETRZBfylq0wFbAj/65WyEeIqD3
 AmhztVC1YakPEuM5MQNvPzPRog==
X-Google-Smtp-Source: ACHHUZ6rJepGcEv7K4sWITs+/dbZS5wFj+Zx3PUny8bhgzBL7GGc8WcFLtmQ0r+kVOgtjQeM+qDx9Q==
X-Received: by 2002:a7b:c855:0:b0:3f4:23e5:5bb0 with SMTP id
 c21-20020a7bc855000000b003f423e55bb0mr8350887wml.5.1683726201283; 
 Wed, 10 May 2023 06:43:21 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c114900b003f4069417absm20013355wmz.24.2023.05.10.06.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:43:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 89DEF1FFBB;
 Wed, 10 May 2023 14:43:20 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-21-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 20/30] tcg/loongarch64: Simplify constraints on
 qemu_ld/st
Date: Wed, 10 May 2023 14:43:10 +0100
In-reply-to: <20230506072235.597467-21-richard.henderson@linaro.org>
Message-ID: <87cz387153.fsf@linaro.org>
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

> The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
> registers.  Now that we handle overlap betwen inputs and helper arguments,
> we can allow any allocatable reg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

