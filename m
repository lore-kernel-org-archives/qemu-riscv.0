Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD6AC7EE22
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:13:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwjd7-0000pr-NA; Wed, 10 May 2023 09:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjd6-0000op-9a
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:13:16 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjd4-0002tK-PU
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:13:16 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e25fso4801397f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683724393; x=1686316393;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KrY+rRORwyTnJvFkzyqBGXyvhAgyJ4C8HxUAYhY4a/w=;
 b=o65axh0ruaLU5DmkLeqvEIn3wiE+VRQjl/2ikzqrmGaYm2XB5mX13ADTKBMRmqCsIK
 fOH3U6t3DQ97Bz9m44eDorRyxd2IcmBEZQY+K0UveKuj1PXDxd1pOw9PYkXTBENwX4Mo
 bBfyFClLNHRA1V0cMM8OIOVPeINwZxQqsVNGZPZ0Lio19UTiaZ5ySnbE/bm8jmp2c7/V
 Q+4ejwhMy823uaOTmyXZmBKkFJv7zlnPy7VQqH1sGTfXwEkMF4sh95gqoheQTZUlorBy
 xRoLLLxJJu0295aSDMRmZ9Rf6SdtP0oBZt9/qEOZ5y6xsKyzguWEKGKy1yK1DexeWGCJ
 Ndkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683724393; x=1686316393;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KrY+rRORwyTnJvFkzyqBGXyvhAgyJ4C8HxUAYhY4a/w=;
 b=XzpOkVnbdu4SbaDjTmMXOjqwxXZdMeMDQNkVHoxQ0XmfGzufLS1Y+NQ5ZvgDeWX+y/
 GLsHX9UYX9zQx8CyrcZI+omc+jdzmYD0qMMqKn5zM8KY+0BoA2Dj8h63Cd5YObR02iRE
 tqxSJth6lPj9LLJNEhRZtvNFDTR8r3ns7bQ83UEG6gYW0epT8HjilpopN7+riq4yX0+0
 2WvMfv1ZOR5V0YaEgtP3Y0xo1HsEko8B6V5j0NgiQqe/hcdSW42EhmJVvhCWYRZpuMU9
 OP/2+Vlis4wA8cV2joIJhLF8G67YG0kuKtJLwIgH37DtU03W/9AY4k4hdO2+0ZjF4bDa
 mrNQ==
X-Gm-Message-State: AC+VfDyZ/G8P4ZeZCu1Vvg1ZAwfO+IQ81sEoz4j8lIkNJNMXqRD7u52O
 4hy8vuWz7dWgtskzZTcHI96DNA==
X-Google-Smtp-Source: ACHHUZ6ChQXDIGn0cY/pzKlcBnLI6X5RCyOStovrHk+9mC7KAVSuDt/nIJwb56Fyb0rOYLdFAJED0g==
X-Received: by 2002:a5d:4578:0:b0:306:31e0:958 with SMTP id
 a24-20020a5d4578000000b0030631e00958mr12460297wrc.15.1683724393179; 
 Wed, 10 May 2023 06:13:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d18-20020adfe852000000b002fe13ec49fasm17274352wrn.98.2023.05.10.06.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:13:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4E9D11FFBB;
 Wed, 10 May 2023 14:13:12 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-12-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 11/30] tcg/i386: Convert tcg_out_qemu_ld_slow_path
Date: Wed, 10 May 2023 14:12:56 +0100
In-reply-to: <20230506072235.597467-12-richard.henderson@linaro.org>
Message-ID: <87fs848h3r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

> Use tcg_out_ld_helper_args and tcg_out_ld_helper_ret.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

