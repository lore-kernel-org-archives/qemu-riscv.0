Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C291CCD1BE
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 15:37:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBxMt-0007QA-H0; Thu, 23 Oct 2025 11:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBxMi-0007OP-Gs
 for qemu-riscv@nongnu.org; Thu, 23 Oct 2025 11:36:40 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBxMg-000399-S8
 for qemu-riscv@nongnu.org; Thu, 23 Oct 2025 11:36:36 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-784966ad073so12407457b3.1
 for <qemu-riscv@nongnu.org>; Thu, 23 Oct 2025 08:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761233792; x=1761838592; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R7Bu0evPT10yGWWc46+/Sxv8lt3PFMq2HvV0YKepJ3o=;
 b=JxzMdtxsN+UnwXuFW+9/nLbE3GSI+l8jx+31nuKlb8qBUoHa55HuCMOW8I4Mz1Q2JY
 77ylyx/YzCwhY+j+gn1/rupgU5GWFvfijfVY6yb9YgOoLFp8DfSyEEgFTfODuCNpN0cd
 texcGmXtjMzh4K8ZytxaaTqq5/GuRRHobSna/hQyClnASVqsxRuIGyBN365Pu/kQeaQ/
 9TLL5nYz+sQKt3K2sq7KdFpf45VoptDTrhxXHavGYKi3Ze93If/c/QYSKdsFtiCwPudX
 XTQEZgjQ3WX7cqwtPjm54vYf7oWl0K8x3xbFEA0Sy04KSzKPH96MYn/Z9fflScCNPcmY
 WUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761233792; x=1761838592;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R7Bu0evPT10yGWWc46+/Sxv8lt3PFMq2HvV0YKepJ3o=;
 b=F8DagYjF6u0A9G9pTLHpyjpl56kn7VrmwB/tZMd1G/1+hyCL6o5aYZYbXueq14TGq5
 4MV6Ug1c/KY78DvKAhLU8TsJa0CZyqc3GvKtXN8Ml2jo7Fzh9hn6jS3vmydu3hO94z9S
 yLcFACEwN+mcG5EjK0HOCCMuUa98SEUQ5lS8q4oAYVG8RSrbGR9Wvaxj8CjQiQ8VevTM
 ghxvB8vPDSQ/YS4HMI984fTMCcUaKeI+IaQvPGXSJeQNyYEeexSRFbl13br4Jqn2SvOf
 mL+S5Ua0cUwfGlB9+GWh2E/dTrkhL0M0WSuYbrLFRfeU1lAFUaciGqYwuL0MBMXS9nbn
 p+6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhSxstY5R65D2bAzpqV4Aul8703UpFvWQUU5N5BtIADAFxFiYRLL0Dxxt6+nQGfgP/98nR+3VcuhUM@nongnu.org
X-Gm-Message-State: AOJu0YzTeYy40+7gAI6ggHDezZW1e/WOmvc1R93dg8soJNtR16fXHDKp
 2TDLSNghbvwn/X619H/o+fa/f7dTQTqwCJ0VcSq6UdH2eylRROPubiOCir1TwUO7oK744iSZzr+
 OaJ6zpWXiJhmXEheMrCJZVeZDMHs/jMl1FEa0aPjOZg==
X-Gm-Gg: ASbGncvGF+B4R/gy9hLBaWrnAPwgJSQZj8xKuaKzQGobdOVZvWk+sSMXYbg2teImpYe
 HQjloaVaBEypWC2Dpk/Mh98qjofw7v7oDMKIKxYFN/d2W1yy+rE901SlTaZ+S8RH3PofYZ6bTWQ
 QGV7NhtTDiC26/GWM4mP2f1AkTyRR5HL5/VmRNOKHOjzOpEKXRj0Vx6jVpB0XO1HIx2Jx6hGuZN
 mb/WPWXaJxmZeBmvb04Og/6BXsar18OH/vntz1S/MmnObvnPhDmu2BhzMPZgjzc2O+Od2H1
X-Google-Smtp-Source: AGHT+IG1znZmh00ANSnKnoDmuuju/L1QBXZOYYFNIxsERl38+x0oWodGpZUqwW4HlkqiKRp1fKL9tmQEB4+JCOtGLV8=
X-Received: by 2002:a05:690c:3605:b0:783:71ee:8977 with SMTP id
 00721157ae682-78371ee8b09mr229716667b3.11.1761233792347; Thu, 23 Oct 2025
 08:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251022110524.483588-1-dbarboza@ventanamicro.com>
 <CAFEAcA-gF4himAj7k03cES2-USbE-xs7f5LZEPQaCqHhDieiEA@mail.gmail.com>
 <06684337-601b-47d3-925f-b5a693aef244@ventanamicro.com>
In-Reply-To: <06684337-601b-47d3-925f-b5a693aef244@ventanamicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Oct 2025 16:36:20 +0100
X-Gm-Features: AS18NWD43brInKiX4K_0k2Z68WeBtLuCdwqQbOafpyOHu9aPWRRAeJleyIZYHU8
Message-ID: <CAFEAcA-5wCL7b2Vc_4NXHNUqOn6SsY8+RD0-mZo7rh_jw74BFA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/riscv-qmp-cmds.c: coverity-related fixes
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, 
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 22 Oct 2025 at 13:39, Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
> On 10/22/25 8:59 AM, Peter Maydell wrote:
> > g_autofree frees with g_free(), which isn't the right thing for
> > freeing an array of pointers. To do autofree here we need
> >
> >   g_auto(GStrv) reg_name = g_strsplit(...);
> >
> > (GStrv is the glib type for gchar**; the headers give it an
> > auto-free mechanism that calls g_strfreev().)
>
> I saw some instances of "g_autofree char **" and figured that it was ok to use
> g_autofree in this case too (just git grepping, didn't dive deeper to figure
> out context and so on).

There might be some lurking bugs here -- it's an easy
mistake to make. I did a quick audit on the results of
 git grep 'g_autofree.*\*\*'

It looks like migration/migration-hmp-cmds.c:hmp_migrate_set_parameter()
does the wrong thing when it calls g_shell_parse_argv(),
because that function documents that the vector should
be freed with g_strfreev().

All the others are OK, because the elements of the
array are either manually dereffed or else remain
the ownership of something else and shouldn't be freed.

The migration one is a recent addition so I'll follow
up to the patch where it got added to the codebase.

thanks
-- PMM

