Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7gRB-0002r6-GU
	for mharc-qemu-riscv@gnu.org; Tue, 10 Sep 2019 09:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43012)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7gR8-0002qU-Gs
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 09:44:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7gR7-0001s1-CQ
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 09:44:02 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33677)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7gR7-0001rk-6R
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 09:44:01 -0400
Received: by mail-wr1-f68.google.com with SMTP id u16so20417381wrr.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2019 06:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=y9npP439xdxmCG7GzT6XJIeofQhv6EpyJUjkj0mjnbA=;
 b=My+TeZYOs6SLm7b/hvdrZM2hbIxBFAygTXg2KHXoOtrp5wmwdV+H4U/srgZ5XgGrj1
 FAYuEHzzXQBOX0nwm20b7guWPoO9WOlhlW1N6AtQcpt6HJ5/XO6xFlIlY14JucImWvFG
 I11e/q+adoEZ48mHGsIPqssbOm+yS3x0wbnj0Q08qdcw8CCz/zC+j23jGiW9fnkLRnpS
 GMa6NB8k23SuSSWteUQl14GHU6SX0ui9Osd//vO2HoyFJuDqUl1vXI9krtFQ4wYGLXMQ
 WsUiBlvpnsAy3d3QPsOzoL1zkxPclq55EI7WZoqO0VXWuRBc+2VPXT2Ym0n5f1Qr1Lit
 fG8g==
X-Gm-Message-State: APjAAAXETXXmCDKU6liIY8ukut/jdQe8fcPBAXcWrJj4xntu7O+FrxRc
 enAtSRHHoD8PuIlIcbRcJKHD4A==
X-Google-Smtp-Source: APXvYqxBKLmqkhroW1nQHv5wadRS0PbQpwCW3MqBAFUPq4+dxBM4h4Eyt6a8dXcoV0yuwHuiag2Q6A==
X-Received: by 2002:adf:e704:: with SMTP id c4mr27654647wrm.283.1568123039721; 
 Tue, 10 Sep 2019 06:43:59 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id o8sm2717120wmc.30.2019.09.10.06.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 06:43:59 -0700 (PDT)
Date: Tue, 10 Sep 2019 06:43:59 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Sep 2019 06:16:54 PDT (-0700)
In-Reply-To: <008eba3fe3b65cc5d37a1ced51d3631b23bef330.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-1d14dd22-e463-4adb-ae6a-2f1623260659@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-riscv] [PATCH v1 01/28] target/riscv: Add the Hypervisor
 extension
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Sep 2019 13:44:03 -0000

On Fri, 23 Aug 2019 16:37:52 PDT (-0700), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 124ed33ee4..7f54fb8c87 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -67,6 +67,7 @@
>  #define RVC RV('C')
>  #define RVS RV('S')
>  #define RVU RV('U')
> +#define RVH RV('H')
>
>  /* S extension denotes that Supervisor mode exists, however it is possible
>     to have a core that support S mode but does not have an MMU and there

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

