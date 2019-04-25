Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hJjcp-0000CE-Po
	for mharc-qemu-riscv@gnu.org; Thu, 25 Apr 2019 15:01:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hJjcj-000065-UR
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 15:01:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hJjYc-0006iB-S1
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 14:57:19 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46593)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hJjYc-0006eC-Ie
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 14:57:18 -0400
Received: by mail-pf1-x441.google.com with SMTP id j11so345854pff.13
	for <qemu-riscv@nongnu.org>; Thu, 25 Apr 2019 11:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=ZqUiWIRkd4FGmMptUc+o/kwZ71iZ9LxeQlW+P3BZ/6I=;
	b=Jxzmo/pIrqKp4pRWy47Qp/Ih9IvLTQE/lS9KFLF8CYMGdIuV3ODvRcEw9ij3xAU4tm
	EHhd0eSKR36lt60mEp/o+2kiKigLgRTqBoQSaMgLM8yDf9bep98BOF4epxa4fdh4SV3u
	i4rcdrzwmGLQAjW0cuNWLQ/APKBdcU0IJY9yXRSQoLjZbNQ08/yXyjHxqoEthWhb7vRl
	Q9LEFHOZR1bpKJwosoE4y4FbLvFJwb80Od4/5AhlZj97PNhJzHqOuXi1LnNyY3JDRmJ9
	jd2+ir4qjcGd6bgGSJlJlX0PSDnDW6TQU+NGrUFO8sLJAqEMez+YLgkCsg8T1ARdJozX
	WkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=ZqUiWIRkd4FGmMptUc+o/kwZ71iZ9LxeQlW+P3BZ/6I=;
	b=F2IwBgm4vR3/UzBm6Vt4j6Rvdm5RtbARCptTMqRUjWXnlxvHloOUy/OZ5KsOvZ0guJ
	NS45MNJlASkbBeikblH/24fS/IuQVlkYFA4qUSqIjK/SHNou5f8R4tklXImqyGhVcEUO
	Kwj24+Ulu3zJPMIGgHOvEWpFbekQynHrij7ig7WUEFqfnDg4AdlS6b8Vns//mHvU89zT
	u5zbGlBxgsgKfwCpapKKqxRCZUPXqqAfI1LUTe5Dz2k9hclyaNM7GgWD81ZnxRynWSDG
	XBu8+QuifXrUyFrKB1IhheXVePr4g2fX+ImaTW4aGm+yBveJQxNJXJMwQFlQPIw7D2Wq
	QMlw==
X-Gm-Message-State: APjAAAXrMDQc9mpZWWNMe6vr5y9k0WexPlxdY9CX45RaTczQaGN0IU1w
	gknIFYqQUe2iJO8UWZRNRrwYtQ==
X-Google-Smtp-Source: APXvYqw+MzUsHOMRUqj2MyQSQs1lA7IxhmiMtkSD91VKJkahUOvo/AhAAuXgodOG+LUp7nTi+Ru9HA==
X-Received: by 2002:a63:d34b:: with SMTP id u11mr7061204pgi.385.1556218637335; 
	Thu, 25 Apr 2019 11:57:17 -0700 (PDT)
Received: from localhost ([134.134.139.92]) by smtp.gmail.com with ESMTPSA id
	y20sm32537117pfe.188.2019.04.25.11.57.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 25 Apr 2019 11:57:16 -0700 (PDT)
Date: Thu, 25 Apr 2019 11:57:16 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Apr 2019 11:56:10 PDT (-0700)
In-Reply-To: <CANnJOVHbCGcgnHT3qVbHGFh_Ba0=FqABSoM2SG9ddf-fawwaYg@mail.gmail.com>
CC: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
	sagark@eecs.berkeley.edu,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: fintelia@gmail.com
Message-ID: <mhng-5ee2a059-0cd2-4dc6-8952-2560c4f76161@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [PATCH] target/riscv: Remove unused include of
 riscv_htif.h for virt board
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
X-List-Received-Date: Thu, 25 Apr 2019 19:01:34 -0000

On Wed, 10 Apr 2019 09:29:11 PDT (-0700), fintelia@gmail.com wrote:
> Unless I'm missing something, the virt board doesn't support HTIF and
> should not be including this header.
>
> Jonathan
>
> Signed-off-by: Jonathan Behrens <fintelia@gmail.com>
> ---
>  hw/riscv/virt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index fc4c6b306e..3526463034 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -29,7 +29,6 @@
>  #include "hw/sysbus.h"
>  #include "hw/char/serial.h"
>  #include "target/riscv/cpu.h"
> -#include "hw/riscv/riscv_htif.h"
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/sifive_plic.h"
>  #include "hw/riscv/sifive_clint.h"

Thanks!

