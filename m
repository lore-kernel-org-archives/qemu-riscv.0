Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hxJQE-0003oX-58
	for mharc-qemu-riscv@gnu.org; Mon, 12 Aug 2019 19:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57720)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hxJQC-0003mT-08
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 19:08:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hxJQB-0006n4-2T
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 19:08:11 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42964)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hxJQA-0006md-TG
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 19:08:11 -0400
Received: by mail-pg1-f195.google.com with SMTP id t132so50224268pgb.9
 for <qemu-riscv@nongnu.org>; Mon, 12 Aug 2019 16:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CEVg8P/y/l75HYO+60lvfORIzDf3u4MzaH+NYW8MspE=;
 b=YhbBOYX48VhljGbkhkWnrn/S3QHlS07odSJPdWxJDc0GDJ5A1ZoBpzTNnUvYB6ANcM
 eta/g/JYVKM8kwErmGWwaHiKyy7xxDeyIsh302lLIG1VKjkevMHfKnx/d1plwzSbD9S/
 d5nAIYO6gtx3ZngqPoCXMbGqDbM1qoeEwCAyblJ76dIkgWKQkhVvOA0I1DtiuVqnCOX9
 MHSyy0XWTgjFSe2Hwwc9FqTSpw1RoKaS3IIxgGKxLmfoArAykaaiDj2X/kHv0XA/DkZJ
 CzmAdv/o56k59Py7+5ox5beIZCCvCqNc2swVx0/2cWl+NHu0ZFnnRfMbNBJVlrUS5S2w
 aWig==
X-Gm-Message-State: APjAAAUv4qJxLH0mQIAq7uWRPCN5idAtQ2Ml3uCEwFvuBZfNQWKLP9gR
 YifqNgv941NgJ1iCYXTLyOor7Q==
X-Google-Smtp-Source: APXvYqxz2C4HuF7ebCtXTTfXmwP3ut48yCC011DyS/9wDVjSdRpL6zbi27G4aENOHUZnaM7KRwcEiA==
X-Received: by 2002:a63:66c5:: with SMTP id
 a188mr31986453pgc.127.1565651289390; 
 Mon, 12 Aug 2019 16:08:09 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q126sm68632894pfb.56.2019.08.12.16.08.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 16:08:08 -0700 (PDT)
Date: Mon, 12 Aug 2019 16:08:08 -0700 (PDT)
X-Google-Original-Date: Mon, 12 Aug 2019 16:07:47 PDT (-0700)
In-Reply-To: <4dad98dcc3b6a3f3a5097922494b0521c60570c7.1564529681.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-41c1b372-8997-4180-b5d1-61625070690b@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.195
Subject: Re: [Qemu-riscv] [PATCH-4.2 v2 5/5] target/riscv: Fix Floating
 Point register names
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
X-List-Received-Date: Mon, 12 Aug 2019 23:08:13 -0000

On Tue, 30 Jul 2019 16:35:34 PDT (-0700), Alistair Francis wrote:
> From: Atish Patra <atish.patra@wdc.com>
>
> As per the RISC-V spec, Floating Point registers are named as f0..f31
> so lets fix the register names accordingly.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f8d07bd20a..af1e9b7690 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -40,10 +40,10 @@ const char * const riscv_int_regnames[] = {
>  };
>
>  const char * const riscv_fpr_regnames[] = {
> -  "ft0", "ft1", "ft2",  "ft3",  "ft4", "ft5", "ft6",  "ft7",
> -  "fs0", "fs1", "fa0",  "fa1",  "fa2", "fa3", "fa4",  "fa5",
> -  "fa6", "fa7", "fs2",  "fs3",  "fs4", "fs5", "fs6",  "fs7",
> -  "fs8", "fs9", "fs10", "fs11", "ft8", "ft9", "ft10", "ft11"
> +  "f0", "f1", "f2",  "f3",  "f4", "f5", "f6", "f7",
> +  "f8", "f9", "f10",  "f11",  "f12", "f13", "f14", "f15",
> +  "f16", "f17", "f18",  "f19",  "f20", "f21", "f22", "f23",
> +  "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31"
>  };
>
>  const char * const riscv_excp_names[] = {

I actually don't think this one is right: riscv_int_regnames uses the ABI 
names, so this should match.  I'd be OK switching both of them, but not just 
one.

I've queued the other four patches.

