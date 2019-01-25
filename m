Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gnAcd-0004Se-Ok
	for mharc-qemu-riscv@gnu.org; Fri, 25 Jan 2019 18:10:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gnAcb-0004QF-5C
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 18:10:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gnAZe-0005Ri-N5
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 18:07:47 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38457)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gnAZe-0005R1-H2
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 18:07:46 -0500
Received: by mail-wm1-f67.google.com with SMTP id m22so8161779wml.3
	for <qemu-riscv@nongnu.org>; Fri, 25 Jan 2019 15:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8QkYvGAdChVivReQFU9jV7x+qWdUItFGNtUJ7SehJpI=;
	b=a17a4Q4IOOsEc0VMLIBLe3BdwT3l3t7LnKoHpM36XyqXW/fz5kba8y0q6kddX0tmwJ
	H3RBHc0XChbWa4VPWjW1e6C3O9XXHKv5Zugy0+oK5S2wud7fdH7vPd/nHGg3xorUOZJS
	xWP95wOtVjrnRuLBVO+zO/ulCFRbM//+yBb77MQAi5Esi48QZ3fdQb4dwwwvJVU9Mdn7
	N+0EMhpv8NTMbRToXUdprmj4P8BRZ+E55ha5fSQq6fLllmxFV1M7SUy/PkvNnITBFSsw
	d+wY+KjZH4oeWE3X1i7WGg/sfEHFXpGOyUAZo5FgrHT/G/7E21Z2HGvrUH745VgVY7jF
	nhAA==
X-Gm-Message-State: AJcUukdc4MeI6bWb+zFuLNuVg6daGdXLzE9rhTVHceK3pNefnbBKRFNB
	b9eqM/5R7TJeiIkklXTtSarQ1A==
X-Google-Smtp-Source: ALg8bN4J+wj5Q4hcxSfVXOAFVvHLX5oWNhEqBI0gTQaTOLnuY6/OdZxfy3gzl3AYVFlYxrJ0MbsgGg==
X-Received: by 2002:a1c:2787:: with SMTP id n129mr8721945wmn.128.1548457665326;
	Fri, 25 Jan 2019 15:07:45 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	x3sm103709237wrd.19.2019.01.25.15.07.44
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 15:07:44 -0800 (PST)
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <20190125222113.31183-1-palmer@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ea2971d8-37e2-9d7b-8a9d-cc52aafa8467@redhat.com>
Date: Sat, 26 Jan 2019 00:07:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190125222113.31183-1-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] MAINTAINERS: Remove Michael
 Clark as a RISC-V Maintainer
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
X-List-Received-Date: Fri, 25 Jan 2019 23:10:49 -0000

On 1/25/19 11:21 PM, Palmer Dabbelt wrote:
> Michael is no longer employed by SiFive and does not want to continue
> maintianing the RISC-V port.

"maintaining"

> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index af339b86db76..47cb3c14298e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -259,7 +259,6 @@ F: include/hw/ppc/
>  F: disas/ppc.c
>  
>  RISC-V
> -M: Michael Clark <mjc@sifive.com>
>  M: Palmer Dabbelt <palmer@sifive.com>
>  M: Alistair Francis <Alistair.Francis@wdc.com>
>  M: Sagar Karandikar <sagark@eecs.berkeley.edu>
> 

