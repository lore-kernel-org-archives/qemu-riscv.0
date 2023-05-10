Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07288C77B7D
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:54:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwkGz-0001IH-OJ; Wed, 10 May 2023 09:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkGy-0001Hf-3K
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:54:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkGv-00039d-9J
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:54:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f315712406so248052315e9.0
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726864; x=1686318864;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5cbsgBuLaTxBjRhC/4MLIz6NdMRaBMNAuHvEK3dyWM=;
 b=VJjeNGDR2pBNdGF8rGjE48DnxUdGFulQh5DgDD0CBeS644A2xNeAxz7DMYoIwPMOX7
 33Al2xMz84tHeufC8m3ts6DEbkIh53ObJ+Zeim+xCiLSSbTQ1gva+FPMlE4H4hEUXlya
 QylgIf66hI0L1R636PXCIlx7aqOqtv7ueN89jYsvvkRQYhZceRydCnoTB9ALJ0ZE4B+m
 ATkBqYAL34nPiIIsHkdnyAknZfW7gAVroNulE90AQ/JmTkAC6ruJBaRNmvSNWXy41o5w
 UcXehKjASpPX91Yp8NNyHUDNKXL92uMdTgg1Mk0YdisqqEZdvwSw2aZLahntqO1JYX5K
 HGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726864; x=1686318864;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=U5cbsgBuLaTxBjRhC/4MLIz6NdMRaBMNAuHvEK3dyWM=;
 b=A23KnKEcuOOLR1s+zSiXv0np6dJGUEFrTPycmh2pIxN7fQ6sL2ROnPwiyXh8/EhTNH
 7GvDi1Qrh9wyJ5fSmQpQI7IXAFfYDrimkC1skwCZuWdgDUFD5uUQrhjIRv0GGSrC2iRE
 fSrvWacjDChFt/+gExOHCKr0TcMEaxZAlw5brmSo7Gcn5iysQCcMWnGDkRkkhRBYagHd
 smypbpcHA4XfiFyu1C6ZuG39oroxvFDlh6NVDL7xn2zjWZPa2B4hMAU+5FmtFFkSvOFl
 CE+v1Ky++kVSH+R7ZeRf8Ah45jcjnajcs6SUKT0aLfSWVY5pDFUGKuayTYcJYFUOB0aw
 twBg==
X-Gm-Message-State: AC+VfDzP9zzSgT8VMVAxFPjm+kA4ckZoN4z76dOEMzjEpM9sUxE8F7UD
 cR9Sj9RG/IbFOK9diXbDxLlA9OxWcPWTVMFTMcU6kA==
X-Google-Smtp-Source: ACHHUZ75Hn3fRy8G7gK9NIbGBUOEmMMMcUeUd+xLv1GTBEZpcFZ6F1yGhEnbZiX6vtOwBLZZL5dSkA==
X-Received: by 2002:adf:e551:0:b0:306:2b38:38d6 with SMTP id
 z17-20020adfe551000000b003062b3838d6mr10643998wrm.3.1683726863832; 
 Wed, 10 May 2023 06:54:23 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a5d694f000000b00306415ac69asm17425567wrw.15.2023.05.10.06.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:54:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A25C11FFBB;
 Wed, 10 May 2023 14:54:22 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-28-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 27/30] tcg/ppc: Remove unused constraint J
Date: Wed, 10 May 2023 14:53:30 +0100
In-reply-to: <20230506072235.597467-28-richard.henderson@linaro.org>
Message-ID: <87ild05m29.fsf@linaro.org>
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

> Never used since its introduction.
>
> Fixes: 3d582c6179c ("tcg-ppc64: Rearrange integer constant constraints")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target-con-str.h | 1 -
>  tcg/ppc/tcg-target.c.inc     | 3 ---
>  2 files changed, 4 deletions(-)
>
> diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
> index 9dcbc3df50..094613cbcb 100644
> --- a/tcg/ppc/tcg-target-con-str.h
> +++ b/tcg/ppc/tcg-target-con-str.h
> @@ -16,7 +16,6 @@ REGS('v', ALL_VECTOR_REGS)
>   * CONST(letter, TCG_CT_CONST_* bit set)
>   */
>  CONST('I', TCG_CT_CONST_S16)
> -CONST('J', TCG_CT_CONST_U16)
>  CONST('M', TCG_CT_CONST_MONE)
>  CONST('T', TCG_CT_CONST_S32)
>  CONST('U', TCG_CT_CONST_U32)
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 5a4ec0470a..0a14c3e997 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -83,7 +83,6 @@
>  #define SZR  (TCG_TARGET_REG_BITS / 8)
>=20=20
>  #define TCG_CT_CONST_S16  0x100
> -#define TCG_CT_CONST_U16  0x200

Arguably you could tidy up the bit masks to make it easier to add a
constraint later. But anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

