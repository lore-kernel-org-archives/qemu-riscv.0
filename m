Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B8AC47DDB
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 12:14:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rVVwi-0002Zg-DL; Thu, 01 Feb 2024 07:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rVVwf-0002Yt-65
 for qemu-riscv@nongnu.org; Thu, 01 Feb 2024 07:13:29 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rVVwb-0007lP-PZ
 for qemu-riscv@nongnu.org; Thu, 01 Feb 2024 07:13:28 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33b14a64416so297038f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 01 Feb 2024 04:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706789601; x=1707394401; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zn+/ye7RxQyRlRw4WUUebXTDcinacfZIyX6zTAbaIn4=;
 b=mN1GUcHMLJz8f9p4gtnnkCL7a2HPifNBUPrHdwz33jSNWnCpRPa/m7Ec0qGis/S+vi
 /FnFT2NU8BQ1ZJydRWoC9CjKbAppdJY8Ydw8qVXei33nj4P9ZOMQOv+ndSC/IUyt0V0T
 Mg2wazmZZ1RPQwsn6/CmTSW4FFSgXpiAq42BdbHY6yeSBSc1FfwRhPOksF5vC8zuVRAD
 vp2ZggvtvdWqVa/BRnVQQqibOsPiYuJdxjfpY0baC3JWZPdAydm3NPFYlRfmUBgS2Mvo
 ACqxW3IYzMO/bMDje/yUHvHIQGziJ9Ye6PIdfwklE2MbaSdlO2J890zBH/1WUwZTreeB
 Wrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706789601; x=1707394401;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Zn+/ye7RxQyRlRw4WUUebXTDcinacfZIyX6zTAbaIn4=;
 b=aIqu6DPQPpuadxbZbIXmg6yLrQEtiqoUfChIGfQwgLgJR9gT981PNyR05e3zNxGllZ
 PBqNvfZg13Ru5PQT27UUSWmZj5M1kypYadKwhyJ/ueu55gVNxUkdLXCmXvchZx1+cCus
 kkgIIi3LktaWwdk9WO4XTq1FGzUSLPd5xU6kTHaDAwLiYl3z5JqUck3re+eQoOHopw8K
 ciL3k6rT3u/C15rOJ88YBfxkumIhKQMASmlCfHdhBRjrns46GS+Zcipt2fL145xL/7C8
 KbZLuZOLcsnnOxRQOa5gI2b9kzbHdf/ZaJwXSG4U64d7dQ5FdwmDJfJXUm+D05YPdtCt
 gWmg==
X-Gm-Message-State: AOJu0YysaGQgVJBtVx8wIq/j/x8wa0/9fmAVZPwJpKw5u1c1NFHySi/R
 Lh/NiuupxD4E2B0v6B35PztwqYz2MgameT9Wu9QS5LAv2Fy4MmQSK/swSU8Rkiw=
X-Google-Smtp-Source: AGHT+IGB+c/lx7/rnRNnfJu4qEBVda7ddx4u1ulU2BJtZyQ/78w2aLdMTk84i0f+BuwBtVoebq2VoA==
X-Received: by 2002:a5d:4447:0:b0:33b:3b3:f486 with SMTP id
 x7-20020a5d4447000000b0033b03b3f486mr1480105wrr.35.1706789601434; 
 Thu, 01 Feb 2024 04:13:21 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW7NpIoj1nuyTbHJHNrUV1q1+a+ZoQR0ItTb3f/oQYUUZVrgXtgpm3dkNBK5rXiaKfVm8BWuAMykidDaVGuytEQcsOmVz3tGkXSERqR4dwFZKUnUCzV73xTpbE83xBeiETdeImZKHNIH6ea+u4r6lVOZSFjWhHnzVp9uavqI3sa+2ZzA94ITDsauWVt6gD9CopbZ0pS6h8LhBE5Dwaz1HFO7jCKyf0EdxrfYQVVBBXTB8ee/iZHtx2qomM0/TuuO8QrspDq/Ztpwq+MqHo2qezd/bng15nSGVZqYvQYNb3PR4834i+tTqsm9P4SoH4PR10YH7An0ikm/TzFFu6yR0qqV5bmi3WZQfTygoiUa09D1v4g56ixhODzhl3OFwHuZOldnZKzaOQb1NYUBew36RPn5udbwnYJERL4+FHQ39t0eyJeIjq1CjBMeHkCOHWQd8lT+ECKM0BwVOgobJZ+MO5BC5F2R9WAhzYWzVw2aVjP7OypX/LJmZaiDMyl0ONRtF1pOw87XGLmtR1qnmwragJTwVAL9leH5V+n5Hj9DZIajRpdJBR/tuUbXmRLdQVbxG/BikYO6RFDZmQUfLuSVk1Bzein4A9LnBD/jncArDmdsKk94Q0RnTT996Gohnki8u6WvdJauVFrxqB2gYoTqXswVn9p6XJufLoBtCnCRA8vzHJdfUufve46X8awnnSXqr7pHZSQidZcSh0sL/FJMrw3tHKBC0HlP3kNx6GDIV8ZjTXbOgpQmMeEyB9SHxJG1eMMmtY/tRdiGEOa5LOMzkbFsPv9twF4L0Lh6y0P8bJE6LrdA21AWQ++jemdxkcjh21HGKKozF9yNEwCCJfFBdJuJWHaaNpUTR/3r+OelPo8N6aCRzO+nFCvPhFDUUv2YLtNzDrJsouhblvhfhnRNVg/Y7K3plK+Wey+gm7jyw0hfg3kAbOIR/O1MWv7BcpJeKz1iG
 bIYk94twoIFM6+aoGniZxwXfBzBiioRQSkd5j4D5FRUEeyW5f+BYSNn9Vi9A0R+u+gK0gf3uxfmLo4Z2yTaC1KSKjbsaIlxiCI+5DJCOceZnk14NZZKJVofGzfzzlNqczLaZOnw8uxrudRktM9ecWFOZvMZ6C6ZcgmvxCaqkQPYr9HzE9B7lXSZ++cy5whD3U0pdEQGuLpYZ9U17w4b22FnOeL/8OZLjS8br6ktHWkGqKhg6AKd+HxvzIpiZy2W/07Q20R/H2+tCBoNDKoNu4It9y5FrykveU=
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 u18-20020a5d4352000000b003392b1ebf5csm15989811wrr.59.2024.02.01.04.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 04:13:20 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EDD6A5F7AF;
 Thu,  1 Feb 2024 12:13:19 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 kvm@vger.kernel.org,  Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,  Laurent
 Vivier <laurent@vivier.eu>,  Yanan Wang <wangyanan55@huawei.com>,
 qemu-ppc@nongnu.org,  Weiwei Li <liwei1518@gmail.com>,
 qemu-s390x@nongnu.org,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell
 <peter.maydell@linaro.org>,  Alexandre Iooss <erdnaxe@crans.org>,  John
 Snow <jsnow@redhat.com>,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Wainer
 dos Santos Moschetta <wainersm@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,  David Woodhouse
 <dwmw2@infradead.org>,  Cleber Rosa <crosa@redhat.com>,  Beraldo Leal
 <bleal@redhat.com>,  Bin Meng <bin.meng@windriver.com>,  Nicholas Piggin
 <npiggin@gmail.com>,  Aurelien Jarno <aurelien@aurel32.net>,  Daniel
 Henrique Barboza <danielhb413@gmail.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Thomas Huth <thuth@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Song Gao
 <gaosong@loongson.cn>,  Eduardo Habkost <eduardo@habkost.net>,  Brian Cain
 <bcain@quicinc.com>,  Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 00/21] plugin updates (register access) for 9.0
 (pre-PR?)
In-Reply-To: <20240122145610.413836-1-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Mon, 22 Jan 2024 14:55:49 +0000")
References: <20240122145610.413836-1-alex.bennee@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Thu, 01 Feb 2024 12:13:19 +0000
Message-ID: <871q9wmlgg.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Akihiko requested the register support not be merged in its current
> state so it's time for another round of review. I've made a few tweaks
> to simplify the register and CPU tracking code in execlog and removed
> some stale API functions. However from my point of view its ready to
> merge.
>
> v3
> --
>   - split from testing bits (merged)
>   - removed unused api funcs
>   - keep CPUs in a GArray instead of doing by hand
>
> v2
> --
>
>  - Review feedback for register API
>  - readthedocs update
>  - add expectation docs for plugins
>
> The following still need review:
>
>   contrib/plugins: extend execlog to track register changes
>   gdbstub: expose api to find registers

Gentle ping. I'm ready to merge but more review was requested:


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

