Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2A3C3DA5D
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 10:27:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sWvgk-00072o-JP; Thu, 25 Jul 2024 06:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sWvgj-0006rv-0A
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2024 06:27:09 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sWvgh-0002RY-B9
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2024 06:27:08 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ef23d04541so8669321fa.2
 for <qemu-riscv@nongnu.org>; Thu, 25 Jul 2024 03:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721903225; x=1722508025; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LaHUG83R4EKvp3VRXiyFJovg6FyQ1Kdt1xLhxwucOu8=;
 b=TfCcJbee32lEOdRj6lGpPZySSrxLJlYWeTT+2bpQ8I/t97kQ/rUoGcZ1Zx8DpAT1qp
 vORzHvMSW2bhXdgHWPYf7g/Io5+FLxEq3ARQxflz4XRQjb/nnosQva3Y/IEBhOH4JASX
 IpgNckb8CKMYfUPa5d15ylMrBWO3nzfcj5gQzFzHbvewnQMh/4ubxmyvCWdqpqbesKl3
 g5ntLtefxPrUFhlQR2Fw24SJb8Q1jjAxRHPEhLnlUAiopm3rG2d3YQJYmEzNRHFs3yrn
 12uymNdOdM1LyeXjMtHOE/uWi+0SCH7x9v2c6kHjW5o1FqE7upFHpU73V7MtXHwASJlK
 hXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721903225; x=1722508025;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LaHUG83R4EKvp3VRXiyFJovg6FyQ1Kdt1xLhxwucOu8=;
 b=PT04AlV1egSC7LEZEX9pcZy+0ZSxpUtJraRS9K3NlbzYttgThq6vATPVQCgNKLLuZ/
 yVEgzr0rN/PcJl692fCN3g2/CXWN+OZl/1ueMk/PGJztWiIKnfDC3BQWGlYoLNBP56v3
 jq2pWqlBewvWfZOjeirG364tX6CyyqgUY6K53f/tK7oBZrLwACXKO6DBVeHniXNeaWaq
 +5TpBU2Pm6BdiprVSRoi+ud5NTedcPjfUx0EqS655DqfcZ4VSkmPVG0TjymvH5bs5yH7
 /uAeUd31b8RiNEnznMCAtUVI+Yq1ggX6nL1yKbMxiXR2MINt5/0RASq1sW7sJdH+2WBW
 m4JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIQvYMeLg3cDDiEVjkd3bpEskbAvEr3BYBmOvPqmMMoogisWcebsqXCDxCY5CW6/7zbxQo8f1fjpqlxT3wkIqBA93wv/8=
X-Gm-Message-State: AOJu0YwgRiu7j6nc6A8vg6fhRQC5k6teZkaSM8Lk/Nnh5dINDA1q1vFa
 kpsgAOVMnxuPGqWQa6xuuRhdL22aOzHAdmu3J5MNGkIWF34O+Q5xQKPWlaRzkto=
X-Google-Smtp-Source: AGHT+IGUaJhhTqi+2Vz+GTYpzV0HB1iNrb+mZiDqWEekNvmRpAuF4hjoXGZS4OEFd9ZTBQ8SELY+dQ==
X-Received: by 2002:a2e:730e:0:b0:2ef:1b93:d2b5 with SMTP id
 38308e7fff4ca-2f039d2d7a7mr16712181fa.35.1721903224680; 
 Thu, 25 Jul 2024 03:27:04 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac65483859sm648445a12.82.2024.07.25.03.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 03:27:03 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 45BDC5F863;
 Thu, 25 Jul 2024 11:27:02 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  palmer@dabbelt.com,
 alistair.francis@wdc.com,  dbarboza@ventanamicro.com,
 liwei1518@gmail.com,  bmeng.cn@gmail.com,  philmd@linaro.org
Subject: Re: [PATCH v6 8/8] tests/avocado: Boot Linux for RV32 cpu on RV64 QEMU
In-Reply-To: <20240719231149.1364-9-zhiwei_liu@linux.alibaba.com> (LIU
 Zhiwei's message of "Sat, 20 Jul 2024 07:11:49 +0800")
References: <20240719231149.1364-1-zhiwei_liu@linux.alibaba.com>
 <20240719231149.1364-9-zhiwei_liu@linux.alibaba.com>
Date: Thu, 25 Jul 2024 11:27:02 +0100
Message-ID: <875xstojgp.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x236.google.com
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

LIU Zhiwei <zhiwei_liu@linux.alibaba.com> writes:

> make check-avocado AVOCADO_TESTS=3Dtests/avocado/tuxrun_baselines.py: \
> TuxRunBaselineTest:test_riscv64_rv32
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Suggested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

