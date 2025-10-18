Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F45CCD193
	for <qemu-riscv@archiver.kernel.org>; Sat, 18 Oct 2025 05:53:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v9zrn-0006x0-3i; Sat, 18 Oct 2025 01:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1v9zrj-0006vt-KN
 for qemu-riscv@nongnu.org; Sat, 18 Oct 2025 01:52:31 -0400
Received: from mail-ej1-f48.google.com ([209.85.218.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1v9zrg-0008GL-Fb
 for qemu-riscv@nongnu.org; Sat, 18 Oct 2025 01:52:31 -0400
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so431989566b.0
 for <qemu-riscv@nongnu.org>; Fri, 17 Oct 2025 22:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760766746; x=1761371546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kC5/uJPP3WnDo5AHh0vgk9XGDlztc0ecSESwKOHyIvY=;
 b=Ab2JiMwFwnVx/LRqJJNZJc90JslVTfNMEIJu91QUFgvLUZFjeT8OKw0i9gx+swIHSJ
 VFL6GuiBZ3qFuPp/ubrqXRpQt+ZYypUtexmWVr4r3UdlyIXMk8mbLLq844lDYS9vP5+w
 CU8noo2ZDR9wkgwlFY4yxS/qPnwaLr3UcR9Wws0BFYGv2+1NjIcPNtgBIC5S0BZ6xJaB
 xlzBfHZ6rYfLBwfbVx05IOMp/V5GiaeSKtfEJ7bH96UN3U71ivOGSrhHYI/hOapUEs+r
 XvKcwKhWfbiFMC/aIAhd0H8OyxKEaj8Ot3qOBXAtzrhz738weaVAyw6v94Uu/C0Kisjo
 DW8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnHhTpIJNws9LPnXXpwTd/wUv6Zye3IJmdNf9XJYsoM6GkwVkbP1ibRAzAR9qP6fWQ/UL3iRgP1m5H@nongnu.org
X-Gm-Message-State: AOJu0YyOKc/MLdHRUUptzCoQ/5AZq37Vu0FH2AK1GCLY8HQ6dcGSNsoQ
 YswXkz0jjW5sRlV0GDzv7RbFAYvzZf3p87P85I5GnOiroDs27PXklQR0
X-Gm-Gg: ASbGncuP1VzE0R9Tz/WFUsIvTOAx+RmWx6unX8yWPXeBE5GLoW91YV2Et4zkXGNEDAI
 OVwZuR1xVZm3hwsBNCWh5v7VyppnpvIaF9+iNHL2PFwzWV4Z4PyBJHnjpI5nIG69fXbTXorWSZo
 vkwITlgpinvQ+bbdPSYmYDhDTgo/lIWxQ0208rCOCQfTW4YZwUO1yOxlaNmp/tt24wcraenqlRm
 z1LS9rFHtXDu/krJSbQyO7Z5QHcoILeahHwejfDPXjhbds3pKHRpZFgnz7iGeVmmsuKL5XE1VFB
 apJcrfx7H1KU02VEAnAsudifTDu23SEh/b+PogbDYN8EpnEMXpLvpC+UGQimOfzPEpH/VxdhkBd
 Us9xdE5DUb1wokVdLU+LM7/IsLeIAsxyGaqsnRcuqhhtXnrXzyms9/yvHp5SNy0oMEVvTpt+YZ7
 98VS5EqRMIM9Bown1R0TkeDknBObOvpopA
X-Google-Smtp-Source: AGHT+IEwM7hkjdYadSIZ/B1LrJ6NLoLeCs3l9kSDnXN0Bzcy3G/cTbunueoKKeMggcWXJ5k6oQ6wtw==
X-Received: by 2002:a17:907:c06:b0:b46:8bad:6977 with SMTP id
 a640c23a62f3a-b647235ff0emr769025566b.18.1760766745781; 
 Fri, 17 Oct 2025 22:52:25 -0700 (PDT)
Received: from tpx1 (ltea-047-064-114-135.pools.arcor-ip.net. [47.64.114.135])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb52603fsm167889266b.57.2025.10.17.22.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 22:52:25 -0700 (PDT)
Date: Sat, 18 Oct 2025 07:52:23 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, Peter Xu <peterx@redhat.com>, Laurent Vivier
 <laurent@vivier.eu>
Subject: Re: [PATCH 06/22] hw/m86k: Get cpu first addr space with
 cpu_get_address_space()
Message-ID: <20251018075223.4f8c47bd@tpx1>
In-Reply-To: <20251001150529.14122-7-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
 <20251001150529.14122-7-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.218.48; envelope-from=th.huth@gmail.com;
 helo=mail-ej1-f48.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

Am Wed,  1 Oct 2025 17:05:11 +0200
schrieb Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>:

> In order to remove the convenient CPUState::as field, access
> the vcpu first address space using the cpu_get_address_space()
> helper.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/m68k/mcf5208.c |  6 ++++--
>  hw/m68k/q800.c    | 17 ++++++++++-------
>  hw/m68k/virt.c    |  5 +++--
>  3 files changed, 17 insertions(+), 11 deletions(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

