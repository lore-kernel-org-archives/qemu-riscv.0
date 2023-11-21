Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F313BC61D92
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 14:11:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5RSk-0000zW-ND; Tue, 21 Nov 2023 09:10:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerry.shih@sifive.com>)
 id 1r5LtQ-0004Fx-6N
 for qemu-riscv@nongnu.org; Tue, 21 Nov 2023 03:14:00 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerry.shih@sifive.com>)
 id 1r5LtN-00012E-CX
 for qemu-riscv@nongnu.org; Tue, 21 Nov 2023 03:13:59 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1cc0e78ec92so33357545ad.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Nov 2023 00:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1700554436; x=1701159236; darn=nongnu.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7J/rWk3ugg7//QxbVom1qHAYd+LEHbEyB40leFaq4s=;
 b=evm7PfvYphC4oNWEv93pMmeE2jNTj8w/yDiZOc8YDoQhj8eoNigHlosFQy/nT+AdJM
 c5Zy6JdU7UWcbtEnYU7nckPrHxK61CBhBmTcsZPV9CHOhBrXgwe+eoCv49jDBBjTeMLj
 eJj+Trs8lG9P6D6dalq9SFgeWVnM2g4JTU3ak64iSlS2iDzgHDcTuuqtdR4I3vSWe1Wo
 7fjCxDnhhritZaP0K869kNgLCrgi6I0RCeHfxXWLVAPKfDPnEeeUClJbvzh1AxkGtFX4
 BrQ7vLNg3dcOHVosFaISB4RqNLg0KXiaoTRSjh3zagIZdlkHeDZSLGpiCHh9C/YtA/+H
 UZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700554436; x=1701159236;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7J/rWk3ugg7//QxbVom1qHAYd+LEHbEyB40leFaq4s=;
 b=VkaPp8sRoGUqueXHGeKXfZzgKNZsEiD7Letlkv95DgjNMEWhLzqLom2JikiOkcfS0z
 VGdUsx/oxZm2CjTLtMt3z90Y2e/YUG+AvrNrII1mG1DAXWEUZR7HtUggWn31CF95uuT1
 ZSlzcMkTlh0cEAvrPXd+4D2NHeK8VjLr6ahNqy2dPMdSfa4h4xQiVBHBny6sf0cvYT26
 hKe0CaupHhzrgfOjw6OocZJJmhyf/xdQoCVbKC6LeK6b6DurzaeiFT53M9zKLsACGS72
 nsG7APKGn97dBUpfSqlfnG/QvlDavNAV2qVhbfITgfypN3c2xBynGI65oYj0tDe+ZpyE
 +VMg==
X-Gm-Message-State: AOJu0Yx/FKeYcpxdcMWx+AdvaZ6oRsvv0EjbxwwflNoW0bO4watOg+6k
 z7oDDjV4Kzdd71rTn66Ouhkcuw==
X-Google-Smtp-Source: AGHT+IEZfmNvMJOLrif0s/wfvF5GBLJ+vJd4r0quMxPYyq48Dy1jaIhjLT9m72lODV4ChLgxFIdJ7g==
X-Received: by 2002:a17:902:f54a:b0:1cc:6906:c016 with SMTP id
 h10-20020a170902f54a00b001cc6906c016mr9621935plf.9.1700554435730; 
 Tue, 21 Nov 2023 00:13:55 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:5aed:a527:c932:f992:cf2d?
 ([2402:7500:4ce:5aed:a527:c932:f992:cf2d])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902c20d00b001cc52b58df6sm7306040pll.215.2023.11.21.00.13.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Nov 2023 00:13:55 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v10 08/18] target/riscv: add rva22u64 profile definition
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231103134629.561732-9-dbarboza@ventanamicro.com>
Date: Tue, 21 Nov 2023 16:13:51 +0800
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <1BFE4A5C-4DE0-43B9-A865-5CF61B0BAE35@sifive.com>
References: <20231103134629.561732-1-dbarboza@ventanamicro.com>
 <20231103134629.561732-9-dbarboza@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
X-Mailer: Apple Mail (2.3445.9.7)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=jerry.shih@sifive.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Nov 2023 09:10:47 -0500
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

On Nov 3, 2023, at 21:46, Daniel Henrique Barboza =
<dbarboza@ventanamicro.com> wrote:
>=20
> +/*
> + * RVA22U64 defines some 'named features' or 'synthetic extensions'
> + * that are cache related: Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa
> + * and Zicclsm. We do not implement caching in QEMU so we'll consider
> + * all these named features as always enabled.
> + *

Hi Daniel,

If the cache related extensions are `ignored/assumed enabled`, why don't
we export them in `riscv,isa`?
If we try to check the RVA22 profile in linux kernel running with qemu, =
the
isa string is not match RVA22 profile.

Thanks,
Jerry=

