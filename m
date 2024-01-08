Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5027AC47077
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 15:42:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMrlg-0001NU-K8; Mon, 08 Jan 2024 10:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rMrld-0001Cs-U1
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 10:42:22 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rMrlc-0001kR-1R
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 10:42:21 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3374e332124so1856238f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 08 Jan 2024 07:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704728536; x=1705333336; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9+zq0eAJ8bnvzZww3oF3k7l2MJoHjo61IChq0q0yyX0=;
 b=yFLLcc1NAIVbbQFBT0VWhor4LfaWs4Xto4oOpehIjArMo3gviKeRJERgHayoTUZTc7
 kqi43Vmn8/xI/tTJoeCAfoiGX2sEKPAiOV/kzGHaKszXNQRsUBSV39Dv/ilAiUZspaID
 peyOcrohRCa+FnkLSyU4sTu538dN6MjXPSiAZNSyW2WROnO4UooDQyLA9BteZeQNH8Co
 P91fRPJoy6Oj1cP/P1orNqDFnMab+q4cksGo31Mo1nt37OAQAQbwum+ekpmn8XeifYkE
 R0i6qIGFdpAmkdp/ASaLJQh4aXa5g7emIMqCPqXd5DbbXbjhROpk+PKR93Nvg805c0Fq
 RL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704728536; x=1705333336;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9+zq0eAJ8bnvzZww3oF3k7l2MJoHjo61IChq0q0yyX0=;
 b=ZvDBOgS6NLDYmxqaY11du/x/AKlKVIP3xKneL+a5rLiXC4m0yNN6sMwAWwNvRT6Qv+
 jvwT+rrH2WHoSD0tSIpYlBagrN44m7pNK7BPPEF7SvQS08gPXD5W0Zfs9mRUBh5szvhL
 e5G2nhSZ9uUHkJD58NNLAZUhbg/9sfUdIt21Sp5y2hj/SsHLI2ffviPF/HTP7lSXJ2I+
 pCHlJ23K22D2m1h2qL0EOu0xqeQd+oMbaW9nM17sKsCOM6bs5g5KgMtXKidCZuxlg8XS
 st0H9bnXUkSxoPMYkcmZA9F6HThd+m1QyO560Nx6J5GlZQjubLmFfA5EuCf1NtaaPSby
 ud5w==
X-Gm-Message-State: AOJu0YxpRWhMTeCFXKL/rqGDz+GuzZWvDuCY5xKMKEevM3NYAVnBTmQN
 DUX+yr1amA9TXFyd5MwZqnQzx+D4ByQPbw==
X-Google-Smtp-Source: AGHT+IEgtyqgyTqbod9Kf6NoPB3N1lGdn0K/I8y2qeymJ1ePt/2JGWNh/xIFDfV+gZgkYj8VyO6ozw==
X-Received: by 2002:adf:f5d0:0:b0:336:7a58:39da with SMTP id
 k16-20020adff5d0000000b003367a5839damr1660622wrp.106.1704728535992; 
 Mon, 08 Jan 2024 07:42:15 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5d53c3000000b00336751cd4ebsm8137614wrw.72.2024.01.08.07.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 07:42:15 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4FA165F756;
 Mon,  8 Jan 2024 15:42:15 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v2 23/43] target/riscv: Remove misa_mxl validation
In-Reply-To: <20240103173349.398526-24-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 3 Jan 2024 17:33:29 +0000")
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-24-alex.bennee@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Mon, 08 Jan 2024 15:42:15 +0000
Message-ID: <87sf37hlwo.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> It is initialized with a simple assignment and there is little room for
> error. In fact, the validation is even more complex.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Message-Id: <20231213-riscv-v7-2-a760156a337f@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

ping: along with this are the RiscV maintainers happy for me to take:

  [PATCH v2 23/43] target/riscv: Remove misa_mxl validation
  [PATCH v2 24/43] target/riscv: Move misa_mxl_max to class
  [PATCH v2 25/43] target/riscv: Validate misa_mxl_max only once

through my next pull request?

<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

