Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E4FC2BD09
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 12:50:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sSFit-0005gV-Jf; Fri, 12 Jul 2024 08:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFib-0004wx-QY
 for qemu-riscv@nongnu.org; Fri, 12 Jul 2024 08:49:48 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFiX-0001bS-7i
 for qemu-riscv@nongnu.org; Fri, 12 Jul 2024 08:49:44 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-58b447c511eso2466245a12.2
 for <qemu-riscv@nongnu.org>; Fri, 12 Jul 2024 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720788576; x=1721393376; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CCudL+2uFh9uJpKv9cJcXhgbDu85xfNNfQx4hvGfI60=;
 b=mUngZlpKNAqtDM+kJ8IgQp2mGMx8v4TKOf+nHVmjdrNROn6W2jEIKaa5fyttML0OUH
 DdcuhbK+S92RmUWfy9Vm6MYQf99n7ByAico6NGG9PKbVytgEm7BsM4MDL3bPMiQ31U8u
 CfsbzpTo1tKZBEZ2Z67aidCcHESWmOXHUCqqYXS1V+pgU6ERYrM8mTKsOiJ33EcFirmz
 d2R1p1UcWQLJqwR4wJigN13tN79QD5QzbWdwV/4+zRc4Mk9ow4gwn1RYIfCzsaTFohy5
 v1sQ0C1KHdfYaiY0lKtBImRDjyshLYgcZaLP7ZTojWiKY6xLYkbt2qaJkQuPYwJDxhXp
 LTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720788576; x=1721393376;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CCudL+2uFh9uJpKv9cJcXhgbDu85xfNNfQx4hvGfI60=;
 b=Y+MrzDi3jJjYaD1SH4JhEVmO92w6BU0CXeYMhOBaZws3edaCLQc0OuaQCnuNnYOJLY
 ZseaYp5MFCSkwNxPzttmIeG++hfm8pT6foUIRRlm8VhTmeF55ndCIhsVXc/8s43meC5i
 ZwtsP8schcn62Y2rBSrMvc+x0wjeETlj9fDz3HYXrd5TMD8kRafzIaZZexiRWJ8NAL22
 MBXyw+OgLFgVkCnjMICX/LOIw0pKZropofOLEBA9Obi/OIYMSYXJSei3HjmnFDx3KB8t
 oiD2/w3JiHepCNm1vwlESLI7T6kimgM9dHo6iyeFNWsANBrpfSOoOJAT6YYRg1idWBwQ
 SvIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsGT0wrxICbujEILcIr3goeJkPUjLBKXtBUeYbyI0pCNU2/sgIGGXNtgF7cpxgDsCmJnMeLDC+sOs3D7+dhZcBQQUNkDI=
X-Gm-Message-State: AOJu0YzfVholiewop/wFmdZikGcNsoScl2Q8BMZUBM7VgR11utB+qtLw
 O+xMlbhv7lR5v+OuTPIewIeOrB6fJBWefQUr/Yr+e3IRxl/F97NMkNp/p/IogqbPjbT9zZ0Q57x
 En3gpMtpNgZrzyf9Dv1Oiq2lNvwTrNQP+RaiSjdvJ5mTcz91A
X-Google-Smtp-Source: AGHT+IHqxoU+gpj9yOgjjiEJNocgYqRV/czK1W/CuOaLnDGUdsvWDdmUekcEUehsnEaV/Ne1NmbIEXc0ZxeKC+ieU7A=
X-Received: by 2002:a05:6402:26d3:b0:58e:2783:242f with SMTP id
 4fb4d7f45d1cf-594baf91224mr9068100a12.10.1720788576604; Fri, 12 Jul 2024
 05:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-3-richard.henderson@linaro.org>
In-Reply-To: <20240710032814.104643-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jul 2024 13:49:25 +0100
Message-ID: <CAFEAcA-PKsW-PfGqOK3RgfyfJUsEHWYMeTyikgrEWSYvAmMEow@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] target/arm: Use cpu_env in cpu_untagged_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu, 
 max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, 10 Jul 2024 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In a completely artifical memset benchmark object_dynamic_cast_assert
> dominates the profile, even above guest address resolution and
> the underlying host memset.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index d8eb986a04..ccfb9349a3 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3309,8 +3309,8 @@ extern const uint64_t pred_esz_masks[5];
>   */
>  static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
>  {
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    if (cpu->env.tagged_addr_enable) {
> +    CPUARMState *env = cpu_env(cs);
> +    if (env->tagged_addr_enable) {
>          /*
>           * TBI is enabled for userspace but not kernelspace addresses.
>           * Only clear the tag if bit 55 is clear.

(This one's now upstream as commit efceb7d2bd5c.)

-- PMM

