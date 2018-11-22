Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPcs0-0000pK-FB
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 19:29:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPcrx-0000nQ-J3
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 19:29:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPcrt-0000ho-C9
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 19:29:21 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52900)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gPcrt-0000be-1G
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 19:29:17 -0500
Received: by mail-wm1-f67.google.com with SMTP id r11-v6so7203866wmb.2
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 16:29:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ubGTX4U4MqvgV5wqxy2zDr4PRJASo2LJLWJ8B4MMmGo=;
	b=UQyW6or2ggEf0izO8Igu2pxbRyuXzgbbv7cKMwnVS7Fm0LTcOd1GmMOJbC9zWpqkCn
	5oSdrP3ggI63HsOyJsxL/MD8VVtLXGZqjlcEc8798CsUYlRNKVrvOmJG1b4zQEkZGWga
	CSU32c+bjlJ2f27/TfDLzsZClpuGlzqUbXUozxa0sjkNkw2i55vxWiOeGXxXFy0BVtZA
	OE66J6e9MdKvMmqRPCbNDIyJfqzwSwLz+3FTVcaeRUsPhVo3E9S8g+6QY13ih5YIwy5v
	G/ZusdvVJ+BITElPcqvHz4qHP+vUnyX1AQL0I2MEr/rf51bEKYl5sJRRwumyo2g5ZPFh
	ypSg==
X-Gm-Message-State: AGRZ1gKfEUI9FtecP7d5zAuLNTXxJGyucTghwQzz4/+hWSiRcp7n+iHI
	FQ1/6Q2JSR+W6LHliYwFzsKSrP4a7yA=
X-Google-Smtp-Source: AJdET5f0ChMAgukh2RV7r52Y2QFPynJQOOuC9Y51wK+f5+/wmN63NrCa04OGgPprL27NOKgcwLXnBg==
X-Received: by 2002:a1c:a754:: with SMTP id q81mr7180942wme.132.1542846550425; 
	Wed, 21 Nov 2018 16:29:10 -0800 (PST)
Received: from [192.168.1.33] (75.red-83-57-172.dynamicip.rima-tde.net.
	[83.57.172.75]) by smtp.gmail.com with ESMTPSA id
	x79sm5178991wmd.42.2018.11.21.16.29.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 16:29:09 -0800 (PST)
To: Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181121234651.24596-1-palmer@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <201f1cf4-30af-03c5-393b-0eab6ac7eb87@redhat.com>
Date: Thu, 22 Nov 2018 01:29:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181121234651.24596-1-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-3.1 1/2] MAINTAINERS: Any
 file with "riscv" in the name is a RISC-V file
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
X-List-Received-Date: Thu, 22 Nov 2018 00:29:22 -0000

On 22/11/18 0:46, Palmer Dabbelt wrote:
> There was a recent thread about unmaintained files in QEMU where it was
> noted that a few RISC-V related files had slipped through the patterns
> in our MAINTAINERS file entry.  This patch adds some more aggressive
> pattern matching in an attempt to rectify this situation.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1032406c5607..e89adc81d5d5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -255,6 +255,8 @@ F: target/riscv/
>   F: hw/riscv/
>   F: include/hw/riscv/
>   F: disas/riscv.c
> +K: riscv
> +N: riscv

QEMU doesn't support the 'N' tag.
I see from the Linux kernel:

   N: Files and directories with regex patterns.
      N:   [^a-z]tegra     all files whose path contains the word tegra
      One pattern per line.  Multiple N: lines acceptable.
      scripts/get_maintainer.pl has different behavior for files that
      match F: pattern and matches of N: patterns.  By default,
      get_maintainer will not look at git log history when an F: pattern
      match occurs.  When an N: match occurs, git log history is used
      to also notify the people that have git commit signatures.

Should we add this feature to checkscript?

>   
>   S390
>   M: Richard Henderson <rth@twiddle.net>
> 

