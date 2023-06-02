Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EF7C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 12:46:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q54A1-00044G-4Y; Fri, 02 Jun 2023 08:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1q549z-00043z-Pu
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 08:45:39 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1q549k-0003fi-On
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 08:45:39 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-96f53c06babso275307766b.3
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685709917; x=1688301917; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E+6nITjxiVNKLSxS9tyRtumsyHtwglAlx1FkH21FSNE=;
 b=SrJndCoCvndo1LLDWvUw4trofuI7rWxp1mUknEm/PJKj+ULP2InDogqGqs8NOwegm7
 kc1Uii1OOWijMTj8uM4ZaHX/pH8VsfTa3K7NCOA0E3tVYheor0aylUyeQhuFbpKjAzS/
 zIRSUOO76czRuQq8s6w0eEFNCVEVYA9jryBUnD21tUOjbEHY/1WBCsXNG1RuC4WSHAw+
 DQxulTXY3OJAJtJo1P6WfjBXEH9Z3r4REsEfx9SPL9LW3RPitISry5pWLfYbRobKzUFF
 DPSVWoZ4KsrwMg7RbzGyJMk6TLHfPOUo4k/81bowCSA3weDs6Lt3sJkFi0yXGogRNxU7
 6UFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685709917; x=1688301917;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E+6nITjxiVNKLSxS9tyRtumsyHtwglAlx1FkH21FSNE=;
 b=PYrCEvVjAOMdku8RBIewsq7vdzH8jfS9imGdx1OGs/4wjRZF2Auuj3HtA41fydRnS4
 Oxp0QI08ZdPTSsQY+i10sjMf5Ht91wZkAO004HXibr4iWKlHQbLtvGBWBo16g/c9Ybor
 e8z3yoPzITzPJ+Med1r4ytoHpIiVeVtkMEKAxVZcjyidTUxaPvrm5u33KL5gxjWOtflE
 TFwP8thPKlqiqm0iaZ0D02gEgs8gGiTR/MwsXxr+jk2IzN+trqGKi/8a8anMERz4uDCP
 LKBP+pADOuL0fSwtv9R6d/nxxCpTFvQ6+x1AT6O6c2T5HA8F8B/A57twUqZ9FeXBDtYs
 6O4w==
X-Gm-Message-State: AC+VfDw4PR3rjDeDEI0tZ/+1lgHxZt8JaR3/UepfgqRXy4Ymh1UgM9Dv
 6b6tVWUSJyjpprZ5OVIp/nCc8WLOvvjw2TGXbnd43Q==
X-Google-Smtp-Source: ACHHUZ6DNV4/uzZushl3sxOtbz4wbg/7xUE6fVKRIqLhnkiPLm8ZXXZn5DImPK5aQJDVZMH/5cSwCu6+D5s3RMPqVEU=
X-Received: by 2002:a17:907:6e0d:b0:94e:afa6:299f with SMTP id
 sd13-20020a1709076e0d00b0094eafa6299fmr10811513ejc.22.1685709917097; Fri, 02
 Jun 2023 05:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230602121638.36342-1-rbradford@rivosinc.com>
 <20230602121638.36342-3-rbradford@rivosinc.com>
In-Reply-To: <20230602121638.36342-3-rbradford@rivosinc.com>
From: Rob Bradford <rbradford@rivosinc.com>
Date: Fri, 2 Jun 2023 13:44:41 +0100
Message-ID: <CABPZdxv+gj3MWfoaQ5Dv-7tJj66-pg3yT2bZHpwuEAaepEizig@mail.gmail.com>
Subject: Re: [PATCH 2/2] disas/riscv: Add support for amocas.{w, d,
 q} instructions
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=rbradford@rivosinc.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On Fri, 2 Jun 2023 at 13:17, Rob Bradford <rbradford@rivosinc.com> wrote:

>  /* structures */
> @@ -2123,6 +2126,9 @@ const rv_opcode_data opcode_data[] = {
>      { "cm.jalt", rv_codec_zcmt_jt, rv_fmt_zcmt_index, NULL, 0 },
>      { "czero.eqz", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "czero.nez", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "amoswap.w", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
> +    { "amoswap.d", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
> +    { "amoswap.q", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
>  };

There is a copy & paste error here. s/amoswap/amocas/.

My local version is fixed already.

Cheers,

Rob

