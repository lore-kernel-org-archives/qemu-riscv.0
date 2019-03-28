Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9Ljv-0006nZ-Bg
	for mharc-qemu-riscv@gnu.org; Wed, 27 Mar 2019 23:30:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h9Ljs-0006PN-B9
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 23:30:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h9LdY-0006PV-Pr
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 23:23:29 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:40001)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h9LdY-0006PG-IO
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 23:23:28 -0400
Received: by mail-pf1-x441.google.com with SMTP id c207so10681745pfc.7
	for <qemu-riscv@nongnu.org>; Wed, 27 Mar 2019 20:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=3eOuwoXRBo7qUa3tzHEKwmWdIQhOB10YOGQZIWBbggQ=;
	b=P7SCPeOqgKpjefN2pfk6v1yX3sElWaweKoT9mCzgTFFlGHAT1tDPNVsMYLnA/x7hAJ
	OFZIkHjgJlQfwY6pWk0OAWTwnXkVcogNiCg3mLg8OWlK1CLcPceEtW59wqFnWSC9+aoQ
	yCdw56WZeYWbDwv25BA5drUYqkb4jyZkXeCH1ewx8kGRGtdyMKvGaLWMgsmbI24nMDw1
	jZLMZXYJVZNpb8gkuZ7hGCkmSVThJZKNyGaZuImpn4xOrnd+A4ywi/ubE6vptgRp1BQP
	NIvt4PCBMpSgGo4r26XKpSe07Vj3ejcEg2md4H2IxE8563nLZ6hsJoN+vzMFh2ZKiHnY
	qG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=3eOuwoXRBo7qUa3tzHEKwmWdIQhOB10YOGQZIWBbggQ=;
	b=aNwDtP5frXiqODEc+aRrlP4YWhP6cThWSNC4KFv2IHvNiGFkSCDmRmpG7g+tcnl/GE
	KaWEAXAuLsxc08DdaJjgij+xf864VlajRDRwe205aytHEQifk/C1RllyQAeEjPpJsVYp
	nJ2ie7uXS5kPEP+oBCeWohe7PTiBtyGP5QOFierkFoYd20fE0JVPMoF5jkeYKK01eExb
	GM4ixoWVcHOgYhqwJdawZlaIVgznXqtSf+jW3yFD5dUhyKdojSFRzFAMNoNsMvmi4M7e
	PVhlIiLgvvH58JyIpUlwxg23G0/2xDXYFhFqXl1q7FclXbrW4Bkaae0jcTVkuVmqyz3E
	fxjg==
X-Gm-Message-State: APjAAAXYT4VVpqsoKHP1EEbBZXyWnfm39T7gOBf7B5FAEWHa4df4SLT0
	kUdg1KKdZ/n37v7gza1aLk8CSg==
X-Google-Smtp-Source: APXvYqwnyeXNdwTSjf6qOlyby+4gWraqUbeW/+9EjqTjDf8jJcAIUrkXscbIbAyqFVsQsPBaFR68Pg==
X-Received: by 2002:a65:51c5:: with SMTP id i5mr10756472pgq.189.1553743407606; 
	Wed, 27 Mar 2019 20:23:27 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-168c-9355-f21f-1416-8b19.dynamic-ip6.hinet.net.
	[2001:b011:7001:168c:9355:f21f:1416:8b19])
	by smtp.gmail.com with ESMTPSA id
	h19sm41835135pfd.130.2019.03.27.20.23.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 20:23:26 -0700 (PDT)
Date: Wed, 27 Mar 2019 20:23:26 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Mar 2019 20:22:48 PDT (-0700)
In-Reply-To: <cover.1553712571.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-9286e210-d632-41e0-b30d-cfdef1a43396@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [PATCH for 4.0 v2 0/2] Update the QEMU PLIC
 addresses
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Mar 2019 03:30:01 -0000

On Wed, 27 Mar 2019 11:51:15 PDT (-0700), Alistair Francis wrote:
> This series updates the PLIC address to match the documentation.
>
> This fixes: https://github.com/riscv/opensbi/issues/97
>
> V2:
>  - Squash patches to ensure biesctability
>
> Alistair Francis (2):
>   riscv: plic: Fix incorrect irq calculation
>   riscv: plic: Log guest errors
>
>  hw/riscv/sifive_plic.c      | 16 +++++++++++-----
>  hw/riscv/sifive_u.c         |  2 +-
>  include/hw/riscv/sifive_e.h |  2 +-
>  include/hw/riscv/sifive_u.h |  4 ++--
>  include/hw/riscv/virt.h     |  2 +-
>  5 files changed, 16 insertions(+), 10 deletions(-)
>
> -- 
> 2.21.0

Thanks, I've got these on for-master.  I'll let them sit for a bit to see if 
there are any other comments, but

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

