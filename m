Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7MPV-0004bX-Eg
	for mharc-qemu-riscv@gnu.org; Mon, 09 Sep 2019 12:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36066)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7MPT-0004b6-94
 for qemu-riscv@nongnu.org; Mon, 09 Sep 2019 12:21:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7MPR-0008VS-W6
 for qemu-riscv@nongnu.org; Mon, 09 Sep 2019 12:20:58 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52740)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7MPR-0008V0-R3
 for qemu-riscv@nongnu.org; Mon, 09 Sep 2019 12:20:57 -0400
Received: by mail-wm1-f67.google.com with SMTP id t17so262646wmi.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Sep 2019 09:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=k8mmStJgxO3xH5XM/EhqR2y7Ns9lt8r0g1sa9/rZBUg=;
 b=LEdOotE6lKJYFcoztIU/q3MAHePCBF0CHjzZ+qos3xfMVZrhQwU4zySE/WFVn4x5z8
 h9iGxUcOpY00iDN4HpxhDIRvxA+KqyvjElVMPA4afJdehQp1VTcvlUsEw7IuM1CL9d3H
 FYTABVJGo0Ay2CkAYQzJ9JybsF8aMi5YxrnVmpmFq+kB2Rjd0zoOdYg/Dk3xM/o4n2+I
 7dEMNK4h2vrs/cJSSxRAUlK46Y0BPBiFQJ5AHEzJpKRtx/dd9M7QTWtD4Zh7Pe0ebpCr
 I3/ECCZ6n9OvOZCQxVyOEDv1ixoEWwkbw0Qcq96+Ti9ztFS3BlQjLx5nScLhvzP6+DVL
 LyJw==
X-Gm-Message-State: APjAAAVKCL9F1N25BfJ7tNfWkaf0LpvzY1bxnfZIxqR4RWHYTWWB9iSp
 2i6apMdzIFBalEpBaUzRuhro4g==
X-Google-Smtp-Source: APXvYqyifi14asoSzTSN6pXgMYqAaLVV5RvcSrD66Avro2MCWiq//8PwEdLO0+SKIJlrx5bUyneMgg==
X-Received: by 2002:a1c:a8d8:: with SMTP id r207mr48378wme.135.1568046055942; 
 Mon, 09 Sep 2019 09:20:55 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id z1sm24856457wre.40.2019.09.09.09.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2019 09:20:55 -0700 (PDT)
Date: Mon, 09 Sep 2019 09:20:55 -0700 (PDT)
X-Google-Original-Date: Mon, 09 Sep 2019 09:04:19 PDT (-0700)
In-Reply-To: <1567786819-22142-2-git-send-email-bmeng.cn@gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-8a13e03d-e64a-46e3-bdb8-e2649b13cfb2@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-riscv] [PATCH v8 01/32] riscv: hw: Remove duplicated
 "hw/hw.h" inclusion
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
X-List-Received-Date: Mon, 09 Sep 2019 16:21:00 -0000

On Fri, 06 Sep 2019 09:19:48 PDT (-0700), bmeng.cn@gmail.com wrote:
> Commit a27bd6c779ba ("Include hw/qdev-properties.h less") wrongly
> added "hw/hw.h" to sifive_prci.c and sifive_test.c.
>
> Another inclusion of "hw/hw.h" was later added via
> commit 650d103d3ea9 ("Include hw/hw.h exactly where needed"), that
> resulted in duplicated inclusion of "hw/hw.h".
>
> Fixes: a27bd6c779ba ("Include hw/qdev-properties.h less")
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> ---
>
> Changes in v8:
> - newly included in v8 to ease patch inter dependencies
>
>  hw/riscv/sifive_prci.c | 1 -
>  hw/riscv/sifive_test.c | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c
> index 9837b61..562bc3d 100644
> --- a/hw/riscv/sifive_prci.c
> +++ b/hw/riscv/sifive_prci.c
> @@ -19,7 +19,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "hw/hw.h"
>  #include "hw/sysbus.h"
>  #include "qemu/module.h"
>  #include "target/riscv/cpu.h"
> diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
> index afbb3aa..3a14f9f 100644
> --- a/hw/riscv/sifive_test.c
> +++ b/hw/riscv/sifive_test.c
> @@ -19,7 +19,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "hw/hw.h"
>  #include "hw/sysbus.h"
>  #include "qemu/module.h"
>  #include "target/riscv/cpu.h"

Revieweb-by: Palmer Dabbelt <palmer@sifive.com>

