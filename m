Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1C3CAC599
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 08:04:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uyQfK-0004VZ-87; Tue, 16 Sep 2025 04:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkrcmar@ventanamicro.com>)
 id 1uyQfI-0004VM-EI
 for qemu-riscv@nongnu.org; Tue, 16 Sep 2025 04:03:52 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkrcmar@ventanamicro.com>)
 id 1uyQfF-0002E7-Vx
 for qemu-riscv@nongnu.org; Tue, 16 Sep 2025 04:03:51 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45de4ebe79eso6664885e9.0
 for <qemu-riscv@nongnu.org>; Tue, 16 Sep 2025 01:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1758009827; x=1758614627; darn=nongnu.org;
 h=in-reply-to:references:to:cc:subject:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwu5KEUH2m6Jpze51fqVpmKcc+wlK9DmKGIIelwd8g8=;
 b=lUEoNytlP+meQTDC0Rr5jLgHH5/pfZAbSK40fNbVBXavYT3lEBBMMGSIgTriDpLn4g
 9GktdfZUDnw4kJnq12TJDEytbjFf4/8WDvzYDTRW29yOX2Aq5evei0PpEdsZBNlXc6Mt
 SaKJ5xQeewxyB5rIbohlIab0d9Shz/RtOQjIyMgO609YL9WLydYlHBCjVVnblgu6kymb
 T+qyKcmiBZA5vwzuU0z0UoaryEpjg0/n72IFLmGFgSLQ30bRiZiQnpR00TTyTQ3qvVJ/
 hsUDZ2UFDHEiXM3WF2K+4Q/aO//uWFLPItWNqW7zDLTW8Bju9DIzd+9r6Nrw0vv91TR7
 796Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758009827; x=1758614627;
 h=in-reply-to:references:to:cc:subject:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cwu5KEUH2m6Jpze51fqVpmKcc+wlK9DmKGIIelwd8g8=;
 b=nabfOKEQgLqMedcozFwC55rUrbRPP8CkBY2ryHvGRgcZ+qDr7PZ/nXm0NrJ5l7rGKy
 6jhBaSObgRaf3ZrJEo68Ii0DgTFWKeZ0enpP0DVIPmpehLcnIapJKpA5ZVmU5jitXQPS
 b4ZHAxrbxiHG/QxCvQOuLRj3BVGpr1n4KyhZws/RGCLaTvcNi3Qelhv0+MfyGMBRpN53
 6vckeCL6WJPuZ6UiA+4VkV9aclwuekzbHW/Pzegf7EZrDwkZ3w/8NHZbpxSANjucQ4c6
 9GaNseVbyXs8fsTzsOoaEOHcOugEwig37WdQBGJZP4HQ1eA9eupurYTDfAGfyhIhUjqB
 SGlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQV+5Jx3Sk9/66lE38v8CxNR+x3eVz5Pdi6eu2PA5Stynt1hN3RM7bryjBlKXqRV01NnKjJYK/jMly@nongnu.org
X-Gm-Message-State: AOJu0YxZn9OAKokFYpHytfcLlE8/V6jKDY6+PeigrOzkH/idU2GtJnRb
 SL4TY+trkoWCuUNAS98hhYdE+lvjzNrlNmD77aiNtazTzZqF7Gj6GPcy3uXbuMYNGdoF/n5D+G5
 J1ipKBu4=
X-Gm-Gg: ASbGncsATi9HJdrBDLjnyMRSg358q/wEDfavC7Dn84v2sAVSwvNt7RWNv0WtsWo0RgZ
 U/A+xn3oqT+EipQD45Aju99FIY9KHCYoG1CsOIGSWTTnXn7DwXPMnO/Y3MLejZj6plqJ5Vk6zXg
 oxO6TguYgnO/qdhuKpVCaIu2UUMa8xxXNKoVtj6HAM+Nl/v5osvejQsPceBHiLG/aCdgXEZFbG3
 VjqXHFGPNksNS+qGd/vI+zs567aanxQXYRfGN81Cu/jsUP0RvSJmWpgqTDiwsvA4+tmUm9UbLhD
 o693KdQ5l4cXmMJjTHHx2TbKRcRO2S+tK1Bowj/isTIX26C9kvK+bFywOvH5t3cDrwJVjeqBe5E
 RvxzTt4n84Bl3KXEg2v9R1yZ7e4Bcoy8lx4bB+KkIoq/JxfEcfue3wY89MQ==
X-Google-Smtp-Source: AGHT+IHA2GPbDrgEsz2MrXTI7M4w39dhPlYTM3e+lLvtoySdqtNemPgIYLOci+L2JPclB0jvvU+B1g==
X-Received: by 2002:a05:600c:4691:b0:459:dfa8:b866 with SMTP id
 5b1f17b1804b1-45f214afb6dmr78761675e9.2.1758009827291; 
 Tue, 16 Sep 2025 01:03:47 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45e0372ae57sm205872385e9.8.2025.09.16.01.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 01:03:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 10:03:46 +0200
Message-Id: <DCU2H0SG4WG0.10TIXQISFI07A@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v9 2/2] Fix VM resume after QEMU+KVM migration
Cc: <ajones@ventanamicro.com>, <qemu-riscv@nongnu.org>,
 <alistair23@gmail.com>, <pbonzini@redhat.com>, <anup@brainfault.org>,
 <alistair.francis@wdc.com>, <palmer@dabbelt.com>, <xiamy@ultrarisc.com>,
 <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
To: "Xie Bo" <xb@ultrarisc.com>, <qemu-devel@nongnu.org>
References: <20250915070811.3422578-1-xb@ultrarisc.com>
 <20250915070811.3422578-3-xb@ultrarisc.com>
In-Reply-To: <20250915070811.3422578-3-xb@ultrarisc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=rkrcmar@ventanamicro.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

2025-09-15T15:08:08+08:00, Xie Bo <xb@ultrarisc.com>:
> Fix two migration issues for virtual machines in KVM mode:
> 1.It saves and restores the vCPU's privilege mode to ensure that the
> vCPU's privilege mode is correct after migration.
> 2.It saves and restores the vCPU's mp_state (runnable or stopped) and
> includes this state in the migration sequence, upgrading the vmstate
> version to ensure that the vCPU's mp_state is correct after migration.

This could be two patches, each doing just one thing:
  * fix mode
  * fix mp_state

And the mode hunk that I pointed out in [v9 1/2] could be put in the
patch that fixes mode.

I jumped quite late into the review, so if others are fine with the
current split,

Reviewed-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com>

