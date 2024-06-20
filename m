Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B8BC27C79
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 14:27:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sKIku-00044L-Im; Thu, 20 Jun 2024 10:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sKIks-00043m-Lb
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2024 10:27:14 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sKIkr-0006QT-6H
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2024 10:27:14 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6f51660223so54047366b.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Jun 2024 07:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718893631; x=1719498431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NzV+NODshhWdN6jtRaCeOMQN/3Uh7czcXheRpXyCiec=;
 b=C3d+vr9GEoLXpG1FpMOnar0XQ7wowG4Z5Ic4GGraBIxtaWlgTIC4tl9G8jzoDw/MdE
 sYm7SMWvTwZjFvDif6mO1b/AR7+a6wOJdrIEabBSt5+CtgqxbZXH5Cxuv0JvXefXE8ai
 idgCGnUlQZBYwfSFzjN2Lc8qnWC+PHru/FKuzn7aUEHSKsjNb9EvMgWfv0sViyF696no
 jvZ5Nb7agEIwK3am6EH/8NyZR+0+tJ+Fwz+Sg7DeXvv0aSfholLPMO04g12giUb1JGrf
 s9+UImJBnE0ohqqmv/mfe4emjUpufm4TS9MugtuXs0hmj/5Xgxu6wUUWu6r2fEYQ499b
 02ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718893631; x=1719498431;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NzV+NODshhWdN6jtRaCeOMQN/3Uh7czcXheRpXyCiec=;
 b=ueXMj2eSyh0jyhsJGA5G+jCS3oLi1rs/BDT3KM+Q/RyZ9j9JkOMdZMqJSDUXbt6u0H
 PzhGyv15waJE+nbZEpogeTwB1dT1MDVnB80RoQ+fr0z2rAFGSO6EiwSmM9qmHiDR6hXJ
 N0HJE8BTE7c/C4DatH7EnG6FKkNSshd0vov5hdGVTZz+O53hIe2E5JlnbuyZBWN6XQIF
 Ms70n57RL8NhHCLIrNcxRC6NKZYFNlsnB067FR9UyQGW2B+AbnH3/jiF3UKM1pPPzyLE
 1cXMaIibeV/3xnKAn+lVrrVZfboDKJAURST7VzLxdtH8mLKm0uz+BwFM8gCZPOc6PuOO
 ioPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURc3ZEdyqXzB/FoI679sYypZoSJgPfnM8Z1cG2V7wQWSLgI2SDBWpQTz7tRpx6J9GBRKxBB1SPxMWQQ1ER91tNIrHpSB4=
X-Gm-Message-State: AOJu0YwnVP6iUWLlcB2z/T39EWCWsaMzVsIp+QsuzvsqFyo1v+DwNC6G
 CN2AAdM+oFj9KM55gLYWfsnpIZoKrQLVoKDlQmy7T4ZGHRCNJQuKLi0b2eT6Bvc=
X-Google-Smtp-Source: AGHT+IE14izGvzmUBDvm13Y0/q/244/lrcQAxWdwl/eZBaf/+lykBBXmf9UkqXt0BcIN1tvVDiz4ww==
X-Received: by 2002:a50:d60b:0:b0:57a:79c2:e9d6 with SMTP id
 4fb4d7f45d1cf-57d07ea9ccbmr4001934a12.33.1718893631519; 
 Thu, 20 Jun 2024 07:27:11 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72cdfc4sm9650405a12.19.2024.06.20.07.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 07:27:10 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CC7285F7B1;
 Thu, 20 Jun 2024 15:27:09 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,  Alistair Francis
 <alistair.francis@wdc.com>,  Bin Meng <bmeng.cn@gmail.com>,  Weiwei Li
 <liwei1518@gmail.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [RFC PATCH v4 1/5] accel/tcg: Avoid unnecessary call overhead
 from qemu_plugin_vcpu_mem_cb
In-Reply-To: <20240613175122.1299212-2-max.chou@sifive.com> (Max Chou's
 message of "Fri, 14 Jun 2024 01:51:18 +0800")
References: <20240613175122.1299212-1-max.chou@sifive.com>
 <20240613175122.1299212-2-max.chou@sifive.com>
Date: Thu, 20 Jun 2024 15:27:09 +0100
Message-ID: <87tthnbsg2.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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

Max Chou <max.chou@sifive.com> writes:

> If there are not any QEMU plugin memory callback functions, checking
> before calling the qemu_plugin_vcpu_mem_cb function can reduce the
> function call overhead.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Queued this patch to maintainer/june-2024-omnibus, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

