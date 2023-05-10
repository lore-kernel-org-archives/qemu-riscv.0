Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287ACC77B7D
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:40:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwk2o-000378-F6; Wed, 10 May 2023 09:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk2n-00033F-90
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:39:49 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk2h-0007eu-J5
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:39:47 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3078d1c8828so4302320f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683725982; x=1686317982;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XsminFS3XLyksBmpaEcl2jVCd9XbIRCOmqz74DmSzYg=;
 b=QYOs8q/Xaa54pJGXYBAaivVPXM2LQCEqlXJ6RFNXfAn9U8jVBwRUR51bNNpZ81pjH2
 O92UtaoiF4eeGtY8s5GKUD+L90fdf1SpMN0VzTdQRKs3rUliknrpCrqGw1lW3jAuClh1
 s6WyxdZFQ7K6cs/Kp+9OeEMOh1/o8xTnHaYv0WGR9uzI/v2W/5XtszSqErl7vpkkk+Ug
 aIE5I5OmqWdeZuDH50/zmZYm44wG7kcFJ7GYtvks9+TYKULKNBMavRPjKoI/d/wU2PMo
 uvBMaE91cJaJrQFihK9OfYPyQyoq5OEQ2O9etOkC/zBqv28zwef+2CiVAH6Tf3KNIz3p
 WrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683725982; x=1686317982;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XsminFS3XLyksBmpaEcl2jVCd9XbIRCOmqz74DmSzYg=;
 b=MdyhAKMEG3lUwcZkLc9BhGgByJRL7KvbGyD1vcJgQKuWoODrM4G6MltPK0E5fnQJ7j
 bYJA7W1ACUHpJQKHW5R6N7rIf0ECyPtnwn8FyfLJlRriUyUZVstbypKDS9x10SGRQ3CK
 B/8B7N92PzmcPeF1qwoole0dVfPYJX7AJUtUxrasIlV+sLaE0C9iSLV+C6Yho1CAadmN
 CYjklSEXIJxR3RNFuxBHTfy9ou58NDjGOs/R+8+FApcc4TDKZFuOVDnB64QBg4dUY4li
 hDeKCxEhjCKuQIQ77z2zJ2jBRNTB7v3QZdkPtIXVj3Yd7jvqYRrdfyjRwgVDnmZgmOj4
 KpZg==
X-Gm-Message-State: AC+VfDxdRoZGJs1SCnC9qx07ddGC//HFJvp7GFUihBY8Le0pkAWqa05D
 QRKTWW67TOO9fxtZvr3I0/4UnQ==
X-Google-Smtp-Source: ACHHUZ6RUp/+Pv9LaLiDYCpsjCEFs3cRZih84k0+tL+AgFXtKdz9h/xNXgE1fzNEUWHEuUESXJi3Mw==
X-Received: by 2002:a5d:5266:0:b0:2e9:bb2f:ce03 with SMTP id
 l6-20020a5d5266000000b002e9bb2fce03mr13679713wrc.0.1683725981853; 
 Wed, 10 May 2023 06:39:41 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a5d6101000000b003062b57ffd1sm17581239wrt.50.2023.05.10.06.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:39:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 153C61FFBB;
 Wed, 10 May 2023 14:39:41 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-17-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 16/30] tcg/mips: Convert tcg_out_qemu_{ld, st}_slow_path
Date: Wed, 10 May 2023 14:39:26 +0100
In-reply-to: <20230506072235.597467-17-richard.henderson@linaro.org>
Message-ID: <87ttwk71b6.fsf@linaro.org>
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

> Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
> and tcg_out_st_helper_args.  This allows our local
> tcg_out_arg_* infrastructure to be removed.
>
> We are no longer filling the call or return branch
> delay slots, nor are we tail-calling for the store,
> but this seems a small price to pay.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

