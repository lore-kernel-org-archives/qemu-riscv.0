Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hJgrb-0000zz-Eh
	for mharc-qemu-riscv@gnu.org; Thu, 25 Apr 2019 12:04:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hJgrT-0000uM-L1
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:04:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hJgrO-0002KO-Mi
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:04:35 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38598)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hJgrK-0002AF-No
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:04:26 -0400
Received: by mail-pl1-x642.google.com with SMTP id f36so20710plb.5
	for <qemu-riscv@nongnu.org>; Thu, 25 Apr 2019 09:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=hbMQ4FSCnBHERd/qG1GdGJuyGJ/ZShaDwSzsRdmQTiQ=;
	b=CqA8UpBbjWnuH44g2YHPzKYVPgrybZaxWUPxtOCpmO69nL45pUUfIw2TwC/+9PDCAx
	DPT1G7uRjCME2FIp5070wwh5PXLa/e62zvvGH9aqrR6EMap+VLZdtb2EkpdDiGBrHYci
	mvMvUqLscelog88jCxBsZnxVc7fZLohymn+rYVKINX+cgiBeuCPIJrIlnsFVORZPIXiG
	lDyiOetPvO4zGLwVhxCC7C8fKn9PvwiMq0/3aIUrrcZPsX0S3Io9yWEw+nxbcUgd1jLR
	BdzlAiwN8UoWd5364ySkth7Ga+UfKHGyR9I5Ely0OTSb/W7ETTgMdhzXDmHpKilOPLVe
	tllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=hbMQ4FSCnBHERd/qG1GdGJuyGJ/ZShaDwSzsRdmQTiQ=;
	b=Ba/8kAzBZzANL1Wr84BdhticHjVMaxTWa/rWrVuix/zudPM027BrQvR9bvhrNJ79Dz
	YC1oaeX/nfshVeGkayZoHDMhSYFDxnEuMJwU9Hd68wIgbHwr8prKeAZdwZL7/BY/sWwn
	XIPYI9w0iopUl8oeTWZk++h1EWeMUpeZNuqLhKv0gJEvjqsD80KUnYPY3TZG737Dfhro
	wOqWB0NW3bg+Wx6/6L0cUvGoClQYynC4ukql1C5OkN9+DIWT+oMMrwbQ8hWuIasNsux3
	Sk2Kb7wiqbXJITzGS6mJHysVQXogEriQRe6eT81IA0o5sfv1uo5s66GZUUBRop+8gK/b
	dr/w==
X-Gm-Message-State: APjAAAWCkZtRN+Q9YzMr9/Zr2DItIQuQsFjZDBSNnWr4L5bnEDojGPyU
	2+SVExHW1UUcvIqRW2MPUs8Ofw==
X-Google-Smtp-Source: APXvYqyW/myEZ/iKAutmmOeKPlPAkiRbLSlIJjwPjbG+ZMwKurqL3URMtgR12nSe535njgFx1qUf1Q==
X-Received: by 2002:a17:902:bd4b:: with SMTP id
	b11mr39673495plx.68.1556208265104; 
	Thu, 25 Apr 2019 09:04:25 -0700 (PDT)
Received: from localhost ([134.134.139.92]) by smtp.gmail.com with ESMTPSA id
	a10sm29566912pfc.21.2019.04.25.09.04.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 25 Apr 2019 09:04:24 -0700 (PDT)
Date: Thu, 25 Apr 2019 09:04:24 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Apr 2019 08:51:08 PDT (-0700)
In-Reply-To: <20190401031155.21293-9-richard.henderson@linaro.org>
CC: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-a0bb1fb9-5aa1-4354-8935-43c8b85dec5b@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-riscv] [PATCH for-4.1 8/8] target/riscv: Remove spaces
 from register names
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
X-List-Received-Date: Thu, 25 Apr 2019 16:04:40 -0000

On Sun, 31 Mar 2019 20:11:55 PDT (-0700), richard.henderson@linaro.org wrote:
> These extra spaces make the "-d op" dump look weird.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/cpu.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d61bce6d55..624528efb5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -29,17 +29,17 @@
>  static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>
>  const char * const riscv_int_regnames[] = {
> -  "zero", "ra  ", "sp  ", "gp  ", "tp  ", "t0  ", "t1  ", "t2  ",
> -  "s0  ", "s1  ", "a0  ", "a1  ", "a2  ", "a3  ", "a4  ", "a5  ",
> -  "a6  ", "a7  ", "s2  ", "s3  ", "s4  ", "s5  ", "s6  ", "s7  ",
> -  "s8  ", "s9  ", "s10 ", "s11 ", "t3  ", "t4  ", "t5  ", "t6  "
> +  "zero", "ra", "sp",  "gp",  "tp", "t0", "t1", "t2",
> +  "s0",   "s1", "a0",  "a1",  "a2", "a3", "a4", "a5",
> +  "a6",   "a7", "s2",  "s3",  "s4", "s5", "s6", "s7",
> +  "s8",   "s9", "s10", "s11", "t3", "t4", "t5", "t6"
>  };
>
>  const char * const riscv_fpr_regnames[] = {
> -  "ft0 ", "ft1 ", "ft2 ", "ft3 ", "ft4 ", "ft5 ", "ft6 ",  "ft7 ",
> -  "fs0 ", "fs1 ", "fa0 ", "fa1 ", "fa2 ", "fa3 ", "fa4 ",  "fa5 ",
> -  "fa6 ", "fa7 ", "fs2 ", "fs3 ", "fs4 ", "fs5 ", "fs6 ",  "fs7 ",
> -  "fs8 ", "fs9 ", "fs10", "fs11", "ft8 ", "ft9 ", "ft10",  "ft11"
> +  "ft0", "ft1", "ft2",  "ft3",  "ft4", "ft5", "ft6",  "ft7",
> +  "fs0", "fs1", "fa0",  "fa1",  "fa2", "fa3", "fa4",  "fa5",
> +  "fa6", "fa7", "fs2",  "fs3",  "fs4", "fs5", "fs6",  "fs7",
> +  "fs8", "fs9", "fs10", "fs11", "ft8", "ft9", "ft10", "ft11"
>  };
>
>  const char * const riscv_excp_names[] = {

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

