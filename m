Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CE3606A32E
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RD4mFNvm
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOzy2-0006gC-O6; Thu, 05 Nov 2026 11:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xOzxu-0006aF-9f
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 11:05:28 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xOzxo-00055O-2c
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 11:05:22 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso1720736f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 08:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793894716; x=1794499516; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=MTD+YMdenV8nPVPhjGdFh71FJfRNuOqVrF2HphRsq1A=;
 b=RD4mFNvmXDn/0vC3IMlVWZ4VJsDK3SnGbmCoQbYMNrBlfBHCj2ZYmP/UU+We2Jw6TO
 Mm2rIk5j4qhEvtNQqrAOOc3hXW3Pf52LSWLkPBdfFsMipNLBL8K881a4EYYnXpYUtzMN
 e/5XztZBA7LzttlFGdmbS5FxVQrT1BVAfIPXbZDr163lzR1lMpfZ8tyCDOkO+QfvFLeu
 43YjXpcPtVj1DNzbhxEX7li6dzlfkojhRvo0u65wt+Wkkzad2rplLQ8tbUGufr+3xvPX
 TuCJO6roOdoILgNoDKfeP+new9B1PEDL8QCd7JZgyKuRw7jbyTvZ1VcS0/kb5sM3Ahbp
 TZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793894716; x=1794499516;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MTD+YMdenV8nPVPhjGdFh71FJfRNuOqVrF2HphRsq1A=;
 b=AoExDnbHiuBTFP/h3k8oPk5uW4/Xs+ngFBKzHfualcerDA41BALYk7HLe0XpK8/COk
 BQ/Eg3WcY8GNx7Qx9xvXbEYShuf5GGeypPsyyoaevf/9UeFM6YqU8NcPCETRUzVTP6T/
 rl7i0RmUH9X7ptTMmiJL/k2O/iizUhRpVHCNZtZVo8EDOOKMScKmC4KyklMdwcNl7jbD
 dN+mZIFGjQgqiujbbDumpw+bCnavxnWOsFV+Di2lTMDHyYkf/i/SA2M9Dg9o5ImRzbpw
 yEPXKWjXFhHfsA65kidqasuqa24B3Xkq/I6Jb8ElJx7S3btjHXUEITd60ASoSPX9aKpi
 71sg==
X-Forwarded-Encrypted: i=1;
 AKwUvByaqFnE3U1MTH040JxlXKiE2wOKmgGhaNbvPkBxZucicjdfZEMVjfVmz9e0sWRIzp2ismc2tlRv2Gzk@nongnu.org
X-Gm-Message-State: APuU4Z+xGcnLr6Hsn60nhpE610UY3GyfvT3qDZ2LacRnaR2tQogDeGH1
 u9yyXZ6vddWJLxRqqTzjU9grwLDpOHV9lfySU8xb4QltBgbub8c/ew4VBQAcIlSoz6M=
X-Gm-Gg: AYBFou3by2PKj61TDJsdcOmX3B1UHHqgMjg8b6Rw1VcnP9rEZIjScBGXqZMUw4tFloe
 6X7wcMDQ7X/Cy/P8LlEvOHLqxhiJ0/Z9MblNzt+LybDK+dNEex2SCmWJ3ezG/D+1BOXMxSg2cGp
 SAT5tcPOGuPZyw8YP5jnRuK+SkhrKNZBxp5esv09/78YGzsxx8HNAthayCtfjdJ12YA/xtkgV1s
 eYNWGOmI+of2X6o9HaTxR9IAFXav3ZSe3bCDliguTckVPUcj9EDWibN9aiZ+oxSnYJ/0qLgeUdP
 hsI3FJZ2FVnYsaJrOLFFTSwbb6N8xAIcu/q2CULK3QH6GjaT6OI3BLUBPTSJNU1vrB6lXF++DMR
 rZyNCVgO/sNbeDJ55VrmP34EDMr/p2GcRwAkVDYiIWVg81mipGCAjSKH09EM2xHX5ogc4NbR32V
 pBUd1mYglqrt+MNaIoFQWHw1t0jpKsmSvL7xJJJ/Tvd1Nt5xnJDU4NHsCVX0+Jdvy2hZQA9qsQJ
 IM9JO1k2Ygca0upSTajvMu3pRXJxQk5fn0AA3aVqfPoSenZFzb99X6BsIyIGaycDK4dVAJI7nKC
 LMGn4gCqeJrm6nSYb6VineAwkedT
X-Received: by 2002:a05:6000:2901:b0:48b:59f:db9c with SMTP id
 ffacd0b85a97d-492775f03ddmr79582f8f.53.1793894716357; 
 Thu, 05 Nov 2026 08:05:16 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8734sm11354531f8f.20.2026.11.05.08.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 08:05:15 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B41E25F8AF;
 Thu, 05 Nov 2026 16:05:14 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,  Palmer Dabbelt <palmer@dabbelt.com>,  Alistair
 Francis <alistair.francis@wdc.com>,  Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Chao Liu <chao.liu@processmission.com>
Subject: Re: [PATCH v2 07/17] hw/riscv/platform-ref: Replace deprecated
 sprintf with g_strdup_printf
In-Reply-To: <20261105125203.40320-8-philmd@oss.qualcomm.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Nov 2026 13:51:52
 +0100")
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-8-philmd@oss.qualcomm.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Thu, 05 Nov 2026 16:05:14 +0000
Message-ID: <878q376z7p.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:

> Replace sprintf() by safer g_strdup_printf() to format the AIA
> guest count / description, silencing -Wdeprecated-declarations
> produced by Apple clang 17.0.0.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

