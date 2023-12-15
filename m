Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DBDC35274
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 15:18:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rE9xL-0002c0-TU; Fri, 15 Dec 2023 10:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rE9wy-0002LW-R1
 for qemu-riscv@nongnu.org; Fri, 15 Dec 2023 10:18:08 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rE9wx-0006fC-5V
 for qemu-riscv@nongnu.org; Fri, 15 Dec 2023 10:18:04 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c19f5f822so4293745e9.1
 for <qemu-riscv@nongnu.org>; Fri, 15 Dec 2023 07:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702653481; x=1703258281; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJMhX72seUmobXUZCtth5wzvy7ZNMZEv4SUoOOPYmWI=;
 b=Bx21tpicRtMskNtwU5+3VaVEEWYMeUmToBPwotp8m8yymuxcaPsPilxdfQ/zZh6lg/
 oQJeoyQ8lSIauhW6iOGyAcXKwrapNHLuJ3y7rC7Yl/jMx002FqiB1jxrSYFUbNY3QzJB
 G7vjSiCxvkIkxDehFexrw6qvpphsJ3FCOb2WvI1LUYqxVSPWQkpokOCe65zF7PcQnJvm
 wRyTfQ78u1jdZhmyKCmhz8uK3kSlL87YBGbsmjBG55AJ+k2+/Nuk8GJ8mtJGFJ9+c5Kq
 TuqgGbVKZ2h2NyDYtmUSvpXlHQQFN2TzJdz0zWiuVN75e7oVf/M5X/L0/Ce15hE4Rqez
 ntEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702653481; x=1703258281;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tJMhX72seUmobXUZCtth5wzvy7ZNMZEv4SUoOOPYmWI=;
 b=tIsDZ2+UW87m4n/HuiTwZBN8/YvgcKSoHqPkwsQSW5tiGTq1sQ3SA6K2qy8wzxe71F
 kboQW5G5TWeRebOv68NrLEa/nhOaxTmXpkWS6bqVRfvnCuiDos44lr5CkVMDel8DxORe
 JWD9aCsMMCrbcISxVvAmE9ey4AMi+W/y3WVcNz1C6OGp6JuYsiZueoNGuGqmDErJiSPk
 2lXAqc3DMEgw4w/Qv1ljTpxywvA7NE8xO+o0Y70j1Vm58DyVIf+27nGzKo6sIkCIs7Am
 cDEnaVF+u5HTX1AMbXf+Ea2ydfVI5mQ92Ej/GoBgkAysFK/Egxu+wtLxWwxpZOXCismm
 IcCg==
X-Gm-Message-State: AOJu0YyFIivcvwk3OwAbYX4bp/DDtO3KVJ1DyYJ6/+Qbr/TOUqSqPwRY
 EJJaXJUaGIamN1mLxXYzvcZc1w==
X-Google-Smtp-Source: AGHT+IEDgXX7B7hyDhy2CHyJ609IiUYB9fl1Fr2Xpwx5YAZtEceIiGWvy0HK3Wi0g/3MpzY1G9+NhA==
X-Received: by 2002:a05:600c:5117:b0:40c:6939:b470 with SMTP id
 o23-20020a05600c511700b0040c6939b470mr829271wms.53.1702653481507; 
 Fri, 15 Dec 2023 07:18:01 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4d0b000000b003365b2047c5sm391485wrt.114.2023.12.15.07.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 07:18:01 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BC2D15F878;
 Fri, 15 Dec 2023 15:18:00 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,  Alistair Francis
 <alistair.francis@wdc.com>,  Bin Meng <bin.meng@windriver.com>,  Weiwei Li
 <liwei1518@gmail.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mikhail Tyutin <m.tyutin@yadro.com>,  Aleksandr Anenkov
 <a.anenkov@yadro.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,  qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v7 0/4] gdbstub and TCG plugin improvements
In-Reply-To: <20231213-riscv-v7-0-a760156a337f@daynix.com> (Akihiko Odaki's
 message of "Wed, 13 Dec 2023 14:19:28 +0900")
References: <20231213-riscv-v7-0-a760156a337f@daynix.com>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Fri, 15 Dec 2023 15:18:00 +0000
Message-ID: <87a5qb8pg7.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> This series extracts fixes and refactorings that can be applied
> independently from "[PATCH v9 00/23] plugins: Allow to read registers".
>
> The patch "target/riscv: Move MISA limits to class" was replaced with
> patch "target/riscv: Move misa_mxl_max to class" since I found instances
> may have different misa_ext_mask.

I'm happy to take this through my tree with the register work if the
remaining patches get some review from the RiscV maintainers.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

