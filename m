Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A762C48BF6
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 11:13:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1reYuX-0007Ih-Nr; Mon, 26 Feb 2024 06:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reYuF-0007DE-Ia
 for qemu-riscv@nongnu.org; Mon, 26 Feb 2024 06:12:24 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reYuC-00084W-Ie
 for qemu-riscv@nongnu.org; Mon, 26 Feb 2024 06:12:23 -0500
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d28e3c0fe0so6614721fa.2
 for <qemu-riscv@nongnu.org>; Mon, 26 Feb 2024 03:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708945938; x=1709550738; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wDeVF4/UfnlJ3NsN5RfwhK/kIlH3bfHrXai+CNxTm1M=;
 b=o4gOXFLpzsq6UyR5c8aznCze4zWYpVugDSH42rB/jqveS25x8i6ms7Qj8mnOkMoHnQ
 h/ikV7Ia5PrQT/7RqqVA7ICDuO4F2+QIoqfnkS3uf69SjHek3t9OsewGp538o3chkObj
 S9madrAWUSrLrKgA0maf7H/nNnOD/vmZN8CEjqi2Rp0Szp17+714OAVc6yh8U+B3KLIf
 0TXG1Jq8AhPmAa6QDMAuXpaehBYHxukvJAuCPJOLVjjEpJm+Uuh9wcosHRzsZcqin2NG
 j3yYJMavCkhD+7zzhm9a3QotFV+/DJIy7pR9Xw/Es0AJ5AE7rMBpxu2BsoIjRisjHR8o
 sc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708945938; x=1709550738;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wDeVF4/UfnlJ3NsN5RfwhK/kIlH3bfHrXai+CNxTm1M=;
 b=tj4uIVcHNTiwRZ0SGceRF54Z4EfX1XLnC8yE5dRctpnomu0dnn7J3TAVw7Um/MlWOu
 C+TLa8m3q7wHiELAR/yIKw5mAcqHT/NfF7sq8hR6iIq/K86S1N07+fZOX7g4KJBIvn5k
 YGOtDe6OYFYaVWTnK8KIGR+cKAXmGJOObG4ELpns5qENwYwe2xGJkKty6yjQzumBlsXh
 74u2l9CTn2HlkXFYgClCz9b1cJOdVx9dpObToLk7S+NssbbQ+7qv8HtgeP4ABPiGF8Wx
 s/Erj00kjx5LTgA50OWKe9sTYo562srz5aASEuW1jXeolySh7PjvfvmjWh8IxUbHoFo8
 ZgEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTP5nJmkSDjwcf33orgmEy178u2zcDWw6ChYBuhTXqoND9vNX0sDp5Vi/z6aU9hkPN8chbsuEhHgUoV3Tu9CB2T0+0hB0=
X-Gm-Message-State: AOJu0Yze+MjWEmRxtmf3AeNqgrlvgIfS7KFMjK0eh/6pBazm8tx8CpSR
 AhUat/QmNcn/puqVH7yl8PXzBc2/UaSbLJKTgVLDag7+d52RmIqpZ1WmNYck9nI=
X-Google-Smtp-Source: AGHT+IG3jDDSh0z6NbwyaUafoSUIxwRRCLob6nvkp0JpP1A/eofb3XJnf/N+0mfBoWuchPZjxy+nwA==
X-Received: by 2002:a2e:2285:0:b0:2d2:3256:6582 with SMTP id
 i127-20020a2e2285000000b002d232566582mr3458154lji.45.1708945938152; 
 Mon, 26 Feb 2024 03:12:18 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 e3-20020a5d4e83000000b0033d12895cfdsm7965045wru.61.2024.02.26.03.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 03:12:17 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 221805F7A7;
 Mon, 26 Feb 2024 11:12:17 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  Song Gao <gaosong@loongson.cn>,
 qemu-s390x@nongnu.org,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Thomas Huth
 <thuth@redhat.com>,  Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,  Yanan Wang <wangyanan55@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>,  qemu-ppc@nongnu.org,  David
 Hildenbrand <david@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  Cleber Rosa <crosa@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,  Philippe =?utf-8?Q?Ma?=
 =?utf-8?Q?thieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Alexandre Iooss <erdnaxe@crans.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  qemu-arm@nongnu.org,  qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  John Snow <jsnow@redhat.com>,  Weiwei Li
 <liwei1518@gmail.com>,  Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,  Brian Cain
 <bcain@quicinc.com>,  Paolo Bonzini <pbonzini@redhat.com>,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Michael Rolnik <mrolnik@gmail.com>
Subject: Re: [PATCH v2 21/27] plugins: add an API to read registers
In-Reply-To: <2a7f0e06-0bc9-4fad-add7-9675a4cc2a0a@daynix.com> (Akihiko
 Odaki's message of "Sat, 24 Feb 2024 17:34:03 +0900")
References: <20240223162202.1936541-1-alex.bennee@linaro.org>
 <20240223162202.1936541-22-alex.bennee@linaro.org>
 <2a7f0e06-0bc9-4fad-add7-9675a4cc2a0a@daynix.com>
User-Agent: mu4e 1.12.0; emacs 29.1
Date: Mon, 26 Feb 2024 11:12:17 +0000
Message-ID: <87y1b7eay6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22e.google.com
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

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2024/02/24 1:21, Alex Benn=C3=A9e wrote:
>> We can only request a list of registers once the vCPU has been
>> initialised so the user needs to use either call the get function on
>> vCPU initialisation or during the translation phase.
>> We don't expose the reg number to the plugin instead hiding it
>> behind
>> an opaque handle. As the register set is potentially different for
>> each vCPU we store a separate set of handles for each vCPU. This will
>> become more important if we are able to emulate more heterogeneous
>> systems.
>> Having an internal state within the plugins also allows us to expand
>> the interface in future (for example providing callbacks on register
>> change if the translator can track changes).
<snip>
>> +
>> +/*
>> + * Register handles
>> + *
>> + * The plugin infrastructure keeps hold of these internal data
>> + * structures which are presented to plugins as opaque handles. They
>> + * are local to each vCPU as there can be slight variations for each
>> + * vCPU depending on enabled features. We track this in
>> + * CPUPluginState.
>> + */
>
> Since we do no longer coalesce registers for different classes, I need
> to bring my old question back: Why don't you just cast register
> numbers into pointers and use it as handles?

In the interest of getting this merged before the fast approaching
soft-freeze I shall do this for now. However once the plugin system has
knowledge of individual registers exposed by TCG it will need to track
internal state so will need some sort of container for that.

> You can even just expose gdb_reg_num with the interface.

As I have explained before I don't want plugins to treat the handle as
a pure index in case they start providing numbers that aren't in the
list provided by qemu_plugin_get_registers.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

