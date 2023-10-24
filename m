Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32EBC00A8F
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:38:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvJUN-0007l7-Ej; Tue, 24 Oct 2023 11:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qvJUM-0007ho-2w
 for qemu-riscv@nongnu.org; Tue, 24 Oct 2023 11:38:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qvJUE-00071v-2W
 for qemu-riscv@nongnu.org; Tue, 24 Oct 2023 11:38:36 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso36874785e9.1
 for <qemu-riscv@nongnu.org>; Tue, 24 Oct 2023 08:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698161906; x=1698766706; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1aOIsLs5187z8drMHrajQ83KAXkk0KYBz3wkldFj2fA=;
 b=u1klkHeh4EcIHW8WhZNzNgCwSNcKvaz5kxucg5cIuLMQA4Nvjz7H7yd/43yC14eqH+
 q8/q8yIfgHfkbBNdmvkpF6LqJRHWv7NimQiusgCOkIhv5MTbqn2IAIcpWV6AECcN4w6B
 FjPMvpxfm2LzhManGmn3e12p1t5OIsea6TeeCv/ZQ4/dHRWd2BS4Ql2VGawzc8alfjkM
 rIEkuoKACmSk2d57uR1Z1cgxOOTp/bL/4cMu5AbFvOLBPs33r7ZwNBj+5RP/C2MLHJ79
 emYpp9vnB9IfDkuEohH/+dte97gyA5kGRsnayKqob99LBQWbU7G4WFYI527r4Q9lcCPt
 m7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698161906; x=1698766706;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1aOIsLs5187z8drMHrajQ83KAXkk0KYBz3wkldFj2fA=;
 b=FM6DULRoxY4Ylu36Q04ghJYj4inpIk5DpSaUMcjwqV7UjONKCCMVzWD/4iTPB/x9CP
 F1izq0ssd7FDeJXy+jO3uivgzP1+r8VLsDVYpNHneLVLExzPw7lrsnTOxWwxuS13zAxC
 dFLsgWTu1AVV7bXTAX/JIjTkzyn9wut4EURMrunaRk8cJxihgkACbPPqACrQU8Rqm0zV
 tyY0I3v1nwPijagIcDu9UZRSkRH6MaLF9tukFbOVfqcyVqnphVjYxsBdg0scSMGst0sb
 u7PDePu6RADYOmQuVS4XlqQbWRCOkXGbf38qyzN9Ih5kxzJ8klj9mny0+3GbMQIsZbXQ
 T26w==
X-Gm-Message-State: AOJu0YwlddnAGYHSHvuuwxRccyznfsYSpoUlMEMGnvGBxIk+Cs4Hj/+b
 o899+iZqikiCsHqVhybGtKbGfA==
X-Google-Smtp-Source: AGHT+IHVbldkAv/dEHpzKqu73rxtoNq04l8eEb9LqyCZKrMnTw7Ddtq72VAlNsVzvnD/7/n9fEiAvA==
X-Received: by 2002:a5d:4407:0:b0:31f:db1b:7296 with SMTP id
 z7-20020a5d4407000000b0031fdb1b7296mr8271523wrq.21.1698161906515; 
 Tue, 24 Oct 2023 08:38:26 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a056000010700b003232d122dbfsm10095309wrx.66.2023.10.24.08.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 08:38:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A56611FFBB;
 Tue, 24 Oct 2023 16:38:25 +0100 (BST)
References: <20231019102657.129512-1-akihiko.odaki@daynix.com>
 <20231019102657.129512-13-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.22; emacs 29.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-?=
 =?utf-8?Q?Daud=C3=A9?=
 <philmd@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Yanan Wang
 <wangyanan55@huawei.com>, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin
 Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v14 12/18] hw/core/cpu: Remove gdb_get_dynamic_xml member
Date: Tue, 24 Oct 2023 16:38:21 +0100
In-reply-to: <20231019102657.129512-13-akihiko.odaki@daynix.com>
Message-ID: <8734y02fpq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> This function is no longer used.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

