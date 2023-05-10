Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252E4C77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:49:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwkCA-0003Ha-Fw; Wed, 10 May 2023 09:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkC8-0003GE-Ev
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:49:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkC5-00023A-Pk
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:49:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f41d087b24so32235325e9.1
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726564; x=1686318564;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BFr7aNr7ghsjVJZjtG4pAVyRzXjItCEl9qCRymyqn2E=;
 b=vB9Nn5UkszzO4JJ+7L11Xfdz2uD0SJuwHYc3aosgug+FJ6hTUp9qFS/wAyxPjbPY+P
 RXrOup3VcUQXOXRpSXuuZYLeA4vWV0bemUvJgKYQCgh5+HLUhCLcjKRch4S14ADt6ZlC
 haBSCog13E/axoruYDSWOP0bKN5BfyISR6u8ql3FvDkx0GmciE/iJ8hQX/2zwiWsLUh0
 aym4O5+TP8IoVAdqMrESy2tcvcEeA8Kcy0AvIhDQMcrlbz+Er0DRmjFnvQtT/OFRmHIX
 uHYdjHcbvlbypKGl0Svbdfh13kye04FjkJZVzFxsJ+2Xg1XHeVNXvT4oubGIGbmRT/Q/
 Y4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726564; x=1686318564;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BFr7aNr7ghsjVJZjtG4pAVyRzXjItCEl9qCRymyqn2E=;
 b=YG5RBhDnFOuoLM+lIfGE7f0XWwbxzv+lnChx65bENcDCgAm1/LCKCJCx57nYzSyBfc
 VoGGTZ98F6ZKQnhlxyvmiMl5X/kI6Li8xcLx+a6lT6thV7TPw/Idm4N+P7XhsIv4BGNj
 MJeXXnpxdYeuqF6bMedS9fHWjpf/vWh9BpMJvblJpwvFkv0Th1F8EKvwCHzljwsBavjX
 xePxe/yLf2JepemaG8TcGFF9KWy0+j/migvQ0AL4RPAfwQar7SWrfrsCaj3VNFcSdIot
 IZp2qzD9TYPmh/EBjvZiyeWbG5qCTJE/CLRXB/BJ5H2oKY50bPejJa0shF/ca4Z2jh5V
 9LGw==
X-Gm-Message-State: AC+VfDxvkTc4SDDTUcUienDEw4LVyajA3IlftYLzZB+gqBrObddKfCzY
 SRbhfDce0UqzXQIc9+ElNlmjeq5FRuiYE28YNX5k/Q==
X-Google-Smtp-Source: ACHHUZ66ik99DqVmT/7W7gdVFC/E2MC0uWcQj9Sdyq2nFbyBi3OsxOdXYOk95RS+DskLwGUsavBaLA==
X-Received: by 2002:a05:600c:2055:b0:3f1:74c3:3c51 with SMTP id
 p21-20020a05600c205500b003f174c33c51mr12582392wmg.35.1683726564127; 
 Wed, 10 May 2023 06:49:24 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a1cc901000000b003f25b40fc24sm23069878wmb.6.2023.05.10.06.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:49:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 535281FFBB;
 Wed, 10 May 2023 14:49:23 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-22-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 21/30] tcg/mips: Remove MO_BSWAP handling
Date: Wed, 10 May 2023 14:49:15 +0100
In-reply-to: <20230506072235.597467-22-richard.henderson@linaro.org>
Message-ID: <878rdw70v1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

> While performing the load in the delay slot of the call to the common
> bswap helper function is cute, it is not worth the added complexity.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

