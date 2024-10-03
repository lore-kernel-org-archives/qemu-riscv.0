Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D27CF856D
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 08:20:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swH28-0002Ut-O7; Thu, 03 Oct 2024 04:18:00 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1swH1o-0002UA-NC
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2024 04:17:41 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1swH1C-0003mj-3Z
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2024 04:17:33 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5398b589032so973908e87.1
 for <qemu-riscv@nongnu.org>; Thu, 03 Oct 2024 01:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727943324; x=1728548124; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vvBKTO3dP+NrEQD+3clX7ZfukCYX41HRIF/EK8j55EU=;
 b=HisQNtYTlg7TzSMU+d4Ivn0YM7rmNbTKmVGALKMu7AHwD0TVhSQbGcrahKtkUOQYsW
 o9wibi4E4j6Es64dpOLa4yL4oZg5IhWjJ78sDFL+lD+8ADUnY3Kz2xtX9OB9RJTtv/XY
 e9mGL9muQJNk9Y/vIak7X/WFQkVIxAb87nQvJXYpbfdLelMBrdqn7HXecQu5IrEzrEzP
 uJ8JkUo7cy7uQEhwBcag4Z0nbkTUh1AjIH6uMUOSpVVoVqt5d8D3rt0P5W/fPIcd7bDO
 NHP1FcVcIVHD/zFQ/JNaNiBMMYmMhtR9LMUc8J4J3XUfLgrgFm1vjOyUux5FnD/nexLG
 iZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727943324; x=1728548124;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vvBKTO3dP+NrEQD+3clX7ZfukCYX41HRIF/EK8j55EU=;
 b=A8wCpf5JSlqeFAs7/s39PuSIGRQm8T3HpYd75qCHvtRRMKuAKjxjxNR8LZy8ZjaEGN
 EY4+2nrZakTEgqc6nDDEwA6bG9ltcjSAAox8IuRREj98M9KHeMoaEqVuioH73UEV3zAg
 6wZPwBVXNM0ulQsqAhz/xiVIWAAUxG4R4/+tfqveY6WYetkDBs79X/wDAqOmI+HE86PQ
 w6mKgph1DPTvrU2fMxD4ja8dNi8cnL0b8gMMCdIKEKM2jyhDY5hKEMgE8sRs2rr4Ur+g
 bbj3I7BadIN2DcXXqnbJFgZknFRd3K7cr0Rjf9URcl6T7N7pYZsBa+9C2Ya0VLr6amca
 a4ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+hb9JLIAc4sOOWyESobOMPqupbclX4FlxUJt1Htk3waQJiXSgj84AReZUgXoEn3k4xDQ3Piz0J2vB@nongnu.org
X-Gm-Message-State: AOJu0Ywz60OAUkhE3IxvfMyDMC2hmScOLt4YmWPcv1H6Bcy43LzTxw8J
 BnVvbDWpSr/xFlv1sZvW8fT1ekhkipqVU57Jb58lUuLBh1reNyKKjf2736K9HjjMR5oSxKGt9+S
 0
X-Google-Smtp-Source: AGHT+IGbKlZmsIpMAvqQRIQbLdehGpnfEC1XO6nnn8XK2JCZ0OAr90xiHAjwG7CqYMw+iXS00j/XPg==
X-Received: by 2002:a05:600c:3b11:b0:42f:6878:a683 with SMTP id
 5b1f17b1804b1-42f777ef1a0mr59134725e9.22.1727942794771; 
 Thu, 03 Oct 2024 01:06:34 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f7a01f539sm38206725e9.31.2024.10.03.01.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 01:06:33 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7BB6A5F756;
 Thu,  3 Oct 2024 09:06:32 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Phil Dennis-Jordan <phil@philjordan.eu>
Cc: qemu-devel@nongnu.org,  agraf@csgraf.de,  peter.maydell@linaro.org,
 pbonzini@redhat.com,  rad@semihalf.com,  quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org,  stefanha@redhat.com,  mst@redhat.com,
 slp@redhat.com,  richard.henderson@linaro.org,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  gaosong@loongson.cn,
 jiaxun.yang@flygoat.com,  chenhuacai@kernel.org,  kwolf@redhat.com,
 hreitz@redhat.com,  philmd@linaro.org,  shorne@gmail.com,
 palmer@dabbelt.com,  alistair.francis@wdc.com,  bmeng.cn@gmail.com,
 liwei1518@gmail.com,  dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com,  jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com,  berrange@redhat.com,
 akihiko.odaki@daynix.com,  qemu-arm@nongnu.org,  qemu-block@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 00/14] macOS PV Graphics and new vmapple machine type
In-Reply-To: <20240928085727.56883-1-phil@philjordan.eu> (Phil Dennis-Jordan's
 message of "Sat, 28 Sep 2024 10:57:13 +0200")
References: <20240928085727.56883-1-phil@philjordan.eu>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Thu, 03 Oct 2024 09:06:32 +0100
Message-ID: <871q0xmwzb.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Phil Dennis-Jordan <phil@philjordan.eu> writes:

> (Apologies to anyone who has received more than one version of this
> series of emails; my git-send-email was misconfigured and this is
> a new attempt.)
>
> This patch set introduces a new ARM and macOS HVF specific machine type
> called "vmapple", as well as a family of display devices based on the
> ParavirtualizedGraphics.framework in macOS. One of the display adapter
> variants, apple-gfx-vmapple, is required for the new machine type, while
> apple-gfx-pci can be used to enable 3D graphics acceleration with x86-64
> macOS guest OSes.
>
<snip>
>
> There are currently a few limitations to this which aren't intrinsic,
> just imperfect emulation of the VZF, but it's good enough to be just
> about usable for some purposes:
>
>  * macOS 12 guests only. Versions 13+ currently fail during early boot.
>  * macOS 11+ arm64 hosts only, with hvf accel. (Perhaps some differences
>    between Apple M series CPUs and TCG's aarch64 implementation? macOS
>    hosts only because ParavirtualizedGraphics.framework is a black box
>    implementing most of the logic behind the apple-gfx device.)

We don't currently have TCG CPU models for the Apple Silicon processors.
They are not too hard to add (basically setting the correct ID register
bits, c.f. aarch64_neoverse_n1_initfn for an example). However that
would only cover Aarch64 architectural features. We do no modelling of
the extra instructions that Apple added (although in theory that should
only be run in Apples own ML libraries).


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

