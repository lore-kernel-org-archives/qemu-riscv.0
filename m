Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498B4C001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:57:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9uK-0006TR-7s; Thu, 10 Aug 2023 13:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9uH-0006SR-Og; Thu, 10 Aug 2023 13:57:09 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9uG-0007Ol-DB; Thu, 10 Aug 2023 13:57:09 -0400
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-487203bfbc6so521484e0c.1; 
 Thu, 10 Aug 2023 10:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691690227; x=1692295027;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLqq9DPexGiKualUWwvksyaM8e+rdY8JQTwF3XqAUG8=;
 b=TJCpyeIHzI+QA5q/9vQemidsmW43dbG9NPUU/URGrAcc7XXUII2OE0ujOPSb7Q4CBH
 OXWIegmXMHtVtSsB0DRmGU/W18AS+36JkXEK95HVXyy/viVLzuTL4ozdVi8oiZxBY1aj
 RhvlYH5aHdeCxfpQxc8yvlUPAQ4Ti/YeIpJ1shVww+JTbTrvz7oRDeVHAxod/Gxc5k94
 9x2WnnBZ0v5ONZk5Y/Z70oFcqKUX5L8mkAW2VgGtS9rMlOH++fGTQLFYg33QsjHiH/7/
 yw4KbApLQMQo/a03xTtvNEmOy1m0JznV/rkdkZol/aOW8eG0YIZ/+qlg6WpvHmMZyI1d
 /SQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691690227; x=1692295027;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zLqq9DPexGiKualUWwvksyaM8e+rdY8JQTwF3XqAUG8=;
 b=BCXnUDBsJ9ENH1DwkHlKLVlaQkT0W1g7stK611jiZe3oFlkQHnVGSUOJmhtokIlHoV
 gSIU7t1S39e/2xj6f7xRL0Tc0FzX7Xa9vyFGsuCknEgCl1QJXeUnykFgJzctbMkNTxhk
 lP7EqqX6W/SDbEuY0dqTAJeHXwMbd6UJscptUCkTOaKBoeU1NIMRWPxm3uT5Td9sNTpf
 znSHXB9BvRL2un4t1q7B3lmnXFGemgqPWQY+hMHJMgZ9epqaJ3Xzf4FHMBjkVTjvsrzS
 kFvjenPvtSfH9Cxdj37NhcxPucsjgB9SjOuWorucvmbY4DhAmcNRsYD+NB689PNn8q36
 g+PQ==
X-Gm-Message-State: AOJu0YwN0F7Hj+C0ZIT0dLemDP3eADH90pPnDUvxCDxK50n7OrhY+BaS
 JtNdiY2QTmqxBAOdPe8b2K4aEGk63QDMoZ1OySo=
X-Google-Smtp-Source: AGHT+IEL58RM++JljJM8nkS4JTkpTDdrBvi0U1TobyB1vXBc29BwBzF0X8W5lJ9eeBJ2UFY8dLnSdxkYi9odnY2R8z0=
X-Received: by 2002:a1f:5e53:0:b0:487:19be:7d46 with SMTP id
 s80-20020a1f5e53000000b0048719be7d46mr3236439vkb.13.1691690227132; Thu, 10
 Aug 2023 10:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230727220927.62950-1-dbarboza@ventanamicro.com>
 <20230727220927.62950-12-dbarboza@ventanamicro.com>
In-Reply-To: <20230727220927.62950-12-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:56:40 -0400
Message-ID: <CAKmqyKNR4UCmQTpJrSgMA2V=M=fOAvOxSqUWDO_oDEKirHHcWg@mail.gmail.com>
Subject: Re: [PATCH v6 11/12] avocado, risc-v: add opensbi tests for 'max' CPU
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa29.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Jul 27, 2023 at 6:33=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add smoke tests to ensure that we'll not break the 'max' CPU type when
> adding new ratified extensions to be enabled.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/avocado/riscv_opensbi.py | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi=
.py
> index bfff9cc3c3..15fd57fe51 100644
> --- a/tests/avocado/riscv_opensbi.py
> +++ b/tests/avocado/riscv_opensbi.py
> @@ -61,3 +61,19 @@ def test_riscv64_virt(self):
>          :avocado: tags=3Dmachine:virt
>          """
>          self.boot_opensbi()
> +
> +    def test_riscv32_virt_maxcpu(self):
> +        """
> +        :avocado: tags=3Darch:riscv32
> +        :avocado: tags=3Dmachine:virt
> +        :avocado: tags=3Dcpu:max
> +        """
> +        self.boot_opensbi()
> +
> +    def test_riscv64_virt_maxcpu(self):
> +        """
> +        :avocado: tags=3Darch:riscv64
> +        :avocado: tags=3Dmachine:virt
> +        :avocado: tags=3Dcpu:max
> +        """
> +        self.boot_opensbi()
> --
> 2.41.0
>
>

